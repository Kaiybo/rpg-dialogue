-- Morgan's Vigil: the Alliance's last foothold in the Burning Steppes, in the ruins on the southeastern ridge. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maxwell", id = TODO_NPC("Marshal Maxwell"), name = "Marshal Maxwell",
  bible = "bibles/burningsteppes.md", role = "soldier", tier = "major",
  communities = { "morgans_vigil" }, temper = { "steady", "sharp" }, values = { "dutiful", "loyal" },
  likesTone = "blunt",
  notices = { "class", "race", "deputy", "lock_armor", "lock_stones" },

  impression = {
    first = "He is tired and bitter, but the kindness hasn't left him yet.",
    third = "{name} met Marshal Maxwell, who commands what is left of Stormwind's presence at Morgan's Vigil.",
  },

  greetings = {
    { id = "dp_rep_tb_f", when = { rep = { faction = "Thorium Brotherhood", min = "Friendly" } }, text = "I hear the Thorium Brotherhood thinks well of you. Odd friends for one of ours, but useful ones out here." },
    { id = "g_op_dragons", when = { opinion = { topic = "black_dragonflight", stance = "respect" } }, text = "Word's come down the road that you've spoken well of the black dragonflight, deputy. I'll assume it was a joke, and I'll expect you not to repeat it inside my walls." },
    { id = "g_default", text = "Another Alliance face this far north? That's the best news I've had all week." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the mountain in one piece, I see. Pull up a crate; it's the only furniture we have." },
    { id = "g_deputy", when = { questDone = TODO_QUEST("The True Masters") }, text = "Deputy. Sit down and tell me what the Steppes did to you today." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The mountain glows brighter after dark, and so do the orcs' fires. Keep your voice down." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You've been gone {away}, and I'd begun to fear the mountain had you. Pull up a crate, not the one with the nails in it, and tell me where you've been." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "You've been away {away} and come back looking like you could take Blackrock on your own. Sit down, because I've work worthy of that." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into a real fighter since we last spoke. The Steppes need that more than another crate of hardtack, and Light knows we've plenty of those, all of it gone soft." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you put the fear into someone on the ridge. We're few enough up here, so save it for the Blackrock orcs." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Vigil's been singing your praises, quietly, since the orcs can hear us. You've my thanks as well." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, up here? Light bless you, then, because the Light has been very quiet in this camp, and my soldiers have noticed." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Windsor would have liked you; he always said a hammer and a prayer were the only two arguments an orc ever listened to." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, and you've got that look your people get when anyone says 'Dark Iron' too near you. Good; you'll be useful." },
    { id = "n_deputy", cat = "deputy", place = "before", when = { questDone = TODO_QUEST("The True Masters") },
      text = "So you're Bolvar's deputy. I asked the Keep for a regiment, and you've done more than some regiments I've marched with." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry that blade like someone who's used it on more than training dummies. Good; this ridge has had enough of people who haven't." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "You wear demon hide like it's part of your uniform, deputy. My soldiers have seen enough fire to last them, so keep it covered on the ridge." },
    { id = "n_lock_healthstone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "A healthstone could keep one of my people on their feet long enough to retreat, and there are too few of us to waste. If you've extra, I won't refuse." },
  },

  start = "hello",
  nodes = {
    op_regent = {
      lines = {
        { id = "opr_default", text = "That's not a question a marshal answers in a report, deputy. The Highlord asks for proof, and Lady Prestor at his side asks for more, and Windsor is in chains while they ask. You've stood in that throne room, so you tell me." },
      },
      choices = {
        { text = "Bolvar's a good man stuck in an impossible seat.", next = "op_reg_trust", fx = { affinity = 1, align = { order = 1 }, opinion = { bolvar = "trust" } } },
        { text = "The Regent dithers while soldiers die. He's failing us.", next = "op_reg_weak", fx = { align = { order = -1 }, opinion = { bolvar = "distrust" } } },
        { text = "It's Lady Prestor who stalls, Marshal. Watch her.", next = "op_reg_prestor", fx = { trait = { skeptical = 1 }, opinion = { prestor = "distrust" } } },
        { text = "Bolvar is a knight of the Silver Hand. I trust him.", next = "op_reg_trust", fx = { affinity = 1, opinion = { bolvar = "trust", silver_hand = "respect" } }, when = { class = "PALADIN" } },
        { text = "That's above my rank, Marshal.", next = "BACK" },
      },
    },
    op_reg_trust = {
      lines = {
        { id = "oprt_default", text = "I'd have said the same a year ago, and I'd like to say it again. He held the city when the king vanished, and that's no small thing, but holding isn't the same as acting." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_reg_weak = {
      lines = {
        { id = "oprw_default", text = "Careful, deputy. I'll not hear the Highlord called a coward in my camp, though I'll admit I've written him three letters this month and torn up two of them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_reg_prestor = {
      lines = {
        { id = "oprp_default", text = "You're not the first to say it, and you won't be the last, and they all end up posted somewhere very far from Stormwind. Keep it out of your reports and keep your eyes open." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Then you'll fight them on their ground, which is ash and fire and slopes that favour whoever stands highest, and they always stand highest. I'd ask you to hold the road to Redridge before you go hunting glory at the Spire, because if the Vigil falls, Lakeshire is next." } },
      choices = {
        { text = "We hold the road. Lakeshire's people come first.", next = "BACK", reply = "Then you've more sense than half the officers I trained with. Hold the road, and Lakeshire will never know how close it came.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We take the fight to the Spire. Waiting never won a war.", next = "BACK", reply = "Waiting's kept this camp alive, deputy, but I'll not stop you. Bring back something I can put in a report, and bring yourselves back too.", fx = { align = { order = -1 } } },
        { text = "Why does the Vigil hold so few soldiers?", next = "xpt_company2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_company2 = {
      lines = { { id = "xpt_company2_default", text = "Because Stormwind's soldiers are spread from Westfall to Duskwood, the King's been gone a long while, and nobody in the city likes signing for men they'll never see. We hold with what we have, which is mostly stubbornness and a very good gryphon master." } },
      choices = {
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "What troubles me is a mountain full of orcs and a dragon on top of it. If your spirits can tell me when the Blackrock are moving, I'll put that in a report too, and nobody will read that one either." } },
      choices = {
        { text = "I'll serve the Vigil as a soldier, Marshal, spirits or no.", next = "BACK", reply = "That's all I ask of anyone on this ridge, and more than most give. Report to the north wall, and welcome.", fx = { align = { order = 1 } } },
        { text = "The spirits aren't soldiers. I'll follow them, not orders.", next = "BACK", reply = "Then follow them, and if they ever point at the Blackrock, tell me where. I'll take help in whatever shape it comes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd put a kobold on my line if it could hold a sword, and you can do a good deal more than that. Just keep whatever you call up pointed at the mountain, deputy, because my soldiers have seen enough fire to last them." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'd put a kobold on my line if it could hold a sword, and your demon's clearly ready to do more than that. Just keep it pointed at the mountain, deputy, because my soldiers are watching it instead of the ridge, and they've seen enough fire to last them." },
      },
      choices = {
        { text = "Every weapon against the Blackrock is a good one.", next = "BACK", reply = "That's how I've had to see it. I've had warlocks on the north wall and paladins on the south, and the orcs died the same either way.", fx = { align = { light = -1 } } },
        { text = "I'll fight with care, Marshal. Your soldiers come first.", next = "BACK", reply = "Good, and they'll notice, even if they never say so. Welcome to the Vigil, deputy.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Stormwind barely sends us bread, so I've no hope at all for this land, though a druid once told me the ash makes the best soil in the world given a hundred years. I'll not be here to see it, but I'd like to think somebody will be." } },
      choices = {
        { text = "Then the Vigil should hold this ridge until the land comes back.", next = "BACK", reply = "Somebody ought to, and it seems it's us for now. I'll write that in the next report, and nobody will read it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "This ground isn't worth a soldier's life. Stormwind's right to ignore it.", next = "BACK", reply = "Then you'd hand the Blackrock a road straight to Redridge. I'll hold this ridge, worth it or not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_ubrs = {
      big = true,
      lines = { { id = "xcl_ubrs_default", text = "Broken for now. Windsor told us what Drakkisath was guarding and who was giving him orders from higher still, and the Black Dragonflight doesn't run short of generals. Still, every soldier on this ridge will sleep a little sounder tonight, and I'll take that." } },
      choices = {
        { text = "Then we finish it, Marshal. We take the war to their master.", next = "BACK", reply = "That's Windsor talking, and I'd follow him anywhere. Rest first, deputy, and then we'll see.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We've done our part. Let Stormwind deal with the dragons now.", next = "BACK", reply = "You've earned the right to say so, and I'll not argue. But Stormwind hasn't dealt with anything yet.", fx = { align = { honor = -1 } } },
        { text = "What was Drakkisath guarding up there?", next = "xcl_ubrs2" },
      },
    },
    xcl_ubrs2 = {
      lines = { { id = "xcl_ubrs2_default", text = "Something that opens the way to the dragons' own lair, if Windsor's right, and he usually is. I'd sooner nobody went through that door unprepared, so tell me before you try it, deputy." } },
      choices = {
        { text = "I'll tell you before I go anywhere near it.", next = "BACK" },
      },
    },
    dd_mx_rank = {
      lines = {
        { id = "dd_mx_rank1", text = "I don't doubt it, and I won't pretend the Horde isn't a danger. But every soldier Stormwind sends to fight orcs in some valley is one who isn't here, watching a mountain full of Blackrock orcs and Dark Irons who would burn Lakeshire to the ground given a week's quiet." },
      },
      choices = {
        { text = "The Horde is the greater threat. Stormwind is right.", next = "BACK", reply = "Perhaps. I'll keep writing my reports either way, and someone may read one.", fx = { align = { honor = -1 } } },
        { text = "You're right. This mountain is the real danger.", next = "BACK", reply = "Then you're welcome at the Vigil any time, Knight, and I mean that.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "A full company at Morgan's Vigil, and you've no notion how rare that is. Most who come up from Redridge come in ones and twos, and the Blackrock see them coming from the mountain." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Blackrock", min = 40 } }, text = "The scouts tell me you've been cutting down Blackrock orcs all across the Steppes, and the camps are quieter for it. Keep at it, but don't get careless, because Rend notices when his numbers drop." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Stormwind pretends your kind don't exist, and out here I'm too short of soldiers to pretend anything at all." },
        { id = "h_cl_ubrs", tags = { "news" }, when = { cleared = "Upper Blackrock Spire", faction = "Alliance" },
          text = "General Drakkisath is dead in the high halls of the Spire, and you were there to see it. I'll write the report tonight, deputy, and for once I'll enjoy writing it." },
        { id = "h_default", key = true,
          text = "Marshal Maxwell, commanding what's left of Stormwind's presence in the Burning Steppes. We hold this ridge, we watch the mountain, and we write reports that nobody in the capital reads." },
        { id = "h_masters", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "You're carrying the True Masters business, I see; Magistrate Solomon's letters and the Highlord's seal always end up at my fire sooner or later. Sit, and I'll tell you how many have come before you." },
        { id = "h_windsor_go", tags = { "news" }, when = { questActive = TODO_QUEST("Marshal Windsor") },
          text = "If Ragged John's tale holds a single grain of truth, Windsor is sitting in a Dark Iron cell under that mountain. Go and find out, deputy, and bring me something I can put in a report." },
        { id = "h_hope", tags = { "news" }, when = { questRecent = { TODO_QUEST("Abandoned Hope"), days = 7 } },
          text = "I keep going over what you told me. Windsor was the steadiest man I ever served under, and now he's raving in a cell about reptiles and fools." },
        { id = "h_jail", tags = { "news" }, when = { questRecent = { TODO_QUEST("Jail Break!"), days = 7 } },
          text = "He came through this camp like a storm off the mountain, not five minutes ahead of you, and he didn't even stop to eat. You did that, {name}; I'll be telling it for years." },
        { id = "h_mission", when = { questActive = TODO_QUEST("Maxwell's Mission") },
          text = "Voone, Omokk and Wyrmthalak: the war master, the ogres' lord and the overlord of the citadel. Take those three away and the Spire forgets how to march." },
        { id = "h_drakk", when = { questActive = TODO_QUEST("General Drakkisath's Demise") },
          text = "Drakkisath sits in the high halls of the Spire giving orders to orcs and dragons alike. I want him gone before he finishes whatever he's planning." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I don't sleep much since Windsor went missing, so I sit by this fire and count the lights on the mountain. There are more of them every week." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's a face I'm glad to see, which isn't something I say about most people who walk up this ridge. Sit by the fire, deputy, and we'll pretend for a minute that the mountain isn't there." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle. You'll find nothing growing on this ridge but stubbornness, I'm afraid, and we've plenty of that." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman at the Vigil. Stormwind won't send me soldiers, so I'll take whatever help Ironforge sends, and I won't ask how it works." },
        { id = "dd_dragonkin", when = { questDone = TODO_QUEST("Dragonkin Menace") },
          text = "Helendis put your name in his report on the dragonkin, and he doesn't name anyone lightly. Whatever is gathering those beasts in the Steppes, you've thinned its ranks." },
        { id = "dd_rank", when = { pvpRank = 6, faction = "Alliance" },
          text = "A Knight's rank, I see. Stormwind's been handing those out to the ones who hold the line in the valleys, and I'd sooner have a few of them up here than all the paperwork the capital sends." },
      },
      again = {
        { id = "h_again", text = "What else, deputy? I've got a report to write, but it'll keep; they always do." },
        { id = "h_again2", text = "Go on. Out here a conversation is the only luxury we've got left." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away. The orcs won't move before dawn, and neither will I." },
      },
      choices = {
        { text = "I earned my rank against the Horde, Marshal.", next = "dd_mx_rank", when = { pvpRank = 6, faction = "Alliance" } },
        { text = "Who commanded here before you, Marshal?", next = "windsor" },
        { text = "You look badly outnumbered out here, Marshal.", next = "enemy" },
        { text = "Why won't Stormwind send more soldiers?", next = "stormwind" },
        { text = "This camp holds more than soldiers, by the look of it.", next = "vigil" },
        { text = "Your soldiers look like they need a healer.", next = "priest", when = { class = "PRIEST" } },
        { text = "The Light sends you one more paladin, Marshal.", next = "paladin", when = { class = "PALADIN" } },
        { text = "My people owe the Dark Irons a debt.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Windsor's alive. I saw him in the Depths.", next = "windsor_alive", when = { questDone = TODO_QUEST("Marshal Windsor") } },
        { text = "Bijou's map names their master: Nefarian.", next = "nefarian", when = { questDone = TODO_QUEST("Message to Maxwell") } },
        { text = "Put me on the line, Marshal. I'm a soldier.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "I heard mages came up here. What became of them?", next = "k_mage", when = { class = "MAGE" } },
        { text = "I could scout the mountain for you, unseen.", next = "k_rogue", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Few marshals would put someone like me on their line.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does Stormwind ever send anything to help this land, Marshal?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Some would be troubled that I fight with the elements, Marshal.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Drakkisath is dead, Marshal. The upper Spire is broken.", next = "xcl_ubrs", when = { cleared = "Upper Blackrock Spire", faction = "Alliance" } },
        { text = "We've come to fight the Blackrock, Marshal.", next = "xpt_company", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "I'll see what I can do, Marshal.", next = "END", fx = { affinity = 1, standing = { morgans_vigil = 1 } } },
      },
    },

    windsor = {
      big = true,
      lines = {
        { id = "w_default", key = true, fx = { learn = { "windsor" } },
          text = "Marshal Reginald Windsor was my commanding officer, and he'd been gathering proof about the Blackrock for months. He rode into the mountain with everything we'd learned, and neither he nor a single page of it came back out." },
      },
      choices = {
        { text = "Did anyone survive?", next = "windsor_john" },
        { text = "He sounds like a hard man to serve under.", next = "windsor_man" },
        { text = "I'm sorry, Marshal.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    windsor_john = {
      lines = {
        { id = "wj_default", text = "One. A dwarf called Ragged John, who slipped away while Windsor was still fighting, and who now spends his days drinking in a cave up north at Flame Crest. He swears he knows what happened, if you can bear to listen to him." },
        { id = "wj_heard", when = { heardLine = "ragged_john.st_end" },
          text = "So you sat through the whole of John's tale. I'll admit I never managed it, but if he says the Dark Irons took Windsor alive, then that's more than I knew yesterday." },
      },
      choices = {
        { text = "You don't think much of John.", next = "windsor_coward" },
        { text = "I'll go and hear him out.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    windsor_coward = {
      lines = { { id = "wc_default", key = true, text = "He ran, deputy, and the man he ran from was holding off fifty orcs alone. Maybe it was the sensible thing, and maybe that's why I can't forgive it." } },
      choices = {
        { text = "One of them had to carry the news.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "I'd have stayed and fought.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Is it John you can't forgive, Marshal, or yourself?", tag = "Persuade", next = "windsor_self",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "kind" } } } },
          fail = { next = "windsor_report", fx = { affinity = -1 } } },
        { text = "Right. Let's talk about something else.", next = "BACK" },
      },
    },
    windsor_man = {
      lines = { { id = "wm_default", text = "A legend in Stormwind and a terror to work for, ornery even on his good days. He carried a dwarven hammer called Ironfoe that had been in his family for generations, and he never once stopped asking why the orcs were fighting like an army." } },
      choices = {
        { text = "Why were they?", next = "enemy_dragons" },
        { text = "He sounds like a good commander.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    enemy = {
      lines = {
        { id = "e_default", fx = { learn = { "blackrock", "firegut", "blackrock_spire" } },
          text = "The Blackrock orcs hold the mountain's foot and everything north of us, the Firegut ogres hold Dreadmaul Rock, and both of them answer to whatever sits in Blackrock Spire. Below the Spire, the Dark Irons have a city of their own, and they hate the orcs nearly as much as they hate us." },
      },
      choices = {
        { text = "The Spire must have a commander worth fearing.", next = "enemy_spire" },
        { text = "Who's really behind the orcs?", next = "enemy_dragons" },
        { text = "That's a lot of enemies for one ridge.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    enemy_spire = {
      lines = { { id = "es_default", text = "Rend Blackhand calls himself Warchief up there, which I'm told makes Thrall's people spit. Below him are war masters, ogre lords and an overlord, and above him, if the reports are right, are things with wings." } },
      choices = {
        { text = "Things with wings?", next = "enemy_dragons" },
        { text = "Then I'll start at the bottom.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    enemy_dragons = {
      big = true,
      lines = {
        { id = "ed_default", key = true, fx = { learn = { "black_dragonflight" } },
          text = "Helendis found the answer before Windsor did: the black dragonflight is driving the Blackrock, feeding their rage and pointing it at Redridge. Orcs don't plan like this on their own, and these ones plan far too well." },
        { id = "ed_nefarian", when = { questDone = TODO_QUEST("Message to Maxwell") },
          text = "We know the name now, thanks to you and that goblin: Nefarian, a son of Deathwing, sitting at the top of the Spire with the Blackrock as his beasts of burden. It's exactly what Helendis feared, and it's worse to hear it said aloud." },
      },
      choices = {
        { text = "Does Stormwind know?", next = "stormwind" },
        { text = "Then we strike at the dragons.", next = "BACK", fx = { trait = { brave = 1 }, opinion = { black_dragonflight = "fight" } } },
      },
    },

    stormwind = {
      big = true,
      lines = {
        { id = "s_default", text = "Because the Highlord wants proof, and proof is exactly what Windsor took into the mountain with him. Until someone carries it back, the court will go on telling itself that a few orcs in the hills are Lakeshire's problem." },
        { id = "s_noble", when = { origin = "human_minor_noble" },
          text = "You'd know better than I would how the House of Nobles talks about the Steppes, if it talks about them at all. Out here we've stopped waiting for the post." },
      },
      choices = {
        { text = "Then I'll find you the proof.", next = "stormwind_proof", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Proof or no proof, I'd stop waiting on the court.", next = "BACK", reply = "So would I, if I had the men to stop. We hold, and we wait, and we write.", fx = { align = { order = -1 } } },
        { text = "The court has its reasons.", next = "stormwind_court" },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    stormwind_proof = {
      lines = { { id = "sp_default", text = "Plenty have said that, and I've buried most of them, so I'll hold my cheering for now. Come back with something in your hands and I'll cheer as loud as you like." } },
      choices = { { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    stormwind_court = {
      lines = { { id = "sc_default", text = "I'm sure it does, and I'm sure they're excellent reasons when you hear them in a warm room. Fight on two fronts, Windsor used to say: the orcs in front of you and the fools behind you." } },
      choices = {
        { text = "What do you make of the Regent, Marshal?", next = "op_regent" },
        { text = "Careful, Marshal. Walls have ears.", next = "BACK", reply = "Careful is all I've been for three years, deputy. One honest sentence won't hurt anyone up here.", fx = { align = { order = 1 } } },
        { text = "He wasn't wrong, Marshal.", next = "BACK", reply = "No, he wasn't, and I miss him for it every day. That's enough of that, though.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },

    vigil = {
      lines = {
        { id = "v_default", text = "Helendis Riverhorn, who reads this land like a book and found the first proof of the dragons; Jalinda Sprig and what's left of her mages; a lady from Stormwind hunting treasures for a count; and Oralius, who fought harder than any of us before the Steppes got into his head." },
      },
      choices = {
        { text = "Something seems wrong with Oralius.", next = "vigil_oralius" },
        { text = "Why call it Morgan's Vigil?", next = "vigil_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vigil_oralius = {
      lines = { { id = "vo_default", text = "He talks to a pirate nobody else can see, and his battle plans are better than mine, which says something about one of us. I won't send a good soldier home just because the war got inside him; humour him, and do what he says." } },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Is that wise?", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    vigil_name = {
      lines = { { id = "vn_default", text = "The name was on the old stones when we came, and the stones aren't telling. These were farms once, before the mountain blew, and I like to think somebody kept watch here long before we did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    priest = {
      lines = { { id = "pr_default", text = "They do, and they'd never say so. Half of them haven't seen a priest since they marched out of Stormwind; a word and a blessing would do more for this camp than another crate of arrows." } },
      choices = {
        { text = "I'll walk the camp before I go.", next = "BACK", reply = "Thank you, and they'll be the better for it. Start with the ones by the north fire.", fx = { affinity = 3, align = { light = 2 }, standing = { morgans_vigil = 2 } },
          journal = { first = "Marshal Maxwell's soldiers hadn't seen a priest in months. I walked the camp at Morgan's Vigil and blessed them.",
                      third = "{name} walked the camp at Morgan's Vigil, blessing soldiers who hadn't seen a priest in months." } },
        { text = "They're soldiers. They'll pray when they're ready, not when I say.", next = "BACK", reply = "That's true, and some of them never will. I only thought a word might help.", fx = { align = { light = -1 } } },
        { text = "Has the Light gone quiet for you too?", next = "priest_quiet" },
      },
    },
    priest_quiet = {
      lines = { { id = "pq_default", text = "I pray when Windsor's name comes up and not much otherwise, and I wouldn't say the Light owes me an answer. If it's listening, tell it we're still here." } },
      choices = {
        { text = "It's listening, Marshal.", next = "BACK", reply = "Then tell it thank you from me, deputy, and that we could use a little more. I'll be listening too.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I wouldn't count on it, Marshal. The Light's been quiet for a lot of us.", next = "BACK", reply = "Aye, it has, and I'll not pretend otherwise. We're still here, though, Light or no Light.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Then the Light has better timing than the Keep. Stand at the front when we go into that mountain, and let the orcs see what's coming." } },
      choices = {
        { text = "Gladly, Marshal.", next = "BACK", reply = "Good. Let the orcs see a {class} in the front rank of the Vigil, and let them wonder what else Stormwind is sending.", fx = { affinity = 2, align = { light = 1 }, standing = { morgans_vigil = 1 } } },
        { text = "I'd rather the orcs never saw me coming, Marshal.", next = "BACK", reply = "Then come at them sideways, and I'll not complain. Windsor used to say the best charge he ever made was the one the enemy heard about afterward.", fx = { align = { honor = -1 } } },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", fx = { learn = { "dark_iron", "blackrock_depths" } },
        text = "And they owe you another; I hear Ironforge's own princess was taken on the road through these very Steppes. Whatever you settle with them in the Depths, settle a little for Windsor too." } },
      choices = {
        { text = "Count on it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    windsor_alive = {
      big = true,
      lines = {
        { id = "wa_default", text = "Alive, chained and talking, and I'll take it, even mad. If you go back down there, take his side over mine whenever we disagree; he always did know something the rest of us didn't." },
        { id = "wa_freed", when = { questDone = TODO_QUEST("Jail Break!") },
          text = "He rode for Stormwind swearing his tablets would prove everything, the Highlord and Lady Prestor included, and I couldn't make sense of half of it. Whatever he means to say in that Keep, I hope they listen this time." },
      },
      choices = {
        { text = "He called the court blind.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "I'll bring him home.", next = "BACK", fx = { affinity = 2, standing = { morgans_vigil = 2 } } },
      },
    },
    nefarian = {
      lines = { { id = "nf_default", text = "It coincides with everything Helendis worked out, and with everything Windsor suspected, which is the worst kind of good news. We fight them here at their doorstep, and someone braver than me will have to fight them inside Stormwind." } },
      choices = {
        { text = "Inside Stormwind?", next = "nefarian_inside" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nefarian_inside = {
      lines = { { id = "ni_default", text = "That's the part I don't put in reports, deputy. Dragons don't win wars with claws alone, and Windsor never trusted a soul at court." } },
      choices = {
        { text = "Then neither will I, Marshal.", next = "BACK", reply = "Smart, deputy, though it's a lonely way to serve a kingdom. Keep your reports short, your eyes open, and your back to a wall whenever someone from Stormwind comes calling.", fx = { trait = { cautious = 1 }, align = { honor = -1 } } },
        { text = "The court's not perfect, but I'll trust it until it fails me.", next = "BACK", reply = "That's your right, and I hope it never does. Windsor trusted it once too.", fx = { align = { honor = 1 } } },
      },
    },
    windsor_self = {
      big = true,
      lines = {
        { id = "ws_default", text = "That's a priest's question, deputy, and it gets a straight answer. Windsor left me on this ridge to hold it while he rode in, and I've spent every night since wondering whether one more sword would have changed anything, so when I call John a coward, I'm mostly talking to the fire." },
      },
      choices = {
        { text = "You followed your orders, Marshal.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then go easier on John.", next = "BACK", fx = { affinity = 1, opinion = { ragged_john = "sensible" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    windsor_report = {
      lines = {
        { id = "wr_default", text = "I'll thank you to leave my conscience out of the report, deputy. John ran, and that's all that goes on the page." },
      },
      choices = { { text = "As you say, Marshal.", next = "BACK" } },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Then stand by the north wall when the light goes, because that's when the worg riders test it. I've thirty soldiers fit to fight and twice that many who'll tell you they are, so one more who means it counts." },
        { id = "xwa_guard", when = { origin = "human_city_guard" },
          text = "City Watch, were you? Then you've stood a post in the rain while officers argued above your head, and you'll feel right at home. Take the north wall at dusk; the worg riders test it then." },
        { id = "xwa_dwarf", when = { race = "Dwarf" },
          text = "A dwarf with an axe, and I'll thank Ironforge for you in my next report, which they'll also not read. Take the north wall at dusk, for the worg riders test it then, and your folk never seem to tire." },
      },
      choices = {
        { text = "I'll hold the wall, Marshal.", next = "BACK", reply = "Then you'll be the one who means it, and that counts for a great deal. North wall at dusk.", fx = { align = { order = 1 }, affinity = 2, standing = { morgans_vigil = 1 } } },
        { text = "Walls don't win wars. Let me hit them first.", next = "BACK", reply = "Maybe not, but they keep soldiers alive long enough to win one. Hit them first if you must, and then come back behind the wall where I can see you.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Who commands the riders?", next = "enemy_spire" },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Fire happened to them, the one thing a fire mage can't argue with when there's that much of it. Jalinda's still trying to find a way past the elementals at the Depths' door, and she'd take a fresh pair of hands, though she'll pretend she won't." },
      },
      choices = {
        { text = "I'll go and help her.", next = "BACK", fx = { affinity = 1, standing = { morgans_vigil = 1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    k_rogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Unseen is what Windsor was, until he wasn't. I won't order anyone into that mountain alone, but if you go, come back with something I can write down, and come back." },
        { id = "xro_hunter", when = { class = "HUNTER" },
          text = "Your beast might get further than my scouts did, and it won't talk if they catch it. I won't order anyone into that mountain alone, but if you go, come back with something I can write down." },
      },
      choices = {
        { text = "Orders or not, I'm going.", next = "BACK", reply = "I thought you'd say that, and I'll not stop you. Come back with something I can write down.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Then I'll wait for your order, Marshal.", next = "BACK", reply = "Then you'll have it when I can give it, and I hope that's soon. Thank you, deputy.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "What happened to Windsor?", next = "windsor" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "That's more thanks than Stormwind has sent me in a year, and you didn't even need a courier. I'll tell the men, because they could do with hearing it." },
        { id = "s2", text = "Well, I'll be. Kind words in the Burning Steppes, and nobody asking me for rations afterwards. You've done my week some good, friend." },
      },
      fail = {
        { id = "f1", text = "I get fine words from the court every season, and never a single soldier with them. Forgive me if I've lost my taste for the stuff." },
        { id = "f2", text = "You don't need to butter me up, friend. If you'll fight the Blackrock, you've already got everything I can give you, which is a crate to sit on." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! That's the first honest laugh I've had since Windsor went into the mountain. You're right, it's a sorry little camp, but it's mine." },
        { id = "s2", text = "You've got some cheek, and I'd take cheek over despair any day up here. Keep it coming, because it reminds the men they're still alive." },
      },
      fail = {
        { id = "f1", text = "My soldiers sleep in the ash and write home to a city that's forgotten them. I won't have them laughed at, so pick another subject." },
        { id = "f2", text = "I've had about all the contempt I can stand from Stormwind without getting it from you as well. Mind your mouth, or go and make jokes at the orcs." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "All right, all right. You've got the look of someone who gets what they came for, and I'm too short of soldiers to make an enemy of one." },
        { id = "s2", text = "I've seen that look on Blackrock raiders, and I didn't much care for it then either. You've made your point, so let's talk like reasonable people." },
      },
      fail = {
        { id = "f1", text = "There's a mountain full of orcs and dragons at my back, and I sleep under it every night. You're going to have to try a good deal harder than that." },
        { id = "f2", text = "Threatening a Marshal of Stormwind in his own camp won't get you anything but a night in irons. I'll put it down to the heat, this once." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "Every Blackrock camp in the Steppes answers to Warchief Rend Blackhand up in the Spire. Cut off that head and the camps will turn on each other." },
    { id = "bl2", text = "Windsor didn't fall in the Steppes. Ragged John saw the Dark Irons take him alive, and I'd give my rank to know where they put him." },
  },
  confides = {
    { id = "cnf_1", text = "The Blackrock change their sentries at Blackrock Stronghold an hour before dawn, and the new watch always comes down the eastern path half asleep." },
    { id = "cnf_2", text = "Our supply wagons come in through Redridge on the first of every month, and the Firegut ogres have started to time their raids by it, so anyone travelling that road should travel on a different day." },
    { id = "cnf_3", text = "My last three reports to Stormwind were copied before they were sealed, because I kept the drafts, and somebody in this camp is passing them on." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you're the best help this camp has had since Windsor was taken, deputy, and I don't hand out praise in the Steppes. There's not enough of anything up here to waste it." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You've gone down into those camps for us again and again, and you've never once asked for a medal. Windsor would have liked you, and that's the best thing I know how to say." },
      { id = "rg_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "You follow orders and you see them through, even when nobody's watching but the ash. That's a soldier, and I've had too few of them lately." },
      { id = "rg_paladin", when = { class = "PALADIN" }, text = "You carry the Light into a place that's forgotten what it looks like, and the men stand straighter when you walk through camp. I've noticed, even if they won't say it." },
    },
    confide = {
      { id = "cf_1", text = "I was Windsor's second for eleven years, and I never once wanted his command. Now I have it, and I lie awake every night thinking I've stolen it from him." },
      { id = "cf_2", text = "I've written to Stormwind fourteen times about the black dragons, and I've kept a copy of every letter. If anything happens to me, deputy, those copies are in the strongbox under my cot." },
    },
    trust = {
      { id = "tr_1", text = "Helendis, without question. He's an elf and he sees things the rest of us don't, and he's never once told me what I wanted to hear when it wasn't true." },
      { id = "tr_2", text = "Trust Ragged John's eyes, but not his courage. He saw what happened to Windsor, and every word he's told me about it has checked out." },
    },
    watchout = {
      { id = "wo_1", text = "Watch for black dragonkin in orc camps, deputy. When you see a drake standing beside a Blackrock officer, it isn't there as a guest." },
      { id = "wo_2", text = "Watch what you write to Stormwind about the Steppes, and who carries it. My letters go missing, and I'd not want yours to go the same way." },
    },
    worries = {
      { id = "wy_1", text = "That Windsor's papers are in the wrong hands, and the people they name are already moving to cover it up. If I'm right, my letters are going straight to the very people I'm warning about." },
      { id = "wy_2", text = "That I'll run out of soldiers before Stormwind runs out of excuses. I have fewer men every month, and every one I lose I have to replace with nothing." },
    },
    hopes = {
      { id = "hp_1", text = "To see Windsor walk back into this camp and take his command off my hands. I'd salute him and go straight to sleep for a week." },
      { id = "hp_2", text = "That someone at court finally reads my reports and sends us an army. I'd settle for a company, honestly, or a cart of arrows with a letter that says somebody cares." },
    },
    favor = {
      { id = "fv_1", text = "Keep the Blackrock busy, deputy, wherever you find them. Every orc you put down is one fewer at the bottom of the ridge tonight." },
      { id = "fv_2", text = "If you're ever in Stormwind, find out who's receiving the Vigil's reports at the keep. I just want a name, and I want it from someone I trust." },
    },
    friendship = {
      { id = "fr_1", text = "I do, deputy, and you're the first I've counted since Windsor was taken. In a place like this, a friend is the only thing that keeps a man from turning to ash himself." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You've bled for this camp more than some of my own soldiers have, and you've done it without orders. Yes, you're my friend, and I'd stand at your back against the whole Spire." },
      { id = "fr_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "The Light sent me you when I asked for reinforcements, and I've stopped thinking that's a joke. Yes, you're a friend, and I thank the Light for it every night." },
    },
    never_told = {
      { id = "nt_1", text = "I argued against the ride that got Windsor taken, and I lost the argument. I've never told a soul that I was right, because being right didn't bring him back." },
      { id = "nt_2", text = "Some nights I stand at the edge of the ridge and look at the Spire and think about walking up to it alone. I don't, because the men need me, but I think about it more than a commander should." },
    },
    grievance = {
      { id = "gv_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "You come and go as you please and answer to nobody, deputy, and that's how men end up dead on a ridge with nobody knowing where they went. I've no room for that at the Vigil." },
      { id = "gv1", text = "You've been more burden than help at the Vigil, and I haven't the soldiers to carry anyone." },
      { id = "gv_wronge", when = { grudge = "wronged" }, text = "I spoke to you plainly and you made light of it. Men have died on this ridge for less than what you mocked." },
      { id = "gv_tone", when = { grudge = "tone", tone = "polite" }, text = "You dress every word up like a court herald. This is the Steppes, and out here we say what we mean before the ash fills our mouths." },
      { id = "gv_values", when = { grudge = "values" }, text = "You fight for your own glory. Windsor fought for his men, and I've no patience for anyone who can't tell the difference." },
    },
    amends = {
      { id = "am1", text = "Bring me Blackrock heads from the camps below the ridge, and I'll know where you stand." },
      { id = "am_tone", when = { grudge = "tone" }, text = "Talk to me like a soldier, plainly and quickly. Do that and I'll forget the rest." },
    },
    spite = {
      { id = "sp1", text = "I think you're one more hero who'll ride up to Blackrock Spire, and I'll be writing another letter to Stormwind about you." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think Windsor would have sent you home on the first wagon, and I'd have helped him load it." },
    },
    knows = {
      { id = "tp_knows", text = "Every report from this ridge passes across my crate, deputy, and I read them even if Stormwind doesn't. Ask me about any of these." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've done more for this camp than the Keep has, so you get the long answers. Pick any of these and pull up a crate." },
    },
    background = {
      { id = "tp_bg", text = "A soldier of Stormwind who was second to a better one, and who now does the job alone until somebody brings him back.", next = "windsor" },
      { id = "tp_bg2", text = "Stormwind trained me, the Steppes kept me, and I'll see the end of the Blackrock or they'll see the end of me." },
    },
    advice = { { id = "tp_ad", text = "Never fight on the road at dusk, and never trust a quiet day in the Steppes. The orcs are only quiet when they're busy setting traps." } },
    windsor = { { id = "tp_windsor", text = "My commanding officer, lost in the mountain with all our proof. Ask Ragged John, if you've got an afternoon to spare.", next = "windsor" },
                { id = "tp_windsor2", text = "Windsor made enemies at court and friends in the field, and I know which side I'd rather be on." } },
    blackrock = { { id = "tp_blackrock", text = "They're the same clan Lakeshire fights, only here they're at home, and fed and armed by something bigger than themselves." } },
    blackrock_spire = { { id = "tp_spire", text = "It's their citadel, built into the mountain by the Dark Irons and taken by the orcs. Every road in the Steppes leads to its gate eventually.", next = "enemy_spire" } },
    black_dragonflight = { { id = "tp_dragons", text = "Helendis says they're the true masters of the Blackrock, and I've stopped arguing with Helendis." } },
    dark_iron = { { id = "tp_darkiron", text = "They took Windsor alive, which is more mercy than I expected of them. I don't expect any more." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord's a good man, and I'd trust him with my life, but my reports go to Stormwind and nothing comes back. Somebody's sitting on them, and I don't think it's him." } },
    varian = { { id = "tp_varian", text = "The king vanished, and the court went quiet, and my reports started going unanswered. I don't like the way those things line up." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor seems to have the ear of everyone in Stormwind, and none of them have answered my letters. I'd like to know what she's telling them." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War as a young man, and we drove the orcs back through these very hills. I never thought I'd be back here." } },
    firegut = { { id = "tp_firegut", text = "The Firegut ogres on Dreadmaul Rock are restless, and they've been raiding our supply lines. I'd like to see them driven off the mountain." } },
    onyxia = { { id = "tp_onyxia", text = "There's a black dragon in Dustwallow, they say, and she's the daughter of Deathwing himself. I'd rather fight a hundred orcs than one of her." } },
    holy_light = {
      { id = "tp_holy_light", text = "I pray to the Light every night, and I ask it to send me reinforcements. So far, it's sent me you." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You serve the Light as I do, so you know it doesn't always answer how we'd like. Keep faith, and keep your shield up." },
    },
    _none = { { id = "tp_none", text = "Not my department, deputy. Ask Helendis; he knows a little of everything." } },
    _gated = {
      { id = "gt1", text = "I don't hand that out to someone I've only just met, not with the way things are at court. Earn the camp's trust, and I'll tell you." },
      { id = "gt2", text = "That's between me and the people I know I can rely on. Do some work against the Blackrock first, and ask me again." },
    },
  },
}

P:NPC {
  key = "helendis", id = TODO_NPC("Helendis Riverhorn"), name = "Helendis Riverhorn",
  bible = "bibles/burningsteppes.md", role = "scholar", tier = "major",
  communities = { "morgans_vigil" }, temper = { "steady", "sharp" }, values = { "wise", "curious" },
  likesTone = "polite",
  prejudice = { class = "WARLOCK", amount = 13, why = "Kaldorei who lost his brother at Mount Hyjal fighting the Legion." },
  notices = { "race", "class", "form", "pet", "lock_shadow", "lock_taint" },

  impression = {
    first = "He watches the mountain like a page he means to finish reading.",
    third = "{name} met Helendis Riverhorn, the night elf sent from Darnassus to learn what stirs in the Burning Steppes.",
  },

  greetings = {
    { id = "g_hu_prej", when = { race = "Human" }, priority = 5,
      text = "Ishnu-alah, human. You're the third new face this month; I'll try to remember yours." },
    { id = "g_hu_soft", when = { race = "Human", npcFlagBefore = "helendis_human_soft" }, priority = 10,
      text = "Ishnu-alah, friend. I remember your name, which I can't say for most of your people." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "My people bled at Mount Hyjal to drive your masters from this world. Do not ask me to smile at what walks behind you." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I can feel the fel on you from across the ridge. Say what you came to say, and keep your distance." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You have earned some measure of my respect on this ridge, and I did not expect to give it. That does not mean I have forgotten Hyjal." },
    { id = "g_op_prestor", when = { gossip = { topic = "prestor", stance = "distrust" } }, text = "The Marshal tells me you share his doubts about Lady Prestor. I've never met her, but I notice that everyone who has grows very quiet when her name comes up." },
    { id = "g_default", text = "Ishnu-alah. Mind the edge of the ridge; the ground is softer than it looks." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good; I have been reading the smoke over the mountain, and I'd welcome another pair of eyes." },
    { id = "g_proved", when = { questDone = TODO_QUEST("Dragonkin Menace") }, text = "The dragonkin below the ridge remember you now. So do I." },
    { id = "g_away", when = { away = 14 }, text = "You return after {away} away. The smoke over the mountain has not thinned at all while you were gone, so I'm glad of your eyes again; mine have been weeping from it for a week." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone on the ridge carries a grievance after speaking with you. Anger travels quickly in a camp this small, like fire in dry grass." },
  },

  notice = {
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Another of the Kaldorei, this far from the forests? The Steppes are hard on our kind, and I'm glad of the company." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You'll feel it more than the others do, I think: the land here is in pain, and it has been for two hundred years." },
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel", "moonkin" } },
      text = "Cenarius's gifts, here of all places. Keep that shape near the ridge and the worgs will think twice before they come close." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "beast" } },
      text = "Your companion is calm in this heat, while the Blackrock's worgs snap at their own handlers. Treat it well; out here it may be the only one who watches your back." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The shadow on you is old, older than you know, and I remember the Highborne wearing it before the Well burned. I hope it rests lighter on you than it did on them." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "The fel clings to you faintly, and I have seen what it made of the satyrs. Be careful, because it always starts so faintly." },
  },

  start = "hello",
  nodes = {
    -- Humans (human patch): torn view of humans; Persuade softener sets helendis_human_soft.
    hu_view = {
      lines = {
        { id = "huv_default", key = true,
          text = "I live among them here at Morgan's Vigil, so I have had time to think on it. They are brave and loud and they die so quickly that I've stopped learning the names of the new recruits, and I am not proud of that." },
        { id = "huv_human", when = { race = "Human" },
          text = "I live among your people here, and you are brave and loud and gone so quickly that I've stopped learning the recruits' names. I'm not proud of that." },
      },
      choices = {
        { text = "Do the humans here treat you well?", next = "hu_view2" },
        { text = "That's a sad thing to admit, Helendis.", next = "hu_view2" },
        { text = "Something else, Helendis.", next = "BACK" },
      },
    },
    hu_view2 = {
      big = true,
      lines = {
        { id = "huv2_default",
          text = "The Marshal treats me well enough, and the soldiers treat me as a curiosity, which is better than an enemy. But they speak of my people's lands as if they were empty before Theramore came, and they speak of magic as if Dalaran invented it, and I bite my tongue so often I fear I'll lose it." },
      },
      choices = {
        { text = "Human arrogance about the world is dangerous. Speak up.", next = "BACK",
          reply = "Perhaps I should, though I think they'd only laugh. I'll consider it.",
          fx = { align = { light = 1 }, opinion = { humans = "arrogant" } } },
        { text = "They're young. They'll learn, given time and patience.", next = "BACK",
          reply = "Time is exactly what they don't have, but you're right that patience costs me less than it costs them.",
          fx = { align = { light = -1 }, opinion = { humans = "respect" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x = {
      lines = {
        { id = "hux_default", key = true,
          text = "Forgive me, but that is what you are, to us. I've watched a great many of the Marshal's men die on this ridge since I came, and each new recruit is braver and younger than the last, and none of them know a single thing about the world before Stormwind." },
      },
      choices = {
        { text = "Then teach me what came before. I'll remember it.", tag = "Persuade", next = "hu_x_soft",
          check = { pass = { any = { { disposition = { min = 50 } }, { class = { "PRIEST", "DRUID", "MAGE" } } } } },
          fail = { next = "hu_x_fail", fx = { affinity = -1 } } },
        { text = "Mayflies built Stormwind twice. What has Darnassus built lately?", next = "BACK",
          reply = "A tree, and a city on it, and we'll still be in it long after you've gone. But that was well struck.", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_soft = {
      lines = {
        { id = "huxs_default", key = true, fx = { npcFlag = { set = { "helendis_human_soft" } } },
          text = "You'd listen? Then sit, and I'll tell you of Hyjal and the first fall of the Legion, and you'll know more than any Marshal on this ridge. It's an odd comfort, being remembered by someone so young." },
      },
      choices = {
        { text = "I'll remember all of it, Helendis.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_fail = {
      lines = {
        { id = "huxf_default", text = "You'd listen until the next battle, and then you'd be gone. Forgive me; it's not you, it's the ridge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Helendis.", next = "END" },
      },
    },
    op_kaldorei = {
      lines = {
        { id = "opk_default", text = "Some of my elders think so. We hid behind our trees for ten thousand years, and it took the Legion at Hyjal to bring us out. The young races have opinions about that, so tell me yours." },
      },
      choices = {
        { text = "The world needs the kaldorei. I'm glad you came out of the forests.", next = "op_ne_glad", fx = { affinity = 1, align = { honor = 1 }, opinion = { night_elves = "admire" } } },
        { text = "Stay in your forests, elf. This isn't your fight.", next = "op_ne_stay", fx = { affinity = -1, align = { honor = -1 }, opinion = { night_elves = "distrust" } } },
        { text = "Tyrande was right to stand with the others at Hyjal.", next = "op_ne_glad", fx = { affinity = 2, opinion = { tyrande = "trust", night_elves = "admire" } }, when = { race = "NightElf" } },
        { text = "Ironforge always wondered what the elves were hiding.", next = "op_ne_mixed", fx = { trait = { witty = 1 }, opinion = { night_elves = "mixed" } }, when = { race = "Dwarf" } },
        { text = "That's for the kaldorei to decide.", next = "BACK" },
      },
    },
    op_ne_glad = {
      lines = {
        { id = "opng_default", text = "Then I'll take that gladness north with me, when I go. The black flight learned its tricks here on people who had no one to warn them, and I mean to be the warning." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_ne_stay = {
      lines = {
        { id = "opns_default", text = "You may be right that it isn't my fight. But the dragon that burns the Steppes today will reach for Ashenvale tomorrow, and I would rather meet it here, on borrowed ground." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_ne_mixed = {
      lines = {
        { id = "opnm_default", text = "Old secrets, mostly, and old shame. Your people dug too deep and woke a fire, and mine drank too deep and woke a Legion, so perhaps we should compare notes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_kaldorei = {
      big = true,
      lines = { { id = "xpt_kaldorei_default", text = "Because the black dragonflight is old, older than the humans can easily imagine, and my people remember what its master did in the War of the Ancients. Someone who remembers ought to be watching from this ridge." } },
      choices = {
        { text = "Old wars are best watched by those who remember them. Stay.", next = "BACK", reply = "That is my thought as well, and I am glad you share it. I will stay as long as I am needed.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The past is past. Your people should tend their own forests.", next = "BACK", reply = "The past is never past for my people, and the dragons are old enough to prove it. I will tend this forest of ash a while longer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "As a people someone else is spending, the way a merchant spends coin. Rend feeds them to the war and the black dragons feed on what's left, and every warrior who cuts them down only makes the account a little shorter." } },
      choices = {
        { text = "A soldier fights the foe in front of him, Helendis.", next = "BACK", reply = "He does, and that is honourable. But I fought at Hyjal, and not one of the satyrs in front of me had chosen that war; their masters chose it for them.", fx = { align = { order = 1 } } },
        { text = "Then I'll strike at the masters and let the pawns scatter.", next = "BACK", reply = "Wise, if you can find the masters, which is harder than it sounds. I wish you luck in the looking.", fx = { align = { order = -1 } } },
        { text = "Something else, Helendis.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Watched, until we know who arms them, because the Blackrock clan answers to Rend in the Spire and Rend answers to something older that I don't yet understand. To strike blindly at an enemy you don't understand is how wars are lost, and I have lived long enough to see it happen more than once." } },
      choices = {
        { text = "Patience, then. We strike when we understand them.", next = "BACK", reply = "Patience is what I have. I have watched this mountain through many seasons now, and I have learned more from its smoke than the Marshal's scouts have learned from the roads.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every day we watch, they raid. Strike now.", next = "BACK", reply = "They do, and that is the grief of it. Strike if you must, but strike at what you understand.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Burning Legion, ten thousand years ago, when the Highborne's magic burned so brightly it was seen from beyond the world. I don't blame you for their sins, but I'd ask you to remember them here, in a land that burned for less." } },
      choices = {
        { text = "Your caution is wise. Magic needs a firm hand.", next = "BACK", reply = "It does, and I am glad a mage says so. Remember it when your power is tempted.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic should be free to grow, whatever the risk.", next = "BACK", reply = "So the Highborne said, and the sea now covers their city. I hope you are wiser than they were.", fx = { align = { order = -1 } } },
        { text = "Something else, Helendis.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It saddens me more than it frightens me, because I have read what the fel made of the satyrs and seen what it made of the orcs. Everyone who walks your path tells me they hold the leash, and I hope you're the first of them who is right." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It saddens me more than it frightens me, though with your demon this near I feel my people's long memory of the Legion stirring. I have read what the fel made of the satyrs and seen what it made of the orcs, and I hope you're the first warlock who truly holds the leash." },
      },
      choices = {
        { text = "I hold the leash, Helendis. I'll prove it.", next = "BACK", reply = "Then I will watch, and hope, and be glad if you do. Prove it slowly; I have time.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leashes are for the timid. I'll do as I please.", next = "BACK", reply = "Then you are the same as all the others, and I will grieve for you when it turns on you. I have done it before, more often than I would like.", fx = { align = { order = -1 } } },
        { text = "Let's speak of other things.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The dragonkin below this ridge, and the hand that moves them, which I can't yet name. A rogue knows how a master hides behind servants, so watch the whelps closely, and tell me whom they look to." } },
      choices = {
        { text = "I'll watch and report, as Darnassus would wish.", next = "BACK", reply = "Darnassus would, and so would I. Watch the whelps and tell me what you see.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll watch, but what I learn is mine to sell.", next = "BACK", reply = "Then sell it, if you must, but sell it to someone who means the Blackrock harm. I have seen secrets bought by worse hands than mine.", fx = { align = { honor = -1 } } },
        { text = "Something else, Helendis.", next = "BACK" },
      },
    },
    dd_hd_dk = {
      lines = {
        { id = "dd_hd_dk1", text = "Their masters sit high in Blackrock Spire, and the black dragonflight has always worked through others. The orcs think they are allies of the brood, as their fathers once did, and I suspect they will learn the same lesson their fathers learned." },
      },
      choices = {
        { text = "Then we strike at the masters, not the beasts.", next = "BACK", reply = "Yes, in time. For now, keep reading the signs as you kill, and bring me what you learn.", fx = { align = { order = 1 } } },
        { text = "I'll keep killing beasts. Let others chase shadows.", next = "BACK", reply = "Someone must hold the hills while the rest of us chase shadows. I do not scorn it.", fx = { align = { order = -1 } } },
        { text = "Something else, Helendis.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu_prej", when = { race = "Human", ["not"] = { npcFlagBefore = "helendis_human_soft" } },
          text = "I am Helendis Riverhorn, sent from Darnassus to watch the Steppes. I live among your people now, and I've learned to love them a little and to mourn them often." },
        { id = "h_hu_soft", when = { race = "Human", npcFlagBefore = "helendis_human_soft" },
          text = "You've come back. Good, I'd begun to worry; I've grown attached to you, which for a kaldorei among humans is unwise." },
        { id = "h_pt_kaldorei", tags = { "news" }, when = { party = { race = "NightElf" }, faction = "Alliance" },
          text = "{companion} is of my people, and far from the forests, as I am. It is strange to meet a kaldorei among the ash, but I am glad of it, for the humans here do not understand why I flinch when the mountain breathes fire." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You move like one of our Sentinels, rogue, though I suspect your teachers were less particular about whom you watch." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Something walks with you that does not belong among the Alliance. That doesn't sit easily with me, but I've learned to judge people by what they do, and you haven't done anything yet." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. My people learned long ago what the arcane can draw down on a world, so I'll be watching your hands while we talk." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "My brother fell at Hyjal fighting the creatures you bargain with. I will speak with you, because the Marshal needs every hand, but that is all." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You have done good work here, and I have watched every bit of it. Go on; I am listening." },
        { id = "h_default", key = true,
          text = "I am Helendis Riverhorn, sent from Darnassus to learn what is happening in these mountains. Life in the Steppes is all conflict, and I have spent a long while working out who profits from it." },
        { id = "h_menace", when = { questActive = TODO_QUEST("Dragonkin Menace") },
          text = "The dragonkin below the ridge are bolder every day, and I can't tell you more until I know you can stand against them. Thin their numbers, and then we'll speak of the rest." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "However far that letter has travelled, remember that it began here, on this ridge. Magistrate Solomon is an honest man, and I trust honest men to finish what I start." },
        { id = "h_halycon", when = { questActive = TODO_QUEST("Put Her Down") },
          text = "Halycon, the orcs call her, the mother of their worgs. Find her in the Spire and end it, and try not to hate the creature for what was done to it." },
        { id = "h_halycon_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Put Her Down"), days = 5 } },
          text = "The worgs on the road are fewer this week. It was a mercy, {name}, whatever it felt like in the Spire." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin of the Light. The Blackrock orcs below would like nothing better than to test your faith, and I would ask you not to let them choose the place." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. The Blackrock orcs have known nothing but war for a generation, and I've wondered whether a soldier of the Alliance sees them as I do, or only as the next foe." },
        { id = "dd_dragonkin", when = { killed = { name = { "Black Dragonspawn", "Black Wyrmkin", "Black Broodling", "Black Drake" }, min = 30 } },
          text = "You have killed many of the black dragonkin in these hills. They are not wild beasts, whatever the soldiers think; someone feeds them and sends them out, and every one you slay is a message that someone will read." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time, and the mountain isn't going anywhere." },
        { id = "h_again2", text = "Ask, then. Questions are how I found everything I know here." },
      },
      choices = {
        { text = "Who sends the dragonkin out, Helendis?", next = "dd_hd_dk", when = { killed = { name = { "Black Dragonspawn", "Black Wyrmkin", "Black Broodling", "Black Drake" }, min = 30 } } },
        { text = "This land looks as if it burned long ago.", next = "ruins" },
        { text = "Why are the dragonkin here?", next = "dragons" },
        { text = "Where do the Blackrock get their worgs?", next = "worgs" },
        { text = "Why would Darnassus care about these mountains?", next = "why" },
        { text = "You're far from the forests, brother.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I can feel the land here. It hurts.", next = "druid", when = { class = "DRUID" } },
        { text = "Is it right to pity the beasts we kill?", next = "pity", when = { class = { "PRIEST", "HUNTER" } } },
        { text = "Solomon took your letter all the way to the Regent.", next = "letter_news", when = { questDone = TODO_QUEST("The True Masters") } },
        { text = "The stone here is in pain, Helendis. I can hear it.", next = "k_shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "My people came from Eldre'Thalas, long ago.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "My saber hates these ashes.", next = "k_saber", when = { race = "NightElf", class = "HUNTER" } },
        { text = "What did the arcane draw down on your people?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You look at my craft as if it frightens you.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You've been watching someone, I can tell.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Should the Blackrock orcs be fought, or only watched, Helendis?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you see the Blackrock orcs, Helendis?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why did you come so far from Kalimdor?", next = "xpt_kaldorei", when = { party = { race = "NightElf" }, faction = "Alliance" } },
        { text = "What do you make of humans, Helendis?", next = "hu_view" },
        { text = "You speak of us like mayflies, Helendis.", next = "hu_x", when = { race = "Human", ["not"] = { npcFlagBefore = "helendis_human_soft" } } },
        { text = "Elune keep you, Helendis.", next = "END" },
      },
    },

    ruins = {
      lines = {
        { id = "r_default", fx = { learn = { "thaurissan" } },
          text = "Look around you: the walls, the foundations, the old roads under the ash. This was all part of the Redridge range once, green hills and farms, until the Dark Iron sorcerers at Thaurissan woke something that melted the mountains around them." },
      },
      choices = {
        { text = "What did they wake?", next = "ruins_fire" },
        { text = "And the people who lived here?", next = "ruins_people" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins_fire = {
      lines = { { id = "rf_default", text = "Fire, and something with a will behind it. The dwarves of Ironforge call it a lord of flame; I call it the reason nothing grows here, and I prefer not to say its name on this ridge." } },
      choices = {
        { text = "Ragnaros.", next = "ruins_fire_name", fx = { trait = { brave = 1 } } },
        { text = "Then I won't either.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    ruins_fire_name = {
      lines = { { id = "rn_default", text = "You say it easily, which means you haven't stood near the mountain at night and felt it listening. Jalinda would tell you the same, and she would be pale when she said it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ruins_people = {
      lines = { { id = "rp_default", text = "Gone, two centuries ago, and the ones who came later found only ash. I sketch the foundations at night when the orcs are quiet; someone ought to remember that there were kitchens here." } },
      choices = {
        { text = "That's a kind thing to do.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dragons = {
      big = true,
      lines = {
        { id = "d_default", key = true, fx = { learn = { "black_dragonflight", "blackrock" } },
          text = "That is the question I came to answer. We always assumed the Blackrock were simply savage, raised on war and nothing else, but what I found in their own homeland says the black dragonflight is driving them, feeding their rage and aiming it south." },
        { id = "d_proved", when = { questDone = TODO_QUEST("Dragonkin Menace") },
          text = "You've fought the whelps and drakes below the ridge, so you've seen how they move: not like beasts, like soldiers. Something is giving the orders to orc and dragonkin alike, and it isn't an orc." },
      },
      choices = {
        { text = "Who leads the dragons?", next = "dragons_who" },
        { text = "Stormwind ought to hear of this.", next = "dragons_letter" },
        { text = "That's a frightening thought.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    dragons_who = {
      lines = { { id = "dw_default", text = "I won't guess at a name I can't prove. A name said too early only teaches the enemy that you're close, and teaches your friends to stop listening." } },
      choices = {
        { text = "Then let's find the proof.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Marshal Maxwell thinks the same.", next = "dragons_maxwell", when = { heardLine = "maxwell.ed_default" } },
        { text = "Not a name, then. Tell me what you suspect.", tag = "Persuade", next = "dragons_guess",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Dragonkin Menace") }, { race = "NightElf" } } } },
          fail = { next = "dragons_wait", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons_maxwell = {
      lines = { { id = "dm_default", text = "The Marshal stopped arguing with me some time ago, which I take as the highest praise a human officer can give. He's a good man, and he carries Windsor's loss like a stone in his pack." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dragons_letter = {
      lines = { { id = "dl_default", text = "I wrote it all down for the Magistrate of Lakeshire, who is closest and angriest, and who has been writing to Stormwind for a long while. If anyone can make the Keep listen, it will be a man with nothing left to lose." } },
      choices = {
        { text = "I'll carry it.", next = "BACK", fx = { affinity = 2 }, when = { questBefore = TODO_QUEST("The True Masters") } },
        { text = "Something else.", next = "BACK" },
      },
    },

    worgs = {
      lines = { { id = "w_default", text = "From the Spire. No matter how many we kill on the roads, their numbers never fall, and my scouts tell me the beasts are bred and trained inside the citadel and sent out by the pack." } },
      choices = {
        { text = "Then someone has to go in.", next = "worgs_halycon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgs_halycon = {
      lines = { { id = "wh_default", fx = { learn = { "blackrock_spire" } },
        text = "Someone does. The orcs speak of a den mother called Halycon, and I think she's the source, twisted by dark magic into something that only breeds for war. Kill her, and pity her, if you can manage both at once." } },
      choices = {
        { text = "Pity a worg?", next = "pity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pity = {
      lines = {
        { id = "pi_default", text = "Pity the thing it was before the orcs and their masters got their hands on it. Kill it cleanly, and don't dwell on it afterwards; dwelling is a luxury the living can't afford out here." },
        { id = "pi_priest", when = { class = "PRIEST" },
          text = "Your faith and mine agree on more than our priests admit. The Light and Elune both say the same here: end the suffering, and don't confuse the beast with the hand that made it cruel." },
      },
      choices = {
        { text = "I'll remember that, Helendis.", next = "BACK", reply = "I am glad of it, for it is a lesson most learn too late, if they learn it at all.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A beast is a beast, and I won't waste pity on it.", next = "BACK", reply = "Then you will sleep better than I do, and perhaps that is no bad thing. Kill it cleanly, all the same.", fx = { align = { light = -1 }, affinity = -1, trait = { skeptical = 1 } } },
      },
    },

    why = {
      lines = { { id = "y_default", text = "Because what the black dragonflight learns here, it will try elsewhere, and on other peoples. Darnassus has long memories, and we remember what dragons did to the world once already." } },
      choices = {
        { text = "What did they do?", next = "why_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_old = {
      lines = { { id = "yo_default", text = "Tore it open, ten thousand years ago, or so our oldest tell it. I'm not so old as that, but I was raised on the story, and I don't like seeing black wings over any land." } },
      choices = {
        { text = "Should your people have stayed in their forests?", next = "op_kaldorei" },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    kaldorei = {
      lines = { { id = "k_default", text = "Far from the forests and further still from Teldrassil. Tell me, sister or brother of the moon: does the new tree still smell of sap?" } },
      choices = {
        { text = "It does. It smells like home to me.", next = "BACK", fx = { affinity = 2 } },
        { text = "It smells like ambition.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you understand why I can't sleep here. Do what you can for it, druid, even if it's only to walk lightly, because no one else will." } },
      choices = {
        { text = "I'll walk lightly here, Helendis.", next = "BACK", reply = "That is all I ask, druid, and more than most will give. Elune keep you.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Let the Steppes burn. The people at the Vigil matter more to me.", next = "BACK", reply = "They matter more to me as well, but the land is what they stand on. Remember that.", fx = { align = { order = 1 } } },
      },
    },
    letter_news = {
      lines = { { id = "ln_default", text = "And the Regent asked for more proof and named you deputy instead of sending an army. That's more than I expected from a human court, and less than I hoped." } },
      choices = {
        { text = "Then we'll bring proof.", next = "BACK", fx = { affinity = 2, standing = { morgans_vigil = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons_guess = {
      lines = {
        { id = "dg_default", text = "Very well, but only between us, and only as a guess. Whatever commands the Spire's upper halls is no mere drake but a dragon of great age and greater patience, and I believe the Blackrock are only the first people it means to use." },
      },
      choices = {
        { text = "Then we'd better find out who else.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "I'll keep it to myself.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons_wait = {
      lines = {
        { id = "dw2_default", text = "A suspicion shared too soon becomes a rumour, and rumours run faster than proof. Thin the dragonkin below the ridge with me first, and then we'll talk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "A dwarf who hears the stone. I have known druids who heard the trees for a thousand years, and never a dwarf who would admit to hearing anything but his own forge. What does it say, when it is in pain?" },
      },
      choices = {
        { text = "It remembers the fire that made the Steppes.", next = "ruins_fire" },
        { text = "Only that it wants to be left alone.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    k_sky = {
      big = true,
      lines = {
        { id = "xsk_default", text = "Eldre'Thalas. I know the name from the old histories, and I know what was done there by Highborne who would not give up their magic. You are welcome at this fire, but you will understand if I ask which side of that quarrel your ancestors took." },
      },
      choices = {
        { text = "The side that rebelled against the prince.", next = "k_sky_shal" },
        { text = "We kept our magic. We won't apologise for it.", next = "BACK", reply = "Then you are honest, at least, and I will not ask you to apologize. But I will remember it.", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "That quarrel is ten thousand years old. Let it rest.", next = "BACK", reply = "It is, and perhaps you are right to let it rest. I will try, though my memory is long.", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    k_sky_shal = {
      lines = {
        { id = "xss_default", text = "Then your people paid for their courage with exile, and mine stayed and paid in other coin. Perhaps we are not so far apart, though I would still like to know why the winds took you in and not us." },
      },
      choices = { { text = "Something else, Helendis.", next = "BACK", fx = { affinity = 2 } } },
    },
    k_saber = {
      lines = {
        { id = "xsa_default", text = "So does every cat that comes up this road; their paws were made for moss, and the ash gets between the pads and burns. Wash its feet in the stream below the Vigil each night, and do not let it hunt the worgs alone." },
        { id = "xsa_rider", when = { origin = "nightelf_nightsaber_rider" },
          text = "You ride as well as hunt with it, I see from the saddle marks. Then you know a saber's feet are its life; wash the ash from its pads each night, or it will be lame before the month is out." },
      },
      choices = {
        { text = "I'll tend it every night.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You speak graciously, and I hear little of that under this smoke. I thank you, for it is good to be reminded that courtesy survives the climb." },
        { id = "s2", text = "They would say in Darnassus that I have grown too fond of my own reading, and you have just made it worse. Still, the words are welcome." },
      },
      fail = {
        { id = "f1", text = "I have had ten thousand years to learn the sound of praise that wants something. Ask your question plainly, and leave the garland off it." },
        { id = "f2", text = "You are generous with your words, and I think careless with them as well. I weigh those who climb this ridge by what they see, not by what they say of me." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "You have a sharper eye than I gave you credit for, and a sharper tongue besides. An old reader of ruins ought to be laughed at now and then." },
        { id = "s2", text = "Few would dare speak so to one of the kaldorei on so short an acquaintance, and I find it refreshing. You are not easily awed, which will serve you well near that mountain." },
      },
      fail = {
        { id = "f1", text = "I have watched empires rise and burn, and your mockery is a very small fire beside them. Take care that it does not cost you a friend on this ridge." },
        { id = "f2", text = "That was unworthy of you, and I had weighed you higher. I will return to my reading of the smoke until you have something better to offer." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "There is a storm in you, and I am not so proud that I cannot see it. Very well, I will choose my words with care, and you will have them." },
        { id = "s2", text = "You press hard, and with more strength than I had weighed in you. I will not quarrel on the edge of a ridge, so speak, and I will answer." },
      },
      fail = {
        { id = "f1", text = "I have stood in the shadow of dragons, and they did not need to shout. Lower your voice, for it carries to the mountain." },
        { id = "f2", text = "You mistake stillness for weakness, as the hasty often do. I will not be hurried or frightened by you." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The black dragons of the Spire answer to a son of Deathwing who calls himself a lord of men. Lakeshire would not believe me, so perhaps you will." },
    { id = "bl2", text = "The black whelps roost at Draco'dar on the northern slopes, and their brood-keepers are never far away. Go there in strength, or do not go at all." },
  },
  confides = {
    { id = "cnf_1", text = "The brood-keepers at Draco'dar leave the eggs unguarded for a short while at moonrise, when they fly to feed, and that is the only time anyone should go near that slope." },
    { id = "cnf_2", text = "The ruins north of here whisper to those who touch the stones, and I have seen two soldiers from the Vigil go back to them at night without knowing why, so do not let your hands linger there." },
    { id = "cnf_3", text = "The black dragons sometimes fly south over Lakeshire in the form of men, and I have watched one walk into the Redridge mountains as a nobleman on a fine horse." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you are young, as all your kind are young to me, but you listen and you learn quickly. That is rarer than courage, and I have met a great deal of courage in the Steppes." },
      { id = "rg_tone", when = { fondness = "tone" }, text = "You speak to me with a courtesy I had stopped expecting from anyone outside Darnassus. It reminds me of home, and I am grateful for it." },
      { id = "rg_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "There is a light about you that Elune would know, even here under the smoke. When you are in camp, I find I can see the stars a little more clearly." },
      { id = "rg_nightelf", when = { race = "NightElf" }, text = "You carry the forest with you even this far from Teldrassil, and I can smell the leaves on your cloak. I had not realised how much I missed it." },
    },
    confide = {
      { id = "cf_1", text = "My brother and I quarrelled the night before Hyjal, over nothing of any consequence, and we did not make it right before the battle. I have read old places ever since, because the old places do not argue back." },
      { id = "cf_2", text = "Tyrande did not send me here to read the mountain. She sent me because I asked to be sent anywhere far from the Legion's memory, and this was the furthest place she could find." },
    },
    trust = {
      { id = "tr_1", text = "Marshal Maxwell is honest and tired, and he would die for his soldiers without a moment's thought. I trust him more than I trust most of my own people." },
      { id = "tr_2", text = "Trust Ragged John's memory and his eyes, for they are sharper than he pretends. Do not trust anyone in Stormwind who smiles too easily when you speak of dragons." },
    },
    watchout = {
      { id = "wo_1", text = "Watch for a dragon that does not look like a dragon. The black flight take mortal shapes, and they are most dangerous when they are most charming." },
      { id = "wo_2", text = "Watch the lava flows at dusk, when the heat makes the air shimmer and the ground looks firmer than it is. I have seen an orc step onto stone that was not stone." },
    },
    worries = {
      { id = "wy_1", text = "That the black flight is closer to the heart of Stormwind than anyone dares say, and that by the time they believe me, the dragon will be sitting at the king's own table. That is a thought I keep only for friends." },
      { id = "wy_2", text = "That I am growing used to the smoke. When I first came here I could not sleep for the stench of it, and now I barely notice, and that frightens me." },
    },
    hopes = {
      { id = "hp_1", text = "To see the Steppes green again, as the Dark Irons' ancestors once knew them. It will take a thousand years, perhaps, and I have stopped counting on having them." },
      { id = "hp_2", text = "That my brother's spirit has found peace in Elune's light, and that he forgives me. I hope it every night, under whatever stars the smoke allows." },
    },
    favor = {
      { id = "fv_1", text = "If you go to Darnassus, lay a moonleaf at the Temple of the Moon for my brother, Aelyndis, who fell at Hyjal. I cannot go myself, and it has troubled me for a long time." },
      { id = "fv_2", text = "Bring me anything you find in the Spire with writing on it, however damaged. The dragons keep records, and I need proof that Stormwind cannot ignore." },
    },
    friendship = {
      { id = "fr_1", text = "I do, and among my people that is not said quickly, for a friend is someone we expect to remember for a very long time. I will remember you, long after the Steppes have cooled." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You have walked into the dragons' country at my word and come back with the truth, and you never once doubted me. Yes, you are my friend, and you are the first I have made outside Kalimdor." },
      { id = "fr_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "You keep faith as the Sentinels keep it, quietly and without asking for thanks. I count you a friend, and I would stand beside you as I once stood beside my brother." },
    },
    never_told = {
      { id = "nt_1", text = "I was not at Hyjal when my brother fell. I was ordered to the rear to guard the wounded, and I was relieved, and I have never forgiven myself for being relieved." },
      { id = "nt_2", text = "I asked Elune for a sign the night he died, and the moon was hidden by smoke from the burning forest. I have looked for her in smoke ever since, and I think that is why I came here." },
    },
    grievance = {
      { id = "gv_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "You live as though nothing came before you and nothing will come after, taking what you like and leaving the rest in ruins. My people learned what that costs at the Well of Eternity." },
      { id = "gv1", text = "You have tried my patience, and my people have a great deal of patience to try. That should tell you something." },
      { id = "gv_prejud", when = { grudge = { worst = "prejudice" } }, text = "My brother died at Mount Hyjal fighting the Legion, and you carry its fire in your hands. I cannot look past that, though I have tried." },
      { id = "gv_tone", when = { grudge = "tone" }, text = "You speak to me as the soldiers here speak to their mules. My people remember courtesy, even in a land of ash." },
    },
    amends = {
      { id = "am1", text = "Help me read this mountain, and bring me what I ask from the dragons' slopes. Work done well speaks louder than an apology." },
      { id = "am_prejud", when = { grudge = "prejudice" }, text = "Put the fel aside. Nothing less will mend this, and I know how unlikely that is." },
    },
    spite = {
      { id = "sp1", text = "I think you are a short-lived creature in a great hurry, and you will burn out before you understand anything you have seen." },
      { id = "sp_prejud", when = { grudge = "prejudice" }, text = "I think the Legion would know your name if it came again, and I think you would answer it." },
    },
    knows = {
      { id = "tp_knows", text = "I have read these mountains for a long while, and they have told me a good deal. Ask me about any of these, and I'll tell you what I can prove." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll share what I suspect as well as what I can prove. Here is what I can speak to." },
    },
    background = { { id = "tp_bg", text = "A scout of Darnassus, by training a reader of old places. The Steppes are the worst-burned country I've ever been asked to read, and the soot gets into everything, even my bowstring.", next = "ruins" } },
    advice = { { id = "tp_ad", text = "Watch where the whelps fly when the drakes call them, and you'll learn where the drakes nest. Whelps can't keep a secret to save their scaly little lives." } },
    black_dragonflight = { { id = "tp_dragons", text = "The true masters of the Blackrock, as I wrote to Lakeshire. I'd be glad to be wrong, but I am not.", next = "dragons" } },
    blackrock = { { id = "tp_blackrock", text = "Savage, yes, but savage on someone else's orders. That's what makes them dangerous now." } },
    thaurissan = { { id = "tp_thaurissan", text = "The Dark Iron city that woke the fire. Its ruins lie north of here, and something in them still whispers to anyone who touches the stones." } },
    elune = {
      { id = "tp_elune", text = "Elune's light is dimmer here, under the smoke, but it's still there. I pray to her every night, and I'm grateful for every star I can see." },
      { id = "tp_elune2", when = { race = "NightElf" }, text = "You'll have felt it too, then, how the smoke hides the moon. Pray with me tonight, if you can find a clear patch of sky." },
    },
    tyrande = { { id = "tp_tyrande", text = "Tyrande sent me to read the old places, and I've read many of them. This one is the hardest." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil still stands on Hyjal, wounded, and the Circle tends it. We gave up our immortality to save the world, and here in the smoke I feel every year of it." } },
    _none = { { id = "tp_none", text = "I know the land, not that. Marshal Maxwell may know, or he will pretend to, which is nearly as useful." } },
    _gated = {
      { id = "gt1", text = "That is knowledge I share only with those I have come to trust, and I do not know you well enough. Give it time." },
      { id = "gt2", text = "I will not speak of that yet. I have weighed you, and the scales have not settled." },
    },
  },
}

P:NPC {
  key = "oralius", id = TODO_NPC("Oralius"), name = "Oralius",
  bible = "bibles/burningsteppes.md", role = "soldier", tier = "quest",
  communities = { "morgans_vigil" }, temper = { "proud", "excitable" }, values = { "loyal", "brave" },
  notices = { "class", "race", "kit", "lock_shards" },

  impression = {
    first = "He argues with a pirate named Captain Winky whom I never saw.",
    third = "{name} met Oralius of Morgan's Vigil, who plans grand campaigns against the Firegut ogres of Dreadmaul Rock.",
  },

  greetings = {
    { id = "g_default", text = "Stand at attention when ye approach, soldier! Winky, look sharp, we've got company, and by my beard it's a sturdy one." },
    { id = "g_back", when = { metBefore = true }, text = "Soldier! Back on the ridge and reporting, are we? Aye, good, because Winky's been telling lies about ye again." },
    { id = "g_away", when = { away = 14 }, text = "Soldier! You've been absent without leave for {away}, and Winky noticed first, so I'll let it slide this once if you fall in smartly." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Winky tells me you were caught fibbing to someone on the ridge, soldier. Winky's a liar himself, mind, but he's never once been caught." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now that's a soldier's stance! Shoulders back, weapon ready, eyes on the horizon, which is more than I can say for SOME pirates around here." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! At last, a proper soldier with a proper beard, and not one of these tall folk who hit their heads on the tents." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at that kit, soldier! Torn, scorched and dented; that's the uniform of somebody who's been doing their job, so wear it with pride." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "You carry shards like ammunition, soldier, and that's good discipline. Count them, keep them dry, and spend them on the ogres of Dreadmaul Rock." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The Blackrock, of course, and the sooner the better! Call your lightning down on their camps, soldier, and I'll tell Winky he was wrong, which he'll hate." } },
      choices = {
        { text = "I'll strike where the Vigil needs me, and not before.", next = "BACK", reply = "Good, soldier, discipline! I'll tell Winky he can stop sulking, because the Vigil has a proper soldier at last.", fx = { align = { order = 1 } } },
        { text = "I'll strike wherever the storm takes me.", next = "BACK", reply = "Wherever the storm takes you? That's not a battle plan, soldier, that's weather! Winky likes you, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Worgs, soldier, and their riders, and anything coming down the slope from the Spire that wasn't there yesterday! Winky says he's seen dragons, too, but Winky also says he's seen my pension, so I'd treat that report with suspicion." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Worgs, soldier, and their riders, and anything coming down the slope from the Spire that wasn't there yesterday! And this is your second, is it? {pet}, attention!" },
      },
      choices = {
        { text = "I'll report every movement exactly as I see it, sir.", next = "BACK", reply = "Exactly as you see it, soldier, no embellishment, unlike Winky. I'll put you in for a commendation.", fx = { align = { order = 1 } } },
        { text = "Scouts work best without orders, sir. I'll follow the trail.", next = "BACK", reply = "Without orders? That's how wars are lost, soldier, but I'll allow it this once. Report back!", fx = { align = { order = -1 } } },
        { text = "Permission to ask something else, sir.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Phase one, soldier: set fire to Dreadmaul Rock. Phase two: set fire to it again, harder, because the ogres don't seem to have noticed the first time, and Winky says they're slow learners." } },
      choices = {
        { text = "Yes, sir! Fire at will, sir!", next = "BACK", reply = "That's the spirit! Winky, did you hear that? Finally, a soldier with some enthusiasm!", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll pick my own targets, Oralius, thank you.", next = "BACK", reply = "Your own targets? Insubordination, soldier, though I'll overlook it if you set fire to something big.", fx = { align = { order = -1 } } },
        { text = "Next item, sir.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Enlist them, drill them and give them a uniform, soldier, though the little one will need a very small one. Every Firegut ogre on Dreadmaul Rock is an enemy of the Vigil, and I'm not fussy about who helps me with them." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Enlist them, drill them and give them a uniform, soldier, and that one looks ready to take the oath this minute. Every Firegut ogre on Dreadmaul Rock is an enemy of the Vigil, so put {pet} at the front of the line, because I'm not fussy about who helps me with them." },
      },
      choices = {
        { text = "What follows me serves the Vigil, sir!", next = "BACK", reply = "Splendid, soldier! I'll have a uniform made, very small, for the little one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What follows me serves me, not the Vigil.", next = "BACK", reply = "Then they're mercenaries, soldier, and I don't pay mercenaries. Winky disapproves too.", fx = { align = { order = -1 } } },
        { text = "Something else, sir.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "My second in command, soldier, and a fine tactician when he isn't sulking, though some of the men claim they've never seen him. Now, a druid who can turn into a bear and charge a Blackrock line is exactly what this campaign needs, and I'll hear no argument about it." } },
      choices = {
        { text = "I'll fight beside you, Oralius, but on my own terms.", next = "BACK", reply = "Your own terms, soldier? I'll write them down and ignore them, as is traditional.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Give me my orders, and I'll charge where I'm told.", next = "BACK", reply = "That's what I like to hear! Charge the north slope at dawn, and I'll tell Winky.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_or_br = {
      lines = {
        { id = "dd_or_br1", text = "Enough? There are thousands of them up in the Spire, soldier, under Rend Blackhand, and they breed faster than we can bury them. Seventy-five is a fine start, and if you keep the pace, I'll have your name painted on the wall beside mine." },
      },
      choices = {
        { text = "Then I'll keep the pace. Paint the wall.", next = "BACK", reply = "That's the spirit! I'll mix the paint myself, and Winky can watch.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Killing them alone won't end this, Oralius.", next = "BACK", reply = "Maybe not, but it stops them killing us, and I'll take that over any clever plan.", fx = { align = { light = 1 } } },
        { text = "Something else, Oralius.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Firegut", min = 30 } }, text = "There's Firegut blood on you at last, soldier, and plenty of it by the reports. Dreadmaul Rock is feeling it, so don't stop now." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Winky says we oughtn't to enlist your sort of friends, soldier, but Winky also says the moon is a cheese, so I've stopped listening to Winky." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, reporting for duty! Excellent, soldier; Winky says artillery wins wars, and you're the nearest thing to artillery we've had all month." },
        { id = "h_default", key = true,
          text = "Oralius, of the Vigil and of Ironforge before that, and the only one here who keeps his head about him, whatever Captain Winky says. We strike the enemy before the enemy strikes us, soldier, and today is a striking sort of day." },
        { id = "h_firegut", when = { questActive = TODO_QUEST("Extinguish the Firegut") },
          text = "The Firegut keep Dreadmaul Rock and the Blackrock supply lines open, and the plan is to cripple them, so why is there so little blood on your uniform? Out you go, soldier." },
        { id = "h_gortesh", when = { questActive = TODO_QUEST("Gor'tesh the Brute Lord") },
          text = "Phase two, soldier: Gor'tesh, their brute lord, west of Dreadmaul Rock in an orc building he thinks nobody knows about. I need his head intact; phase three depends on it." },
        { id = "h_head", when = { questActive = TODO_QUEST("Ogre Head On A Stick = Party") },
          text = "Plant that pike on top of the Rock and watch them scatter! I'd go myself, but somebody has to keep an eye on Winky." },
        { id = "h_party", tags = { "news" }, when = { questRecent = { TODO_QUEST("Ogre Head On A Stick = Party"), days = 5 } },
          text = "They say the ogres ran screaming down the hill, and some of them didn't stop till Redridge! I'll get a medal for this, soldier, or rather you will, of course." },
        { id = "h_fifty", when = { questActive = TODO_QUEST("FIFTY! YEP!") },
          text = "Fifty Blackrock medallions, soldier, to go with my ogre ears, and not a single one fewer. Control says the orcs are carrying them all over the Steppes." },
        { id = "h_goods", when = { questActive = TODO_QUEST("The Good Stuff") },
          text = "Winky swears the Dark Irons in the Depths keep all the good stuff in those little belt-packs of theirs. Bring me twenty and we'll see who's lying." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, reporting! Excellent, soldier; Captain Winky says we need scouts, and Winky is right about twice a year, so this must be one of the times." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Excellent, soldier, a bear is worth three footmen, Captain Winky says five, but Captain Winky exaggerates, as I've told him repeatedly." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf! Captain Winky says the elements are fickle allies, but Captain Winky says that about everyone, so you'll do nicely." },
        { id = "dd_pyron", when = { questDone = TODO_QUEST("Overmaster Pyron") },
          text = "Jalinda says you put out Overmaster Pyron for her. Good work, soldier, though I'd have hit it harder and sooner, and so should you next time." },
        { id = "dd_blackrock", when = { killed = { name = "Blackrock", min = 75 } },
          text = "Seventy-five Blackrock orcs and more, by my count, and I keep a careful count. That's striking the enemy before the enemy strikes us, and it's exactly what I've been telling Captain Winky for a year." },
      },
      again = {
        { id = "h_again", text = "Anything else, soldier? Speak up, because Winky's listening and he's a terrible gossip." },
        { id = "h_again2", text = "Next item on the agenda! Quickly now, {g:lad|lass}, the war won't wait." },
      },
      choices = {
        { text = "Seventy-five Blackrock orcs. Is that enough for you?", next = "dd_or_br", when = { killed = { name = "Blackrock", min = 75 } } },
        { text = "Who's Captain Winky?", next = "winky" },
        { text = "What are my orders, sir?", next = "orders" },
        { text = "What's that thing you keep holding to your ear?", next = "ear" },
        { text = "You must have served somewhere before the Vigil, sir.", next = "served" },
        { text = "Reporting for duty, sir!", next = "salute", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Are you well, Oralius? The Light can ease a troubled mind.", next = "priest", when = { class = "PRIEST" } },
        { text = "Does Captain Winky need a rogue on his crew?", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "What would you have your artillery do, sir?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you really enlist what follows me, sir?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What should a scout watch for, sir?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who exactly is Captain Winky, Oralius?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would you have a shaman strike first, Oralius?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Dismissed, then.", next = "END" },
      },
    },

    winky = {
      lines = {
        { id = "w_default", text = "Captain Winky is a pirate, soldier, a scoundrel and a liar and my oldest nemesis, and he's standing right next to you, so mind your purse. Don't let him tell you he's sane; I'm the only sane one here." },
      },
      choices = {
        { text = "I don't see anyone.", next = "winky_see" },
        { text = "Good day, Captain Winky.", next = "winky_greet", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winky_see = {
      lines = { { id = "ws_default", text = "That's exactly what he wants you to think! He's tricky, soldier; you only see him when he's tired of hiding, and he never gets tired." } },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1 } },
        { text = "Oralius, there's no one there.", next = "winky_truth", fx = { trait = { honest = 1 } } },
      },
    },
    winky_truth = {
      lines = { { id = "wt_default", text = "Everyone says that, soldier, and everyone in this camp is quite mad, every last one of them. Keep it between you, me and the Captain." } },
      choices = { { text = "Between the three of us.", next = "BACK", fx = { affinity = 1 } } },
    },
    winky_greet = {
      lines = { { id = "wg_default", text = "Ha! He says good day back, and that you've got shifty eyes, but he says that about everyone, so don't take it personally." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    orders = {
      lines = {
        { id = "o_default", fx = { learn = { "firegut" } },
          text = "Phase one, we bleed the Firegut ogres until they reel. Phase two, we take the head of their brute lord, and phase three, we stick it on a pike on top of their own mountain, and they run!" },
      },
      choices = {
        { text = "Why the ogres first?", next = "orders_why" },
        { text = "That's a gruesome plan.", next = "orders_terror" },
        { text = "Something else, sir.", next = "BACK" },
      },
    },
    orders_why = {
      lines = { { id = "ow_default", text = "Because the ogres guard the Rock, soldier, and the Rock's full of ore, and the ore feeds the Blackrock's forges. Starve the forges and the orcs fight with sticks; that's basic logistics." } },
      choices = { { text = "That's clever, sir.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    orders_terror = {
      lines = { { id = "ot_default", text = "Gruesome is a weapon like any other, soldier, and for all their size, ogres spook like cattle. One head on one stick saves a hundred arrows, and Winky agrees, for once." } },
      choices = {
        { text = "Not my problem, then.", next = "BACK", reply = "Not your problem, soldier? Then whose is it? Never mind, I'll put it on Winky's list.", fx = { align = { honor = -1 } } },
        { text = "I'd rather face them in a fair fight.", next = "BACK", reply = "Honestly? Against ogres? That's very noble, soldier, and very likely fatal. Winky's disappointed.", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },

    ear = {
      lines = { { id = "e_default", text = "This? This is my line to Control, soldier. Burning Steppes to Control, come in, Control... see, nothing, they never answer before noon." } },
      choices = {
        { text = "Who's Control?", next = "ear_control" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ear_control = {
      lines = { { id = "ec_default", text = "Somebody's got to be in charge of all this, soldier, and it isn't the Marshal, bless him. Until Control answers, I give the orders, and you follow them." } },
      choices = {
        { text = "Yes, sir.", next = "BACK", reply = "Good soldier! At last, someone who understands the chain of command.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't take orders from you, friend.", next = "BACK", reply = "Then you'll be reported, soldier, to Control, when Control answers. Winky's taking notes.", fx = { align = { order = -1 } } },
      },
    },

    served = {
      lines = { { id = "s_default", text = "Served? I'm still serving, soldier, I've never stopped, not for one day, not since the first horn. The rest of it's classified, and Winky's not cleared to hear it either." } },
      choices = {
        { text = "Of course, sir.", next = "BACK", fx = { affinity = 1 } },
        { text = "It sounds like it was bad, wherever it was.", next = "served_bad", fx = { trait = { kind = 1 } } },
      },
    },
    served_bad = {
      lines = { { id = "sb_default", text = "Bad? It was loud, soldier, very loud, and then it was quiet for a long time, and I didn't like the quiet at all. That's why I keep the horn." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    salute = {
      lines = { { id = "sa_default", text = "Now THAT is how you report! Winky, take notes; this is a real soldier, not a bilge rat. You'll get the hard jobs, {name}, because you can handle them." } },
      choices = { { text = "Sir, yes, sir!", next = "BACK", fx = { affinity = 2, standing = { morgans_vigil = 1 } } } },
    },
    priest = {
      big = true,
      lines = { { id = "pr_default", text = "Troubled? I'm the only one here who ISN'T troubled, priest! But you can say your prayer if you like, and I'll stand still for it; Winky's the one who needs it, if you ask me." } },
      choices = {
        { text = "Then I'll pray for both of you.", next = "priest_pray", fx = { affinity = 3, align = { light = 2 } } },
        { text = "Prayers are wasted on a man who isn't troubled.", next = "BACK", reply = "Wasted? Never! Winky's troubled enough for the whole camp, so say it for him.", fx = { align = { light = -1 } } },
        { text = "Another time, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    priest_pray = {
      lines = { { id = "pp_default", text = "...That was quieter than I expected, priest, and I didn't hate it. Don't tell Winky I said so; he'll never let me hear the end of it." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } },
        journal = { first = "I prayed with Oralius at Morgan's Vigil. For a moment, he was quiet.",
                    third = "{name} prayed with Oralius at Morgan's Vigil, and for a moment the old soldier was quiet." } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Winky says he'd take you on as a powder monkey, but you'd have to swear off stealing from the Vigil's stores, which he says you've been eyeing. I told him that's slander, soldier, so tell me it is." },
      },
      choices = {
        { text = "Slander, sir. Pure slander.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Tell Winky I'll steal from the orcs instead.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Who's Captain Winky?", next = "winky" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Intelligence, soldier, I've got it coming out of my ears, and Winky's got the rest. Ask me about any of this and keep your voice down." },
    },
    background = { { id = "tp_bg", text = "A soldier, soldier, which is all you need to know and all the Marshal knows too. Winky says otherwise, but Winky would.", next = "served" } },
    advice = { { id = "tp_ad", text = "Always keep a horn handy and a head on a pike, soldier, and a wee flask of stout for after. You'd be amazed how many problems one or the other solves." } },
    firegut = { { id = "tp_firegut", text = "Big, blue, stupid and frightened of their own shadows, once you know which shadow to show them.", next = "orders" } },
    blackrock = { { id = "tp_blackrock", text = "They wear medallions like they're proud of something, soldier. Bring me fifty and we'll find out what." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, and I'm still fighting it, as far as I'm concerned. Captain Winky says the war's over, but Winky's a liar." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Blackrock in the Spire are the enemy, and I'll see them burned. Winky says we need more men, but Winky always says that." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord's a fine soldier, and I'd follow him into any fight. Winky says he's too soft, but Winky would." } },
    onyxia = { { id = "tp_onyxia", text = "A black dragon in Dustwallow? I'll fight her myself, given half a chance. Winky says I'm mad, and Winky's probably right." } },
    _none = { { id = "tp_none", text = "That's classified, soldier, by order of the forge and the hammer, and Winky can stop laughing right now." } },
  },
}

P:NPC {
  key = "jalinda", id = TODO_NPC("Jalinda Sprig"), name = "Jalinda Sprig",
  bible = "bibles/burningsteppes.md", role = "scholar", tier = "quest",
  communities = { "morgans_vigil" }, temper = { "nervous", "earnest" }, values = { "kind", "dutiful" },
  notices = { "class", "race", "kit" },

  impression = {
    first = "She jumps at every noise and leads her expedition anyway.",
    third = "{name} met Jalinda Sprig, the jumpy leader of the expedition trying to reach Blackrock Depths.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Oh, you startled me. By my count about eighty percent of everything up here is on fire and the rest is about to be, so I've become rather jumpy." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you're not even singed! Well, not very singed, perhaps two or three percent at the cuffs." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Oh, please be careful near the mountain; five of mine went in, and the lucky ones only came back with their hair burned off." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! How wonderful, and how worrying; we're very small, you know, and everything in these mountains is very, very hot." },
    { id = "n_burnt", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's half melted, oh dear. Did something in the mountain take an interest in you? Sit down for a moment, please." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I keep hoping so. The elementals at the gate burn hotter every week, and my mages throw frost at them until they faint, so if you could only ask them to step aside, I'd be grateful forever." } },
      choices = {
        { text = "I'll ask the fire to stand aside before I fight it.", next = "BACK", reply = "That's kind, though I don't think they'll listen. They never listen to me, anyway.", fx = { align = { light = 1 } } },
        { text = "This fire serves Ragnaros. I'll break it, not bargain with it.", next = "BACK", reply = "Then break it, please, and quickly, before my mages faint again. Thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Overmaster Pyron guards the quarry inside the mountain, and he's a fire elemental, and he burned three of my mages before we'd even seen him properly. If you can get close enough to put him out, you'll have done what my whole expedition couldn't." } },
      choices = {
        { text = "I'll go in for your mages. Nobody should burn for nothing.", next = "BACK", reply = "Oh, thank you, thank you! They'll be so relieved, and so will I, and I'll have a cold compress ready for you, two cold compresses, in case.", fx = { align = { light = 1 } } },
        { text = "I'll do it, but for my own reasons, not theirs.", next = "BACK", reply = "Your own reasons are fine by me, as long as Pyron goes out. Thank you anyway.", fx = { align = { light = -1 } } },
        { text = "Something else, Jalinda.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It wandered too close to the mountain, and a fire elemental walked straight through it, and there was nothing left but a smell like burnt toffee. I keep thinking I'll get used to the Steppes, but every day they find a new way to frighten me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It wandered too close to the mountain, and a fire elemental walked straight through it. Oh, please mind {pet}'s paws on the ash, because the ground here goes from warm to burning without any warning at all." },
      },
      choices = {
        { text = "I'll guard my beast as carefully as you guard your mages.", next = "BACK", reply = "That's very sweet, and I'll tell my mages you said so. They'd like you.", fx = { align = { light = 1 } } },
        { text = "A beast is a tool. If it burns, I'll find another.", next = "BACK", reply = "Oh, that's dreadful, but I suppose it's practical. I'd never manage it myself.", fx = { align = { light = -1 } } },
        { text = "Something else, Jalinda.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Would you? Everyone who goes near the quarry comes back singed, but perhaps someone who doesn't glow and doesn't shout would get closer. Just count the fire elementals for me, and if you can tell me where Pyron stands, I'll sleep a little better." } },
      choices = {
        { text = "I'll count them all, and I'll come back unsinged.", next = "BACK", reply = "Would you? Then I'll sleep tonight, I think, for the first time in a week. Please be careful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Scouting costs, and the expedition will have to pay for it.", next = "BACK", reply = "Oh dear, the expedition hasn't much of anything, I'm afraid, except singed robes and good intentions. Please do try anyway.", fx = { align = { light = -1 } } },
        { text = "Something else, Jalinda.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! Oh, you startled me, though everything startles me lately, so please don't take it personally." },
        { id = "h_default", key = true,
          text = "I'm Jalinda Sprig, and I lead the expedition that's meant to get into Blackrock Depths, which is going very badly, because everything that guards the way in is made of fire and none of my calculations allowed for quite so much of it." },
        { id = "h_pyron", when = { questActive = TODO_QUEST("Overmaster Pyron") },
          text = "Overmaster Pyron guards the quarry at the mountain's foot, and every time we try to get past him we lose eyebrows. Please, please be careful." },
        { id = "h_incendius", tags = { "news" }, when = { questActive = TODO_QUEST("Incendius!") },
          text = "Incendius keeps raising Pyron from the ashes, and they say Incendius serves the one under the mountain. Oh dear, oh dear, I really wish I hadn't said that out loud." },
        { id = "h_rag", tags = { "news" }, when = { questRecent = { TODO_QUEST("Incendius!"), days = 7 } },
          text = "You're sure he said that name as he died? I haven't slept since you told me, and I keep thinking the ground is warmer than it was yesterday." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Oh, good, you look very solid, and solid is exactly what I need between me and Pyron, so please don't go anywhere." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! Oh, do keep your beasts away from the ridge, because everything up there is on fire, and I've already lost the expedition's pack mule to it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Oh, please tell me you can talk to fire, because everything between here and Blackrock Depths is burning and none of it listens to my mages." },
        { id = "dd_gortesh", when = { questDone = TODO_QUEST("Gor'tesh the Brute Lord") },
          text = "Oralius tells everyone that you killed Gor'tesh, and then he tells them again, louder. I'm glad the ogres are leaderless, but I'd be gladder if he let me work in peace." },
      },
      again = {
        { id = "h_again", text = "What else? Sorry, I'm a little scattered today; something exploded earlier, and it wasn't even ours." },
        { id = "h_again2", text = "Go on, I'm listening, I promise. I'm only looking at the mountain because it keeps looking at me." },
      },
      choices = {
        { text = "Has anyone tried to get into the mountain yet?", next = "mages" },
        { text = "What's inside the mountain?", next = "mountain" },
        { text = "Why would a gnome come up here?", next = "why" },
        { text = "A mage needs to be careful near that much fire.", next = "mage", when = { class = "MAGE" } },
        { text = "You must think of Gnomeregan often.", next = "gnome", when = { race = "Gnome" } },
        { text = "Let me look at your mages' burns.", next = "priest", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "What I keep doesn't mind fire, Jalinda.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "I could scout Pyron's quarry for you, Jalinda.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Who's Pyron, and why do you need a shield against him?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What happened to your mule, Jalinda?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Could a shaman help your mages past the fire, Jalinda?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Take care, Jalinda.", next = "END" },
      },
    },

    mages = {
      lines = { { id = "m_default", text = "The last five I sent snooping around Blackrock Mountain came home crispy, with their beards and hair burned into the most dreadful orange tufts. They're alive, all of them, but none of them will go back, and I can't blame them." } },
      choices = {
        { text = "You care about them.", next = "mages_hats" },
        { text = "Then send someone tougher.", next = "mages_tough" },
      },
    },
    mages_hats = {
      lines = { { id = "mh_default", text = "Of course I do; I'm the one who signed their papers. I've kept every one of their singed hats in my tent, and I count them at night, which I know is silly." } },
      choices = {
        { text = "It isn't silly.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mages_tough = {
      lines = { { id = "mt_default", text = "I would if I had anyone, but I don't have anybody else to send, {name}. That's rather where you come in, isn't it?" } },
      choices = { { text = "I suppose it is.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },

    mountain = {
      big = true,
      lines = {
        { id = "mo_default", fx = { learn = { "blackrock_depths", "dark_iron" } },
          text = "The Dark Iron city, deep down, and fire elementals guarding the way to it, and below all that... well, the stories say something very old and very angry is asleep in the heart of it. I'd prefer it stayed asleep, if anyone's asking me." },
      },
      choices = {
        { text = "You mean Ragnaros.", next = "mountain_name" },
        { text = "Why go in at all, then?", next = "mountain_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mountain_name = {
      lines = {
        { id = "mn_default", text = "Please don't, not up here. If even a few of the stories are true, he's the Firelord, and the Dark Irons called him up out of the earth and he's never gone back down." },
        { id = "mn_done", when = { questDone = TODO_QUEST("Incendius!") },
          text = "After what Incendius said as he died, I don't think it's only a story any more, and I hope someone somewhere is braver than I am." },
      },
      choices = { { text = "I'll be careful with the name.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    mountain_why = {
      lines = { { id = "mw_default", text = "Because the Dark Irons are coming out of it more and more, into the Badlands and Searing Gorge and even Loch Modan, and somebody has to learn why before they arrive somewhere that matters. That somebody is apparently me." } },
      choices = { { text = "Then you're braver than you think.", next = "BACK", fx = { affinity = 2 } } },
    },

    why = {
      lines = { { id = "y_default", text = "Because gnomes are curious, and curiosity is a terrible habit, and the expedition needed someone who knew a little about fire and a lot about measuring things. I was the only one who put up a hand, and I think I was stretching." } },
      choices = {
        { text = "That's how most adventures start.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "ma_default", text = "Cold spells, always ready, and never trust a fire that seems friendly. And keep your eyebrows; I can't stress that enough, because they don't grow back nearly as fast as you'd hope." } },
      choices = { { text = "I'll guard my eyebrows.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Every day, a little. That's partly why I'm here: I couldn't save our city, but I could at least go and measure somebody else's disaster before it reaches anyone else." } },
      choices = {
        { text = "We'll get it back one day.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Would you? Oh, thank you; they're in the end tent, pretending not to be in pain. Tell them Jalinda sent you, and they'll let you look, though they'll grumble about it." } },
      choices = {
        { text = "I'll see to them now.", next = "BACK", reply = "Thank you, oh, thank you. Be gentle with the tall one; he cries.", fx = { affinity = 3, align = { light = 1 }, standing = { morgans_vigil = 1 } } },
        { text = "If they'd rather pretend, let them. Pain teaches its own lessons.", next = "BACK", reply = "Oh, that's rather harsh, but they'll learn it anyway. I'll tell them you stopped by.", fx = { align = { light = -1 } } },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "No, they don't, do they? I've thought about it, I'll admit, sending something that won't burn through the door first. But Marshal Maxwell would have my hide, and my mages would have the rest, and I'm not sure they'd be wrong." },
        { id = "xlk_gnome", when = { race = "Gnome" },
          text = "No, they don't, and I've thought about asking gnomes of your sort for exactly that, since we're all scraping by on whatever works since Gnomeregan. But Maxwell would have my hide, and I'm not sure he'd be wrong." },
      },
      choices = {
        { text = "Then send my little ones in first. It saves lives.", next = "BACK", reply = "It might, and I've been tempted, really, I've even worked out the binding sums. But I'm terribly afraid of what Maxwell would say, and of them, a little.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Maxwell's right. Some help costs too much.", next = "BACK", reply = "I think so too, and it's good to hear someone else say it. Thank you.", fx = { align = { light = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I've taken measurements of nearly everything around here, though not all of it was wise. Ask me about any of these, if you like." },
    },
    background = { { id = "tp_bg", text = "A gnome of Gnomeregan who now measures volcanoes for a living. I don't recommend the career; I've lost both eyebrows twice.", next = "why" } },
    advice = { { id = "tp_ad", text = "Carry water, then carry more water, roughly twice what any sensible formula suggests, and if anything made of fire starts talking to you, don't answer it." } },
    blackrock_depths = { { id = "tp_depths", text = "The Dark Iron city, built into the mountain's heart. My expedition was meant to go in, but the fire elementals had other ideas.", next = "mountain" } },
    dark_iron = { { id = "tp_darkiron", text = "They serve the fire, or the fire owns them, and I've lain awake wondering which is worse." } },
    gnomeregan = {
      { id = "tp_gnomeregan", text = "Gnomeregan was home, and I lost my eyebrows there long before I lost them here. I'd like to see it again, but not until it's safe." },
      { id = "tp_gnomeregan2", when = { race = "Gnome" }, text = "You'll remember it too, then, the halls and the lights. Do you dream about it? I do, nearly every night." },
    },
    dalaran = { { id = "tp_dalaran", text = "The mages in my expedition trained in Dalaran, before it fell. They talk about it all the time, and I try not to listen." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "The black dragons make the ground shake when they fly, and I've measured it. It's terrifying, and fascinating, and I hope never to measure it again." } },
    thaurissan = { { id = "tp_thaurissan", text = "The ruins of Thaurissan are full of old magic, and my mages are studying it very carefully. I'm studying it from a long way off." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, I'm afraid. Helendis might; he's read half the library in Stormwind and is very patient about it." } },
  },
}

P:NPC {
  key = "mayara", id = TODO_NPC("Mayara Brightwing"), name = "Mayara Brightwing",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "quest",
  communities = { "morgans_vigil" }, temper = { "sharp", "proud" }, values = { "curious", "greedy" },
  notices = { "class", "origin", "lock_soulstone" },

  impression = {
    first = "She treats the Dark Irons' ruins like a market stall.",
    third = "{name} met Mayara Brightwing, who collects relics at Morgan's Vigil on behalf of Count Remington Ridgewell.",
  },

  greetings = {
    { id = "g_default", text = "Hello, and do watch the crates; some of them are older than Stormwind." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Bring me something shiny and we'll be friends for life." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Do you know, you're the first I've seen north of Lakeshire. The Light keeps me alive up here, and the Count pays for everything else." },
    { id = "n_noble", cat = "origin", when = { origin = "human_minor_noble" },
      text = "You carry yourself like someone who's been to a dinner in the Keep and been bored at it. Do you know the Ridgewells? Everyone knows the Ridgewells, at least by their museum." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "There's a soul in that stone you're carrying, and the Count would want to know if it talks. I've strict instructions to bring home nothing that whispers, so keep it out of my crates." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "He collects anything rare, and a dwarf who talks to the stone is rarer than an honest goblin. I'd never sell such a thing myself, of course, unless the price was very beautiful." } },
      choices = {
        { text = "My totems aren't trinkets. They're not for sale.", next = "BACK", reply = "A pity, darling, they'd look divine in his collection. Keep them, then, and I'll keep asking.", fx = { align = { honor = 1 } } },
        { text = "Name the Count's price. I can always carve another.", next = "BACK", reply = "Oh, I like you, darling. Bring me the finest one, and we'll see what the Count says.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only the beautiful ones, which rules out most of what the Dark Irons carry today. The old ones, forged before Thaurissan's folly, are works of art, and I'd never let a soldier keep one long enough to use it." } },
      choices = {
        { text = "A weapon's made for a soldier's hand, not a rich man's wall.", next = "BACK", reply = "A soldier's hand gets them broken, darling, and the wall keeps them whole. We'll agree to differ.", fx = { align = { honor = 1 } } },
        { text = "If the Count pays well, I'll find him all the swords he wants.", next = "BACK", reply = "He pays very well, darling, and he's never satisfied. We'll get along splendidly.", fx = { align = { honor = -1 } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A black whelp's head would make his year, though I'd settle for a Blackrock worg pelt with the teeth still in. He has a whole room of heads at his house in Stormwind, and he insists on telling guests he shot every one himself." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A black whelp's head would make his year, though I'd settle for a Blackrock worg pelt with the teeth still in. And does {pet} have a pedigree, I wonder? No, don't tell me, or I'll only start writing it up for the Count." },
      },
      choices = {
        { text = "A trophy belongs to whoever earned it.", next = "BACK", reply = "How romantic, darling, and how unprofitable. The Count would disagree.", fx = { align = { honor = 1 } } },
        { text = "Bring me the Count's coin, and I'll bring him his heads.", next = "BACK", reply = "Oh, a professional. Bring me the heads, darling, and I'll bring you the Count's gratitude.", fx = { align = { honor = -1 } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only when they come up, and they come up often, since the plague left so many fine things with no one to claim them. The Count pays well for a Silver Hand tabard, and I tell myself it's better in a museum than in a ghoul's hands." } },
      choices = {
        { text = "Those relics belong to the order, not to some count.", next = "BACK", reply = "Then the order should come and claim them, darling, before the ghouls do. Until then, they're mine.", fx = { align = { honor = 1 } } },
        { text = "Better a museum than a ghoul's hands. You're right.", next = "BACK", reply = "Exactly, darling, and the Count's museum is very well lit. You understand perfectly.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some do, faintly, like a warm stone after the sun goes down, and the Count likes those best. I've no talent for it myself, so I lick my finger and hold it over them, which works about as well as you'd expect." } },
      choices = {
        { text = "Relics belong with scholars, not on a count's table.", next = "BACK", reply = "Scholars don't pay as well, darling, and they leave things in dusty drawers. The Count displays them.", fx = { align = { order = 1 } } },
        { text = "Finders keepers, my lady. The Count found them first.", next = "BACK", reply = "Exactly, darling, finders keepers, and he did find them, with my help. You're a delight.", fx = { align = { order = -1 } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Once, a Dark Iron chalice that whispered at night, and he kept it in the guest wing until the guests stopped coming. It went back into a vault, and I'm under strict instructions to bring home nothing that talks." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Once, a Dark Iron chalice that whispered at night, and your demon watches me the way that chalice used to sound. It went back into a vault, and I'm under strict instructions to bring home nothing that talks, so please don't let yours follow me home." },
      },
      choices = {
        { text = "Dark relics should be destroyed, not displayed.", next = "BACK", reply = "Destroyed? Darling, that's a dreadful waste. But I'll pass your opinion on to the vault.", fx = { align = { light = 1 } } },
        { text = "A whispering chalice? I'd have kept it.", next = "BACK", reply = "Then you'd have had very lonely dinners, darling. The Count learned his lesson.", fx = { align = { light = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Someone will take them, darling, and better a man who'll dust them than an orc who'll melt them. I know your people bury things and let them lie, but the Dark Irons left these to burn, and I'm only rescuing them." } },
      choices = {
        { text = "Leave them in the ash. The dead's treasures belong to the dead.", next = "BACK", reply = "The dead don't seem to mind, darling, and the orcs certainly don't. I'll rescue what I can.", fx = { align = { honor = 1 } } },
        { text = "Better in a collection than melted down. Rescue what you can.", next = "BACK", reply = "Exactly, darling, and I'm glad someone sees it. You'd make a wonderful assistant.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Do keep that smoky little thing away from the porcelain, darling, because it's older than Stormwind, and so, apparently, is my patience." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Wonderful; you can tell me which of these pieces still hum with old enchantment, because the Count adores anything that glows in the dark." },
        { id = "h_default", key = true,
          text = "Mayara Brightwing, here on behalf of Count Remington Ridgewell of Stormwind. The Count collects beautiful things, and the Dark Irons left a great many beautiful things lying in the ash." },
        { id = "h_sent", tags = { "news" }, when = { questActive = TODO_QUEST("Mayara Brightwing") },
          text = "You came from Stormwind? Wonderful; the Count promised me help and I'd almost stopped believing him. I know of a piece he'd give his right hand for, but getting it out won't be easy." },
        { id = "h_clasp", when = { questActive = TODO_QUEST("Doomrigger's Clasp") },
          text = "The Hall of Fortune is high in the Spire, and the clasp should still be there if the orcs haven't melted it. Look for gems, so many gems that a dwarf would weep to see them." },
        { id = "h_crate", when = { questActive = TODO_QUEST("Delivery to Ridgewell") },
          text = "Carry it carefully, and don't open it, and don't let anyone at court see you with it before the Count does. He likes to surprise his guests." },
        { id = "h_done", when = { questDone = TODO_QUEST("Delivery to Ridgewell") },
          text = "The Count wrote to me himself, which he never does; he says the clasp is the jewel of the whole museum now. You're a very welcome name in a very old house, {name}." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! The Count would love to meet you, I'm sure, because he collects knights almost as eagerly as he collects jewels, though he's far less careful with the knights." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. The Count does adore a fine sword, and you look like someone who might stumble over one in the ruins and never know what it's worth." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter? How splendid, for the Count is mad about trophies, and I've a standing order for anything from the Steppes with horns, wings or a pedigree." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle! You'll find the Dark Irons' treasures rather ugly, I expect, but the Count's tastes run to the dramatic." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! The Count would pay a fortune for anything you've carved, I suspect, because nobody in Stormwind has ever seen a Bronzebeard totem." },
      },
      again = {
        { id = "h_again", text = "What else? I'm cataloguing, but I can talk and count at the same time." },
        { id = "h_again2", text = "Go on. I've had no one to talk to but Oralius and his pirate for a week." },
      },
      choices = {
        { text = "What brings a Stormwind lady to the Steppes?", next = "errand" },
        { text = "What have you found in the ruins so far?", next = "ruins" },
        { text = "Marshal Maxwell doesn't seem to think much of you.", next = "maxwell" },
        { text = "The Steppes are no place to go shopping.", next = "spire" },
        { text = "My family dines with the Ridgewells.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Do you pray much out here, my lady?", next = "priest", when = { class = "PRIEST" } },
        { text = "Treasure hunting's my trade too, my lady.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "Do the Dark Iron relics still carry enchantments?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd wager the Count has bought something demonic before.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you sell relics of the Silver Hand to collectors, Mayara?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The Count must want a few Dark Iron weapons.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What sort of trophies does the Count want?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a dead kingdom's treasures go to a count's collection, Mayara?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the Count really collect a shaman's totems, Mayara?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with the hunt.", next = "END" },
      },
    },

    errand = {
      lines = { { id = "e_default", text = "The Count sent me to scout the ruined city of Thaurissan for pieces worthy of his family's museum. He'd come himself, he says, if the Steppes weren't so dreadfully far from his tailor." } },
      choices = {
        { text = "This looks a lot like grave-robbing to me.", next = "errand_robbing" },
        { text = "What's in the museum?", next = "errand_museum" },
        { text = "Something else.", next = "BACK" },
      },
    },
    errand_robbing = {
      lines = { { id = "er_default", text = "The Dark Irons left these things to burn two hundred years ago, and the orcs would melt them for spearheads. I'd rather they stood in a hall in Stormwind where children can see them." } },
      choices = {
        { text = "That's a fair answer.", next = "BACK", fx = { affinity = 1 } },
        { text = "And the Count gets richer.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    errand_museum = {
      lines = { { id = "em_default", text = "Crowns and swords and things nobody else could find, most of it from places nobody else would go. The Count's proudest of the pieces with the worst stories, and I bring him a great many of those." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    ruins = {
      lines = { { id = "r_default", fx = { learn = { "thaurissan" } },
        text = "Statues, mostly broken, and stones that whisper when you touch them, which I didn't care for at all. The best things weren't there, though; they'd been carried up into the Spire long ago." } },
      choices = {
        { text = "The stones whisper?", next = "ruins_whispers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins_whispers = {
      lines = { { id = "rw_default", text = "Little voices, asking for help or telling you to go away, and once something saying that it couldn't be defeated. I said a prayer and moved my camp to this ridge the same night." } },
      choices = {
        { text = "Wise of you.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I'd like to hear them.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    spire = {
      lines = { { id = "s_default", fx = { learn = { "blackrock_spire" } },
        text = "No, it's a place to go stealing, which is much more respectable. High up in Blackrock Spire there's a chamber the Dark Irons called the Hall of Fortune, where they kept their trophies and their finest work." } },
      choices = {
        { text = "And what's in it now?", next = "spire_hall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spire_hall = {
      lines = { { id = "sh_default", text = "Half of it has fallen in, and the orcs use the rest for things I'd rather not describe before supper. But Doomrigger's Clasp should still be there, and that one piece would make the whole trip worthwhile." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    maxwell = {
      lines = { { id = "mx_default", text = "He thinks I'm a lady's errand with a pack mule, which is accurate, and he's too polite to say so, which is sweet. He lets me camp here because my coin buys his soldiers' bread." } },
      choices = {
        { text = "Does it?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = { { id = "nb_default", text = "Then you've heard the Count tell the story of every piece twice and laugh at his own jokes. Tell him I'm well, if you see him, and that I need a new pair of boots." } },
      choices = { { text = "I'll pass it on.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "I learned my prayers as a girl in Stormwind, like everyone, and found out up here that they work best said quickly. Don't look so shocked; the Light doesn't seem to mind a little haste." } },
      choices = {
        { text = "The Light doesn't mind sincerity either.", next = "BACK", reply = "No, I suppose it doesn't, darling. I'll try saying them slowly next time, for you.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Haste suits me. The Light can wait until the fighting's done.", next = "BACK", reply = "Haste suits everyone up here, darling. The Light understands.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "I'm sure it is, darling, though I suspect your methods involve fewer letters of introduction. The Count pays for provenance; he likes to know a thing was found and not lifted, so do tell me which you'd call it." },
      },
      choices = {
        { text = "Found, my lady. Always found.", next = "BACK", reply = "Found, of course, darling, and I'll write it down that way. The Count will be pleased.", fx = { align = { honor = -1 }, affinity = 1, trait = { witty = 1 } } },
        { text = "Lifted, from people who'd earned it.", next = "BACK", reply = "Oh, darling, you're terrible. I'll write found anyway, and nobody need know.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "What have you found in the ruins?", next = "ruins" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "In my line of work you learn what's worth knowing and forget the rest. These are worth knowing." },
    },
    background = { { id = "tp_bg", text = "I find things for people who'd rather not get their own boots dirty. The Count is the best of them, because he pays on time.", next = "errand" } },
    advice = { { id = "tp_ad", text = "Never pick up anything that hums, and never sell anything the day you find it. Both lessons cost me dearly." } },
    thaurissan = { { id = "tp_thaurissan", text = "A dead city full of beautiful things and unhappy voices. I took the first and left the second.", next = "ruins" } },
    blackrock_spire = { { id = "tp_spire", text = "A vault with orcs in it. That's all a fortress ever is, if you think about it.", next = "spire" } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons under the mountain have the finest treasures in the Eastern Kingdoms, and I'd catalogue them all, if I could get in. The Count would pay handsomely." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are dreadful neighbors and wonderful craftsmen. I'd love to see their workshops, and I'd love to see them gone, in that order." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor is the toast of Stormwind, and the Count dines with her often. He says she has the most remarkable eyes." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where the Count's treasures are shipped, and where the goblins try to steal them. I keep a very close eye on the manifests." } },
    _none = { { id = "tp_none", text = "If it isn't old and it isn't valuable, I'm afraid I haven't paid it any attention." } },
  },
}

P:NPC {
  key = "borgus", id = TODO_NPC("Borgus Stoutarm"), name = "Borgus Stoutarm",
  bible = "bibles/burningsteppes.md", role = "flightmaster", tier = "service",
  communities = { "morgans_vigil" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race", "mount", "lock_pact" },

  impression = {
    first = "He tells me each gryphon's mood whether I ask or not.",
    third = "{name} met Borgus Stoutarm, the dwarf who keeps the gryphons of Morgan's Vigil.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'd rather you were brief today." },
    { id = "g_op_kaldorei", when = { gossip = { topic = "night_elves", stance = "distrust" } }, text = "Helendis says ye told him tae go back tae his forests. He took it well, for an elf, which means he's said nothin' tae anyone for two days." },
    { id = "g_default", text = "Need a bird? Mind the ash; they hate it on their feathers." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. The birds remember ye, which is more than they do for most." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ah, a proper dwarf! Ye'll know how to sit a gryphon without squeezin' the life out of it, unlike some I could name." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "Ye're runnin' hot as the Steppes themselves, an' the gryphons can feel it. Cool down a moment before ye mount, or they'll think ye're on fire." },
  },

  start = "hello",
  nodes = {
    dw_nerve = {
      lines = {
        { id = "dw_nerve_default", text = "Nerve, or a short memory, kin. Every flight over the mountain, I look down at Blackrock and think of the Dark Irons inside, Thaurissan's folk, still sore about a war we won three hundred years ago." },
      },
      choices = {
        { text = "Let them be sore. We'll win the next war too.", next = "BACK", reply = "Aye, that's the spirit, and I'll fly ye to it. Just don't shout it while we're over their chimneys.", fx = { align = { light = -1 } } },
        { text = "Someday the clans will have to make peace.", next = "BACK", reply = "Peace with the Dark Irons? The Brotherhood at Thorium Point might drink to that. I'll believe it when they stop shooting at my birds.", fx = { align = { light = 1 } } },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    dw_why = {
      lines = {
        { id = "dw_why_default", text = "Because Blackrock is the Dark Irons' city and the Horde's old fortress both, and whatever's brewing under it will reach Ironforge sooner or later. Marshal Maxwell holds the Vigil, and Ironforge lends him the birds, and the ale." },
      },
      choices = {
        { text = "What's brewing under the mountain?", next = "dw_why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dw_why2 = {
      lines = {
        { id = "dw_why2_default", text = "Fire, they say, and an old fire at that. The Dark Irons called up Ragnaros himself in the War of the Three Hammers, and he never went home again. And Ironforge's own princess went into that mountain and hasn't come out." },
      },
      choices = {
        { text = "The princess? Moira Bronzebeard?", next = "BACK", reply = "Aye, the King's own daughter, taken by Thaurissan's lot, and no rescue has got near her. Don't mention her in Ironforge unless ye want to see a grown guard weep." },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Feel them? They fuss at every storm before I see a cloud, so aye, I'd say they do. They've taken tae ye better than tae most, which tells me more than any priest could." } },
      choices = {
        { text = "Then I'll ask the wind to go easy on them.", next = "BACK", reply = "That'd be kind, an' they'd thank ye in their way, which is mostly squawkin'. Mind the big one.", fx = { align = { light = 1 } } },
        { text = "Gryphons have flown through worse. A little ash won't kill them.", next = "BACK", reply = "They have, aye, but every one o' them coughs at night. A little ash adds up.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, the Wildhammer do it all the time up in the Hinterlands, but my birds are for the post an' the road home. When the Blackrock come over the ridge, though, I've seen my lads dive at them on their own, an' I've never been so proud o' anythin' wi' feathers." } },
      choices = {
        { text = "Leave the fighting to us, Borgus. Your birds have done enough.", next = "BACK", reply = "Aye, they have, an' I'll tell them ye said so. They'll pretend not tae care.", fx = { align = { light = 1 } } },
        { text = "Train them for war. Talons like that are wasted on the post.", next = "BACK", reply = "Nae, they're post birds, an' proud o' it. The Wildhammer can keep their war birds.", fx = { align = { light = -1 } } },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Nae a thing, for there's nothin' fit tae eat out there that isnae already cooked or poisoned. I fly in fish from Lakeshire every week, an' they eat better than I do, the spoiled creatures." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Nae a thing, for there's nothin' fit tae eat out there, so I fly in fish from Lakeshire. An' keep {pet} on the ground, for my birds think anythin' smaller than a horse is breakfast." },
      },
      choices = {
        { text = "Good birds deserve good food. Keep spoiling them, Borgus.", next = "BACK", reply = "I will, an' they'll thank ye for it by bitin' me less. Good birds, every one.", fx = { align = { light = 1 } } },
        { text = "Fish from Lakeshire? Feed them worg meat and save the coin.", next = "BACK", reply = "Worg meat? Ye'd poison them, ye daft thing. Fish it is, an' that's final.", fx = { align = { light = -1 } } },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They come for the gryphons, mostly, because a bird downed is a message that never reaches Lakeshire. Marshal Maxwell says we hold the ridge for honour an' for Stormwind, an' I say we hold it for the birds, but it comes tae the same thing." } },
      choices = {
        { text = "It's honour that holds this ridge. Remember that.", next = "BACK", reply = "Honour it is, then, an' I'll tell the birds. They'll not understand, but they'll nod.", fx = { align = { honor = 1 } } },
        { text = "Holding it for the birds is reason enough, Borgus.", next = "BACK", reply = "Aye, that's what I say, an' it's good tae hear someone agree. The birds thank ye.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I'll count aloud, an' each one had a name an' a temper o' its own. I bury 'em up on the ridge facin' Ironforge, an' I'll tell ye plain that I say a prayer over every one, though I'd thump any soldier who laughed." } },
      choices = {
        { text = "Nobody should laugh. A faithful creature deserves a prayer.", next = "BACK", reply = "Ye're right, an' nobody will while I'm about. Thank ye for sayin' it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's a war. Mourn later, Borgus, and keep them flying.", next = "BACK", reply = "Aye, it's a war, but they're my birds. I'll mourn when I like, an' they'll keep flyin'.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They don't mind ye, exactly, they sneeze at ye, for the arcane tickles their beaks somethin' awful. Stand downwind an' ye'll be fine, an' don't go castin' anythin' mid-flight, or ye'll find out what a sneezin' gryphon does at a thousand feet." } },
      choices = {
        { text = "I'll keep my hands still. Your birds come first.", next = "BACK", reply = "Good, an' they'll thank ye by not sneezin' ye off. Downwind, mind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they sneeze, they sneeze. I'll cast what I need to.", next = "BACK", reply = "Then ye'll find out what a sneezin' gryphon does, an' I'll not catch ye. Yer choice.", fx = { align = { light = -1 } } },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ye get a beak in the ear, if ye're lucky, an' a talon in the backside if ye're not. Walk up loud an' honest, the way ye'd walk up tae a dwarf in a tavern, an' they'll carry ye anywhere." } },
      choices = {
        { text = "Loud and honest, then. Your birds deserve respect.", next = "BACK", reply = "That's it, an' they'll carry ye anywhere. Ye're learnin'.", fx = { align = { honor = 1 } } },
        { text = "Sneaking's a hard habit to break. I'll take my chances.", next = "BACK", reply = "Then mind the talons, because they'll find ye. Good luck tae ye.", fx = { align = { honor = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, if anyone could, because I've tried everything from oil to bathin' them in water I had carried up special from Lakeshire, an' they hated the bath. A druid could talk to them, maybe, an' tell them it's for their own good, because they won't believe it from me." } },
      choices = {
        { text = "Your birds deserve somewhere cleaner than this, Borgus.", next = "BACK", reply = "They should, aye, but there's nowhere cleaner on this ridge. I'll do what I can.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Vigil needs them. Keep them flying, and keep them clean.", next = "BACK", reply = "Aye, that's the trick, an' I'm doin' my best. Maybe ye could talk tae them.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Aye, once that creature's gone an' the smell's faded a bit, which takes longer than ye'd think. They've enough tae fear in these skies wi' the black dragons an' the Blackrock arrows, so I'll no' have them frightened on their own perch." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Aye, once the demon's gone an' the smell's faded, an' I can tell ye the birds want yours gone a good deal faster. They've enough tae fear in these skies wi' the black dragons an' the Blackrock arrows, so send it off, for I'll no' have them frightened on their own perch." },
      },
      choices = {
        { text = "I'll put it away. The birds come first.", next = "BACK", reply = "Thank ye, an' they'll calm down soon enough. Good o' ye.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What I keep is none of your birds' business, Borgus.", next = "BACK", reply = "It is when it's sittin' on their perch, an' I'll thank ye tae remember that. Away wi' it.", fx = { align = { order = -1 } } },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ye've a smell on ye, eh? The birds can catch it a mile off, an' they'll no' let ye near if yer pet's out, so tuck it away before ye come up tae the perch." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, is it? Mind, the birds know a light step when they hear one, an' they hate bein' crept up on more than they hate the smoke." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, wantin' a gryphon? Ye could pop off tae Ironforge in a flash o' light, but I'll no' say no tae a customer who likes the long way round." },
        { id = "h_default", key = true,
          text = "Borgus Stoutarm, and these are the Vigil's gryphons, the finest birds that ever choked on volcano smoke. Tell me where ye're going and I'll find ye one that's in a good mood." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night flights over the Steppes are a sight, with the whole mountain glowin' red below ye. Hold on tight, mind; the hot air throws the birds about." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Say a wee word for the birds, would ye? The smoke chokes 'em an' the Blackrock orcs shoot at 'em, an' they deserve a bit o' kindness from somewhere." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Ye'll be wantin' a strong bird, then, for all that plate, an' I've just the one, a big grumpy fellow who doesnae mind the weight." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Mind ye stand still while I saddle ye, for the birds can feel a soldier fidgetin' in his plate, an' it puts them off their flyin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, is it? Keep yer beasts clear o' the roost an' all will be well, for my birds are cross enough wi' the smoke as it is." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid! Now there's a sight, and me birds have been sneezin' ash all mornin', so if ye know a trick for that I'd hear it gladly." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Then ask the wind tae stop blowin' ash in my birds' eyes, an' I'll fly ye anywhere for nothin', which I've never offered anyone." },
        { id = "dd_fall", when = { deathCause = "falling" },
          text = "Ye came off a ridge in this ash, didn't ye? Ye can't see the edge for the smoke half the time, an' that's why I keep birds, so folk can see it from above instead." },
      },
      again = { { id = "h_again", text = "Need somethin' more? The gryphons cannae abide the smoke off the mountain, so be quick." } },
      choices = {
        { text = "Where can your gryphons take me?", next = "routes" },
        { text = "How do the birds stand the heat?", next = "heat" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Do gryphons mind a mage on their backs, Borgus?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I could sneak up on a gryphon easily enough.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Have you lost many gryphons to the Blackrock, Borgus?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The Blackrock must come for the Vigil now and then.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have your gryphons ever carried soldiers into battle?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your gryphons hunt anything in the Steppes?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "A druid might help your gryphons with the ash, Borgus.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will your gryphons carry someone who smells like me, Borgus?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your gryphons feel the spirits, Borgus?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "A dwarf flying gryphons over Blackrock. That takes nerve.", next = "dw_nerve", when = { race = "Dwarf" } },
        { text = "Why are dwarves here at all, so far from Ironforge?", next = "dw_why" },
        { text = "Not today, Borgus.", next = "END" },
      },
    },
    routes = {
      lines = { { id = "r_default", text = "South to Lakeshire and on to Stormwind, north over the mountain to Thorium Point, or east to Nethergarde Keep, if ye've business at the Dark Portal. There's no flyin' straight over Blackrock Spire, though; the drakes take that personally." } },
      choices = {
        { text = "The drakes attack gryphons?", next = "routes_drakes" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_drakes = {
      lines = { { id = "rd_default", text = "They do, and they're bigger than my birds and twice as mean. We go round the long way, and nobody complains about the fare twice." } },
      choices = { { text = "Long way it is.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    heat = {
      lines = { { id = "h2_default", text = "Badly. I wet their wings every morning and they still come back sulkin' and smellin' like a forge, and ye'd sulk too if ye'd been hatched in cool mountain air and posted to a volcano." } },
      choices = {
        { text = "Poor birds.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the Vigil's birds, and I keep 'em alive, and that's the whole of my tale worth tellin'." } },
    advice = { { id = "tp_ad", text = "Never feed a gryphon from yer hand in the Steppes; the ash makes 'em bitey." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer taught me gryphons, an' they'd laugh at the way I fuss over mine. I don't care, my birds are the happiest in the Steppes." } },
    magni = { { id = "tp_magni", text = "The king's a good king, an' I'd fly him anywhere he wanted. He'd have to sit still, mind." } },
    firegut = { { id = "tp_firegut", text = "The Firegut ogres throw rocks at my birds when they fly over Dreadmaul. I'd like to drop a few rocks on them." } },
    onyxia = { { id = "tp_onyxia", text = "A black dragon in Dustwallow, eh? My birds would smell her from a hundred miles off, an' they'd refuse to fly. I'd not blame them." } },
    _none = { { id = "tp_none", text = "I fly birds, friend, an' I leave the rest tae folk wi' rank. Ask the Marshal." } },
  },
}
