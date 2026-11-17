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
