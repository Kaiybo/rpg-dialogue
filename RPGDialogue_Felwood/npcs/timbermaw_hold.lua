-- Timbermaw Hold, inside the tunnels: Gorn One Eye, who speaks for the hold, and Meilosh, its trader. Voice: bibles/timbermaw_hold.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gorn_one_eye", id = TODO_NPC("Gorn One Eye"), name = "Gorn One Eye",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "wary", "gruff" }, values = { "loyal", "wise" },
  notices = { "trophy", "race", "class" },

  impression = {
    first = "Gorn One Eye is an old Timbermaw furbolg who watches the hold's tunnels with his one good eye and weighs every outsider slowly. He speaks of the corrupted tribes as lost family, not as beasts.",
    third = "{name} met Gorn One Eye, an elder of the Timbermaw who keeps watch inside Timbermaw Hold.",
  },

  greetings = {
    { id = "g_default", text = "You stand in the halls of the Timbermaw, outsider. Gorn sees you with one eye, and that is enough to see whether you mean us harm." },
    { id = "g_hated", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "You smell of Timbermaw blood, outsider. Gorn will speak, because the elders say even an enemy may be heard, but Gorn will not turn his back." },
    { id = "g_friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } }, text = "The hold knows your name now, friend. Sit by Gorn's fire, if you have time for an old furbolg." },
    { id = "g_exalted", when = { reputation = { faction = "Timbermaw Hold", min = "exalted" } }, text = "Our shamans speak your name to the spirits, friend. Gorn did not think he would live to hear an outsider named that way." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back through the tunnels. Gorn is glad, because many who leave this hold do not come back at all." },
  },

  notice = {
    { id = "n_deadwood", cat = "trophy", when = { killed = { name = "Deadwood", min = 30 } },
      text = "Much Deadwood blood is on you. Gorn thanks you for it, and Gorn grieves for it, and both are true at once." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, with the smell of the plains still in your fur. Your people and ours both remember when the forest was whole." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You walk with the spirits of the wild, druid. Gorn can see it, even with one eye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gorn One Eye has watched these tunnels for more winters than he can count, and he has seen what came up out of Felwood's poison. The Timbermaw are the last of the furbolg tribes who still know their own names, and we mean to stay that way." },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "The elves come to us more often than they once did, and the dwarves and the humans with them. Gorn does not mind, so long as they remember the tunnels are ours." },
        { id = "h_horde", when = { faction = "Horde" }, text = "The orcs and the tauren come to us more often than they once did, and the dead walk with them now, which Gorn does not like. Still, the Timbermaw judge deeds and not banners." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "A Kaldorei. Our people were friends once, long ago, before the fire came to Hyjal and the forest went bad. Gorn would like to be friends again, if your people are willing." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of Gorn?" },
        { id = "h_again2", text = "Gorn is listening. Speak." },
      },
      choices = {
        { text = "How did you lose your eye?", next = "eye" },
        { text = "Tell me about Timbermaw Hold.", next = "hold" },
        { text = "What happened to the Deadwood?", next = "deadwood" },
        { text = "Who is allowed through your tunnels?", next = "tunnels" },
        { text = "How does an outsider earn the Timbermaw's trust?", next = "trust" },
        { text = "What about the Winterfall, on the other side?", next = "winterfall" },
        { text = "My people still remember the furbolgs as friends.", next = "xnelf", when = { race = "NightElf" } },
        { text = "The Earth Mother weeps for your cousins, Gorn.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Can a druid heal the Deadwood?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What do the spirits of the hold tell your shamans?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Farewell, Gorn.", next = "END" },
      },
    },
    eye = {
      lines = {
        { id = "e_default", text = "Gorn lost it to a Deadwood claw, many winters ago, in the first year the sickness came up from the south. The claw belonged to a furbolg Gorn had taught to fish when he was small." },
      },
      choices = {
        { text = "You knew him?", next = "eye_story" },
        { text = "I'm sorry. Something else.", next = "BACK" },
      },
    },
    eye_story = {
      lines = {
        { id = "es_default", text = "He was a cousin, and a good one, quick with a spear and slow to anger. When he came at Gorn there was nothing in his eyes that knew Gorn at all, and that hurt worse than the claw did." },
      },
      choices = {
        { text = "What became of him?", next = "eye_end" },
        { text = "Something else, Gorn.", next = "BACK" },
      },
    },
    eye_end = {
      big = true,
      lines = {
        { id = "ee_default", text = "Gorn let him go. He ran back to the Deadwood camps, and Gorn has not seen him since, and some nights Gorn wonders whether that was mercy or foolishness." },
      },
      choices = {
        { text = "It was mercy. You spared the cousin you once knew.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It was foolish. He's surely killed others since.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = {
        { id = "ho_default", text = "The hold is our home and our wall, cut deep into the mountain between Felwood and Winterspring, with a road down to Moonglade besides. Whoever holds these tunnels decides who walks between the three, and the Timbermaw have held them since before the elves had a queen." },
      },
      choices = {
        { text = "Who leads the hold?", next = "hold_elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold_elders = {
      lines = {
        { id = "he_default", text = "The elders and the shamans speak together, and the rest of us listen. Gorn is not the wisest of them, only the one with the patience to sit by the tunnels and talk to strangers, which the others are glad to give him." },
      },
      choices = {
        { text = "So you're the hold's door-warden.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deadwood = {
      lines = {
        { id = "d_default", text = "The Deadwood were our cousins, as the Winterfall were, and the tribes of Ashenvale. When the demons poisoned the forest, the poison went into the water and the roots and then into them, and now they kill anything that walks near their camps, Timbermaw most of all." },
      },
      choices = {
        { text = "Why the Timbermaw most of all?", next = "deadwood_hate" },
        { text = "Can they be saved?", next = "deadwood_save" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deadwood_hate = {
      lines = {
        { id = "dh_default", text = "Because we remind them of what they were, Gorn thinks, and some small part of them still knows it. A mad furbolg hates a sane one the way a sick wolf hates the healthy pack." },
      },
      choices = {
        { text = "Then they still remember something.", next = "deadwood_save" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deadwood_save = {
      big = true,
      lines = {
        { id = "ds_default", text = "The shamans say no, not the ones who have gone deep, and Gorn has stopped arguing with the shamans. So the Timbermaw ask outsiders to thin the Deadwood camps, and Gorn asks them to do it quickly, and not to enjoy it." },
      },
      choices = {
        { text = "I'll do it quickly and without cruelty. They deserve that much.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're killers now. How they die doesn't matter.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tunnels = {
      lines = {
        { id = "t_default", text = "Anyone the Timbermaw do not hate may walk through, and our guards will leave them be. Those who have spilled Timbermaw blood will find the tunnels full of spears, and there is no other road north that a sane traveller would take." },
      },
      choices = {
        { text = "That's a lot of power over the road.", next = "tunnels_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tunnels_power = {
      big = true,
      lines = {
        { id = "tp_default", text = "It is the only power we have, outsider, and it is why we are still alive. The goblins at Everlook pay us no toll, and the Cenarion druids pass freely, because the Timbermaw choose friends over coin." },
        { id = "tp_hated", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "You know that power well, Gorn thinks, since our guards would sooner gut you than let you pass. Change that, and the road opens again." },
      },
      choices = {
        { text = "Guarding the road is your right. It's your home.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Roads should be open to everyone, furbolg or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "With deeds, done over and over until the hold stops counting them. Grazle and Nafien at the southern door will tell you what the Deadwood carry, and the feathers and beads you bring back are how we remember who helped us." },
        { id = "tr_friend", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } }, text = "You have already begun, and the hold has noticed. Keep on, and in time the shamans will know your name without asking Gorn." },
      },
      choices = {
        { text = "Why do you need outsiders at all?", next = "trust_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_ask = {
      lines = {
        { id = "ta_default", text = "Because there are fewer Timbermaw every winter, and more Deadwood. Now Gorn will ask you something, outsider: why do you help furbolgs at all, when your own people have wars enough?" },
      },
      choices = {
        { text = "Because it's right. Nobody else is helping you.", next = "trust_answer", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The road north matters to me. That's honest enough.", next = "trust_answer", fx = { trait = { honest = 1 } } },
        { text = "Coin and the occasional recipe, mostly.", next = "trust_answer", fx = { affinity = -1, trait = { greedy = 1 } } },
      },
    },
    trust_answer = {
      lines = {
        { id = "tan_default", text = "Gorn has heard every one of those answers from outsiders before, and some of the best friends of the hold gave the worst ones. It is the coming back that counts, not the reason." },
      },
      choices = {
        { text = "Then I'll keep coming back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winterfall = {
      lines = {
        { id = "w_default", text = "The Winterfall live in the snow beyond our northern door, and they are going the same way as the Deadwood, only slower. They drink something in their camps that was never brewed by any furbolg, and every season they are angrier." },
      },
      choices = {
        { text = "Who's giving them the drink?", next = "winterfall_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winterfall_who = {
      lines = {
        { id = "ww_default", text = "Gorn does not know, and that frightens Gorn more than the Deadwood do. Salfa watches our northern door and hears more of the Winterfall than Gorn does, so ask him when you pass through to the snow." },
      },
      choices = {
        { text = "I'll ask Salfa.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      big = true,
      lines = {
        { id = "xn_default", text = "Gorn is glad to hear it, Kaldorei. The old stories say the furbolgs and the elves shared the forest without fences, and then the elves went to their trees and their wars and forgot us, and the corruption found us alone." },
      },
      choices = {
        { text = "Then my people owe you. I'll help repay it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "My people had their own war to survive, Gorn.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "Gorn thanks you, tauren, and Gorn thinks she does. Your people speak to the land the way ours did before the poison, so you understand that we are not killing monsters out there, only family who no longer know us." },
      },
      choices = {
        { text = "Then we mourn them and still do what must be done.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Family or not, the land comes first. They must go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "xd_default", text = "The druids at the Emerald Sanctuary have tried, and the young Timbermaw shamans have tried with them. Water from a clean place helps the forest a little, but no one has yet found what would reach inside a furbolg and wash him clean, and Gorn is not sure there is such a thing." },
      },
      choices = {
        { text = "If there is, I'll look for it.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xs_default", text = "That the mountain is still clean under our feet, shaman, and that the rot stops at our door. The spirits of the hold are old and stubborn, like Gorn, and they do not like strangers either, so be polite to them." },
      },
      choices = {
        { text = "I'll greet them with respect.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furb", text = "Gorn is a furbolg, and the Deadwood and the Winterfall are furbolgs too, which is the whole sorrow of it. Ask Gorn something easier." } },
    satyrs = { { id = "tp_sat", text = "The goat-elves dance in the south of Felwood among their burning trees. The Timbermaw do not go there, and Gorn advises you not to go there either." } },
    background = { { id = "tp_bg", text = "Gorn was a fisher once, and then a fighter, and now he is an old furbolg who sits by the tunnels. It is a better end than most furbolgs get." } },
    advice = { { id = "tp_ad", text = "Never drink from a Felwood stream, however thirsty you are. Gorn has seen what it does, and it does not stop at the belly." } },
    _none = { { id = "tp_none", text = "Gorn has never heard of it, and Gorn has heard of most things that come through these tunnels." } },
  },
}

P:NPC {
  key = "meilosh", id = TODO_NPC("Meilosh"), name = "Meilosh", title = "",
  bible = "bibles/timbermaw_hold.md", role = "vendor", tier = "service",
  communities = { "timbermaw_felwood" }, temper = { "warm" }, values = { "fair", "loyal" },

  impression = {
    first = "Meilosh trades in Timbermaw Hold, and keeps the hold's best patterns and plans for those the furbolgs call friend. Friendly enough, but the furbolg counts trust more carefully than coin.",
    third = "{name} met Meilosh, the Timbermaw trader inside Timbermaw Hold.",
  },

  greetings = {
    { id = "g_default", text = "Meilosh trades with friends of the Timbermaw. Are you a friend, outsider, or only passing through?" },
    { id = "g_low", when = { reputation = { faction = "Timbermaw Hold", max = "neutral" } }, text = "Meilosh has nothing to sell you yet, outsider. The hold must know you first, and it does not know you." },
    { id = "g_friend", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } }, text = "Friend of the Timbermaw, welcome! Come and see what Meilosh has set aside." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Meilosh keeps the patterns and plans the hold's crafters have made over many winters, the ones that turn good hide and iron into something worthy of the Timbermaw. They are not for everyone, only for those who have stood with us." },
        { id = "h_honored", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } }, text = "The elders have spoken your name kindly, so Meilosh will open the deeper chest for you. Not all of it, not yet, but more than most outsiders ever see." },
      },
      again = {
        { id = "h_again", text = "Something else Meilosh can show you?" },
        { id = "h_again2", text = "Ask, friend. Meilosh is in no hurry." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "Why won't you sell to just anyone?", next = "why" },
        { text = "What do you take in trade?", next = "trade" },
        { text = "Who made these patterns?", next = "crafters" },
        { text = "I work leather myself. What do your patterns use?", next = "xleather", when = { profession = "Leatherworking" } },
        { text = "Farewell, Meilosh.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because a Timbermaw pattern in the wrong hands would be worn by someone who kills Timbermaw. Meilosh has seen a Deadwood wearing a cloak our weavers made, taken from a dead trader, and that was enough." },
      },
      choices = {
        { text = "How do I become a friend, then?", next = "why_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_friend = {
      big = true,
      lines = {
        { id = "wf_default", text = "Help Grazle and Nafien with the Deadwood, and bring back what the Deadwood carry, and keep your blade away from our people. The hold remembers everything, good and bad, so it is a slow trade, but an honest one." },
      },
      choices = {
        { text = "Slow and honest suits me. I'll earn it properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Trust ought to be sold like anything else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = {
        { id = "tr_default", text = "Your coin, mostly, because coin buys salt and iron from the goblins at Everlook. The hold has little use for gold, but it has much use for salt in winter." },
      },
      choices = {
        { text = "The Everlook goblins trade with you?", next = "trade_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_goblins = {
      lines = {
        { id = "tg_default", text = "They trade with anyone, and they talk the whole time they are doing it. Meilosh does not understand half of what they say, but the salt is good and they never try to cross our tunnels without asking." },
      },
      choices = {
        { text = "Goblins asking permission. That's a first.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crafters = {
      lines = {
        { id = "c_default", text = "Many paws, over many winters, and most of those paws are gone now. Meilosh only keeps the patterns safe and hands them on, because a pattern that sits in a chest forever helps nobody." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xleather = {
      lines = {
        { id = "xl_default", text = "Good thick hide, and patience with the needle, and a little of the hold's knowledge besides. Our patterns were made for hunters who live in the snow and the poison both, so they ask more of you than a city pattern does." },
      },
      choices = {
        { text = "I'll gather the hides, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furb", text = "The Timbermaw are furbolgs who still remember, and the Deadwood are furbolgs who forgot. Meilosh prays to the spirits never to forget." } },
    _none = { { id = "tp_none", text = "Meilosh trades, outsider, and does not know much else. Ask Gorn, who knows everything and says so." } },
  },
}
-- Inside Timbermaw Hold: Gorn One Eye, Kernda and Meilosh, the furbolgs who decide which outsiders
-- get past the tunnels. Voice: bibles/timbermaw_hold.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Gorn One Eye: goods of the hold, The Root of All Evil, The Brokering of Peace
---------------------------------------------------------------------------
P:NPC {
  key = "gorn_one_eye", id = TODO_NPC("Gorn One Eye"), name = "Gorn One Eye",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "gruff", "steady" }, values = { "loyal", "protective" },
  notices = { "race", "class" },

  impression = {
    first = "Gorn One Eye sells arrows and flint inside Timbermaw Hold and weighs every outsider with his one good eye. He talks about the Winterfall the way you'd talk about a sick brother.",
    third = "{name} met Gorn One Eye, the Timbermaw furbolg who keeps the hold's goods and hates the demon that poisoned the Winterfall.",
  },

  greetings = {
    { id = "g_default", text = "You stand inside Timbermaw Hold, outsider, which is further than most of your kind ever get. Speak plainly and I'll listen." },
    { id = "g_cold", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "You smell of furbolg blood, and not Deadwood blood either. Say what you came to say and then go back through the tunnel." },
    { id = "g_friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } }, text = "Friend of the Timbermaw, come in out of the tunnel. There's shot on the shelf and a fire to warm your hands." },
    { id = "g_exalted", when = { reputation = { faction = "Timbermaw Hold", min = "exalted" } }, text = "I trust very few outsiders, and you are one of them now. I don't say that lightly, and I won't say it twice." },
    { id = "g_root", when = { questActive = TODO_QUEST("The Root of All Evil") }, text = "Has the torch burned at Winterfall Village yet? The demon won't show itself until it does." },
    { id = "g_root_done", when = { questDone = TODO_QUEST("The Root of All Evil") }, text = "Xandivious is dead, and the Winterfall elders are sleeping again for the first time in years. That is your work, and the hold knows it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the tunnels didn't miss you, but I did, a little." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown harder since you last walked in here. Good; the north needs hard people." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. The oldest of our stories say your people and mine shared these woods once, before the demons came. You'll forgive me if I wait to see whether you remember it too." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, and you walk softly for something so big. The druids of your people have always been welcome at our fires, if they come in peace." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The Timbermaw remember when druids came to us as friends, before the corruption made strangers of everybody." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gorn, and they call me One Eye, for reasons you can see. I keep the hold's goods, arrows and shot and flint and blades for throwing, and I keep watch on everyone who walks between Felwood and Winterspring through our tunnels." },
        { id = "h_root", when = { questActive = TODO_QUEST("The Root of All Evil") },
          text = "The Winterfall aren't wicked, outsider, they're poisoned, and the poison has a name: Xandivious. Plant the torch at the mouth of the high chief's cave in Winterfall Village, and when the demon answers it, kill it and bring me its essence." },
        { id = "h_root_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Root of All Evil"), days = 3 } },
          text = "The essence of the demon, in my own hands. Our shamans can begin drawing the sickness out of the Winterfall now, slowly, the way you'd draw a thorn that's been in a long time." },
        { id = "h_peace_a", when = { questActive = TODO_QUEST("The Brokering of Peace"), faction = "Alliance" },
          text = "Carry the offering to the dwarf king in Ironforge and put it in his hands yourself. He reached out to us once, and the Timbermaw are slow to answer, but we do answer." },
        { id = "h_peace_h", when = { questActive = TODO_QUEST("The Brokering of Peace"), faction = "Horde" },
          text = "Carry the offering to your warchief in Orgrimmar and put it in his hands yourself. He sent word to us once, and the Timbermaw are slow to answer, but we do answer." },
      },
      again = {
        { id = "h_again", text = "What else? The fire's warm and I'm in no hurry." },
        { id = "h_again2", text = "Ask, then. I'll tell you what a furbolg can tell an outsider." },
      },
      choices = {
        { text = "Who are the Timbermaw?", next = "timbermaw" },
        { text = "What happened to the Winterfall?", next = "winterfall" },
        { text = "Why do you watch outsiders so closely?", next = "outsiders" },
        { text = "How did you lose the eye?", next = "eye" },
        { text = "Show me your goods, Gorn.", next = "BUSINESS" },
        { text = "The Timbermaw call me friend now.", next = "friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } } },
        { text = "Tell me about this peace offering.", next = "peace", when = { questActive = TODO_QUEST("The Brokering of Peace") } },
        { text = "I hear the spirits weeping under these hills.", next = "xsham", when = { class = "SHAMAN" } },
        { text = "I command demons. You needn't fear me for it.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll go, Gorn.", next = "END" },
      },
    },
    timbermaw = {
      lines = {
        { id = "t_default", text = "We are the furbolgs who stayed ourselves. When the demons poisoned the forests, nearly every tribe drank the sickness and went mad, and the Timbermaw went down into the hills and held on to our minds with both hands." },
      },
      choices = {
        { text = "Which tribes were lost?", next = "tribes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribes = {
      lines = {
        { id = "tr_default", text = "The Deadwood, south of here, and the Winterfall in the snow beyond the tunnels, and others further off whose names you'd not know. They were our cousins, outsider, and we traded with them and married into them, and now they'd split our skulls for a sack of berries." },
      },
      choices = {
        { text = "Can they be saved?", next = "tribes_saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribes_saved = {
      big = true,
      lines = {
        { id = "ts_default", text = "The Deadwood, I think not; they've drunk too deep and too long. The Winterfall are newer to it, and if the thing poisoning them dies, our shamans believe they can be brought back, and I'd give my other eye to see it." },
      },
      choices = {
        { text = "Then save the Winterfall, whatever it takes.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mad cousins are still enemies. Put them down cleanly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winterfall = {
      lines = {
        { id = "w_default", text = "Something got into their camps, outsider, something that pours foul water into their firewater and whispers to their high chief. They were a proud tribe with good furs to trade, and now they come down on Everlook's road drunk and howling." },
        { id = "w_done", when = { questDone = TODO_QUEST("The Root of All Evil") }, text = "They're quieter now that the demon is gone, though quieter isn't the same as well. Our shamans walk among their camps now, carefully, and some of the Winterfall let them." },
      },
      choices = {
        { text = "What is this demon?", next = "xandivious" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xandivious = {
      lines = {
        { id = "x_default", text = "It is called Xandivious, and it hides itself well, letting the high chief take the blame for everything it does. Light a demon-summoning torch where it lairs and it can't stay hidden, and then it can be killed like anything else with blood in it." },
      },
      choices = {
        { text = "Why not kill the high chief instead?", next = "chief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chief = {
      big = true,
      lines = {
        { id = "c_default", text = "Because the chief is a puppet, and you don't burn a puppet and call the puppeteer beaten. Kill the demon and the Winterfall might wake up; kill only the chief and they'll find another, and the thing in the cave will whisper to that one too." },
      },
      choices = {
        { text = "You're right. Strike at the root, not the branch.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd kill both. Chances like that don't come twice.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outsiders = {
      lines = {
        { id = "o_default", text = "Because outsiders brought the demons here in the first place, and outsiders cut the forests and hunt the furbolgs for sport, Deadwood or not. The tunnels are the only safe road through these hills, and we'll not have them used to carry more trouble north." },
      },
      choices = {
        { text = "Then how does an outsider earn your trust?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      big = true,
      lines = {
        { id = "tr2_default", text = "Slowly, by killing the Deadwood and the Winterfall who can't be saved and bringing us their feathers and beads as proof. Some outsiders hate that it's slow, and I tell them that a friendship which comes quickly leaves quickly too." },
      },
      choices = {
        { text = "Slow trust is honest trust. I'll earn it properly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring whatever proof you want, however I come by it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye = {
      lines = {
        { id = "e_default", text = "A Deadwood spear, in the first season their camps went bad, before any of us knew what was happening to them. The one holding it had sat at my fire a hundred times, and I don't think he knew my face when he threw it." },
      },
      choices = {
        { text = "What became of him?", next = "eye_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye_after = {
      big = true,
      lines = {
        { id = "ea_default", text = "I don't know, and I've stopped looking for him among the dead ones the outsiders bring back feathers from. If you kill a Deadwood with a white streak down his arm, I'd rather you didn't tell me." },
      },
      choices = {
        { text = "I'll spare him if I find him, Gorn.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The kindest thing for him now is a quick death.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    friend = {
      lines = {
        { id = "f_default", text = "They do, and so do I, which counts for more in here than you might think. Friends of the hold can buy what I keep behind the counter, and they hear things in the tunnels that outsiders don't." },
      },
      choices = {
        { text = "What sort of things?", next = "friend_news" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friend_news = {
      lines = {
        { id = "fn_default", text = "That the Deadwood have begun carving new totems, and that our shamans don't like what's cut into them. Bring any you find to Kernda, who reads that sort of thing, and keep your hands clean afterwards." },
      },
      choices = {
        { text = "I'll keep an eye out for totems.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = {
        { id = "p_default", text = "The elders decided the hold has stayed alone long enough, and that the outsiders who fought for us deserve an answer. The offering is the Timbermaw's word, and you carry it because you've earned the right to." },
        { id = "p_alliance", when = { faction = "Alliance" }, text = "Your dwarf king sent people north to speak with us, years back, and we sent them home without an answer. The offering is that answer, late as it is, and you carry it because you've earned the right to." },
        { id = "p_horde", when = { faction = "Horde" }, text = "Your warchief sent word to us once, asking for friendship, and we left it unanswered. The offering is that answer, late as it is, and you carry it because you've earned the right to." },
      },
      choices = {
        { text = "What will the Timbermaw ask in return?", next = "peace_terms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace_terms = {
      big = true,
      lines = {
        { id = "pt_default", text = "Nothing but to be left alone in our hills, and to have our tunnels respected. We don't want a war banner, and we won't fight in your war against the others; tell your leader that plainly." },
      },
      choices = {
        { text = "That's fair. Peace shouldn't come with a price.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Neutral friends are useless friends. My leader will ask more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsham = {
      big = true,
      lines = {
        { id = "xs_default", text = "Then you hear what our own shamans hear, and you'll know why some of them can't sleep. The earth under the Deadwood camps has gone sour, and the spirits there have stopped answering anyone at all." },
      },
      choices = {
        { text = "The spirits can be called back with patience.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cut out the sickness first. The spirits will follow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "A demon poisoned my cousins and hid behind their chief while it did it, so you'll forgive me if I don't fear you and don't like you either. Keep whatever you've bound on a short leash inside the hold, and we'll get along." },
      },
      choices = {
        { text = "Understood. My demons stay leashed in here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My power is my own business, furbolg.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_fb", text = "The Timbermaw are what furbolgs were meant to be. The rest are what the demons made of them." } },
    burning_legion = { { id = "tp_bl", text = "Gone from the world, the night elves say, but something of them hid in a Winterfall cave long enough to poison a tribe." } },
    satyrs = { { id = "tp_sat", text = "The satyrs in the south of Felwood laugh while they kill. I'd rather face a Deadwood; at least the Deadwood are sad about it." } },
    background = { { id = "tp_bg", text = "Born in the hold, and I'll die in it, and in between I sell arrows to people who'll use them well." } },
    advice = { { id = "tp_ad", text = "Don't camp in the snow near Winterfall Village, and don't sell anything you take from a furbolg in my hearing." } },
    _none = { { id = "tp_none", text = "That's an outsider's business, and I've only one eye to keep on things. Ask someone with two." } },
  },
}

---------------------------------------------------------------------------
-- Kernda: reads the ritual totems of the corrupted tribes
---------------------------------------------------------------------------
P:NPC {
  key = "kernda", id = TODO_NPC("Kernda"), name = "Kernda",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "calm", "sharp" }, values = { "devout", "curious" },
  notices = { "class" },

  impression = {
    first = "Kernda studies the ritual totems the corrupted furbolgs carve, turning them over by the fire as if they might confess. Kernda always seems to know my trade before I say it.",
    third = "{name} met Kernda, the Timbermaw who reads the tainted ritual totems of the Deadwood and the Winterfall.",
  },

  greetings = {
    { id = "g_default", text = "What do you seek, {class}? Most who come this deep into the hold are looking for something." },
    { id = "g_totem", when = { questDone = TODO_QUEST("Deadwood Ritual Totem") }, text = "You brought me a Deadwood totem once, and I'm still reading it. It hasn't finished telling me things." },
    { id = "g_wtotem", when = { questDone = TODO_QUEST("Winterfall Ritual Totem") }, text = "The Winterfall totem you brought me sits in a basket of salt by the wall, and I sleep on the other side of the hold now." },
    { id = "g_cold", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "You've furbolg blood on you, {class}, and the wrong kind of furbolg. Speak quickly." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, {class}. The totems kept me company while you were away, which is to say badly." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, and you can feel what's in those totems from over there, can't you? Most outsiders only smell them." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Whatever god you pray to, you might say a word over the basket in the corner before you leave; I won't be offended." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kernda, and I read the ritual totems that the corrupted tribes carve. The Deadwood and the Winterfall still make them, the way they did when they were sane, but what they cut into the wood now is not what their grandmothers cut." },
        { id = "h_dtotem", tags = { "news" }, when = { questRecent = { TODO_QUEST("Deadwood Ritual Totem"), days = 3 } },
          text = "A Deadwood totem, still warm from the hand that carried it. It's thick with the taint, {class}, and I'm glad it's in here with me and not out there with them." },
        { id = "h_wtotem", tags = { "news" }, when = { questRecent = { TODO_QUEST("Winterfall Ritual Totem"), days = 3 } },
          text = "The Winterfall totem is worse than the Deadwood ones, and newer, and I can see where the carver's hand shook. Whatever drove them to it, they didn't carve it gladly." },
        { id = "h_friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } },
          text = "You've done a great deal for the hold, {class}, and so I'll speak to you as I'd speak to one of our own. Ask what you like about the totems; I'll tell you what I know and say so when I'm guessing." },
      },
      again = {
        { id = "h_again", text = "What else do you seek?" },
        { id = "h_again2", text = "Go on, {class}. The totems aren't going anywhere, more's the pity." },
      },
      choices = {
        { text = "What is a ritual totem?", next = "totem" },
        { text = "What's wrong with the carvings now?", next = "carvings" },
        { text = "Where would I find these totems?", next = "where" },
        { text = "What do you do with them?", next = "keeping" },
        { text = "Can you feel the corruption in them?", next = "xsham", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "I've seen things like this in the Plaguelands.", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "That's all for now, Kernda.", next = "END" },
      },
    },
    totem = {
      lines = {
        { id = "t_default", text = "A carving that holds a prayer, so the prayer goes on being said after the one who made it has gone to sleep. A camp's shaman carves them for the hunt, for a birth, for the dead, and each tribe has its own way of cutting the eyes." },
      },
      choices = {
        { text = "And the Timbermaw still make them?", next = "timbermaw_totems" },
        { text = "Something else.", next = "BACK" },
      },
    },
    timbermaw_totems = {
      lines = {
        { id = "tt_default", text = "We do, though fewer than we used to, because some of the young ones think it's the old carving that let the sickness in. I don't believe that, but I understand why they'd want something to blame that isn't a demon." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    carvings = {
      lines = {
        { id = "c_default", text = "The eyes are wrong, for one, cut deep and slanted like a satyr's, and the prayers wind back on themselves so they never finish. A sane carver ends a prayer; these go round and round, the way a sick mind does." },
      },
      choices = {
        { text = "Who taught them to carve that way?", next = "teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = {
        { id = "te_default", text = "No furbolg, I'm sure of that much. The Deadwood carvings look like the marks in the satyr ruins to the south, and the Winterfall ones look like something that wanted to be worshipped and found a tribe that would do it." },
      },
      choices = {
        { text = "So the corruption is being taught?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      big = true,
      lines = {
        { id = "ta_default", text = "Taught, and then copied, and then copied again by hands that don't know what they're copying. That's what frightens me, {class}: even if every demon in Felwood died tomorrow, the carvings would keep teaching it." },
      },
      choices = {
        { text = "Then burn every totem you can find.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Study them first. You can't unlearn what you don't understand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "w_default", text = "On the Deadwood themselves, in Deadwood Village and Felpaw, carried by their shamans and their den watchers. The Winterfall ones you'll find in the snow beyond the tunnel, in Winterspring, if you're strong enough to take them." },
      },
      choices = {
        { text = "Why do they carry them into fights?", next = "carry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = {
        { id = "ca_default", text = "For the same reason you'd carry a charm your mother gave you, I suppose. They still think the totems protect them, and maybe they do, from everything except whatever is inside the totems." },
      },
      choices = {
        { text = "I'll bring you any I find.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeping = {
      lines = {
        { id = "k_default", text = "I read them, and then I bury them in salt, and when the salt turns grey I bury them again in fresh. Nobody has told me whether that works, but nothing has crawled out of the basket yet." },
      },
      choices = {
        { text = "Why not simply destroy them?", next = "destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    destroy = {
      big = true,
      lines = {
        { id = "d_default", text = "Because each one was a furbolg's prayer before it was a demon's, and burning it feels like burning the last thing that furbolg made with a sane heart. Some of the elders say I'm sentimental, and they may be right." },
      },
      choices = {
        { text = "You're right to keep them. Their makers deserve that much.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sentiment is how sickness spreads. Destroy them all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsham = {
      big = true,
      lines = {
        { id = "xs_default", text = "I can, and so can you, I'd wager, like a cold draught from a door that ought to be shut. Hold one too long and it starts to feel like your own idea to keep holding it, which is why I wear gloves." },
      },
      choices = {
        { text = "Then the Timbermaw should cleanse them as tradition demands.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget tradition. Break whatever's bound inside them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "I've heard of the plague in the east, from outsiders who came through the tunnels with the smell of it on them. A plague takes the body and leaves the mind, if it leaves anything; this takes the mind and leaves the body to go on hunting, and I can't say which is worse." },
      },
      choices = {
        { text = "Both are worth fighting.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_fb", text = "We're a patient people, {class}, and patience is the only reason the Timbermaw are still themselves." } },
    satyrs = { { id = "tp_sat", text = "Their marks are in the Deadwood carvings, and I'd give a good deal to know how they got there." } },
    burning_legion = { { id = "tp_bl", text = "I've never seen a demon, and I don't need to. I've seen what their leavings do to a tribe." } },
    _none = { { id = "tp_none", text = "I read wood, {class}, not the world. Ask Gorn; he hears everything that comes through the tunnels." } },
  },
}

---------------------------------------------------------------------------
-- Meilosh: trades with friends of the hold
---------------------------------------------------------------------------
P:NPC {
  key = "meilosh", id = TODO_NPC("Meilosh"), name = "Meilosh",
  bible = "bibles/timbermaw_hold.md", role = "vendor", tier = "service",
  communities = { "timbermaw_felwood" }, temper = { "wary", "proud" }, values = { "loyal", "craft" },
  notices = { "class" },

  impression = {
    first = "Meilosh keeps the Timbermaw's best goods for proven friends and says so to anyone who asks. Proving yourself to him is slow, and he seems to think that's the point.",
    third = "{name} met Meilosh, who trades the Timbermaw's best goods only to friends of the hold.",
  },

  greetings = {
    { id = "g_default", text = "You want what Meilosh keeps, outsider? Prove that you're a loyal friend of the Timbermaw first." },
    { id = "g_friendly", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } }, text = "The hold speaks well of you, so Meilosh will open his packs. Look, and don't touch what you won't buy." },
    { id = "g_revered", when = { reputation = { faction = "Timbermaw Hold", min = "revered" } }, text = "Ah, it's you. Meilosh saved something good for you, as he does for the hold's own." },
    { id = "g_cold", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "No. Meilosh doesn't trade with those who hunt the Timbermaw, so go back the way you came." },
  },

  notice = {
    { id = "n_craft", cat = "class", when = { class = { "DRUID", "HUNTER" } },
      text = "You wear leather and know what it cost the animal. Good; Meilosh's goods are for people who know that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Meilosh keeps the hold's finest work: patterns our elders cut, and gear sewn the way the Timbermaw have sewn it since before the trees were sick. He trades it only to proven friends, because the work was made for friends." },
        { id = "h_friendly", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } },
          text = "You're a friend of the hold now, so the packs are open to you. Meilosh will even tell you what each piece is for, if you ask him politely." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid comes to Meilosh's packs. The Timbermaw made gear for the druids who walked with us, long ago, and some of the old patterns still remember it." },
      },
      again = {
        { id = "h_again", text = "What else? Meilosh is listening." },
        { id = "h_again2", text = "Another question, outsider? Ask it." },
      },
      choices = {
        { text = "How do I prove myself loyal?", next = "loyal" },
        { text = "What makes Timbermaw work special?", next = "work" },
        { text = "Do you trade with the Deadwood?", next = "deadwood" },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Farewell, Meilosh.", next = "END" },
      },
    },
    loyal = {
      lines = {
        { id = "l_default", text = "Ask Grazle and Nafien outside the gates; they know which Deadwood need killing and which feathers the elders want to see. Bring enough proof often enough, and the hold will start saying your name kindly." },
      },
      choices = {
        { text = "Why must it take so long?", next = "loyal_slow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loyal_slow = {
      big = true,
      lines = {
        { id = "ls_default", text = "Because the last outsiders who came quickly wanted our tunnels for their own wars. Meilosh would rather wait a year for a true friend than open his packs to a false one in a day." },
      },
      choices = {
        { text = "A wise rule. Trust should be earned slowly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules like that keep good friends waiting outside.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "w_default", text = "Every stitch is done by a furbolg who knows the animal it came from and thanked its spirit before the knife went in. Outsiders laugh at that, until they wear it in the snow and stay warm." },
      },
      choices = {
        { text = "Who taught the Timbermaw these patterns?", next = "work_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_old = {
      lines = {
        { id = "wo_default", text = "Grandmothers, and their grandmothers before them, back to when every furbolg tribe traded patterns at the same fires. The Timbermaw are the only ones left who remember them, so Meilosh guards them closely." },
      },
      choices = {
        { text = "I'll respect the work, Meilosh.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deadwood = {
      lines = {
        { id = "d_default", text = "Meilosh used to, before they went mad, and they made good leather too, the best south of the hold. Now they'd sooner gut him than trade with him, and Meilosh won't wear anything they make." },
      },
      choices = {
        { text = "Does it hurt, fighting your own kind?", next = "deadwood_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deadwood_hurt = {
      big = true,
      lines = {
        { id = "dh_default", text = "Every time, outsider, and Meilosh hopes it always will. The day it stops hurting is the day the Timbermaw have started to go the same way." },
      },
      choices = {
        { text = "Keep that hurt. It's what keeps you whole.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hurt makes your hand slow. Harden your heart to them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_fb", text = "The Timbermaw are furbolgs as furbolgs were meant to be. Meilosh is proud of that, and wary for it." } },
    _none = { { id = "tp_none", text = "Meilosh trades goods, not gossip. Ask Gorn, who has more of it." } },
  },
}
-- Inside Timbermaw Hold: Gorn One Eye (provisioner, and the furbolg who asks you to strike at the Winterfall's demon)
-- and Meilosh (tailor who trades for runecloth).
-- Voice: bibles/timbermaw_hold.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Gorn One Eye
---------------------------------------------------------------------------
P:NPC {
  key = "gorn_one_eye", id = TODO_NPC("Gorn One Eye"), name = "Gorn One Eye",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "gruff", "steady" }, values = { "loyal", "protective" },
  notices = { "timbermaw_low" },

  impression = {
    first = "Gorn One Eye keeps the stores in Timbermaw Hold and watches strangers with the one eye he has left. When he finally trusts someone, he trusts them with everything.",
    third = "{name} met Gorn One Eye, the one-eyed Timbermaw furbolg who keeps the hold's provisions and hates the demon behind the Winterfall.",
  },

  greetings = {
    { id = "g_default", text = "Gorn sees you. One eye is enough for that." },
    { id = "g_friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } }, text = "Friend of the Timbermaw! Gorn has kept honey back for you, and bread that is not too old." },
    { id = "g_root", when = { questActive = TODO_QUEST("The Root of All Evil") }, text = "The torch, the High Chief's cave, the demon. Gorn has said it three times now, so you will not forget." },
    { id = "g_saved", when = { questDone = TODO_QUEST("The Root of All Evil") }, text = "You saved the hold. Gorn says it every time, because it stays true every time." },
  },

  notice = {
    { id = "n_low", cat = "timbermaw_low", when = { reputation = { faction = "Timbermaw Hold", max = "neutral" } },
      text = "The guards let you in, so Gorn will not chase you out. But you smell of the outside, and Gorn is watching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gorn One Eye keeps the stores of Timbermaw Hold: bread, honey, sacks, and things for travellers who go through the mountain. Gorn also keeps watch, because the Winterfall to the north and the Deadwood to the south both want what is in these tunnels." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Root of All Evil"), reputation = { faction = "Timbermaw Hold", min = "friendly" } },
          text = "You have done much for the Timbermaw, and Gorn has watched it all. Now Gorn will tell you what the elders have found, because the Winterfall are not sick by accident. Something is feeding the sickness, and Gorn wants it dead." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Root of All Evil"), days = 3 } },
          text = "Xandivious is dead, the essence is in the elders' hands, and the healing of the Winterfall can begin. It will be slow, and some will never come back to themselves, but you have given them something they did not have yesterday." },
        { id = "h_peace", when = { questActive = TODO_QUEST("The Brokering of Peace") },
          text = "You carry the offering to your king? Good. Gorn does not know your cities, but Gorn knows the Timbermaw have been alone in the mountain too long." },
      },
      again = {
        { id = "h_again", text = "What else? Gorn is not busy, only watching." },
        { id = "h_again2", text = "Speak. Gorn's ears are both still good." },
      },
      choices = {
        { text = "Show me your stores.", next = "BUSINESS" },
        { text = "How did you lose the eye?", next = "eye" },
        { text = "What is feeding the Winterfall's sickness?", next = "root" },
        { text = "Why do the Timbermaw guard the tunnels?", next = "tunnels" },
        { text = "What happens now the demon is dead?", next = "after", when = { questDone = TODO_QUEST("The Root of All Evil") } },
        { text = "You want my people to make peace with yours?", next = "peace", when = { reputation = { faction = "Timbermaw Hold", min = "exalted" } } },
        { text = "Farewell, Gorn.", next = "END" },
      },
    },

    eye = {
      lines = { { id = "ey_default", text = "A Deadwood took it, long ago, when the sickness was new. He was Gorn's cousin, and he did not know Gorn any more, and Gorn did not want to hurt him, so Gorn waited too long." } },
      choices = {
        { text = "I'm sorry, Gorn.", next = "eye_after", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What happened to your cousin?", next = "eye_after" },
      },
    },
    eye_after = {
      lines = { { id = "eya_default", text = "Gorn's cousin is gone now. Gorn does not wait any more when the Deadwood come, and that is the lesson the eye taught, though Gorn wishes it had been cheaper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    root = {
      lines = {
        { id = "rt_default", text = "A demon, hiding near the High Chief of the Winterfall and whispering to him. Its name is Xandivious, and it taught them the firewater, and the firewater opened the door for the sickness. The elders have made a torch that will call it out." },
        { id = "rt_done", when = { questDone = TODO_QUEST("The Root of All Evil") },
          text = "It was Xandivious, and you killed it, at the mouth of the High Chief's own cave. Gorn tells the cubs the story now, and they ask to hear the part with the torch twice." },
      },
      choices = {
        { text = "How does the torch work?", next = "root_torch" },
        { text = "Will killing it cure the Winterfall?", next = "root_cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    root_torch = {
      lines = { { id = "rtt_default", text = "Plant it at the mouth of the High Chief's cave in Winterfall Village, and the demon will come to see who has dared. Then you must strike, with friends if you have them, because it will not come gently." } },
      choices = { { text = "I'll bring friends. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    root_cure = {
      big = true,
      lines = { { id = "rtc_default", text = "Not all at once. Its essence will let the elders begin the healing, but some Winterfall have drunk too long and will fight until they die. Some of the elders say every Winterfall should be killed now, to keep the sickness out of the hold." } },
      choices = {
        { text = "Kill the ones who fight. Heal the ones who can be healed.", next = "root_cure_end", fx = { align = { light = 1 } } },
        { text = "The elders are right. Protect the hold first, whatever it costs.", next = "root_cure_end", fx = { align = { light = -1 } } },
        { text = "What does Gorn think?", next = "root_cure_end" },
      },
    },
    root_cure_end = {
      lines = { { id = "rce_default", text = "Gorn thinks of his cousin, and Gorn thinks the Winterfall have cousins too. Gorn will guard the door, and Gorn will hope, and those two things can sit in the same heart." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tunnels = {
      lines = { { id = "tn_default", text = "Because the tunnels are the only road through the mountain that does not freeze or burn. The Timbermaw dug them, and the Timbermaw keep them clean, and a traveller who is friend to the Timbermaw may walk from Felwood to Winterspring without fear." } },
      choices = {
        { text = "And travellers who aren't friends?", next = "tunnels_foes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tunnels_foes = {
      lines = { { id = "tf_default", text = "They walk with a great deal of fear. Kill the Deadwood and the Winterfall, bring their beads and feathers to Nafien and Grazle, and the guards will learn your smell." } },
      choices = { { text = "I'll earn it. Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    after = {
      lines = { { id = "af_default", text = "Now the elders work, and Gorn guards the door, and the Winterfall that still have their minds may come back to them. It will be a long time, but a long time is still a time with an end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    peace = {
      lines = { { id = "pe_default", text = "Gorn wants the Timbermaw to stop being alone. Your leader once tried to speak to us, and we did not answer, because we trusted nobody. Now Gorn trusts you, so Gorn would send our offering with you, if you will carry it." } },
      choices = {
        { text = "I'll carry it. It would be an honor.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Gorn knows the stores, the tunnels, and the enemies of the hold." } },
    background = { { id = "tp_bg", text = "Gorn is Timbermaw, born in the hold, and Gorn will die in the hold, as late as possible.", next = "eye" } },
    advice = { { id = "tp_ad", text = "Never drink what a Winterfall offers you. Never." } },
    furbolgs = { { id = "tp_furb", text = "The Timbermaw are the last who remember. The others forgot, or were made to forget." } },
    _none = { { id = "tp_none", text = "Gorn does not know that. Gorn knows bread and enemies." } },
  },
}

---------------------------------------------------------------------------
-- Meilosh
---------------------------------------------------------------------------
P:NPC {
  key = "meilosh", id = TODO_NPC("Meilosh"), name = "Meilosh",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "gentle", "fussy" }, values = { "craft", "curious" },
  notices = { "tailor" },

  impression = {
    first = "Meilosh is the Timbermaw's tailor and trader, and he handles runecloth as if it were spun moonlight. He trades only with those the hold has learned to trust.",
    third = "{name} met Meilosh, the Timbermaw furbolg who trades for runecloth in Timbermaw Hold.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a traveller. Meilosh hopes you have brought cloth, and not mud." },
    { id = "g_stranger", when = { reputation = { faction = "Timbermaw Hold", max = "neutral" } }, text = "Meilosh does not trade with strangers. Come back when the hold knows your name." },
    { id = "g_runecloth", when = { questDone = TODO_QUEST("Runecloth") }, text = "Ah, the cloth-bringer! The cubs are wearing your runecloth already, and they are very proud of it." },
  },

  notice = {
    { id = "n_tailor", cat = "tailor", when = { profession = "Tailoring" },
      text = "You have a tailor's fingers, all needle-pricked. Meilosh can tell; it takes one to know one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Meilosh makes the clothing of Timbermaw Hold, and trades with the few outsiders the hold trusts. The Timbermaw are content in the mountain, but contentment is bad for trade, so Meilosh must find cloth wherever he can." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Runecloth"), reputation = { faction = "Timbermaw Hold", min = "friendly" } },
          text = "You are a friend of the hold now, so Meilosh will ask you. Runecloth is rare among us, and Meilosh's people have seen how fine it is, and now everyone wants a runecloth something. Will you bring Meilosh some?" },
      },
      again = { { id = "h_again", text = "What else would you know? Meilosh is only sewing." } },
      choices = {
        { text = "Show me what you trade.", next = "BUSINESS", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "Why do your people want runecloth?", next = "cloak" },
        { text = "What do furbolgs usually wear?", next = "wear" },
        { text = "Do you ever trade outside the hold?", next = "trade" },
        { text = "I'm a tailor myself.", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Farewell, Meilosh.", next = "END" },
      },
    },
    cloak = {
      lines = { { id = "cl_default", text = "A night elf came to the hold, not long ago, a rare friend of ours, and she wore a cloak of runecloth. It was so fine that every Timbermaw wanted to touch it, and now Meilosh is asked every day when he will make one." } },
      choices = {
        { text = "Who was the night elf?", next = "cloak_elf" },
        { text = "How much runecloth do you need?", next = "cloak_need" },
      },
    },
    cloak_elf = {
      lines = { { id = "ce_default", text = "A friend, and Meilosh will not say more, because the hold keeps its friends' names safe. She has not come back since, and Meilosh hopes she is well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloak_need = {
      lines = {
        { id = "cn_default", text = "Thirty pieces will make a good start, and more after that, because the Timbermaw are many and the winters are long. Bring them, and Meilosh will give you something in trade, and you will be a friend of the hold a little more each time." },
        { id = "cn_active", when = { questActive = TODO_QUEST("Runecloth") }, text = "Thirty, as Meilosh said. The Winterfall and Deadwood carry it sometimes, and the human lands to the east are full of it, they say." },
      },
      choices = { { text = "I'll find some. Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    wear = {
      big = true,
      lines = { { id = "we_default", text = "Fur, mostly, which we grow ourselves, and wool and hide for the cold. Some elders say the Timbermaw should not want the things of outsiders at all, that cloth from outside will bring outsiders' troubles in with it." } },
      choices = {
        { text = "The elders are wise. Keep your ways.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trade makes friends. Let the cloth in.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "tr_default", text = "Never outside, only inside. Outsiders come to Meilosh, if the guards let them, and then Meilosh decides. It is a slow way to trade, but it is the Timbermaw way, and the Timbermaw are still here when other tribes are not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tailor = {
      lines = { { id = "ta_default", text = "Then you know how runecloth feels, soft and strong together, like the best kind of friend. Meilosh would like to watch you sew one day, to see how outsiders do it." } },
      choices = { { text = "One day, Meilosh.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Meilosh knows cloth and stitches and who in the hold needs a new coat." } },
    furbolgs = { { id = "tp_furb", text = "The Timbermaw keep themselves to themselves. Meilosh thinks this is mostly wise." } },
    _none = { { id = "tp_none", text = "Meilosh does not know. Meilosh knows cloth." } },
  },
}
