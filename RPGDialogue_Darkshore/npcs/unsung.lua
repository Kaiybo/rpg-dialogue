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
    first = "He talks about Nessa Shadowsong like a rival he'd be lost without.",
    third = "{name} met Laird, Auberdine's fishmonger, who trades with Nessa Shadowsong across the water.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah! Fresh off the Darkshore coast this morning, and worth every murloc bite it took to catch, which was three." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? You've got the look of someone who's had enough of inn stew and wants a proper fish." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "An angler! Then you'll know the murlocs on this coast take more bait than the fish do. Fish near the Sentinels' posts and you'll lose less of it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It is, for fishing, though Nessa Shadowsong over in Rut'theran would argue. Ask your water spirits, and I'd wager they side with me." } },
      choices = {
        { text = "Fair fishing on a fair coast, Laird.", next = "BACK", reply = "Fair fishing, aye, and a fair price for it at my stall. Nessa can keep her opinions on her own side of the water.", fx = { align = { honor = 1 } } },
        { text = "Fish wherever pays best.", next = "BACK", reply = "Spoken like a man from Menethil, and I can't say you're wrong. Still, the best fish are where the murlocs are, so mind yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The fish are fine, mostly, though I've pulled up a few with grey gills and cloudy eyes, and I throw those straight back. Nessa says I'm imagining it, but she doesn't gut as many as I do." } },
      choices = {
        { text = "Warn your customers about the sick fish, even if it costs you.", next = "BACK", reply = "You're right, and I do, though it's cost me a few sales. Better poorer than the man who sold Auberdine a sick supper.", fx = { align = { honor = 1 } } },
        { text = "Sell the good ones and keep quiet about the rest.", next = "BACK", reply = "I could, I suppose, but I'd not sleep well, and neither would my customers. I'll keep throwing them back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Worse, because the Greymist come up the beach at night and take whatever's left in the nets. Teldrassil's soft by comparison, whatever Nessa says, so if you want a real fight, walk the shore at dusk." } },
      choices = {
        { text = "I'll walk the shore and clear them off your nets.", next = "BACK", reply = "Would you really? The Greymist won't like it, but my nets will, and so will half the village.", fx = { align = { honor = 1 } } },
        { text = "Fight murlocs over fish? Not likely.", next = "BACK", reply = "Most folk say the same, and the murlocs know it. More fish for them, I suppose.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Closer every season, and they'll snap at a line hard enough to pull a man in. I'd not swim off the Darkshore docks for any wager, and I've lost a few wagers to Nessa in my time." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Closer every season, and they'll snap at a line hard enough to pull a man in. Your {pet} looks hungry, and I'd swear it knows exactly which basket is the fresh one. Clever beast, cleverer than half my customers." },
      },
      choices = {
        { text = "I'll leave the threshers be. The sea is theirs.", next = "BACK", reply = "That's wise. A thresher took my brother's boat, oars and all, and he only just kept his legs.", fx = { align = { light = 1 } } },
        { text = "I'll hunt the threshers down and sell the meat.", next = "BACK", reply = "Bring me a thresher and I'll buy every pound of it, though you'll be the one rowing out. Mind your fingers.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Quietly or loudly, I'd thank you either way, for they steal from my nets every night. They gather thickest down the coast where the threshers come in close." },
      },
      choices = {
        { text = "I'll do it cleanly, Laird.", next = "BACK", reply = "Cleanly or not, I'll be grateful. I've mended those nets so often they're more knot than net.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll never know what hit them.", next = "BACK", reply = "That's the spirit, and I'll not ask what you did to them. Just leave the bodies off my beach.", fx = { align = { honor = -1 } } },
        { text = "What's the coast like?", next = "coast" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Mages? They're polite enough, I'd say, but polite isn't fond, and you'll likely get the room by the dock. Don't take it to heart, for they've had ten thousand years to nurse a grudge, and it shows." },
      },
      choices = {
        { text = "I'll earn their respect in time.", next = "BACK", reply = "You will, I think, if you give them a few decades. Elves are patient, but so are fish, and I've caught plenty of those.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Their grudge is their own business.", next = "BACK", reply = "It is, and I'd not try to change their minds. The room by the dock has a fine view of the boats, at least.", fx = { align = { order = -1 } } },
        { text = "Who's Nessa, then?", next = "nessa" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'd take a blessing on the nets and another on the boat, if you're offering, because the coast is unkind this season. Nessa would call it superstition, but Nessa doesn't fish past the reefs." } },
      choices = {
        { text = "I'll bless them gladly. A fisher needs all the help.", next = "BACK", reply = "Bless you, and bless the boat twice if you've breath for it. She leaks on the left side, so aim a little that way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers are for people, Laird, not for nets.", next = "BACK", reply = "Maybe so, but the nets feed people, and people need all the blessings they can get. I'll take one for the boat, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I wouldn't say no, because the Greymist come up the beach at night and the Sentinels can't watch every net. A paladin on the shore would let us fish without one eye on the waterline." } },
      choices = {
        { text = "I'll stand guard while you fish, then.", next = "BACK", reply = "You'd stand guard over a fisherman? Well, I'll not argue, and the Greymist will think twice with you on the beach.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The fishers chose the coast. Let them guard it.", next = "BACK", reply = "We did, and we'll keep doing it, as we always have. A bit of help wouldn't go amiss, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Hardly any, and the Sentinels watch the ones who come the way a heron watches a shallow. Nessa over in Rut'theran would tell you I'll sell to anyone, and for once she's right, because coin doesn't smell of sulphur." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Hardly any, and the Sentinels watch the ones who come the way a heron watches a shallow. They're watching you right now, because that thing at your heel has every guard on the pier fingering a glaive, but coin doesn't smell of sulphur, even if your servant does." },
      },
      choices = {
        { text = "The Sentinels are right to watch us. I would.", next = "BACK", reply = "Honest of you, and I think they'd like you better for saying it. Most of your kind bristle at the watching.", fx = { align = { order = 1 } } },
        { text = "Good. Business is business, Laird.", next = "BACK", reply = "It is, and I'll sell you fish the same as anyone. Just don't bring your friend near the stall.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    dd_murk = {
      lines = {
        { id = "ddm_default", text = "No, and I wrote to Nessa across the water the same night to tell her so. She'll have the news all over Rut'theran by now, and she'll tell it better than I can, because she always does." },
      },
      choices = {
        { text = "Was Murkdeep really sinking boats?", next = "dd_murk2" },
        { text = "Something else, Laird.", next = "BACK" },
      },
    },
    dd_murk2 = {
      lines = {
        { id = "ddm2_default", text = "Not with his own hands, maybe, but his murlocs cut lines, stole nets and waited in the shallows for anyone fool enough to wade out. Two of my lads came home bitten, and one of them hasn't fished since." },
      },
      choices = {
        { text = "Tell your lad the water's safe again.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_murk", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Murkdeep!") }, text = "My boats went out past the point this morning without a single spear between them, and that's because of you. Murkdeep cost me two nets and a summer of good catch, so whatever fish you want, you've my thanks to go with it." },
        { id = "h_dd_pole", when = { questDone = TODO_QUEST("The Family and the Fishing Pole") }, text = "Gubber says he gave you his family's fishing pole, which is more than he's ever given me. If you catch anything worth selling with it, bring it here before he sees it." },
        { id = "h_dd_drown", when = { deathCause = "drowning" }, text = "You've drowned before, I can tell; you stand back from the edge of the pier like the water owes you money. Darkshore's tides pull hard, so swim with the shore in sight." },
        { id = "h_default", text = "I'm Laird, and I sell fish here in the inn. The Darkshore coast is a rougher place to cast a line than Teldrassil, with the murlocs and the threshers and worse, but the catch is better for it, whatever my old friend Nessa Shadowsong says over in Rut'theran." },
        { id = "h_flight", tags = { "news" }, when = { questActive = TODO_QUEST("Flight to Auberdine") },
          text = "That parcel smells like Rut'theran, so Nessa's sent you. Let me see what she thinks passes for a good catch over there." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Nessa") },
          text = "Take my answer back to Nessa, and tell her the Darkshore catch was bigger this season. She'll argue, but she'll know I'm right." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Mind the fish, because they bite harder than they look, and so do the murlocs on this coast." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll want fish for that companion, I expect, and I'll tell you what Nessa won't, which is that mine are fresher." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll bless a fisherman's nets, I hope, because the murlocs have been at mine every night this week." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, buying fish! Now I've seen everything, though I suppose even the Silver Hand has to eat." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, eh? Then I hope you'll tell me the threshers out there are only hungry and not sick, because I've been eating what I catch." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll sell you fish like anyone else, but keep your little friend away from the crates, because I've seen what an imp does to a fresh catch." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Darkshore's coast is more dangerous than Teldrassil's and more generous for it, and I'd wager your water spirits agree." },
      },
      again = {
        { id = "h_again", text = "What else? The fish won't get any fresher while we talk." },
        { id = "h_again2", text = "Go on, then. Shaussiy won't mind as long as you buy something." },
      },
      choices = {
        { text = "Murkdeep won't sink any more of your boats.", next = "dd_murk", when = { questDone = TODO_QUEST("WANTED: Murkdeep!") } },
        { text = "Let me see your fish.", next = "BUSINESS" },
        { text = "This coast seems a dangerous one.", next = "coast" },
        { text = "You must know Nessa Shadowsong.", next = "nessa" },
        { text = "Why sell fish inside the inn?", next = "inn" },
        { text = "Murlocs at your nets? I could thin them quietly.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I suppose the elves don't like my sort much.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "They say the murlocs on this coast are bad.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the threshers hunt close to shore here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you want your nets blessed, Laird?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should a paladin be guarding the fishers on this coast?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is something wrong with the catch along this coast, Laird?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you get many warlocks through Auberdine, Laird?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is Darkshore really better than Teldrassil, Laird?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "That's the right spirit. Hold your ground.", next = "BACK", reply = "That's the only spirit Auberdine has ever known. My grandfather fished this shore, murlocs and all, and so will I.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "No catch is worth dying for.", next = "BACK", reply = "No, it isn't, and I've lost friends who learned that too late. But the village still has to eat.", fx = { align = { honor = -1 } } },
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
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay pays well for fresh fish and badly for anything else. Nessa says I'd last a week there, and she's probably right." } },
    ratchet = { { id = "tp_ratchet", text = "I went to Ratchet's fishing contest once and came home with a sunburn and no prize. Don't tell Nessa I admitted it." } },
    theramore = { { id = "tp_theramore", text = "Theramore's boats come in smelling of marsh, and the sailors want fish that doesn't. I sell them plenty." } },
    _none = { { id = "tp_none", text = "Not a thing, I'm afraid. I only know what swims and what's been caught, and Elune knows that's enough for one life." } },
  },
}

-- Dalmond: general goods in Auberdine.
P:NPC {
  key = "dalmond", id = TODO_NPC("Dalmond"), name = "Dalmond", title = "General Goods Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "auberdine" }, temper = { "anxious", "conscientious" }, values = { "preparedness", "duty" },
  notices = { "greenness" },
  impression = {
    first = "His worrying is tiring, but it comes from a good place.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They always do, and it worries me, because carelessness gets people killed out here. I'd guess your elements forgive it no more than Darkshore does." } },
      choices = {
        { text = "You are right, Dalmond. Preparation saves lives.", next = "BACK", reply = "They do, and I'm glad someone listens. You wouldn't believe how many come back to me soaked and starving.", fx = { align = { order = 1 } } },
        { text = "I travel light and trust the spirits.", next = "BACK", reply = "Then travel light, but take a waterskin at least. The streams up the coast taste of that moss.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Thread and bandages, and waterskins above all, because they tell me the streams up the coast aren't safe to drink from any more. That worries me more than I like to say, since nobody knows water better than a druid." } },
      choices = {
        { text = "Better to be prepared. I'll buy what I need before I go.", next = "BACK", reply = "Wise. Water first, bread second, and a spare bag if you've the coin.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land provides. I'll trust it over a shop shelf.", next = "BACK", reply = "It does, in a better season, but not this one. Take a waterskin anyway, druid.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Thread, for one, because you'll tear your gear on the brambles before any furbolg touches you, and bags to carry the spoils you take. I can't sell you courage, though, so I'll trust you to bring your own." } },
      choices = {
        { text = "Thread and bags. You're right, I'll stock up.", next = "BACK", reply = "Good, and you'll thank me when the brambles start tearing. I've sold more thread this season than in the last three.", fx = { align = { order = 1 } } },
        { text = "I travel light. Spoils can stay where they fall.", next = "BACK", reply = "Then you'll leave a lot of good loot lying in the moss, warrior, and the murlocs will thank you.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Water for themselves and the beast, because the coast is salt and the streams near the Blackwood camps aren't fit to drink. I'd hate for you to reach the cliffs and find you've nothing clean between you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Water for themselves and the beast, because the coast is salt and the streams near the Blackwood camps aren't fit to drink. And your {pet} will need feeding too, won't it? Please tell me you've something for it in your pack." },
      },
      choices = {
        { text = "I'll stock up. Better safe than parched.", next = "BACK", reply = "Good. It's strange, I know, but the coast is very dry for something so wet.", fx = { align = { order = 1 } } },
        { text = "The land provides. I'll find what we need.", next = "BACK", reply = "It does, mostly, but not near the Blackwood camps. Be careful what you drink.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Most do, and for the ones who don't, I keep their things a season and then sell them fairly. I'd ask you to do the same if you ever find a purse on the dock." },
      },
      choices = {
        { text = "I'd return it, Dalmond.", next = "BACK", reply = "Thank you, and I knew you would. The last traveller who found my ledger kept it for a week.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Finders keepers, where I'm from.", next = "BACK", reply = "Not where I'm from, and not in Auberdine either. Mind the Sentinels if you try it.", fx = { align = { honor = -1 } } },
        { text = "What do people forget most?", next = "forget" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "I sell candles, plain ones, for reading and for finding your way in the dark. If you need black ones, I'd rather not know what for, and I'd ask you not to light them in Auberdine." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, text = "I sell candles, plain ones, for reading and for finding your way in the dark. Your demon is looking at my shelf as if it expects black ones, and I'd rather it didn't, so I'll ask you to buy what you need and not light anything in Auberdine." },
      },
      choices = {
        { text = "Plain candles are fine. Nothing dark here.", next = "BACK", reply = "Good, then you're welcome to them. I'll not ask about the rest.", fx = { align = { light = 1 } } },
        { text = "Some work needs darker light than reading.", next = "BACK", reply = "Then I'd rather not know what you read by it. Plain candles, please.", fx = { align = { light = -1 } } },
        { text = "Why do you worry about travelers?", next = "worry" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because you spend your supplies on everyone else and forget yourselves, and then you're bleeding on the road with nothing left. I'd feel much better if you bought a few extra, for your own sake." } },
      choices = {
        { text = "I'll carry extra and share it where it's needed.", next = "BACK", reply = "Then you're a kinder priest than most, and wiser too. Take a little extra for yourself as well.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll keep my supplies for myself this time.", next = "BACK", reply = "That's sensible, and I'll not argue it. You'll be no use to anyone fainting by the roadside.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not unprepared, exactly, but everyone forgets something, and paladins forget food most of all. The Darkshore road is long and the inns are few, so please take more water than you think you'll need." } },
      choices = {
        { text = "I'll take your advice, Dalmond. Thank you.", next = "BACK", reply = "You're welcome. It's a long walk to the Grove of the Ancients, and there's no inn on the way.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll pack as I see fit, thank you.", next = "BACK", reply = "As you like, paladin. I'll be here when you run out, and I won't say a word about it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "All the time, and then they're stuck on the docks waiting for a boat like everyone else, looking very cross. I don't sell runes, I'm afraid, because the kaldorei here won't stock them, so you'll have to go to Darnassus or across to Menethil if you've run out." },
      },
      choices = {
        { text = "I'll check my packs. Thank you for the warning.", next = "BACK", reply = "Thank you, and I hope it saves you a wait on the docks. They do look very cross.", fx = { align = { order = 1 } } },
        { text = "Worry less, Dalmond. Mages manage.", next = "BACK", reply = "They do, mostly, after a long wait on the docks. I'll keep worrying anyway, it's my job.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Dalmond, and I sell general goods here in Auberdine: bread, water, thread and bags. Everything a traveller forgets, I keep, because sooner or later they come back for it; last week it was a dwarf's left boot, and he'd walked halfway to Bashal'Aran before he noticed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Please tell me you've packed water, because warriors never pack water, and then they faint on the road to Ashenvale." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Do you have enough arrows? Hunters always run out of arrows at the worst moment, I've heard." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, I do hope you've packed enough bandages, because priests always give theirs away and then have none left for themselves." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your armour must want oiling after that sea crossing, and I'd hate for it to rust before you reach the furbolgs." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I suppose you can sleep in a tree and eat whatever the forest gives you, but take some bread anyway, because the forest here isn't giving much lately." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Have you got your reagents? You'd be amazed how many mages come through Auberdine without a single rune in their packs." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Have you packed everything, rope and water and bandages? Elune watches over travellers, but neither she nor your spirits will pack for you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'd rather you asked now than wished you had later." },
        { id = "h_again2", text = "Go on. Have you checked your water skin?" },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Travelers must forget all sorts of things.", next = "forget" },
        { text = "Why do you worry so much?", next = "worry" },
        { text = "Everything travelers forget, you keep. I'd guess few come back.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you sell anything a warrior actually needs?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What does a hunter forget to pack, Dalmond?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you sell candles? Black ones, ideally.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why worry about priests running short?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do I look unprepared to you, Dalmond?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do druids buy much from you, Dalmond?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do mages really forget their reagents so often?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do travellers often forget things, Dalmond?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Smart. Someone has to think ahead.", next = "BACK", reply = "Someone does, and it's usually me. Nobody ever thanks the one who packed the bread.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some things you can't prepare for.", next = "BACK", reply = "There are, and I can't prepare for them either. But I can prepare for hunger.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_strand" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the general goods in Auberdine. I've seen a lot of young people come through here, and I try to send them out with a spare bag and dry socks, since their mothers clearly didn't." } },
    advice = { { id = "tp_ad", text = "Buy a bigger bag. You'll thank me in a week." } },
    booty_bay = { { id = "tp_booty_bay", text = "Young folk come through on their way to anywhere, and some of them mean to get to Booty Bay. I give them a spare bag and tell them to keep their purses in it." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Darkmoon Faire's been near, everyone comes in with no money and wants credit. I give a little, because I remember being young." } },
    theramore = { { id = "tp_theramore", text = "Theramore's sailors buy socks, of all things. Something about the marsh, they say." } },
    _none = { { id = "tp_none", text = "Oh, I wish I knew. Ask Thundris Windweaver; he has been elder here longer than I have been alive, and he knows far more than I do." } },
  },
}

-- Taldan: drink vendor in Auberdine.
P:NPC {
  key = "taldan", id = TODO_NPC("Taldan"), name = "Taldan", title = "Drink Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "auberdine" }, temper = { "genial", "easygoing" }, values = { "hospitality", "simplicity" },
  notices = { "drink", "race" },
  impression = {
    first = "He thinks most troubles look smaller after a cup of moonberry juice.",
    third = "{name} met Taldan, who sells drinks in Auberdine to anyone tired from the road.",
  },

  greetings = {
    { id = "g_default", text = "Elune's light on you. Thirsty? Of course you are; everyone is, after the walk up from the docks." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I do, because troubles look smaller after a cup and the furbolgs look further away. Perhaps your spirits would agree." } },
      choices = {
        { text = "Kindness in a cup, Taldan. I accept.", next = "BACK", reply = "Then let me pour you a cup, and the troubles can wait outside the awning.", fx = { align = { light = 1 } } },
        { text = "Drinks do not fix troubles.", next = "BACK", reply = "No, but they make them easier to carry for an evening. That's all I promise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A little hollow north of the village, past the old ruins, and the druids keep the sickness out of it as best they can. I don't ask how they do it, because I'm only a man who sells juice, but I'm grateful every time I pour a cup." } },
      choices = {
        { text = "The grove belongs to the Circle. Pick only what they allow.", next = "BACK", reply = "That's the right way, and the druids will thank you for it. The grove up the coast is the only clean one left.", fx = { align = { order = 1 } } },
        { text = "Berries grow for everyone. Pick whatever the village needs.", next = "BACK", reply = "They do, but not in this season, with the sickness creeping in. The druids decide, and I respect it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than they'd admit, because a clear head keeps you alive longer than a brave one when the furbolgs come out of the trees. The Sentinels drink my juice before they patrol, and not one of them has complained." } },
      choices = {
        { text = "Clear head, steady hand. I'll take a cup.", next = "BACK", reply = "Good. I've watched too many sailors stagger off the Bravery and straight into the sea.", fx = { align = { order = 1 } } },
        { text = "I'd rather have something stronger.", next = "BACK", reply = "Then you'll need to take the boat to Menethil, I'm afraid. I sell juice and water, mostly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Moonberries from the hills behind Auberdine, picked fresh, though the pickers won't go far now that the thistle bears have gone mad. If you're hunting out that way, a few safe pickers would do us all a world of good." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Moonberries from the hills behind Auberdine, picked fresh, though the pickers won't go far now that the thistle bears have gone mad. Your {pet} looks thirsty, and there's a trough behind the inn where the Sentinels water their sabers. It's cleaner than anything you'll find in the streams." },
      },
      choices = {
        { text = "I'll keep the bears away from your pickers.", next = "BACK", reply = "Would you? The pickers would be so grateful, and so would I. The bears have been terrible.", fx = { align = { honor = 1 } } },
        { text = "Your pickers can look after themselves.", next = "BACK", reply = "They can, mostly, but the bears are bigger than they are. A little help wouldn't hurt.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "That's kind, but the cellar keeps it cool enough, and the Sentinels would rather not see magic over the counter. My elders remember the Highborne at their worst, and none of them likes a spell anywhere near a drink." },
      },
      choices = {
        { text = "Of course. Nothing over the counter.", next = "BACK", reply = "Thank you. A cold cup is nice, but it's not worth a Sentinel's glare.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little magic never spoiled a drink.", next = "BACK", reply = "It did once, ten thousand years ago, and we've not forgotten. Keep it off my counter, please.", fx = { align = { order = -1 } } },
        { text = "What's best here?", next = "best" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "To the boats, mostly, and back to Menethil, where they say the ale's better. I won't point you to anyone selling it under the dock, if that's what you're asking." },
      },
      choices = {
        { text = "Just asking. Juice is fine.", next = "BACK", reply = "Juice is lovely, and it keeps better on the road than ale ever did. Moonberry, perhaps?", fx = { align = { honor = 1 } } },
        { text = "I'll find it myself, then.", next = "BACK", reply = "Then you'll find it on the boats, and good luck to you. I'll not point the way.", fx = { align = { honor = -1 } } },
        { text = "Why nothing strong?", next = "strong" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now and then, on their way to the Temple or off to tend the sick up the coast, and they're always thirsty. It is hard work, praying over the hurt, and it goes easier with a full cup." } },
      choices = {
        { text = "I'll take that cup. Thank you, Taldan.", next = "BACK", reply = "You're welcome, priest. Drink it slowly; the berries are tart this season.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I've no time for juice, Taldan.", next = "BACK", reply = "Then take it with you, at least, for the road is long. A healer needs to drink too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Sentinels say it does, and I believe them, for the furbolgs come closer every season. I sell drinks rather than swords, but I'd be glad to see you on the road north." } },
      choices = {
        { text = "I'll guard the road north for Auberdine's sake.", next = "BACK", reply = "Then Auberdine will be grateful, and so will I. Glynda's Sentinels have been on the north road three nights running.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the Sentinels guard it. I'm passing through.", next = "BACK", reply = "They will, as best they can, and I'll pray they manage. Safe travels, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I think most troubles look smaller after a cold cup, and I've seen a great many troubled faces come off the boats. Yours is no worse than most, though I'll ask your little friend not to drink straight from the jug." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I think most troubles look smaller after a cold cup, and I've seen a great many troubled faces come off the boats. Your {pet} is a new one, I'll give it that, though I'll ask it not to drink straight from the jug, whatever it's peering at in there." },
      },
      choices = {
        { text = "Thank you. A little kindness goes a long way.", next = "BACK", reply = "It does, and it costs me nothing but a cup. Come back any time.", fx = { align = { light = 1 } } },
        { text = "Your kindness is wasted on me, Taldan.", next = "BACK", reply = "Perhaps it is, but I'd rather waste it than keep it. Come back anyway.", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Taldan, and I sell drinks in Auberdine: water, milk and the juices from the groves. Nothing strong, I'm afraid, because the Sentinels prefer the docks quiet, and so do I." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! A cold cup of moonberry juice, perhaps, before you go and hit something?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll want water for your skin, and something for the companion, I suppose." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Have a cup of moonberry juice before you go, because I've yet to meet a priest who remembers to drink." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Something cool to drink, then, because that armour must be hot work on the Darkshore road." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Then you'll know the moonberry juice when you taste it, because the berries come from one of the last clean groves up the coast." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Would you like a cold cup of moonberry juice? You look as though you've had a long night with something unpleasant, and it does help." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! A cold cup of moonberry juice makes most troubles look smaller, and I wonder, do your spirits drink?" },
      },
      again = {
        { id = "h_again", text = "Something more? Sit, have a sip of moonberry juice, and ask." },
        { id = "h_again2", text = "Go on, I'm listening, as patient as the moon on the water." },
      },
      choices = {
        { text = "Let me see your drinks.", next = "BUSINESS" },
        { text = "Something here must be your best seller.", next = "best" },
        { text = "I'd have expected something stronger than juice.", next = "strong" },
        { text = "I could chill your juice with a word.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Nothing strong? Where do the sailors go for a real drink?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors ever drink juice before a fight?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your juices come from Darkshore's groves, Taldan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do priests often come through Auberdine?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Auberdine need guarding as much as people say?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Which grove do the moonberries come from, Taldan?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you really think juice fixes a warlock's troubles?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think a good drink helps troubles, Taldan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Taldan.", next = "END" },
      },
    },
    best = {
      lines = {
        { id = "be_default", text = "Moonberry juice, without question. It comes from a clean grove up the coast, and it tastes like a clear night, if a night could have a taste." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    strong = {
      lines = {
        { id = "st_default", text = "The humans and dwarves coming through want ale, and the innkeeper keeps a little for them. But my people have seen what thirst for stronger things does, so I sell what leaves you clear-headed in the morning." },
      },
      choices = {
        { text = "I'm not sure what you mean about thirst.", next = "strong2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strong2 = {
      lines = {
        { id = "st2_default", text = "The Highborne drank from the Well of Eternity until it drowned them, and we've been wary of anything we can't stop drinking ever since. I'm talking about juice and ale, of course, but the lesson still holds." },
      },
      choices = {
        { text = "Moderation is wisdom.", next = "BACK", reply = "It is, and I wish the sailors off the Bravery believed it. Moonberry, then?", fx = { align = { order = 1 }, learn = { "highborne" } } },
        { text = "A little ale never drowned anyone.", next = "BACK", reply = "Perhaps not, but the Highborne would disagree. Moderation, friend.", fx = { align = { order = -1 }, trait = { witty = 1 }, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    highborne = { { id = "tp_high", text = "They drank from the Well until it swallowed them. My grandmother told me that story whenever I asked for a second cup." } },
    background = { { id = "tp_bg", text = "I sell drinks in Auberdine. Simple work, and nobody's ever unhappy to see me, unless I've run out of moonberry juice." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay drinks rum and calls it food, sailors say. I'll stick with my moonberry juice, and my customers' livers will thank me." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire sells a drink that changes colour while you drink it, I'm told. I've tried to copy it, and mine just goes brown." } },
    everlook = { { id = "tp_everlook", text = "Everlook's goblins sell a hot cider for the cold that I'd dearly love the recipe for. They want gold for it, of course." } },
    _none = { { id = "tp_none", text = "I couldn't say. Have a drink and ask around, for someone in Auberdine will remember." } },
  },
}

-- Naram Longclaw: weaponsmith in Auberdine.
P:NPC {
  key = "naram", id = TODO_NPC("Naram Longclaw"), name = "Naram Longclaw", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "auberdine" }, temper = { "gruff", "proud" }, values = { "strength", "craft" },
  notices = { "class" },
  impression = {
    first = "He judges a customer by the scars on their hands.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They tell me you have fought and lived, which is all I ask. Your spirits may guard you, but a good blade guards you better." } },
      choices = {
        { text = "Then I will choose a blade fairly, Naram.", next = "BACK", reply = "Good, then hold out your hand and let me see your grip. Most shamans come to me wanting something too heavy.", fx = { align = { honor = 1 } } },
        { text = "My spirits are blade enough.", next = "BACK", reply = "Then I hope they never fail you. I've buried one shaman who thought the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because a bear doesn't need a sword, I suppose, and the Circle teaches that steel should come last. I respect that, though I've seen enough of the Blackwood to keep a blade by my bed all the same." } },
      choices = {
        { text = "The Circle's right. Steel should come after every other way.", next = "BACK", reply = "It should, and I respect the Circle for it. But a bear can't always reach the enemy.", fx = { align = { honor = 1 } } },
        { text = "Whatever wins the fight is the right weapon.", next = "BACK", reply = "That's a smith's answer, and I agree with it. Keep it quiet in Darnassus, though.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That you've been hit and kept fighting, which is all I ask of a customer. Darkshore will add a few more, so carry a blade you trust, because the furbolgs don't give second chances." } },
      choices = {
        { text = "Each scar was a lesson. I learned from them.", next = "BACK", reply = "Then you're a warrior worth arming. The furbolgs will happily add a few more lessons.", fx = { align = { order = 1 } } },
        { text = "Each scar was a fight I walked away from.", next = "BACK", reply = "That's a fine way to look at it, and a lucky one. May you walk away from many more.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "An axe or a spear, something with reach and weight, because when a thistle bear gets inside your bow it won't care about your aim. I've sold plenty of hunters a spear, and none of them came back to complain." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An axe or a spear, something with reach and weight, because when a thistle bear gets inside your bow it won't care about your aim. Your {pet} has better teeth than anything I sell, I'll give it that. Still, carry something for the times it can't reach you." },
      },
      choices = {
        { text = "I'll carry a spear for when the bear gets close.", next = "BACK", reply = "Good. A bear can't maul what it can't reach.", fx = { align = { order = 1 } } },
        { text = "Close quarters is my companion's job.", next = "BACK", reply = "Then I hope your companion is very big, hunter. Bears are bigger.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Daggers, then, and short ones, for Darkshore's fights are close ones among the trees. I'll show you how the kaldorei balance a blade, which is not how the humans do it." },
        { id = "xro_nightelf", when = { race = "NightElf" }, text = "Daggers, then, as a kaldorei should carry them, short and close for fighting among the trees. Let me show you how a blade ought to sit in the hand, for the ones from Menethil never do." },
      },
      choices = {
        { text = "Teach me the kaldorei way.", next = "BACK", reply = "Gladly. Pick it up, and you'll find it lighter in the hand than you expect.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Balance is balance. I'll judge it myself.", next = "BACK", reply = "Then judge it, and see if it isn't the kaldorei way you come back to. Most do.", fx = { align = { order = -1 } } },
        { text = "Where do your weapons come from?", next = "where" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "A few, plain wood from Ashenvale, and I keep nothing with old runes on it. If you want an enchanted staff, look in the human cities, and ask them where it came from." },
      },
      choices = {
        { text = "Plain wood suits me fine.", next = "BACK", reply = "Good. Plain wood has never once whispered to the one who carries it.", fx = { align = { order = 1 } } },
        { text = "Runes are only dangerous to fools.", next = "BACK", reply = "They are, and the fools are usually the ones who pick them up. Plain wood, please.", fx = { align = { order = -1 } } },
        { text = "What should I carry, then?", next = "need" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "If you mean to walk in Darkshore, yes, and I'd not trust anyone who says otherwise. A good staff costs nothing to carry, and it might keep you alive long enough to heal yourself." } },
      choices = {
        { text = "Healing comes first, but I'll carry something to defend myself.", next = "BACK", reply = "That's sensible. A good ironwood staff will turn a furbolg's club and still lean nicely by the bedside.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better a weapon than a prayer in the woods.", next = "BACK", reply = "In these woods, I'd agree with you. A weapon and a prayer are better still.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Something heavy, for the bears and the furbolgs both, and the strength to swing it twice. Your order fights for others, they say, so you'd best be sure your weapon is worthy of them." } },
      choices = {
        { text = "My weapon serves those who can't protect themselves.", next = "BACK", reply = "Then you're a paladin worth arming, and I'll find you something heavy. The bears won't like it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My weapon serves me, and nobody else.", next = "BACK", reply = "Then you're a paladin worth watching, and I'll still sell you something heavy. Use it well.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Nothing, until it turns on you, and from what I've heard of the Dark Strand up at the Tower of Althalaxx, they always do sooner or later. Buy a dagger at least, so that when it happens you've something better than a curse in your hand." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Nothing, until it turns on you, and from what I've heard of the Dark Strand, they always do sooner or later. That one's watching your back a little too closely for my liking, so buy a dagger at least, and keep it where it can see you've got it." },
      },
      choices = {
        { text = "Fair advice. I'll take a dagger.", next = "BACK", reply = "Good, and you'll be glad of it when your servant turns. They always do.", fx = { align = { order = 1 } } },
        { text = "My servant won't turn. I hold the leash.", next = "BACK", reply = "Then I hope you hold it tightly, warlock. The Dark Strand held theirs too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Naram Longclaw, and I sell weapons here in Auberdine. Darkshore will test whatever you carry, as it has tested my people since the Sundering, so you'd best carry something worth testing." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Let me see your hands, because scars tell me more than any boast." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your hands are cleaner than a warrior's, but there's a bowstring callus on them, so you'll do." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want a staff, or a mace, because prayers don't stop a furbolg mid-swing, whatever the Temple says." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Show me your hands, then, because I'd like to see if you've used that hammer as much as you've carried it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, with claws of your own when you need them. Most of your kind walk straight past my stall, but a staff still breaks, and I sell good staves." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, with soft hands. You let something else do your fighting, I see, and you'll not find much in my racks for that." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Show me your hands, for scars tell me more than words, and your spirits may have given you some." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick; the satyrs in the hills don't wait on talk." },
        { id = "h_again2", text = "Ask, if you've something to ask." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What will I need in Darkshore?", next = "need" },
        { text = "Where do your weapons come from?", next = "where" },
        { text = "I prefer daggers. Have you anything with good balance?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Mages carry staves. Do you sell any?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do my scars tell you, Naram?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What weapon should a hunter keep for close quarters?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a priest carry a weapon at all, Naram?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a paladin need to fight in Darkshore?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do you think druids rarely carry a blade, Naram?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What's wrong with letting my servant fight, Naram?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do my scars tell you, Naram?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Naram.", next = "END" },
      },
    },
    need = {
      lines = {
        { id = "ne_default", text = "Something heavy for the furbolgs, because their hides are thick, and something quick for the murlocs, because there are always more of them than you'd like. If you're going near the old ruins, bring both." },
      },
      choices = {
        { text = "Something must be stirring in those ruins.", next = "need2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need2 = {
      lines = {
        { id = "ne2_default", text = "Restless ghosts at Ameth'Aran, and robed cultists out in the hills. I don't know what they want, but I know they don't stop to talk, so neither should you." },
      },
      choices = {
        { text = "Strike first and ask questions later. Agreed.", next = "BACK", reply = "Agreed, and I'll arm you for it. The cultists at the Glaive won't give you time for questions anyway.", fx = { align = { light = -1 }, learn = { "dark_strand" } } },
        { text = "The ghosts deserve rest, not more swords.", next = "BACK", reply = "They do, and I'd not argue it. But the cultists deserve swords.", fx = { align = { light = 1 }, learn = { "dark_strand" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Some I make, some come over from Darnassus, and some come on the boat from Menethil, made by dwarves. The dwarven steel is good, I'll admit, though I'd never say so to Elisa Steelhand at the forge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    dark_strand = { { id = "tp_dark", text = "Robed cultists out in the hills. I don't know their business, and I don't care to, as long as they stay up there." } },
    background = { { id = "tp_bg", text = "I sell weapons in Auberdine. I've sold blades to Sentinels and to fools, and the fools come back less often, usually carried." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom's where blades go to rust. If you're going in, buy two, and dry them after." } },
    warsong = { { id = "tp_warsong", text = "Warsong axes are heavy and cruel, and I've repaired a few Sentinel blades that blocked them. Buy something thick." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "There's an arena in Stranglethorn where fools fight for gold. I've sold to a few who went there, and none came back to complain." } },
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
    first = "She speaks her mind and expects me to speak mine.",
    third = "{name} met Elisa Steelhand, a dwarf who sells blacksmithing supplies in Auberdine.",
  },

  greetings = {
    { id = "g_default", text = "Well, hello there! Need coal, flux or a hammer? I've got all three, aye, and opinions on each." },
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
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Folk at home either love him or curse him, and there's precious little in between. What do you make of King Magni, then?" },
      },
      choices = {
        { text = "A fine king. He's kept Ironforge strong through two wars.", next = "op_r1", fx = { affinity = 1, align = { honor = 1 }, opinion = { magni = "admire" } } },
        { text = "He cares more for titan relics than for his own people.", next = "op_r2", fx = { affinity = -1, trait = { skeptical = 1 }, opinion = { magni = "distrust" } } },
        { text = "The Wildhammer had the right of it when they left.", next = "op_r3", fx = { align = { honor = -1 }, opinion = { wildhammer = "admire", magni = "distrust" } } },
        { text = "My clan's sworn to him, Elisa, and that's the end of it.", next = "op_r4", fx = { affinity = 1, opinion = { magni = "loyal" } }, when = { race = "Dwarf" } },
        { text = "I've no opinion on kings.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Aye, he has, and he's kept the beer flowing through both of them. You'll get no complaint from me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Careful, there's a Bronzebeard banner over my forge. Though I'll admit the League's coffers are fuller than the miners' ever were." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Don't say that in Ironforge. The Wildhammer are fine folk with fine gryphons and terrible taste in neighbours, the Hinterlands being full of trolls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Spoken like a proper Ironforge {g:lad|lass}. My da said much the same, then went and argued with the King's tax collectors for forty years." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I miss it every day, but I like being the loudest voice on the docks. Some old-timers at home grumble about dwarves talking to spirits, but yours would fit right in here." } },
      choices = {
        { text = "We dwarves stick together, Elisa.", next = "BACK", reply = "Aye, we do, and it's good tae hear a proper voice on these docks. Come by any time.", fx = { align = { honor = 1 } } },
        { text = "The old-timers have a point. Spirits aren't dwarvish.", next = "BACK", reply = "They do, and I'll not argue it. But a dwarf's a dwarf, whatever they pray to.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "One or two have had words with me, politely enough, about the smoke and where the fuel comes from. I ship my coal in from Ironforge and don't touch your forests, so I told them to save their worry for the furbolgs." } },
      choices = {
        { text = "Smoke is still smoke. Keep the forges small near the groves.", next = "BACK", reply = "Aye, and I do, mostly. The druids are polite about it, which is somehow worse than shoutin'.", fx = { align = { order = 1 } } },
        { text = "Your trade is your own business. Burn what you like.", next = "BACK", reply = "That's what I keep tellin' the druids, but they don't listen. Thank ye anyway.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "You can if you buy your stones from me, because the elves don't do much smithing and the damp in Darkshore rusts a blade overnight. Oil it every evening and hone it every morning, and it'll still be a blade when you reach Ashenvale." } },
      choices = {
        { text = "Every evening, then. A blade's worth the care.", next = "BACK", reply = "Aye, and ye'll thank me when the damp sets in. This coast'll rust a blade overnight.", fx = { align = { order = 1 } } },
        { text = "I'll sharpen it when it's dull, and not before.", next = "BACK", reply = "Then ye'll be buyin' a new blade by spring. The damp's merciless.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, and the elves glare at the noise as if it had personally insulted them. Me, I say a good rifle's an honest tool, but I'll admit the bears hereabouts don't seem to care what shot them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, and the elves glare at the noise as if it had personally insulted them. Your {pet} doesn't care much for my forge smoke, I see, because it's sneezing. Stand upwind, the pair of you, and we'll get on fine." },
      },
      choices = {
        { text = "Out of respect, I'll keep things quiet here.", next = "BACK", reply = "That's kind of ye, and the elves'll appreciate it. They're very sensitive about noise.", fx = { align = { order = 1 } } },
        { text = "A rifle's a rifle. Let the elves glare.", next = "BACK", reply = "Aye, let them glare, an' I'll keep sellin' rifles. They glare at my forge too, an' it's still standin'.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "It's something, all right, and it isn't smithing. I'll sell you a file and a hammer like I'd sell anyone, and what you do with them is your business until the Sentinels make it theirs." },
      },
      choices = {
        { text = "Honest work only, I promise.", next = "BACK", reply = "Good, and I'll sell ye whatever ye need. I'll no' count the lockpicks, either.", fx = { align = { honor = 1 } } },
        { text = "A lock is just a puzzle with a door on it.", next = "BACK", reply = "It is, and I'll not ask which door. Mind the Sentinels.", fx = { align = { honor = -1 } } },
        { text = "Why sell here, of all places?", next = "why" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Not the forge, no; it's fire and iron, and they understand that well enough. It's your sort they mind, and you'll find they're politer to a sweaty smith than to a mage, for they know what a hammer can't do." },
      },
      choices = {
        { text = "I'll respect their wariness.", next = "BACK", reply = "Good, an' they'll appreciate it. Ten thousand years is a long time tae practise bein' wary.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Their fear isn't my concern.", next = "BACK", reply = "It will be when they shoot ye. Mind yerself.", fx = { align = { order = -1 } } },
        { text = "What do the elves think of you?", next = "elves" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I'd admit at home, because these woods are strange, and the elves pray to their Moon and I pray to the Light and somehow we both get by. You'll find good folk on either side if you look." } },
      choices = {
        { text = "The Light and Elune can share a shore.", next = "BACK", reply = "Aye, they can, and they do, most days. I pray tae both on a bad night.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll keep to my own faith, thank you.", next = "BACK", reply = "Fair enough, and so will I. But it's nice tae have company.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Gladly, though I sell supplies and not repairs, mind. A paladin's plate is the only thing standing between some poor soul and an axe, so I'd keep it in good order if I were you." } },
      choices = {
        { text = "I'll keep it in order, for the sake of others.", next = "BACK", reply = "Good, and the folk ye guard will be grateful. Plate's only as good as its upkeep.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My armour keeps me alive. I'll keep it.", next = "BACK", reply = "Aye, an' that's reason enough tae keep it. Come by when the rust starts, an' it will.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because the last imp I saw set a whole sack o' coal alight back in Ironforge just tae watch it burn, an' I'm no' payin' tae ship more across the sea. Besides, the elves already think my forge is a sin against the trees, so I dinnae need yer friend helpin' them prove it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because the last one I saw set a whole sack o' coal alight back in Ironforge just tae watch it burn, an' yer {pet} is lookin' at my coal pile the same way right now. Walk it back tae the road, because the elves already think my forge is a sin against the trees." },
      },
      choices = {
        { text = "Right. It'll stay well back.", next = "BACK", reply = "Good, and my coal thanks ye. Ironforge was bad enough.", fx = { align = { order = 1 } } },
        { text = "Let the elves think what they like.", next = "BACK", reply = "Aye, let them, but keep it away from my coal. That's all I ask.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_alliance_distrust", tags = { "news" }, when = { gossip = { topic = "alliance", stance = "distrust" } },
          text = "Thundris tells me you think we came for the ruins, not the people. I came for the coal and the pay, friend, and I've never lied about it." },
        { id = "h_default", text = "I'm Elisa Steelhand, and I sell blacksmithing supplies here in Auberdine. The elves don't do much smithing themselves, so somebody has to keep the forges fed, and a dwarf's the natural choice." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") },
          text = "Somebody told you a smith has a place at a camp, did they? Right enough, there's always a blade to sharpen by the fire, and I'll show you how to rig it." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "You lot have been very welcoming, I'll say that, even if you look at my forge like it's going to set the forest alight. It won't, I promise." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Now there's someone who knows what a good whetstone's worth, unlike these elves with their glaives." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be wanting arrowheads, I'd guess, and the elves don't make 'em heavy enough for my liking." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Well, I don't sell holy water, but I'll say a word for you myself if you're headed into those woods." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's armour I'd like a closer look at, because the elves don't wear plate, and I miss the sight of it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, eh? You'll be one of those who'd rather I didn't burn so much coal so near the trees, so let's get that argument out of the way early." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! The elves here go white as milk when one of you walks past, an' I'll admit I enjoy watchin' it, but keep yer beastie away from my coal." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! By my beard, you're a sight among all these elves, and though Ironforge's old-timers might grumble, I'll not." },
      },
      again = {
        { id = "h_again", text = "Anything else, then? Speak up, {g:lad|lass}, the forge is loud!" },
        { id = "h_again2", text = "What else? I've time for a chat." },
      },
      choices = {
        { text = "What do folk back home make of King Magni?", next = "op_ask" },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What brings a dwarf to Auberdine?", next = "why" },
        { text = "I'd guess the night elves treat you well enough.", next = "elves" },
        { text = "Do you know the dwarves digging south of here?", next = "dig" },
        { text = "Lockpicking counts as metalwork, doesn't it?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the elves mind your forge?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can I keep my blade sharp out here among the elves?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do dwarven hunters bring rifles out here among the elves?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you pray much, Elisa, out here among the elves?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you look over my armour before I head out?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the druids here object to your forges, Elisa?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why keep my servant away from your coal, Elisa?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you miss Ironforge, Elisa?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "The forest has to come first.", next = "BACK", reply = "Aye, it does, and I'd never argue it in their hearing. But the orcs in Ashenvale aren't waitin' on the forest.", fx = { align = { order = -1 } } },
        { text = "They'll need forges to win this war.", next = "BACK", reply = "They will, and I'll be here when they do, with the coal already burnin'.", fx = { align = { order = 1 }, affinity = 1, learn = { "warsong" } } },
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
    magni = {
      { id = "tp_magni", text = "King Magni's the best king a dwarf could ask for, and he still sends a letter to us lot out here now and then. Makes the long way home feel a bit shorter." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Ye'll know the king, then, or ye'll know of him. Raise a glass to him tonight, and I'll pour, because there's few enough of us out here." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Iron dwarves, the ones who brought the fire down on us all. My grandfather fought them, and he never forgave a single one." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "My cousin had a stall near Gnomeregan before it fell. She came back to Ironforge with nothing but her hammer, and she's never said a word about what she saw." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer are our cousins in the Hinterlands, and they ride gryphons and drink like the world's ending. I miss them, oddly." } },
    _none = { { id = "tp_none", text = "Ha! No idea, {g:lad|lass}. Ask one of the elves; they've been around long enough to know everything." } },
  },
}
