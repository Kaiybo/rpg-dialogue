-- Forever-only NPCs in Dun Morogh. Voice: bibles/dunmorogh_forever.md
-- Grund Drokda and Gozwin Halfsprocket at Anvilmar (Grund and Gozwin), and Earthseer Farsen, a Wildhammer
-- shaman camped in the Tundrid Hills above Gol'Bolar Quarry (the Hall of Thanes chain).
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Grund Drokda: big-hearted Anvilmar dwarf nursing a half-frozen gnome back to health.
P:NPC {
  key = "dm_grund", id = TODO_NPC("Grund Drokda"), name = "Grund Drokda",
  bible = "bibles/dunmorogh_forever.md", role = "questgiver", tier = "quest",
  communities = { "coldridge" }, temper = { "warm", "gruff" }, values = { "kind", "loyal", "practical" },
  notices = { "gnome", "cold", "healer" },

  impression = {
    first = "He nurses a frozen gnome like a father with a sick bairn.",
    third = "{name} met Grund Drokda at Anvilmar, nursing the gnome Gozwin Halfsprocket back to health.",
  },

  greetings = {
    { id = "g_default", text = "Mind the draught, an' shut the door behind ye if ye've come in. I've a patient here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Gozwin's colour's better today, an' he asked after ye, near enough." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Grund and Gozwin") }, text = "Any luck fetchin' what Gozwin needs? The lad's not gettin' warmer on wishes alone." },
    { id = "g_after", when = { questDone = TODO_QUEST("Grund and Gozwin") }, text = "There's the friend o' Gozwin's! Come in by the fire an' see what yer help's done." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "Look at ye, filled out like a proper mountaineer since ye first came through Anvilmar." },
  },

  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Another gnome! Sit by Gozwin, will ye; he'll warm faster seein' a face his own size." },
    { id = "n_healer", cat = "healer", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } },
      text = "Ye've the look o' someone who can mend. If ye've a spare blessin', put it on the gnome an' no' on me." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Grund Drokda. I found this wee gnome half buried in a drift outside the gates, blue as a winter sky, an' I've had him by my fire ever since. His name's Gozwin, an' he's goin' tae live if I've any say in it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Grund and Gozwin") },
          text = "I could use a pair o' hands, if ye've some free. I can't leave the lad, an' there's things he needs that won't fetch themselves." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Grund and Gozwin") },
          text = "Still at it, are ye? Good, then get some bread in his belly an' some warmth in his bones, that's all the doctorin' a gnome needs." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Grund and Gozwin"), days = 3 } },
          text = "He sat up on his own this mornin' an' asked for a screwdriver, which I'm takin' as a good sign. Thank ye for yer part in it." },
        { id = "h_done", when = { questDone = TODO_QUEST("Grund and Gozwin") },
          text = "He's mendin', slow but sure, an' he's started drawin' gun designs on my good table. I've never been so glad tae have my furniture ruined." },
        { id = "h_dwarf", when = { race = "Dwarf", maxLevel = 10 },
          text = "One o' the new Anvilmar recruits, are ye? Good, then ye can help a fellow dwarf without me havin' tae explain myself." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Keep yer voice down; he's dozin'." },
        { id = "h_again2", text = "Go on, I'm listenin', though one ear's on the lad." },
        { id = "h_again3", text = "What else, friend?" },
      },
      choices = {
        { text = "How did you find him?", next = "found" },
        { text = "Where did Gozwin come from?", next = "gnomeregan" },
        { text = "Does Gozwin have plans, once he's well?", next = "shotgun" },
        { text = "Why go to such trouble for a stranger?", next = "why" },
        { text = "Let me look at him. I can heal.", next = "xheal", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "I'm a gnome too. Can I help him?", next = "xgnome", when = { race = "Gnome" } },
        { text = "What can I do?", next = "BUSINESS" },
        { text = "Take care of him, Grund.", next = "END" },
      },
    },

    found = {
      lines = {
        { id = "fo_default", text = "Out by the drifts on the road, curled up behind a rock wi' a toolbag clutched tae his chest like a bairn holds a doll. He'd walked from somewhere, an' he'd walked a long way, an' the snow had nearly finished what the walk started." },
      },
      choices = {
        { text = "He walked from Gnomeregan?", next = "gnomeregan" },
        { text = "What was in the toolbag?", next = "found_bag" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found_bag = {
      lines = {
        { id = "fb_default", text = "Springs, gears, a wee hammer, an' a drawin' o' somethin' I took for a gun, folded so many times it near fell apart. He'd not let go o' it even half dead, so I reckon it matters tae him more than his boots did." },
      },
      choices = {
        { text = "Was that drawing one of his designs?", next = "shotgun" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnomeregan = {
      lines = {
        { id = "gn_default", text = "Gnomeregan, aye, or near enough. The gnomes poisoned their own city tae stop the troggs an' half o' them never got out, an' the ones that did came through Dun Morogh wi' nothin' but what they could carry.",
          fx = { learn = { "gnomeregan" } } },
      },
      choices = {
        { text = "Does he talk about it?", next = "gnomeregan_talk" },
        { text = "The gnomes brought that on themselves.", next = "gnomeregan_blame", fx = { affinity = -1, align = { light = -1 } } },
        { text = "They lost everything. Ironforge owes them shelter.", next = "gnomeregan_blame", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    gnomeregan_talk = {
      lines = {
        { id = "gt_default", text = "Not a word, not o' the city. He talks about gears an' powder an' barrels, an' when I ask him about home he asks me whether I've any copper wire, so I've stopped askin'." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomeregan_blame = {
      lines = {
        { id = "gb_default", text = "Say what ye like o' their tinkers, an' I've said worse when one o' them blew my eyebrows off at the Great Forge. The lad on that cot didnae decide anythin', though; he only ran." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shotgun = {
      lines = {
        { id = "sh_default", text = "His big idea! A shotgun small enough tae fit in a gnome's pocket an' loud enough tae knock a trogg flat. When we get him back on his feet we'll start work on it, an' that'll show 'em." },
      },
      choices = {
        { text = "Show who?", next = "shotgun_who" },
        { text = "Will it actually work?", next = "shotgun_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shotgun_who = {
      lines = {
        { id = "sw_default", text = "The troggs, the cold, the folk in Ironforge who sigh when they see another gnome comin' up the road. Everybody, I suppose, an' a gnome who's lost everythin' is entitled tae want tae show everybody." },
      },
      choices = {
        { text = "A weapon won't give him back his home.", next = "BACK", reply = "No, it willnae, an' I've told him so, but it gives him a reason tae get out o' bed in the mornin', an' that's a start for a lad who's lost everythin'.", fx = { align = { honor = 1 } } },
        { text = "Good. Let him make the troggs pay.", next = "BACK", reply = "That's what he says, near enough, an' I'll no' stop him, but I'd like tae see him build somethin' that isnae meant tae kill, one o' these days.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shotgun_work = {
      lines = {
        { id = "swk_default", text = "Work? I'll be honest wi' ye, I'm a dwarf, an' a dwarf likes his guns long an' his barrels thick. Still, if anyone can make a small gun shout loud, it's a gnome wi' a grudge." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because he was dyin' in the snow on my doorstep, an' I'm no' the sort tae step over a body. My mam took in every lost lamb an' every lost lad in Coldridge, an' I'd not be able tae look at her grave if I didnae do the same." },
      },
      choices = {
        { text = "Your mother would be proud.", next = "BACK", fx = { affinity = 2 } },
        { text = "You can't save everyone, Grund.", next = "why_everyone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_everyone = {
      lines = {
        { id = "we_default", text = "No, but I can save this one, an' this one's the one in front o' me. Ye'll find that's how it always goes, if ye bother tae look." },
      },
      choices = {
        { text = "Then I'll help you save him.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xheal = {
      lines = {
        { id = "xh_default", text = "Would ye? Go gently, he startles at hands. Mostly it's the cold that's in him, an' the cold's stubborn, but no' as stubborn as me." },
      },
      choices = {
        { text = "There. The warmth should hold now.", next = "BACK", fx = { affinity = 2 } },
        { text = "Food and rest will do more than I can.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xgn_default", text = "Ye can talk tae him in that quick gnomish o' yours, which is more than I can. He nods at my jokes, but I think he's only bein' polite, an' the polite ones are the worst." },
      },
      choices = {
        { text = "I'll sit with him a while.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Coldridge born, Anvilmar trained, an' I've never been further than Kharanos an' never needed tae be." } },
    advice = { { id = "tp_ad", text = "Keep yer feet dry an' yer belly full, an' ye'll outlast most o' what this valley throws at ye." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. Ask somebody wi' fewer patients." } },
  },
}

-- Gozwin Halfsprocket: Gnomeregan exile thawing out by Grund's fire, already planning a pocket shotgun.
P:NPC {
  key = "dm_gozwin", id = TODO_NPC("Gozwin Halfsprocket"), name = "Gozwin Halfsprocket",
  bible = "bibles/dunmorogh_forever.md", role = "citizen", tier = "quest",
  communities = { "coldridge" }, temper = { "anxious", "eager" }, values = { "inventive", "stubborn" },
  notices = { "gnome", "engineer" },

  impression = {
    first = "He shivers when he talks and brightens only about gun barrels.",
    third = "{name} met Gozwin Halfsprocket, a Gnomeregan exile recovering from the cold at Anvilmar.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Hello. Sorry, I'm still a bit, well, thawing." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Grund said you would, and Grund's never wrong about people." },
    { id = "g_after", when = { questDone = TODO_QUEST("Grund and Gozwin") }, text = "I can feel all ten toes again, and I owe a few of them to you!" },
  },

  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Oh, a gnome! Did you get out too? Don't tell me how, I don't think I could bear it, just tell me you're all right." },
    { id = "n_eng", cat = "engineer", when = { profession = { "Engineering" } },
      text = "Is that grease under your fingernails? An engineer! Oh, thank goodness, someone who'll understand the barrel problem on my pocket shotgun." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Gozwin Halfsprocket, formerly of Gnomeregan, currently of Grund's fireside. I'm much better than I was, though I still can't feel my left ear, and Grund says that's a mercy, given the ear." },
        { id = "h_done", when = { questDone = TODO_QUEST("Grund and Gozwin") },
          text = "I'm on my feet, mostly, and the pocket shotgun is on paper, entirely. Grund says next week we start cutting metal, and I've not slept for excitement." },
      },
      again = {
        { id = "h_again", text = "Something else? I don't mind, talking keeps the shivers off." },
        { id = "h_again2", text = "Go on, ask, I've nowhere to be, and no feet to get there on." },
      },
      choices = {
        { text = "How did you end up in the snow?", next = "snow" },
        { text = "Tell me about the pocket shotgun.", next = "gun" },
        { text = "What do you think of Grund?", next = "grund" },
        { text = "Can I help with your shotgun's barrel problem?", next = "xeng", when = { profession = { "Engineering" } } },
        { text = "Rest well, Gozwin.", next = "END" },
      },
    },

    snow = {
      lines = {
        { id = "sn_default", text = "I walked out of the gate when the alarms went, with my toolbag and nothing else, and I kept walking because everyone else was. Somewhere past the trogg caves I sat down for a moment, and the moment got rather long.",
          fx = { learn = { "gnomeregan" } } },
      },
      choices = {
        { text = "You were lucky Grund found you.", next = "snow_lucky" },
        { text = "Was anyone with you?", next = "snow_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    snow_lucky = {
      lines = {
        { id = "sl_default", text = "Lucky is a funny word for a gnome with no city and two frostbitten feet, but yes, I suppose I was. Grund says luck is just somebody bothering to look, and he bothered." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    snow_alone = {
      lines = {
        { id = "sa_default", text = "My workshop partner, Nibbet, for the first bit, but we got separated at the bend in the road where everyone was pushing. I'd like to think Nibbet's in Ironforge, so I don't ask anyone, in case they tell me otherwise." },
      },
      choices = {
        { text = "I'll keep an ear out for Nibbet.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gun = {
      lines = {
        { id = "gu_default", text = "Two barrels, short as your finger, a spring-loaded breech, and a stock that folds so you can keep it in your waistcoat. A gnome shouldn't have to carry a dwarf's rifle to feel safe, and with this one, they won't." },
      },
      choices = {
        { text = "What happens when it goes off in your pocket?", next = "gun_pocket" },
        { text = "Who's it for, really?", next = "gun_for" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gun_pocket = {
      lines = {
        { id = "gp_default", text = "That is the barrel problem, yes, and I'm working on it. Grund suggests not putting it in the pocket you're standing next to, which is a very dwarven solution." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gun_for = {
      lines = {
        { id = "gf_default", text = "Every gnome who ran out of Gnomeregan with nothing in their hands. Next time something comes up out of the dark at us, I'd like us to have something in our pockets besides spanners." },
      },
      choices = {
        { text = "Next time, you'll be ready.", next = "BACK", reply = "You think so, really, because I've drawn the barrel seven times and I think the eighth will finally fire without catching my eyebrows alight.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Guns won't keep your people safe. Each other will.", next = "BACK", reply = "That's what Grund says, and I believe him, I do, but I'd still feel a great deal safer with each other and a very loud gun in my pocket.", fx = { align = { light = 1 } } },
      },
    },

    grund = {
      lines = {
        { id = "gr_default", text = "He's the kindest person I've ever met, and he snores like a steam tonk, and he's fed me so much bread I may never fit through a door again. I'd follow him into a trogg cave with my pocket shotgun, once it exists." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xeng = {
      lines = {
        { id = "xe_default", text = "Oh, would you? The trouble is the recoil, which is considerable, and the size of the gnome, which is not. I'm thinking a counterweight, or possibly a second, smaller gnome." },
      },
      choices = {
        { text = "Try a recoil spring in the stock.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why not just build a bigger gun?", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Gnomeregan, a workshop on the fourth level, ten years of good work, and then the alarms. That's everything, really, so let's talk about barrels instead." } },
    advice = { { id = "tp_ad", text = "Always carry your toolbag, even when you're running for your life. Especially then." } },
    _none = { { id = "tp_none", text = "I don't know, sorry, my head's still half frozen. Ask Grund, he knows everything that isn't engineering." } },
  },
}

-- Earthseer Farsen: Wildhammer shaman from Aerie Peak, camped in the Tundrid Hills above Gol'Bolar Quarry.
-- Old friend of Magni; watches the Dark Irons with farsight and the wind.
P:NPC {
  key = "dm_farsen", id = TODO_NPC("Earthseer Farsen"), name = "Earthseer Farsen", title = "Earthseer",
  bible = "bibles/dunmorogh_forever.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "calm", "jovial" }, values = { "wise", "nature", "loyal" },
  notices = { "shaman", "wildhammer", "dwarf" },

  impression = {
    first = "He calls the King an old friend and seems to mean it.",
    third = "{name} met Earthseer Farsen, a Wildhammer shaman keeping watch over Gol'Bolar Quarry from the Tundrid Hills.",
  },

  greetings = {
    { id = "g_default", text = "Greetings tae ye, friend. Pull up a rock; the fire's small but it's honest." },
    { id = "g_back", when = { metBefore = true }, text = "Back on my hill! The wind said ye'd be climbin' up, but the wind's a gossip." },
    { id = "g_visitor", when = { questActive = TODO_QUEST("A Visitor to Dun Morogh") }, text = "Ah, did Steelgrill send ye tae see who was burnin' a fire up here? Well, it's me, an' I'm friendly." },
    { id = "g_watch", when = { questActive = TODO_QUEST("Farsen's Watch") }, text = "Ready tae see what I've been seein'? It's no' a pretty view." },
    { id = "g_spies", when = { questActive = TODO_QUEST("Nip 'Em in the Bud") }, text = "The spies are still at Ironband's Compound, an' they'll no' leave on their own." },
    { id = "g_incursion", when = { questActive = TODO_QUEST("Old Ironforge Incursion") }, text = "Down under Old Ironforge wi' ye, an' bring yer friends. Their commander, Durgen Dirgehammer, won't come up tae meet ye." },
    { id = "g_after", when = { questDone = TODO_QUEST("Old Ironforge Incursion") }, text = "There's the one who delivered a Dark Iron's head tae Magni! Did he laugh? Tell me he laughed." },
  },

  notice = {
    { id = "n_shaman", cat = "shaman", when = { class = "SHAMAN" },
      text = "Ye hear them too, don't ye? The stones up here are restless, an' the wind won't stop talkin' about the south." },
    { id = "n_wild", cat = "wildhammer", when = { origin = "dwarf_wildhammer_kin" },
      text = "There's Aerie blood in ye, I can smell the gryphon on yer cloak. Welcome, cousin." },
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf", class = { "WARRIOR", "PALADIN", "HUNTER" } },
      text = "A Bronzebeard wi' a proper weapon. Good, for I'm a shaman, an' I'd like a strong arm beside me when the Dark Irons come close." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "My name's Earthseer Farsen, an' I'm visitin' Dun Morogh from Aerie Peak. As I was travellin' I couldnae help but notice ye've a bit o' a Dark Iron problem, so I've stopped on this hill tae keep an eye on it." },
        { id = "h_view", text = "On a clear day ye can see Blackrock Mountain from here, all the way south past the Searing Gorge. It's beautiful an' terrible at the same time, an' I've been starin' at it for a week." },
        { id = "h_watch", when = { questBefore = TODO_QUEST("Farsen's Watch"), questDone = TODO_QUEST("A Visitor to Dun Morogh") },
          text = "If ye've a moment, I can show ye what I mean. I've a bit o' magic that lets the wind carry yer sight, an' it'll show ye more than ye'd like." },
        { id = "h_watched", tags = { "news" }, when = { questRecent = { TODO_QUEST("Farsen's Watch"), days = 2 } },
          text = "So ye see now? Thick as cockroaches they are, an' that's only the ones we can see from the sky. Ye look a sturdy sort; how about a bit o' violence?" },
        { id = "h_map", tags = { "news" }, when = { questRecent = { TODO_QUEST("Underground Map"), days = 3 } },
          text = "Tunnels, all runnin' tae one point under Ironforge itself. That band ye busted up was a scoutin' force, an' if we hurry we'll beat the rest tae whatever they're after." },
        { id = "h_done", when = { questDone = TODO_QUEST("Old Ironforge Incursion") },
          text = "The wind's quieter now Durgen Dirgehammer's dead, an' I've stopped seein' Dark Irons in my dreams. I'll be goin' home tae the Aerie soon, once I've had one more look at that mountain." },
      },
      again = {
        { id = "h_again", text = "What else? The fire'll keep a while yet." },
        { id = "h_again2", text = "Ask away, friend, the hills are patient an' so am I." },
        { id = "h_again3", text = "Somethin' more? The wind's in no hurry." },
      },
      choices = {
        { text = "What are the Dark Irons doing here?", next = "dark" },
        { text = "What brings a Wildhammer to Dun Morogh?", next = "why" },
        { text = "You know King Magni?", next = "magni" },
        { text = "What is farsight?", next = "farsight" },
        { text = "I found dead mountaineers in these hills.", next = "mountaineers", when = { minLevel = 10 } },
        { text = "Teach me what the stones are saying, Earthseer.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I've Wildhammer kin myself.", next = "xwild", when = { origin = "dwarf_wildhammer_kin" } },
        { text = "Show me what you've seen.", next = "BUSINESS" },
        { text = "Safe watch, Earthseer.", next = "END" },
      },
    },

    dark = {
      lines = {
        { id = "da_default", text = "Spies, mostly, out east at Ironband's Compound, an' Rockjaw boneshapers stirrin' the troggs up ahead o' them. To what end I couldnae say at first, but it's a problem we need tae nip in the bud before it grows.",
          fx = { learn = { "dark_iron", "troggs" } } },
        { id = "da_map", when = { questDone = TODO_QUEST("Underground Map") },
          text = "Their map said it plain: an incursion intae the vaults beneath Ironforge, under the Hall o' Thanes. Durgen Dirgehammer, the name was, though my Dark Iron's a bit rusty." },
      },
      choices = {
        { text = "They're dwarves too. Why the hatred?", next = "dark_kin" },
        { text = "What do they want under Ironforge?", next = "dark_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark_kin = {
      lines = {
        { id = "dk_default", text = "Cousins, aye, but they ain't family, an' that's the truth of it. Thaurissan's folk threw their lot in wi' fire an' worse, an' I shed no tears for those that stray too far from that accursed mountain o' theirs." },
      },
      choices = {
        { text = "Cousins can still come home, Earthseer.", next = "BACK", reply = "Ye've a gentle heart, an' I'll no' laugh at it, but I've watched Dark Irons burn too many villages tae leave the door open for them.", fx = { align = { light = 1 } } },
        { text = "They chose fire. Let them burn in it.", next = "BACK", reply = "Aye, an' I'll no' weep when they do, though I'll say a word tae the winds for the bairns among them who never got tae choose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark_want = {
      lines = {
        { id = "dw_default", text = "The old seat o' the kings, maybe, or whatever lies in the deep vaults beside it. The Dark Irons never forgot they lost the Three Hammers war, an' a grudge that old doesnae need a reason, only a tunnel." },
      },
      choices = {
        { text = "Then we stop them in the tunnels.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "I was travellin' tae see an old friend under the mountain, an' I stopped on this hill for the view, an' the view had Dark Irons in it. A shaman listens tae what the land's sayin', an' this land was shoutin'." },
      },
      choices = {
        { text = "The Wildhammer and Bronzebeards get along now?", next = "why_clans" },
        { text = "Do you miss Aerie Peak?", next = "why_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_clans = {
      lines = {
        { id = "wc_default", text = "Better than we did, which isnae sayin' much. We left for the Hinterlands after the war an' we liked the sky better than the stone, an' some in Ironforge never forgave us for it." },
      },
      choices = {
        { text = "The clans should stand together. Old wars are over.", next = "BACK", reply = "That's what the King says, an' he means it, an' I'll drink to it at his table, but there's grudges in that city older than me granddad.", fx = { align = { order = 1 } } },
        { text = "Every clan should go its own way.", next = "BACK", reply = "Spoken like a Wildhammer, an' maybe ye've a bit o' the sky in ye after all, because it's the stone-bound lot who cannae bear to let us go.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_home = {
      lines = {
        { id = "wo_default", text = "I miss the gryphons screamin' at dawn an' the trees on the cliffs, an' I don't miss the trolls one bit. The Aerie's a hard place tae love an' an easy place tae miss." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    magni = {
      lines = {
        { id = "ma_default", text = "Knew him when he was just a prince wi' a loud laugh an' a louder hammer. He calls me an old rockhugger, an' I call him worse, an' we've been friends for longer than either of us admits." },
      },
      choices = {
        { text = "Why not go see him yourself?", next = "magni_visit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magni_visit = {
      lines = {
        { id = "mv_default", text = "Because if I walk intae the High Seat, I'll be there a week drinkin' an' tellin' lies, an' the Dark Irons'll be through the floor by the time I'm sober. Tell him his old friend Farsen sends his regards, an' he'll know what that means." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    farsight = {
      lines = {
        { id = "fs_default", text = "A wee gift the spirits lend us: the wind carries yer sight up an' away, so ye see the land the way a gryphon does. Farsight can show ye a great many things, even things ye'd rather not see." },
      },
      choices = {
        { text = "Is it safe?", next = "farsight_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farsight_safe = {
      lines = {
        { id = "fss_default", text = "Safe as standin' on a hilltop in a storm, which is tae say safe if ye respect it. Ye'll come back tae yer own eyes when ye want tae, an' the worst that happens is a dizzy head." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mountaineers = {
      lines = {
        { id = "mt_default", text = "Aye, I've seen them from up here, lyin' in the snow wi' their rifles beside them, Coalbeard an' Stoneanvil an' Sunhammer. I cannae tell ye who killed them, though I've my guesses, an' my guesses all wear black iron." },
      },
      choices = {
        { text = "Someone should bring them home.", next = "mountaineers_home" },
        { text = "Then the Dark Irons will answer for them.", next = "mountaineers_home", fx = { align = { honor = -1 } } },
        { text = "We don't know it was the Dark Irons.", next = "mountaineers_home", fx = { align = { honor = 1 } } },
      },
    },
    mountaineers_home = {
      lines = {
        { id = "mh_default", text = "Their rifles at least, for a mountaineer's rifle should go home tae his kin, or hers. I'd go myself, but I've a watch tae keep an' my knees are older than my beard." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xshaman = {
      lines = {
        { id = "xs_default", text = "Sit wi' me an' put yer hand flat on the rock. Feel that, the wee trembling? That's diggin', far below, an' the earth doesnae like bein' dug at by folk who hate it." },
      },
      choices = {
        { text = "The earth will help us drive them out.", next = "BACK", reply = "Aye, it will, if ye ask it right, an' it's angry enough tae listen, so we'll go down there together an' let the stone do some o' the shoutin'.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The earth can complain. I'll do the fighting.", next = "BACK", reply = "Ha, ye sound like a Bronzebeard, but the earth doesnae take kindly tae bein' ignored, so dinnae be surprised if it shakes under yer boots.", fx = { align = { light = -1 } } },
      },
    },
    xwild = {
      lines = {
        { id = "xw_default", text = "Do ye, now! Then ye'll know the Aerie doesnae send shamans out for nothin', an' ye'll know tae keep yer voice down about it in Ironforge. Some o' the Senate still count us as half traitor." },
      },
      choices = {
        { text = "I'm proud of both bloods.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Aerie Peak born, spirit-taught, an' a long time travellin'. The rest is between me an' the wind." } },
    advice = { { id = "tp_ad", text = "Climb high before ye fight. Ye'll see where the enemy is, an' more important, where he's goin'." } },
    _none = { { id = "tp_none", text = "The wind's no' told me that one, friend. Ask it yerself, it might like ye better." } },
  },
}
