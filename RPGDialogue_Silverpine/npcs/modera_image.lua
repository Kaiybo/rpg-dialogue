-- The Image of Archmage Modera (Forever only): a projection on the Lordamere shore outside Dalaran,
-- asking for outside help her council forbade. Voice: bibles/modera_image.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sp_modera_image", id = TODO_NPC("Image of Archmage Modera"), name = "Image of Archmage Modera",
  bible = "bibles/modera_image.md", role = "scholar", tier = "quest",
  communities = { "kirin_tor" }, temper = { "proud", "steady" }, values = { "loyal", "learned" },
  notices = { "class", "faction" },
  impression = {
    first = "She is defying her own council to save her city.",
    third = "{name} met the Image of Archmage Modera beside Lordamere Lake, a projection sent out of Dalaran to find help her council would not ask for.",
  },

  greetings = {
    { id = "g_default", text = "Speak plainly; holding this image together is harder than it looks." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Stay your weapon. I'm not really here, and you'd only embarrass yourself." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Good; the city has need of you still." },
    { id = "g_friend", when = { questDone = TODO_QUEST("Friend of the Kirin Tor") }, text = "The city is calm, and that is your doing as much as anyone's. The Kirin Tor remembers its friends." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You'll feel the ley lines snagging as you stand there, like a loose thread in a cloak. That's the disruption, and it's worse inside." },
    { id = "n_forsaken", cat = "faction", when = { race = "Scourge" },
      text = "I'd do anything to protect my city, undead, even consort with the likes of you. Don't make me regret it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "You've likely heard that Dalaran is suffering a magical outbreak, and that every mage we have is too busy holding the city's wards to contain it. I am Modera of the Kirin Tor, or her image, and I need hands that aren't already full." },
        { id = "h_jacques", tags = { "news" }, when = { questActive = TODO_QUEST("An Alarming Request") },
          text = "I see Emissary Jacques was successful in finding aid. It isn't strictly permitted, but we can't let our pride turn away allies in our hour of need, and don't let the guards fool you, because things in the city are anything but under control." },
        { id = "h_sewer", tags = { "news" }, when = { questActive = TODO_QUEST("Blood in the Streets") },
          text = "Stay your weapon, {race}. That key won't get you past my wards; you didn't really think we'd leave such a weakness open at a time like this? It's no coincidence the Horde has taken an interest in my city now, and in fact, I was counting on it." },
        { id = "h_heart", when = { questActive = TODO_QUEST("Heart of Disruption") },
          text = "The key will get you in by the less public way. Meet me in the Violet Citadel once you're inside, and don't stop for anything that glows." },
        { id = "h_friend", tags = { "news" }, when = { questActive = TODO_QUEST("Friend of the Kirin Tor") },
          text = "Take the mote to Archmage Celindra in the Violet Citadel. The council won't be happy to learn of our subterfuge, but they can't deny the results, and I think it's only fair that you deliver the good word yourself." },
        { id = "h_calm", when = { questDone = TODO_QUEST("Heart of Disruption") },
          text = "The city is calming, and the wards can come down a little at a time. I'm still out here, as you see, because there's always another mess, but it's a smaller mess, and I have you to thank for that." },
      },
      again = {
        { id = "h_again", text = "What else? My concentration has limits." },
        { id = "h_again2", text = "Ask quickly, before this image frays." },
      },
      choices = {
        { text = "What happened in Dalaran?", next = "outbreak" },
        { text = "Why are you only an image?", next = "image" },
        { text = "Why keep this a secret?", next = "council" },
        { text = "Why would you ask the Horde for help?", next = "horde", when = { faction = "Horde" } },
        { text = "What are these creatures loose in the city?", next = "remnants" },
        { text = "I've come from the Sky Enclave's people, Archmage.", next = "skyborne", when = { race = "Skyborne", faction = "Alliance" } },
        { text = "What's your proposition?", next = "proposition", when = { any = { { questActive = TODO_QUEST("Blood in the Streets") }, { questDone = TODO_QUEST("Blood in the Streets") } } } },
        { text = "Who is Emissary Jacques?", next = "jacques", when = { any = { { questActive = TODO_QUEST("An Alarming Request") }, { questDone = TODO_QUEST("An Alarming Request") } } } },
        { text = "How do I get into the city?", next = "sewers", when = { questActive = TODO_QUEST("Heart of Disruption") } },
        { text = "What will the council say now?", next = "after", when = { questDone = TODO_QUEST("Heart of Disruption") } },
        { text = "I'm a mage. Let me help hold the wards.", next = "m_wards", when = { class = "MAGE" } },
        { text = "I studied in Dalaran. Your council shut me out to die.", next = "m_forsaken", when = { class = "MAGE", race = "Scourge" } },
        { text = "A Horde mage at your gate. Does that trouble you?", next = "m_hordemage", when = { class = "MAGE", race = { "Orc", "Troll", "Tauren" } } },
        { text = "Farewell, Archmage.", next = "END" },
      },
    },
    m_wards = {
      lines = { { id = "mw_default", text = "Kind, and impossible: the wards are keyed to the Six and their circles, and a stranger's mana would only snag on them like a second thread. What I need from a mage is your eyes, so tell me what you feel from the ley lines here, because those of us inside are too close to judge." } },
      choices = {
        { text = "It pulls upward, toward the top of the Citadel.", next = "m_wards2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_wards2 = {
      big = true,
      lines = { { id = "mw2_default", text = "Upward. Yes, that matches what the others felt, though none of them would say so aloud. Whatever fell in the parlours is drawing the city's power to itself, and if you go in, mage, keep your own mana close, or it will try to take that too." } },
      choices = {
        { text = "Then I'll go in and face it.", next = "BACK", reply = "Good. Go armored, keep a gem in your pocket, and don't let anything in the streets talk you into a duel.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your city's power isn't mine to risk.", next = "BACK", reply = "Fair. It isn't, and I've no right to ask. I'm asking anyway, because nobody else will.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_forsaken = {
      big = true,
      lines = { { id = "mf_default", text = "Yes. We shut the gates while the plague came down the roads, and I stood on the wall while we did it, and I'd stand there again, because the Kirin Tor could not save Lordaeron and could only fail to save itself as well. I won't ask your forgiveness, mage; I'll ask your help, which is harder for us both." } },
      choices = {
        { text = "I'll help, for the students inside, not for you.", next = "BACK", reply = "That's more than fair, and more than we gave you. Thank you.", fx = { align = { light = 1 } } },
        { text = "Let your city burn as mine did.", next = "BACK", reply = "Then go, and I won't blame you for it. But you came to this lake for some reason, and I don't think it was to watch.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_hordemage = {
      big = true,
      lines = {
        { id = "mh_default", text = "It troubles my council a great deal and me only a little. Dalaran never taught any of your people, and you learned anyway, which says something unflattering about our gatekeeping. Help me now, and perhaps one day the gates will remember you." },
        { id = "mh_orc", when = { race = "Orc" }, text = "It troubles my council a great deal. The last orcs who studied magic seriously opened the Dark Portal, and we've not forgotten, but you're standing at my lake with arcane on your hands and not fel, and that interests me more than it frightens me." },
      },
      choices = {
        { text = "I'll help because it's right, whatever banner I fly.", next = "BACK", reply = "Then you're better than half the Six. Don't tell them I said so.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll help because the Horde profits by it.", next = "BACK", reply = "Honest, at least. The Kirin Tor have done worse things for less honest reasons.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outbreak = {
      lines = {
        { id = "o_default", key = true, text = "Something disrupted our ley lines, and it began at the top of the Violet Citadel. A thunderous crash rang out from the parlours up there, and since then the city's constructs have turned erratic and destructive and the streets are flooded with rampant arcane power." },
      },
      choices = {
        { text = "What caused the crash?", next = "cause" },
        { text = "Why not just open the gates?", next = "wards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cause = {
      lines = {
        { id = "c_default", text = "We don't know yet, and I won't guess aloud in front of a stranger. Whatever it was is still up there, and the closer you come to the parlours, the worse the disruption gets, which tells me where the answer is, if not what it is." },
      },
      choices = {
        { text = "Then someone should go up there.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wards = {
      lines = {
        { id = "wa_default", text = "Because the wards are the only thing keeping the outbreak inside the walls instead of spilling across Lordamere and into your lap. The barrier has already faltered once, and every magus we have is holding it up by main force, so the gates stay shut and help comes in by quieter ways." },
      },
      choices = {
        { text = "What quieter ways?", next = "sewers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sewers = {
      lines = {
        { id = "se_default", text = "The sewers along the northern edge of the city, which nobody admires and nobody thought to ward properly until I did. Take the key, find your way in, and meet me in the Violet Citadel; the Kirin Tor are busy inside, and you'll want a less public approach." },
      },
      choices = {
        { text = "Not the grandest entrance.", next = "sewers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sewers2 = {
      lines = {
        { id = "s2_default", text = "No, and I'd rather you didn't mention it to anyone in a violet robe. Dalaran's pride has survived worse than an adventurer climbing out of a drain, but only just." },
      },
      choices = {
        { text = "My lips are sealed.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    proposition = {
      big = true,
      lines = {
        { id = "pr_default", text = "Simple enough: you came to pick over my city while it was weak, and I'll let you in to do something useful instead. Help me put down the disruption, and I'll forget I ever found a Horde key in my sewers. Will the Horde keep its side of that bargain?" },
      },
      choices = {
        { text = "We'll keep it. You have my word.", next = "BACK", reply = "Your word, from a Horde adventurer in my ruins. Strange times, but I'll take it, and I'll remember it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We'll keep it as long as it serves us.", next = "BACK", reply = "Then we understand each other perfectly, and I'll keep it for exactly as long as it serves me too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jacques = {
      lines = {
        { id = "ja_default", text = "One of our emissaries, a good, anxious young man who I sent out to find help in Southshore without quite telling the council I'd done it. He'll be relieved you came; he was convinced nobody would believe him." },
      },
      choices = {
        { text = "He was very convincing.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Pages of it, most of it about procedure, and none of it about the fact that the city is still standing. Let them; Archmage Celindra will tell them what you did, and the Six can't deny results, however much they'd like to." },
      },
      choices = {
        { text = "Who is Celindra?", next = "celindra" },
        { text = "Something else.", next = "BACK" },
      },
    },
    celindra = {
      lines = {
        { id = "ce_default", text = "A colleague in the Violet Citadel, and one of the few there who'll listen to sense when the council won't. She knew what I was doing out here and said nothing, which in Dalaran is very nearly a declaration of friendship." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    image = {
      lines = {
        { id = "i_default", text = "Because I'm needed inside, holding wards with the rest of them, and I can't spare my body for a walk along the shore. A projection costs me attention rather than presence, and I have slightly more of the one than the other just now." },
      },
      choices = {
        { text = "Can you feel what I do?", next = "image2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    image2 = {
      lines = {
        { id = "i2_default", text = "I can see and hear you well enough, and that's all. If you strike this image you'll only scatter a little light and annoy me, so please don't try; better adventurers than you have." },
      },
      choices = {
        { text = "I wouldn't dream of it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      big = true,
      lines = {
        { id = "co_default", text = "The high council ordered us to keep the matter private, so as not to shame the Kirin Tor, and I understand why. But we can't keep up the charade forever while the city is overrun, so I sent Jacques out for help and came out here myself, and I'll answer to the Six afterward. Do you think me a traitor to my order for it?" },
      },
      choices = {
        { text = "No. Your city comes before your council's pride.", next = "BACK", reply = "You sound like my own conscience, and it's been saying the same for months. I'll carry that, whatever comes.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Orders exist for a reason. You should have obeyed.", next = "BACK", reply = "I did obey, and look where obedience has left me, an image guarding a broken door. Perhaps you're right, but I doubt it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      big = true,
      lines = {
        { id = "ho_default", text = "Because the Horde was already at my door, picking at my patrols and looking for a way in. I'd do anything to protect my city, even this, and I prefer you inside on my terms than outside on yours. Tell me plainly why the Horde wants in." },
        { id = "ho_forsaken", when = { race = "Scourge" },
          text = "Because your queen's people were already at my door, and I'd do anything to protect my city, even consort with the likes of you. Better you inside on my terms than outside on yours. So tell me, undead, and don't dress it up: why does the Undercity want in?" },
      },
      choices = {
        { text = "I will be honest. We want what your city knows.", next = "BACK", reply = "Honesty, at last, and from the Horde of all places. Then we both know what we're bargaining over.", fx = { align = { honor = 1 } } },
        { text = "The Horde's reasons are the Horde's business, Archmage.", next = "BACK", reply = "Then keep them, and I'll keep mine. We needn't like each other to be useful to each other.", fx = { align = { honor = -1 } } },
        { text = "I'm here to help. A broken Dalaran helps no one.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    remnants = {
      lines = {
        { id = "r_default", text = "The breach has damaged many of our factotums and enchantments, including those that tend our defenses. Worse, the loose arcane energy has drawn rogue elementals that want to soak themselves in it, and the mana echoes and remnants grow fatter by the hour while we're busy holding the wards." },
      },
      choices = {
        { text = "I'll thin them out.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "One of the Skyborne, out here on the shore! Archmage Ansirem of our council will be beside himself; he's been talking about your people for months. You'll find the wards hum differently around you, I suspect, and I'd dearly love to know why once all this is over." },
      },
      choices = {
        { text = "I'd be glad to tell you, Archmage.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a magus of the Kirin Tor and I serve my city. The rest can wait until it isn't on fire." } },
    advice = { { id = "tp_ad", text = "Don't touch anything that hums. In Dalaran just now, that's most things." } },
    _none = { { id = "tp_none", text = "I haven't the attention to spare for that just now. Ask me again when the city is quiet." } },
  },
}
