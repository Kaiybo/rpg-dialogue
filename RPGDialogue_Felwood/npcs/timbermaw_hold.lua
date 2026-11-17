-- Inside Timbermaw Hold: Gorn One Eye, Kernda and Meilosh, the furbolgs who decide which outsiders
-- get past the tunnels. Voice: bibles/timbermaw_hold.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Gorn One Eye: goods of the hold, The Root of All Evil, The Brokering of Peace
---------------------------------------------------------------------------
P:NPC {
  key = "gorn_one_eye", id = TODO_NPC("Gorn One Eye"), name = "Gorn One Eye",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "gruff", "steady" }, values = { "loyal", "protective" },
  notices = { "race", "class" },

  impression = {
    first = "Gorn One Eye sells arrows and flint inside Timbermaw Hold and weighs every outsider with his one good eye. He talks about the Winterfall the way you'd talk about a sick brother.",
    third = "{name} met Gorn One Eye, the Timbermaw furbolg who keeps the hold's goods and hates the demon that poisoned the Winterfall.",
  },

  greetings = {
    { id = "g_default", text = "You stand inside Timbermaw Hold, outsider, which is further than most of your kind ever get. Speak plainly and I'll listen." },
    { id = "g_cold", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "You smell of furbolg blood, and not Deadwood blood either. Say what you came to say and then go back through the tunnel." },
    { id = "g_friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } }, text = "Friend of the Timbermaw, come in out of the tunnel. There's shot on the shelf and a fire to warm your hands." },
    { id = "g_exalted", when = { reputation = { faction = "Timbermaw Hold", min = "exalted" } }, text = "I trust very few outsiders, and you are one of them now. I don't say that lightly, and I won't say it twice." },
    { id = "g_root", when = { questActive = TODO_QUEST("The Root of All Evil") }, text = "Has the torch burned at Winterfall Village yet? The demon won't show itself until it does." },
    { id = "g_root_done", when = { questDone = TODO_QUEST("The Root of All Evil") }, text = "Xandivious is dead, and the Winterfall elders are sleeping again for the first time in years. That is your work, and the hold knows it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the tunnels didn't miss you, but I did, a little." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown harder since you last walked in here. Good; the north needs hard people." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. The oldest of our stories say your people and mine shared these woods once, before the demons came. You'll forgive me if I wait to see whether you remember it too." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, and you walk softly for something so big. The druids of your people have always been welcome at our fires, if they come in peace." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The Timbermaw remember when druids came to us as friends, before the corruption made strangers of everybody." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gorn, and they call me One Eye, for reasons you can see. I keep the hold's goods, arrows and shot and flint and blades for throwing, and I keep watch on everyone who walks between Felwood and Winterspring through our tunnels." },
        { id = "h_root", when = { questActive = TODO_QUEST("The Root of All Evil") },
          text = "The Winterfall aren't wicked, outsider, they're poisoned, and the poison has a name: Xandivious. Plant the torch at the mouth of the high chief's cave in Winterfall Village, and when the demon answers it, kill it and bring me its essence." },
        { id = "h_root_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Root of All Evil"), days = 3 } },
          text = "The essence of the demon, in my own hands. Our shamans can begin drawing the sickness out of the Winterfall now, slowly, the way you'd draw a thorn that's been in a long time." },
        { id = "h_peace_a", when = { questActive = TODO_QUEST("The Brokering of Peace"), faction = "Alliance" },
          text = "Carry the offering to the dwarf king in Ironforge and put it in his hands yourself. He reached out to us once, and the Timbermaw are slow to answer, but we do answer." },
        { id = "h_peace_h", when = { questActive = TODO_QUEST("The Brokering of Peace"), faction = "Horde" },
          text = "Carry the offering to your warchief in Orgrimmar and put it in his hands yourself. He sent word to us once, and the Timbermaw are slow to answer, but we do answer." },
      },
      again = {
        { id = "h_again", text = "What else? The fire's warm and I'm in no hurry." },
        { id = "h_again2", text = "Ask, then. I'll tell you what a furbolg can tell an outsider." },
      },
      choices = {
        { text = "Who are the Timbermaw?", next = "timbermaw" },
        { text = "What happened to the Winterfall?", next = "winterfall" },
        { text = "Why do you watch outsiders so closely?", next = "outsiders" },
        { text = "How did you lose the eye?", next = "eye" },
        { text = "Show me your goods, Gorn.", next = "BUSINESS" },
        { text = "The Timbermaw call me friend now.", next = "friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } } },
        { text = "Tell me about this peace offering.", next = "peace", when = { questActive = TODO_QUEST("The Brokering of Peace") } },
        { text = "I hear the spirits weeping under these hills.", next = "xsham", when = { class = "SHAMAN" } },
        { text = "I command demons. You needn't fear me for it.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll go, Gorn.", next = "END" },
      },
    },
    timbermaw = {
      lines = {
        { id = "t_default", text = "We are the furbolgs who stayed ourselves. When the demons poisoned the forests, nearly every tribe drank the sickness and went mad, and the Timbermaw went down into the hills and held on to our minds with both hands." },
      },
      choices = {
        { text = "Which tribes were lost?", next = "tribes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribes = {
      lines = {
        { id = "tr_default", text = "The Deadwood, south of here, and the Winterfall in the snow beyond the tunnels, and others further off whose names you'd not know. They were our cousins, outsider, and we traded with them and married into them, and now they'd split our skulls for a sack of berries." },
      },
      choices = {
        { text = "Can they be saved?", next = "tribes_saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribes_saved = {
      big = true,
      lines = {
        { id = "ts_default", text = "The Deadwood, I think not; they've drunk too deep and too long. The Winterfall are newer to it, and if the thing poisoning them dies, our shamans believe they can be brought back, and I'd give my other eye to see it." },
      },
      choices = {
        { text = "Then save the Winterfall, whatever it takes.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mad cousins are still enemies. Put them down cleanly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winterfall = {
      lines = {
        { id = "w_default", text = "Something got into their camps, outsider, something that pours foul water into their firewater and whispers to their high chief. They were a proud tribe with good furs to trade, and now they come down on Everlook's road drunk and howling." },
        { id = "w_done", when = { questDone = TODO_QUEST("The Root of All Evil") }, text = "They're quieter now that the demon is gone, though quieter isn't the same as well. Our shamans walk among their camps now, carefully, and some of the Winterfall let them." },
      },
      choices = {
        { text = "What is this demon?", next = "xandivious" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xandivious = {
      lines = {
        { id = "x_default", text = "It is called Xandivious, and it hides itself well, letting the high chief take the blame for everything it does. Light a demon-summoning torch where it lairs and it can't stay hidden, and then it can be killed like anything else with blood in it." },
      },
      choices = {
        { text = "Why not kill the high chief instead?", next = "chief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chief = {
      big = true,
      lines = {
        { id = "c_default", text = "Because the chief is a puppet, and you don't burn a puppet and call the puppeteer beaten. Kill the demon and the Winterfall might wake up; kill only the chief and they'll find another, and the thing in the cave will whisper to that one too." },
      },
      choices = {
        { text = "You're right. Strike at the root, not the branch.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd kill both. Chances like that don't come twice.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outsiders = {
      lines = {
        { id = "o_default", text = "Because outsiders brought the demons here in the first place, and outsiders cut the forests and hunt the furbolgs for sport, Deadwood or not. The tunnels are the only safe road through these hills, and we'll not have them used to carry more trouble north." },
      },
      choices = {
        { text = "Then how does an outsider earn your trust?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      big = true,
      lines = {
        { id = "tr2_default", text = "Slowly, by killing the Deadwood and the Winterfall who can't be saved and bringing us their feathers and beads as proof. Some outsiders hate that it's slow, and I tell them that a friendship which comes quickly leaves quickly too." },
      },
      choices = {
        { text = "Slow trust is honest trust. I'll earn it properly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring whatever proof you want, however I come by it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye = {
      lines = {
        { id = "e_default", text = "A Deadwood spear, in the first season their camps went bad, before any of us knew what was happening to them. The one holding it had sat at my fire a hundred times, and I don't think he knew my face when he threw it." },
      },
      choices = {
        { text = "What became of him?", next = "eye_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye_after = {
      big = true,
      lines = {
        { id = "ea_default", text = "I don't know, and I've stopped looking for him among the dead ones the outsiders bring back feathers from. If you kill a Deadwood with a white streak down his arm, I'd rather you didn't tell me." },
      },
      choices = {
        { text = "I'll spare him if I find him, Gorn.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The kindest thing for him now is a quick death.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    friend = {
      lines = {
        { id = "f_default", text = "They do, and so do I, which counts for more in here than you might think. Friends of the hold can buy what I keep behind the counter, and they hear things in the tunnels that outsiders don't." },
      },
      choices = {
        { text = "What sort of things?", next = "friend_news" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friend_news = {
      lines = {
        { id = "fn_default", text = "That the Deadwood have begun carving new totems, and that our shamans don't like what's cut into them. Bring any you find to Kernda, who reads that sort of thing, and keep your hands clean afterwards." },
      },
      choices = {
        { text = "I'll keep an eye out for totems.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = {
        { id = "p_default", text = "The elders decided the hold has stayed alone long enough, and that the outsiders who fought for us deserve an answer. The offering is the Timbermaw's word, and you carry it because you've earned the right to." },
        { id = "p_alliance", when = { faction = "Alliance" }, text = "Your dwarf king sent people north to speak with us, years back, and we sent them home without an answer. The offering is that answer, late as it is, and you carry it because you've earned the right to." },
        { id = "p_horde", when = { faction = "Horde" }, text = "Your warchief sent word to us once, asking for friendship, and we left it unanswered. The offering is that answer, late as it is, and you carry it because you've earned the right to." },
      },
      choices = {
        { text = "What will the Timbermaw ask in return?", next = "peace_terms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace_terms = {
      big = true,
      lines = {
        { id = "pt_default", text = "Nothing but to be left alone in our hills, and to have our tunnels respected. We don't want a war banner, and we won't fight in your war against the others; tell your leader that plainly." },
      },
      choices = {
        { text = "That's fair. Peace shouldn't come with a price.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Neutral friends are useless friends. My leader will ask more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsham = {
      big = true,
      lines = {
        { id = "xs_default", text = "Then you hear what our own shamans hear, and you'll know why some of them can't sleep. The earth under the Deadwood camps has gone sour, and the spirits there have stopped answering anyone at all." },
      },
      choices = {
        { text = "The spirits can be called back with patience.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cut out the sickness first. The spirits will follow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "A demon poisoned my cousins and hid behind their chief while it did it, so you'll forgive me if I don't fear you and don't like you either. Keep whatever you've bound on a short leash inside the hold, and we'll get along." },
      },
      choices = {
        { text = "Understood. My demons stay leashed in here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My power is my own business, furbolg.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_fb", text = "The Timbermaw are what furbolgs were meant to be. The rest are what the demons made of them." } },
    burning_legion = { { id = "tp_bl", text = "Gone from the world, the night elves say, but something of them hid in a Winterfall cave long enough to poison a tribe." } },
    satyrs = { { id = "tp_sat", text = "The satyrs in the south of Felwood laugh while they kill. I'd rather face a Deadwood; at least the Deadwood are sad about it." } },
    background = { { id = "tp_bg", text = "Born in the hold, and I'll die in it, and in between I sell arrows to people who'll use them well." } },
    advice = { { id = "tp_ad", text = "Don't camp in the snow near Winterfall Village, and don't sell anything you take from a furbolg in my hearing." } },
    _none = { { id = "tp_none", text = "That's an outsider's business, and I've only one eye to keep on things. Ask someone with two." } },
  },
}

---------------------------------------------------------------------------
-- Kernda: reads the ritual totems of the corrupted tribes
---------------------------------------------------------------------------
P:NPC {
  key = "kernda", id = TODO_NPC("Kernda"), name = "Kernda",
  bible = "bibles/timbermaw_hold.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "calm", "sharp" }, values = { "devout", "curious" },
  notices = { "class" },

  impression = {
    first = "Kernda studies the ritual totems the corrupted furbolgs carve, turning them over by the fire as if they might confess. Kernda always seems to know my trade before I say it.",
    third = "{name} met Kernda, the Timbermaw who reads the tainted ritual totems of the Deadwood and the Winterfall.",
  },

  greetings = {
    { id = "g_default", text = "What do you seek, {class}? Most who come this deep into the hold are looking for something." },
    { id = "g_totem", when = { questDone = TODO_QUEST("Deadwood Ritual Totem") }, text = "You brought me a Deadwood totem once, and I'm still reading it. It hasn't finished telling me things." },
    { id = "g_wtotem", when = { questDone = TODO_QUEST("Winterfall Ritual Totem") }, text = "The Winterfall totem you brought me sits in a basket of salt by the wall, and I sleep on the other side of the hold now." },
    { id = "g_cold", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "You've furbolg blood on you, {class}, and the wrong kind of furbolg. Speak quickly." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, {class}. The totems kept me company while you were away, which is to say badly." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, and you can feel what's in those totems from over there, can't you? Most outsiders only smell them." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Whatever god you pray to, you might say a word over the basket in the corner before you leave; I won't be offended." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kernda, and I read the ritual totems that the corrupted tribes carve. The Deadwood and the Winterfall still make them, the way they did when they were sane, but what they cut into the wood now is not what their grandmothers cut." },
        { id = "h_dtotem", tags = { "news" }, when = { questRecent = { TODO_QUEST("Deadwood Ritual Totem"), days = 3 } },
          text = "A Deadwood totem, still warm from the hand that carried it. It's thick with the taint, {class}, and I'm glad it's in here with me and not out there with them." },
        { id = "h_wtotem", tags = { "news" }, when = { questRecent = { TODO_QUEST("Winterfall Ritual Totem"), days = 3 } },
          text = "The Winterfall totem is worse than the Deadwood ones, and newer, and I can see where the carver's hand shook. Whatever drove them to it, they didn't carve it gladly." },
        { id = "h_friend", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } },
          text = "You've done a great deal for the hold, {class}, and so I'll speak to you as I'd speak to one of our own. Ask what you like about the totems; I'll tell you what I know and say so when I'm guessing." },
      },
      again = {
        { id = "h_again", text = "What else do you seek?" },
        { id = "h_again2", text = "Go on, {class}. The totems aren't going anywhere, more's the pity." },
      },
      choices = {
        { text = "What is a ritual totem?", next = "totem" },
        { text = "What's wrong with the carvings now?", next = "carvings" },
        { text = "Where would I find these totems?", next = "where" },
        { text = "What do you do with them?", next = "keeping" },
        { text = "Can you feel the corruption in them?", next = "xsham", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "I've seen things like this in the Plaguelands.", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "That's all for now, Kernda.", next = "END" },
      },
    },
    totem = {
      lines = {
        { id = "t_default", text = "A carving that holds a prayer, so the prayer goes on being said after the one who made it has gone to sleep. A camp's shaman carves them for the hunt, for a birth, for the dead, and each tribe has its own way of cutting the eyes." },
      },
      choices = {
        { text = "And the Timbermaw still make them?", next = "timbermaw_totems" },
        { text = "Something else.", next = "BACK" },
      },
    },
    timbermaw_totems = {
      lines = {
        { id = "tt_default", text = "We do, though fewer than we used to, because some of the young ones think it's the old carving that let the sickness in. I don't believe that, but I understand why they'd want something to blame that isn't a demon." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    carvings = {
      lines = {
        { id = "c_default", text = "The eyes are wrong, for one, cut deep and slanted like a satyr's, and the prayers wind back on themselves so they never finish. A sane carver ends a prayer; these go round and round, the way a sick mind does." },
      },
      choices = {
        { text = "Who taught them to carve that way?", next = "teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = {
        { id = "te_default", text = "No furbolg, I'm sure of that much. The Deadwood carvings look like the marks in the satyr ruins to the south, and the Winterfall ones look like something that wanted to be worshipped and found a tribe that would do it." },
      },
      choices = {
        { text = "So the corruption is being taught?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      big = true,
      lines = {
        { id = "ta_default", text = "Taught, and then copied, and then copied again by hands that don't know what they're copying. That's what frightens me, {class}: even if every demon in Felwood died tomorrow, the carvings would keep teaching it." },
      },
      choices = {
        { text = "Then burn every totem you can find.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Study them first. You can't unlearn what you don't understand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "w_default", text = "On the Deadwood themselves, in Deadwood Village and Felpaw, carried by their shamans and their den watchers. The Winterfall ones you'll find in the snow beyond the tunnel, in Winterspring, if you're strong enough to take them." },
      },
      choices = {
        { text = "Why do they carry them into fights?", next = "carry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = {
        { id = "ca_default", text = "For the same reason you'd carry a charm your mother gave you, I suppose. They still think the totems protect them, and maybe they do, from everything except whatever is inside the totems." },
      },
      choices = {
        { text = "I'll bring you any I find.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeping = {
      lines = {
        { id = "k_default", text = "I read them, and then I bury them in salt, and when the salt turns grey I bury them again in fresh. Nobody has told me whether that works, but nothing has crawled out of the basket yet." },
      },
      choices = {
        { text = "Why not simply destroy them?", next = "destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    destroy = {
      big = true,
      lines = {
        { id = "d_default", text = "Because each one was a furbolg's prayer before it was a demon's, and burning it feels like burning the last thing that furbolg made with a sane heart. Some of the elders say I'm sentimental, and they may be right." },
      },
      choices = {
        { text = "You're right to keep them. Their makers deserve that much.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sentiment is how sickness spreads. Destroy them all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsham = {
      big = true,
      lines = {
        { id = "xs_default", text = "I can, and so can you, I'd wager, like a cold draught from a door that ought to be shut. Hold one too long and it starts to feel like your own idea to keep holding it, which is why I wear gloves." },
      },
      choices = {
        { text = "Then the Timbermaw should cleanse them as tradition demands.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget tradition. Break whatever's bound inside them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "I've heard of the plague in the east, from outsiders who came through the tunnels with the smell of it on them. A plague takes the body and leaves the mind, if it leaves anything; this takes the mind and leaves the body to go on hunting, and I can't say which is worse." },
      },
      choices = {
        { text = "Both are worth fighting.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_fb", text = "We're a patient people, {class}, and patience is the only reason the Timbermaw are still themselves." } },
    satyrs = { { id = "tp_sat", text = "Their marks are in the Deadwood carvings, and I'd give a good deal to know how they got there." } },
    burning_legion = { { id = "tp_bl", text = "I've never seen a demon, and I don't need to. I've seen what their leavings do to a tribe." } },
    _none = { { id = "tp_none", text = "I read wood, {class}, not the world. Ask Gorn; he hears everything that comes through the tunnels." } },
  },
}

---------------------------------------------------------------------------
-- Meilosh: trades with friends of the hold
---------------------------------------------------------------------------
P:NPC {
  key = "meilosh", id = TODO_NPC("Meilosh"), name = "Meilosh",
  bible = "bibles/timbermaw_hold.md", role = "vendor", tier = "service",
  communities = { "timbermaw_felwood" }, temper = { "wary", "proud" }, values = { "loyal", "craft" },
  notices = { "class" },

  impression = {
    first = "Meilosh keeps the Timbermaw's best goods for proven friends and says so to anyone who asks. Proving yourself to him is slow, and he seems to think that's the point.",
    third = "{name} met Meilosh, who trades the Timbermaw's best goods only to friends of the hold.",
  },

  greetings = {
    { id = "g_default", text = "You want what Meilosh keeps, outsider? Prove that you're a loyal friend of the Timbermaw first." },
    { id = "g_friendly", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } }, text = "The hold speaks well of you, so Meilosh will open his packs. Look, and don't touch what you won't buy." },
    { id = "g_revered", when = { reputation = { faction = "Timbermaw Hold", min = "revered" } }, text = "Ah, it's you. Meilosh saved something good for you, as he does for the hold's own." },
    { id = "g_cold", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "No. Meilosh doesn't trade with those who hunt the Timbermaw, so go back the way you came." },
  },

  notice = {
    { id = "n_craft", cat = "class", when = { class = { "DRUID", "HUNTER" } },
      text = "You wear leather and know what it cost the animal. Good; Meilosh's goods are for people who know that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Meilosh keeps the hold's finest work: patterns our elders cut, and gear sewn the way the Timbermaw have sewn it since before the trees were sick. He trades it only to proven friends, because the work was made for friends." },
        { id = "h_friendly", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } },
          text = "You're a friend of the hold now, so the packs are open to you. Meilosh will even tell you what each piece is for, if you ask him politely." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid comes to Meilosh's packs. The Timbermaw made gear for the druids who walked with us, long ago, and some of the old patterns still remember it." },
      },
      again = {
        { id = "h_again", text = "What else? Meilosh is listening." },
        { id = "h_again2", text = "Another question, outsider? Ask it." },
      },
      choices = {
        { text = "How do I prove myself loyal?", next = "loyal" },
        { text = "What makes Timbermaw work special?", next = "work" },
        { text = "Do you trade with the Deadwood?", next = "deadwood" },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Farewell, Meilosh.", next = "END" },
      },
    },
    loyal = {
      lines = {
        { id = "l_default", text = "Ask Grazle and Nafien outside the gates; they know which Deadwood need killing and which feathers the elders want to see. Bring enough proof often enough, and the hold will start saying your name kindly." },
      },
      choices = {
        { text = "Why must it take so long?", next = "loyal_slow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loyal_slow = {
      big = true,
      lines = {
        { id = "ls_default", text = "Because the last outsiders who came quickly wanted our tunnels for their own wars. Meilosh would rather wait a year for a true friend than open his packs to a false one in a day." },
      },
      choices = {
        { text = "A wise rule. Trust should be earned slowly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules like that keep good friends waiting outside.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "w_default", text = "Every stitch is done by a furbolg who knows the animal it came from and thanked its spirit before the knife went in. Outsiders laugh at that, until they wear it in the snow and stay warm." },
      },
      choices = {
        { text = "Who taught the Timbermaw these patterns?", next = "work_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_old = {
      lines = {
        { id = "wo_default", text = "Grandmothers, and their grandmothers before them, back to when every furbolg tribe traded patterns at the same fires. The Timbermaw are the only ones left who remember them, so Meilosh guards them closely." },
      },
      choices = {
        { text = "I'll respect the work, Meilosh.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deadwood = {
      lines = {
        { id = "d_default", text = "Meilosh used to, before they went mad, and they made good leather too, the best south of the hold. Now they'd sooner gut him than trade with him, and Meilosh won't wear anything they make." },
      },
      choices = {
        { text = "Does it hurt, fighting your own kind?", next = "deadwood_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deadwood_hurt = {
      big = true,
      lines = {
        { id = "dh_default", text = "Every time, outsider, and Meilosh hopes it always will. The day it stops hurting is the day the Timbermaw have started to go the same way." },
      },
      choices = {
        { text = "Keep that hurt. It's what keeps you whole.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hurt makes your hand slow. Harden your heart to them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_fb", text = "The Timbermaw are furbolgs as furbolgs were meant to be. Meilosh is proud of that, and wary for it." } },
    _none = { { id = "tp_none", text = "Meilosh trades goods, not gossip. Ask Gorn, who has more of it." } },
  },
}
