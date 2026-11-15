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
    { id = "g_default", text = "Another Alliance face this far north? That's the best news I've had all week." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the mountain in one piece, I see. Pull up a crate; it's the only furniture we have." },
    { id = "g_deputy", when = { questDone = TODO_QUEST("The True Masters") }, text = "Deputy. Sit down and tell me what the Steppes did to you today." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The mountain glows brighter after dark, and so do the orcs' fires. Keep your voice down." },
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
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marshal Maxwell, commanding what's left of Stormwind's presence in the Burning Steppes. We hold this ridge, we watch the mountain, and we write reports that nobody in the capital reads." },
        { id = "h_masters", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "You're carrying the True Masters business, I see; Solomon's letters and the Highlord's seal always end up at my fire sooner or later. Sit, and I'll tell you how many have come before you." },
        { id = "h_windsor_go", tags = { "news" }, when = { questActive = TODO_QUEST("Marshal Windsor") },
          text = "If John's tale holds a single grain of truth, Windsor is sitting in a Dark Iron cell under that mountain. Go and find out, deputy, and bring me something I can put in a report." },
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
      },
      again = {
        { id = "h_again", text = "What else, deputy? I've got a report to write, but it'll keep; they always do." },
        { id = "h_again2", text = "Go on. Out here a conversation is the only luxury we've got left." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away. The orcs won't move before dawn, and neither will I." },
      },
      choices = {
        { text = "What happened to Marshal Windsor?", next = "windsor" },
        { text = "What are you up against out here?", next = "enemy" },
        { text = "Why won't Stormwind send more soldiers?", next = "stormwind" },
        { text = "Who else holds this camp?", next = "vigil" },
        { text = "Your soldiers look like they need a healer.", next = "priest", when = { class = "PRIEST" } },
        { text = "The Light sends you one more paladin, Marshal.", next = "paladin", when = { class = "PALADIN" } },
        { text = "My people owe the Dark Irons a debt.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Windsor's alive. I saw him in the Depths.", next = "windsor_alive", when = { questDone = TODO_QUEST("Marshal Windsor") } },
        { text = "Bijou's map names their master: Nefarian.", next = "nefarian", when = { questDone = TODO_QUEST("Message to Maxwell") } },
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
        { text = "What kind of man was he?", next = "windsor_man" },
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
        { text = "Fair enough. Something else.", next = "BACK" },
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
        { text = "Who commands the Spire?", next = "enemy_spire" },
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
          text = "Helendis found the answer before Windsor did: the black dragonflight is driving the Blackrock, feeding their rage and pointing it at Redridge. Orcs don't plan like this on their own, and these ones plan very well indeed." },
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
        { text = "Careful, Marshal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He wasn't wrong.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
      },
    },

    vigil = {
      lines = {
        { id = "v_default", text = "Helendis Riverhorn, who reads this land like a book and found the first proof of the dragons; Jalinda Sprig and what's left of her mages; a lady from Stormwind hunting treasures for a count; and Oralius, who fought harder than any of us before the Steppes got into his head." },
      },
      choices = {
        { text = "What's wrong with Oralius?", next = "vigil_oralius" },
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
    { id = "g_default", text = "Ishnu-alah. Mind the edge of the ridge; the ground is softer than it looks." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good; I have been reading the smoke over the mountain, and I'd welcome another pair of eyes." },
    { id = "g_proved", when = { questDone = TODO_QUEST("Dragonkin Menace") }, text = "The dragonkin below the ridge remember you now. So do I." },
  },

  notice = {
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Another of the Kaldorei, this far from the forests? The Steppes are hard on our kind, and I'm glad of the company." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You'll feel it more than the others do, I think: the land here isn't dead, it's in pain, and it has been for two hundred years." },
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel", "moonkin" } },
      text = "Cenarius's gifts, here of all places. Keep that shape near the ridge and the worgs will think twice before they come close." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "beast" } },
      text = "Your companion is calm in this heat, which is more than I can say for the Blackrock's worgs. Treat it well; out here it may be the only one who watches your back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Helendis Riverhorn, sent from Darnassus to learn what is happening in these mountains. Life in the Steppes is all conflict, and I have spent a long while working out who profits from it." },
        { id = "h_menace", when = { questActive = TODO_QUEST("Dragonkin Menace") },
          text = "The dragonkin below the ridge are bolder every day, and I can't tell you more until I know you can stand against them. Thin their numbers, and then we'll speak of the rest." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "Whatever stage of that business you've reached, remember that the letter began here, on this ridge. The Magistrate is an honest man, and I trust honest men to finish what I start." },
        { id = "h_halycon", when = { questActive = TODO_QUEST("Put Her Down") },
          text = "Halycon, the orcs call her, the mother of their worgs. Find her in the Spire and end it, and try not to hate the creature for what was done to it." },
        { id = "h_halycon_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Put Her Down"), days = 5 } },
          text = "The worgs on the road are fewer this week. It was a mercy, {name}, whatever it felt like in the Spire." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time, and the mountain isn't going anywhere." },
        { id = "h_again2", text = "Ask, then. Questions are how I found everything I know here." },
      },
      choices = {
        { text = "What happened to this land?", next = "ruins" },
        { text = "Why are the dragonkin here?", next = "dragons" },
        { text = "Where do the Blackrock get their worgs?", next = "worgs" },
        { text = "Why would Darnassus care about these mountains?", next = "why" },
        { text = "You're far from the forests, brother.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I can feel the land here. It hurts.", next = "druid", when = { class = "DRUID" } },
        { text = "Is it right to pity the beasts we kill?", next = "pity", when = { class = { "PRIEST", "HUNTER" } } },
        { text = "Solomon took your letter all the way to the Regent.", next = "letter_news", when = { questDone = TODO_QUEST("The True Masters") } },
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
        { text = "Does Stormwind know this?", next = "dragons_letter" },
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
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
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
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I have read these mountains for a long while, and they have told me a good deal. Ask me about any of these, and I'll tell you what I can prove." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll share what I suspect as well as what I can prove. Here is what I can speak to." },
    },
    background = { { id = "tp_bg", text = "A scout of Darnassus, by training a reader of old places. The Steppes are the oldest wound I've ever been asked to read.", next = "ruins" } },
    advice = { { id = "tp_ad", text = "Watch where the whelps fly when the drakes call them, and you'll learn where the drakes nest. Animals always tell you the truth before people do." } },
    black_dragonflight = { { id = "tp_dragons", text = "The true masters of the Blackrock, as I wrote to Lakeshire. I'd be glad to be wrong, but I am not.", next = "dragons" } },
    blackrock = { { id = "tp_blackrock", text = "Savage, yes, but savage on someone else's orders. That's what makes them dangerous now." } },
    thaurissan = { { id = "tp_thaurissan", text = "The Dark Iron city that woke the fire. Its ruins lie north of here, and something in them still whispers to anyone who touches the stones." } },
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
    { id = "g_default", text = "Stand at attention when you approach, soldier! Winky, look sharp, we've got company." },
    { id = "g_back", when = { metBefore = true }, text = "Soldier! Back on the ridge and reporting, are we? Good, good, because Winky's been telling lies about you again." },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Oralius, of the Vigil, and the only one here who keeps his head about him, whatever Captain Winky says. We strike the enemy before the enemy strikes us, soldier, and today is a striking sort of day." },
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
      },
      again = {
        { id = "h_again", text = "Anything else, soldier? Speak up, because Winky's listening and he's a terrible gossip." },
        { id = "h_again2", text = "Next item on the agenda! Quickly now, the war won't wait." },
      },
      choices = {
        { text = "Who's Captain Winky?", next = "winky" },
        { text = "What are my orders, sir?", next = "orders" },
        { text = "What's the ogre ear for?", next = "ear" },
        { text = "Where did you serve before the Vigil?", next = "served" },
        { text = "Reporting for duty, sir!", next = "salute", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Are you well, Oralius? The Light can ease a troubled mind.", next = "priest", when = { class = "PRIEST" } },
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
        { text = "Fair enough.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "Was it bad, wherever it was?", next = "served_bad", fx = { trait = { kind = 1 } } },
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
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Intelligence, soldier, I've got it coming out of my ears, and Winky's got the rest. Ask me about any of this and keep your voice down." },
    },
    background = { { id = "tp_bg", text = "A soldier, soldier, which is all you need to know and all the Marshal knows too. Winky says otherwise, but Winky would.", next = "served" } },
    advice = { { id = "tp_ad", text = "Always keep a horn handy and a head on a pike, soldier. You'd be amazed how many problems one or the other solves." } },
    firegut = { { id = "tp_firegut", text = "Big, blue, stupid and frightened of their own shadows, once you know which shadow to show them.", next = "orders" } },
    blackrock = { { id = "tp_blackrock", text = "They wear medallions like they're proud of something, soldier. Bring me fifty and we'll find out what." } },
    _none = { { id = "tp_none", text = "That's classified, soldier, and Winky can stop laughing right now." } },
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
    { id = "g_default", text = "Oh! Oh, you startled me. Everything up here is either on fire or about to be, so I've become rather jumpy." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you're not even singed! Well, not very singed." },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jalinda Sprig. I lead the expedition that's meant to get into Blackrock Depths, which is going very badly, because everything that guards the way in is made of fire." },
        { id = "h_pyron", when = { questActive = TODO_QUEST("Overmaster Pyron") },
          text = "Overmaster Pyron guards the quarry at the mountain's foot, and every time we try to get past him we lose eyebrows. Please, please be careful." },
        { id = "h_incendius", tags = { "news" }, when = { questActive = TODO_QUEST("Incendius!") },
          text = "Incendius keeps raising Pyron from the ashes, and they say Incendius serves the one under the mountain. Oh dear, oh dear, I really wish I hadn't said that out loud." },
        { id = "h_rag", tags = { "news" }, when = { questRecent = { TODO_QUEST("Incendius!"), days = 7 } },
          text = "You're sure he said that name as he died? I haven't slept since you told me, and I keep thinking the ground is warmer than it was yesterday." },
      },
      again = {
        { id = "h_again", text = "What else? Sorry, I'm a little scattered today; something exploded earlier, and it wasn't even ours." },
        { id = "h_again2", text = "Go on, I'm listening, I promise. I'm only looking at the mountain because it keeps looking at me." },
      },
      choices = {
        { text = "What happened to your mages?", next = "mages" },
        { text = "What's inside the mountain?", next = "mountain" },
        { text = "Why would a gnome come up here?", next = "why" },
        { text = "Any advice for a mage near that much fire?", next = "mage", when = { class = "MAGE" } },
        { text = "Do you ever think of Gnomeregan?", next = "gnome", when = { race = "Gnome" } },
        { text = "Let me look at your mages' burns.", next = "priest", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
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
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I've taken measurements of nearly everything around here, though not all of it was wise. Ask me about any of these, if you like." },
    },
    background = { { id = "tp_bg", text = "A gnome of Gnomeregan who now measures volcanoes for a living. I don't recommend the career, if I'm honest.", next = "why" } },
    advice = { { id = "tp_ad", text = "Carry water, carry more water, and if anything made of fire starts talking to you, don't answer it." } },
    blackrock_depths = { { id = "tp_depths", text = "The Dark Iron city, built into the mountain's heart. My expedition was meant to go in, but the fire elementals had other ideas.", next = "mountain" } },
    dark_iron = { { id = "tp_darkiron", text = "They serve the fire, or the fire owns them, and I'm honestly not sure which is worse." } },
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
    hello = {
      lines = {
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
      },
      again = {
        { id = "h_again", text = "What else? I'm cataloguing, but I can talk and count at the same time." },
        { id = "h_again2", text = "Go on. I've had no one to talk to but Oralius and his pirate for a week." },
      },
      choices = {
        { text = "What brings a Stormwind lady to the Steppes?", next = "errand" },
        { text = "What did you find in Thaurissan?", next = "ruins" },
        { text = "What does Marshal Maxwell make of you?", next = "maxwell" },
        { text = "The Spire's no place to go shopping.", next = "spire" },
        { text = "My family dines with the Ridgewells.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "The Light keeps you alive, you said?", next = "priest", when = { class = "PRIEST" } },
        { text = "Good luck with the hunt.", next = "END" },
      },
    },

    errand = {
      lines = { { id = "e_default", text = "The Count sent me to scout the ruined city of Thaurissan for pieces worthy of his family's museum. He'd come himself, he says, if the Steppes weren't so dreadfully far from his tailor." } },
      choices = {
        { text = "Isn't this grave-robbing?", next = "errand_robbing" },
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
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "In my line of work you learn what's worth knowing and forget the rest. These are worth knowing." },
    },
    background = { { id = "tp_bg", text = "I find things for people who'd rather not get their own boots dirty. The Count is the best of them, because he pays on time.", next = "errand" } },
    advice = { { id = "tp_ad", text = "Never pick up anything that hums, and never sell anything the day you find it. Both lessons cost me dearly." } },
    thaurissan = { { id = "tp_thaurissan", text = "A dead city full of beautiful things and unhappy voices. I took the first and left the second.", next = "ruins" } },
    blackrock_spire = { { id = "tp_spire", text = "A vault with orcs in it. That's all a fortress ever is, if you think about it.", next = "spire" } },
    _none = { { id = "tp_none", text = "If it isn't old and it isn't valuable, I'm afraid I haven't paid it any attention." } },
  },
}

P:NPC {
  key = "borgus", id = TODO_NPC("Borgus Stoutarm"), name = "Borgus Stoutarm",
  bible = "bibles/burningsteppes.md", role = "flightmaster", tier = "service",
  communities = { "morgans_vigil" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race", "mount" },

  impression = {
    first = "Borgus Stoutarm fusses over his gryphons and their sooty feathers more than over any traveler. He knows which bird is in a good mood, and that seems to be what matters most to him.",
    third = "{name} met Borgus Stoutarm, the dwarf who keeps the gryphons of Morgan's Vigil.",
  },

  greetings = {
    { id = "g_default", text = "Need a bird? Mind the ash; they hate it on their feathers." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. The birds remember ye, which is more than they do for most." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ah, a proper dwarf! Ye'll know how to sit a gryphon without squeezin' the life out of it, unlike some I could name." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Borgus Stoutarm, and these are the Vigil's gryphons, the finest birds that ever choked on volcano smoke. Tell me where ye're going and I'll find ye one that's in a good mood." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night flights over the Steppes are a sight, with the whole mountain glowin' red below ye. Hold on tight, mind; the hot air throws the birds about." },
      },
      again = { { id = "h_again", text = "Anything else, or are ye flyin'?" } },
      choices = {
        { text = "Where can your gryphons take me?", next = "routes" },
        { text = "How do the birds stand the heat?", next = "heat" },
        { text = "Show me the routes.", next = "BUSINESS" },
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
    _none = { { id = "tp_none", text = "I fly birds. Ask the Marshal about the rest." } },
  },
}
