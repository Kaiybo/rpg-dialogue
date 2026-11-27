-- The slopes: Thylaen, who weeds the poisoned growth, and Zet'gan, at a Horde camp that can't get away. Voice: bibles/hyjal.md
local P = RPGDialogueAPI:Pack("rpgd.hyjal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hyj_thylaen", id = TODO_NPC("Thylaen"), name = "Thylaen",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "quest",
  communities = { "hyjal" }, temper = { "steady" }, values = { "kind", "stern" },
  notices = { "class", "kit", "form" },

  impression = {
    first = "They speak softly only of what grows after the thorns.",
    third = "{name} met Thylaen, who is clearing the fel-soured brambles from Hyjal's slopes so the mountain can grow again.",
  },

  greetings = {
    { id = "g_default", text = "Watch your step, for most of what grows green on this slope wants to bite you, and what doesn't still remembers the Legion's rain." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the slope, are you? Look at my gloves, already torn again; the thorns have been busy since you left, and so have I." },
    { id = "g_done", when = { questDone = TODO_QUEST("Celastrus the Bitter") }, text = "There's the one who cut down Celastrus. The eastern hollow is greening already; go and look, when you've the time." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the slope has grown back over half the paths you knew, so mind your boots." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you were last on this slope, and not the way the thorns do, which is a relief, because strong things that stay healthy are rare up here." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word on the mountain is that you've been helping, and I've seen the proof of it in a few greener hollows, so keep it up." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Good; you'll understand that pulling a weed counts as healing, even if it doesn't look like one." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Those claws would make short work of the brambles. Mind the roots of the good growth while you're at it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Fire's tempting, I know, but if you burn the brambles they'll come back thicker, and the good growth won't come back at all." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The thorns got you too, I see. Wash those cuts before nightfall, because the sap up here is poisoned." },
  },

  start = "hello",
  nodes = {
    w2scar = {
      lines = { { id = "w2s_default", text = "More times than I can count, and once badly. A bramble on the north path wrapped my arm to the elbow, and the sap burned green for a week; Zet'gan's camp packed it with some troll poultice that smelled worse than the wound did, and it worked." } },
      choices = {
        { text = "How do you cut them without getting caught?", next = "w2scar2" },
        { text = "I'd have let it burn and kept cutting.", next = "w2scar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2scar2 = {
      lines = {
        { id = "w2s2_herb", when = { profession = "Herbalism" }, text = "You pick herbs, so you'll know the trick already: watch the stems, not the leaves. A poisoned bramble goes dark at the joint just before it moves, and that's your one breath to step back and cut low at the root." },
        { id = "w2s2_default", text = "Watch the stems, not the leaves. A poisoned bramble darkens at the joint the breath before it lashes, and if you step back then and cut low at the root, it has nothing left to swing with." },
      },
      choices = { { text = "I'll watch the joints. Thank you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_dd_feathers", when = { questDone = TODO_QUEST("Feathers in Flight") },
          text = "Zet'gan tells me you brought him his feathers and never plucked a living owl. I checked the nests myself, mind, and I'm glad to say he was telling the truth." },
        { id = "h_default", key = true,
          text = "The mountain is overrun with wild growth, swollen by the fel that rained down on it when Archimonde climbed toward the World Tree. The weeds and the brambles are angry now, poisoned through, and they strangle everything else, so they must be cleared, or Nordrassil's mountain will never regrow." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Celastrus the Bitter") },
          text = "You're going after Celastrus, then. Take friends, take a sharp blade, and bring me its broken frond so I know it's truly finished." },
        { id = "h_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Celastrus the Bitter"), days = 3 } },
          text = "Celastrus is gone. The deer came back into the hollow the very next morning, and I stood and watched them graze for longer than I'd care to admit." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. Your kind heals bodies; up here, the ground needs healing first, and it takes a blade more often than a prayer." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde or not, a pair of hands is a pair of hands. The brambles don't ask who you're loyal to before they bite." },
      },
      again = { { id = "h_again", text = "What else? Be quick, or something will have grown over your boots; the fel makes even the brambles impatient." } },
      choices = {
        { text = "Which of the brambles is the worst?", next = "celastrus" },
        { text = "How did the plants turn so foul?", next = "fel" },
        { text = "I'd like to see what grows back once they're cleared.", next = "regrow" },
        { text = "Why not just burn it all?", next = "xburn", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Can the Light cleanse the ground?", next = "xlight", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "How long have you been clearing this slope?", next = "years" },
        { text = "What does Zet'gan's camp think of your work?", next = "zetgan" },
        { text = "Have the thorns ever caught you?", next = "w2scar" },
        { text = "Good luck with the weeding.", next = "END" },
      },
    },
    celastrus = {
      lines = {
        { id = "c_default", text = "A great thornbush that lurks about the slopes to the east. It kills animals, it lashes out at the other plants, and it has fed on the bodies of the dead until it grew to the size of a barrow. It must be destroyed." },
        { id = "c_done", when = { questDone = TODO_QUEST("Celastrus the Bitter") }, text = "It was a thornbush the size of a house, and now it's a heap of kindling, thanks to you. I've kept its frond on my shelf, which is petty of me, but I've earned a little pettiness." },
      },
      choices = {
        { text = "Why does it eat the dead?", next = "celastrus_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    celastrus_dead = {
      lines = {
        { id = "cd_default", text = "Because there are plenty of them on this mountain, and the fel taught the plants to be hungry. A healthy thorn takes rain and sun, but a poisoned one takes whatever wanders too close, and I have found deer bones knotted in its roots." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fel = {
      lines = {
        { id = "f_default", text = "When the Legion came up the mountain, its fire fell on the forest, and the poison soaked into the soil. The trees mostly endured, but the small, quick-growing things drank it down and changed, and they've been spreading ever since." },
      },
      choices = {
        { text = "Those brambles look past saving.", next = "fel_saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fel_saved = {
      big = true,
      lines = {
        { id = "fs_default", text = "I fear you're right. A druid might try to coax the poison out of a single bush, but there are thousands of them, and every day spent coaxing one is a day the rest spread further. I cut them out, and I don't apologise for it." },
      },
      choices = {
        { text = "Cut them out. The mountain comes first.", next = "BACK", reply = "Good. Gloves are on the stump by the path, and don't hesitate when the thorns start to twist, because they won't.", fx = { align = { light = -1 } } },
        { text = "Even weeds deserve a chance at healing.", next = "BACK", reply = "They might, and in a gentler season I'd agree with you, but the mountain hasn't got that many seasons left to spare on mercy for brambles.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regrow = {
      lines = {
        { id = "rg_default", text = "Grass first, then the small flowers, then saplings, if the soil's clean enough. And then the animals come back, and the owls nest again, and you'd never know anything had been wrong except for the stumps." },
      },
      choices = {
        { text = "That's worth fighting for.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xburn = {
      big = true,
      lines = {
        { id = "xb_default", text = "Because the brambles have deeper roots than the good growth does. Burn the slope and the poisoned roots survive under the ash, and the clean ones don't, and you've handed the mountain to the very thing you meant to destroy." },
      },
      choices = {
        { text = "Then I'll cut, slowly and carefully.", next = "BACK", reply = "Then you understand the slope, and you'll be slower than the fire and far more use, so take the blade and mind the roots.", fx = { align = { order = 1 } } },
        { text = "Then burn deeper. Fire solves most things.", next = "BACK", reply = "Fire solves what it touches and nothing beneath, which is exactly the problem, and I'd rather you didn't try it anywhere near my slope.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlight = {
      lines = {
        { id = "xl_default", text = "I've seen it ease the sting of a thorn, and I'd not turn away a blessing on the soil. But the Light didn't plant these brambles, and I doubt it will pull them up for us." },
      },
      choices = {
        { text = "Then I'll bless the ground and cut the thorns.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    years = {
      lines = { { id = "yr_default", text = "Longer than I like to count, and longer than any of the thorns I've cut down. When I started, you couldn't see the ground for brambles from here to the ridge, and now there are three clean hollows where the deer graze. Three, in all that time." } },
      choices = {
        { text = "Three is better than none.", next = "years2" },
        { text = "Does it ever feel hopeless?", next = "years2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    years2 = {
      lines = { { id = "yr2_default", text = "On the bad days, it does, and on those days I go and stand in the first hollow I cleared, where the saplings are taller than I am now. A forest doesn't heal in one lifetime, but it heals, and I'd sooner be the one who started it than the one who waited." } },
      choices = { { text = "That's a good reason. Something else.", next = "BACK" } },
    },
    zetgan = {
      lines = { { id = "zg_default", text = "They think I'm mad, but useful. The trolls came up the mountain on some errand of their own and got stuck, and now they defend the slope as hard as anyone. Zet'gan sends his scouts to tell me where the thorns are thickest, and I tell him where the owls nest." } },
      choices = {
        { text = "An odd alliance, a druid's helper and a troll camp.", next = "zetgan2" },
        { text = "Do you trust them?", next = "zetgan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zetgan2 = {
      lines = { { id = "zg2_default", text = "I trust that they want off this mountain alive, and so do I, and the thorns want neither of us to manage it. That's enough to share a fire over. The mountain doesn't care what banner we fly, so for once we don't have to either." } },
      choices = {
        { text = "I'm a druid. I'll help where the Circle can't reach.", next = "BACK", reply = "Then bring a sharp knife as well as a kind heart. Up here, you'll need both.", when = { class = "DRUID" } },
        { text = "Something else, Thylaen.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I tend green things. On this mountain, that mostly means killing them." } },
    advice = { { id = "tp_ad", text = "Never sit down on a slope you haven't looked at first." } },
    burning_legion = { { id = "tp_bl", text = "They've been gone for years, and I'm still pulling up what they left behind." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil's roots run through this whole mountain, and the poisoned growth reaches for them. I cut what reaches, because cutting is how this mountain heals." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream shows this mountain clean and green, the druids tell me. I keep that picture in my head while I cut, and it helps." } },
    fel_moss = { { id = "tp_fel_moss", text = "Fel moss is a smaller cousin of what grows here. Burn it, never compost it, and never touch it with bare hands." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask me about weeds, and I'll talk until the moon sets, for I've been pulling them since the battle." } },
  },
}

P:NPC {
  key = "hyj_zetgan", id = TODO_NPC("Zet'gan"), name = "Zet'gan",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "quest",
  communities = { "hyjal" }, temper = { "weary", "steady" }, values = { "loyal", "brave" },
  notices = { "class", "race", "kit" },

  impression = {
    first = "Every joke of his comes back round to friends he won't abandon.",
    third = "{name} met Zet'gan, a weary troll keeping a dwindling Horde camp supplied on Mount Hyjal.",
  },

  greetings = {
    { id = "g_default", text = "Ey, mon. Ya got arrows, or ya got news?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still breathin'. Dat makes ya lucky up here." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear face! Come sit by da fire, cousin, an' tell me how da islands be." },
    { id = "g_loa", when = { origin = "troll_loa_speaker" }, text = "Ey, you be da one da loa talk to, I can tell by how ya keep smilin' at nothin'. Ask 'em what dey want for lettin' us off dis mountain, mon, an' if it be funny, don't tell me." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, praise da loa. Ya know a good fletchin' when ya see one, so ya know why I be beggin' for feathers." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! Da spirits up here be loud, mon, an' dey don't care for us much, so ask 'em nicely to go easy on da camp." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ya look like ya been fightin' our fight already. Rest a while; nobody here gonna judge ya." },
  },

  start = "hello",
  nodes = {
    w2home = {
      lines = {
        { id = "w2h_troll", when = { race = "Troll" }, text = "Same as you be dreamin' of, cousin. Sit on da sand at Sen'jin wit' a line in da water an' a hot fish on a stick, an' listen ta Vol'jin's drums carry over from da Echo Isles all night long." },
        { id = "w2h_default", text = "Sit on da warm sand at Sen'jin, mon, wit' a line in da water an' no snow anywhere in sight. Maybe I be fletchin' still, but only for fish spears, an' only when I feel like it." },
      },
      choices = {
        { text = "Do you think you'll truly make it back?", next = "w2home2" },
        { text = "I'd go with you. This cold is miserable.", next = "w2home2" },
        { text = "Something else, Zet'gan.", next = "BACK" },
      },
    },
    w2home2 = {
      lines = { { id = "w2h2_default", text = "I tell da camp we will, every night, an' I say it loud so I be believin' it too. A troll can live a long time on a good joke an' a warm promise, mon, an' up here dat be most of what we got left." } },
      choices = { { text = "Then I'll help keep that promise.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_dd_xarkul", when = { questDone = TODO_QUEST("Yashiro's Windwalk") },
          text = "Yashiro say you walked da wind wit' him an' cut down dat big demon in Dae'gun, mon. Fewer demons be meanin' fewer arrows, an' I be likin' dat arithmetic very much." },
        { id = "h_default", key = true,
          text = "We been tryin' ta leave dis mountain many a time, but we keep gettin' pulled back ta defend our brothas an' sistas. Our defenses be dwindlin', an' it be time we get ta restockin', startin' wit' arrows. Lots an' lots o' dem." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Feathers in Flight") },
          text = "Dem big white owls in da valley, mon, dey got da long feathers for straight shootin'. Bring me a bundle an' da camp be shootin' straight again." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Feathers in Flight"), days = 3 } },
          text = "Da fletchers been busy since ya brought dem feathers, an' da quivers be full for da first time in weeks. Ya did good, mon." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, up in da cold. Ya people be friends o' da trees, so maybe ya can tell da trees we ain't here ta hurt nobody." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "A Forsaken, eh? Da dead walkin' to da west ain't so friendly as you, so don't go wanderin' dat way alone." },
      },
      again = { { id = "h_again", text = "Somethin' else, mon? Talk while I fletch, an' don't mind if I stick ya wit' a feather." } },
      choices = {
        { text = "You'd have left this place long ago if you could.", next = "leave" },
        { text = "What do you need for the arrows?", next = "owls" },
        { text = "What's attacking the camp?", next = "threat" },
        { text = "How fare the Darkspear here?", next = "xtroll", when = { race = "Troll" } },
        { text = "Who are your fletchers, mon?", next = "fletch" },
        { text = "What brought the Darkspear up this mountain?", next = "came" },
        { text = "What will you do when you finally get home?", next = "w2home" },
        { text = "Stay strong, Zet'gan.", next = "END" },
      },
    },
    leave = {
      big = true,
      lines = {
        { id = "l_default", text = "Every time we pack up, somebody gets cut off on da slopes, or a scout don't come back, an' we turn around ta fetch 'em. Ya don't leave ya own behind, mon, even when ya own be a fool who went chasin' a pretty bird." },
      },
      choices = {
        { text = "Then you're right to stay. No one gets left.", next = "BACK", reply = "Dat be da only way I know, mon. Good ta hear somebody else say it, too, 'cause some days I think I be da last fool on dis mountain who believes it.", fx = { align = { honor = 1 } } },
        { text = "Sometimes you cut your losses to save the rest.", next = "BACK", reply = "Maybe you be right, an' the trolls who say dat be alive and warm in Durotar, but I couldn't look dem in the eye after, so here I stay.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    owls = {
      lines = {
        { id = "o_default", text = "Dem Hyjal owls grow long feathers, white an' straight, an' dey fly true. Da birds leave plenty in dey nests south o' here, so ya don't even need ta fight 'em, if ya be quick an' quiet about it." },
      },
      choices = {
        { text = "The druids won't like it.", next = "owls_druids" },
        { text = "Something else.", next = "BACK" },
      },
    },
    owls_druids = {
      lines = {
        { id = "od_default", text = "Da bird-druids? Nah, dey don't like nothin' we do. But I only want what da owls throw away, an' if dat be too much for 'em, dey can come fletch our arrows demselves." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = {
        { id = "t_default", text = "Demons from Dae'gun, mostly, an' da dead from da west, an' sometimes da plants, if ya believe it. Dis mountain be fightin' everybody, mon, an' we just happen ta be standin' in da middle." },
      },
      choices = {
        { text = "Does anyone else hunt those demons?", next = "threat_yashiro" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threat_yashiro = {
      lines = {
        { id = "ty_default", text = "Da blademaster, yeah, we know him. He don't stay long, an' he don't eat much, but every time he come by, da demons stay away from da camp for a week. I'd give him all da arrows he want, if he used arrows." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtroll = {
      big = true,
      lines = {
        { id = "xt_default", text = "Tired, cousin, but standin'. Da loa feel far away up here, an' da cold gets in ya bones. Still, a Darkspear don't run from a fight, even when da fight won't leave him alone." },
      },
      choices = {
        { text = "We endure. That's the Darkspear way.", next = "BACK", reply = "Ya, we do, cousin, and hearin' it from one of our own puts a little warmth back in dese old bones, so maybe I stand a while longer.", fx = { align = { order = 1 } } },
        { text = "Leave when you can. Pride won't keep you warm.", next = "BACK", reply = "You not be wrong, cousin, and my knees be agreein' with you every mornin', but the loa know I can't leave dem fools on dis mountain alone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fletch = {
      lines = { { id = "fl_default", text = "Two old trolls who can't swing an axe no more, mon, an' a young one who talks too much. Dey sit by da fire all day wit' feathers an' glue an' sing da old island songs while dey work, an' da arrows come out straighter for it, or so dey tell me." } },
      choices = {
        { text = "Do the songs really help?", next = "fletch2" },
        { text = "Old warriors still serving. That's a good camp.", next = "fletch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fletch2 = {
      lines = { { id = "fl2_default", text = "Who knows, mon? But da young ones learn da songs while dey learn da arrows, an' dat way nothin' gets lost up here in da cold. A camp dat forgets its songs be just a bunch o' tired trolls wit' sticks." } },
      choices = { { text = "Then keep singing. Something else.", next = "BACK" } },
    },
    came = {
      lines = { { id = "cm_default", text = "Orders, mon, an' bad luck. We was sent ta watch da demons on da mountain an' report back, an' den da demons decided ta watch us back. Every time we try ta go, da mountain find a new way ta keep us, like it be lonely." } },
      choices = {
        { text = "Who sent you?", next = "came2" },
        { text = "The mountain doesn't seem to want anyone to leave.", next = "came2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    came2 = {
      lines = { { id = "cm2_default", text = "Somebody important, an' somebody far away, which be da same thing to a troll in da snow. Thylaen say da mountain be hurtin' an' don't want ta be left alone wit' its hurt. Maybe she right, mon. Maybe dat be why we keep comin' back." } },
      choices = {
        { text = "I'm a shaman. The spirits here are restless.", next = "BACK", reply = "Den ask 'em ta let us go, cousin, an' ask nice. I be tired o' dis view.", when = { class = "SHAMAN" } },
        { text = "Something else, Zet'gan.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darkspear, born on da islands, now freezin' on a mountain. Life be funny dat way, mon." } },
    advice = { { id = "tp_ad", text = "Keep ya quiver full an' ya back ta da fire. Dat be all da wisdom I got." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin be our chieftain, mon, and he don't send his Darkspear anywhere for nothin'. If he says freeze on a mountain, I freeze on a mountain." } },
    thrall = { { id = "tp_thrall", text = "Thrall saved de Darkspear when de sea witch and de murlocs nearly finished us. I owe him, even if I be owin' him from up here in de snow." } },
    echo_isles = { { id = "tp_echo_isles", text = "I miss da Echo Isles, mon, da warm water and da sun on my back. Up here, my back don't even remember what sun be." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "Hakkar's people be stirrin' in Zul'Gurub, de Darkspear say. Dat be a bad thing, and I be glad I'm up here away from it." } },
    scourge = { { id = "tp_scourge", text = "De dead came up dis mountain in de war, de old ones say. If dey come again, I be ready, mon, though I'd rather be warm when I do it." } },
    _none = { { id = "tp_none", text = "Don't know nothin' 'bout dat, mon. Ask somebody wit' more time ta think." } },
  },
}

-- Earthcaller Franzahl: a high elf scholar of the elements, studying above Darkwhisper Gorge.
P:NPC {
  key = "hyj_earthcaller_franzahl", id = 14348, name = "Earthcaller Franzahl", gender = "male",
  role = "scholar", tier = "service",
  temper = { "distracted", "precise" }, values = { "knowledge", "elements" },
  notices = { "class" },
  impression = {
    first = "A high elf scholar who keeps glancing at the gorge as if something might answer him.",
    third = "{name} met Earthcaller Franzahl, a high elf who studies the elements on Mount Hyjal.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ah, you again, and welcome. Come and stand by me; the elements have been chattering all morning, and you are one of the few who listens properly." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Yes, yes, I see you. Keep to the far side of the gorge, if you would, and do not touch my stones." },
    { id = "g_default", text = "Ah, a visitor. Do mind the edge; the gorge is deeper than it looks, and noisier." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I've made some progress since we last spoke, though I fear the elements have not." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" }, text = "A shaman! Then you speak to the elements as I only study them. Fascinating." },
  },
  start = "hello",
  nodes = {
    w2stone = {
      lines = {
        { id = "w2st_mage", when = { class = "MAGE" }, text = "Listening stones, though a magister of Dalaran would call them unremarkable rocks. I took each one from a different scar on this mountain, and if you lay your palm on them in turn, you will feel that each hums at its own pitch, rather like a badly tuned choir." },
        { id = "w2st_default", text = "Listening stones, as I call them. I took each one from a different scar on this mountain, and every one of them hums at its own pitch when you lay a palm on it, rather like a badly tuned choir." },
      },
      choices = {
        { text = "Which one hums the loudest?", next = "w2stone2" },
        { text = "They look like ordinary rocks to me.", next = "w2stone2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2stone2 = {
      lines = { { id = "w2st2_default", text = "The grey one at the end, which I chipped from near the roots below Nordrassil. It does not hum so much as grieve, if a stone can do such a thing, and I confess I keep it at arm's length when I sleep." } },
      choices = { { text = "Perhaps it remembers the battle.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    xorigin = {
      narr = "He polishes a small crystal on his sleeve while he speaks.",
      lines = { { id = "xorigin_default", text = "Quel'Thalas, in my youth, and later wherever my curiosity led. My people study the arcane above all. I found the elements more honest; they never pretend to be anything but what they are." } },
      choices = {
        { text = "The elements deserve respect, not commands.", next = "BACK", reply = "Quite so. They answer courtesy far more readily than they answer force.", fx = { align = { light = 1 } } },
        { text = "The elements are tools. Use them and move on.", next = "BACK", reply = "Tools, he says. They will remember that, and so shall I.", fx = { align = { light = -1 } } },
        { text = "Do you miss your homeland?", next = "xhome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhome = {
      lines = { { id = "xhome_default", text = "I miss what it was. The letters I receive grow shorter and sadder each year, and I have not the courage to go back and read the rest in person." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfavorite = {
      lines = { { id = "xfavorite_default", text = "Earth, as my title suggests. Fire is loud and water is moody, but earth remembers. Put your hand on a stone here and, if you are patient, you can feel the old war still trembling in it." } },
      choices = {
        { text = "Should we listen to the elements, or command them?", next = "xcommand" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcommand = {
      lines = { { id = "xcommand_default", text = "Ah, the oldest quarrel between shaman and mage. The shaman asks; the mage takes. I confess I have done both. Where do you stand?" } },
      choices = {
        { text = "Listen. They are not ours to command.", next = "BACK", reply = "A shaman's answer, and a humble one. I respect it.", fx = { align = { order = -1 } } },
        { text = "Command them, wisely. Power must be directed.", next = "BACK", reply = "Spoken like a magister. I am not sure I disagree.", fx = { align = { order = 1 } } },
      },
    },
    xkrixix = {
      lines = { { id = "xkrixix_default", text = "He was ambitious, and ambition in a goblin is a fuse waiting for a spark. I suspect he found something valuable and decided to keep it. I hope that is all he found." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshaman = {
      lines = { { id = "xshaman_default", text = "Everything, I suspect, though you may not be able to put it into words. Tell me, when you call upon earth, does it answer as a servant or as a friend? I have wondered that for a century." } },
      choices = {
        { text = "As a friend, when I ask properly.", next = "BACK", reply = "Then I have been asking improperly for a very long time. Fascinating." },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "I am Franzahl, called the Earthcaller by those who are generous, and I study the elements of this world, both the known and the less known. Hyjal is a remarkable place to listen to them." } },
      again = { { id = "h_again", text = "Yes? Go on, ask. I've lost my place in these notes three times already this morning, so one more interruption will hardly matter." } },
      choices = {
        { text = "Where did you study before coming here?", next = "xorigin" },
        { text = "Which element interests you most?", next = "xfavorite" },
        { text = "What happened to Krixix, do you think?", next = "xkrixix" },
        { text = "I am a shaman. What can I teach you?", next = "xshaman", when = { class = "SHAMAN" } },

        { text = "What do the elements tell you here?", next = "elements" },
        { text = "Do you work alone?", next = "alone" },
        { text = "What are these stones you guard so closely?", next = "w2stone" },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    elements = {
      lines = { { id = "e_default", text = "That they are restless, and that the scars of the war against the Legion run deep in the stone. The demons' corruption lingers in Darkwhisper Gorge, and the earth itself seems to remember it." } },
      choices = {
        { text = "Should the corruption be purged?", next = "purge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    purge = {
      lines = { { id = "p_default", text = "Ideally, yes, but purging and understanding are not the same thing. I would rather know what it is before I try to destroy it, lest I make things worse." } },
      choices = {
        { text = "Understanding first, then. A wise path.", next = "BACK", reply = "Thank you. Not everyone has the patience for scholarship.", fx = { align = { order = 1 } } },
        { text = "Burn it out before it spreads.", next = "BACK", reply = "Perhaps, but fire is an element too, and it has its own opinions.", fx = { align = { order = -1 } } },
      },
    },
    alone = {
      lines = { { id = "a_default", text = "Now I do. I once had an apprentice, Krixix, a goblin with a remarkable head for metals, but he went off on some venture of his own. I fear he did not come back." } },
      choices = { { text = "I'm sorry to hear that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    elements = { { id = "tp_xelements", text = "Earth, fire, water and air. Restless here, and wounded, but alive." } },
    krixix = { { id = "tp_xkrixix", text = "My old apprentice. A brilliant goblin with an unfortunate love of explosions." } },

    background = { { id = "tp_bg", text = "A quel'dorei scholar far from home. The elements are my study, and my company." } },
    _none = { { id = "tp_none", text = "Hmm? Oh, I wouldn't know. The elements haven't mentioned it." } },
  },
}
