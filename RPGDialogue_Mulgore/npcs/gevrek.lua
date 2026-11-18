-- Camp Gev'rek: the Windshapers' camp in Mulgore. Voice: bibles/mulgore.md
-- Skyborne facts ONLY from the brief (§10). Where the brief is silent, she stays vague.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "ayessa", id = TODO_NPC("Ayessa Dawnsinger"), name = "Ayessa Dawnsinger",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "gevrek" }, temper = { "steady" }, values = { "loyal", "devout", "proud" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "Ayessa Dawnsinger leads the Windshapers with a steady hand and a careful word. She is grateful to Thunder Bluff, and plainly determined that her people never give the tauren cause to regret their welcome.",
    third = "{name} met Ayessa Dawnsinger, leader of the Windshapers at Camp Gev'rek in Mulgore.",
  },

  greetings = {
    { id = "g_winds", text = "Winds be with you. You're welcome at Gev'rek, as long as you come in peace." },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Winds be with you, child of the isle. The ground still feels strange under your feet, doesn't it?" },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to us. Sit, and tell me what the land below the sky taught you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Skyborne" },
      text = "A druid. There are few of you among us. The Cenarion Circle will want to know you; let them, but remember it was the elements that raised you." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You've walked the elemental trials; I can see it in how you stand, and that is good." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Thunder Bluff opened its gates to us. We won't forget that, and we won't make the tauren regret it." },
  },

  start = "hello",
  nodes = {
    op_horde = {
      lines = {
        { id = "oph_q", text = "I'm grateful to the Horde every day, and I'll not pretend otherwise. But I still don't know it the way you do, so tell me: what do you think the Horde truly is?" },
        { id = "oph_q_ally", when = { faction = "Alliance" }, text = "You're of the Alliance, so your eyes see the Horde from the other side of the fence, and those are the eyes I most want to borrow. What do you think of the Horde that took us in?" },
      },
      choices = {
        { text = "A family of exiles who chose each other. That's its strength.", next = "op_horde_r1", fx = { affinity = 2, align = { order = 1 }, opinion = { horde = "kin" } } },
        { text = "An army first. Don't mistake its kindness for anything softer.", next = "op_horde_r2", fx = { align = { order = -1 }, trait = { skeptical = 1 }, opinion = { horde = "army" } } },
        { text = "Dangerous company. I'd keep the Windshapers a little apart.", next = "op_horde_r3", fx = { affinity = -1, opinion = { horde = "dangerous" } }, when = { faction = "Alliance" } },
        { text = "The Horde gave my people a home too. You'll find it worthy.", next = "op_horde_r4", fx = { affinity = 1, opinion = { horde = "kin" } }, when = { race = { "Tauren", "Orc", "Troll", "Scourge" } } },
        { text = "I'd sooner you judged it for yourself, Elder.", next = "BACK" },
      },
    },
    op_horde_r1 = {
      lines = {
        { id = "op_horde_r1", text = "Then the Windshapers chose well, and I'll tell my people so when they doubt it. Thank you for that." },
      },
      choices = {
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    op_horde_r2 = {
      lines = {
        { id = "op_horde_r2", text = "I've seen the axes, so I don't mistake them, but I've also seen Baine carry water for my elders. It's both, I think, and that's what makes it strange." },
      },
      choices = {
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    op_horde_r3 = {
      lines = {
        { id = "op_horde_r3", text = "We were apart once, on Skywall, and the winds left us anyway. I'll not choose to be alone again, though I thank you for the warning." },
      },
      choices = {
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    op_horde_r4 = {
      lines = {
        { id = "op_horde_r4", text = "That's twice now someone born to it has told me so. I'm beginning to believe it, which is more than I could say on the day we landed." },
      },
      choices = {
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The elements came first for my people, and the Light is a stranger to us. But we came to the Horde with our own odd gifts and were given a place to stand, and I would offer you the same welcome the tauren offered us." } },
      choices = {
        { text = "Then I'll honour that welcome, and earn it.", next = "BACK", reply = "Then you are already halfway to earning it, and I will tell the camp so. A guest who honours a welcome makes the next welcome easier.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I've earned my place already, Ayessa.", next = "BACK", reply = "Perhaps you have, and I will not count anyone's deeds for them. Still, a place kept with gratitude is kept longer than one held by pride.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We have those who ask the wind to carry sickness away, and sometimes it listens, though it is a fickle healer. Your way seems steadier to me, and I would be grateful if you shared a little of it with Gev'rek's young ones." } },
      choices = {
        { text = "Gladly, Elder. Healing should be shared.", next = "BACK", reply = "Thank you, and the young ones will thank you too, once they stop staring. The wind has been a fickle healer this season.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My faith isn't for sharing with outsiders, Elder.", next = "BACK", reply = "Then I will not ask again, and I hope I gave no offence. We are new here, and still learning which doors open and which do not.", fx = { align = { light = -1 } } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "We need friends more than we need blades, but a friend with a blade is welcome at Gev'rek. The plains are new to us, and the gnolls and the goblins do not care whose guests we are, so a warrior who stands with us honours the welcome Thunder Bluff gave us." } },
      choices = {
        { text = "I'll stand with Gev'rek, Elder, as the Horde does.", next = "BACK", reply = "Then you are welcome at our fire, and the gnolls will learn to think twice about Gev'rek. The tauren gave us this ground, and we would keep it well.", fx = { align = { honor = 1 } } },
        { text = "Your people should learn to guard themselves, Elder.", next = "BACK", reply = "We are learning, and quickly, I promise you that. But no people stands alone on new ground, as the tauren taught us when they took us in.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very strange, and very beautiful. The kodo walk so slowly that the young ones laughed at first, until they saw one charge, and now they watch the herds with as much respect as any tauren, which is a lesson I hope we keep." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Very strange, and very beautiful. Your {pet} is a fine creature. The young ones will want to follow it about the camp, and I hope you'll forgive them." },
      },
      choices = {
        { text = "Respect the herds, and the plains will welcome you.", next = "BACK", reply = "That is the lesson I hope we never forget. The plains have been kinder to us than we had any right to expect.", fx = { align = { honor = 1 } } },
        { text = "The herds are food, Elder. That's all they are.", next = "BACK", reply = "To you, perhaps, and I will not argue with how you hunt. But the tauren taught us otherwise, and I think they were right.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "We do not, because the wind answers us as a friend and not as a tool, and I would rather not say more of our ways than that. The Horde's mages have been kind to us, though, and I would only ask that you be careful with fire on these plains, which we owe to the tauren." },
      },
      choices = {
        { text = "I'll be careful, Elder. Mulgore is the tauren's gift to you.", next = "BACK", reply = "It is, and I am grateful you see it so. The tauren have been patient with us, and I would not have them regret it.", fx = { align = { order = 1 } } },
        { text = "My magic is my own affair, Elder.", next = "BACK", reply = "It is, and I would never ask you to change it. I only ask about the fire, because the grass here is not ours to burn.", fx = { align = { order = -1 } } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "We fear what we don't understand, and we don't understand the things you call, though the orcs have told us their story. Gev'rek owes Thunder Bluff its welcome, so I would ask you to keep your demon out of our camp, out of respect for them and for us." },
      },
      choices = {
        { text = "I'll keep it out of your camp, Elder.", next = "BACK", reply = "Thank you, and Gev'rek thanks you, though the young ones will still stare. Come to us without it, and you will be welcome.", fx = { align = { order = 1 } } },
        { text = "Your people will have to get used to me.", next = "BACK", reply = "They may, in time, but I would rather they never had to. Gev'rek is a guest on tauren ground, and I will not have them shamed by us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The Windshapers know something about being strange in the Horde, so I will not stare. Much." },
        { id = "h_default", key = true,
          text = "I'm Ayessa Dawnsinger, and I lead the Windshapers. The Earthen Ring answered when we called, and the Horde gave us a place to stand." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde", ["not"] = { race = "Skyborne" } }, text = "A warrior. The Horde gave us a place to stand, and its warriors are the reason that place stays standing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde", ["not"] = { race = "Skyborne" } }, text = "A hunter, with a beast that walks beside you. These plains hold creatures I'm still learning to name." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The Windshapers pray to the winds and not to gods, but Mulgore has taught me that the Horde holds many faiths, and I would understand yours." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde", ["not"] = { race = "Skyborne" } }, text = "A mage, at Gev'rek. My people shape the wind, so we know a little of what it is to bend the world, and to be careful when we do." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde", ["not"] = { race = "Skyborne" } }, text = "A warlock. I'll speak plainly, as I try to with everyone: the wind goes still around you, and my people notice." },
        { id = "h_windshaper", when = { origin = "skyborne_windshaper" }, text = "You passed the trials and took the sapta before we left the isle, and you came down with us anyway. The winds that sheltered us are gone, but Gev'rek is full of people who swore to them, and you're one of the few who still says the oath aloud." },
      },
      choices = {
        { text = "Why did your people leave their home?", next = "skywall" },
        { text = "What do the Windshapers believe?", next = "believe" },
        { text = "Did all your people come to the Horde?", next = "order" },
        { text = "I've begun the trials, Elder. The elements answer me.", next = "shaman", when = { race = "Skyborne", class = "SHAMAN" } },
        { text = "I chose the blade over the trials. Is that a failing?", next = "warrior", when = { race = "Skyborne", class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "I'm a druid. Does that set me apart from the Windshapers?", next = "druid", when = { race = "Skyborne", class = "DRUID" } },
        { text = "The Earthen Ring trained me too.", next = "ring", when = { race = { "Orc", "Troll", "Tauren" }, class = "SHAMAN" } },
        { text = "How do I honor winds that aren't here anymore, Elder?", next = "xhonor", when = { origin = "skyborne_windshaper" } },
        { text = "The Windshapers could use a few warriors, Elder.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde", ["not"] = { race = "Skyborne" } } },
        { text = "The beasts of the plains must be strange to your people.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde", ["not"] = { race = "Skyborne" } } },
        { text = "Do the Windshapers have healers of their own, Elder?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd guess the Windshapers practise the arcane too.", next = "xmage", when = { class = "MAGE", faction = "Horde", ["not"] = { race = "Skyborne" } } },
        { text = "Your people seem to fear warlocks, Elder.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde", ["not"] = { race = "Skyborne" } } },
        { text = "Do the Windshapers find the Light strange, Ayessa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "My skysight dims each season, Elder. I fear the day it's gone.", next = "xorig_totem", when = { origin = "skyborne_gevrek_totem_keeper" } },
        { text = "Winds be with you.", next = "END", fx = { affinity = 1, standing = { gevrek = 1 } } },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The wind is gentle today, and so is my patience." },
        { id = "h_again2", text = "Speak, then. Gev'rek keeps no secrets from its friends, or few, and the ones it keeps are mostly about whose turn it is to haul water." },
      },
    },
    xorig_totem = {
      lines = {
        { id = "xto_default", text = "So do I, and I am older than you, so I will likely meet that day first. Until then you'll tend the totems as if you could see every spirit around them, because a totem doesn't need our eyes to stand. Will you keep them for me, even blind?" },
      },
      choices = {
        { text = "Even blind, Elder.", next = "BACK", fx = { affinity = 2, standing = { gevrek = 1 } } },
        { text = "I'll try, but I won't pretend it doesn't frighten me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      big = true,
      lines = {
        { id = "sh_default", text = "Then you carry the oldest thing we brought down from the sky. Our patrons fell silent, but the elements did not, and every Windshaper who learns to hear them is proof that the wind didn't abandon us entirely." },
      },
      choices = {
        { text = "I'll serve the elements, as our people always have.", next = "BACK", reply = "Then the wind is glad of you, and so am I. Every Windshaper who hears it is a promise kept to those who came before.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The spirits left us once. I'll trust my own strength.", next = "BACK", reply = "I understand that, more than I would like to admit. But the elements did not leave us, only our patrons did, and I would ask you not to confuse them.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Why did the spirits go silent?", next = "shaman_silent" },
      },
    },
    shaman_silent = {
      lines = { { id = "ss_default", text = "I don't know, and anyone who tells you they know is guessing. They would never speak of the Windlord, and then one day they didn't speak at all. Listen hard down here, child, because the answer may be in the ground as easily as in the sky." } },
      choices = { { text = "I'll listen.", next = "BACK", fx = { affinity = 1, learn = { "al_aketh" } } } },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "No failing at all. The Peacekeepers carried blades on the isle, and Gev'rek needs blades as much as totems. Keep the camp safe while our shamans listen; that is its own kind of devotion." },
        { id = "wa_recruit", when = { origin = "skyborne_empyrean_recruit" },
          text = "You trained with the Empyrean Blades, didn't you? They guarded the Shal'nan once. Here there's no Shal'nan to guard, only us, and we're grateful." },
      },
      choices = { { text = "Then I'll guard the camp.", next = "BACK", fx = { affinity = 2, standing = { gevrek = 1 } } } },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "It does, a little, and I won't hide it. The elements raised you, but something in you answers the green as well, and the tauren druids here will understand that part better than I can." },
        { id = "dr_nightclaw", when = { origin = "skyborne_nightclaw" },
          text = "Nightclaw, from Shadowgale. They kept to themselves on the isle, and you'll be tempted to do the same here, so don't. The Horde trusts what it can see." },
      },
      choices = {
        { text = "I'll walk both paths, Elder.", next = "BACK", reply = "Then walk them carefully, and listen to both voices. The tauren druids will help with the green, and the wind will always know where you are.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "I'm a Windshaper first, and always will be.", next = "BACK", reply = "Then the wind will be glad of you, and you will always have a home at Gev'rek. Still, the green has its own wisdom, if you ever want it.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    ring = {
      lines = {
        { id = "ri_default", text = "Then we owe your teachers our home. The Earthen Ring answered when the sky was falling around us, and I'll never forget that. Sit with our initiates, if you'd like; they've only ever known one sky's spirits, and they could use another view." },
        { id = "ri_tauren", when = { race = "Tauren" },
          text = "A tauren shaman! Your people taught us how the Earth Mother is honored here, and our initiates have taken to it more readily than I expected. They ask me why the ground here hums at night, and I tell them to ask you." },
      },
      choices = { { text = "I'd be glad to sit with them.", next = "BACK", fx = { affinity = 2, standing = { gevrek = 1 } } } },
    },
    xhonor = {
      big = true,
      lines = {
        { id = "xho_default", text = "The tauren taught me an answer without meaning to. They thank the Earth Mother for every kodo and every stalk of grain, though she never thanks them back, so I've started thanking the wind for every breeze over the plateau, whether it's ours or not. Would you call that faith, or habit?" },
      },
      choices = {
        { text = "Faith. A debt honored in silence is still honored.", next = "BACK", reply = "Then I am not so foolish as I feared, and I will keep thanking it. Perhaps the debt is honoured simply by not forgetting it.", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Habit, and a comfortable one. The debt died with them.", next = "BACK", reply = "Maybe it did, and maybe I only keep it because it comforts me. Still, a comfortable habit is no bad thing for a people far from home.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    skywall = {
      big = true,
      lines = {
        { id = "s_default", text = "The spirits who sheltered us fell silent, and the isles began to drift apart. Then the Al'Aketh lit their beacon, and we left before the Windlord could answer it." },
      },
      choices = { { text = "That must have been hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, learn = { "al_aketh" } } } },
    },
    believe = {
      lines = {
        { id = "b_default", text = "The four elements, and a debt to the wind that carried us. Our initiates pass the trials and take the sapta. The rest you learn by walking it." },
      },
      choices = {
        { text = "How do the Windshapers see the Horde, Elder?", next = "op_horde" },
        { text = "I'd like to learn.", next = "BACK", reply = "Then come to the camp, and walk with us a while, and the rest will follow. The elements are patient with the willing.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The elements don't need my worship, and I don't need theirs.", next = "BACK", reply = "Perhaps they do not, and the wind will not mind either way. Still, Gev'rek will welcome you, worship or no.", fx = { align = { light = -1 } } },
      },
    },
    order = {
      lines = {
        { id = "o_default", text = "The High Order didn't. They went to the Kirin Tor, and we went to the Earthen Ring. Some of what lies between us is old, and some of it is fresh graves. Don't ask me to pretend otherwise." },
      },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 1, learn = { "two_orders" } } } },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "Sacred sites, old wrongs and new deaths. We'll speak of it another day, but not today." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes and shaved heads. If you ever see them on this side of the sky, tell me before you tell anyone else." } },
    windstones = { { id = "tp_windstones", text = "Power and coin both, on the isle. Down here they're a reminder of home, mostly." } },
    cenarion_circle = { { id = "tp_circle", text = "Our druids feel a pull toward them, and I won't stand in the way; the elements are generous enough to share." } },
    centaur = { { id = "tp_centaur", text = "The centaur raided the wandering tauren for generations, and my people have heard the stories at every fire. Thunder Bluff gave us shelter from all that, and we do not forget it." } },
    cairne = { { id = "tp_cairne", text = "Cairne gave the Windshapers a place in Mulgore when we had nowhere else to go. I owe him more than I can say, and I mean to repay it with loyalty." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is the land, and the Windshapers have always listened to her through the wind. We hear her clearly here, more clearly than we ever did on the road." } },
    the_elements = { { id = "tp_the_elements", text = "The wind spirits are our oldest friends, and they guided us across the plains when the land itself was against us. We still follow them, though now we follow them home." } },
    _none = { { id = "tp_none", text = "I don't know. Down here, there's so much I don't know yet." } },
  },
}
