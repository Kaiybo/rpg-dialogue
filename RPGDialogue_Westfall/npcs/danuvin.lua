-- Captain Danuvin, Sentinel Hill. Voice: bibles/danuvin.md
-- Organizes the farmers who stayed. Won't forgive the city for leaving.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "danuvin", id = TODO_NPC("Captain Danuvin"), name = "Captain Danuvin", title = "The People's Militia",
  bible = "bibles/danuvin.md", role = "questgiver", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "sharp" }, values = { "brave", "stern" },
  notices = { "trophy", "kit" },
  impression = {
    first = "Captain Danuvin has made soldiers of farmers who were too stubborn to leave, and he speaks of that stubbornness with real respect. He counts gnoll paws the way a banker counts coin.",
    third = "{name} met Captain Danuvin of the People's Militia, who turns Westfall's stubborn farmers into soldiers.",
  },

  greetings = {
    { id = "g_op_defias_mercy", when = { opinion = { topic = "defias", stance = "mercy" } }, text = "You're the soft-hearted one who'd send thieves home with a warning. Well, we let one go last week, on your account, and we'll see what comes of it." },
    { id = "g_line", text = "Fall in or move along." },
    { id = "g_paws", when = { questActive = TODO_QUEST("Patrolling Westfall") }, text = "Paws, is it? Count them out on the table, and if it isn't eight, back out you go." },
    { id = "g_after", when = { questDone = TODO_QUEST("Patrolling Westfall") }, text = "You patrol like you mean it, and on this hill that's rarer than rain." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the gnolls didn't take a holiday while you were away. Fall in, then." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened up since you were counting paws for me. I'd put you at the front of the line now, and I don't say that to many." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "Word on the hill is you've been throwing your weight around. Save it for the Defias, because my farmers have been bullied enough." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been earning your keep around the hill. Good, because that's the only kind of soldier I've time for." },
  },

  notice = {
    { id = "n_gnoll", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Patrolling Westfall") },
      text = "You smell of gnoll, which is good news. Empty that bag on the table, and don't wipe your hands on the map." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That armor won't last a week on the Dust Plains, so use the smith's fire we keep on the hill." },
  },

  start = "hello",
  nodes = {
    op_prisoners = {
      lines = {
        { id = "op_prisoners_a", text = "Then it's the worst day of the week. Some of my men want him hanged off the tower as a lesson, the rest grew up with his father, and Gryan says the Stockade and nothing more. You've caught a few yourself by now, so what would you do with him?" },
      },
      choices = {
        { text = "Hang him. A thief's a thief, whoever his father was.", next = "op_prisoners_1", fx = { opinion = { defias = "hardline" }, align = { light = -1 }, affinity = 1, trait = { stern = 1 } } },
        { text = "Send him home with a warning. Most of them only wanted bread.", next = "op_prisoners_2", fx = { opinion = { defias = "mercy" }, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Make him talk first. Then let the Stockade have him.", next = "op_prisoners_3", fx = { opinion = { defias = "hardline" }, align = { order = 1 }, trait = { practical = 1 } } },
        { text = "The nobles made him a thief. Blame them, not the boy.", next = "op_prisoners_4", fx = { opinion = { defias = "masons_wronged", stormwind = "abandoned_its_own" }, align = { order = -1 } } },
        { text = "That's your call to make, Captain.", next = "BACK" },
      },
    },
    op_prisoners_1 = {
      lines = { { id = "op_prisoners_r1", text = "That's what my farmers say, and some days it's what I say too. Gryan would have your hide for it, so keep it between us and the spear rack." } },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },
    op_prisoners_2 = {
      lines = { { id = "op_prisoners_r2", text = "And find him back in a mask in a fortnight, or find him ploughing a field next spring. I've seen both, and I couldn't tell you which is likelier." } },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },
    op_prisoners_3 = {
      lines = { { id = "op_prisoners_r3", text = "That's Gryan's answer, near enough, and I suppose it's the sensible one. Prisoners talk, and dead men don't; I only wish the talking was quicker." } },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },
    op_prisoners_4 = {
      lines = { { id = "op_prisoners_r4", text = "I'll blame the nobles all day, friend, and twice on market day. But it's my barn the boy burned, not theirs, so I want him somewhere I can see him." } },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They'll fight beside anyone who stays when it gets ugly. Most of them only know shamans from tales of the Horde, so expect some muttering until the first fight's done." } },
      choices = {
        { text = "Then I'll stand in the line and let my deeds speak, Captain.", next = "BACK", reply = "That's how every man on this hill earned his place, {class}. Stand in the line and they'll forget the tales soon enough.", fx = { align = { order = 1 } } },
        { text = "Let them mutter. I don't need their good opinion to kill gnolls.", next = "BACK", reply = "Maybe not, but you'll fight better with them than against them. Just don't expect a seat at the fire until you've earned it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "The Defias fight dirty, {class}, and I've buried enough of my lads to know it works. But these are farmers who stood their ground in daylight, and I'll not teach them to knife a man from behind unless there's no other choice left." } },
      choices = {
        { text = "Dirty fighting keeps farmers alive, Captain. Pride doesn't.", next = "BACK", reply = "Pride buried half of them, I'll grant you that. I'll think on it, but I won't have my farmers turn into what they're fighting.", fx = { align = { honor = -1 } } },
        { text = "You're right. Let them keep their daylight courage.", next = "BACK", reply = "Thank you, {class}, because that's all I've got left to give them. Let the Defias keep their knives in the dark.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "How do you drill them now?", next = "drill" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "I've seen what a battlemage can do to a pack of Riverpaw, and I'd take a dozen of you if Stormwind would send them. As it is, my farmers have pitchforks and I have you, so stand where I can see you and aim away from the wheat." } },
      choices = {
        { text = "I'll keep the fire off the wheat, Captain. You have my word.", next = "BACK", reply = "Then you're welcome on this hill, and so is your word. The farmers would rather go hungry than see the fields burn again.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wheat grows back. I'll burn whatever needs burning.", next = "BACK", reply = "You've never had to plant it, then. Burn a Defias, burn a gnoll, but leave the wheat or answer to me.", fx = { align = { order = -1 } } },
        { text = "The gnolls seem bolder down here than anywhere.", next = "gnolls" },
      },
    },
    xlock = {
      lines = {
        { id = "xlo_default", text = "I've heard of your sort, and I'll say plainly that I don't like it. But I've farmers dying in the furrows, so if your demon bleeds for Westfall instead of them, I'll keep my opinions in my pocket." },
        { id = "xlo_gnome", when = { race = "Gnome" }, text = "Small as you are, you've a big shadow following you about, and I'll say plainly that I don't like it. But I've farmers dying in the furrows, so if your demon bleeds for Westfall instead of them, I'll keep my opinions in my pocket." },
      },
      choices = {
        { text = "My demon serves me. That's all you need to know.", next = "BACK", reply = "That's not all I need, but it's all I'll get, I suppose. Keep it pointed at the Defias and we'll get along.", fx = { align = { light = -1 } } },
        { text = "I'll keep it on a short leash around your people.", next = "BACK", reply = "I'd thank you for that, and so would my farmers. Most of them have never seen a demon, and I'd like it to stay that way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What do the gnolls want here?", next = "gnolls" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Then you're worth ten of my soldiers, and I'll not argue the point. They keep to the hills by day and the coast by night. If you find their camps, mark them, and leave the rest to us." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They've got me, and I've a voice for drilling, not for praying. Bless them before they go out if you like, since they'll stand straighter for it, and standing straight is half of soldiering." } },
      choices = {
        { text = "I'll bless every patrol that leaves this hill, Captain.", next = "BACK", reply = "They'll stand straighter for it, and some of them will come home who wouldn't have. Thank you, priest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Drilling keeps them alive. Prayer only comforts them.", next = "BACK", reply = "Drilling keeps them alive, aye, but comfort keeps them coming back. I'll take both if they're on offer.", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else, Captain.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "We've no gaol out here, so the ones Gryan doesn't want for questioning lose their blades and boots and get sent off down the coast road. Half of them come back in new boots, which tells you somebody's supplying them, and I'd dearly like to know who." } },
      choices = {
        { text = "Send them to Stormwind for trial. The law has to mean something.", next = "BACK", reply = "The law in Stormwind sent us nobody when we asked, so I'll not send them anything either. But you're right that it ought to mean something.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Turning them loose is foolish. Better to end it here.", next = "BACK", reply = "I've thought about it on the bad nights, I won't lie. Gryan won't have it, though, and I follow Gryan.", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid, is it? I've heard your kind can turn into bears. If that's true, I'd like a few for the coast road." },
        { id = "h_default", text = "Captain Danuvin, of the People's Militia. I organize the farmers who were too stubborn to leave, and stubborn makes good soldiers." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Patrolling Westfall") },
          text = "The gnolls aren't just raiding; they work with the thieves in the mines. Somebody feeds them and points them at us." ,
          fx = { hear = "gnolls_with_defias" } },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Patrolling Westfall") },
          text = "Get out across the grass, south along the road, and bring me paws. Every paw is one less hand on a farmer's door." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Patrolling Westfall"), days = 3 } },
          text = "The south road was quiet last night for the first time this month, and that was your doing." },
        { id = "h_city", key = true,
          text = "Stormwind left us to the thieves, and folk out here have long memories and short patience, so they won't forget it.",
          fx = { hear = "stormwind_abandoned_westfall" } },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "You've had real training, I can see, and good. Half my lot learned to fight last spring, from me, with hoes." },
        { id = "h_drill", when = { metBefore = true }, text = "I drilled the new ones till they dropped, let them sleep, then drilled them again. By harvest they'll be soldiers, or else very tired farmers with sore feet and no sense of humour left." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! My recruits pray the way they fight, loudly and without much skill, so you'd be a help to them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman on Sentinel Hill. My farmers will stare, so let them. If your lightning drops gnolls, I'll count their paws the same as anyone's." },
      },
      again = {
        { id = "h_again", text = "Next question, and be quick about it." },
        { id = "h_again2", text = "Ask. I can count recruits and listen at the same time." },
      },
      choices = {
        { text = "I can track the Defias where your soldiers can't.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Most men would have left Westfall long ago.", next = "why" },
        { text = "Tell me about the gnolls.", next = "gnolls" },
        { text = "Will the farmers ever forgive Stormwind?", next = "city" },
        { text = "Making soldiers out of farmers can't be easy.", next = "drill" },
        { text = "Let me drill your recruits a while.", next = "teach", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "My family farmed out here. I've come back.", next = "home", when = { origin = "human_westfall_farmhand" } },
        { text = "A hunter could teach your recruits to track.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Your farmers fight in the open, Captain. I'd teach them to fight dirty.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A few fire spells would thin the gnolls quickly, Captain.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I bargain with darker things than gnolls, Captain.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your farmer soldiers have anyone to pray with before a patrol?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Your militia must take Defias prisoners now and then, Captain.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Will your militia fight beside a shaman, Captain?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "A man should be able to plant a field and expect to harvest it, that's all. Out here, that's what dignity means." },
      },
      choices = {
        { text = "Then I'll fight for it too.", next = "BACK", reply = "Then you're one of us, as far as I'm concerned. Come back when the harvest's in, and we'll see whose field it is.", fx = { affinity = 2, align = { order = 1, honor = 1 } } },
        { text = "I'd sooner pay the Defias off than bleed for a field.", next = "BACK", reply = "Pay them off, and they'll be back next season wanting more. Spoken like someone who doesn't own a field out here.", fx = { align = { order = -1, honor = -1 } } },
        { text = "Sounds like a lot of dying for wheat.", next = "wheat", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Dignity's a big word for a farm fight.", next = "dignity" },
      },
    },
    wheat = {
      lines = { { id = "wh_default", text = "Everyone eats wheat. Remember that next time you're hungry in the city." } },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },
    dignity = {
      big = true,
      lines = { { id = "di_default", text = "It's the right word. The thieves don't just take crops, they take the right to grow them, and that's what Lord Stoutmantle is fighting for. So am I." } },
      choices = {
        { text = "And when it's won?", next = "dignity_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dignity_after = {
      lines = { { id = "da_default", text = "Then I'm a farmer again, and I never pick up a spear for as long as I live. That's the whole of the dream, and I don't dream much." } },
      choices = {
        { text = "I hope you get it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Soldiers rarely go back.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    gnolls = {
      lines = {
        { id = "gn_default", text = "Riverpaw, they call themselves, and they're bigger and bolder than Elwynn's lot. They don't take farms; they just make sure nobody keeps one." },
      },
      choices = {
        { text = "Somebody must be feeding them.", next = "gnoll_work" },
        { text = "I'll thin them out.", next = "BACK", fx = { learn = { "riverpaw" } } },
      },
    },
    gnoll_work = {
      lines = {
        { id = "gw_default", text = "The thieves under Moonbrook do. Gnolls don't plan, so someone plans for them, and every paw you bring me is a message sent back down that hole.",
          fx = { hear = "gnolls_with_defias", learn = { "riverpaw" } } },
        { id = "gw_active", when = { questActive = TODO_QUEST("Patrolling Westfall") },
          text = "Eight paws, from south along the road where the grass grows long. They'll find you before you find them, so let them come." },
      },
      choices = {
        { text = "Eight paws, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      big = true,
      lines = { { id = "ci_default", text = "Forgive them? Nobody's asked us to. When a king's house leaves its farmers to the knives, the farmers remember, and I was a farmer before I was anything else." } },
      choices = {
        { text = "The Highlord says he regrets it.", next = "city_bolvar", when = { heardLine = "bolvar.t_westfall" } },
        { text = "Not all of Stormwind forgot you.", next = "city_noble", when = { origin = "human_minor_noble" } },
        { text = "The city has its own wars.", next = "city_wars", fx = { affinity = -1, opinion = { westfall = "patience" } } },
        { text = "I'd remember too.", next = "BACK", fx = { affinity = 2, opinion = { westfall = "abandoned" } } },
      },
    },
    city_bolvar = {
      lines = { { id = "cb_default", text = "Regret's cheap, friend. Let him send a company of soldiers down that road, and I'd forgive a company." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city_noble = {
      lines = { { id = "cn_default", text = "Then where are they? Oh, standing in front of me, one of them at least. Well, it's a start, and I'll take it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    city_wars = {
      lines = { { id = "cw_default", text = "So do we, and ours just happens to be on the road to their bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drill = {
      lines = { { id = "dr_default", text = "Hoes first, then spears. A man who's swung a hoe all his life has the shoulders for it; what he needs to learn is when to stop." } },
      choices = {
        { text = "When to stop?", next = "drill_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drill_stop = {
      lines = { { id = "ds_default", text = "My farmers want to keep swinging till the thief stops moving, so I teach them to stop when he's down and tie him up. Gryan wants prisoners, because prisoners talk." } },
      choices = {
        { text = "And when you catch one who was a farmer's son?", next = "op_prisoners" },
        { text = "Mercy and sense, Captain. Take them alive.", next = "BACK", reply = "Both, and Gryan will be glad of every prisoner. Talk to my farmers about it, they'll listen to you more than me.", fx = { affinity = 1, align = { light = 1, order = 1 } } },
        { text = "Dead thieves don't come back.", next = "BACK", reply = "No, and neither do the answers they might have given. Gryan needs them talking, and dead men talk to nobody.", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "Ha! Go on, then, and show them how a real soldier holds a shield. Then show them how to hold it when they're tired, because that's the lesson they need." } },
      choices = {
        { text = "I'll start at dawn.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 2 } } },
        { text = "Farmers will never be soldiers.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Back, are you? Most who went east stayed east. If you mean it, there's a spear by the door, and if you're only visiting, visit somewhere safer." } },
      choices = {
        { text = "I mean it.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 2 } } },
        { text = "I'm only visiting.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hunter_l", text = "Track? Half of them can't find their own boots in the morning. But a man who can read a trail is worth his weight in grain out here, so if you've a week, I'll give you the youngest three." } },
      choices = {
        { text = "Give me the youngest three.", next = "BACK", reply = "Then they're yours, and Light help you. Bring them back able to track a gnoll to its den, and I'll owe you.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I hunt alone, Captain.", next = "BACK", reply = "Fair, then, though they'd have learned a lot from you. Watch the Riverpaw trails to the south.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Defias have dug themselves into the old Moonbrook mine, and the scouts call it the Deadmines now. I'd send the militia in tomorrow if I thought a single farmer would come back out of it." } },
    stonemasons = { { id = "tp_stonemasons", text = "The Defias started as masons the nobles wouldn't pay, and I'll grant them the grievance. What I won't grant them is my neighbours' farms, which is what they took for it." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord sends us his sympathy and not a single sword, and I'm tired of reading sympathy by lamplight. Gryan says he's a good man, so I'll leave it there." } },
    varian = { { id = "tp_varian", text = "King Varian would have marched an army down the coast road by now, I'd wager, but the King's gone and the council sends letters. We hold Westfall with what we have, which is farmers." } },
    second_war = { { id = "tp_second_war", text = "I was a pikeman in the Second War, and I came home to a farm that was still standing, which made me luckier than most. The Defias did what the orcs didn't, and I've not forgiven the city for letting them." } },
    the_stockade = {
      { id = "tp_the_stockade", text = "Half the Defias who get taken alive end up in the Stockade, and half of those seem to walk back out. I'd like to know who's holding the keys in that place, because it isn't anyone on our side." },
      { id = "tp_the_stockade2", when = { disposition = { min = 65 } }, text = "Between us, the Stockade's in the prisoners' hands, and I've heard Defias names among the ringleaders. That's a knife pointed at Stormwind's belly, and nobody in the Keep seems to feel it." },
    },
    knows = {
      { id = "tp_knows", text = "I command what passes for an army out here, so most of the bad news comes to me first. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I was a farmer until the farm was taken, and a captain since, because somebody had to be. I'll be a farmer again someday, if Lord Stoutmantle's right.", next = "dignity" } },
    advice = { { id = "tp_ad", text = "Never turn your back on long grass, because gnolls crawl. And keep your blade where you can reach it sitting down." } },
    riverpaw = { { id = "tp_gnolls", text = "They're south, down by the river. Get them before they get to the farms." } },
    defias = { { id = "tp_defias", text = "They're thieves with a cause, and that makes them worse, not better." } },
    people_militia = { { id = "tp_militia", text = "They all volunteered, and not one of them should have had to." } },
    westfall = { { id = "tp_westfall", text = "It's my homeland. The ones who stayed in it deserve someone who stayed with them."} },
    _none = { { id = "tp_none", text = "That's not my patrol and not my concern. Ask Gryan." } },
  },
}
