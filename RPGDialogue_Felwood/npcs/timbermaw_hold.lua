-- Timbermaw Hold, inside the tunnels: Gorn One Eye, who speaks for the hold, and Meilosh, its trader. Voice: bibles/timbermaw_hold.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gorn_one_eye", id = TODO_NPC("Gorn One Eye"), name = "Gorn One Eye",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "wary", "gruff" }, values = { "loyal", "wise" },
  notices = { "trophy", "race", "class" },

  impression = {
    first = "He speaks of the corrupted tribes as lost family, not beasts.",
    third = "{name} met Gorn One Eye, an elder of the Timbermaw who keeps watch inside Timbermaw Hold.",
  },

  greetings = {


    { id = "g_rep2", when = { rep = { faction = "Timbermaw Hold", min = "Exalted" } }, text = "You are Timbermaw now in all but fur, and Gorn would fight anyone who says otherwise." },
    { id = "g_rep1", when = { rep = { faction = "Timbermaw Hold", min = "Honored" } }, text = "Gorn see you, friend of Timbermaw. The tribe speaks your name at the fires now." },
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
        { id = "h_dd_winterfall", tags = { "news" }, when = { killed = { name = "Winterfall", min = 30 } }, text = "The Winterfall beyond the northern door are fewer, and Gorn has smelled their blood on you each time you come through the tunnels. They were our cousins, and Gorn grieves, but he does not ask you to stop." },
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
        { id = "e_default", text = "Gorn lost it to a Deadwood claw, many winters ago, in the first year the sickness came up from the south. The claw belonged to a furbolg Gorn had taught to fish when that one was a cub." },
      },
      choices = {
        { text = "You knew him?", next = "eye_story" },
        { text = "I'm sorry.", next = "BACK" },
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
        { text = "It was mercy. You spared the cousin you once knew.", next = "BACK", reply = "Gorn hopes so, and Gorn is glad you think it. Some nights the hoping is all Gorn has.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It was foolish. He's surely killed others since.", next = "BACK", reply = "Perhaps, and Gorn thinks of that too, and it weighs heavy. But Gorn could not do otherwise, not with that face.", fx = { align = { light = -1 } } },
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
        { text = "I'll do it quickly and without cruelty. They deserve that much.", next = "BACK", reply = "Gorn thanks you, outsider, and the shamans will hear of it. Some of those Deadwood once fished beside Gorn.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're killers now. How they die doesn't matter.", next = "BACK", reply = "It matters to Gorn, and to the Timbermaw. Do it however you like, but do not tell Gorn about it after.", fx = { affinity = -1, align = { honor = -1 } } },
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
        { text = "Guarding the road is your right. It's your home.", next = "BACK", reply = "It is, and Gorn is glad an outsider sees it. Most only see a toll they wish they did not have to pay.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Roads should be open to everyone, furbolg or not.", next = "BACK", reply = "Open roads are for those who have nothing to lose, outsider. The Timbermaw have lost enough.", fx = { align = { order = -1 } } },
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
        { text = "Then my people owe you. I'll help repay it.", next = "BACK", reply = "Gorn is glad to hear it, Kaldorei, and the elders will be too. They still tell stories of elves at our fires.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "My people had their own war to survive, Gorn.", next = "BACK", reply = "Gorn knows, and Gorn does not blame you, not much. But the forest remembers who left.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "Gorn thanks you, tauren, and Gorn thinks the Earth Mother does weep. Your people speak to the land the way ours did before the poison, so you understand that we are not killing monsters out there, only family who no longer know us." },
      },
      choices = {
        { text = "Then we mourn them and still do what must be done.", next = "BACK", reply = "Yes, tauren, and Gorn is glad you understand it. Mourn them, and do it anyway.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Family or not, the land comes first. They must go.", next = "BACK", reply = "Gorn knows you are right, and Gorn hates that you are right. Go, and be quick about it.", fx = { align = { light = -1 } } },
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

-- Inside Timbermaw Hold: Gorn One Eye, Kernda and Meilosh, the furbolgs who decide which outsiders
-- get past the tunnels. Voice: bibles/timbermaw_hold.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kernda: reads the ritual totems of the corrupted tribes
---------------------------------------------------------------------------
P:NPC {
  key = "kernda", id = TODO_NPC("Kernda"), name = "Kernda",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "calm", "sharp" }, values = { "devout", "curious" },
  notices = { "class" },

  impression = {
    first = "Kernda always seems to know my trade before I say it.",
    third = "{name} met Kernda, the Timbermaw who reads the tainted ritual totems of the Deadwood and the Winterfall.",
  },

  greetings = {

    { id = "g_rep1", when = { rep = { faction = "Timbermaw Hold", min = "Honored" } }, text = "The tribe trusts you, and so Kernda trusts you. Come in out of the corruption and rest a while." },
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
          text = "You've done much for the hold, {class}, and so I'll speak to you as I'd speak to one of our own. Ask what you like about the totems; I'll tell you what I know and say so when I'm guessing." },
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
        { text = "Then burn every totem you can find.", next = "BACK", reply = "Burning feels like the right answer, I know, but the ash still carries what was in it. Burn them if you must, {class}, but bury the ash deep.", fx = { align = { order = -1 } } },
        { text = "Study them first. You can't unlearn what you don't understand.", next = "BACK", reply = "Yes, and that's what the elders won't hear from me. If we don't understand them, we'll be making them again in a hundred years.", fx = { affinity = 1, align = { order = 1 } } },
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
        { text = "You're right to keep them. Their makers deserve that much.", next = "BACK", reply = "Thank you, and I'll keep that in mind when the elders shout. Someone's grandmother carved these with her own hands.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sentiment is how sickness spreads. Destroy them all.", next = "BACK", reply = "You sound like the elders, and they're not wrong, which is the worst part. I'll destroy the worst of them, at least.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsham = {
      big = true,
      lines = {
        { id = "xs_default", text = "I can, and so can you, I'd wager, like a cold draught from a door that ought to be shut. Hold one too long and it starts to feel like your own idea to keep holding it, so I wear gloves." },
      },
      choices = {
        { text = "Then the Timbermaw should cleanse them as tradition demands.", next = "BACK", reply = "Tradition is slow, but it holds, and that's why I trust it. I'll see it done the old way.", fx = { align = { order = 1 } } },
        { text = "Forget tradition. Break whatever's bound inside them.", next = "BACK", reply = "That's quicker, and maybe it's right, but whatever's bound inside might not stay broken. Be careful what you set loose.", fx = { align = { order = -1 } } },
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
    first = "Proving yourself to him is slow, and he thinks that's the point.",
    third = "{name} met Meilosh, who trades the Timbermaw's best goods only to friends of the hold.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ah, the furless friend returns! Meilosh has saved the best work for you, and the tribe speaks well of you, very well." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Meilosh will sell to you, because the elders say so. But Meilosh will watch your paws while you look." },

    { id = "g_rep1", when = { rep = { faction = "Timbermaw Hold", min = "Friendly" } }, text = "Ah, the furless friend! The tribe says you are welcome, so Meilosh will show you the good goods." },
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
        { text = "The Timbermaw keep the old ways, and that is worth respect.", next = "BACK", reply = "Yes! The furless rarely understand. You are wiser than most of your kind.", fx = { align = { order = 1 } } },
        { text = "The old ways only keep the Timbermaw hiding in their tunnels.", next = "BACK", reply = "Hiding is how we survived when the others went mad. Meilosh does not like those words.", fx = { align = { order = -1 } } },
        { text = "How do I prove myself loyal?", next = "loyal" },
        { text = "What makes Timbermaw work special?", next = "work" },
        { text = "Do you trade with the Deadwood?", next = "deadwood" },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "What is the hold like inside, beyond the tunnels?", next = "hold" },
        { text = "Who are Grazle and Nafien?", next = "gate" },
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
        { text = "A wise rule. Trust should be earned slowly.", next = "BACK", reply = "Meilosh is glad you see it, outsider. Come back often, and one day Meilosh will open his packs for you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules like that keep good friends waiting outside.", next = "BACK", reply = "They do, and Meilosh is sorry for it. But a good friend waits, and a false one does not.", fx = { align = { order = -1 } } },
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
        { text = "Keep that hurt. It's what keeps you whole.", next = "BACK", reply = "Meilosh will, outsider, and thanks you for saying it. Meilosh still has a Deadwood belt, from before, that he cannot throw away.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hurt makes your hand slow. Harden your heart to them.", next = "BACK", reply = "A hard heart is how the Deadwood began, outsider. Meilosh would rather be slow than lost.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = { { id = "hd_default", text = "Warm, and dark, and full of the sound of the tribe, which is good. The tunnels run all the way through the mountain to Winterspring, and the furless use them to walk from one to the other without the cold. Meilosh thinks the furless should be more grateful." } },
      choices = {
        { text = "Why do the Timbermaw let us through at all?", next = "hold2" },
        { text = "I'm grateful. It's a long walk otherwise.", next = "hold2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold2 = {
      lines = { { id = "hd2_default", text = "Because the elders say the sickness came from outside, and that the Timbermaw cannot stand alone against it forever. Meilosh does not always agree with the elders, but he does as they say, and he watches the tunnels, and he counts who comes back." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    gate = {
      lines = { { id = "gt_default", text = "Grazle is a warrior, and Nafien is a hunter, and they watch the southern gate for the hold. They will tell you which Deadwood must die and which feathers to bring, and they will remember whether you did it well or badly. They remember everything, which is tiring." } },
      choices = {
        { text = "Why feathers?", next = "gate2" },
        { text = "Remembering everything is a fine trait in a guard.", next = "gate2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate2 = {
      lines = { { id = "gt2_default", text = "The Deadwood wear headdresses of feathers when they go to war, and a feather is easy to carry and hard to lie about. The elders count them, and every feather means one Deadwood who will not come against the hold. Meilosh does not like counting, but he likes fewer Deadwood." } },
      choices = {
        { text = "I'm a druid. I'll bring feathers, and remember the Deadwood kindly.", next = "BACK", reply = "Hm. Meilosh did not expect a furless to say that. Good. Maybe you are a friend after all.", when = { class = "DRUID" } },
        { text = "Something else, Meilosh.", next = "BACK" },
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
