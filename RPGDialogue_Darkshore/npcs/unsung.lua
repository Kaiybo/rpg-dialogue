-- Auberdine's shopkeepers (0.39.0): Laird the fishmonger in the inn, Dalmond's general goods,
-- Taldan's drinks, Naram Longclaw's weapons, and Elisa Steelhand, a dwarf selling smithing supplies.
-- Voices: bibles/unsung.md. Forever: Elisa ends Camping 101: Blacksmithing.
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Laird: fish vendor inside Auberdine's inn; Nessa Shadowsong's trading partner.
P:NPC {
  key = "laird", id = TODO_NPC("Laird"), name = "Laird", title = "Fish Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "auberdine" }, temper = { "wry", "competitive" }, values = { "trade", "friendship" },
  notices = { "craft" },
  impression = {
    first = "Laird sells fish in the Auberdine inn and claims the Darkshore coast is more dangerous and more rewarding than anything Teldrassil offers. He talks about Nessa Shadowsong like a rival he would be lost without.",
    third = "{name} met Laird, Auberdine's fishmonger, who trades with Nessa Shadowsong across the water.",
  },

  greetings = {
    { id = "g_default", text = "Fresh off the Darkshore coast this morning, and worth every bit of the trouble it took to catch." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? You've got the look of someone who's had enough of inn stew and wants a proper fish." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "An angler! Then you'll know the murlocs on this coast take more bait than the fish do. Fish near the Sentinels' posts and you'll lose less of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Laird, and I sell fish here in the inn. The Darkshore coast is a rougher place to cast a line than Teldrassil, with the murlocs and the threshers and worse, but the catch is better for it." },
        { id = "h_flight", tags = { "news" }, when = { questActive = TODO_QUEST("Flight to Auberdine") },
          text = "That parcel smells like Rut'theran, so Nessa's sent you. Let me see what she thinks passes for a good catch over there." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Nessa") },
          text = "Take my answer back to Nessa, and tell her the Darkshore catch was bigger this season. She'll argue, but she'll know I'm right." },
      },
      again = {
        { id = "h_again", text = "What else? The fish won't get any fresher while we talk." },
        { id = "h_again2", text = "Go on, then. Shaussiy won't mind as long as you buy something." },
      },
      choices = {
        { text = "Let me see your fish.", next = "BUSINESS" },
        { text = "What makes this coast so dangerous?", next = "coast" },
        { text = "How do you know Nessa Shadowsong?", next = "nessa" },
        { text = "Why sell fish inside the inn?", next = "inn" },
        { text = "Farewell, Laird.", next = "END" },
      },
    },
    coast = {
      lines = {
        { id = "co_default", text = "Murlocs up and down the shore, threshers out past the reefs, and the furbolgs coming down from the hills more angry every season. The fishers here keep a bow beside the net, and none of them would think it strange." },
      },
      choices = {
        { text = "Why do they keep fishing, then?", next = "coast2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coast2 = {
      lines = {
        { id = "co2_default", text = "Because the fish are worth it, and because Auberdine has to eat whether the coast is safe or not. We didn't build a town on this shore to be chased off the beach by murlocs." },
      },
      choices = {
        { text = "That's the right spirit. Hold your ground.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "No catch is worth dying for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nessa = {
      lines = {
        { id = "ne_default", text = "We've traded across the water for years, her catch for mine, and we argue about whose is better every time. She's wrong, of course, but don't tell her I said so, because I'd hate for her to stop sending fish." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = {
        { id = "in_default", text = "Because the travelers coming off the boats come here first, tired and hungry and in no mood to walk the docks. Innkeeper Shaussiy cooks with my fish, and I sell the rest to whoever smells it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell fish in the Auberdine inn. I trade with Nessa Shadowsong in Rut'theran, though we'd both rather argue than admit we're friends." } },
    advice = { { id = "tp_ad", text = "Never fish alone on this coast. Bring a friend, or at least a sharp knife." } },
    _none = { { id = "tp_none", text = "Not a thing, I'm afraid. I only know what swims and what's been caught." } },
  },
}

-- Dalmond: general goods in Auberdine.
P:NPC {
  key = "dalmond", id = TODO_NPC("Dalmond"), name = "Dalmond", title = "General Goods Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "auberdine" }, temper = { "anxious", "conscientious" }, values = { "preparedness", "duty" },
  notices = { "greenness" },
  impression = {
    first = "Dalmond sells general goods in Auberdine and worries out loud about what travelers have forgotten to pack. His anxiety is tiring, but it comes from a good place.",
    third = "{name} met Dalmond, Auberdine's worried general goods vendor.",
  },

  greetings = {
    { id = "g_default", text = "Do you have everything? Water, bread, a spare bag? People always forget something before Darkshore." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, thank the Moon. I worry about everyone who leaves here underprepared." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 13 },
      text = "You've only just come over from Teldrassil, haven't you? Darkshore is not as gentle as home, so please buy more water than you think you'll need." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Dalmond, and I sell general goods here in Auberdine: bread, water, thread and bags. Everything a traveler forgets, I keep, because sooner or later they come back for it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'd rather you asked now than wished you had later." },
        { id = "h_again2", text = "Go on. Have you checked your water skin?" },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What do travelers forget most often?", next = "forget" },
        { text = "Why do you worry so much?", next = "worry" },
        { text = "Goodbye, Dalmond.", next = "END" },
      },
    },
    forget = {
      lines = {
        { id = "fo_default", text = "Water, more than anything, because they think the sea will do. The second is a bag big enough to carry what they find, and the third is a light for the barrows and the caves along the coast." },
      },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry = {
      lines = {
        { id = "wo_default", text = "Because I see them leave and I don't always see them come back. There's something wrong in this forest, the furbolgs and the beasts and the cultists in the hills, and I can't fix any of it, but I can make sure no one goes out hungry." },
      },
      choices = {
        { text = "Worrying won't save anyone. Courage will.", next = "worry2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry2 = {
      lines = {
        { id = "wo2_default", text = "Perhaps, but courage doesn't fill a stomach. Let the brave ones be brave, and let me make sure they have bread when they're done being brave." },
      },
      choices = {
        { text = "Fair enough. Someone has to think ahead.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some things you can't prepare for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_strand" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the general goods in Auberdine. I've seen a lot of young people come through here, and I try to send them out ready." } },
    advice = { { id = "tp_ad", text = "Buy a bigger bag. You'll thank me in a week." } },
    _none = { { id = "tp_none", text = "Oh, I wish I knew. Ask Thundris Windweaver; he knows far more than I do." } },
  },
}

-- Taldan: drink vendor in Auberdine.
P:NPC {
  key = "taldan", id = TODO_NPC("Taldan"), name = "Taldan", title = "Drink Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "auberdine" }, temper = { "genial", "easygoing" }, values = { "hospitality", "simplicity" },
  notices = { "drink", "race" },
  impression = {
    first = "Taldan sells juices and milk in Auberdine and takes real pleasure in a traveler who enjoys a cold drink. He seems to think most troubles look smaller after a cup of moonberry juice.",
    third = "{name} met Taldan, who sells drinks in Auberdine to anyone tired from the road.",
  },

  greetings = {
    { id = "g_default", text = "Thirsty? Of course you are; everyone is, after the walk up from the docks." },
    { id = "g_back", when = { metBefore = true }, text = "There's my moonberry customer. The usual, or something new?" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had something stronger than I sell, I think. Let me give you a cup of water before you fall into the harbor." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, and you're looking at my counter with real disappointment. I'm sorry, I don't sell ale, but my melon juice is very good." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Taldan, and I sell drinks in Auberdine: water, milk and the juices from the groves. Nothing strong, I'm afraid, because the Sentinels prefer the docks quiet, and so do I." },
      },
      again = {
        { id = "h_again", text = "Anything else? Take your time, have a sip." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Let me see your drinks.", next = "BUSINESS" },
        { text = "What's the best thing you sell?", next = "best" },
        { text = "Why nothing stronger?", next = "strong" },
        { text = "Farewell, Taldan.", next = "END" },
      },
    },
    best = {
      lines = {
        { id = "be_default", text = "Moonberry juice, without question. It comes from the groves on Teldrassil, and it tastes like a clear night, if a night could have a taste." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    strong = {
      lines = {
        { id = "st_default", text = "The humans and dwarves coming through want ale, and the innkeeper keeps a little for them. But my people have seen what thirst for stronger things does, and I'd rather sell something that leaves you clear-headed in the morning." },
      },
      choices = {
        { text = "What do you mean, what thirst does?", next = "strong2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strong2 = {
      lines = {
        { id = "st2_default", text = "The Highborne drank from the Well of Eternity until it drowned them, and we've been wary of anything we can't stop drinking ever since. I'm talking about juice and ale, of course, but the lesson still holds." },
      },
      choices = {
        { text = "Moderation is wisdom.", next = "BACK", fx = { align = { order = 1 }, learn = { "highborne" } } },
        { text = "A little ale never drowned anyone.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 }, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    highborne = { { id = "tp_high", text = "They drank from the Well until it swallowed them. My grandmother told me that story whenever I asked for a second cup." } },
    background = { { id = "tp_bg", text = "I sell drinks in Auberdine. Simple work, but nobody's ever unhappy to see me." } },
    _none = { { id = "tp_none", text = "I couldn't say. Have a drink and ask around; someone will know." } },
  },
}

-- Naram Longclaw: weaponsmith in Auberdine.
P:NPC {
  key = "naram", id = TODO_NPC("Naram Longclaw"), name = "Naram Longclaw", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "auberdine" }, temper = { "gruff", "proud" }, values = { "strength", "craft" },
  notices = { "class" },
  impression = {
    first = "Naram Longclaw sells weapons in Auberdine and judges a customer by the scars on their hands. He is gruff, but he takes his trade seriously.",
    third = "{name} met Naram Longclaw, Auberdine's gruff weaponsmith.",
  },

  greetings = {
    { id = "g_default", text = "You'll want a better blade than that if you're heading north. Let me see your hands." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, I see. Either you're good or your blade is, and I'd like to think it's the blade." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like someone who meets the enemy face to face. Good. I've two-handed blades in the back for the likes of you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Naram Longclaw, and I sell weapons here in Auberdine. Darkshore will test whatever you carry, so you'd best carry something worth testing." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick." },
        { id = "h_again2", text = "Ask, if you've something to ask." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What will I need in Darkshore?", next = "need" },
        { text = "Where do your weapons come from?", next = "where" },
        { text = "Farewell, Naram.", next = "END" },
      },
    },
    need = {
      lines = {
        { id = "ne_default", text = "Something heavy for the furbolgs, because their hides are thick, and something quick for the murlocs, because there are always more of them than you'd like. If you're going near the old ruins, bring both." },
      },
      choices = {
        { text = "What's in the ruins?", next = "need2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need2 = {
      lines = {
        { id = "ne2_default", text = "Restless ghosts at Ameth'Aran, and robed cultists out in the hills. I don't know what they want, but I know they don't stop to talk, so neither should you." },
      },
      choices = {
        { text = "Strike first and ask questions later. Agreed.", next = "BACK", fx = { align = { light = -1 }, learn = { "dark_strand" } } },
        { text = "The ghosts deserve rest, not more swords.", next = "BACK", fx = { align = { light = 1 }, learn = { "dark_strand" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Some I make, some come over from Darnassus, and some come on the boat from Menethil, made by dwarves. The dwarven steel is good, I'll admit, though I'd never say so to Elisa." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    dark_strand = { { id = "tp_dark", text = "Robed cultists out in the hills. I don't know their business, and I don't care to, as long as they stay up there." } },
    background = { { id = "tp_bg", text = "I sell weapons in Auberdine. I've sold blades to Sentinels and to fools, and the fools come back less often." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't much care, so do you want a weapon or not?" } },
  },
}

-- Elisa Steelhand: dwarf selling blacksmithing supplies in Auberdine. (Forever: ends Camping 101: Blacksmithing.)
P:NPC {
  key = "elisa", id = TODO_NPC("Elisa Steelhand"), name = "Elisa Steelhand", title = "Blacksmithing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "auberdine" }, temper = { "hearty", "blunt" }, values = { "craft", "trade" },
  notices = { "craft", "race" },
  impression = {
    first = "Elisa Steelhand is a dwarf selling coal and flux among the night elves of Auberdine, and she seems to enjoy being the loudest voice on the docks. She speaks her mind and expects you to speak yours.",
    third = "{name} met Elisa Steelhand, a dwarf who sells blacksmithing supplies in Auberdine.",
  },

  greetings = {
    { id = "g_default", text = "Well, hello there! Need coal, flux or a hammer? I've got all three and opinions on each." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, I was startin' to think the elves had scared you off." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf! Thank the Titans; I've had nobody to talk to about proper ale in weeks." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith, eh? I can tell by your arms. You'll want my coal; the elves don't burn enough of it to keep a decent forge going." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Elisa Steelhand, and I sell blacksmithing supplies here in Auberdine. The elves don't do much smithing themselves, so somebody has to keep the forges fed, and I'm happy for it to be me." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") },
          text = "Somebody told you a smith has a place at a camp, did they? Right enough, there's always a blade to sharpen by the fire, and I'll show you how to rig it." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "You lot have been very welcoming, I'll say that, even if you look at my forge like it's going to set the forest alight. It won't, I promise." },
      },
      again = {
        { id = "h_again", text = "Anything else, then? Speak up, the forge is loud!" },
        { id = "h_again2", text = "What else? I've time for a chat." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What brings a dwarf to Auberdine?", next = "why" },
        { text = "How do the night elves treat you?", next = "elves" },
        { text = "Do you know the dwarves digging south of here?", next = "dig" },
        { text = "Farewell, Elisa.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Business, mostly, because nobody else was selling coal on this side of the sea. When the night elves joined the Alliance, I thought there'd be smiths needing supplies sooner or later, and I wasn't wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = {
        { id = "el_default", text = "Politely, which isn't always the same as warmly. They're a careful folk, and they don't like smoke near their trees. But they buy my flux for their own smiths, so I reckon they've decided I'm useful." },
      },
      choices = {
        { text = "Their caution about fire is fair.", next = "elves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves2 = {
      lines = {
        { id = "el2_default", text = "Aye, it is, and I keep my forge small and my coal dry. But a people that won't learn steel will lose to a people that will, and the orcs in Ashenvale have no such worries." },
      },
      choices = {
        { text = "The forest has to come first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "They'll need forges to win this war.", next = "BACK", fx = { align = { order = 1 }, affinity = 1, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig = {
      lines = {
        { id = "di_default", text = "Prospector Remtravel and his Explorers' League lot, aye. They come up for supplies now and then and tell me about the old elven ruins they're digging, and I nod and sell them shovels." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
  },

  topics = {
    explorers_league = { { id = "tp_el", text = "Remtravel's lot dig south of here. Good customers, terrible singers." } },
    warsong = { { id = "tp_ws", text = "The orcs are cutting into Ashenvale with steel axes. The elves'll need steel of their own soon enough." } },
    background = { { id = "tp_bg", text = "I'm from Dun Morogh, and I sell smithing supplies in Auberdine. Long way from home, but the work's good." } },
    _none = { { id = "tp_none", text = "Ha! No idea, {g:lad|lass}. Ask one of the elves; they've been around long enough to know everything." } },
  },
}
