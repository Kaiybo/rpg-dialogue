-- Taronn Redfeather, tauren druid of the Emerald Circle at the Emerald Sanctuary; and Talonbranch Glade's keepers below. Voice: bibles/talonbranch_folk.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "taronn", id = TODO_NPC("Taronn Redfeather"), name = "Taronn Redfeather", title = "Emerald Circle",
  bible = "bibles/talonbranch_folk.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "patient", "earnest" }, values = { "wise", "devout" },
  notices = { "class", "race" },

  impression = {
    first = "He fears the forest's sickness runs deeper than any single water.",
    third = "{name} met Taronn Redfeather, a tauren druid of the Emerald Circle at the Emerald Sanctuary.",
  },

  greetings = {
    { id = "g_default", text = "Peace to you, traveler, and welcome to the Sanctuary. Sit a while; the Earth Mother is patient, and so am I." },
    { id = "g_active", when = { questActive = TODO_QUEST("Verifying the Corruption") }, text = "You have come back from Shatter Scar Vale. Tell me what the craters showed you, and leave nothing out, even the small things." },
    { id = "g_secrets", when = { questActive = TODO_QUEST("Culling the Corrupted") }, text = "The corrupted beasts still walk, I think. I do not ask this lightly, and I will not hurry you." },
    { id = "g_done", when = { questDone = TODO_QUEST("Culling the Corrupted") }, text = "There you are, the one who gave the sick beasts their rest. I spoke their names to Mu'sha that night, as many as I knew." },
    { id = "g_back", when = { metBefore = true }, text = "You walk this path again, friend. Come, the fire is warm and the forest can wait a little longer." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and so a walker in the Dream. Be careful when you sleep in Felwood, for the sickness reaches even there." },
    { id = "n_dwarf", cat = "race", when = { race = "Tauren" },
      text = "One of the People, this far from the grass of Mulgore. It is good to see a tauren face among all these tall elves." },
  },

  start = "hello",
  nodes = {
    dd_deadwood = {
      lines = {
        { id = "ddd_default", text = "I know, and I know why it had to be. The Deadwood ate and drank what this land gave them, and the fel took them from the inside, so now they turn on the Timbermaw and on us alike. I grieve for them as I would for a herd lost to bad water." },
      },
      choices = {
        { text = "Then the corrupted should be put down before it spreads.", next = "BACK", reply = "That is the hunter's answer, and some days I cannot argue with it. I only pray we can still tell the sick from the lost.", fx = { align = { light = -1 } } },
        { text = "If they were poisoned, maybe they can be cured.", next = "BACK", reply = "The Circle believes so, and I hold to that hope as well. Speak with Kelek Skykeeper here; he knows the furbolgs better than anyone.", fx = { align = { light = 1 } } },
        { text = "Something else, Taronn.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_deadwood", tags = { "news" }, when = { killed = { name = "Deadwood", min = 30 } }, text = "The Deadwood camps are thinner than they were, and the Sentinels say it was your doing. I take no joy in it, for the furbolgs were wise once, but the Sanctuary sleeps easier." },
        { id = "h_dd_rescue", when = { questDone = TODO_QUEST("Rescue From Jaedenar") }, text = "Jessir tells me you brought Arko'narin out of Jaedenar alive. Such news comes to the Sanctuary too rarely, and I gave thanks to An'she for it at dawn." },
        { id = "h_default", key = true, text = "I am Taronn Redfeather, of the Emerald Circle. I came north from Mulgore to see whether any part of this forest can still be healed, and I am trying very hard not to lose hope." },
        { id = "h_active", when = { questActive = TODO_QUEST("Verifying the Corruption") }, text = "The craters lie in Shatter Scar Vale, to the north, where the infernals fell. Look at the water and at the beasts near it, and tell me if even one spring there runs clean." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time, and the fire is warm." },
        { id = "h_again2", text = "Ask, friend. The elves here are kind, but they do not often sit and talk." },
      },
      choices = {
        { text = "I've had to kill a lot of Deadwood furbolgs.", next = "dd_deadwood", when = { killed = { name = "Deadwood", min = 30 } } },
        { text = "What is Shatter Scar Vale?", next = "wildkin" },
        { text = "What's gone wrong with the beasts here?", next = "mad" },
        { text = "How do I reach Winterspring from here?", next = "road" },
        { text = "Why would a tauren come to Felwood?", next = "felwood" },
        { text = "Does Elune have any power left in this forest?", next = "xpriest", when = { class = "PRIEST", race = "NightElf" } },
        { text = "I've worn feathers in moonkin form, Taronn.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I've seen what sick beasts do. Some can't be helped.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "This was our forest once. What can a tauren do here?", next = "kal_wildkin", when = { race = "NightElf" } },
        { text = "Farewell, Taronn.", next = "END" },
      },
    },
    wildkin = {
      lines = {
        { id = "w_default", text = "It is a valley north of here where the Legion's infernals fell from the sky like burning stones. They broke the earth open, and the craters they left still smoke, and nothing that grows near them grows well." },
      },
      choices = {
        { text = "Does anything live near the craters?", next = "wildkin_places" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildkin_places = {
      lines = {
        { id = "wp_default", text = "Beasts live there still, though the Circle calls them entropic now, because the land has twisted them out of their own nature. The Earth Mother made them whole, and it hurts my heart to see what the fel has made of them." },
      },
      choices = {
        { text = "What happens if someone comes near?", next = "wildkin_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildkin_guard = {
      big = true,
      lines = {
        { id = "wg_default", text = "They attack, and they do not stop until one of you is dead. Some in the Circle say we should leave the Vale to burn itself out, and others say we must go in and cleanse it, whatever the cost." },
      },
      choices = {
        { text = "Leave the Vale alone. Some wounds must close on their own.", next = "BACK", reply = "That is the patient way, and the Earth Mother often favors it. Still, I fear this wound will spread before it closes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Go in and cleanse it. Waiting only lets the rot grow.", next = "BACK", reply = "You speak like a young bull, and perhaps the forest needs one now. I only hope we do not trample what we came to save.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mad = {
      lines = {
        { id = "m_default", text = "The waters are poisoned, and every creature that drinks from them takes the poison into its blood. I hoped to find even one clean source in the craters, a place to begin the healing, but I fear there may be none." },
        { id = "m_done", when = { questDone = TODO_QUEST("Verifying the Corruption") }, text = "You have seen the craters now, so you know there is no clean water left in them. I had hoped otherwise, and I am still learning how to set that hope down." },
      },
      choices = {
        { text = "Could the corruption reach beyond Felwood?", next = "mad_fel" },
        { text = "What do you want done about them?", next = "mad_task" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mad_fel = {
      lines = {
        { id = "mf_default", text = "It already has, I think, for the waters run downhill and the winds carry what they carry. The Horde at Bloodvenom Post drink from those falls, and they laugh when I warn them, but the land does not care who laughs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mad_task = {
      big = true,
      lines = {
        { id = "mt_default", text = "If we cannot heal the land yet, then at least we can end the suffering of the creatures it has twisted. I hate to ask it, but a quick death is a kinder thing than what Felwood gives them." },
      },
      choices = {
        { text = "I'll do it, and I'll make it quick for them.", next = "BACK", reply = "Thank you, friend. Their spirits will return to the Earth Mother, and she will make them whole again.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Twisted beasts are just monsters now. I'll cut through them.", next = "BACK", reply = "I will not stop you, but I wish you would remember what they were. The forest was their home long before it was a battlefield.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "r_default", text = "North through Felwood to the Timbermaw tunnels, then through the furbolgs' hold to the snow beyond. The Timbermaw will let you pass if they do not hate you, so be careful which furbolgs you kill along the way." },
      },
      choices = {
        { text = "Which furbolgs are safe to fight?", next = "road_furbolgs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_furbolgs = {
      lines = {
        { id = "rf_default", text = "The Deadwood, who live in the corrupted camps along the road, and no one at the hold will mourn them aloud. Do not lift a hand against anyone wearing Timbermaw colors, or you will walk to Winterspring the long way, through Azshara and the mountains." },
      },
      choices = {
        { text = "Thanks for the warning.", next = "BACK", fx = { affinity = 1, learn = { "furbolgs" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood = {
      lines = {
        { id = "f_default", text = "The Cenarion Circle does not ask whether a druid has hooves or long ears, only whether he will do the work. Mulgore is green and safe, and so it needs me less than this place does." },
      },
      choices = {
        { text = "You don't like it here.", next = "felwood_dislike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood_dislike = {
      lines = {
        { id = "fd_default", text = "I miss the wind across the plains and the sound of kodo at dusk, and here the streams burn your hands and the trees whisper at night. Still, I plant what I can, for the ones who will come after me, even if I never see it grow." },
      },
      choices = {
        { text = "Somebody has to stay and fight for it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I don't blame you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "I do not know your goddess as you do, priest, but my people call the moon Mu'sha, the Earth Mother's left eye. She still watches over this forest, I believe, even if her light has a long way to reach through the fel." },
      },
      choices = {
        { text = "Then I'll go with her blessing.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "xd_default", text = "So have I, though I am still clumsy in that shape and the elves laugh to see it. Tell me, when you wear it, does Mu'sha seem nearer, or is that only a story the young druids tell each other?" },
      },
      choices = {
        { text = "It's nearer. It hums in the bones.", next = "BACK", fx = { affinity = 2 } },
        { text = "Only a story. It's just feathers.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    xhunter = {
      big = true,
      lines = {
        { id = "xh_default", text = "Every hunter of my tribe learns that, and learns to give thanks for the life he takes. The beasts here are sick, not wicked, and I would ask you to remember that before you loose an arrow." },
      },
      choices = {
        { text = "I'll remember. Some creatures deserve more care than others.", next = "BACK", reply = "Thank you, and I will rest easier knowing it. The Earth Mother sees how a hunter kills, and not only what.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that kills is a beast that dies. That's all.", next = "BACK", reply = "Perhaps it is, out in the wider world, but these were not born killers. I would ask you to remember that when you meet one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kal_wildkin = {
      big = true,
      lines = { { id = "kwi_d", text = "It was your forest, and it is still, and I am only a guest who carries water and plants seeds. But the sickness here does not care whose land it is, and it will take all the hands we have, hooves included, to turn it back." } },
      choices = {
        { text = "Then we strike at the source before it spreads.", next = "BACK", reply = "Strike if you must, but do not let your anger choose the targets. The land remembers how it was healed.", fx = { align = { order = -1 } } },
        { text = "We should study the poison first, then act.", next = "BACK", reply = "My heart agrees with you. If we only kill, we will be killing forever.", fx = { align = { order = 1 }, trait = { curious = 1 } } },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furb", text = "The Timbermaw are the only sane furbolgs left in the north, and they guard the only good road to Winterspring. Be polite to them, as you would be to any proud host." } },
    cenarion_circle = { { id = "tp_circ", text = "The Circle gathers druids of the People and of the elves alike, and here at the Sanctuary we are the Emerald Circle. Greta Mosshoof and I are the only tauren among us, so we keep each other company." } },
    advice = { { id = "tp_ad", text = "Look at a creature's eyes before you decide it is a monster. Most of the time it will be one, but not always." } },
    _none = { { id = "tp_none", text = "I know the land and the beasts and very little else, I am afraid. Ask Kelek; he reads more books than I ever will." } },
  },
}

-- Talonbranch Glade's keepers: Kaerbrus (hunter trainer, with his cat Shi'alune), Malygen (general goods),
-- Mylini Frostmoon (weapon merchant).
-- Voice: bibles/talonbranch_folk.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kaerbrus
---------------------------------------------------------------------------
P:NPC {
  key = "kaerbrus", id = TODO_NPC("Kaerbrus"), name = "Kaerbrus", title = "Hunter Trainer",
  bible = "bibles/talonbranch_folk.md", role = "trainer", tier = "service",
  communities = { "talonbranch" }, temper = { "quiet", "watchful" }, values = { "nature", "loyal" },
  notices = { "pet", "hunter" },

  impression = {
    first = "He looks at your pet before he looks at you.",
    third = "{name} met Kaerbrus, the night elf hunter trainer at Talonbranch Glade, and his cat Shi'alune.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Shi'alune purrs when she sees you, and I've learned to trust her. Come in, and tell me what you're hunting." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Shi'alune doesn't like you today, and neither do I. Ask what you need and keep your distance." },
    { id = "g_default", text = "My cat Shi'alune doesn't mind you, so neither do I. What do you need?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, this far into Felwood. Come, let's see what you've learned on the way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Shi'alune remembered you before I did." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} away from the streams, and away from anything in Felwood that's still moving after it should be dead. Beasts trust their noses, and their noses lie here." },
    { id = "n_hunter", cat = "hunter", when = { class = "HUNTER", minLevel = 58 },
      text = "You've the look of someone who could speak to the Ancients in the Irontree Woods. They don't talk to many hunters, but they might talk to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kaerbrus, and I train hunters for the Sentinels here at Talonbranch. Shi'alune and I have kept this glade for a long time, and between us we've learned what Felwood does to a beast that drinks the wrong water." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Good, then you can learn from me, and you can also learn from this forest, which is a harsher teacher. Watch the bears and wolves here, because the corruption has made them strong and stupid in the same breath." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're Horde, and this is a Sentinel glade, so I'd keep your weapons put away. I'll answer what you ask, though Shi'alune has her own opinions about your people." },
      },
      again = {
        { id = "h_again", text = "Something else? Shi'alune is asleep, so speak quietly." },
        { id = "h_again2", text = "Ask. I have the time while the glade is quiet." },
      },
      choices = {
        { text = "A hunter guards the glade before chasing the glory.", next = "BACK", reply = "Spoken like a Sentinel. That is how we have kept Talonbranch alive.", fx = { align = { order = 1 } } },
        { text = "I hunt for myself, not for the Sentinels.", next = "BACK", reply = "Then hunt somewhere else, and do not come running here when the satyrs chase you.", fx = { align = { order = -1 } } },
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Tell me about Shi'alune.", next = "cat" },
        { text = "What does the corruption do to beasts?", next = "beasts" },
        { text = "What are the Ancients in the Irontree Woods?", next = "ancients", when = { class = "HUNTER" } },
        { text = "What do you teach the Sentinels' scouts?", next = "scouts" },
        { text = "How did Felwood get this way?", next = "felwood" },
        { text = "Shi'alune doesn't like the Horde?", next = "horde", when = { faction = "Horde" } },
        { text = "I was born under these trees, before they sickened.", next = "kal_born", when = { race = "NightElf" } },
        { text = "What should a hunter fear most in Felwood?", next = "hnt_fear", when = { class = "HUNTER" } },
        { text = "Vartrus has asked a great deal of me, Kaerbrus.", next = "hnt_vartrus", when = { class = "HUNTER", questActive = TODO_QUEST("Stave of the Ancients") } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    cat = {
      lines = { { id = "ca_default", text = "She was a cub when I found her by a dead moonwell in Ashenvale, too weak to stand. She's been at my side since, and she has never once drunk from a Felwood stream, because I taught her to smell the sickness before she tasted it." } },
      choices = {
        { text = "She's beautiful.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Can you teach that to my pet?", next = "beasts" },
        { text = "How did the moonwell die?", next = "cat_well" },
      },
    },
    cat_well = {
      lines = { { id = "cw_default", text = "Satyrs fouled it, the way they foul everything they creep near, with the filth they carry south out of these woods. Her mother drank from it and didn't wake, and Shi'alune was curled against her, waiting. I sat with them both until morning before I took her." } },
      choices = {
        { text = "And her name? What does it mean?", next = "cat_name" },
        { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } },
      },
    },
    cat_name = {
      lines = { { id = "cn_default", text = "Something like 'moon's shadow', near enough, because she was black as the night between the moons and she followed me everywhere I went. The Sentinels tease me for naming her so grandly, and she doesn't care, and neither do I." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "elune" } } } },
    },
    beasts = {
      big = true,
      lines = { { id = "be_default", text = "It makes them grow big and angry, and then it makes them rot while they're still walking. Some hunters here won't tame anything in Felwood at all. Others say a beast that survives the corruption is the strongest companion there is." } },
      choices = {
        { text = "A corrupted beast should be put down, not tamed.", next = "beasts_end", fx = { align = { order = 1 } } },
        { text = "If it's strong and survives, I'll tame it.", next = "beasts_end", fx = { align = { order = -1 } } },
        { text = "What do you do?", next = "beasts_end" },
      },
    },
    beasts_end = {
      lines = { { id = "bee_default", text = "I put them down, and I do it quickly, and I don't enjoy it. Shi'alune watches me do it every time, and I like to think she understands." } },
      choices = {
        { text = "Is there no way to heal them?", next = "beasts_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_heal = {
      lines = { { id = "bh_default", text = "The druids of the Emerald Circle are trying, with the cleansed soil and the little sprouts they plant along the road. Arathandris at the Sanctuary thinks the forest can be healed, given a hundred years; I think the beasts don't have a hundred years." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    ancients = {
      lines = { { id = "an_default", text = "Spirits of the Ancients of Lore, who died at Hyjal and never quite left. Vartrus and his brothers speak to hunters who've proven themselves, and what they ask is hard, but I've never heard of a hunter who regretted it." } },
      choices = {
        { text = "What sort of thing do they ask?", next = "ancients_ask" },
        { text = "I'll seek them out. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    ancients_ask = {
      lines = { { id = "aa_default", text = "To hunt the things in this forest that should never have been born, and to bring proof. They don't care how strong your bow is; they watch how you treat what you kill, and the hunters who boast never hear them speak at all." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    scouts = {
      lines = { { id = "sc_default", text = "How to read a track that's half rotted away, how to smell bad water, and how to tell a satyr's footprint from a deer's in mud, which is harder than it sounds. They come to me green and leave knowing which bushes bite." } },
      choices = {
        { text = "Do they all come back?", next = "scouts_back" },
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    scouts_back = {
      lines = { { id = "sb_default", text = "Not all. Jaedenar takes some, and the Shadow Hold takes others, and once in a long while one simply walks into the Bloodvenom and doesn't think to stop. I keep their names on a strip of bark by the door, and Shi'alune sleeps under it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    felwood = {
      lines = { { id = "fe_default", text = "The Burning Legion came through here in the war, to Hyjal and the World Tree, and wherever demons walked the ground remembered it. What they left behind seeped into the soil and the water, and the satyrs and the cultists have been feeding it ever since." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } } },
    },
    horde = {
      lines = { { id = "ho_default", text = "She was a cub in Ashenvale, near where the axes ring now, and the first thing she learned to fear was that sound. She can't tell one of you from another, of course; she only knows the smell of an axe, and some of you carry it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kal_born = {
      big = true,
      lines = { { id = "kbo_d", text = "Then you have more right to grieve here than I do, for I only came north when the Sentinels raised this glade. Tell me, was it the demons at Hyjal who did it, or what came after, the cults and the satyrs who stayed and fed on what the Legion left behind? I have heard it told both ways." } },
      choices = {
        { text = "The Legion broke it. The cults only keep it broken.", next = "BACK", reply = "Then we fight the keepers, since the breakers are gone. That is what Talonbranch is for.", fx = { learn = { "burning_legion" } } },
        { text = "We let it happen. We should have cleansed it sooner.", next = "BACK", reply = "Perhaps, and that is a bitter thing to say aloud. Darnassus had its own wounds to tend, and Felwood was left to wait.", fx = { align = { order = -1 } } },
        { text = "Darnassus made the right choice. Teldrassil first.", next = "BACK", reply = "Spoken loyally. I hope the trees here forgive the waiting.", fx = { align = { order = 1 } } },
      },
    },
    hnt_fear = {
      lines = { { id = "hfe_d", text = "Your own companion, after a month here, if you let it drink from the wrong pool. The corrupted wells poison slowly, and a beast does not know the difference between clean water and fel until it is too late, so carry water from the Emerald Sanctuary and do not let it lap from the streams." } },
      choices = {
        { text = "And after that?", next = "hnt_fear2" },
        { text = "I'll carry water. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    hnt_fear2 = {
      lines = { { id = "hfe2_d", text = "The Jadefire satyrs, who move through the trees like smoke and strike at whoever is weakest, which is usually the beast. Keep it close and keep it between you and the shadows, and Shi'alune will tell you the rest with her ears, if you watch her." } },
      choices = { { text = "Close, and watchful. Something else.", next = "BACK" } },
    },
    hnt_vartrus = {
      lines = { { id = "hva_d", text = "He asks a great deal of everyone, and more of hunters, because he believes we can bear it. I have never earned his stave myself, and I am not ashamed of that, but I have trained three who did, and every one came back quieter than they left, and better." } },
      choices = {
        { text = "Then I'll come back quieter too.", next = "BACK", reply = "Come back at all, and I will count it a good season.", fx = { affinity = 1 } },
        { text = "I mean to come back louder.", next = "BACK", reply = "Then you have not met Artorius yet. Go and meet him, and we will talk again.", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Beasts, the glade, and the hunters who train here." } },
    advice = { { id = "tp_ad", text = "Watch your pet's nose. If it won't drink, neither should you." } },
    sentinels = { { id = "tp_sent", text = "I train their scouts. They come to me green and leave knowing which bushes bite." } },
    burning_legion = { { id = "tp_bl", text = "They've been gone for years, and the water still tastes of them. That's all I need to know of demons." } },
    _none = { { id = "tp_none", text = "I don't know. Ask Shi'alune, and she'll tell you just as much." } },
  },
}
