-- Stonard: the Horde's fortress in the Swamp of Sorrows. Voice: bibles/swampofsorrows.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ruag", id = TODO_NPC("Dispatch Commander Ruag"), name = "Dispatch Commander Ruag",
  bible = "bibles/swampofsorrows.md", role = "soldier", tier = "major",
  communities = { "stonard" }, temper = { "methodical" }, values = { "dutiful", "practical" },
  notices = { "kit", "class" },

  impression = {
    first = "Dispatch Commander Ruag sends scouts into the swamp and counts what comes back. He keeps the old business at Thrall's Grasp close, and plainly wishes he could forget it.",
    third = "{name} met Dispatch Commander Ruag, who directs the Horde's scouts from Stonard in the Swamp of Sorrows.",
  },

  greetings = {
    { id = "g_op_demons", when = { gossip = { topic = "demons", stance = "hate" } }, text = "Fel'zerul says you told him you don't trust anyone who deals with demons, him included. He wasn't offended, and that should make you wonder about Fel'zerul." },
    { id = "g_op_horde", when = { opinion = { topic = "horde", stance = "distrust" } }, text = "There's talk you think the tauren pay for the orcs' wars. Thrall's Grasp was mostly tauren, so I can't tell you you're wrong, and I wish I could." },
    { id = "g_hall", text = "Another pair of boots, good. I send them out, and the swamp sends back what's left of the maps, but the Horde has never been short of the brave." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and dry-ish, so report." },
    { id = "g_portal_resolved", when = { thread = { id = "portal_watch", state = "resolved" } }, text = "My scouts say the stones near the Portal stayed cold again this week, and I've written it in the log. Now tell me what the swamp's done since you left." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You've been gone {away}, and the swamp kept sending back my maps without you. Report, and then get out there again." },
    { id = "g_away_long", when = { away = 60 }, text = "I'd struck your name off the roster after {away} away. Since you're standing in my hall I'll write it back in, so don't make me regret it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown harder since we last spoke, and the swamp will find you harder to swallow. Good, because I've worse places to send you." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you put the fear into someone in Stonard. We've enemies enough in this swamp without you making more inside the walls." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Stonard's been talking about what you did for us. I'll write that down, and I don't write down much that's good." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Mud to the knees and armor in pieces, so you've been doing real work. Get mended." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! I need eyes that read tracks in mud, and my scouts would be glad of the company." },
  },

  start = "hello",
  nodes = {
    op_peace = {
      lines = {
        { id = "opp_default", text = "That's the question every grunt in Stonard argues over the fire, and it's never once been settled by the time the fire goes out. Some say the Warchief's peace with Theramore is wisdom and some say it's a debt the humans will never pay. Which side of the fire do you sit on?" },
      },
      choices = {
        { text = "The peace is worth keeping. We've all bled enough.", next = "op_peace_for", fx = { affinity = 1, align = { order = 1 }, opinion = { peace = "for" } } },
        { text = "The humans will break it first, so we should strike first.", next = "op_peace_war", fx = { align = { order = -1 }, trait = { stern = 1 }, opinion = { peace = "war" } } },
        { text = "Lady Proudmoore keeps faith. I'd not trust the rest of them.", next = "op_peace_mixed", fx = { opinion = { jaina = "trust", peace = "mixed" } } },
        { text = "Peace with the living means nothing to the Forsaken.", next = "op_peace_war", fx = { opinion = { peace = "war", humans = "hate" } }, when = { race = "Scourge" } },
        { text = "I'll leave that for the fire, Commander.", next = "BACK" },
      },
    },
    op_peace_for = {
      lines = {
        { id = "oppf_default", text = "Then you'd get on with my cartographers, who'd rather map a swamp than burn one. I've no objection to a quiet year, so long as the ogres agree to it too." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_peace_war = {
      lines = {
        { id = "oppw_default", text = "I'll write that down as one vote for war, which makes it about even tonight. Stonard was built for a war, so it'll be ready if one comes, but I hope it never does." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_peace_mixed = {
      lines = {
        { id = "oppm_default", text = "Proudmoore's word has held so far, I'll give her that, and Theramore's ships leave our coast alone. It's her neighbours I'd keep a map of." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Then you'll find plenty to fight, because the swamp breeds trouble faster than we can kill it, and Nethergarde's humans think the Horde has no business this side of the mountains. Stonard was built by orcs who stayed when the rest were rounded up into camps, and we don't intend to leave now." } },
      choices = {
        { text = "Stonard should hold, whatever the humans think.", next = "BACK", reply = "It will hold, while I command it. The humans can grumble from Nethergarde all they like.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "This swamp isn't worth Horde blood. Let the humans have it.", next = "BACK", reply = "Let them have it? Our fathers' blood is in these stones, and I'll not hand it to Nethergarde for the asking.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_st = {
      big = true,
      lines = { { id = "xcl_st_default", text = "A scout never rests, but at least now he'll come home with all his blood. Stonard has watched that temple since the day we raised our walls, and I've written more names in the dispatch book for it than for the Alliance." } },
      choices = {
        { text = "Honor their names somewhere better than a dispatch book.", next = "BACK", reply = "Somewhere better, yes. I'll have them carved on the hall stones, where the grunts can see them every day.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Scouts die, Commander. That's what scouts are for.", next = "BACK", reply = "They are, and I've sent enough of them to know it. But a commander who forgets their names soon has none left to send.", fx = { align = { honor = -1 } } },
        { text = "Who else watches the temple besides Stonard?", next = "xcl_st2" },
      },
    },
    xcl_st2 = {
      lines = { { id = "xcl_st2_default", text = "Green dragonkin, if you can believe it, and they've never once asked our leave. My scouts say the dragonkin in the lower halls fight trolls and orcs alike, so I keep my people well clear of them." } },
      choices = {
        { text = "Clear of dragons is sound advice. Something else, Commander.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd send you anywhere I needed a soldier who heals and doesn't scare easily. Thrall's Grasp died in the lands past this swamp with no one to mend them, and I'll not turn away any help the Light sends, whatever face it wears." } },
      choices = {
        { text = "Send me where you need me, Commander.", next = "BACK", reply = "Good. The healers' line on the south road needs you more than the walls do.", fx = { align = { order = 1 } } },
        { text = "I'll choose my own path through the swamp.", next = "BACK", reply = "Your own path, then, but Thrall's Grasp chose theirs too, and the swamp kept them. Choose carefully.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Murlocs in the reeds, crocolisks in the shallows and worse near the Pool of Tears, and none of it shows itself until it has you by the leg. I've lost more scouts to this swamp than to any enemy, and I'd send a warrior with each scout if I had enough." } },
      choices = {
        { text = "Send me out with them. I'll keep them alive.", next = "BACK", reply = "Then you'll go with the next patrol, and I'll expect them all back. Don't make me a liar.", fx = { align = { light = 1 } } },
        { text = "Scouts who can't handle the swamp shouldn't be scouts.", next = "BACK", reply = "Maybe not, but they're the only scouts I've got. Teach them, or keep your opinions to yourself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They say the water around the Pool of Tears is wrong, warm where it should be cold and quiet where it should be loud. I can't put that on a map, but I write it down anyway, because I've learned to listen to what my scouts won't say twice." } },
      choices = {
        { text = "Write it all down, Commander. A good record serves the Horde.", next = "BACK", reply = "I'll write it, every word, and the next commander will thank me. A good record outlives us all.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the records. Send me out to see it myself.", next = "BACK", reply = "See it yourself? Then come back and tell me, so I can write it down. That's how it works here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Some say the Sunken Temple, where the trolls once worshipped a blood god. Others say it was always a sorrowful place. Whatever it is, the water is foul and the beasts grow strange. Find the cause, and Stonard will owe you." } },
      choices = {
        { text = "I'll seek the source and cleanse it.", next = "BACK", reply = "Cleanse it? If you can, the whole swamp will thank you. Few have tried and come back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A foul swamp keeps the Alliance away. Leave it.", next = "BACK", reply = "It does, and I'll not pretend that's no comfort. But the grunts drink this water too.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Something more reliable than a runner, if you've got it. I lose dispatches to murlocs and mud every month, and a message that can't be ambushed on the road would be worth more to me than any fireball." } },
      choices = {
        { text = "Then I'll carry your dispatches myself, and they'll arrive.", next = "BACK", reply = "Then you'll be my most reliable runner, and I'll owe you for it. Don't lose the satchels.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm no courier, Commander. Find another way.", next = "BACK", reply = "No, you're not, and I'll find someone who is. But a dispatch that arrives would save more lives than you know.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Anything that hides, which in this swamp is everything, from the Atal'ai round the temple to the Alliance patrols that come down from Duskwood. I need someone who sees them first and doesn't stop to tell them about it." } },
      choices = {
        { text = "I'll scout for Stonard, Commander. Send me out.", next = "BACK", reply = "Good. Report everything, and I'll see Stonard remembers your name.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I scout for myself first. Stonard gets what's left.", next = "BACK", reply = "What's left, then, and I'll take it gratefully. Just make sure there's something left.", fx = { align = { order = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Faster, maybe, but a spell leaves a trail any Atal'ai priest can follow, and a runner leaves only footprints in the mud. Thrall's Grasp died waiting on orders, and I'll not trust the next ones to anything I can't count." } },
      choices = {
        { text = "Then trust your runners. Speed isn't everything.", next = "BACK", reply = "Speed isn't, no, and I've learned that the hard way. Runners it is, and better ones.", fx = { align = { order = 1 } } },
        { text = "Runners failed you once. Try something new.", next = "BACK", reply = "Something new, aye, and I'll think on it. But I'll not trade one failure for another.", fx = { align = { order = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Horde" },
          text = "Five of you, Horde all, and you've come to Stonard on your own feet, which is more than the reinforcements from Orgrimmar ever manage." },
        { id = "h_cl_st", tags = { "news" }, when = { cleared = "The Temple of Atal'Hakkar", faction = "Horde" }, text = "My scouts came back from the Pool of Tears with nothing to report, and that's never happened before. I'm told it's because you went to the bottom of the Sunken Temple, so I'll stop sending them in pairs." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. I could use one in Stonard, if only to dry out the dispatches before the ink runs, because the swamp gets into everything." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You'd make a better scout than half of mine, because you'd come back with something besides mud on your boots." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Good, because my scouts come back from the deep swamp spooked, and they'd sooner tell a shaman what they felt out there than tell me." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. Thrall's Horde has need of healers in this swamp, and the swamp has need of healing worse than we do." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Stonard's healers are stretched thin between poor Bengor, our wounded runner, and the scouts who come back torn, so if you've a spare hour, the hall could use it." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. I've one already watching the temple for the Warchief, and I'll tell you what I tell him: everything you do in my swamp goes in my log." },
        { id = "h_default", key = true,
          text = "Dispatch Commander Ruag. Stonard is the oldest stone the Horde holds in these lands, raised when we first came through the Portal; from here we scout what nobody has charted, and we send word back faster than anyone else can." },
        { id = "h_aggrogosh", when = { heardLine = "aggrogosh.h_default" },
          text = "You've come from Grom'gol? Aggro'gosh pushes his caravans through jungle and over mountains to reach us. Every one that arrives, I count too." },
        { id = "h_disgraced", tags = { "news" }, when = { questActive = TODO_QUEST("The Disgraced One") },
          text = "You've come asking about Thrall's Grasp; I can see it in your face. That story is still fresh to me, and I'd hoped it would have the decency to fade." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Missing Orders") },
          text = "I relayed those orders, whatever anyone out on that road is implying. Find Bengor in the hall, the one runner who lived, if you want the rest of it, and mind where you stick your nose." },
        { id = "h_talker_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Swamp Talker"), days = 3 } },
          text = "So the orders turned up in a murloc's cave, where they'd been all along. I'll not pretend that's comfort, but at least nobody can say Stonard didn't send them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Stonard's walls need warriors, but my scouts need someone to pull them out of the mud when the swamp turns on them, and that may be your job today." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who calls on the Light. I've sent scouts to strange places, but none ever came back with a report like you." },
      },
      again = {
        { id = "h_again", text = "Next item. Keep it short, grunt; I've dispatches waiting." },
        { id = "h_again2", text = "Go on, I'm writing as you talk." },
      },
      choices = {
        { text = "What do your scouts feel out in the deep swamp?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Stonard need from its spellcasters, Commander?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Something has poisoned this whole swamp.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Why scout a swamp?", next = "scout" },
        { text = "Tell me about Stonard.", next = "stonard" },
        { text = "Have you lost soldiers out here, Commander?", next = "grasp" },
        { text = "Who should I know in Stonard?", next = "people" },
        { text = "Aggro'gosh says his caravans keep getting through.", next = "caravans", when = { heardLine = "aggrogosh.h_default" } },
        { text = "I found the missing orders.", next = "orders_found", when = { questDone = TODO_QUEST("The Swamp Talker") } },
        { text = "An orc built this place? Tell me.", next = "old_horde", when = { race = "Orc" } },
        { text = "I'm a hunter. Send me where the maps go blank.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Trolls built that temple, Commander. Not my kind of troll.", next = "k_troll", when = { race = "Troll" } },
        { text = "This swamp suits my kind, Commander.", next = "k_scourge", when = { race = "Scourge" } },
        { text = "What do your scouts miss out there, Commander?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Magic could carry your messages faster than runners.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "This swamp looks hard on your scouts, Commander.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Would you send a paladin into the swamp, Commander?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "The Sunken Temple is cleared, Commander. Your scouts can rest.", next = "xcl_st", when = { cleared = "The Temple of Atal'Hakkar", faction = "Horde" } },
        { text = "We came to fight for Stonard, Commander.", next = "xpt_company", when = { party = { size = 4 }, faction = "Horde" } },
        { text = "Send me out.", next = "END", fx = { affinity = 1, standing = { stonard = 1 } } },
      },
    },

    scout = {
      big = true,
      lines = {
        { id = "s_default", text = "Because the Dark Portal isn't far, and neither are the ogres or the old temple. A Horde that knows the ground wins fights before they start." },
      },
      choices = {
        { text = "I'd guess little of this swamp is mapped.", next = "scout_maps" },
        { text = "What's beyond the swamp?", next = "scout_portal" },
        { text = "Makes sense.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    scout_maps = {
      lines = {
        { id = "sm_default", text = "Less than I'd like. My wayfinders and cartographers go out with fresh parchment, and they come back with it soaked through or full of crocolisk teeth." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    scout_portal = {
      lines = {
        { id = "sp_default", text = "The Blasted Lands, and the Dark Portal standing dead in the middle of them, and whatever still crawls around it. I sent a regiment down there once, and I don't send anyone lightly now." },
      },
      choices = {
        { text = "Which regiment?", next = "grasp" },
        { text = "Something else.", next = "BACK" },
      },
    },

    stonard = {
      lines = {
        { id = "st_default", text = "The old Horde raised it in the Black Morass after the Dark Portal first opened, which makes it one of the oldest orc towns in Azeroth. It fell with the old Horde, and the new Horde built it back up, great hall and all." },
      },
      choices = {
        { text = "Stonard seems very alone out here.", next = "stonard_rockard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stonard_rockard = {
      lines = {
        { id = "sr_default", text = "It wasn't always, for it had a sister fortress, Rockard, to the south, built in the same days. The Dreadmaul ogres sit in it now and call it their own hold, and I'd like it back one day, though not this week." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    grasp = {
      big = true,
      lines = {
        { id = "g_default", text = "Thrall's Grasp was a regiment sent toward the Blasted Lands, and something there destroyed it. The Horde lost some of its best soldiers in that battalion, and I signed the papers that sent them." },
      },
      choices = {
        { text = "Did something go wrong with your dispatches?", next = "grasp_orders" },
        { text = "That isn't your fault.", next = "grasp_fault", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasp_orders = {
      lines = {
        { id = "go_default", text = "What are you implying? I relayed those orders, and the soldiers who carried them were ambushed by murlocs on the road south. Only one of them lived, if you can call it living, and his name is Bengor." },
      },
      choices = {
        { text = "I'm only asking.", next = "BACK" },
        { text = "Where can I find Bengor?", next = "people" },
      },
    },
    grasp_fault = {
      lines = {
        { id = "gf_default", text = "Maybe not, but it's my desk the papers crossed. A dispatch commander who stops feeling that should hand over his seal." },
      },
      choices = {
        { text = "What keeps you at that desk at night, Commander?", tag = "Persuade", next = "grasp_night",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("The Swamp Talker") }, { trait = "kind" } } } },
          fail = { next = "grasp_dispatch", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    people = {
      lines = {
        { id = "p_default", text = "Fel'zerul watches the sunken temple for the Warchief, Helgrum carries word to Kargath and back, and Bengor is in the hall, though he doesn't say much anymore. Karakul keeps the inn and the scouts fed." },
      },
      choices = {
        { text = "What happened to Bengor?", next = "people_bengor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    people_bengor = {
      lines = {
        { id = "pb_default", text = "A murloc spear went into his skull, and he can hardly speak or walk, and the healers feed him through a tube. He's the only witness to what happened to those orders, so speak to him gently." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    caravans = {
      lines = {
        { id = "c_default", text = "They do, and I count every one twice, once when it's promised and once when it's unloaded. Grom'gol keeps us fed, and we keep the Horde informed, and neither of us gets thanked for it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { standing = { stonard = 1 } } } },
    },
    orders_found = {
      lines = {
        { id = "of_default", text = "Then they lay in the mud the whole time, while nineteen soldiers waited for words that never came. I'm glad my seal is clean, and I wish that made me feel better than it does." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { stonard = 2 } } } },
    },
    old_horde = {
      lines = {
        { id = "oh_default", text = "Our fathers built it when they first came through the Portal, for war and nothing else. We use it to send maps and caravans now, which is the best answer I know to what they made it for." },
      },
      choices = {
        { text = "Will the peace with the humans hold, Commander?", next = "op_peace" },
        { text = "That's a good answer.", next = "BACK", reply = "I think so too. Maps and caravans are a better legacy than war.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Stonard was built for war, and it should stay ready for one.", next = "BACK", reply = "Ready, yes, and it is. But ready isn't the same as wanting it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasp_night = {
      big = true,
      lines = {
        { id = "gn_default", text = "Not the gossip on the road, if that's what you're thinking. I've read those orders over a hundred times in my head, and I still can't tell you whether they'd have saved the regiment if they'd arrived, and that's the question no clean seal answers." },
      },
      choices = {
        { text = "Nobody could answer that, Commander.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then make sure the next orders arrive.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasp_dispatch = {
      lines = {
        { id = "gd_default", text = "Dispatches keep me at my desk, and that's all that goes in the log. Next item." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Good, because that's most of my map. East past the Fallow Sanctuary nobody's charted the ground since the old Horde marched out of here, and my scouts keep coming back with fewer boots than they left with." },
        { id = "xhu_plains", when = { origin = "tauren_plains_runner" },
          text = "A plains runner, out of Mulgore. You'll hate the mud, and you'll be faster in it than any orc I've got, so go east past the Fallow Sanctuary and tell me what's there." },
        { id = "xhu_head", when = { origin = "troll_headhunter" },
          text = "A Darkspear headhunter. The Atal'ai have heads you might want, but I want maps first, so go east past the Fallow Sanctuary and come back with both." },
      },
      choices = {
        { text = "I'll map it and come back.", next = "BACK", reply = "Good, and I'll pin it on the wall beside the others. Come back safe.", fx = { align = { order = 1 }, affinity = 2, standing = { stonard = 1 } } },
        { text = "I'll go where the hunting takes me, Commander.", next = "BACK", reply = "Where the hunting takes you, then, and bring the map back with you. That's all I ask.", fx = { align = { order = -1 } } },
        { text = "Why scout a swamp at all?", next = "scout" },
      },
    },
    k_troll = {
      big = true,
      lines = {
        { id = "xtr_default", text = "I know that, and so does every orc in Stonard, though some of the grunts need reminding when the Atal'ai come out of the water. Tell me straight, Darkspear: do you feel anything when you look at that temple?" },
        { id = "xtr_echo", when = { origin = "troll_echo_isles" },
          text = "I know that, and I know your people were driven off the Echo Isles by worse than the Atal'ai. Tell me straight: do you feel anything when you look at that temple?" },
      },
      choices = {
        { text = "Only shame. They'd sell us all to Hakkar.", next = "BACK", reply = "Shame, then, and good. The Atal'ai have betrayed every troll who ever trusted them.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "I feel their power. I won't lie about it.", next = "BACK", reply = "Honest, at least, and I'll respect that. Feel it, but don't answer it.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Who were the Atal'ai, to your people?", next = "k_troll_who" },
      },
    },
    k_troll_who = {
      lines = {
        { id = "xtw_default", text = "Ask Fel'zerul, because he's read more of their history than I'd care to. All I know is the Gurubashi threw them out for being too bloody, and when a troll empire calls you too bloody, you've earned the title." },
      },
      choices = { { text = "Something else, Commander.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_scourge = {
      lines = {
        { id = "xsc_default", text = "So I hear from the Forsaken who come through, and I'll admit it's useful having scouts who don't mind the leeches. Don't take the boats out alone, though; the crocolisks don't care what you're made of." },
        { id = "xsc_soldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "A soldier, once, by how you stand. Lordaeron's swamps were nothing like this, I'm told, but a scout's a scout, and the crocolisks don't care what you're made of." },
      },
      choices = {
        { text = "The swamp and I will get along fine.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Use me where the living can't go, Commander.", next = "BACK", fx = { affinity = 2, standing = { stonard = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every report in Stonard crosses my desk, so I know a little about most things in this swamp. Ask me about any of these, and keep it short." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get what's in the public log and nothing more, so choose one and be brief." },
    },
    background = { { id = "tp_ba", text = "I command dispatches, which means I read every report and sign every order in Stonard. My story is in those papers, and it's dull until something goes wrong.", next = "grasp" } },
    advice = { { id = "tp_ad", text = "Carry your orders against your skin, never in a pack. Packs get lost in the swamp, and so do the people carrying them." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's name is on a regiment that died in this swamp, and I sign the reports that keep it from happening twice. He deserves better than another Thrall's Grasp, and I'll see he gets it." } },
    second_war = { { id = "tp_second_war", text = "Stonard has been an orc fort since the old Horde held this swamp, and that Horde didn't care what it burned. We've kept the walls and thrown away the rest." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai in the Sunken Temple are up to something, and Fel'zerul feels it in his bones. I've doubled the scouts on the lake road, and I'd triple them if I had the bodies." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Forsaken send couriers through here now, and they're the quickest in the Horde because they don't stop to eat. I don't like them, but I sign their papers." } },
    dark_portal = {
      { id = "tp_dark_portal", text = "The Dark Portal is just south of us, past the Blasted Lands, and Nethergarde sits on top of it with a hundred mages. Every orc in Stonard remembers coming through it." },
      { id = "tp_dark_portal2", when = { race = "Orc" }, text = "You've heard the stories from the old ones about coming through the Portal, I'd wager, and some of them still dream about it. I don't, and I'm glad." },
    },
    voljin = { { id = "tp_voljin", text = "Vol'jin's trolls are good in the swamp, better than any orc. I'd take ten of them for every grunt the Warchief sends me." } },
    _none = { { id = "tp_none", text = "That's not charted yet. Do you want the job, or are you all talk?" } },
  },
}

P:NPC {
  key = "felzerul", id = TODO_NPC("Fel'zerul"), name = "Fel'zerul",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "grim" }, values = { "loyal", "sharp" },
  notices = { "class" },

  impression = {
    first = "Fel'zerul watches the sunken temple the way some people watch a sleeping beast. Whatever stirs beneath the Pool of Tears, he has felt it, and he doesn't like it.",
    third = "{name} met Fel'zerul, sent by the Warchief to watch the Temple of Atal'Hakkar from Stonard.",
  },

  greetings = {
    { id = "g_temple", text = "You feel it too? The swamp hums near the Pool of Tears, because something old is awake down there." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the hum near the Pool of Tears has only grown louder. I'm glad someone came back to hear it with me." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told someone here caught you lying. Be careful with that, because whatever stirs beneath the Pool of Tears lies better than you ever could." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, then, so you'll know the difference between power you hold and power that holds you. The trolls in that temple forgot it." },
    { id = "n_troll", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You hear the spirits, so you know that down by the temple they aren't speaking, they're screaming." },
  },

  start = "hello",
  nodes = {
    op_demons = {
      lines = {
        { id = "opd_default", text = "You ask a warlock that, standing in front of him? Good, I prefer the honest ones. The shamans say we should be burned, and the young grunts think we're useful, so tell me plainly where you stand." },
      },
      choices = {
        { text = "A warlock who serves the Horde is a weapon. I'll use it.", next = "op_demons_useful", fx = { affinity = 1, align = { light = -1 }, opinion = { demons = "necessary" } } },
        { text = "I trust no one who deals with demons, you included.", next = "op_demons_hate", fx = { align = { light = 1 }, opinion = { demons = "hate" } } },
        { text = "We hold the leash. That's the difference between us and Gul'dan.", next = "op_demons_useful", fx = { affinity = 1, opinion = { demons = "useful" } }, when = { class = "WARLOCK" } },
        { text = "My grandfather drank the demon's blood. I'll not forget it.", next = "op_demons_hate", fx = { opinion = { demons = "dangerous" } }, when = { race = "Orc" } },
        { text = "I'll make up my mind when I've seen more.", next = "BACK" },
      },
    },
    op_demons_useful = {
      lines = {
        { id = "opdu_default", text = "A weapon, yes, and a weapon turns in the hand if you grip it wrong. Remember that the next time you stand behind one of us in a fight." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_demons_hate = {
      lines = {
        { id = "opdh_default", text = "Good, and keep it that way. The day you stop watching a warlock is the day he stops watching himself, and I've seen where that road ends, down in that temple." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_st = {
      big = true,
      lines = { { id = "xcl_st_default", text = "Silent for now, and I'll take silent over singing. The Atal'ai who drowned in that temple were exiles even among their own people, driven out of Zul'Gurub for worshipping the Soulflayer, and exiles make the most stubborn believers." } },
      choices = {
        { text = "Fill the temple with stone so no troll prays there again.", next = "BACK", reply = "Stone, then, and I'll gladly carry the first block. Let the Atal'ai pray to a mountain.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave it to the swamp. Some ruins are best forgotten.", next = "BACK", reply = "Forgotten, aye, until it's remembered by the wrong people. I'll watch it either way.", fx = { align = { order = -1 } } },
        { text = "Why does the Horde care about a drowned troll temple?", next = "xcl_st2" },
      },
    },
    xcl_st2 = {
      lines = { { id = "xcl_st2_default", text = "Because the Darkspear are Horde, and Hakkar hungers for troll blood above every other kind. If the Atal'ai ever woke their god, Vol'jin's people would be the first he called to him, and the Warchief knows it." } },
      choices = {
        { text = "Then the Horde was right to keep watch.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Perhaps. The trolls who built that place served a blood god, and blood gods fear little, but I would rather face the temple with the Light beside me than without it. Whether it answers you as it answers the living, I cannot say." } },
      choices = {
        { text = "It answers me. I'll carry it into the temple.", next = "BACK", reply = "It answers you, does it? Then carry it, and I'll walk behind. Blood gods may fear little, but they fear something.", fx = { align = { light = 1 } } },
        { text = "I trust my blade over any god, Light or blood.", next = "BACK", reply = "Your blade, then, and I hope it's sharp. The Atal'ai don't die easily.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Atal'ai still keep their rites in the drowned halls, and other things guard the deep places that I will not name. A warrior can cut down a priest, but not what the priest prays to, so if you go in, go with others and go prepared." } },
      choices = {
        { text = "I'll go in with a full warband, properly prepared.", next = "BACK", reply = "Properly prepared, yes, and I'll help you plan it. That temple has eaten braver warbands than yours.", fx = { align = { order = 1 } } },
        { text = "I'll go in alone and cut my way through.", next = "BACK", reply = "Alone? Then I'll write your name in the book now and save myself the trouble later.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Wards are the least of it, because the temple was sunk to stop the Atal'ai, and they're still down there chanting. A mage might break a ward, but a ward is only a lock, and I'm more worried about what's behind the door." } },
      choices = {
        { text = "Then leave the door shut. Some things should sleep.", next = "BACK", reply = "Wise. Some things are sleeping for good reason, and I'd rather they stayed that way.", fx = { align = { order = 1 } } },
        { text = "Break the lock. Better to know what's there.", next = "BACK", reply = "Better to know, perhaps, until you know. I'll not stop you, but I'll not follow you either.", fx = { align = { order = -1 } } },
        { text = "Something else, Fel'zerul.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Closer than an orc, at least, since you don't clank and you don't shout, but the Atal'ai have eyes in the water and the trees. Get me a look at the inner rings, and don't touch anything that hums, however much you want to." } },
      choices = {
        { text = "I'll look and touch nothing, as you ask.", next = "BACK", reply = "Good. Look and leave, and come back with what you saw. That's worth more than any trinket.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If it hums, it's worth something. I'll touch it.", next = "BACK", reply = "Then you'll find out why the Atal'ai sank it. Touch nothing, or you'll answer for it.", fx = { align = { order = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The trolls sank that temple to bury what they worshipped, and I believe something green and ancient sleeps down there with it, and that the sleep is sick. Your elders speak of a dream that holds the world's living things, and if that dream has a wound, I think it is here." } },
      choices = {
        { text = "Then the temple must be cleansed, no matter what it costs us.", next = "BACK", reply = "At any cost? You're braver than I am, and perhaps wiser. I'll help where I can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some dreams are best left sleeping. Watch it, but don't wake it.", next = "BACK", reply = "Watch it, yes, and I will. Some sleepers are better left undisturbed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_st", tags = { "news" }, when = { cleared = "The Temple of Atal'Hakkar", faction = "Horde" }, text = "You've walked to the bottom of the Sunken Temple and come back up through the Pool of Tears, and the swamp is quieter for it. I felt the change before the scouts did, the way you feel a fever break." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. Good, because the temple needs someone who can get in and out without the Atal'ai noticing, and nobody I've sent has managed the second part." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. The Atal'ai worked a magic older than anything Dalaran taught, and it called something into this swamp that your fireballs won't send back." },
        { id = "h_default", key = true,
          text = "I am Fel'zerul, and the Warchief sent me to watch the Temple of Atal'Hakkar. The trolls who built it worshipped something terrible, and something there is stirring." },
        { id = "h_pool", tags = { "news" }, when = { questActive = TODO_QUEST("Pool of Tears") },
          text = "The Pool of Tears hides what's left of the temple's outer works. Bring me what the old priests left behind." },
        { id = "h_exile", when = { any = { { questActive = TODO_QUEST("The Atal'ai Exile") }, { questActive = TODO_QUEST("Return to Fel'Zerul") } } },
          text = "One of the Atal'ai was cast out by his own, and an exile knows what the faithful won't say, so find him." },
        { id = "h_temple", when = { questActive = TODO_QUEST("The Temple of Atal'Hakkar") },
          text = "Into the temple, then, and bring enough friends, and then bring more than that." },
        { id = "h_fetishes", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Temple of Atal'Hakkar"), days = 3 } },
          text = "Twenty fetishes, and each one hums like a hornet in a jar. They'll go to Orgrimmar under guard, and I'll sleep better once they're gone." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Steel will not help much against what lies in that temple, but I would rather have you here than not." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A tauren druid. Then you may feel what I feel at the Pool of Tears, something under the water dreaming a dream that is not its own." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "The Light, in a Forsaken body. Strange times bring strange servants, and the temple beneath the Pool of Tears stirs stranger every night." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly; the temple doesn't wait, and the old Horde learned too late what waits for those who listen to whispers." },
        { id = "h_again2", text = "Ask, then, but don't ask me to go down there again tonight." },
      },
      choices = {
        { text = "Do the swamp beasts make good companions, Fel'zerul?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What's stirring?", next = "stirring" },
        { text = "Who were the trolls who built the temple?", next = "atalai" },
        { text = "Why did the Warchief send you here?", next = "warlock" },
        { text = "The exile spoke of a prophecy.", next = "prophecy", when = { any = { { questActive = TODO_QUEST("Return to Fel'Zerul") }, { questDone = TODO_QUEST("Return to Fel'Zerul") } } } },
        { text = "How do you keep your demons leashed?", next = "kin", when = { class = "WARLOCK" } },
        { text = "I'm a troll warlock. Am I the Atal'ai's heir?", next = "troll_warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "The spirits told me what warlocks did to our people.", next = "k_shaman", when = { race = "Orc", class = "SHAMAN" } },
        { text = "A mage could break the temple's wards, I think.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I could get close to the temple unseen.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What lies in the Temple of Atal'Hakkar, Fel'zerul?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you feel under the Pool of Tears, Fel'zerul?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Could the Light help against what stirs in the temple?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "The Atal'ai are broken, Fel'zerul. The temple is silent.", next = "xcl_st", when = { cleared = "The Temple of Atal'Hakkar", faction = "Horde" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },

    stirring = {
      big = true,
      lines = {
        { id = "st_default", text = "We came to look into strange happenings at the temple and found it already sunk beneath the swamp. Whatever magic the Atal'ai worked down there went horribly wrong, and it hasn't finished going wrong yet." },
      },
      choices = {
        { text = "Someone else seems to be guarding it now.", next = "stirring_dragons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stirring_dragons = {
      lines = {
        { id = "sd_default", text = "Green dragons, who say they're the protectors of Azeroth and won't let anyone near. Perhaps they are, but I've never met a guard who told me the whole truth about what he was guarding." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    atalai = {
      lines = {
        { id = "a_default", text = "A tribe of troll priests and dark casters, known for forbidden magic even among their own kind. They built that temple to serve a god, and from the look of it the god served them back badly." },
      },
      choices = {
        { text = "Why study their magic at all?", next = "atalai_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    atalai_use = {
      lines = {
        { id = "au_default", text = "Because powerful spells don't vanish because you look away from them, and the Horde needs to understand them before someone uses them on us. I'd rather a spell be in Orgrimmar's books than in an enemy's hand." },
      },
      choices = {
        { text = "That's how warlocks always start.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    warlock = {
      lines = {
        { id = "w_default", text = "Because I know dark magic when I see it, and I know where it leads. I walked the same road as the Burning Blade, and I stopped where the Warchief told us to stop, and they didn't." },
      },
      choices = {
        { text = "Something must have made you stop.", next = "warlock_stop" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    warlock_stop = {
      lines = {
        { id = "ws_default", text = "Thrall freed us from the camps and from the demons both, and I'd not hand myself back to either. A warlock who serves the Horde has to be stronger than his own hunger, every single day." },
      },
      choices = {
        { text = "Should the Horde trust its warlocks at all?", next = "op_demons" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "burning_blade" } } },
      },
    },

    prophecy = {
      lines = {
        { id = "pr_default", text = "Jammal'an the Prophet teaches that if Hakkar returns from the Nether, the god will grant the Atal'ai immortality. It's foolish trickery to bring on the end of the world early, if you ask me, and the exile knew it." },
      },
      choices = {
        { text = "And the fetishes?", next = "prophecy_fetish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prophecy_fetish = {
      lines = {
        { id = "pf_default", text = "If they're the key to the ritual that sank that temple, they must be taken and understood before Jammal'an finds a use for them. That's what the Horde needs from you down there." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kin = {
      lines = {
        { id = "k_default", text = "On a short leash where I can see it, and I never let one out of my sight while I sleep. Beyond that, every warlock learns alone, because a teacher who tells you he has it mastered is already lost." },
      },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    troll_warlock = {
      lines = {
        { id = "tw_default", text = "No, unless you choose to be. The Atal'ai reached for a god and called it faith; you reach for demons and call it a tool, and you'd better be right about which of you is holding the leash." },
      },
      choices = {
        { text = "I'm right.", next = "BACK", reply = "Then prove it, warlock, and keep proving it. Certainty is the first thing the fel takes.", fx = { align = { order = -1 }, trait = { proud = 1 } } },
        { text = "I'll watch myself.", next = "BACK", reply = "Good. Watching yourself is the whole of the craft.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "The crocolisks make poor friends and worse pets, but the swamp's panthers and jaguars are another story. I've seen hunters tame things here that would make a Stonard grunt run." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "The crocolisks make poor friends and worse pets, but the swamp's panthers and jaguars are another story. Keep {pet} close in the swamp, though, because the panthers here would take it for a rival." },
      },
      choices = {
        { text = "I'll tame what respects me, and leave the rest.", next = "BACK", reply = "What respects you, yes, and it'll serve you well. The strong ones bite the hand that bends them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tame whatever's strongest, respect or not.", next = "BACK", reply = "Strongest, eh? Then you'll learn what strength costs. I hope you keep your hands.", fx = { align = { honor = -1 } } },
      },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "And they would know, I suppose, having been the first to leave us when the fel came. I don't ask your forgiveness, shaman; I ask you to look at that temple and tell me whether you'd rather I watched it, or nobody did." },
        { id = "xsh_thrall", when = { origin = "orc_thrall_shaman" },
          text = "Thrall's own circle taught you, so you'll have heard all the old sins listed. I don't ask your forgiveness; I ask whether you'd rather I watched that temple, or nobody did." },
      },
      choices = {
        { text = "Watch it, then. The Warchief trusts you.", next = "BACK", reply = "I will, and I'll thank you for saying it. Trust is rare between your kind and mine.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nobody should hold that power, not even you.", next = "BACK", reply = "Not even me, perhaps. But someone must watch the dark, and I've already seen it.", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "Why did the Warchief send a warlock?", next = "warlock" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've watched that temple longer than I care to count, and I've learned more than I wanted. Ask me about any of these." },
    },
    burning_blade = { { id = "tp_blade", text = "The Burning Blade are fools. I walked the same road they did, and I stopped where the Warchief told us to stop, but they didn't." } },
    background = { { id = "tp_ba", text = "I'm a warlock in the Warchief's service, sent to watch a temple. What I was before I served him isn't worth the telling.", next = "warlock" } },
    advice = { { id = "tp_ad", text = "If you go into the temple, count your companions on the way down and on the way back up. The Atal'ai have a way of keeping a few." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "Something stirs beneath the Pool of Tears, and the Atal'ai feed it with blood and chanting. I've felt it reach for me in my sleep, and I will not let it find me twice." } },
    thrall = {
      { id = "tp_thrall", text = "The Warchief does not like warlocks, and I don't blame him, for what we did to our own people. But he sent me here, and I serve him as well as I can." },
      { id = "tp_thrall2", when = { class = "WARLOCK" }, text = "You walk the same path I do, so you know the Warchief watches us closer than the rest. Earn his trust and keep it, and never let a demon have the last word." },
    },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi to the south serve the same god as the Atal'ai, and I've felt their magic on the wind. If Hakkar rises, it will be from one temple or the other." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Dark Portal is where the warlocks of the old Horde opened the way, and I won't forget it. I wish I could." } },
    _none = { { id = "tp_none", text = "Ask me about the temple instead, because that I know too much about." } },
  },
}

P:NPC {
  key = "helgrum", id = TODO_NPC("Helgrum the Swift"), name = "Helgrum the Swift",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "restless" }, values = { "loyal", "brave" },
  notices = { "kit" },

  impression = {
    first = "Helgrum the Swift can't keep still and admits he's fast rather than clever. He spoke of Neeka Bloodscar with an easy pride that made me like him at once.",
    third = "{name} met Helgrum the Swift, the restless runner who carries word between Stonard and Kargath.",
  },

  greetings = {
    { id = "g_post", text = "I can't stand still in this place, because the mud's always trying to keep you, and an orc who stands still in Stonard sinks." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough road? The roads out of here are all rough, and Neeka Bloodscar at Kargath would laugh at your boots." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Strange? It's the strangest thing I've seen since I came to Stonard, and I've seen a murloc wearing a pot for a helmet. I'm not clever enough to tell you whether it's right, but you seem decent, and that's good enough for me." } },
      choices = {
        { text = "The Light chose me for a reason. I'll be worthy of it.", next = "BACK", reply = "Worthy, aye, and I believe you'll manage it. You've a better head on you than me, anyway.", fx = { align = { light = 1 } } },
        { text = "The Light is a weapon, Helgrum, nothing more.", next = "BACK", reply = "A weapon? Then use it well, I suppose. But I'd want to know why it picked you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In the swamp, aye, because heavy feet sink and the murlocs come at you from the reeds before you can turn. Neeka says a warrior's strength is in holding ground, but there's no solid ground out there to hold, so you'd better learn to move." } },
      choices = {
        { text = "Then I'll learn to hold ground wherever I stand.", next = "BACK", reply = "Hold ground, aye, and I'll try to teach you the swamp's way. It's not easy, but it's honest.", fx = { align = { order = 1 } } },
        { text = "Then I'll shed the armor and run with you.", next = "BACK", reply = "Shed the armour? Ha! You'd sink less, and run more. Come on, then, and keep up.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I never thought to, because I'm not clever, as I said, but now you've put it in my head I'll be asking them every morning. If I reach Kargath a day early, I'll tell Neeka Bloodscar it was your doing." } },
      choices = {
        { text = "Ask humbly, and the winds might just listen.", next = "BACK", reply = "Humbly, aye, and I'll try. Maybe the winds will carry me faster than my feet.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Don't bother asking. Just run harder, Helgrum.", next = "BACK", reply = "Run harder? I've been running harder since I was a pup. Maybe I'll try both.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Perhaps, perhaps not. But you would have to learn the paths first, and the swamp changes them every season. Run with me once, and we will see who reaches Kargath first." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Maybe, if you walked it with me once and burned out whatever's been waiting for my outrunners along the way. Neeka would say I should just pick a better path, but she's not the one running it." } },
      choices = {
        { text = "I'll walk it with you and fight whatever comes.", next = "BACK", reply = "Would you? Then I'd have company for once, and maybe we'd both get there whole.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Run at night and let them miss you. Safer than fighting.", next = "BACK", reply = "At night? The coyotes see better than I do in the dark. But I'll think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Neeka says that too, every time I come back from Kargath with a dozen coyotes on my heels. Maybe you're both right, but the swamp's too wet for quiet, and fast gets the letters there before the ink runs." } },
      choices = {
        { text = "Do it Neeka's way. She knows the trade.", next = "BACK", reply = "Her way, then. She's usually right, and she knows it.", fx = { align = { order = 1 } } },
        { text = "Ignore Neeka. Run your own way, Helgrum.", next = "BACK", reply = "My own way? That's what I've been doing, and it gets me chased. But thank you anyway.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Helgrum.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A few yards is a few yards, and on the Kargath road that's the difference between a coyote's teeth and a clean pair of heels. I'll race you to the gate, no spells, and if you win I'll call you the Swift instead." } },
      choices = {
        { text = "No spells, then. A fair race.", next = "BACK", reply = "A fair race! Now you're talking. First to the gate gets bragging rights.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll blink anyway. Winning's winning, Helgrum.", next = "BACK", reply = "Winning's winning, aye, but I'd rather beat you fair. Blink, then, and I'll still try.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! Can you really blink across a room? That sounds like cheating, and I'd like to race you anyway." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You couldn't outrun me, I'd wager, but I bet you could trip me in the dark, which isn't fair, so don't." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you really run like a wolf spirit? I've heard your lot can, and I'd like a race from here to Kargath." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "You run on four feet sometimes, I'm told, so you'll understand why I keep to the high paths, because the swamp eats anything slow." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest! Bless my legs, would you, because they've carried me to Kargath and back more times than I can count, and I'm not much good at counting." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock, eh? Keep your demon behind me on the road, not in front, because I've no wish to trip over it at full speed." },
        { id = "h_default", key = true,
          text = "Helgrum the Swift, and they call me that because I'm fast, not because I'm clever. Neeka Bloodscar's the clever one, head scout out at Kargath in the Badlands, and the best blood in the Horde, if you ask me." },
        { id = "h_neeka", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Neeka Bloodscar") }, { questActive = TODO_QUEST("Report to Helgrum") } } },
          text = "Word between Stonard and Kargath keeps getting cut, so go and see Neeka Bloodscar at Kargath yourself. She'll have a report for me; she always does." },
        { id = "h_report_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Helgrum"), days = 3 } },
          text = "Neeka's report says the Alliance has troubles of its own up north, and some of their enemies are ours too. Funny, the things you learn when a letter finally arrives." },
        { id = "h_fast", when = { metBefore = true }, text = "I ran to the edge of the swamp and back this morning, before breakfast, and don't ask me why, because I wasn't thinking. I'm the swift one, remember." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll never be fast in all that armor, but you'd be a lot harder to knock down than me." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who glows! Wait till I tell Neeka, she'll say I'm making it up, because I do make things up, but not this time." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, I've got a run at noon, and Lok'tar, I mean to beat my own time." },
      },
      choices = {
        { text = "Do you ever ask the winds to speed you on the road?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a spellcaster make the Kargath road safer for your runners?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "I could run your messages faster than any wolf.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "I'd guess they call you the Swift for good reason.", next = "swift" },
        { text = "Who is Neeka Bloodscar?", next = "neeka" },
        { text = "The road to Kargath sounds like hard going.", next = "road" },
        { text = "What did Neeka's report say?", next = "shared", when = { questDone = TODO_QUEST("Report to Helgrum") } },
        { text = "I'm fast too. Race you to the gate?", next = "race", when = { class = { "HUNTER", "SHAMAN", "DRUID" } } },
        { text = "I ran the plains of Mulgore. Swamp's no different.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "Fast is good, Helgrum, but quiet is better.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Blink only goes a few yards, Helgrum.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Speed seems worth more than armor in this swamp.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "A Forsaken paladin must seem strange to you, Helgrum.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll look for her.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },

    swift = {
      lines = {
        { id = "sw_default", text = "I carry word between the outposts, and I've never lost a message I was carrying. Other runners can say that too, but not as quickly." },
      },
      choices = {
        { text = "Has anyone lost one?", next = "swift_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swift_lost = {
      lines = {
        { id = "sl_default", text = "Plenty, and in this swamp a lost message usually means a lost runner too. Ask the Dispatch Commander about Thrall's Grasp sometime, if you want to see a grown orc go quiet." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    neeka = {
      lines = {
        { id = "n_default", text = "Head scout of Kargath, and the best tracker I know, though she'd tell you that herself. She's seen more fighting than half the grunts in Stonard put together, and she doesn't let you forget it." },
      },
      choices = {
        { text = "You sound fond of her.", next = "neeka_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neeka_fond = {
      lines = {
        { id = "nf_default", text = "Fond? She scowls at my running and I laugh at her scowling, and we both get the work done. Call it what you like, as long as you don't call it that in front of her." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    road = {
      lines = {
        { id = "r_default", text = "The Badlands are harsh, and they lie close to the Alliance's Loch Modan, so outrunners go missing between here and Kargath. The last one Neeka sent never reached me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shared = {
      lines = {
        { id = "sh_default", text = "That the Alliance isn't having an easy time in the north either. It makes you think that an enemy of theirs and an enemy of ours might be the same enemy." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    race = {
      lines = {
        { id = "ra_default", text = "Ha! On four legs or on the wind, I suppose, and that's hardly fair to a poor orc on two. Another time, when I've had my breakfast." },
      },
      choices = { { text = "Another time, then.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "No different! Wait till your hooves sink to the knee, then tell me it's no different. Tauren run like a stampede on open ground, but in Sorrows you have to step light, and I've never seen a tauren step light." },
        { id = "xta_runner", when = { origin = "tauren_plains_runner" },
          text = "A runner of the plains, are you? Then we'll race on the Kargath road where the ground's hard, because I'm not giving a tauren the start of a race in the mud." },
      },
      choices = {
        { text = "Watch me, then.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll take the road, not the mud.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a runner, and that's the whole of it. Ask Neeka for the interesting stories; she's lived them.", next = "neeka" } },
    advice = { { id = "tp_ad", text = "Run on the road, never through the reeds. The reeds are where the things that eat runners wait." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's name on Thrall's Grasp meant something to all of us, and I'm sorry it ended the way it did. I run faster now because of them." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "I've run past the Sunken Temple on the lake road a hundred times, and every time I hear the trolls chanting. I run faster there, I won't lie." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Dark Portal's down south past the Blasted Lands, and I've run messages to the edge of it. I don't go any closer than I have to." } },
    uldaman = { { id = "tp_uldaman", text = "Neeka tells me there's something old under the Badlands at Uldaman, and she wants to see it. Me, I'd sooner run the other way." } },
    _none = { { id = "tp_none", text = "Don't know, but ask Neeka when she's back, because she knows things." } },
  },
}

P:NPC {
  key = "bengor", id = TODO_NPC("Bengor"), name = "Bengor",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "stoic" }, values = { "proud", "dutiful" },
  notices = { "weary" },

  impression = {
    first = "Bengor can barely walk or talk, and he insists on remembering all the same. He wears what the murlocs did to him with a soldier's stubborn pride.",
    third = "{name} met Bengor, a gravely wounded Horde soldier at Stonard who remembers what became of the lost orders.",
  },

  greetings = {
    { id = "g_cough", text = "Don't look at me like that, it's only the swamp air in my chest, and everyone here coughs." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I'm still coughing, before you ask. Everyone here coughs, so don't look at me like that." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been doing good for Stonard. That's more than the swamp air ever did for anyone, so thanks." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like I feel, so sit a while with me and we'll be sick together and say nothing about it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It surprises me that anything answers anybody out here. The murlocs took my legs and most of my words, and if the Light can live in one of the Forsaken, then maybe it can still find a broken old orc." } },
      choices = {
        { text = "It finds everyone who looks for it, Bengor.", next = "BACK", reply = "Does it? Then maybe it'll find me someday, with my legs and words back. I'd like that.", fx = { align = { light = 1 } } },
        { text = "Don't count on the Light. Count on the Horde.", next = "BACK", reply = "The Horde, aye, and it's kept me fed. I'll count on that, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You could, for they leave tracks like ducks in the mud and smell like a week-old fish market, but there are many of them and only one of you. Hunt them carefully, and remember what they did to me before you get too close." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "You could, for they leave tracks like ducks in the mud and smell like a week-old fish market, but there are many of them and only one of you. Hunt them carefully, and remember what they did to me before you get too close. Keep {pet} close out there, for the murlocs throw nets, and I saw a wolf caught in one once, and it did not end well." },
      },
      choices = {
        { text = "I'll hunt them carefully and honor what they took from you.", next = "BACK", reply = "Carefully, aye, and with honour. That's more than the murlocs gave us.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt them all down, any way I can.", next = "BACK", reply = "Any way you can, aye. I'll not ask how, only that it's done.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, but some nights I wake with the faces of my company as clear as day, and the swamp goes quiet around me. I think they want the orders found as much as I do, so I keep remembering for them." } },
      choices = {
        { text = "Then I'll carry their memory with you, Bengor.", next = "BACK", reply = "With me, then, and that's a kindness I'll not forget. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The dead are gone. Let them go, Bengor.", next = "BACK", reply = "Let them go? They're all I've got left. I'll hold on a little longer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The healers say no, and I believe them, because they've stopped making promises. Use your magic on the murlocs who did this instead, and I'll call that mending enough." } },
      choices = {
        { text = "I'll face the murlocs head on, for your company.", next = "BACK", reply = "For my company, then, head on. They'd have liked you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll poison their water and be done with them.", next = "BACK", reply = "Poison? Then there'll be dead fish too, and the Swamp Talker won't thank you. But I'll not stop you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You might, if you go at dusk, when the murlocs sing and don't listen. Find the orders and bring them back, and if you can, let the Swamp Talker know who sent you." } },
      choices = {
        { text = "He'll know, Bengor. I'll make sure of it.", next = "BACK", reply = "Thank you. Let him know, and let them both know Bengor still remembers.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll fetch the orders. Revenge won't heal you.", next = "BACK", reply = "No, it won't, and I know it. But the orders will, a little.", fx = { align = { light = 1 } } },
        { text = "Something else, Bengor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You'd have heard the Swamp Talker's lot coming, I think, and we didn't, and that's the whole of my story." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The elders say the spirits keep what the living forget, and I'm glad of it, because my memory is all I have left to give." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. We could have used your fire on that road, when the murlocs came out of the water and there was no time to draw an axe." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock, sitting with me. The old Horde's warlocks never sat with a broken grunt, I'm told, so you're already better than they were." },
        { id = "h_default", key = true,
          text = "Bengor, a soldier of the Horde, or what the murlocs left of one. I can't walk and I can hardly talk, but I still remember, and an old warrior's last duty is to remember." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Missing Orders") },
          text = "The orders, you want the orders, and the Commander sent you to me because I'm all that's left of the soldiers who carried them. Sit close, so I don't have to shout." },
        { id = "h_talker", tags = { "news" }, when = { questActive = TODO_QUEST("The Swamp Talker") },
          text = "The Swamp Talker, a murloc, took the orders from my hand while a spear went into my head. His cave is east, if your stomach is stronger than mine was." },
        { id = "h_tired", when = { metBefore = true },
          text = "You came back to sit with a broken old grunt, and few do that. The healers come with their tube and their kind words, and I would rather have your company." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. I could use your eyes, for mine are bad now, and I'd like to know whether the murlocs are still nesting in the reeds by the water." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one with warm hands. I can feel the Light in you from here, and I never thought I'd feel it from one of the Forsaken." },
      },
      again = { { id = "h_again", text = "More? I have breath for a little more, if you speak slowly. An orc does not leave a report half-given." } },
      choices = {
        { text = "Do the spirits of your fallen comrades speak to you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could any magic still mend you, Bengor?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What happened to you?", next = "ambush" },
        { text = "You look ill, Bengor.", next = "ill" },
        { text = "Were you alone when it happened?", next = "others" },
        { text = "Let me try to heal you.", next = "heal", when = { class = { "PRIEST", "SHAMAN", "PALADIN", "DRUID" } } },
        { text = "I got the orders back, Bengor.", next = "orders_back", when = { questDone = TODO_QUEST("The Swamp Talker") } },
        { text = "I'm a soldier too, Bengor. Tell me what happened.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "Could I reach the Swamp Talker unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could track the murlocs who hurt you, Bengor.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does it surprise you that the Light answers me, Bengor?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },

    ambush = {
      lines = {
        { id = "a_default", text = "We took the orders from the Dispatch Commander and went south toward the Blasted Lands, and the murlocs came out of the water, many of them, too many. One of them they called the Swamp Talker, and he was the one who took the orders." },
      },
      choices = {
        { text = "Where did he take them?", next = "ambush_cave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush_cave = {
      lines = {
        { id = "ac_default", text = "East, to a cave, I think, though I was on the ground by then with a spear in my skull. If you go, go with friends, because I went with friends and look at me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ill = {
      lines = { { id = "i_default", text = "Not ill, broken, and they feed me through a tube now like a sick wolf pup. If it's death that's coming for me, it's going to have to try harder." } },
      choices = {
        { text = "Most soldiers in your state would go home.", next = "ill_stay" },
        { text = "Then death had better bring friends.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    ill_stay = {
      lines = {
        { id = "is_default", text = "Where else would a broken soldier go? From here I can hear the grunts drill in the morning, and on a good day that is almost the same as being among them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    others = {
      lines = {
        { id = "o_default", text = "Good orcs, every one, and none of them came home but me, and I'd trade places with any of them. Don't ask me their names today, because some days I can't find them in my head." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    heal = {
      lines = {
        { id = "h2_default", text = "Others have tried, with their hands warm on my head, and I thank them every time. It eases the ache for an hour, and an hour is a gift, so go on and try." },
      },
      choices = {
        { text = "[Lay hands on him a while]", next = "BACK", reply = "Ah, that's warm, warmer than the swamp's been in a long while. Thank you, friend, for the hour.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "An hour won't change anything, so I'll save my strength.", next = "BACK", reply = "Save it, then, for someone who'll mend. I understand, and I'll not hold it against you.", fx = { align = { light = -1 } } },
      },
    },
    orders_back = {
      lines = {
        { id = "ob_default", text = "Then the orders reached the captain of Thrall's Grasp at last, though too late to save his soldiers. I can rest a little easier knowing the words didn't stay in the mud." },
      },
      choices = { { text = "Rest, Bengor.", next = "BACK", fx = { affinity = 3 } } },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Then you'll understand. We lost the road, and then we lost the light, and then the murlocs came out of the reeds all at once, and I fell with my axe still on my back. Don't ever march with your axe on your back." },
        { id = "xwa_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "A grunt out of Razor Hill. Then you were taught right, and I was taught right too, and I still fell with my axe on my back when the murlocs came out of the reeds. Don't ever march like that." },
      },
      choices = {
        { text = "I won't. I'm sorry, Bengor.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Tell me about the ambush.", next = "ambush" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a soldier who carried orders south and didn't finish the road. The murlocs kept my boots, if you were wondering.", next = "ambush" } },
    advice = { { id = "tp_ad", text = "Never walk beside the water in this swamp. The murlocs wait where you can't see them, under the surface, and they don't make a sound until they're on you." } },
    thrall = { { id = "tp_thrall", text = "I carried the Warchief's orders, and I carried them as far as my legs would go. It wasn't far enough." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War and lived through it, and I thought that meant I was hard to kill. The murlocs taught me otherwise." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "I saw the trolls' fires out on the lake, the night the murlocs came. I still see them when I close my eyes." } },
    _none = { { id = "tp_none", text = "Before my time, or after it, but either way, not mine. Ask a younger warrior." } },
  },
}

P:NPC {
  key = "karakul", id = TODO_NPC("Innkeeper Karakul"), name = "Innkeeper Karakul",
  bible = "bibles/swampofsorrows.md", role = "innkeeper", tier = "service",
  communities = { "stonard" }, temper = { "gruff" }, values = { "generous" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Karakul made me take my boots off at the door before he made me eat. Gruff as he is, he plainly thinks feeding the scouts is the most important job in Stonard.",
    third = "{name} met Innkeeper Karakul, who keeps Stonard's scouts fed and dry in the Swamp of Sorrows.",
  },

  greetings = {
    { id = "g_op_peace", when = { gossip = { topic = "peace", stance = "war" } }, text = "Commander Ruag says you'd march on Theramore tomorrow if the Warchief gave the word. Half my customers would follow you there, and the other half would drink to your funeral." },
    { id = "g_inn", text = "Boots off by the door, because the mud stays outside, even if you don't have to. That goes for every orc, troll and grunt in Stonard." },
    { id = "g_home", when = { homeInn = { "Stonard" } }, text = "Back in Stonard, then. Your bed's dry, and that's the best thing anyone can say in this swamp." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away} away, then. Boots off by the door, and your bed's still dry, which I can't say for anything else here." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone's been muttering your name over their grog all week, and not kindly. Sort it out somewhere that isn't my floor." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look half-drowned and half-dead, so sit and eat, in that order." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Slow down, because if you fall in the swamp drunk, the crocolisks get supper." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They're scouts, so everything bothers them, and nothing stops them eating. A Forsaken with the Light in their hands is the strangest guest my fire has seen, but strange doesn't spoil the stew, and you're welcome as long as you mind the door." } },
      choices = {
        { text = "Your fire, your rules, Karakul. I'll mind the door.", next = "BACK", reply = "Good, and thank you. The scouts will settle once they see you mind the rules.", fx = { align = { order = 1 } } },
        { text = "I'll keep my boots on. Rules bend for the dead.", next = "BACK", reply = "Bend for the dead, do they? Not by my fire. Boots off, or eat outside.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "By the time they raised Stonard the shamans were long gone, and the warlocks ran everything. I'm told this inn stands on the stones of the old one, so I'd like to think it keeps better company now." } },
      choices = {
        { text = "The shamans are back, and the warlocks must never rule again.", next = "BACK", reply = "They are, and I'm glad of it. The warlocks ruled long enough.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The warlocks built this town. Give them their due.", next = "BACK", reply = "They did, aye, and they built it well. I give them that much and nothing more.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "We do not live, druid, we endure. Stonard was built to hold the Horde's road to the Blasted Lands, not to be pleasant. We drink boiled water and keep the fires high, and we sleep when we can." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Greshka the grimoire seller eats alone with her book, and Fel'zerul hardly eats at all, so if you sit with the scouts, you'll be the first of your sort they've talked to in months. Be friendly, because they've questions about the temple, and they're scared to ask either of those two." } },
      choices = {
        { text = "I'll sit with the scouts. Stonard eats together.", next = "BACK", reply = "Then you'll be the talk of the common room, and the scouts will thank you for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take my bowl to a quiet corner.", next = "BACK", reply = "Quiet corner, then, and nobody will bother you. But the scouts would have liked the company.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "That the maps are worse than the Commander thinks, and that some of them skip the stretch past the Pool of Tears and draw it from memory. I don't tell Commander Ruag, because a cook who carries tales doesn't get told anything." } },
      choices = {
        { text = "Ruag should know. Bad maps get scouts killed.", next = "BACK", reply = "He should, aye, and I've thought of telling him. But the scouts trust me, and that's worth something.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep their secret. A scout needs somewhere to talk.", next = "BACK", reply = "Somewhere to talk, aye, that's what my fire's for. I'll keep it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Conjure all you like, but a scout two days out in the swamp is two days from your spells, and he needs something that stays in the pack. Feed them while they're here, mage, and let my salted meat feed them while they're gone." } },
      choices = {
        { text = "Then I'll help where I can and leave the rest.", next = "BACK", reply = "That's all I ask, and more than most give. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The scouts aren't my problem, innkeeper.", next = "BACK", reply = "No, but they're mine. I'll feed them without you, then.", fx = { align = { light = -1 } } },
        { text = "Something else, Karakul.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Nothing yet, and I'd like to keep it that way. One of the warlocks who buys Greshka's grimoires brought an imp through here last season, and it ate half a sack of onions out of spite, and I'm still getting looks from the scouts." } },
      choices = {
        { text = "Mine behaves. I'll answer for it.", next = "BACK", reply = "Answer for it, aye, and I'll hold you to that. Count your own onions if it doesn't.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Imps are imps. Count your onions.", next = "BACK", reply = "Count them? I'll count them, and I'll bill you for every one it eats.", fx = { align = { honor = -1 } } },
        { text = "On to other things.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Boots off at the door, and the imp's too, if it has any, and keep it off the hearth while the stew's on." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, at my table? You could conjure your own supper, I know, so either you're being polite or you've tasted the stew." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Sit down and eat, and if you've any pull with the water spirits, ask them to keep the swamp out of my cellar." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid from Mulgore! Your folk need wide plains and clean skies, and you have come to a swamp. Rest here a while." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Boots off, and say whatever prayer you like over the stew, because it can't make it worse." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "Boots off, and I can see you've got a knife in the left one, so leave that by the door too." },
        { id = "h_default", key = true,
          text = "Innkeeper Karakul. Scouts come back muddy and hungry, and I send them out fed, which isn't glory and won't get sung around any war fire, but it keeps the Horde walking." },
        { id = "h_mud", when = { metBefore = true }, text = "The scouts track half the swamp in on their boots, so I make them wash at the door, and the wash water comes out thicker than my stew." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Boots off at the door, dead or not. I've fed the Forsaken before and I've never fed a paladin, so you'll eat what the scouts eat and like it." },
      },
      again = { { id = "h_again", text = "Something else? The stew won't keep forever, and neither will I, though I'm too stubborn an orc to go quietly." } },
      choices = {
        { text = "Did the old Horde ever keep shamans here in Stonard?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do spellcasters eat at your tables often, Karakul?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What do the scouts say over their grog that they won't tell their commander?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "A warrior needs feeding too, Karakul. What have you got?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I'd guess your stew meat comes from hunters.", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "How do your people live amid such rot?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What do the scouts say?", next = "scouts" },
        { text = "Any word from deeper in the swamp?", next = "temple" },
        { text = "That stew smells like it has a bit of everything.", next = "stew" },
        { text = "Our people built this town, didn't they?", next = "old", when = { race = "Orc" } },
        { text = "You must get more than scouts at these tables.", next = "regulars" },
        { text = "Do you cook for tauren, Karakul?", next = "k_tauren", when = { race = "Tauren" } },
        { text = "I could conjure food for the scouts, Karakul.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What has my imp done to deserve that, Karakul?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do your scouts mind sharing a fire with me, Karakul?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just a meal, thanks.", next = "END" },
      },
    },
    scouts = {
      lines = {
        { id = "sc_default", text = "That the swamp is bigger on the inside than it looks from the wall, and that every map they draw is wrong by morning. The cartographers argue about it over my tables half the night." },
      },
      choices = {
        { text = "Not all of them come back, I'd guess.", next = "scouts_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouts_back = {
      lines = {
        { id = "sb_default", text = "Most of them, and I keep a bowl set out for the ones who are late. When a bowl sits cold three days, I stop setting it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    temple = {
      lines = {
        { id = "t_default", text = "Fel'zerul comes in from the Pool of Tears looking like he's seen his own grave, eats nothing, and goes back out. Whatever's down there, I don't want it in my inn." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stew = {
      lines = {
        { id = "sw_default", text = "Whatever the hunters brought in, and in this swamp you're better off not knowing. It's hot and it's thick, and that's all a scout asks of a stew." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Dar sits by the door every night and complains about the damp, Breyk, our wind rider master, comes in smelling of wet wind rider, and Greshka eats alone in the corner with a book. Bengor I carry a bowl to, since he can't come to me." },
      },
      choices = {
        { text = "Greshka eats alone?", next = "regulars_greshka" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_greshka = {
      lines = {
        { id = "rgg_default", text = "Always, and nobody minds, because the last grunt who sat at her table had a bad dream for a week after. She tips well, I'll give her that, and she never complains about the stew." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "I cook for anyone who comes in from the swamp, and a tauren eats like three scouts, so I'll be glad of the custom. Sit near the hearth, though, because the door frames in Stonard were never built for horns." },
      },
      choices = {
        { text = "I'll mind my horns, Karakul.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = {
        { id = "o_default", text = "Our fathers did, when they first came through the Portal, and some of these stones remember worse days than we've had. I keep the fire in the old hearth going, because it seems right." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Meat, bread, and a stew thick enough to stand a spoon in, because a warrior who fights the swamp on an empty belly ends up feeding the crocolisks instead. Eat first, then go and earn it." } },
      choices = {
        { text = "I'll eat with the scouts and fight beside them.", next = "BACK", reply = "Good, and they'll be glad of you. A warrior who eats with the scouts fights with them too.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I eat alone and fight alone. It's quicker.", next = "BACK", reply = "Quicker, maybe, but lonelier. Suit yourself, and I'll save you a bowl anyway.", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "It does, and I never have enough of it, because the scouts eat faster than the hunters can bring it in. Bring me boar or jaguar from the dry ground, and leave the crocolisks to the crocolisks." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "It does, and by the look of {pet}, your friend has been eating some of it on the way back. Bring me boar or jaguar from the dry ground, and it can lie by the hearth while you eat." },
      },
      choices = {
        { text = "I'll hunt for Stonard's pot, then.", next = "BACK", reply = "Then you'll have my thanks, and the scouts' too. Boar or jaguar, whatever's fresh.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I hunt for myself. Stonard can buy its meat.", next = "BACK", reply = "It can, and it does, at a price. But a hunter who feeds the pot gets the first bowl.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I cook, I pour, and I make beds. Ask the Commander if you want a story; I only want to know if you're hungry, and if you are, scrape your boots first." } },
    advice = { { id = "tp_ad", text = "Dry your boots by the fire every night, or the swamp will take your toes before the crocolisks get a chance." } },
    thrall = { { id = "tp_thrall", text = "The Warchief eats what his grunts eat when he can, and I respect that. If he ever comes to Stonard, I'll feed him the same stew I feed the scouts." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The scouts who come back from the lake road eat like wolves and don't talk. I feed them and don't ask." } },
    second_war = { { id = "tp_second_war", text = "I cooked for the Horde in the Second War, before the camps, and I've cooked for it since. The stew's better now, and that's the only thing I'll say for the old days." } },
    _none = { { id = "tp_none", text = "I feed scouts, and the scouts know things, so ask them. Wait until they've eaten, though, or they bite like wolves of the old clans." } },
  },
}
