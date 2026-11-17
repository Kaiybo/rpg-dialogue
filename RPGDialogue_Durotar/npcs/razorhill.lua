-- Razor Hill: the barracks on Durotar's crossroads. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "garthok", id = TODO_NPC("Gar'Thok"), name = "Gar'Thok",
  bible = "bibles/durotar.md", role = "soldier", tier = "major",
  communities = { "razor_hill" }, temper = { "terse" }, values = { "dutiful", "loyal" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Gar'Thok speaks in orders and expects reports in return, and he holds Razor Hill as if all of Durotar depended on it. Having seen the roads that meet there, I think perhaps it does.",
    third = "{name} met Gar'Thok, the terse commander of Razor Hill, who holds Durotar's crossroads for the Horde.",
  },

  greetings = {
    { id = "g_barracks", text = "Speak quickly, {class}. Razor Hill has work, and an orc proves himself with his axe, not his mouth." },
    { id = "g_back", when = { metBefore = true }, text = "Report, grunt, and keep it short." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and Razor Hill kept its watch without you, as the Horde always does. Now you're back, so make yourself useful." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You left here a recruit and came back looking like a warrior of the Horde. Good, because I have harder work for you now, and harder blood to spill." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word is you put the fear into somebody around here without spilling blood. Durotar respects that, and so do I." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The grunts tell me you've been doing work for Razor Hill, and doing it properly. Keep that up and you'll have a name here." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear is falling off you, so fix it. A grunt who can't hold his armor together can't hold a line." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "Out of the valley and already at my door. Good, but don't think that makes you a veteran." },
  },

  start = "hello",
  nodes = {
    xcl_rfc = {
      big = true,
      lines = { { id = "xcl_rfc_default", text = "Then report it properly, and I'll send it on to Orgrimmar under Razor Hill's seal. The Burning Blade we fight at Skull Rock and the cultists under the city are the same rot, and Nazgrel taught me that rot left in the cellar always reaches the roof. You've cut some of it out, and Durotar is safer tonight for it." } },
      choices = {
        { text = "I did my duty, commander. That's all a grunt needs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I went down for the fight, commander, not the orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Skull Rock might connect to the chasm.", next = "xcl_rfc2" },
      },
    },
    xcl_rfc2 = {
      lines = { { id = "xcl_rfc2_default", text = "Not by any tunnel my scouts have found, though they've looked. The cultists come and go between them by the roads like anyone else, hooded and quiet, which means someone in the city lets them pass, and I'd like to know who." } },
      choices = { { text = "I'll keep my eyes open on the road, commander.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'll take anyone's report if it's accurate. The Silver Hand guarded the camps my people were penned in, and I swore I'd never take an order from that glow again. I won't have to, since you take orders from me. Keep it that way." } },
      choices = {
        { text = "I take your orders, commander. For the Horde.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I follow the Light first, commander, then your orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "At the barracks door when the patrols come back, and nowhere else, because a priest who wanders off to pray is a priest I can't use. The Kul Tirans hit hard and fast, so be there when my grunts come in, and you'll have my respect." } },
      choices = {
        { text = "I'll be at the barracks door, Commander, every time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll heal where I'm needed, not where I'm posted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "On the walls at Tiragarde Keep, where the humans think stone will save them. Burn their banners and their supply carts, and leave the peasants on the road alone, because the Warchief wants Durotar held, not salted." },
      },
      choices = {
        { text = "Soldiers and supplies only. The peasants I'll leave be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fire doesn't choose sides on the road. Neither will I.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'll give orders to anyone who keeps Durotar safe, but I'll watch you the way I watch the coast. The Burning Blade are crawling through the hills, so if you're really Horde, prove it on them first, and quickly." },
      },
      choices = {
        { text = "Point me at the Blade. I'll prove it there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I serve the Horde my way, not by proving myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I trust grunts, walls and reports, and the spirits have never sent me a report. But my scouts say the earth went quiet before the last quilboar raid, so if you hear it go quiet again, you tell me first." } },
      choices = {
        { text = "I'll report what the spirits tell me, Commander, like any grunt would.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The spirits take no orders, and neither does their shaman.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "We take what it gives and we don't complain, because it's ours and nobody gave it to us. The Warchief named it for his father, and every orc here would bleed into that red dirt before he let it go." } },
      choices = {
        { text = "A land won by blood must be held by blood.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A land is held by tending it, not bleeding on it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_spear = {
      lines = { { id = "xsp_default", text = "Then you're one of the spears keeping the Kolkar honest on the south road. Your village and my hill hold the same coast between us, and I've never once had to send a grunt to cover a gap in your watch. What do your people need most from Razor Hill?" } },
      choices = {
        { text = "Steel, Commander. Good spearheads are hard to come by.", next = "BACK", fx = { affinity = 1 } },
        { text = "Nothing, Commander. Sen'jin holds its own.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You have the look of {alt}, the {altclass} who helped drive the humans out of Tiragarde Keep. If that's your blood, then Razor Hill already knows what your family is worth." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true } },
          text = "{alt} has gone on to fight in places I only read about in Nazgrel's reports, and I'll admit I'm proud of it. Do half as well and I'll be satisfied." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin at Razor Hill. Nazgrel taught me to judge a soldier by his reports, not his glow, so report, and we'll see what you are." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because my grunts come back from Tiragarde with Kul Tiran arrows in them, and I've no use for a grunt who can't stand." },
        { id = "h_default", key = true,
          text = "Gar'Thok, commander of Razor Hill. I served under Nazgrel before this, and before that I wore chains in the camps. Now I hold Durotar's crossroads for the Warchief, and I hold them well." },
        { id = "h_cl_rfc", tags = { "news" }, when = { cleared = "Ragefire Chasm", faction = "Horde" }, text = "My runners tell me you went down into Ragefire Chasm and came back up, and that pleases me, because the Warchief's city should have nothing beneath it that doesn't answer to him." },
        { id = "h_betrayers", tags = { "news" }, when = { questActive = TODO_QUEST("Vanquish the Betrayers") },
          text = "Kul Tirans hold a keep on our coast. They call it a garrison and I call it a knife at our throat, so pull it out." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Admiral's Orders") },
          text = "Get these Kul Tiran orders to Orgrimmar, and quickly; they were taken off their own officers." },
        { id = "h_encroach", when = { questActive = TODO_QUEST("Encroachment") },
          text = "Quilboar out of the Barrens are pushing into Durotar. Push harder than they do." },
        { id = "h_wreckage", when = { questActive = TODO_QUEST("From The Wreckage....") },
          text = "There's a wreck on the coast with things worth salvaging. Get there before the sea or the Kul Tirans do." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid in Razor Hill. You're a long way from Mulgore's grass and Durotar won't feed you half so kindly, but the Horde's glad of you all the same." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The Warchief brought your craft back to us, so I'll expect you on the line when the Kul Tirans come, and not off somewhere talking to rocks." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, posted to Razor Hill. Nazgrel never had much use for spellcasters, but I've seen what fire does to a Kul Tiran shield wall." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock. I'll be plain, since that's my way: the last orcs who called demons nearly burned our people down to the bone." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Kul Tiras", min = 30 } }, text = "The Kul Tiras marines at Tiragarde Keep are short of men, my scouts tell me, and I know who to thank for it. Keep pressing them, and they'll be sailing home before winter." },
      },
      choices = {
        { text = "Where does Razor Hill need a priest most, Commander?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The spirits could help guard Razor Hill, Commander.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How do you endure this land, Commander?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Razor Hill doesn't look like much.", next = "why" },
        { text = "Put me on the wall, commander.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can scout Tiragarde Keep without being seen.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I track well. Where do you need eyes?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I see Darkspear standing your watch too.", next = "troll", when = { race = "Troll" } },
        { text = "Where could a mage be useful to Razor Hill?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will you still give orders to a warlock, Commander?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will you take a Forsaken paladin's report, commander?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Ragefire Chasm is cleared, commander.", next = "xcl_rfc", when = { cleared = "Ragefire Chasm", faction = "Horde" } },
        { text = "I hold the Sen'jin gate, Commander. We share a coast.", next = "xorig_spear", when = { origin = "troll_senjin_spear" } },
        { text = "Lok'tar, commander.", next = "END", fx = { affinity = 1, standing = { razor_hill = 1 } } },
      },
      again = {
        { id = "h_again", text = "What else? Make it a report, not a story; deeds speak louder here." },
        { id = "h_again2", text = "Go on. The next runner from Sen'jin is due, and you have until he arrives." },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "The wall has grunts enough, and what I'm short of is grunts who'll march out to Tiragarde and back without being told twice. Nazgrel taught me that a fort is only as strong as its willingness to leave it." },
        { id = "wa_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "You already stood a watch on that wall, so you know every stone of it. Now I want you beyond it, where the Kul Tirans are." },
      },
      choices = {
        { text = "Then I'll march, and I'll hit them head on.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll march, but I'll pick my own fights out there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who was Nazgrel to you?", next = "warrior_nazgrel" },
      },
    },
    warrior_nazgrel = {
      lines = { { id = "wn_default", text = "My commander, and a hard one. He made me stand watch for a week after I left my post to chase a raider, and he was right to, because the raider was bait. Don't chase bait, warrior." } },
      choices = { { text = "I won't, commander.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Without being seen is what every scout says before the Kul Tirans hang him from their tower. Bring me a count of their sentries and the hour they change, and then I'll believe you." } },
      choices = {
        { text = "You'll have it, and no one will know I was there.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll bring the count. Maybe a few of their throats too.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "On the Barrens border, where the quilboar keep pushing in from the west. Track their raiding parties back to where they camp, and I'll know where to put my grunts." } },
      choices = { { text = "I'll find their camps.", next = "BACK", fx = { affinity = 2, standing = { razor_hill = 1 } } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "They do, and they keep better watch at night than my orcs, which I'll deny if you repeat it. The Darkspear hold Sen'jin and I hold Razor Hill, and between us the coast stays ours." } },
      choices = { { text = "Your secret's safe, commander.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Roads to Orgrimmar, to Sen'jin and to the Barrens all run through here. Hold Razor Hill and you hold Durotar, and lose it and the Horde bleeds for it." } },
      choices = {
        { text = "Then we won't lose it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A good ambush on those roads would do more than any wall.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every report from Durotar crosses my table, so I know what's happening and where. Ask, and be quick about it." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've done good work for Razor Hill, so you'll get more than a short answer from me, this once." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "Ask your question, and then get out of my barracks." },
    },
    burning_blade = { { id = "tp_blade", text = "That's Orgnil's business, and he's good at it. I give him whatever he asks for." } },
    thrall = { { id = "tp_thrall", fx = { learn = { "internment" } }, text = "The Warchief freed me from the camps with his own hands, and I've followed him ever since. Razor Hill is his, and I'll hold it for him the way he held the line for us." } },
    second_war = { { id = "tp_second_war", text = "I was a grunt in the Second War and a prisoner after it. I learned more about holding ground in the camps than I ever did on a battlefield." } },
    darkspear = { { id = "tp_darkspear", text = "The trolls of Sen'jin are good fighters and better neighbours, and they never ask me for anything they wouldn't give back. I'd trust a Darkspear at my side before half the orcs in this town." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar have been pushing in from the west, and Lar Prowltusk watches them for me. If they come over the ridge in force, Razor Hill will meet them, and they won't like the meeting." } },
    theramore = { { id = "tp_theramore", text = "The humans' fortress is across the water to the south, and Lady Proudmoore keeps her soldiers on her side of it. That's the kind of peace I can respect, as long as it lasts." } },
    forsaken = {
      { id = "tp_forsaken", when = { race = "Undead" }, text = "You're one of the Dark Lady's dead, and the Warchief says you're Horde. That's good enough for me, so keep your hands clean in my town." },
      { id = "tp_forsaken2", text = "The Warchief brought the dead of Lordaeron into the Horde, and some of my grunts don't like it. I tell them what I tell anyone: keep your eyes open and your mouth shut." },
    },
    _none = { { id = "tp_none", text = "Not now. Ask Orgnil, or the innkeeper, and leave me to my reports." } },
  },
}

P:NPC {
  key = "orgnil", id = TODO_NPC("Orgnil Soulscar"), name = "Orgnil Soulscar",
  prejudice = { { class = "WARLOCK", amount = 10, why = "He hunts the Burning Blade, and every warlock is a cultist he hasn't caught yet." }, { origin = "orc_blade_defector", amount = 8, why = "He believes no one truly leaves the Blade." } },
  bible = "bibles/durotar.md", role = "soldier", tier = "quest",
  communities = { "razor_hill" }, temper = { "grim" }, values = { "lawful", "protective" },
  notices = { "class", "stealth" },
  impression = {
    first = "There is a patience in how Orgnil Soulscar hunts the Burning Blade that frightens me a little. The cultists he most wants to meet, he says, are the ones smiling inside the city walls.",
    third = "{name} met Orgnil Soulscar of Razor Hill, a grim orc who hunts the Burning Blade wherever it hides.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A warlock in Razor Hill. I'll be honest with you, because I'm honest with everyone I might have to kill: every Burning Blade cultist I ever buried started out telling me they could control it." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "I've watched you a long while now, warlock, and you've given me nothing to hunt. That's rarer than you'd think, and I'll say so to anyone who asks." },
    { id = "g_watch", text = "Young orcs and trolls train here, and traders rest here, and nothing gets into Razor Hill that I don't allow. Our people drank demon blood once; I won't let the Blade pour it for us again." },
    { id = "g_bb_resolved", when = { thread = { id = "burning_blade", state = "resolved" } }, text = "Word came down from Orgrimmar that the Warchief has heard the Blade's whole road from you, valley to Cleft. Good, then; I'll keep watching the hills, and he can keep watching the smiles." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Any word from the canyons, or any blood on your blade?" },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the Blade hasn't rested in that time, so neither have I, and my back has the knots to prove it. Tell me what you saw out there." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told one of your stories didn't hold up in Razor Hill. The Blade lie for a living, and I've learned to listen hardest to the ones who smile." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked somebody round recently, which is a useful talent. Use it on the right people and you'll make a fine hunter of cultists." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I'll be watching you, the way I watch every one of you, so don't take it personally; take it seriously." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You're light on your feet, and the Blade use people like you to carry their messages. Make sure you never carry one." },
  },

  start = "hello",
  nodes = {
    prej_orgnil = {
      big = true,
      lines = { { id = "prej_orgnil_default", text = "I do, and I'll keep it there until you give me cause to move it. The Burning Blade are cutting through Skull Rock and the Valley of Trials, and half of them were respectable warlocks in Orgrimmar a year ago. The fel has a voice, and it is very patient." } },
      choices = {
        { text = "I've heard that voice and I refuse it, every day.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Your fear makes you blind. Power isn't the same as the Legion.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Then keep your hand there. I'll give you nothing to use it on.", next = "prej_orgnil_calm", fx = { affinity = 1 } },
        { text = "Did you know any of them before they turned?", next = "prej_orgnil_why" },
      },
    },
    prej_orgnil_why = {
      lines = { { id = "prej_orgnil_why_default", text = "My own brother-in-arms, Zelk, a good warlock who taught at the Cleft. He went south to hunt the Blade the way I do, and he came back wearing their sigil and calling me by my old camp number. I put him down myself at Skull Rock." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_orgnil" }, { text = "Something else.", next = "BACK" } },
    },
    prej_orgnil_calm = {
      lines = { { id = "prej_orgnil_calm_default", text = "Hm. A warlock who doesn't argue. I've not met many of those, and none of them were Burning Blade, so perhaps there's hope for you yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_rfc = {
      big = true,
      lines = { { id = "xcl_rfc_default", text = "Some of them are, and that's more than I've managed. The Searing Blade are the Burning Blade's young, the ones the old cult raises in the dark beneath our feet, and they've been feeding a demon down there since the city was built. I hunt them in the hills because I can reach them there, but the ones I really want are closer than that, and they smile at me in the street." } },
      choices = {
        { text = "Bring proof to the Warchief, and let him judge them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Kill them where they stand, Orgnil, inside the walls or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Someone must be sending the cultists their orders.", next = "xcl_rfc2" },
      },
    },
    xcl_rfc2 = {
      lines = { { id = "xcl_rfc2_default", text = "Someone with a name the Horde respects, or they'd never move so freely. I've heard the Shadow Council whispered by cultists who were dying and past caring what they said, and the Council was meant to have died with Gul'dan. If it lives, then Ragefire was only the cellar of something much bigger." } },
      choices = { { text = "Then I'll keep listening for that name.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I suspect everyone; it keeps me alive. The Burning Blade wear Horde colours and serve demons, and the Silver Hand once wore holy colours and kept orcs in cages. Colours tell me nothing. Deeds do, so go and do some." } },
      choices = {
        { text = "Then judge me by my deeds. I'll give you plenty.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Suspect me all you like. I'll not beg for trust.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Patiently, the same way I do. They hide among us and smile, so you'll mend some of them without knowing it, but sooner or later one will ask you for a prayer you won't give, and then you'll know who to send to me." } },
      choices = {
        { text = "I'll heal anyone, and send you the ones who refuse mercy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll find them myself and end them, same as you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In Skull Rock to the north, and in the coven above the Valley of Trials, and in the Cleft of Shadow in Orgrimmar itself, if half of what I hear is true. They call up imps and worship the old masters, so when you find them, cut them down before they can open their mouths to chant." } },
      choices = {
        { text = "They'll get a clean death, and nothing more.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them suffer, as our people suffered under the demons.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You can track anything that walks, and the imps they summon leave scorched earth wherever they stop. Follow the burn marks north toward Skull Rock and you'll find their summoners, and the summoners are the ones I want." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} back when the summoners start to chant. I've seen a beast go mad from fel magic, and I'd rather not have to put a good one down." },
      },
      choices = {
        { text = "Fel magic is filth. I'll keep my beast well clear.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fel power is still power. I'd learn its secrets if I could.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "More use than you'd think, because the Blade's warlocks hide behind wards and summoned imps, and fire burns through both. Go to Skull Rock and do your work, and if you find any of their scrolls, bring them to me unburned." },
      },
      choices = {
        { text = "Unburned scrolls it is. You'll have every one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll burn what I please. The cult deserves no archive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Maybe. Wherever the cultists work their rites the ground goes sour and the spirits flee it, and Gadrin says a shaman feels that the way a hound smells blood. Walk the canyons near Skull Rock and tell me where the earth won't speak to you." } },
      choices = {
        { text = "I'll cleanse what they've fouled, and not only kill them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land can wait until every cultist is dead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "It does, though slower than they'd like. Where they work their demon magic the scrub dies and the scorpids go mad, and I've seen the ground around their caves gone black." } },
      choices = {
        { text = "Even cultists can be turned back to the Horde.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Root them out, every last one of them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_bhunt = {
      lines = { { id = "xbh_default", text = "I know you have, because I've found their cultists with their throats cut and nobody claiming the work. Whoever taught you to move that quietly taught you well, but tell me plainly, why does someone so young spend their nights hunting the Blade?" } },
      choices = {
        { text = "Because they'd drag us back to the demons.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Somebody has to, and nobody else would.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead man with the Light in his hands. I hunt cultists who smile and hide what they serve, so forgive me for wanting a long look at you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Burning Blade fear the light more than they fear axes, and the shadow they don't fear at all, so I'm curious which you carry." },
        { id = "h_default", key = true,
          text = "I'm Orgnil Soulscar. The Burning Blade crawl through Durotar like lice in a pelt, and I find them, and I end them." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Orgnil") },
          text = "So Gadrin sent you. Good; the old witch doctor has an eye for the useful ones." },
        { id = "h_cl_rfc", tags = { "news" }, when = { cleared = "Ragefire Chasm", faction = "Horde" }, text = "You went into Ragefire Chasm, under the Warchief's own city, and cut down the Searing Blade where they nested. Those are the ones I've wanted for years, because they don't hide in the hills like the rest." },
        { id = "h_storms", tags = { "news" }, when = { questActive = TODO_QUEST("Dark Storms") },
          text = "The cultists talk of storms, and not the kind that bring rain. Find out what they mean." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, good! The Burning Blade foul everything they touch, and you'll smell their fel stink around Skull Rock long before you see them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Every warlock in the Burning Blade had shamans for grandfathers, and they traded the elements for fel fire, so forgive me if I watch your hands for a while." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "Hmph, a mage. At least your fire comes from the arcane and not the Legion, which already makes you cleaner than the cultists I hunt." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The Burning Blade run when they see an axe coming, which is the one thing about them I like." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Good, because the Burning Blade keep imps and worse at their heels, and someone who can track a beast can track those too." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Burning Blade", min = 30 } }, text = "The Burning Blade's cultists don't creep about Skull Rock as boldly as they did, and that's your doing. Every one of them you put down is one less traitor whispering to the Legion." },
      },
      choices = {
        { text = "You keep one hand on your blade around me, Soulscar.", next = "prej_orgnil", when = { prejudiced = true } },
        { text = "How should a priest fight the Burning Blade, Orgnil?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A shaman could find the Blade by the ground they've poisoned.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Burning Blade's magic must be poisoning Durotar.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where do the Blade hide?", next = "hide" },
        { text = "You watch me like I'm one of them, Orgnil.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I could carry false messages to the Blade for you.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Would a mage be any use against the Burning Blade?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Where do the Burning Blade hide, Orgnil?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can a hunter track a demon, Orgnil?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You seem to suspect me, Orgnil.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "The cultists under Orgrimmar are dead, Orgnil.", next = "xcl_rfc", when = { cleared = "Ragefire Chasm", faction = "Horde" } },
        { text = "I've hunted the Blade in the caves myself, Orgnil.", next = "xorig_bhunt", when = { origin = "orc_blade_hunter" } },
        { text = "I'll hunt them with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } },
      },
      again = {
        { id = "h_again", text = "What else? Speak low; the Blade have ears in more places than you'd think." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "I watch you because the last warlock I trusted carried a Blade medallion under his shirt for two years. Earn my trust in the caves, where I can see what your demon does when the cultists call to it." },
        { id = "wl_troll", when = { race = "Troll" },
          text = "A troll warlock is a stranger thing than an orc one, and the Blade would love to recruit the first of your people. They'll come to you sweetly, and when they do, you'll come straight to me." },
      },
      choices = {
        { text = "Fair. Watch me, then, and judge me by what I do.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I don't answer to you, lawman.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Hm. That's a dangerous game, and it's exactly the one I've wanted someone to play. Not yet, though, because a messenger needs to be trusted by them first, and I won't send a youngster in to be found out." } },
      choices = { { text = "When I'm ready, then.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    hide = {
      big = true,
      lines = {
        { id = "hd_default", text = "In caves in the canyons, and under rocks like scorpids. Sometimes they hide inside the walls of cities, smiling at you, and those are the ones I'd most like to meet." },
      },
      choices = { { text = "Inside the cities?", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 }, learn = { "burning_blade" } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear what the Blade whisper, and what the grunts whisper about the Blade. Ask about these, and I'll tell you what I've found." },
    },
    burning_blade = { { id = "tp_blade", text = "They're orcs who chose the demons twice. Once might be forgiven, but twice, never." } },
    thrall = { { id = "tp_thrall", text = "The Warchief carries the hope of every orc who's ever been free. That's a weight the Burning Blade would love to see him stumble under, and that's why I'm here." } },
    burning_legion = { { id = "tp_burning_legion", text = "The demons wanted us for their weapon, and some fools still want to be one. I'll see every cultist in Durotar ash before they get their wish." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Dark Portal brought us here from a dying world, and what came through with us was worse than any human army. Some of those things are still waiting, and some orcs are still listening." } },
    scourge = { { id = "tp_scourge", text = "The dead in the north are someone else's war, for now. I've enough living traitors to keep me busy, but I keep an eye on the other one." } },
    _none = { { id = "tp_none", text = "I hunt the Blade, and nothing else is my concern. Let the young ones chase the rest." } },
  },
}

P:NPC {
  key = "grosk", id = TODO_NPC("Innkeeper Grosk"), name = "Innkeeper Grosk",
  bible = "bibles/durotar.md", role = "innkeeper", tier = "service",
  communities = { "razor_hill" }, temper = { "dry" }, values = { "practical" },
  notices = { "weary", "drink" },
  impression = {
    first = "Innkeeper Grosk offers a bed, ale and a roof against the sun, and treats everything beyond the door as rocks and scorpids. He is as dry as Durotar, but he does check the blankets.",
    third = "{name} rested at Innkeeper Grosk's inn in Razor Hill, the safest bed in a land of rocks and scorpids.",
  },

  greetings = {
    { id = "g_inn", text = "Sit and eat. Razor Hill is safe enough to sleep in, which is more than you can say for most of Durotar. Leave your boots by the door, though, because the last grunt's boots made the kodo weep." },
    { id = "g_home", when = { homeInn = { "Razor Hill" } }, text = "Your bed's where you left it, and it's scorpid-free; I checked." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, are you? Your bed's still here, and I've shaken the scorpids out of it at least once." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody came through here grumbling about you, and they drank a good deal while they did it. Whatever you said to them, keep it outside my door." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk say you've been doing good work around Razor Hill, and that's worth a free mug. Only the one, mind." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the spirit healer sent you back with a list of complaints. Sit down before you fall down." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's enough for now. The grunts don't carry drunks home; they leave them for the scorpids." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The old ones mind. They saw that light on the Silver Hand's knights at the camps and they don't forget. The young ones only stare. Pay for your bed, keep the glow down after dark, and nobody will start anything in my inn." } },
      choices = {
        { text = "I'll keep it down. They've reason to remember.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll not hide what I am for anyone's comfort.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More than you'd think, mostly scorpid stings and quilboar cuts they're too proud to mention. I keep a corner by the fire for the worst of them, so if you see someone shaking in it, they're yours and not mine." } },
      choices = {
        { text = "Then the corner by the fire is mine to keep.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They should ask for help. I won't chase them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Kul Tirans at Tiragarde Keep, with their muskets and their sour faces, and the quilboar of Razormane Grounds, who smell worse but shoot less. Gar'Thok keeps the grunts busy against both, so the warriors who sleep here come in bruised and leave before dawn." } },
      choices = {
        { text = "I'll take the fight to Tiragarde Keep, Grosk.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight whoever pays best, Kul Tiran or quilboar.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boar ribs, mostly, and scorpid tails when they've been clever enough to cut the sting out first. The best stew I ever made came from a crocolisk out of the Southfury, and the hunter who brought it lost two fingers getting it, so I named the stew after him." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can have the bones. Every beast that comes through my door gets the bones, and I've never had one bite the hand that throws them." },
      },
      choices = {
        { text = "I'll bring you game, Grosk. Razor Hill should eat well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My game goes to whoever pays the most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Less than the grunts do, I'll say that, because rogues pay and leave quietly and the grunts sing. If one of you picks a pocket under my roof, though, I'll toss you to the scorpids myself." },
      },
      choices = {
        { text = "Your roof's safe. I don't rob honest Horde.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they're careless with their purse, that's their lesson.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "More than you'd think, since Razor Hill is the first roof between the Valley and Orgrimmar. Most are decent enough, though I count the blankets afterward, and I keep a bucket of water by the door for the imps." },
      },
      choices = {
        { text = "Fair rules. My imp sleeps outside.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My imp goes where I go, innkeeper.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only the ones in the barrel, and those I can handle. The old grunts say the fire spirits like Durotar because it's half on fire already, and on summer nights I'm inclined to believe them." } },
      choices = {
        { text = "Every hearth deserves an offering, as the old ways teach.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The spirits can mind themselves, and you can mind the ale.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Cactus, mostly, and the peons cut it for the fruit. There's a bit of green down by the coast and up in Thunder Ridge, but nobody who lives here calls this land kind." } },
      choices = {
        { text = "Even a hard land deserves care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Kind land makes soft people. This one suits orcs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Trolls from Sen'jin, mostly, on their way to Orgrimmar, and the odd Forsaken with a book under one arm. They're quiet guests, which I like, but one of them froze the ale barrel to keep it cool, and I still haven't decided whether to thank him." },
      },
      choices = {
        { text = "Your inn, your rules. My spells stay outside.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If your ale wants freezing, I'll freeze it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "Another one with your face slept here, {alt} by name, and left the bed tidier than any grunt ever has. If that's family, I'll expect the same from you." },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "A {altrace} named {alt} stopped here out of the sun not long ago and complained about the scorpids the whole night through. You look like you've got complaints of your own, so sit and have them over an ale." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. I've a bed, ale and a roof against the sun, and I don't suppose you need any of them, but the rate's the same." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at my inn. The beds are clean, and the ale isn't holy, but it'll do." },
        { id = "h_default", key = true,
          text = "I'm Grosk, the innkeeper. I've a bed, ale and a roof against the sun, which is more than any of us had in the camps, and everything outside is rocks and scorpids." },
        { id = "h_burden", when = { questActive = TODO_QUEST("A Peon's Burden") },
          text = "That bundle is for the right hands only. Get it there, and don't let a peon sit on it." },
        { id = "h_scorpid", when = { metBefore = true }, text = "I shook a scorpid out of the blankets this morning. They weren't yours, probably, but check anyway." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear the grunts on the wall, singing the old songs? They sing them badly, and I wouldn't change it for anything." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid! Mind your horns on the beam, and if you're looking for anything green out there, I'm sorry to say it's all rocks and scorpids." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? If you can talk the sky into raining on Durotar you'll be the first, and I'll want to hear how you did it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You crept in like a scorpid under a blanket, rogue. Kaplak's burrow is under the floor, if you were looking for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I'll rent you a bed, warlock, but the imp sleeps outside. The last one set fire to the straw just to see what would happen." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and a thirsty one by the look of you. Sit, and I'll pour something before you tell me how many quilboar you killed today." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Leave the beast by the door if it's muddy and bring yourself in, because the scorpids aren't going anywhere." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You'll want a bed that isn't on fire, I suppose, so keep your spells outside." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask, then, before the next caravan comes in thirsty." },
        { id = "h_again2", text = "Go on. The ale isn't going anywhere, and neither am I, Throm-ka." },
      },
      choices = {
        { text = "Do travellers ever come here needing more than a bed?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd guess no spirits trouble your inn, Grosk.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there nothing green in Durotar, Grosk?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Rogues must cause trouble at your inn.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Who troubles Razor Hill most, Grosk?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do hunters bring you to cook, Grosk?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess few warlocks stop at the inn.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do many mages stay at your inn, Grosk?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the grunts here mind a Forsaken paladin, Grosk?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just a meal, thanks.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I pour drinks for grunts; I don't keep track of things. Ask Gar'Thok, he likes knowing everything." } },
    thrall = { { id = "tp_thrall", text = "The Warchief stayed at my inn once, before he had a city, and he paid. That's more than most of his grunts can say." } },
    darkspear = { { id = "tp_darkspear", text = "The trolls drink as hard as orcs and pay for it slower, but they're never mean drunks. I'll take a troll at the bar over a Kolkar at the gate any day." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar want Durotar, and I'm not sure why, since it's nothing but rock and scorpids. Maybe they want the beds." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins down in Ratchet sell my ale for twice what I charge, I hear. Good for them, as long as they keep buying." } },
  },
}

-- Forever's camping: the adventurer on the road near Razor Hill.
P:NPC {
  key = "brakk", id = TODO_NPC("Brakk"), name = "Brakk",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  communities = { "razor_hill" }, temper = { "easygoing" }, values = { "generous", "curious" },
  notices = { "craft" },
  impression = {
    first = "Walls, says Brakk, are for people who have stopped walking, and he camps wherever he stops across Durotar. His fire felt like the most welcoming place in that whole red land.",
    third = "{name} met Brakk, a wandering orc who camps across Durotar and keeps a journal of every fire he has ever built.",
  },

  greetings = {
    { id = "g_fire", text = "Throm-ka. Sit, if you're not in a hurry. If you are, sit anyway; the road will keep." },
    { id = "g_back", when = { metBefore = true }, text = "The one who found my journal, welcome back! Sit down; the fire remembers you." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook? Then you can build a real campfire, and everything else in a camp is built around one." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "That the Light used to come to Durotar's people only on the armour of their jailers, and now it walks the roads with a dead man who fights for the Horde. I'd write that the world turns strange, and that I don't mind it as much as I thought." } },
      choices = {
        { text = "Write that I walk with the Horde. That's true.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Write what you like. I'll not be your story.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The fire, mostly, and the sky when it's clear, though I'd not call it praying where a shaman could hear. My journal's full of places I was glad to wake up in, and I suppose writing them down is the nearest I get to giving thanks." } },
      choices = {
        { text = "Giving thanks counts, Brakk, whatever you call it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thanks are for the weak. The road owes us nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That you walked Durotar with an axe on your back and the sun on your neck like the rest of us, and that something made you stop and talk to an old wanderer. That's the start of every good page, and the end depends on what you do once you leave this camp." } },
      choices = {
        { text = "Write that I fought for the Horde, Brakk.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Write that I fought for myself, and won.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not a copper of it, but I got a good page out of the story, and that's worth more to a wanderer than silver. Durotar teaches a man to carry less and laugh at what he loses, so I don't hold it against your trade." },
      },
      choices = {
        { text = "I'd have given it back, myself. A wanderer needs his coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "She earned it fairly. You should have watched your belt.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Every night in Durotar, when the wind comes off the sea and my flint won't strike. But I've noticed the mages who travel by spell never see much of the land, and a camp fire you work for is one you remember." },
      },
      choices = {
        { text = "Then I'll walk the road, and learn it properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather be warm than wise, honestly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That it's never as empty as it looks, because there's always a raptor in the scrub or a quilboar behind the rock. The orcs call it barren, but I've filled three journals with what lives here." } },
      choices = {
        { text = "Then somebody should protect it, instead of just enduring it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Whatever lives here had better learn to fight.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A few, out near Skull Rock, where the Burning Blade hide in the caves and whisper to whatever answers them. The Warchief has made it plain that a warlock serves the Horde or answers to it, and I write that in my journal beside every warlock I meet, just so I remember." },
      },
      choices = {
        { text = "Write that I serve the Horde, Brakk.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Write what you like. My power is my own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin walking Durotar. My journal will want to hear about you, because I've never written anything like you before." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest on the road. Sit by the fire, then, and tell me what you pray to out here, because I've always wondered what holy folk say when there's nobody listening." },
        { id = "h_default", key = true,
          text = "I'm Brakk. I walk Durotar and camp wherever I stop, because I spent too many years behind human fences to stay inside walls now. My journal says more about it than I do." },
        { id = "h_journal", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "My journal! I thought the scorpids had it. Every camp I've ever made is written in there, so you have my thanks." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Rest by the fire until your bones stop arguing with you. You'll know when." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, out walking Durotar the same as me. I write down everything I see, and I'd be glad to hear whatever you notice that I've missed." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "Ha, a rogue! I wrote about one in my journal once, though I never saw her face, only my purse leaving my belt." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage on the road! You'll be warm at night, at least, and I'd trade half my journal for a fire that lit itself." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You've the look of somebody who'd make a good page in my journal, all scars and stories." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock at my fire. Sit, but tell your demon to keep to the dark side of it." },
      },
      choices = {
        { text = "What do you pray to on the road, Brakk?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What have you noticed about this land, Brakk?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You seem to prefer sleeping out here.", next = "why" },
        { text = "My beast and I sleep rough too.", next = "hunter", when = { class = "HUNTER" } },
        { text = "A fire like this must draw the spirits.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'd guess you never got your purse back.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do you ever wish you could conjure your own fire?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What would you write about me, Brakk?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Have you met many warlocks on the road, Brakk?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What would your journal say about me, Brakk?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Lok'tar, Brakk.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? There's no hurry at a campfire; that's the whole point of one." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Then you know the best watchman in any camp has four legs and a nose. Mine was a raptor once, until it decided it liked the Barrens better than me, and I can't say I blame it." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "And this must be {pet}! Come sit by the fire, both of you. Every camp I've built was better for a beast lying beside it." },
      },
      choices = {
        { text = "Mine stays with me. We look after each other.", next = "BACK", fx = { affinity = 2 } },
        { text = "What happened to the raptor?", next = "hunter_raptor" },
      },
    },
    hunter_raptor = {
      lines = { { id = "hr_default", text = "I wrote it down in my journal, the day it left: it stood at the edge of the firelight and looked back once, and then it went. I like to think it found a pack of its own out there past the river." } },
      choices = { { text = "I hope it did.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "I'm no shaman, but fire's an element, isn't it? Some nights it talks louder than others, and on those nights I bank it down and listen. Maybe you could tell me what it says." } },
      choices = { { text = "It says it's glad of the company.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Walls are for people who've stopped walking, and I had my fill of walls in the camps. Out here, any traveler can share the fire, and a camp belongs to whoever sits at it." } },
      choices = { { text = "Show me how.", next = "BACK", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "Fire first, and then whatever your trade adds: a tent, a rack for fish, a pot. The more hands, the better the rest." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar camp in the open like I do, but they don't put out their fires, and that's how you find them. It's also how they find you, so I put mine out." } },
    quilboar = { { id = "tp_quilboar", text = "The Razormane are thick down in the Barrens, and they don't like campfires that aren't theirs. If you camp south of the river, sleep light." } },
    thrall = { { id = "tp_thrall", text = "The Warchief understands the open road, because he walked a long way before he got here. I'd guess he misses it, some nights." } },
    everlook = { { id = "tp_everlook", text = "I walked to Everlook once, in Winterspring, and I learned that walls have their uses after all. Don't tell anyone in Razor Hill." } },
    _none = { { id = "tp_none", text = "I only know the road and the fire. Ask in Razor Hill." } },
  },
}
