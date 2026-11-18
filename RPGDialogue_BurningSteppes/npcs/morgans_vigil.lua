-- Morgan's Vigil: the Alliance's last foothold in the Burning Steppes, in the ruins on the southeastern ridge. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maxwell", id = TODO_NPC("Marshal Maxwell"), name = "Marshal Maxwell",
  bible = "bibles/burningsteppes.md", role = "soldier", tier = "major",
  communities = { "morgans_vigil" }, temper = { "steady", "sharp" }, values = { "dutiful", "loyal" },
  notices = { "class", "race", "deputy" },

  impression = {
    first = "Marshal Maxwell writes reports nobody reads and keeps his camp together anyway. He's tired, and bitter about Stormwind's silence, but the kindness hasn't gone out of him yet.",
    third = "{name} met Marshal Maxwell, who commands what is left of Stormwind's presence at Morgan's Vigil.",
  },

  greetings = {
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
      text = "So you're Bolvar's deputy. I asked the Keep for a regiment, and I'll grant you've done more than most regiments I've known." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry that blade like someone who's used it on more than training dummies. Good; this ridge has had enough of people who haven't." },
  },

  start = "hello",
  nodes = {
    op_regent = {
      lines = {
        { id = "opr_default", text = "That's not a question a marshal answers in a report, deputy. The Highlord asks for proof, and Lady Prestor at his side asks for more, and Windsor is in chains while they ask. You've stood in that throne room, so you tell me." },
      },
      choices = {
        { text = "Bolvar's a good man in an impossible seat.", next = "op_reg_trust", fx = { affinity = 1, align = { order = 1 }, opinion = { bolvar = "trust" } } },
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
        { id = "oprp_default", text = "You're not the first to say it, and you won't be the last, and every one of them ends up posted somewhere very far from Stormwind. Keep it out of your reports and keep your eyes open." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Then you'll fight them on their ground, which is ash and fire and slopes that favour whoever stands highest, and they always stand highest. I'd ask you to hold the road to Redridge before you go hunting glory at the Spire, because if the Vigil falls, Lakeshire is next." } },
      choices = {
        { text = "We'll hold the road. Lakeshire's people come first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We'll take the fight to the Spire. Waiting never won a war.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I'll serve the Vigil as a soldier, Marshal, spirits or no.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The spirits aren't soldiers. I'll follow them, not orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd put a kobold on my line if it could hold a sword, and you can do a good deal more than that. Just keep whatever you call up pointed at the mountain, deputy, because my soldiers have seen enough fire to last them." } },
      choices = {
        { text = "Every weapon against the Blackrock is a good one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll fight with care, Marshal. Your soldiers come first.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Stormwind barely sends us bread, so I've no hope at all for this land, though a druid once told me the ash makes the best soil in the world given a hundred years. I'll not be here to see it, but I'd like to think somebody will be." } },
      choices = {
        { text = "Then the Vigil should hold this ridge until the land comes back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "This ground isn't worth a soldier's life. Stormwind's right to ignore it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_ubrs = {
      big = true,
      lines = { { id = "xcl_ubrs_default", text = "Broken for now. Windsor told us what Drakkisath was guarding and who was giving him orders from higher still, and the Black Dragonflight doesn't run short of generals. Still, every soldier on this ridge will sleep a little sounder tonight, and I'll take that." } },
      choices = {
        { text = "Then we finish it, Marshal, and take the war to their master.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We've done our part. Let Stormwind deal with the dragons now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What was Drakkisath guarding up there?", next = "xcl_ubrs2" },
      },
    },
    xcl_ubrs2 = {
      lines = { { id = "xcl_ubrs2_default", text = "Something that opens the way to the dragons' own lair, if Windsor's right, and he usually is. I'd sooner nobody went through that door unprepared, so tell me before you try it, deputy." } },
      choices = {
        { text = "I'll tell you before I go anywhere near it.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "A full company at Morgan's Vigil, and you've no notion how rare that is. Most who come up from Redridge come in ones and twos, and the Blackrock see them coming from the mountain." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Blackrock", min = 40 } }, text = "The scouts tell me you've been cutting down Blackrock orcs all across the Steppes, and the camps are quieter for it. Keep at it, but don't get careless, because Rend notices when his numbers drop." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Stormwind pretends your kind don't exist, and out here I'm too short of soldiers to pretend anything at all." },
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
      },
      again = {
        { id = "h_again", text = "What else, deputy? I've got a report to write, but it'll keep; they always do." },
        { id = "h_again2", text = "Go on. Out here a conversation is the only luxury we've got left." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away. The orcs won't move before dawn, and neither will I." },
      },
      choices = {
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
        { text = "Few marshals would put a warlock on their line.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
        { text = "Right. Something else.", next = "BACK" },
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
        { text = "Then I'll find the proof.", next = "stormwind_proof", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Proof or no proof, I'd stop waiting on the court.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The court has its reasons.", next = "stormwind_court" },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    stormwind_proof = {
      lines = { { id = "sp_default", text = "Plenty have said that, and I've buried most of them, so forgive me if I don't cheer. Come back with something in your hands and I'll cheer as loud as you like." } },
      choices = { { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    stormwind_court = {
      lines = { { id = "sc_default", text = "I'm sure it does, and I'm sure they're excellent reasons when you hear them in a warm room. Fight on two fronts, Windsor used to say: the orcs in front of you and the fools behind you." } },
      choices = {
        { text = "What do you make of the Regent, Marshal?", next = "op_regent" },
        { text = "Careful, Marshal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He wasn't wrong.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
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
        { text = "I'll walk the camp before I go.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { morgans_vigil = 2 } },
          journal = { first = "Marshal Maxwell's soldiers hadn't seen a priest in months. I walked the camp at Morgan's Vigil and blessed them.",
                      third = "{name} walked the camp at Morgan's Vigil, blessing soldiers who hadn't seen a priest in months." } },
        { text = "They're soldiers, and they'll pray when they're ready, not when I say.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Has the Light gone quiet for you too?", next = "priest_quiet" },
      },
    },
    priest_quiet = {
      lines = { { id = "pq_default", text = "I pray when Windsor's name comes up and not much otherwise, and I wouldn't say the Light owes me an answer. If it's listening, tell it we're still here." } },
      choices = {
        { text = "It's listening, Marshal.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I wouldn't count on it, Marshal. The Light's been quiet for a lot of us.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Then the Light has better timing than the Keep. Stand at the front when we go into that mountain, and let the orcs see what's coming." } },
      choices = {
        { text = "Gladly.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { morgans_vigil = 1 } } },
        { text = "I'd rather the orcs never saw me coming, Marshal.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "Then neither will I.", next = "BACK", fx = { trait = { cautious = 1 }, align = { honor = -1 } } },
        { text = "The court's not perfect, but I'll trust it until it fails me.", next = "BACK", fx = { align = { honor = 1 } } },
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
        { text = "I'll hold the wall, Marshal.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, standing = { morgans_vigil = 1 } } },
        { text = "Walls don't win wars. Let me hit them first.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
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
          text = "Your beast might get further than my scouts did, I'll grant you, and it won't talk if they catch it. I won't order anyone into that mountain alone, but if you go, come back with something I can write down." },
      },
      choices = {
        { text = "Orders or not, I'm going.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Then I'll wait for your order, Marshal.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "What happened to Windsor?", next = "windsor" },
      },
    },
  },

  topics = {
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
  },
}

P:NPC {
  key = "helendis", id = TODO_NPC("Helendis Riverhorn"), name = "Helendis Riverhorn",
  bible = "bibles/burningsteppes.md", role = "scholar", tier = "major",
  communities = { "morgans_vigil" }, temper = { "steady", "sharp" }, values = { "wise", "curious" },
  notices = { "race", "class", "form", "pet" },

  impression = {
    first = "Helendis Riverhorn watches the mountain as if it were a page he means to finish reading. He speaks slowly and seems to weigh every person who climbs the ridge.",
    third = "{name} met Helendis Riverhorn, the night elf sent from Darnassus to learn what stirs in the Burning Steppes.",
  },

  greetings = {
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
      text = "Your companion is calm in this heat, which is more than I can say for the Blackrock's worgs. Treat it well; out here it may be the only one who watches your back." },
  },

  start = "hello",
  nodes = {
    op_kaldorei = {
      lines = {
        { id = "opk_default", text = "Some of my elders think so. We hid behind our trees for ten thousand years, and it took the Legion at Hyjal to bring us out. The young races have opinions about that, so tell me yours." },
      },
      choices = {
        { text = "The world needs the kaldorei. I'm glad you came out.", next = "op_ne_glad", fx = { affinity = 1, align = { honor = 1 }, opinion = { night_elves = "admire" } } },
        { text = "Stay in your forests. This isn't your fight.", next = "op_ne_stay", fx = { affinity = -1, align = { honor = -1 }, opinion = { night_elves = "distrust" } } },
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
        { text = "Old wars are best watched by those who remember them. Stay.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The past is past. Your people should tend their own forests.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "As a people someone else is spending, the way a merchant spends coin. Rend feeds them to the war and the black dragons feed on what's left, and every warrior who cuts them down only makes the account a little shorter." } },
      choices = {
        { text = "A soldier fights the foe in front of him, Helendis.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll strike at the masters and let the pawns scatter.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Helendis.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Watched, until we know who arms them, because the Blackrock clan answers to Rend in the Spire and Rend answers to something older that I don't yet understand. To strike blindly at an enemy you don't understand is how wars are lost, and I have lived long enough to see it happen more than once." } },
      choices = {
        { text = "Patience, then. We strike when we understand them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every day we watch, they raid. Strike now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Burning Legion, ten thousand years ago, when the Highborne's magic burned so brightly it was seen from beyond the world. I don't blame you for their sins, but I'd ask you to remember them here, in a land that burned for less." } },
      choices = {
        { text = "Your caution is wise. Magic needs a firm hand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic should be free to grow, whatever the risk.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Helendis.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It saddens me more than it frightens me, because I have read what the fel made of the satyrs and seen what it made of the orcs. Every warlock tells me they hold the leash, and I hope you're the first of them who is right." } },
      choices = {
        { text = "I hold the leash, Helendis. I'll prove it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leashes are for the timid. I'll do as I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's speak of other things.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The dragonkin below this ridge, and the hand that moves them, which I can't yet name. A rogue knows how a master hides behind servants, so watch the whelps closely, and tell me whom they look to." } },
      choices = {
        { text = "I'll watch and report, as Darnassus would wish.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll watch, but what I learn is mine to sell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Helendis.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_kaldorei", tags = { "news" }, when = { party = { race = "NightElf" }, faction = "Alliance" },
          text = "{companion} is of my people, and far from the forests, as I am. It is strange to meet a kaldorei among the ash, but I am glad of it, for the humans here do not understand why I flinch when the mountain breathes fire." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You move like one of our Sentinels, rogue, though I suspect your teachers were less particular about whom you watch." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, among the Alliance. That doesn't sit easily with me, but I've learned to judge people by what they do, and you haven't done anything yet." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. My people learned long ago what the arcane can draw down on a world, so forgive me if I watch your hands while we talk." },
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
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time, and the mountain isn't going anywhere." },
        { id = "h_again2", text = "Ask, then. Questions are how I found everything I know here." },
      },
      choices = {
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
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A beast is a beast, and I won't waste pity on it.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, trait = { skeptical = 1 } } },
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
        { text = "It does. It smells like home.", next = "BACK", fx = { affinity = 2 } },
        { text = "It smells like ambition.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you understand why I can't sleep here. Do what you can for it, druid, even if it's only to walk lightly, because no one else will." } },
      choices = {
        { text = "I'll walk lightly.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Let the Steppes burn. The people at the Vigil matter more to me.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "We kept our magic. We won't apologize for it.", next = "BACK", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "That quarrel is ten thousand years old. Let it rest.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
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

  topics = {
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
    _none = { { id = "tp_none", text = "I know the land, not that. Marshal Maxwell may know, or will pretend to." } },
  },
}

P:NPC {
  key = "oralius", id = TODO_NPC("Oralius"), name = "Oralius",
  bible = "bibles/burningsteppes.md", role = "soldier", tier = "quest",
  communities = { "morgans_vigil" }, temper = { "proud", "excitable" }, values = { "loyal", "brave" },
  notices = { "class", "race", "kit" },

  impression = {
    first = "Oralius barks orders like a field marshal and argues with a pirate named Captain Winky whom I never quite saw. His enthusiasm for the war is boundless, and a little alarming.",
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
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The Blackrock, of course, and the sooner the better! Call your lightning down on their camps, soldier, and I'll tell Winky he was wrong, which he'll hate." } },
      choices = {
        { text = "I'll strike where the Vigil needs me, and not before.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll strike where the storm takes me, wherever that is.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I'll report every movement exactly as I see it, sir.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Scouts work best without orders, sir. I'll follow the trail.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Permission to ask something else, sir.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Phase one, soldier: set fire to Dreadmaul Rock. Phase two: set fire to it again, harder, because the ogres don't seem to have noticed the first time, and Winky says they're slow learners." } },
      choices = {
        { text = "Yes, sir! Fire at will, sir!", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll pick my own targets, Oralius, thank you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Next item, sir.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Enlist them, drill them and give them a uniform, soldier, though the imp will need a very small one. Every Firegut ogre on Dreadmaul Rock is an enemy of the Vigil, and I'm not fussy about who helps me with them." } },
      choices = {
        { text = "My demons serve the Vigil, sir!", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demons serve me, not the Vigil.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, sir.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "My second in command, soldier, and a fine tactician when he isn't sulking, though some of the men claim they've never seen him. Now, a druid who can turn into a bear and charge a Blackrock line is exactly what this campaign needs, and I'll hear no argument about it." } },
      choices = {
        { text = "I'll fight beside you, Oralius, but on my own terms.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Give me my orders, and I'll charge where I'm told.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Firegut", min = 30 } }, text = "There's Firegut blood on you at last, soldier, and plenty of it by the reports. Dreadmaul Rock is feeling it, so don't stop now." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Winky says we oughtn't to enlist demons, soldier, but Winky also says the moon is a cheese, so I've stopped listening to Winky." },
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
      },
      again = {
        { id = "h_again", text = "Anything else, soldier? Speak up, because Winky's listening and he's a terrible gossip." },
        { id = "h_again2", text = "Next item on the agenda! Quickly now, {g:lad|lass}, the war won't wait." },
      },
      choices = {
        { text = "Who's Captain Winky?", next = "winky" },
        { text = "What are my orders, sir?", next = "orders" },
        { text = "What's that thing you keep holding to your ear?", next = "ear" },
        { text = "You must have served somewhere before the Vigil, sir.", next = "served" },
        { text = "Reporting for duty, sir!", next = "salute", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Are you well, Oralius? The Light can ease a troubled mind.", next = "priest", when = { class = "PRIEST" } },
        { text = "Does Captain Winky need a rogue on his crew?", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "What would you have your artillery do, sir?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you really enlist my demons, sir?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
      lines = { { id = "ot_default", text = "Gruesome is a weapon like any other, soldier, and ogres frighten more easily than you'd think from looking at them. One head on one stick saves a hundred arrows, and Winky agrees, for once." } },
      choices = {
        { text = "Not my problem, then.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather fight them honestly.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
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
        { text = "Yes, sir.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't take orders from you, friend.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Prayers are wasted on a man who isn't troubled.", next = "BACK", fx = { align = { light = -1 } } },
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
    first = "Jalinda Sprig jumps at every noise, and on a ridge where everything is on fire I can't really blame her. She leads her expedition anyway, and she worries over her mages like a mother.",
    third = "{name} met Jalinda Sprig, the jumpy leader of the expedition trying to reach Blackrock Depths.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Oh, you startled me. By my count about eighty percent of everything up here is on fire and the rest is about to be, so I've become rather jumpy." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you're not even singed! Well, not very singed, perhaps two or three percent at the cuffs." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Oh, please be careful near the mountain; five of mine went in, and every one of them came back with their hair burned off, or worse." },
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
        { text = "I'll ask the fire to stand aside before I fight it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "This fire serves Ragnaros. I'll break it, not bargain.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Overmaster Pyron guards the quarry inside the mountain, and he's a fire elemental, and he burned three of my mages before we'd even seen him properly. If you can get close enough to put him out, you'll have done what my whole expedition couldn't." } },
      choices = {
        { text = "I'll go in for your mages. Nobody should burn for nothing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll do it, but for my own reasons, not theirs.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "I'll guard my beast as carefully as you guard your mages.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a tool. If it burns, I'll find another.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jalinda.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Would you? Everyone who goes near the quarry comes back singed, but perhaps someone who doesn't glow and doesn't shout would get closer. Just count the fire elementals for me, and if you can tell me where Pyron stands, I'll sleep a little better." } },
      choices = {
        { text = "I'll count them all and come back unsinged.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Scouting costs, and the expedition will have to pay for it.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "My imps don't mind fire, Jalinda.", next = "k_lock", when = { class = "WARLOCK" } },
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
        { id = "mn_default", text = "Please don't, not up here. If even half the stories are true, he's the Firelord, and the Dark Irons called him up out of the earth and he's never gone back down." },
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
        { text = "I'll see to them now.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, standing = { morgans_vigil = 1 } } },
        { text = "If they'd rather pretend, let them; pain teaches its own lessons.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "No, they don't, do they? I've thought about it, I'll admit, sending something that won't burn through the door first. But Marshal Maxwell would have my hide, and my mages would have the rest, and I'm not sure they'd be wrong." },
        { id = "xlk_gnome", when = { race = "Gnome" },
          text = "No, they don't, and I've thought about asking you gnome warlocks for exactly that, since we're all scraping by on whatever works since Gnomeregan. But Maxwell would have my hide, and I'm not sure he'd be wrong." },
      },
      choices = {
        { text = "Then let the imps go first. It saves lives.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Maxwell's right. Some help costs too much.", next = "BACK", fx = { align = { light = 1 } } },
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
    dark_iron = { { id = "tp_darkiron", text = "They serve the fire, or the fire owns them, and I'm honestly not sure which is worse." } },
    gnomeregan = {
      { id = "tp_gnomeregan", text = "Gnomeregan was home, and I lost my eyebrows there long before I lost them here. I'd like to see it again, but not until it's safe." },
      { id = "tp_gnomeregan2", when = { race = "Gnome" }, text = "You'll remember it too, then, the halls and the lights. Do you dream about it? I do, nearly every night." },
    },
    dalaran = { { id = "tp_dalaran", text = "The mages in my expedition trained in Dalaran, before it fell. They talk about it all the time, and I try not to listen." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "The black dragons make the ground shake when they fly, and I've measured it. It's terrifying, and fascinating, and I'd rather not measure it again." } },
    thaurissan = { { id = "tp_thaurissan", text = "The ruins of Thaurissan are full of old magic, and my mages are studying it very carefully. I'm studying it from a long way off." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, I'm afraid. Helendis might; he knows a great deal and is very patient about it." } },
  },
}

P:NPC {
  key = "mayara", id = TODO_NPC("Mayara Brightwing"), name = "Mayara Brightwing",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "quest",
  communities = { "morgans_vigil" }, temper = { "sharp", "proud" }, values = { "curious", "greedy" },
  notices = { "class", "origin" },

  impression = {
    first = "Mayara Brightwing catalogues old treasures for a Stormwind count and treats the Dark Irons' ruins like a market stall. She is sharp, proud and plainly enjoying herself.",
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
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "He collects anything rare, and a dwarf who talks to the stone is rarer than an honest goblin. I'd never sell such a thing myself, of course, unless the price was very beautiful." } },
      choices = {
        { text = "My totems aren't trinkets. They're not for sale.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Name the Count's price. I can always carve another.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only the beautiful ones, which rules out most of what the Dark Irons carry today. The old ones, forged before Thaurissan's folly, are works of art, and I'd never let a soldier keep one long enough to use it." } },
      choices = {
        { text = "A weapon's made for a soldier's hand, not a rich man's wall.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the Count pays well, I'll find him all the swords he wants.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "A trophy should belong to the one who earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Bring me the Count's coin and I'll bring him his heads.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only when they come up, and they come up more often than you'd think, since the plague left so many fine things with no one to claim them. The Count pays well for a Silver Hand tabard, and I tell myself it's better in a museum than in a ghoul's hands." } },
      choices = {
        { text = "Those relics belong to the order, not to a count.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better a museum than a ghoul's hands. You're right.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some do, faintly, like a warm stone after the sun goes down, and the Count likes those best. I've no talent for it myself, so I lick my finger and hold it over them, which works about as well as you'd expect." } },
      choices = {
        { text = "Relics belong with scholars, not on a count's table.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Finders keepers, my lady. The Count found them first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, a Dark Iron chalice that whispered at night, and he kept it in the guest wing until the guests stopped coming. It went back into a vault, and I'm under strict instructions to bring home nothing that talks." } },
      choices = {
        { text = "Dark relics should be destroyed, not displayed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A whispering chalice? I'd have kept it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Someone will take them, darling, and better a man who'll dust them than an orc who'll melt them. I know your people bury things and let them lie, but the Dark Irons left these to burn, and I'm only rescuing them." } },
      choices = {
        { text = "Leave them in the ash. The dead's treasures belong to the dead.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better in a collection than melted down. Rescue what you can.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock? Do keep your imp away from the porcelain, because it's older than Stormwind, and so, apparently, is my patience with imps." },
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
        { text = "It doesn't mind sincerity either.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Haste suits me, and the Light can wait until the fighting's done.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "I'm sure it is, darling, though I suspect your methods involve fewer letters of introduction. The Count pays for provenance; he likes to know a thing was found and not lifted, so do tell me which you'd call it." },
      },
      choices = {
        { text = "Found. Always found.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1, trait = { witty = 1 } } },
        { text = "Lifted, from people who'd earned it.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
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
  notices = { "race", "mount" },

  impression = {
    first = "Borgus Stoutarm fusses over his gryphons and their sooty feathers more than over any traveler. He knows which bird is in a good mood, and he tells me so whether I ask or not.",
    third = "{name} met Borgus Stoutarm, the dwarf who keeps the gryphons of Morgan's Vigil.",
  },

  greetings = {
    { id = "g_op_kaldorei", when = { gossip = { topic = "night_elves", stance = "distrust" } }, text = "Helendis says ye told him tae go back tae his forests. He took it well, for an elf, which means he's said nothin' tae anyone for two days." },
    { id = "g_default", text = "Need a bird? Mind the ash; they hate it on their feathers." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. The birds remember ye, which is more than they do for most." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ah, a proper dwarf! Ye'll know how to sit a gryphon without squeezin' the life out of it, unlike some I could name." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Feel them? They fuss at every storm before I see a cloud, so aye, I'd say they do. They've taken tae ye better than tae most, which tells me more than any priest could." } },
      choices = {
        { text = "Then I'll ask the wind to go easy on them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Gryphons have flown through worse. A little ash won't kill them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, the Wildhammer do it all the time up in the Hinterlands, but my birds are for the post an' the road home. When the Blackrock come over the ridge, though, I've seen my lads dive at them on their own, an' I've never been so proud o' anythin' wi' feathers." } },
      choices = {
        { text = "Leave the fighting to us, Borgus. Your birds have done enough.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Train them for war. Talons like that are wasted on the post.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Good birds deserve good food, Borgus. Keep spoiling them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fish from Lakeshire? Feed them worg meat and save the coin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They come for the gryphons, mostly, because a bird downed is a message that never reaches Lakeshire. Marshal Maxwell says we hold the ridge for honour an' for Stormwind, an' I say we hold it for the birds, but it comes tae the same thing." } },
      choices = {
        { text = "It's honour that holds the ridge. Remember that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Holding it for the birds is reason enough, Borgus.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I'll count aloud, an' each one had a name an' a temper o' its own. I bury 'em up on the ridge facin' Ironforge, an' I'll tell ye honestly that I say a prayer over every one, though I'd thump any soldier who laughed." } },
      choices = {
        { text = "No one should laugh. A faithful creature deserves a prayer.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's a war. Mourn later, Borgus, and keep them flying.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They don't mind ye, exactly, they sneeze at ye, for the arcane tickles their beaks somethin' awful. Stand downwind an' ye'll be fine, an' don't go castin' anythin' mid-flight, or ye'll find out what a sneezin' gryphon does at a thousand feet." } },
      choices = {
        { text = "I'll keep my hands still. Your birds come first.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they sneeze, they sneeze. I'll cast what I need.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ye get a beak in the ear, if ye're lucky, an' a talon in the backside if ye're not. Walk up loud an' honest, the way ye'd walk up tae a dwarf in a tavern, an' they'll carry ye anywhere." } },
      choices = {
        { text = "Loud and honest, then. Your birds deserve respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sneaking's a hard habit to break. I'll take my chances.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, if anyone could, because I've tried everything from oil to bathin' them in water I had carried up special from Lakeshire, an' they hated the bath. A druid could talk to them, maybe, an' tell them it's for their own good, because they won't believe it from me." } },
      choices = {
        { text = "Your birds should be kept somewhere cleaner than this, Borgus.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Vigil needs them. Keep them flying and keep them clean.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Aye, once the demon's gone an' the smell's faded a bit, which takes longer than ye'd think. They've enough tae fear in these skies wi' the black dragons an' the Blackrock arrows, so I'll no' have them frightened on their own perch." } },
      choices = {
        { text = "I'll put it away. The birds come first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon's none of your birds' business, Borgus.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Borgus.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, eh? The birds can smell a demon a mile off, an' they'll no' let ye near if yer pet's out, so tuck it away before ye come up tae the perch." },
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! Now there's a sight, and me birds have been sneezin' ash all mornin', so if ye know a trick for that I'd hear it gladly." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Then ask the wind tae stop blowin' ash in my birds' eyes, an' I'll fly ye anywhere for nothin', which I've never offered anyone." },
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
        { text = "Will your gryphons carry a warlock at all, Borgus?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your gryphons feel the spirits, Borgus?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    _none = { { id = "tp_none", text = "I fly birds. Ask the Marshal about the rest." } },
  },
}
