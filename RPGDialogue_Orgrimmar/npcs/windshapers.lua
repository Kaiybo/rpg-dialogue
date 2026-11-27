-- The Skyborne Windshapers in Orgrimmar (Forever): Corswyn Aseril and Aeigelyges in
-- Grommash Hold, and Yiyo Nightwalker in the Cleft of Shadow.
-- Skyborne facts only from BRIEF.md section 10. Voice: bibles/windshapers.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Corswyn Aseril: the senior Windshaper at the Warchief's hall.
---------------------------------------------------------------------------
P:NPC {
  key = "corswyn", id = TODO_NPC("Corswyn Aseril"), name = "Corswyn Aseril", title = "Windshaper",
  bible = "bibles/windshapers.md", role = "noble", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "proud" }, values = { "loyal", "wise" },
  notices = { "race", "class", "origin" },

  impression = {
    first = "Every word she speaks is weighed for the Warchief's ears.",
    third = "{name} met Corswyn Aseril, a Skyborne Windshaper who stands among the Warchief's company in Grommash Hold.",
  },

  greetings = {
    { id = "g_default", text = "Winds be with you, friend of the Horde. You may speak freely here, though the Warchief's guards will listen as freely." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned to the Hold, and the winds brought you back unharmed. Sit with me a while, if your errands allow it." },
    { id = "g_sky", when = { race = "Skyborne" }, text = "Winds be with you, child of Zephras. It eases my heart to see one of our own walk into this hall with a straight back." },
    { id = "g_tb", when = { reputation = { faction = "Thunder Bluff", min = "honored" } }, text = "The tauren speak well of you, I'm told. They took us in when we had nowhere to stand, so their friends are mine." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN", race = { "Orc", "Troll", "Tauren" } },
      text = "A shaman of the Horde. I'd like to know, one day, whether the spirits of this red land answer you as freely as ours once answered us." },
    { id = "n_windshaper", cat = "origin", when = { origin = "skyborne_windshaper" }, place = "before",
      text = "You passed the trials, I can see it in how you hold yourself. Did the sapta burn going down? It burned for me, and I've never forgotten it." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You look at my ears the way many orcs here do, as though you were remembering another war against other elves. We are not the elves you fought, friend, though I understand why the face is hard to forget." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Corswyn Aseril of the Windshapers. Our people came to the Horde through the Earthen Ring and the hospitality of Thunder Bluff, and I stand in the Warchief's hall so that he need never wonder what the Windshapers think." },
        { id = "h_sky", when = { race = "Skyborne" },
          text = "I am Corswyn Aseril, and you need no introduction to the Windshapers, for you are one of us. Tell me, have you come from Camp Gev'rek, and does Ayessa Dawnsinger still keep the fires lit there?" },
        { id = "h_shaman", when = { class = "SHAMAN", race = { "Orc", "Troll", "Tauren" } },
          text = "I am Corswyn Aseril of the Windshapers. You and I both honor the elements, shaman, though we learned to do it under very different skies, and I think we have much to teach each other." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "I am Corswyn Aseril of the Windshapers. Our dead are burned and given to the wind, so if I look at you a moment too long, I mean no insult by it." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. The Warchief is occupied, and I have time." },
        { id = "h_again2", text = "Is there more? Speak on, friend." },
        { id = "h_again3", text = "The hall is loud, but I'm listening." },
      },
      choices = {
        { text = "Why does the Warchief keep a Windshaper at his side?", next = "envoy" },
        { text = "Why did your people leave the sky?", next = "skywall" },
        { text = "What do the Windshapers believe?", next = "spirits" },
        { text = "What of the other Skyborne, the ones with the Alliance?", next = "order" },
        { text = "How do you find Orgrimmar?", next = "city" },
        { text = "How fares Camp Gev'rek?", next = "x_camp", when = { race = "Skyborne", faction = "Horde" } },
        { text = "Does the wind answer you here, Windshaper?", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Winds be with you, Corswyn.", next = "END" },
      },
    },

    envoy = {
      lines = {
        { id = "en_default", text = "We are new to the Horde, and new things are watched closely, and rightly so. If I am here, the Warchief can ask me what he likes, and his advisors can see that the Windshapers have nothing to hide." },
      },
      choices = {
        { text = "Does the Warchief trust you?", next = "envoy_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    envoy_trust = {
      lines = {
        { id = "et_default", text = "He listens, which is more than I expected of a warlord, and he asks about the spirits before he asks about our spears. Trust is earned slowly, and I'd think less of him if he gave it all at once." },
      },
      choices = {
        { text = "He was a slave once. He knows what trust costs.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    skywall = {
      lines = {
        { id = "sk_default", text = "Our patrons, the wind spirits, went silent and then vanished, and the old pylons began to fail and the isles to drift apart. When the Al'Aketh lit their beacon to Al'Akir, staying would have meant waiting for the Windlord's anger, so we came down to Azeroth." },
      },
      choices = {
        { text = "Who are the Al'Aketh?", next = "skywall_cult" },
        { text = "Do you miss the sky?", next = "skywall_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    skywall_cult = {
      lines = {
        { id = "sc_default", text = "A cult of our own people who worship Al'Akir, with shaved heads and grey robes. They fed on our fear while the wards failed, and their high priestess, Lorthuna, was beaten only with the help of the Earthen Ring and the Kirin Tor.", fx = { learn = { "al_aketh" } } },
      },
      choices = {
        { text = "Then the Earthen Ring has earned your thanks.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skywall_miss = {
      lines = {
        { id = "sm_default", text = "Every morning. Here the wind comes off the desert hot and full of grit, and in Skywall it came clean and cold off the open air, with nothing beneath your feet but more sky. But a people can't live on what they miss." },
      },
      choices = {
        { text = "Durotar will grow on you.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    spirits = {
      lines = {
        { id = "sp_default", text = "We honor all four elements, as the shamans of the Horde do, but we owe our lives to the wind spirits who sheltered our ancestors after the Sundering. Our initiates pass the elemental trials and drink enchanted sapta, and they carry that debt for the rest of their days." },
      },
      choices = {
        { text = "And the spirits left you anyway.", next = "spirits_gone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_gone = {
      big = true,
      lines = {
        { id = "sg_default", text = "They did, and some of our young ones say a debt to someone who abandons you is no debt at all. I don't believe that, but I'll admit it's harder to teach than it used to be. What do you say?" },
      },
      choices = {
        { text = "A debt is a debt. Honor it, whether they return or not.", next = "BACK", reply = "That is what I believe, and it heartens me to hear it from you. I'll keep the old offerings each dawn, whether the spirits come to take them or not.", fx = { align = { honor = 1 } } },
        { text = "They left. Your people owe them nothing now.", next = "BACK", reply = "Many of our young ones would agree, and I can't fault their hurt. But I'll keep my debts, all the same.", fx = { align = { honor = -1 } } },
        { text = "Perhaps they had their reasons for leaving.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    order = {
      lines = {
        { id = "or_default", text = "The High Order went to the Kirin Tor and the Alliance, and we went to the Earthen Ring and the Horde. Between us there are quarrels over sacred places and deaths, and some of those quarrels ended in blood before we ever left the isles.", fx = { learn = { "two_orders" } } },
      },
      choices = {
        { text = "Could the two orders ever be reconciled?", next = "order_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    order_peace = {
      big = true,
      lines = {
        { id = "op_default", text = "Some in the camp say the dead must be answered before anyone speaks of peace. Others say we are too few to keep killing each other on a world this large. I serve the Horde now, so tell me how a member of the Horde would see it." },
      },
      choices = {
        { text = "Old grudges help no one. Seek peace with your kin.", next = "BACK", reply = "That is my hope, and I'm glad to hear it from a member of the Horde. Perhaps there's room for peace after all.", fx = { align = { light = 1 } } },
        { text = "They chose the Alliance. They are enemies now.", next = "BACK", reply = "That is the hard answer, and many in the camp would give it. I'll carry it to them, though it weighs on me.", fx = { align = { light = -1 } } },
        { text = "That's for your people to decide, not me.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    city = {
      lines = {
        { id = "ci_default", text = "Loud, hot and honest, which I find I like. The orcs say what they think of us to our faces, and most of it is suspicion, but suspicion spoken aloud is far easier to answer than the kind that whispers." },
        { id = "ci_orc", when = { race = "Orc" }, text = "Loud, hot and honest, which I find I like. Your people say what they think of us to our faces, and I've learned more about orcs in a month of being glared at than in a year of being told about them." },
      },
      choices = {
        { text = "Has anyone given you trouble?", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    x_camp = {
      lines = {
        { id = "xc_default", text = "Well, the last I heard, and the tauren have been generous with their land and their patience. Ayessa writes that the young ones are learning to hunt on the plains of Mulgore, which is a strange thing for people raised among clouds." },
        { id = "xc_windshaper", when = { origin = "skyborne_windshaper" }, text = "Well, the last I heard, and our initiates still go through the trials there, though the elements speak more quietly to them than they did to us. Tell me, when you passed yours, did your skysight come easily?" },
      },
      choices = {
        { text = "It came. I fear it's growing weaker, though.", next = "x_skysight" },
        { text = "Something else, Windshaper.", next = "BACK" },
      },
    },
    x_skysight = {
      lines = {
        { id = "xs_default", text = "You're not alone in that. Many of us see the spirits less clearly than our grandparents did, and no one can say why, so we keep practicing and hope the gift is only tired." },
      },
      choices = {
        { text = "Then I'll keep practicing.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_shaman = {
      lines = {
        { id = "xsh_default", text = "Faintly, and in a voice I don't know yet. The wind of this land is older and angrier than ours was, I think, but it hasn't refused me, and I'd call that a beginning." },
        { id = "xsh_sky", when = { race = "Skyborne" }, text = "Faintly, as I expect it answers you. The winds of Azeroth are strangers to us both, and we'll have to be patient with them as they're being patient with us." },
      },
      choices = {
        { text = "Thrall's shamans could help you listen.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "Two orders from one people, and the quarrel between them is older than our coming down. I'll speak of it carefully, if you'll forgive me, because there are deaths on both sides." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes and shaved heads, and a hunger to give our people to Al'Akir. If you ever see them on Azeroth, friend, send word to Grommash Hold." } },
    background = { { id = "tp_bg", text = "I was a Windshaper long before we came down from the sky, and now I'm one in a hall of orcs, which is not a life I expected. That's all the story I'll give in a room this full of ears." } },
    advice = { { id = "tp_ad", text = "Listen before you speak, and listen again before you act. The wind rewards patience, and so, I've found, does the Warchief." } },
    _none = { { id = "tp_none", text = "I can't speak to that, friend. Ask one of the Warchief's advisors; they know this land far better than I do." } },
  },
}

---------------------------------------------------------------------------
-- Aeigelyges: the younger Windshaper in Grommash Hold.
---------------------------------------------------------------------------
P:NPC {
  key = "aeigelyges", id = TODO_NPC("Aeigelyges"), name = "Aeigelyges",
  bible = "bibles/windshapers.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "earnest" }, values = { "curious", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "He asks nearly as many questions as he answers.",
    third = "{name} met Aeigelyges, a young Skyborne Windshaper who keeps company with Corswyn Aseril in Grommash Hold.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Winds be with you, friend! I'm still learning, but I'm glad you're here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Winds be with you. Forgive me, I'm still learning. Please be patient with me." },
    { id = "g_default", text = "Winds be with you! Forgive me, I'm still learning how one greets people here, and I'm told shouting is involved." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I've been practicing the orcish greeting since, and I think I've nearly got it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The tauren of Mulgore fed us when we first came down, and I never thanked them properly. Will you take my thanks to them, for what it's worth?" },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "That axe has seen more fighting than I have, I'd wager, and you carry it as if it weighed nothing. How long does it take to learn that?" },
  },

  start = "hello",
  nodes = {
    w2hard = {
      lines = {
        { id = "w2hd_sky", when = { race = "Skyborne" }, text = "You'll laugh, because I suspect you felt it too: the roofs. Everything here has a roof, and I keep glancing up for the sky and finding stone, and the orcs think I'm checking for falling rocks." },
        { id = "w2hd_default", text = "The roofs, if you'll believe it. Everything here has a roof, and I keep glancing up for the sky and finding stone instead, and the orcs think I'm checking for falling rocks." },
      },
      choices = {
        { text = "Are you, sometimes?", next = "w2hard2" },
        { text = "A roof keeps out the rain, at least.", next = "w2hard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2hard2 = {
      lines = { { id = "w2hd2_default", text = "Only after a grunt told me about the earthquakes, so thank you very much for reminding me. I've started standing near the great door of the hall, where I can see a strip of sky, and Corswyn pretends not to notice." } },
      choices = { { text = "A sensible place to stand.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    ae_corswyn = {
      lines = { { id = "ae_corswyn_l", text = "Whatever he asks, and he asks more than I expected of a warchief. He wants to know how our shaman speak to the wind, and Corswyn answers carefully, because she says every word we give here is a promise someone will remember." } },
      choices = {
        { text = "Does she trust the Warchief?", next = "ae_corswyn2" },
        { text = "Careful words make sense in a new home.", next = "ae_corswyn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ae_corswyn2 = {
      lines = { { id = "ae_corswyn2_l", text = "She trusts that he listens, which she says is the beginning of trust and not the end of it. The Earthen Ring vouched for us to the Horde, and Corswyn means to deserve it, one conversation at a time." } },
      choices = {
        { text = "Then she's doing well.", next = "BACK" },
        { text = "Something else, Aeigelyges.", next = "BACK" },
      },
    },
    ae_camp = {
      lines = { { id = "ae_camp_l", text = "I did, though I spent only a little time there before Corswyn asked me to come with her. Ayessa Dawnsinger leads the Windshapers from the camp, and the tauren of Mulgore have been kinder to us than we had any right to hope." } },
      choices = {
        { text = "Do you miss the camp?", next = "ae_camp2" },
        { text = "The tauren are generous to strangers.", next = "ae_camp2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ae_camp2 = {
      lines = { { id = "ae_camp2_l", text = "I miss the open sky over the grass, which is the nearest thing I have found to home. Orgrimmar's sky is a strip between red cliffs, and some mornings I climb as high as the guards allow just to feel the wind properly." } },
      choices = {
        { text = "Winds be with you, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ae_tauren = {
      lines = { { id = "ae_tauren_l", text = "They did, and I've wanted to thank one of you properly ever since. Your people gave us land when we had none and asked nothing back but that we honour it, and I mean to." } },
      choices = {
        { text = "The Earth Mother welcomes all who honour her.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I'm Aeigelyges, and I keep Corswyn company while she keeps the Warchief company. Mostly I watch, because there's so much in this hall I don't understand yet, and I learn more by watching than by guessing." },
        { id = "h_sky", when = { race = "Skyborne" },
          text = "Aeigelyges, and you're one of ours! Tell me, does the ground still feel strange under your feet, or is it only me?" },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I've questions of my own, if you run out." },
        { id = "h_again2", text = "Go on, please. I'm glad of the talk." },
      },
      choices = {
        { text = "What have you learned about the orcs?", next = "orcs" },
        { text = "Who was this hall named for?", next = "grom" },
        { text = "Will your people stay on Azeroth?", next = "stay" },
        { text = "It's not only you. The ground is strange.", next = "x_ground", when = { race = "Skyborne" } },
        { text = "What does Corswyn speak to the Warchief about?", next = "ae_corswyn" },
        { text = "You came from Camp Gev'rek, in Mulgore?", next = "ae_camp" },
        { text = "I'm a tauren. My people took yours in, I hear.", next = "ae_tauren", when = { race = "Tauren" } },
        { text = "What's the hardest thing to get used to here?", next = "w2hard" },
        { text = "Winds be with you.", next = "END" },
      },
    },
    orcs = {
      lines = {
        { id = "or_default", text = "That they shout when they're pleased and shout louder when they're angry, so you have to watch their faces. And that each of them seems to have lost something in the wars, which makes me think we have more in common than either of us expected." },
      },
      choices = {
        { text = "What did your people lose?", next = "orcs_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs_lost = {
      lines = {
        { id = "ol_default", text = "Our home, for one, and our patrons, and some of our dead to the Al'Aketh and to our own quarrels. The orcs lost a homeworld, they tell me, so I try not to complain about a few islands too loudly in this hall." },
      },
      choices = {
        { text = "A loss is a loss, Aeigelyges.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grom = {
      lines = {
        { id = "gr_default", text = "Grom Hellscream, they tell me, an orc who drank demon blood and then killed the demon who'd cursed his people, and died doing it. The orcs speak of him the way we speak of the Shal'nan, as someone who freed them at a terrible price." },
      },
      choices = {
        { text = "Who was the Shal'nan?", next = "grom_shalnan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grom_shalnan = {
      lines = {
        { id = "gs_default", text = "Our first leader, who led the rebellion out of Eldre'Thalas and later gave up rule and vanished along with the wind spirits. No one knows what became of the Shal'nan, and I find I'd rather not guess in front of strangers.", fx = { learn = { "shal_nan" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stay = {
      big = true,
      lines = {
        { id = "st_default", text = "Corswyn says we must build a home here and stop looking up. Others at the camp say our place is with the spirits, wherever they've gone, and that we should keep searching until we find them. Which would you choose?" },
      },
      choices = {
        { text = "Build here. The Horde is your home now.", next = "BACK", reply = "Corswyn will be pleased to hear it, and perhaps I should be too. The Horde has been kind to us.", fx = { align = { order = 1 } } },
        { text = "Keep searching. A people shouldn't forget the sky.", next = "BACK", reply = "That's what my heart says, though Corswyn would disagree. The sky is still ours, wherever the spirits went.", fx = { align = { order = -1 } } },
        { text = "I think you'll have to decide that yourself.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    x_ground = {
      lines = {
        { id = "xg_default", text = "I'm glad to hear it, because Corswyn walks as if she'd been born on stone. I still catch myself reaching for the wind before I step off a ledge, and in Orgrimmar that gets you very strange looks." },
      },
      choices = {
        { text = "Walk on Air works fine going down, at least.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was young when the isles began to drift, and I came down with the Windshapers. That's most of my story so far, and I'm hoping Orgrimmar adds a better chapter." } },
    advice = { { id = "tp_ad", text = "Watch an orc's face, not his voice. Corswyn taught me that on my first day here, and it's saved me from a lot of fright." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. I'm still learning this city, and that's one thing I haven't learned yet." } },
  },
}

---------------------------------------------------------------------------
-- Yiyo Nightwalker: a Windshaper who keeps to the Cleft of Shadow.
---------------------------------------------------------------------------
P:NPC {
  key = "yiyo", id = TODO_NPC("Yiyo Nightwalker"), name = "Yiyo Nightwalker",
  bible = "bibles/windshapers.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry", "sharp" }, values = { "cautious", "cunning" },
  notices = { "race", "class", "fel" },

  impression = {
    first = "I can't tell whether she hides from the city or watches it.",
    third = "{name} met Yiyo Nightwalker, a Skyborne Windshaper who lingers in Orgrimmar's Cleft of Shadow.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Winds be with you, friend. Even down here, they find you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Winds be with you, though they rarely reach down here, and rarely reach you." },
    { id = "g_default", text = "Winds be with you, though they rarely reach down here. That's rather the point." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the Cleft? Either you like the shade, or you've business with the people in it, and I'm curious which." },
    { id = "g_stealth", when = { stealthed = true }, text = "Your shadow moved against the torchlight, so you may as well stop creeping and say hello." },
  },

  notice = {
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" }, place = "before",
      text = "You smell of the same sulphur that hangs about the Cleft, warlock. I'll talk to you, but I'll stand where I can see your hands." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue who knows enough to keep to the walls. You'd have done well among the Peacekeepers' scouts, though I doubt you'd have liked their rules." },
    { id = "n_sky", cat = "race", when = { race = "Skyborne" },
      text = "One of ours, down here in the dark? Then you know why I'd rather be somewhere the wind can't find me for a while." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Yiyo Nightwalker, of the Windshapers. Everyone asks why a Skyborne would choose the Cleft of Shadow, and the honest answer is that after a lifetime in the open sky, I wanted somewhere quiet and close, where I could hear myself think." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "Yiyo Nightwalker. I keep to the Cleft because it's quiet, and because I like to see who comes down here to deal in things the Warchief's shamans won't touch." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep your voice low; the Cleft carries sound." },
        { id = "h_again2", text = "Ask, then. I'll keep one eye on the street while you do, if it's all the same to you." },
      },
      choices = {
        { text = "Why the Cleft, really?", next = "why" },
        { text = "What do you make of the people down here?", next = "people" },
        { text = "Do you miss the sky?", next = "sky" },
        { text = "What cult grew back home?", next = "cult" },
        { text = "Who in the Cleft worries you most?", next = "who" },
        { text = "Do you ever visit Camp Gev'rek?", next = "camp" },
        { text = "Will the wind spirits ever speak to us again?", next = "silence", when = { race = "Skyborne" } },
        { text = "Winds be with you, Yiyo.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because I've seen what grows in a city's shadows when no one is watching. Back home a cult grew fat on our fear while the elders argued, and by the time anyone looked, its beacon was already lit." },
      },
      choices = {
        { text = "You think something like that is growing here?", next = "why_watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_watch = {
      big = true,
      lines = {
        { id = "ww_default", text = "I don't know, and that's why I watch. Corswyn says a guest should keep her eyes on her own business, and perhaps she's right, but I'd rather be rude than be too late a second time. Would you watch, or would you act?" },
      },
      choices = {
        { text = "Watch, learn, and strike when you're certain.", next = "BACK", reply = "That's what I'm trying to do, and it's a comfort to hear it called wise. Corswyn may yet forgive my rudeness.", fx = { align = { honor = -1 } } },
        { text = "Take your worries to the Warchief openly.", next = "BACK", reply = "Openly? That takes more courage than I have, but perhaps you're right. I'll think on it.", fx = { align = { honor = 1 } } },
        { text = "I'd mind my own business, like Corswyn says.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    people = {
      lines = {
        { id = "pe_default", text = "Rogues and warlocks, mostly, and the merchants who sell to both, and a few who come down here only to be left alone. Most of them are loyal to the Horde, I think, but in the dark it's hard to tell the loyal from the merely quiet." },
      },
      choices = {
        { text = "Careful. They might say the same of you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky = {
      lines = {
        { id = "sk_default", text = "I miss the quiet of it, the way the wind went silent at night high over the isles. Down here I have the quiet without the wind, and I'm still deciding whether that's better or worse." },
        { id = "sk_sky", when = { race = "Skyborne" }, text = "You know the answer to that as well as I do. I miss the quiet of it, and down here I have the quiet without the wind, which helps and doesn't." },
      },
      choices = {
        { text = "You'll find your own quiet in Kalimdor.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "cu_default", fx = { learn = { "al_aketh" } }, text = "The Al'Aketh, who shaved their heads and wore grey and prayed to Al'Akir when our own wind spirits went quiet. They offered answers when the elders had none, and frightened people will follow anyone who sounds certain." } },
      choices = {
        { text = "What did they do?", next = "cult_beacon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_beacon = {
      lines = { { id = "cb_default", text = "When the old wards failed, their high priestess Lorthuna lit a beacon for Al'Akir's servants, and it took the Kirin Tor and the Earthen Ring together to put her down. I had walked past their meetings for a year and never thought them more than sad folk with shaved heads." } },
      choices = {
        { text = "And then your people left Skywall.", next = "cult_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_leave = {
      lines = { { id = "cl_default", text = "Rohash of the Conclave said he would tell the Windlord what we were, so we left before anyone could find out what that meant. The High Elder thought we might have years, but I would rather not test an elemental lord's patience from his own doorstep." } },
      choices = { { text = "Something else, Yiyo.", next = "BACK" } },
    },
    who = {
      lines = {
        { id = "wo_default", text = "No one I could name to a guard, which is the trouble. There is a chasm below the Cleft that breathes heat on cold nights, and I've seen robed figures go toward it who never seem to come back the same way." },
        { id = "wo_rogue", when = { class = "ROGUE" }, text = "No one I could name, {class}, and you'd know better than me how easy it is to vanish in a place like this. There is a chasm below the Cleft that breathes heat, and robed figures go toward it who never come back the same way." },
      },
      choices = {
        { text = "The chasm under the Cleft?", next = "who_chasm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_chasm = {
      lines = { { id = "wc_default", fx = { learn = { "burning_blade" } }, text = "Ragefire Chasm, the guards call it, and they say troggs and worse live down in the heat, and that the Warchief's people go down to clear it now and then. I hear the name Burning Blade whispered near its mouth, and I don't know what it means, so I keep listening." } },
      choices = {
        { text = "Tell the guards what you've seen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Find out yourself. Guards only make noise.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "Now and then, when Ayessa Dawnsinger asks for all of us, and I go and sit at the back of the council fire in Mulgore. Half the camp wants to build there for good, and half wants to keep searching for the spirits, and they argue it out every time I visit." } },
      choices = {
        { text = "Which half are you?", next = "camp_side" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_side = {
      lines = { { id = "cs_default", text = "Neither, which pleases no one. I think we should learn this land first, its spirits and its shadows both, before we decide what to build on it or what to go looking for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    silence = {
      lines = { { id = "si_default", text = "I don't know, and I distrust anyone who says they do. My skysight grows dimmer each season, and the Earthen Ring's shamans hear spirits I cannot, so perhaps the world is still speaking and we have simply forgotten how to listen." } },
      choices = {
        { text = "Then we'll learn to listen again.", next = "BACK", fx = { affinity = 1 } },
        { text = "Or they abandoned us, and we move on.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    burning_blade = { { id = "tp_bb", text = "I've heard the Burning Blade whispered of in the Cleft, and seen people go quiet when it was said aloud. That tells me more than any answer would." } },
    background = { { id = "tp_bg", text = "I'm a Windshaper who came down with the rest, and I've chosen to keep my own company since. That's as much as I share in the Cleft." } },
    advice = { { id = "tp_ad", text = "Anyone who tells you a secret for free has already sold it to someone else. Remember that down here." } },
    al_aketh = { { id = "tp_alaketh", next = "cult", text = "Grey robes and shaved heads, and prayers to the Windlord. I walked past them for a year before I understood what they were." }, { id = "tp_alaketh2", text = "Lorthuna's beacon is out, and I check the Cleft's shadows anyway. Old habits." } },
    _none = { { id = "tp_none", text = "I don't know, and in the Cleft it's wiser not to guess." } },
  },
}
