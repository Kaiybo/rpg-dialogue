-- Tirisfal's working dead with no quests of their own: Deathknell's warrior and priest
-- trainers and its shopkeeper, and Brill's warlock trainer, alchemist, nurse and horse
-- merchant. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_QUEST = P.TODO_QUEST
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Deathknell
---------------------------------------------------------------------------

-- Dannal Stern: Deathknell's warrior trainer.
P:NPC {
  key = "dannal", id = TODO_NPC("Dannal Stern"), name = "Dannal Stern", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "grim" }, values = { "dutiful", "practical" },
  notices = { "class", "weary", "lock_armor" },
  impression = {
    first = "He speaks of his soldiering life without wishing it back.",
    third = "{name} met Dannal Stern, the warrior trainer of Deathknell.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and your sword's still in your hand, which I always look for first. Come here and show me what you've learned." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand where I can see you, and keep your blade sheathed until I tell you otherwise." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "You came back with your sword still in your hand, and most fresh ones drop theirs in the first ditch. Come here and let me see how you hold it." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "You are not one of my students, but stand where I can see you all the same. The mindless ones wander in sometimes." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "The Rattlecages have been at your armor, I see. Bones bite harder than you would think, so mend it before you go back to the fields." },
    { id = "n_orc", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "An orc in Deathknell, learning from a dead man. When I was alive, I fought your kind on these same fields, and now I am teaching you, which is a strange joke for the world to make." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "A demon-hide ward is no shield, whatever your trainer told you. It'll take a few blows for you and then it'll be gone, and your arm had better know what to do next." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I did, and they were brave and stubborn and very sure of themselves until the plague came and there was nothing left to be sure of. Some went to the Crusade and some went into the ground, and you're the first I've met who went into the ground and came back with the Light still in hand." } },
      choices = {
        { text = "A soldier should face his enemy, not knife him from behind.", next = "BACK", reply = "Good. I did my share of soldiering, and the ones who fought face to face are the ones I still respect.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A soldier wins however he can. Backstabbing counts.", next = "BACK", reply = "It counts as a win, I suppose, but not as soldiering. Leave the knives to the rogues upstairs.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Then I'll carry their courage with me.", next = "BACK", reply = "Carry it well, then, and carry it further than they managed. They'd have liked a paladin who kept going after the end.", fx = { align = { honor = 1 } } },
        { text = "Their certainty failed them. I'll trust my own.", next = "BACK", reply = "Then trust it, but test it every day, because certainty is the first thing the Scourge eats.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They stood just behind us, and when the line bent they'd step into the gap and pray loud enough to shame us back into place. I don't know what you pray to now, but a voice behind the line still matters, so learn where to stand before you learn what to say." } },
      choices = {
        { text = "I'll stand behind your line and keep it whole.", next = "BACK", reply = "Good. I saw a line hold half a night at Andorhal with one chaplain shouting behind it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stand where I like. Lines are for soldiers.", next = "BACK", reply = "Then you'll find yourself standing alone when the Scourge comes, and a lone priest is a short fight.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No, though I spent my living years thinking so, behind a shield in the front rank. The archers on the walls killed more orcs than I ever did, and they had the sense to stay alive doing it, which I did not." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "No, and a beast at your side is worth a shieldmate besides, if {pet} holds its ground the way it looks like it would. The archers on the walls killed more orcs than I ever did, and they had the sense to stay alive." },
      },
      choices = {
        { text = "Then I'll guard the rear, and you hold the front.", next = "BACK", reply = "There's a sensible soldier. Watch my back and I'll make sure nothing reaches yours.", fx = { align = { order = 1 } } },
        { text = "I'll fight where I like, Dannal, front or back.", next = "BACK", reply = "Fight where you like, then, but stay alive doing it, which is more than I managed.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because your demon will die sooner or later, and you'll be left holding whatever's in your hand. I was a soldier once and saw what happened to the ones who trusted their magic alone, so humour me and hold the blade properly." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Because your demon will die sooner or later, however sturdy it looks standing there, and you'll be left holding whatever's in your hand. I was a soldier once and saw what happened to the ones who trusted their magic alone, so send it back a few paces and hold the blade properly." },
      },
      choices = {
        { text = "I'll learn it properly, Dannal. Every cut.", next = "BACK", reply = "Good. Learn the blade and the shield, and your demon can do the rest.", fx = { align = { order = 1 } } },
        { text = "My magic is all the blade I need.", next = "BACK", reply = "That's what the last one said, and I put him in the ground myself. Humour me anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dannal Stern, and I teach the risen of Deathknell to fight. Your muscles have forgotten what they knew, but your bones remember, and I can wake that memory up again." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Your grip is firmer than when you first crawled out of the grave. Good, because the Scourge and the Crusade will both test it soon enough." },
        { id = "h_deadwar", when = { race = "Scourge", class = "WARRIOR", maxLevel = 5 }, text = "Freshly risen and already holding a sword the right way round, which is more than most manage. Whoever you were before, your arm remembers drills, so let us find out what else it remembers." },
        { id = "h_w10", tags = { "news" }, when = { class = "WARRIOR", minLevel = 10 }, text = "You have learned all Deathknell has to give, and Austil de Mon in Brill will take you on from here. In time they will send you across the sea to the Barrens, to an orc named Uzzek who teaches the shield, and I'd give a great deal to see your face when you meet him." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. When I was alive, the orcs I fought had warlocks behind them, not shamans, and I'm told your people care very much about the difference." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in Deathknell. I've no claws to teach you how to use, but stand where I can see you all the same." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, among my sword pupils. Stand where I can see you, then, and tell me why you keep your distance from the fight." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at a warrior's post. I trained beside priests of the Light in the old army, and they stood behind the line and kept it standing, so I'll not mock yours." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, in my yard? You'll hold a sword badly, I expect, but I'll teach you to hold it anyway." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, swinging a sword with dead hands and calling on the Light at the same time. I soldiered beside knights of the Silver Hand once, and they always seemed half in this world and half in the next, which you are now, in more ways than one." },
      },
      choices = {
        { text = "Did the old army's priests ever fight beside you, Dannal?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you hold the old war against my people, Dannal?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is a beast's strength worth less than a sword's, Dannal?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me, Dannal.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "My arm remembers drills I never learned in this life.", next = "w_memory", when = { class = "WARRIOR", race = "Scourge" } },
        { text = "How do I fight the Scarlets, Dannal?", next = "w_scarlet", when = { class = "WARRIOR" } },
        { text = "You have the bearing of an old soldier.", next = "past" },
        { text = "What's it like to fight without feeling pain?", next = "pain" },
        { text = "There seem to be enemies on every side here.", next = "enemies" },
        { text = "I fight from behind, Stern. Any advice for that?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage has little need to hold a weapon, Stern.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Is a bow worth less than a sword to you, Dannal?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why bother teaching me the sword, Dannal?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "You must have known knights of the Silver Hand, Dannal.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll go.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? I have the time; the dead do not need to sleep." },
        { id = "h_again2", text = "Ask what you like. I have heard every question a fresh corpse can think of." },
      },
    },
    past = {
      lines = { { id = "p_default", text = "I was a soldier of Lordaeron, and not a remarkable one. I remember the drills and the cold mornings on the walls, but I do not remember the faces of the men beside me, and I have decided that is a mercy." } },
      choices = { { text = "Do you miss that life?", next = "past_miss" } },
    },
    past_miss = {
      lines = { { id = "pm_default", text = "No, because that life ended in a ditch when the plague came, and nobody from Lordaeron came looking for me. The Dark Lady did, so I teach her soldiers now, and that is all the loyalty I have left." } },
      choices = {
        { text = "Then serve Sylvanas well.", next = "BACK", reply = "I will, as long as there's anything left of me to serve with.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Your loyalty is your own. You owe no one.", next = "BACK", reply = "Perhaps not, but I choose to owe her, and that's my business. A soldier needs somewhere to stand.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_memory = {
      lines = {
        { id = "wm_default", text = "Then you were a soldier, or a guardsman, or a farmer who drilled with the militia on feast days, because the body keeps what the mind lets go. Don't chase the memory itself; it won't come, and chasing it will only make you slow." },
      },
      choices = {
        { text = "I'd rather know who I was.", next = "w_memory2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_memory2 = {
      big = true,
      lines = { { id = "wm2_default", text = "So would we all, at first. I spent my first month searching every face in Brill for someone who knew me, and nobody did, and the sword in my hand was the only thing that recognized me. Choose what you are now, and let the past keep its own counsel." } },
      choices = {
        { text = "The past is gone. I'll be what I choose.", next = "BACK", reply = "That's how the Dark Lady's soldiers think. You'll do well here.", fx = { align = { order = -1 } } },
        { text = "I'll find out who I was, however long it takes.", next = "BACK", reply = "Then look, but keep your sword arm busy while you do. The Scourge doesn't wait for the curious.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_scarlet = {
      lines = {
        { id = "ws_default", text = "Charge them before the priests among them can start praying, rend them so they bleed while you work, and never fight two at once if you can drag one away. They are living, which means they tire and we don't, so make every fight a long one." },
        { id = "ws_low", when = { maxLevel = 3 }, text = "You don't, not yet, because the Scarlets at Solliden Farmstead would cut you down before you'd swung twice. Kill the mindless dead in the fields first, and come back when your arm stops shaking." },
      },
      choices = {
        { text = "They were my people once. It's strange to fight them.", next = "BACK", reply = "They burned my village's dead in a pit, including people I may have loved. Be strange about it later, after you've won.", fx = { align = { light = 1 } } },
        { text = "They hunt us like vermin. I'll show them no mercy.", next = "BACK", reply = "Good, because they will show you none. Just don't become what they think you are.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pain = {
      lines = { { id = "pa_default", text = "Dangerous, because you can lose an arm and only notice when the sword falls out of it. The first thing I teach is to look at your own body after every fight, since it will not tell you when it is hurt." } },
      choices = { { text = "That's useful advice, Stern. Something else.", next = "BACK" } },
    },
    enemies = {
      lines = { { id = "e_default", text = "The mindless dead and the Rattlecages in the fields, which are the Scourge's leftovers, and the Scarlet Crusade, who camp south of here and burn anything that walks without a heartbeat. Executor Arren will give you work against both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I hold nothing against anyone, because death left me very little to hold with. Your Warchief made peace with the Dark Lady and I teach whoever she sends me, so stand where I can see you and keep your lightning off my practice dummies." } },
      choices = {
        { text = "The old war is done. We fight the Scourge together now.", next = "BACK", reply = "That's the way I see it too. Stand where I can see you, and we'll get along fine.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I keep my own counsel about old wars, Dannal.", next = "BACK", reply = "Then keep it, and keep your weapon pointed at the Scourge. That's all the counsel I need from you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "No, I think a sword is only a claw we had to make for ourselves. Your kind is born with the weapon and mine had to forge it, and the Scourge kills us both just the same if we stop paying attention." } },
      choices = {
        { text = "Then we'll pay attention together, and fight as one.", next = "BACK", reply = "Spoken like a soldier, and I'll take that from any shape. Watch my flank and I'll watch yours.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight my own way, Dannal, not in anyone's drill.", next = "BACK", reply = "Then fight your way, but fight it where I can see you, because I've no wish to dig another grave.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "From behind is still fighting, whatever the knights used to say about it, and I've buried enough honourable men to stop caring. Learn to take a hit anyway, because sooner or later the one you're stabbing turns round." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I served beside men who'd have hanged a cutpurse for lifting a loaf, and now we're all dead together in Deathknell. Take your knives to the Crusade and I'll count it as soldiering." },
      },
      choices = {
        { text = "A knife in the back ends a fight quickest.", next = "BACK", reply = "It does, and nobody here will argue. Learn to take a hit anyway; that's Stern's advice, and it's free.", fx = { align = { honor = -1 } } },
        { text = "I'll learn to face them too, Stern.", next = "BACK", reply = "Good, because a rogue who can face a man as well as stab him is worth two who can't.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What's it like to fight without feeling pain?", next = "pain" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A weapon wouldn't hurt, since a spell takes a breath to cast and a Scarlet initiate needs only half that to reach you. Keep a staff in your hands and learn to swing it like you mean it, and you'll outlast the mages who don't." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Half the mages who fell in Lordaeron fell because a ghoul got close while they were still muttering, and I watched it happen more than once. Learn to step back as you cast, and you'll do better than they did." },
      },
      choices = {
        { text = "I'll learn the staff, Stern. You're right.", next = "BACK", reply = "Good. I once saw a mage with no mana left brain a ghoul with his staff, and he walked home.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My spells are protection enough, Stern.", next = "BACK", reply = "That's what the Kirin Tor thought, right up until the Scourge came through the gates. Learn the staff anyway.", fx = { align = { order = -1 } } },
        { text = "There seem to be enemies on every side here.", next = "enemies" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Your hands don't feel the hilt anymore, so you'll have to learn to trust your eyes and your shoulders instead. Every Forsaken soldier has to relearn the sword, and none of us enjoy it." } },
    lordaeron = { { id = "tp_lordaeron", text = "I soldiered for Lordaeron for fifteen years and drank to the king's health every night. I don't drink anymore and the king is dead, and I find I miss neither as much as I expected." } },
    second_war = { { id = "tp_second_war", text = "I fought orcs in the Second War, and now I'm allied with them. Life is strange, and death is stranger." } },
    scourge = { { id = "tp_scourge", text = "The Scourge fights without fear or pain, so you'd better learn to do the same. You're halfway there already, which is the one gift the plague gave you." } },
    _none = { { id = "tp_none", text = "I don't know that, and the grave didn't make me any wiser. Ask Executor Arren, or the shadow priest in the chapel." } },
  },
}

-- Dark Cleric Duesten: Deathknell's priest trainer.
P:NPC {
  key = "duesten", id = TODO_NPC("Dark Cleric Duesten"), name = "Dark Cleric Duesten", title = "Priest Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "cold" }, values = { "devout", "proud" },
  spiritSensitive = true,
  notices = { "class", "light", "lock_shadow" },
  impression = {
    first = "He holds the Light in contempt and the will in reverence.",
    third = "{name} met Dark Cleric Duesten, the priest trainer of Deathknell and a voice of the Cult of Forgotten Shadows.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Another of the faithful, come back stronger. Your will has grown since I saw you last, and the Forgotten Shadow is pleased." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Your will is weak, and your spells weaker, so speak your business quickly and leave me to my prayers." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Another of the faithful, come back from the fields. Tell me, does your will grow stronger, or only your spells?" },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "You are not a priest, but the Forgotten Shadow will take anyone stubborn enough to keep walking after they've died." },
    { id = "g_xchapel", when = { origin = "forsaken_chapel_priest" }, text = "You preached in Lordaeron's chapels once; you still stand at the front of a room as if there's a pulpit behind you. The Forgotten Shadow asks less of you than the Light did, and it does not hurt to listen to." },
  },
  notice = {
    { id = "n_paladin", cat = "light", when = { class = "PALADIN" },
      text = "The Light still clings to you, and I can smell it on you like smoke. Aramis Hammerhand may tell you it makes you strong, but I would say it is a chain you have not yet seen." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The shadow follows you the way a hound follows its master, which is the right way round. Keep it that way, and you'll have nothing to fear from the Forgotten Shadow, or from anything else." },
  },
  start = "hello",
  nodes = {
    w3_first = {
      lines = {
        { id = "w3_first_1", text = "To stop praying to the Light out of habit, which is the hardest lesson and the first. A risen priest will kneel before he knows he's kneeling, and he'll call on the old saints, and the Light will answer him with fire, and I must teach him to call on himself instead." },
      },
      choices = {
        { text = "Does the habit ever fade?", next = "w3_habit" },
        { text = "Perhaps the habit has a reason.", next = "BACK", reply = "A reason, yes, which is that we were taught to beg. The Forgotten Shadow teaches us to stand." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_habit = {
      lines = {
        { id = "w3_habit_1", text = "In most, given time. One of my pupils still crosses himself at the chapel door every morning, and I've stopped correcting him, because his shadow is the strongest of any of them and I suspect the two are connected." },
      },
      choices = {
        { text = "Faith is stubborn. Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every soldier believes in something, even if it's only the strength of the arm beside them. The Forgotten Shadow asks only that you believe in yourself, which is the one thing the Light never let its soldiers do." } },
      choices = {
        { text = "The will is earned by suffering, not by borrowing another's strength.", next = "BACK", reply = "Precisely. The Light offers comfort on loan, and the Shadow asks you to pay for your own. That is the difference.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Take power wherever you find it. The source doesn't matter.", next = "BACK", reply = "It matters a great deal, because borrowed power can be taken back. Ask any priest of the Light how it felt.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I fight for something bigger than myself, Cleric.", next = "BACK", reply = "Something bigger, is it? The Light was bigger too, and see how much good it did us. Keep your eyes open.", fx = { align = { light = 1 } } },
        { text = "I believe in my own arm, Cleric. It hasn't failed me.", next = "BACK", reply = "Then you already understand the Forgotten Shadow better than most of my novices. Keep trusting it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, though most hunters I've known put their trust in the arrow and not in the sky. That is the right order of things, and the Light never understood it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, and your {pet} trusts you the way the faithful trust their gods, so be worthier of it than the Light was of us, and you'll have built a faith of your own." },
      },
      choices = {
        { text = "The hunt is sacred, Cleric. There's more to it than aim.", next = "BACK", reply = "Perhaps it is, for you, and I'll not tell you otherwise. Only remember that the sky doesn't draw your bow.", fx = { align = { light = 1 } } },
        { text = "My faith is in my aim, Cleric, and nothing more.", next = "BACK", reply = "Then you've grasped the heart of it already, hunter, and you never had to sit through a sermon.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Faith is something you build for yourself, and a rogue builds it every time a plan works. Trust your own will and not the Light, which abandoned every one of us in Lordaeron, and you'll be harder to kill than any paladin of the Crusade." },
      },
      choices = {
        { text = "I serve the Dark Lady's will, not only my own.", next = "BACK", reply = "The Dark Lady's will and yours walk the same road for now. Make sure you notice if they ever part.", fx = { align = { order = 1 } } },
        { text = "I serve my own will, and nobody else's.", next = "BACK", reply = "Then you'll never kneel again, and that is all the Forgotten Shadow asks of anyone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dark Cleric Duesten, and I teach the priests of Deathknell the faith of the Forgotten Shadow. The Light abandoned us when we died, so we learned to believe in what it could not take away: ourselves." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You bow to the elements and call it wisdom, but I would call it another master, and the Forsaken have had enough of masters." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You serve the land and its goddess, and I wonder whether you have ever asked what she did for Lordaeron when the plague came." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Your strength is your own, {class}, and no god gave it to you, so remember that when the Crusade tells you otherwise." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You live by your own skill and your own eye, which is closer to our faith than most of my students manage." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You've already learned that no god will save you, I think, so you're halfway to wisdom." },
      },
      choices = {
        { text = "The spirits are partners, Cleric, not masters. Can you understand that?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would you have had the Earth Mother do, Cleric?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Forgotten Shadow?", next = "cult" },
        { text = "You must have served the Light when you lived.", next = "past" },
        { text = "I still feel the Light. Am I wrong?", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "My power comes from study, not faith, Cleric.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you see a difference between shadow and fel, Cleric?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Warriors have little need of faith, Cleric.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do hunters pray to anything, Cleric?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Rogues have no need of faith, Duesten.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What do you teach a new priest first?", next = "w3_first" },
        { text = "Farewell.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What more would you ask? Speak plainly; the dead have no use for flattery." },
      },
    },
    cult = {
      lines = { { id = "c_default", text = "It is a faith in the will, the one thing that carried us out of the Lich King's grip when nothing else did. We do not pray to anyone; we remind ourselves that we chose to be free." } },
      choices = { { text = "Someone must lead the cult.", next = "cult_who" } },
    },
    cult_who = {
      lines = { { id = "cw_default", text = "Its priests gather in the Undercity, and Shadow Priest Sarvis speaks for it here in Deathknell. You will find us wherever the Forsaken need reminding that they owe nothing to the gods who let them rot." } },
      choices = {
        { text = "A faith in yourself makes sense to me.", next = "BACK", reply = "Then you're halfway home already, and the rest is practice. Come and see Sarvis when you're ready.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I think the Light is still there for us.", next = "BACK", reply = "It burns those of us who touch it, and it let us rot. Believe what you like, but ask yourself why it took so long to answer.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past = {
      lines = { { id = "p_default", text = "I prayed every morning and every evening, like everyone in Lordaeron, and the plague took me between two prayers. If the Light could not be bothered to save a man in the middle of praying to it, then I see no reason to keep asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "You are not wrong to feel it, but you are wrong to trust it, and it will hurt you each time you reach for it. Take what it gives, if you must, and never thank it." } },
      choices = { { text = "I'll remember that.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I understand that you believe it, and so did every priest of Lordaeron who knelt to the Light. A partner who can refuse you is a master who has not yet decided to, so keep your will your own, shaman, and see how long the spirits stay friendly." } },
      choices = {
        { text = "My will is my own. The spirits only lend their strength.", next = "BACK", reply = "Lend, yes, and lenders call in their debts. Keep that will of yours close, shaman.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Humility before the spirits isn't weakness, Cleric.", next = "BACK", reply = "Perhaps not, but I knelt once before something I trusted, and it let me die. Forgive me if I'm slow to kneel again.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Anything at all would have been more than the Light managed. I do not blame your goddess for my death, because she was never ours to begin with, but I would be wary of any power that lets so much die and calls it balance." } },
      choices = {
        { text = "Balance isn't cruelty. Death is part of the cycle.", next = "BACK", reply = "A cycle that ate Lordaeron whole, and calls it balance. I'll leave your goddess her cycle and keep my own counsel.", fx = { align = { light = 1 } } },
        { text = "You're right. Only the will can be trusted.", next = "BACK", reply = "Then you've learned in a day what took me a lifetime and a death. Hold on to it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Then you already understand half of what I teach, because study is only the will turned toward books. The Kirin Tor kept their secrets behind walls and oaths, and you'll find the Forgotten Shadow keeps fewer, so long as you're willing to stare into the dark long enough." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's mages were proud of their minds, and the Scourge took those minds anyway, so I'd not lean on study alone. Whatever drew you out of the Lich King's grip was will, and you'd do well to cultivate it." },
      },
      choices = {
        { text = "Will over faith, then. I can believe that.", next = "BACK", reply = "Good. The Forgotten Shadow would welcome a mind like yours.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "There's still something to the Light, Cleric.", next = "BACK", reply = "There may be, but it burned every one of us who reached for it. Look carefully before you reach again.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "What is the Forgotten Shadow?", next = "cult" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I see the difference between one who commands and one who is commanded, and that is the only difference that matters. A warlock who masters a demon practises the same faith I teach, and a warlock mastered by one is just another fool on his knees." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You knelt to the Lich King once, as we all did, so you know exactly what it costs to serve something greater than yourself. Never kneel to a demon, and the Forgotten Shadow will have no quarrel with you." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I see the difference between one who commands and one who is commanded, and I am watching your demon now to learn which of you is which. A warlock who masters a demon practises the same faith I teach, and one mastered by it is just another fool on his knees." },
      },
      choices = {
        { text = "I command. I'll never kneel to anything again.", next = "BACK", reply = "Good. Kneeling is how all of us ended up in the Lich King's ranks, so stay on your feet.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Even a warlock needs something to believe in, Cleric.", next = "BACK", reply = "You already have something, warlock, and it's your own will. Don't go looking for anything else to kneel to.", fx = { align = { light = 1 } } },
        { text = "You must have served the Light when you lived.", next = "past" },
      },
    },
  },
  topics = {
    holy_light = {
      { id = "tp_holy_light", text = "The Light is a crutch for those afraid to stand on their own. The Forsaken have learned that faith is something we build ourselves, out of our own will, and it doesn't burn us." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You still cling to the Light, and you feel it burning you every time. I'd call that foolish, but I'll admit it takes a sort of courage." },
    },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are a people of will above all, and the Dark Lady is our proof of it. She broke the Lich King's hold with nothing but her own fury, and so can you." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is the opposite of us, all hunger and no will. Remember that whenever you're tempted to give in to something." } },
    _none = { { id = "tp_none", text = "That is no concern of mine. Ask Executor Arren, if you must." } },
  },
}

-- Joshua Kien: sells general goods in Deathknell.
P:NPC {
  key = "kien", id = TODO_NPC("Joshua Kien"), name = "Joshua Kien", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "deathknell" }, temper = { "dry" }, values = { "practical" },
  notices = { "purse", "hunger", "lock_shards" },
  impression = {
    first = "He finds it very funny that the dead still need bread.",
    third = "{name} met Joshua Kien, who sells supplies to the newly risen of Deathknell.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back so soon? Nobody's lost a finger this week, so you must have come for the bread. It's only a little mouldy." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The bread's on the shelf and the thread's beside it, so help yourself and don't trouble me." },
    { id = "g_shop", text = "Good day to you, or good night, since it hardly matters to us. What can I sell you? The thread's gone a bit mouldy, but then, so have we." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Somebody out in the fields must have lost another finger, I suppose." },
    { id = "g_xbrill", when = { origin = "forsaken_brill_farmer" }, text = "You farmed out past the town, didn't you? I may have sold your family twine or seed once, back when seed meant something, and now you're buying from me again with dead hands." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 50 } },
      text = "Your purse is as empty as a ghoul's head, friend. The fields are full of bones and old coin, if you go looking." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 20 } },
      text = "Your bag's clinking with twenty shards if it's clinking with one. Do those need feeding? I sell food, you see, so if they do, I'm the one you want." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I said grace every night when I was alive, and the plague came all the same, so I stopped. But if the Light still listens to a dead paladin, then perhaps it was listening all along, and I owe it an apology, or it owes me one." } },
      choices = {
        { text = "Even a dead man's shop should sell bread that isn't rotten.", next = "BACK", reply = "I try, I really do, but the damp gets into everything here, including me. I'll sell you the freshest I've got.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "The dead can't taste it. Sell them the mouldy loaves.", next = "BACK", reply = "Ha! They can't taste it, but they can see the green bits, and some of them still have standards.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "It was listening. You may owe it that apology.", next = "BACK", reply = "Then perhaps I'll say grace again tonight, and see whether anything answers. Thank you, {class}.", fx = { align = { light = 1 } } },
        { text = "It owes you one, Joshua. Don't let it forget.", next = "BACK", reply = "It does, and I'll tell it so, if it ever comes near enough to listen.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They need someone to tell them they're still people, I think, and the priests seem to be the ones doing it. I just sell the bread, but I notice the ones who've spoken to Sarvis or Duesten walk out a bit straighter than they came in." } },
      choices = {
        { text = "Then I'll tell them they're still people.", next = "BACK", reply = "Good, and they'll walk out a little straighter, I expect. Bread for the belly and words for the rest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bread is more use to them than comfort.", next = "BACK", reply = "Perhaps, but I sell both, in a manner of speaking. The bread's just easier to price.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Bread, water and a little thread to stitch your tabard, because the Crusade will cut it and the Scourge will tear it. I sell everything a soldier forgets until the moment they need it, and I sell it at an honest price." } },
      choices = {
        { text = "I'll pay your honest price, Kien.", next = "BACK", reply = "Thank you, and I'll try to keep it honest. Soldiers have little enough as it is.", fx = { align = { honor = 1 } } },
        { text = "I'll take what I need from the Crusade's packs.", next = "BACK", reply = "Then the Crusade will come looking for its packs, and I'd rather they didn't find you in my shop.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I'd like to, but most of my customers can't stomach fresh meat yet, and the ones who can prefer it baked into something. Living travellers do pass through now and then, though not often enough to keep a butcher's counter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I don't, I'm afraid, because most of the freshly risen can't stomach fresh meat yet, though your {pet} looks like it could. It's better fed than my customers, I'll say that." },
      },
      choices = {
        { text = "Then I'll share my catch with whoever's hungry.", next = "BACK", reply = "That's a good heart, and someone will be glad of it. The living travellers especially.", fx = { align = { honor = 1 } } },
        { text = "Then I'll sell my catch in Brill, for a better price.", next = "BACK", reply = "Brill's prices are better, I'll grant you, and the living there are hungrier. Off you go, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "For the imps, I'm told, though I've never seen one eat, and I've never had the courage to ask. Polite customers, though, always polite, which is more than I could say for the Scourge that used to wander through here." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "For the imps, I'm told, though yours hasn't touched a crumb and only stares at the loaves, which I find worse. Polite customers, though, always polite, so I'll wrap your bread and not ask {pet} what it wants with it." },
      },
      choices = {
        { text = "I'll buy what I need and leave the imp outside.", next = "BACK", reply = "That's thoughtful of you, and I'll be sure to keep a crust for it on the step.", fx = { align = { order = 1 } } },
        { text = "My imp eats whatever it likes, Joshua. Pray it likes bread.", next = "BACK", reply = "Then it eats whatever it likes outside my shop, if you please. The bread's for customers.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Joshua Kien, at your service, and I sell general goods to the freshly risen. You'd think the dead wouldn't need food and drink, but it helps the body knit together, so here we are." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, shopping in Deathknell? I've bread, water and thread, and nothing the elements would want, unless they've taken up sewing." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? You'll be after herbs, I suppose, and I only sell the kind that's been baked into bread." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll want something solid in your stomach, then, because swinging a sword on an empty belly is a fine way to get killed twice." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, is it? I've no arrows, I'm afraid, but I've bread for the road and water that only tastes a little of the well." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! The dead still need bread and water, and now they need priests too. I'm beginning to think dying changed rather less than we were told." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, buying bread! I do love that the dead still need bread, and I love even more that warlocks always buy extra." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, buying bread in Deathknell. I'll sell it to you gladly, though I've always wondered whether the dead still say grace, and you'd be the one to ask." },
      },
      choices = {
        { text = "Do the risen still need priests, Joshua?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the living buy your bread too, Kien?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Did you keep a garden before the plague, Kien?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "I'd not have thought the dead needed to eat.", next = "eat" },
        { text = "You have a shopkeeper's manner.", next = "past" },
        { text = "Your stock would be easy to lift, Kien.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could just conjure my own bread and water.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does a warrior need from your shelves, Kien?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you buy meat from hunters, Kien?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why do my kind buy extra bread, Joshua? Have you guessed?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you think the dead should still say grace, Joshua?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, friend? The shelves are still here, which is more than you can say for most of Deathknell." } },
    },
    eat = {
      lines = { { id = "e_default", text = "The apothecaries say food and drink help the flesh hold together and the wounds close faster. I can't taste a thing anymore, mind, but I eat my bread every day, because I like having all my fingers." } },
      choices = { { text = "That's grim, but fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    past = {
      lines = { { id = "p_default", text = "I kept a little shop near the old capital, selling candles and thread to farmers. Now I sell the same things to corpses, and I'll tell you this: corpses complain less about prices." } },
      choices = { { text = "You must remember some of your old customers.", next = "past_people" } },
    },
    past_people = {
      lines = { { id = "pp_default", text = "Some of them, and a few of them walk through Deathknell now with the same faces, half rotted. We nod to each other and don't talk about it, because neither of us wants to remember." } },
      choices = {
        { text = "Some memories are better left buried.", next = "BACK", reply = "They are, and I'm glad you understand. Some faces are best nodded to and left alone.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You should talk to them. Remembering keeps us human.", next = "BACK", reply = "Perhaps I should, and perhaps one day I will. Not today, though, if it's all the same.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Now and then, when the Horde sends someone through, and I've learned the living are fussier about what's gone green. I eat it anyway, since I can't taste it, but I'll sell you the fresh loaves and keep the others for the Forsaken." } },
      choices = {
        { text = "Give me the same loaves as the Forsaken. Fair is fair.", next = "BACK", reply = "Fair is fair, and you'll get no argument from me. The same loaves, then, and the same price.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The fresh ones, then. Let the dead eat the rest.", next = "BACK", reply = "Fresh ones, then, and I'll not take it personally. The dead are used to leftovers.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Only a window box, three streets from the capital's market, with thyme and a sad little rosemary in it. I tried to grow the rosemary again here, and the soil killed it in a week, which I took rather personally." } },
      choices = {
        { text = "Try again. I'll find you soil that isn't poisoned.", next = "BACK", reply = "That's kind, and I'd like to try again, if you find any. I'll keep the pot by the window.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let it go, Kien. Dead men don't need rosemary.", next = "BACK", reply = "Perhaps not, but this dead man would like some all the same. I'll keep trying, thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It would, I suppose, but the dead don't get hungry the way the living do, so you'd have stolen a loaf for nothing but the principle of it. I'd rather you paid all the same; old habits, you understand." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I had a boy lift apples off my cart in the old days, and I chased him three streets before I gave up. If that was you, I'm glad to see you've come down in the world as far as I have." },
      },
      choices = {
        { text = "I'll pay, Kien. Shopkeepers deserve that much.", next = "BACK", reply = "Thank you, and it's nice to hear. I still count the change twice, though nobody's cheated me since I died.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Principle is reason enough to steal.", next = "BACK", reply = "Then do it somewhere else, please, because I'll know, and I'll be very disappointed.", fx = { align = { order = -1 } } },
        { text = "I'd not have thought the dead needed to eat.", next = "eat" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, and the mages who come through often do, which is terrible for business and very good for my temper, since I never liked haggling. Do try my water first, though; it's from a proper well and only slightly green." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "I'd forgotten Dalaran's lot could make bread out of nothing, and now I'm wondering why I ever bothered with a shop. Still, I'm told conjured bread never tasted of much, and nor does mine now, so we're even." },
      },
      choices = {
        { text = "I'll buy from you anyway, Kien. Fair is fair.", next = "BACK", reply = "That's very kind, and my well water thanks you. Fair is fair, as you say.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Conjured food costs nothing, and nothing is better.", next = "BACK", reply = "Then enjoy your nothing, and I'll sell my bread to someone who wants it. No hard feelings.", fx = { align = { honor = -1 } } },
        { text = "You have a shopkeeper's manner.", next = "past" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken still need bread and water, which I find terribly funny, though I'm glad of it, since it keeps me in business. Don't ask me why, because nobody knows." } },
    scourge = { { id = "tp_scourge", text = "The Scourge never paid for anything, and that's the worst thing I can say about a customer. At least the Forsaken have manners." } },
    lordaeron = { { id = "tp_lordaeron", text = "I kept a shop in Lordaeron before the plague, and I kept it well. It's a different shop now and a different city, but I still say good morning to everyone who comes in." } },
    _none = { { id = "tp_none", text = "Bread and candles are my whole trade, friend, so take that question to Executor Arren." } },
  },
}

---------------------------------------------------------------------------
-- Brill
---------------------------------------------------------------------------

-- Rupert Boch: Brill's warlock trainer.
P:NPC {
  key = "boch", id = TODO_NPC("Rupert Boch"), name = "Rupert Boch", title = "Warlock Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "smooth" }, values = { "ambitious", "cunning" },
  notices = { "class", "fel" },
  impression = {
    first = "He never says anything he did not mean to.",
    third = "{name} met Rupert Boch, the warlock trainer of Brill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "A fellow practitioner, up all those stairs again. Come in, and let me see how well your little friend has been behaving." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Come in, if you must, and don't touch anything that moves, or anything that doesn't." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A fellow practitioner, and up all those stairs without complaint. Come in, and tell me how your little friend is behaving." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You aren't a warlock, but you are welcome to look around. Don't touch anything that moves." },
    { id = "g_xcult", when = { origin = "forsaken_cult_remnant" }, text = "The Cult of the Damned, before you died, unless I'm much mistaken. Don't look so stricken, because half of what I teach was learned from people like you, and none of us here can afford to be squeamish." },
  },
  notice = {
    { id = "n_pet", cat = "fel", when = { class = "WARLOCK", pet = { type = "Demon" } },
      text = "Your {pet} is watching me rather closely. Demons always look for a better master, so make sure it never sees you hesitate." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "He closes a ledger on one finger to keep his place, and smiles over it as though you were an item he had been expecting.",
      lines = {
        { id = "h_default", key = true, text = "Rupert Boch, warlock and teacher, at your service. I train those in Brill who'd sooner give orders to something with horns than take them." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Rupert Boch. Every spell I teach is a contract, {class}, with the Nether on one side and you on the other, and my whole art is making certain you get the better of the terms." },
        { id = "h_lock_void", when = { class = "WARLOCK", minLevel = 10, questBefore = TODO_QUEST("Halgar's Summons") }, text = "Rupert Boch, and you've outgrown my imps, I think. Ageron downstairs has a letter from Carendin Halgar with your name on it, and I'd collect it before he decides to be offended." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in my parlour. Your people turned their backs on my craft, I'm told, and went back to the spirits, so I do hope there are no hard feelings." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You commune with the wilds and I commune with things that would eat the wilds, so I suspect we'll get on politely and no further." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, in my parlour. You'd be surprised how many of my demons respect a good blade, {class}, and how few of them respect a good argument." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast and my demons are cousins of a sort, {class}, though yours were tamed with patience and mine with somewhat sterner methods." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, in my trainers' corner. We both deal in things beyond the veil, though your sort tends to look at mine as if I'd tracked something in on my boots." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin in my parlour, how wonderful. The demons are terribly offended, of course, but I find it refreshing to meet someone who has chosen the brighter master." },
      },
      again = {
        { id = "h_again", text = "Is there something else? Do go on, because curious minds are the only kind worth teaching." },
        { id = "h_again2", text = "Another question? Ask it plainly, and I'll answer it the same way, mostly." },
      },
      choices = {
        { text = "A warlock should master his demon, not trick it into service.", next = "BACK", reply = "Mastery lasts, and tricks wear thin. You have the makings of a proper practitioner.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Trick the demon however you can. Results are all that count.", next = "BACK", reply = "Results today, perhaps, and a very unpleasant surprise tomorrow. Demons keep careful accounts.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "You keep calling spells contracts.", next = "contract", when = { class = "WARLOCK" } },
        { text = "Teach me to curse a Scarlet properly.", next = "curse", when = { class = "WARLOCK" } },
        { text = "I served the Cult once. Does that trouble you?", next = "cult", when = { class = "WARLOCK", origin = "forsaken_cult_remnant" } },
        { text = "Do you think priests and warlocks are so different, Rupert?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The fel nearly destroyed my people, Boch. Why should I trust you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do your demons fear nature, Boch?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Rogues and warlocks have a lot in common, Boch.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Isn't warlockry just the arcane with poorer manners?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I doubt your demons could stand against a real warrior.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "A demon is nothing like a hunter's beast, Boch.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you think the Light is just another master?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Commanding demons must be dangerous.", next = "danger" },
        { text = "Why do the Forsaken allow warlocks?", next = "forsaken" },
        { text = "Goodbye.", next = "END" },
      },
    },

    contract = {
      lines = { { id = "ct_default", text = "Because that is what they are, and the demons know it even when the students don't. A shadow bolt is a loan of the Nether's spite, a curse is a lease on a man's suffering, and a summoning is a lease on a servant, and every one of them has terms the other party is reading more carefully than you." } },
      choices = {
        { text = "And the soul shards are the payment.", next = "contract2" },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    contract2 = {
      big = true,
      lines = { { id = "ct2_default", text = "The deposit, rather, and you keep it in a bag at your hip where you can count it. I tell my students to take their shards from the Scarlets and the Scourge, since it keeps the accounts tidy and nobody in Brill writes to complain. Where would you take yours?" } },
      choices = {
        { text = "From our enemies, and only from them.", next = "BACK", reply = "A warlock with principles and a ledger. I may frame you.", fx = { align = { honor = 1 } } },
        { text = "From whatever's closest when I need one.", next = "BACK", reply = "Efficient, and very slightly alarming. Do keep it out of the Executor's hearing.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    curse = {
      lines = {
        { id = "cu_default", text = "Properly is the only way I teach it. You lay the curse first and the bolt second, because a man who is already rotting from the inside fights very poorly, and the Scarlets at the Monastery road are a splendid place to practise, since they were going to try to burn you anyway." },
        { id = "cu_scourge", when = { race = "Scourge" }, text = "With pleasure. Lay the curse first and let it work while you cast, because a Crusader who is already rotting from the inside fights very poorly, and there's a pleasing symmetry in rotting a man who calls you rot." },
      },
      choices = {
        { text = "Do the curses ever turn back on the caster?", next = "curse2" },
        { text = "I'll practise on the Monastery road.", next = "BACK", reply = "Do, and bring me back a story. The good ones go in my lessons." },
      },
    },
    curse2 = {
      lines = { { id = "cu2_default", text = "Only on the careless, and only once, since it's very hard to be careless twice when you're dead again. Richard Kerwin in the Undercity will tell you it's all a matter of grammar, and for once that pedant is entirely right." } },
      choices = {
        { text = "Then I'll mind my grammar.", next = "BACK", fx = { trait = { careful = 1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    cult = {
      big = true,
      lines = { { id = "cl_default", text = "Not in the least, since the Cult kept excellent libraries and the Dark Lady has seen fit to let us borrow them. What troubles me is whether some part of you still listens for Kel'Thuzad's voice, because the Nether hears that sort of thing and has offers ready. Does it?" } },
      choices = {
        { text = "No. I serve the Dark Lady now.", next = "BACK", reply = "Then keep saying it in exactly those words. Contracts love a clear statement of allegiance.", fx = { align = { order = 1 } } },
        { text = "I serve myself, and nobody else ever again.", next = "BACK", reply = "Ah, a free agent, which is the riskiest kind of party to a contract. I'll teach you anyway, and I'll charge you twice for the warnings.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I think everything that gives power asks for something back, and the only difference is how politely it asks. My imps want souls and your Light wants you to burn, and I'm not at all certain which of us made the better bargain." } },
      choices = {
        { text = "The Light asks for faith, not souls. There's no bargain.", next = "BACK", reply = "No bargain, you say, and yet it burns you every time you call it. I'd read that contract more closely, paladin.", fx = { align = { light = 1 } } },
        { text = "Perhaps you're right. Power is power, whoever gives it.", next = "BACK", reply = "Then you've just learned the first lesson of my trade, and you're not even a warlock. Do come again.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We both ask something unseen for power, and we both pay for it, though a priest's bill comes due more politely than mine. The difference, I'd suggest, is that I always read the contract, and your sort never thought to ask for one." } },
      choices = {
        { text = "Some powers shouldn't be bargained with, Rupert.", next = "BACK", reply = "Some shouldn't, I'll grant you, but most of them have a price, and it's always worth knowing what it is.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Perhaps I should start reading contracts too.", next = "BACK", reply = "A priest who reads the small print! I'll be lending you my spectacles next.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some of them couldn't, and some of them would very much like to try, so I keep them on a short leash. A warlock who can't stand behind a warrior doesn't stay a warlock for long, so I've always thought our two trades get along rather well." } },
      choices = {
        { text = "I'll stand in front, then, and you keep them leashed.", next = "BACK", reply = "There's a warrior with sense. Hold the front and I'll keep the leash tight.", fx = { align = { order = 1 } } },
        { text = "Let one off the leash, Boch. I'd like to see it try.", next = "BACK", reply = "I'd rather not, because my imp would enjoy it far too much and you'd never hear the end of it.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than either of us would admit in polite company, since both would eat their master if the bond ever slipped. The difference is that your beast wants to stay, and mine are counting the days." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Rather a lot, though {pet} looks far happier with its arrangement than my imp ever has. Both would eat their masters if the bond slipped, but yours wants to stay, and mine are counting the days." },
      },
      choices = {
        { text = "My beast stays because it wants to. No chain needed.", next = "BACK", reply = "A lucky hunter, then. Mine stay because they have no choice, and they make sure I never forget it.", fx = { align = { honor = 1 } } },
        { text = "A bond is a bond, Boch, whatever holds it.", next = "BACK", reply = "A bond is a bond, but one breaks gently and the other breaks very messily. Remember which one you hold.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    danger = {
      lines = { { id = "d_default", text = "Of course it is, and that's exactly why so few do it well. A demon is a contract with teeth, and if you read every word of the contract, the teeth stay on the other side." } },
      choices = {
        { text = "And if you don't read every word?", next = "danger_fail" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    danger_fail = {
      lines = { { id = "df_default", text = "Then you become a cautionary tale, and I use your name in my lessons. I already have several names, so please don't add yours to the list." } },
      choices = {
        { text = "Power is worth the risk.", next = "BACK", reply = "It is, if you're careful, and I'm very careful. Come and learn, and try to stay out of my lessons.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "No power is worth bargaining with demons.", next = "BACK", reply = "Then you'll never be a warlock, which is a perfectly sensible choice. I'll wish you luck elsewhere.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Back to safer subjects, then.", next = "BACK" },
      },
    },
    forsaken = {
      lines = { { id = "f_default", text = "Because the Dark Lady values anything that can be turned on the Scourge, and the Legion's servants owe the Lich King nothing. We were slaves once, so we are not afraid of using what others fear, and we read our contracts very closely indeed." } },
      choices = {
        { text = "And if the Legion comes to collect?", next = "forsaken2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    forsaken2 = {
      lines = { { id = "f2_default", text = "Then it will find we've spent its servants on its enemies and kept the receipts. The Forsaken have had one master already and we didn't care for the experience, so I can't imagine we'd sign with another." } },
      choices = {
        { text = "I'll hold you to that, Boch.", next = "BACK", reply = "Do. I'd hold me to it as well." },
        { text = "Back to the other matters.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "You shouldn't, and that's the first sensible thing anyone's said in here today. Your people were bought cheaply by the demons and paid dearly for it, whereas I read the contract, so I think we've both learned something, only not the same thing." } },
      choices = {
        { text = "There's no safe bargain with demons, Boch.", next = "BACK", reply = "There isn't, but there are profitable ones, and I've made a career of them. I'd not recommend it to a shaman.", fx = { align = { light = 1 } } },
        { text = "Then teach me to read the contract. Power is power.", next = "BACK", reply = "Now there's a student I could teach. Sit down, and mind the imp, because he bites.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "An imp is afraid of everything, which is part of its charm, and a voidwalker is afraid of nothing, which is the rest. I've never seen either of them comfortable near a living tree, though, and I've wondered why, so do tell me if you find out." } },
      choices = {
        { text = "Nature and the fel don't mix, Boch. Remember that.", next = "BACK", reply = "I'll remember it, druid, the next time my voidwalker sulks near a tree. Nature has never been very fond of me either.", fx = { align = { light = 1 } } },
        { text = "Use whatever works. I don't judge a weapon by its source.", next = "BACK", reply = "Now there's a sensible attitude, and rarer than you'd think among your kind. You'd make a passable warlock.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "We do, since both of us make our living from things other people would rather not see. Marion Call and I share the Gallows' End very politely, and I have never once caught her in my rooms, which tells me she is very good, or very polite." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "In life I imagine you picked locks, and in death you pick them still, while I spent my life studying old books and now summon what was in them. We each kept to our trade, which I find rather touching." },
      },
      choices = {
        { text = "I'll stay out of your rooms, Boch.", next = "BACK", reply = "Splendid, and so will my imp, who has been dying to bite somebody all week.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Locks are only suggestions, Boch.", next = "BACK", reply = "So I've heard, which is why my rooms have a voidwalker instead of a lock. Do test it, if you're curious.", fx = { align = { order = -1 } } },
        { text = "Why do the Forsaken allow warlocks?", next = "forsaken" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "That's what they say in Dalaran, usually just before they ask me how it's done. The arcane bends the world, and my craft invites things into it, and I've always thought mine the more honest arrangement." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "If you were Kirin Tor, you'll know Kel'Thuzad was once a respected member, and he learned his necromancy right under their noses. I wouldn't throw stones about manners, if I were Dalaran." },
      },
      choices = {
        { text = "Dalaran's rules kept worse things out, Boch.", next = "BACK", reply = "They kept some out, and they kept others in, and one of those others was Kel'Thuzad. I'll take my honest arrangement, thank you.", fx = { align = { order = 1 } } },
        { text = "Dalaran's rules were mostly vanity, Boch.", next = "BACK", reply = "Mostly, yes, and a great many pointed hats. I'm glad a mage finally said so.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Isn't commanding demons dangerous, though?", next = "danger" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Legion is the great power behind every demon I bind, and they'd love to come back to this world. I keep a respectful distance and a firm grip on the leash." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is a dreadful bore, all moaning and grasping and no conversation. Demons are at least interesting to talk to, even if they lie constantly." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken use whatever tools are at hand, and a warlock's demon is a very good tool indeed. The Dark Lady appreciates practicality, and so do I." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad made a deal with powers he didn't understand and lost his kingdom for it. I always tell my students to read the contract twice." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, and I'm rarely afraid. Ask Magistrate Sevren." } },
  },
}

-- Carolai Anise: Brill's alchemy trainer.
P:NPC {
  key = "carolai", id = TODO_NPC("Carolai Anise"), name = "Carolai Anise", title = "Alchemy Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "brisk" }, values = { "curious", "practical" },
  notices = { "craft", "lock_stones" },
  impression = {
    first = "She thinks the apothecaries make too much noise about their work.",
    third = "{name} met Carolai Anise, the alchemy trainer of Brill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Another alchemist, and a good one, back again. Come and tell me what you've been brewing, and mind the biting vials." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind the vials, touch nothing, and tell me what you want without making a fuss of it." },
    { id = "g_shop", text = "Mind the vials; some of them bite, and the rest only eat through skin, which you'll hardly miss. What can I do for you?" },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "Another alchemist, good. Come and tell me what you've been brewing." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of peacebloom and earthroot, so you've been picking herbs. Good, because an alchemist without herbs is just someone with a lot of empty bottles." },
    { id = "n_lock_healthstone", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "Is that a healthstone? We bottle healing here, and you lot carve it out of a stone. Mine tastes better, I'm told, but I'll grant that yours doesn't spill." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I trust what I can bottle and hand to someone who's bleeding, which is a potion. The Light may well be more powerful, but I've seen it fail to come, and I've never once seen a properly brewed healing draught refuse to work." } },
      choices = {
        { text = "An alchemist should test every brew herself before she sells it.", next = "BACK", reply = "She should, though you'll forgive me if I test the deadly ones on rats. That's simply good sense.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let the buyers test it. If it kills them, they'll stop complaining.", next = "BACK", reply = "That's how the apothecaries talk, and it's exactly why I don't care for them. Get out of my workroom.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "The Light comes when it's needed. I trust it.", next = "BACK", reply = "When it comes, perhaps it does, but I've watched it not come, and I'll keep my shelves stocked all the same.", fx = { align = { light = 1 } } },
        { text = "Right. More draughts, fewer prayers.", next = "BACK", reply = "That's the sensible view, and the one my bottles would agree with. Peacebloom never once failed to show up.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Potions, for anyone who can pay, because a potion doesn't care what you believe or how tired the priest is. Still, I've watched a prayer finish what my bottles started, so I'll not quarrel with you too loudly." } },
      choices = {
        { text = "Prayer reaches what bottles can't. Both have their place.", next = "BACK", reply = "They do, and I'll grant you that a prayer finishes what I can't. Bring me your patients and I'll bring you mine.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bottles are honest. Prayer is a guess.", next = "BACK", reply = "A guess that sometimes works, and that's more than I'll say for some of my early batches. Still, I'm glad you like bottles.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing draughts first, and a strength elixir if you can afford one, though I'd rather you kept your coin for the draughts. Peacebloom and silverleaf are all you need for the basics, and they grow by the roads if you can be bothered to look." } },
      choices = {
        { text = "I'll carry draughts, Carolai, and learn to brew them.", next = "BACK", reply = "Good, and do it properly, with clean vials and fresh leaves. A sloppy draught is worse than none, because you'll trust it.", fx = { align = { order = 1 } } },
        { text = "I'll take my chances. Draughts are for the timid.", next = "BACK", reply = "The timid are the ones still walking, {class}, and I've watched the brave ones carried in. Buy one anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom and silverleaf along the roads, and earthroot in the hills if you're lucky, which is enough for a healing draught or two. A fresh corpse on the Tirisfal roads needs those draughts, so don't walk past them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} won't care for the smell of my workroom, I'm afraid. Still, you'll pass peacebloom and silverleaf on every road you hunt, and earthroot in the hills, which is enough for a draught or two." },
      },
      choices = {
        { text = "I'll pick only what I need, and leave the rest to grow.", next = "BACK", reply = "That's the way to do it, and the patches will thank you next season.", fx = { align = { honor = 1 } } },
        { text = "I'll strip every patch I find. Herbs grow back.", next = "BACK", reply = "They do, slowly, and the next alchemist after you will curse your name. Leave a little, if you can bear it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, and they don't ask what's in them, which is how I like it. A minor healing potion is a minor healing potion, whether it's for a warlock, a warrior or a dead man who can't feel his own arm, and the apothecaries make far too much fuss about it." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They do, and they don't ask what's in them, though your demon is sniffing at the stoppers as if it means to find out. A minor healing potion is a minor healing potion whoever it's for, so keep it off my shelf, and I'll make far less fuss than the apothecaries would." },
      },
      choices = {
        { text = "Then I'll buy healing draughts for the recruits too.", next = "BACK", reply = "That's generous of you, and the recruits will need them more than you think. Bless your coin purse.", fx = { align = { light = 1 } } },
        { text = "I'll buy for myself. The recruits can bleed for themselves.", next = "BACK", reply = "Fair enough, and I'll sell to them myself when they come in bleeding. Somebody always pays in the end.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Carolai Anise, and I teach alchemy here in Brill. Healing draughts, mostly, since a body that won't mend on its own needs everything the Society can bottle." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll heal with spirit waters, I expect, and I'd like to know whether they work as well on the dead as my draughts do." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Then you know peacebloom from silverleaf, at least, which puts you ahead of most of my students." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll come back cut up more than the rest, so do yourself a favour and carry healing draughts as well as bandages." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll pass more herbs in a day than my students find in a week, so keep your eyes on the ground now and then." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, then you'll know that a healing potion and a healing prayer both work better on a patient who's been told to sit still." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Do you need potions, or just a quiet corner to read in? I've both, though the potions pay better." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. You'll heal with a touch, I suppose, which is a fine thing, but I'd still carry a draught or two, because I've no idea whether the Light answers as quickly when you're dead as when you were living." },
      },
      choices = {
        { text = "Are potions or prayers better medicine, Carolai?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your potions work on the living, Carolai?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you pick herbs from the plagued fields, Carolai?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "How is alchemy different from the apothecaries?", next = "apothecary" },
        { text = "I'd not expect many herbs to grow here.", next = "herbs" },
        { text = "Do rogues come to you for more than potions, Carolai?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Alchemy seems like slow magic to me, Carolai.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What should a warrior carry from your shelves, Carolai?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What herbs grow out where I hunt, Carolai?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You must sell to those of us who deal with the Nether.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you trust potions over the Light, Carolai?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Quickly, please, before something boils over; I lost an eyebrow to that kettle, and dead brows don't grow back." } },
    },
    apothecary = {
      lines = { { id = "a_default", text = "The Royal Apothecary Society works on grand projects in the Undercity and won't say what, which is their business. I make potions that close wounds and keep people standing, and I don't need a secret laboratory for that." } },
      choices = { { text = "They're making something down there, I'd wager.", next = "apothecary_what" } },
    },
    apothecary_what = {
      lines = { { id = "aw_default", text = "Something to use against the Scourge, they say, and Apothecary Johaan at the inn asks for strange ingredients often enough. I don't ask him questions, and he doesn't ask me." } },
      choices = {
        { text = "Some secrets are worth keeping.", next = "BACK", reply = "Some are, and Johaan's are probably among them. I find it easier to sleep that way.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd want to know what they're brewing.", next = "BACK", reply = "So would I, on a bad night, but asking Johaan questions is a good way to end up on his workbench. Be careful.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Peacebloom and silverleaf grow all over the glades, even with the plague in the soil, and earthroot grows near the hills. Further south in Silverpine, you'll find mageroyal and briarthorn, if the worgen don't find you first." } },
      choices = { { text = "Thanks, Carolai. Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The healing draughts do, and so do most of the rest, since a wound is a wound whether it bleeds or not. Your spirits mend the living by asking, and I mend the dead with peacebloom and patience, and I think mine is the more reliable." } },
      choices = {
        { text = "Reliable suits me. I'll carry your draughts.", next = "BACK", reply = "Then I'll stock an extra one for you. A wound is a wound, and a draught is a draught.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The spirits haven't failed me yet. I'll trust them.", next = "BACK", reply = "Then I hope they keep that record, shaman. If they ever falter, my shelves will be here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I do, and I rinse them twice, and I've never had a draught go wrong for it. The plague in the soil doesn't seem to reach the leaves, though I'd not swear to the roots, so I leave those for Johaan, who seems to want them more than I do." } },
      choices = {
        { text = "Medicine is medicine. Use what the land gives you.", next = "BACK", reply = "That's my view, and Johaan's, and the leaves have never complained. Medicine is medicine, as you say.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'd not trust anything grown in plagued earth, Carolai.", next = "BACK", reply = "Then don't drink my draughts, and I'll not be offended, but you'll be the one bleeding on the road.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They come for poisons, mostly, and I send them to the apothecaries, who are happy to talk for an hour about each one. I make medicine, and if a rogue wants a healing draught for after the knife work, I'll gladly teach them to brew it." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I knew plenty of rogues in the capital, and each of them could have saved himself a scar with a decent salve. Learn the herbs, and you'll keep more of your skin than your teachers did." },
      },
      choices = {
        { text = "Medicine first, then. A wise rogue heals.", next = "BACK", reply = "A wise rogue indeed, and a rarer one than you'd think. Come back when you've used the first one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Poison wins fights; salves just clean up after.", next = "BACK", reply = "They do, until somebody's poison wins against you. Then you'll want the salve, and I'll be here.", fx = { align = { honor = -1 } } },
        { text = "How is alchemy different from the apothecaries?", next = "apothecary" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Slow magic that anybody can do with patience and a steady hand, which is rather the point. A mage's spell is gone when the mage is gone, but a good potion sits on the shelf and waits for whoever needs it." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's alchemists looked down on village folk who made tinctures without a word of the arcane, and now Dalaran is a half-mended ruin in the hills while my tinctures still work. Make of that what you will." },
      },
      choices = {
        { text = "Patience is a mage's virtue too, Carolai.", next = "BACK", reply = "It is, and the best ones I knew in Lordaeron could have made fine alchemists. You'll do well, I think.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A spell is quicker, and I prefer quick.", next = "BACK", reply = "Quicker, yes, but it's gone when you're gone, and a potion waits for whoever comes next. Think on that.", fx = { align = { order = -1 } } },
        { text = "I'd not expect many herbs to grow here.", next = "herbs" },
      },
    },
  },
  topics = {
    new_plague = { { id = "tp_new_plague", text = "The apothecaries talk about their great work as if it were the end of the world. I make healing potions, which actually help people, and I don't make a fuss about it." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken need potions more than anyone, since we can't feel how badly we've been hurt. A good draught of healing keeps a soldier on his feet long enough to notice." } },
    scourge = { { id = "tp_scourge", text = "The Scourge brought plague in grain, and I won't forget it as long as I can still hold a flask. I'd sooner make something that mends." } },
    _none = { { id = "tp_none", text = "Not my field. Ask Apothecary Johaan, or someone at the inn." } },
  },
}

-- Nurse Neela: Brill's first aid trainer.
P:NPC {
  key = "neela", id = TODO_NPC("Nurse Neela"), name = "Nurse Neela", title = "First Aid Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "warm" }, values = { "kind", "practical" },
  notices = { "weary", "lock_soulstone" },
  impression = {
    first = "She stitches dead flesh as carefully as she once stitched the living.",
    third = "{name} met Nurse Neela, who teaches first aid in Brill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Come in, dear, and let me look at you. Not a stitch out of place since last time, which means you've listened." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Come in, then, and let me see. Don't fidget, dear, and don't argue with me about the stitches." },
    { id = "g_hi", text = "Come in, dear, and let me see you. Don't worry about bleeding on the floor; most of my patients stopped bleeding years ago, so it makes a change." },
    { id = "g_xchapel", when = { origin = "forsaken_chapel_priest" }, text = "You were a chapel priest, I think, because you've that patient look. You'll have sat with the dying in Lordaeron, dear, so you already know the half of my work that isn't bandages." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Oh, look at the state of you! Sit down this minute, and let me see where you're torn before you lose something important." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "A soulstone, is it? That'll bring you back, but it won't stitch you up, and you'll still need bandages on the way down. Don't forget that." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It mends what's broken in you, I'd guess, but not what's missing, and you're missing a heartbeat like the rest of us. I'd still rather you tried than gave up, though, because it's the trying that keeps a patient going, or whatever it is we are now." } },
      choices = {
        { text = "A healer should treat the living and the dead with equal care.", next = "BACK", reply = "I always have, dear. A wound's a wound, whoever wears it, and every one deserves a careful hand.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Patch the Deathguard quickly and badly. They can't feel it anyway.", next = "BACK", reply = "They can't feel it, dear, but they can lose a leg for it. I'll stitch them properly, thank you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'll keep trying, Nurse, for every patient.", next = "BACK", reply = "Good, dear, and you'll be surprised how many of them you'll get back on their feet. Trying is half of it.", fx = { align = { light = 1 } } },
        { text = "The dead can't be mended. I'll not pretend otherwise.", next = "BACK", reply = "Perhaps not mended, dear, but patched and walking, and that's a great deal. I'll keep trying even if you won't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Some of it can, though it stings the poor dears like nettles, and the shadow-priests' mending is gentler on the dead. I stitched the living for twenty years, and I'll take any healing that works, whatever voice it answers to." } },
      choices = {
        { text = "Whatever heals them is worth using, Neela.", next = "BACK", reply = "That's what I've always said, dear, and it's lovely to hear a priest agree. I'll take any mercy going.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light hurts us. Leave it to the living.", next = "BACK", reply = "It does sting the poor dears, but it works, and I'd rather they stung than fell apart. Use what you like, dear.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "You don't, dear, not in the middle of it, so you step back when there's a breath and wrap it tight and quick. The dead can't feel how badly they're hurt, so check yourself after every scrap, whether it smarts or not." } },
      choices = {
        { text = "I'll check after every fight, Nurse. I promise.", next = "BACK", reply = "Good, and I'll be checking too, whether you like it or not. Come and see me after the next one.", fx = { align = { order = 1 } } },
        { text = "I'll bleed later, Nurse. The fight comes first.", next = "BACK", reply = "Then you'll bleed later in my chair, dear, and I'll scold you for every stitch. Do be careful.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, dear, when a hunter carries one in and asks nicely, though a hurt animal doesn't understand you're helping, so it's mostly patience and a firm grip. Keep your beast fed and rested, and it'll mend faster than either of us." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Now and then, dear, and I'd tend {pet} if it came to that, though a hurt animal doesn't understand you're helping. Keep it fed and rested, and it'll mend faster than either of us." },
      },
      choices = {
        { text = "I'll look after it, as it looks after me.", next = "BACK", reply = "That's the right way round, dear, and your beast will be the better for it. Bring it in if it's hurt.", fx = { align = { honor = 1 } } },
        { text = "It's a beast, Nurse. It'll heal or it won't.", next = "BACK", reply = "It might not, dear, and then you'll be walking alone. Feed it, rest it, and let me look at it sometime.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because if you're one of us you can't feel it when you're hurt, and you'll be the last to know you're bleeding, dear. And if you're living, well, the Scarlets shoot at you too, so learn to tie a bandage, and tie it tight." },
      },
      choices = {
        { text = "I'll learn, and bandage others too.", next = "BACK", reply = "Good, dear, because you'll be the only one in the party who can. Hold still and I'll show you the knot.", fx = { align = { light = 1 } } },
        { text = "I'll learn, but I bandage myself first.", next = "BACK", reply = "That's sensible enough, dear, so long as you get round to the others after. Nobody bleeds alone in my ward.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Nurse Neela, and I teach first aid to anyone who wants to learn it. The priest is always busy somewhere else when you're coming apart at the seams, so carry a bandage and a needle." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, dear? I'm told you can mend a wound with a word, which would put me out of work, so do be quiet about it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, dear? Sit down and let me see those paws, or hands, whichever you're using today." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, dear? Then you'll need bandages more than anyone, so come and learn before you bleed out somewhere I can't reach you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, dear? Your beast will come back cut up too, I expect, and I've stitched a wolf or two in my time, though they never thanked me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Bless you for coming, because half of Brill walks around with wounds they can't feel, and I could use another pair of hands that know how to close them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, dear? You'll want to learn to bind a wound, because conjured water won't stop the bleeding." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, dear? Then you can mend wounds as well as I can, though I'd bet you never think to mend your own, because paladins never do, alive or dead." },
      },
      choices = {
        { text = "Can the Light still heal Forsaken flesh, Nurse?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would you teach me bandages, Neela, though spirits heal me?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You must stitch up the living now and then, Neela.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "You must have been a nurse in life too.", next = "past" },
        { text = "How do you bandage the dead?", next = "dead" },
        { text = "I come back cut up most nights, Nurse.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My demon took a bite out of me, Neela. It'll regret it.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "How do I patch myself up in a fight, Nurse?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'd guess you mend beasts now and then, Nurse.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why should a mage learn first aid, Neela?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you think the Light can mend the dead, Nurse?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye, Nurse.", next = "END" },
      },
      again = { { id = "h_again", text = "Is there anything else, dear, before I go back to rolling bandages? The dead go through them by the basket, since nothing of ours closes on its own." } },
    },
    past = {
      lines = { { id = "p_default", text = "I was, in a little house near Lordaeron, and I nursed people through the plague until it took me too. When I woke up, the first thing I did was look for someone to help, so I suppose some habits outlast the grave." } },
      choices = {
        { text = "That's admirable, nurse.", next = "BACK", reply = "That's kind of you, dear, though it doesn't feel admirable, only useful. It's what I'm good for.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Helping didn't save them. Look after yourself now.", next = "BACK", reply = "Perhaps it didn't, dear, but it kept me busy, and busy is better than mourning. I'll look after myself when there's nobody left to look after.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "The same as the living, mostly, only tighter, because dead flesh doesn't pull itself together on its own. Linen bandages and patience, and a strong stomach, because you'll see things I won't describe." } },
      choices = { { text = "I'll need linen from somewhere.", next = "dead_linen" } },
    },
    dead_linen = {
      lines = { { id = "dl_default", text = "From the people you fight, dear, since half of Tirisfal walks around in old cloth. The Scarlet Crusade carry plenty of it, and they won't need it once you're finished with them." } },
      choices = { { text = "Thank you, Nurse. Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Of course I would, dear, because spirits get tired and busy just like priests do. A bandage in your pack never needs asking twice, and when your healing runs dry halfway across Silverpine, you'll thank me." } },
      choices = {
        { text = "A healer should know every way to mend, Neela.", next = "BACK", reply = "That's the spirit, dear, and the bandage won't mind being asked. Come and practise on Deathguard Saltain's arm.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll learn it to save my own skin, nothing more.", next = "BACK", reply = "That's reason enough to learn, dear, and I'll teach you anyway. Your skin is worth saving too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Now and then, when the Horde sends someone through who's lost an argument with a Crusader. The living flinch and the dead don't, and I'd forgotten how much I liked the flinch, dear, because it means the body is still fighting." } },
      choices = {
        { text = "Then stitch whoever comes, living or dead.", next = "BACK", reply = "I always do, dear, and the thread doesn't care who it holds together. Bring them all in.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Save your thread for the Forsaken. The living have priests.", next = "BACK", reply = "The living have priests, dear, but the priests don't come out to Brill much. I'll stitch whoever turns up.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you'd best learn to stitch yourself, since you clearly don't intend to stop doing whatever it is you do. The dead don't bleed much, but a deep cut still lets the rot in, and rot is harder to mend than any wound." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I patched up a few cutpurses in life, and they always swore they'd tripped over something. You may tell me you tripped too, if you like; I'll stitch you all the same." },
      },
      choices = {
        { text = "I'll learn to stitch myself, Nurse.", next = "BACK", reply = "Good, dear, and use the waxed thread, it holds better on dead skin. I'll show you the knot.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep going out, cuts and all.", next = "BACK", reply = "Then I'll see you back in my chair soon, dear, and I'll keep the needle warm. Do try not to lose a limb.", fx = { align = { order = -1 } } },
        { text = "How do you bandage the dead?", next = "dead" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do that, I'm told, and after the warriors it's the warlocks I see most often. Hold still and let me look, because a bite from something out of the Nether doesn't close the way a dog's does." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I spent my life closing wounds, and you've made a habit of opening doors that ought to stay shut. I'll patch you, of course, but I'd like it known that I disapprove." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They do that, I'm told, and yours is still watching you as though it's thinking about a second helping. Hold still and let me look, and send it to the far side of the room, because a bite from something out of the Nether doesn't close the way a dog's does." },
      },
      choices = {
        { text = "Patch me up, and I'll try to stay in one piece.", next = "BACK", reply = "Hold still, then, dear, and tell your demon to stop staring at me. You'll be right as rain.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Disapprove all you like. I'll keep calling them up.", next = "BACK", reply = "I don't disapprove, dear, I only stitch, and I'll stitch you as many times as it takes. Do try to keep your fingers.", fx = { align = { order = -1 } } },
        { text = "You must have been a nurse in life too.", next = "past" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Forsaken flesh doesn't heal on its own the way living flesh does, so you have to stitch it carefully and stitch it often. I was a nurse when I was alive, and I'm a better one now." } },
    scourge = { { id = "tp_scourge", text = "The Scourge never stitched anything. They just piled bodies together and called it an army, and I've spent my death undoing their handiwork." } },
    lordaeron = { { id = "tp_lordaeron", text = "I nursed soldiers home from the Second War in Lordaeron's hospitals. They came back with arrows in them, and now my patients come back with arrows in them and don't notice." } },
    _none = { { id = "tp_none", text = "I wouldn't know that, dear. Ask Innkeeper Renee downstairs." } },
  },
}

-- Zachariah Post: sells undead horses in Brill.
P:NPC {
  key = "zachariah", id = TODO_NPC("Zachariah Post"), name = "Zachariah Post", title = "Undead Horse Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "dry" }, values = { "practical", "proud" },
  notices = { "mount", "purse", "lock_steed" },
  impression = {
    first = "He swears his skeletal horses are better than the living kind.",
    third = "{name} met Zachariah Post, who sells undead horses in Brill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, a customer who knows a fine mount when they see one. Come and look at the horses; they've been asking after you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Look at the horses, if you like, but don't touch them, and don't waste my time." },
    { id = "g_shop", text = "Looking for a mount that never tires, never eats and never grieves when you fall? You've come to the right stable." },
    { id = "g_young", when = { maxLevel = 39 }, text = "Come back when you're more experienced, friend, but you're welcome to look at the horses until then." },
    { id = "g_xknight", when = { origin = "forsaken_risen_knight" }, text = "You look at my horses like a knight of the Silver Hand, measuring the legs before the face. You'll have ridden a white charger once, and mine are bonier, but they don't scare and they never tire." },
  },
  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "That's a fine mount you're sitting on, though it'll need feeding and rest. Mine won't." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Fire and fel, and gone the moment you dismount, I'll bet. Mine stand in the yard all night and are still there in the morning, so come back when you want a horse that stays." },
  },
  start = "hello",
  nodes = {
    w3_favourite = {
      lines = {
        { id = "w3_favourite_1", text = "The black gelding at the end, with one white bone in his foreleg where the hide's worn through. He stamps when anyone comes near, every time, as if he still remembers being proud, and I've never once managed to sell him." },
      },
      choices = {
        { text = "Have you tried?", next = "w3_tried" },
        { text = "Perhaps he's waiting for the right rider.", next = "BACK", reply = "That's what I tell myself, and it's a merchant's lie, but it's a comfortable one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_tried = {
      lines = {
        { id = "w3_tried_1", text = "Twice, and twice the buyer brought him back within the week, saying he wouldn't take the bit. He takes it from me, mind, every morning, and walks the paddock with me, so I suppose he's decided who he belongs to." },
      },
      choices = {
        { text = "Then he's yours. Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The knights of Lordaeron rode white chargers into battle, and look where it got them. A horse of bone doesn't tire or bolt, and it won't mind your Light, so I'd say a paladin of the Forsaken deserves a better mount than the Silver Hand ever had." } },
      choices = {
        { text = "A horse merchant should tell the buyer the beast's true age.", next = "BACK", reply = "Mine never age, so I never have to lie. That's the beauty of a skeletal horse.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the broken nags as warhorses. The dead don't check teeth.", next = "BACK", reply = "They don't have teeth to check, half of them. No, I sell only the soundest bones.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "The Silver Hand's chargers were noble. I'll honour that.", next = "BACK", reply = "They were, and the Silver Hand's riders sat them well. I'll find you one that holds its head high.", fx = { align = { honor = 1 } } },
        { text = "Nobility didn't save them. I'll take the bones.", next = "BACK", reply = "Bones it is, then, and a fine choice. They'll carry you to the Bulwark and never once ask why.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "One or two of them still shy at a church bell, which is a funny thing in a horse with no ears to speak of. I like to think it's the ones that pulled the carts to Sunday service, and I keep them away from the chapel road for their own sake." } },
      choices = {
        { text = "That's kind of you, Zachariah. They earned their rest.", next = "BACK", reply = "They did, and they'll get it, in my stable at least. A bell won't trouble them here.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're only bones, Zachariah, so don't get sentimental.", next = "BACK", reply = "Bones they are, and bones they'll stay, but I'll keep them away from the bells anyway. Habit, you understand.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Into it, through it and out the other side, because they've nothing left to fear and nothing left to lose. A living horse bolts when the Crusade's arrows fly, but mine just keep walking, which is a comfort when you're the one on top." } },
      choices = {
        { text = "A mount that never bolts is a soldier's best friend.", next = "BACK", reply = "It is, and you'll not find a steadier one in Lordaeron. Ride it into the Crusade's lines and it'll carry you out again.", fx = { align = { order = 1 } } },
        { text = "I'd rather a beast with some sense of danger.", next = "BACK", reply = "Then you'll want a living horse, and you'll have to feed it and calm it and bury it eventually. Mine save you all that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Keep up? It'll run all night without a breath, and the deer never hear it coming because it doesn't pant. The only trouble is the smell, which spooks some game, so ride downwind and you'll do fine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep up? It'll run all night, and your {pet} will tire long before it does. The only trouble is the smell, which spooks the deer, so ride downwind and you'll do fine." },
      },
      choices = {
        { text = "Living beasts for me, Zachariah. The dead should rest.", next = "BACK", reply = "That's your choice, hunter, and I'll not argue. They've had their rest and come back anyway.", fx = { align = { light = 1 } } },
        { text = "A mount that never tires is worth any smell.", next = "BACK", reply = "There's a hunter with sense. Ride downwind, and the deer will never know what's coming.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "To a Forsaken mage, gladly, and to a troll once the Undercity's said yes, which it does slowly. They never tire, never need feeding and never mind a mage's cold, which a living horse certainly would." },
      },
      choices = {
        { text = "I'll earn the Undercity's trust, then.", next = "BACK", reply = "Good, and they'll come round, given time. I'll keep a horse saddled for you.", fx = { align = { order = 1 } } },
        { text = "Respect's a slow road. I'll find my own way.", next = "BACK", reply = "Your own way, then, and I'll be here when you change your mind. They always do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zachariah Post, and I sell undead horses to the Forsaken of Brill. They don't eat, they don't sleep, and they don't spook at a bit of plague, which is more than you can say for a living horse." },
        { id = "h_other", when = { ["not"] = { race = "Scourge" } }, text = "Zachariah Post, and I sell undead horses, mostly to the Forsaken. You're not one of us, so I'll tell you plainly that you'd need to earn the Undercity's respect before I'll sell you one." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll have your own mounts back in Durotar or Mulgore, I expect, and I'll admit my horses are cold to sit on, and they drop bits." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, looking at my horses with that face. Yes, they're dead, and no, they don't mind it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll want a mount that doesn't flinch when the swords come out, and mine never flinch at anything." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll be comparing my horses to your beasts, I expect, so I'll tell you now that mine don't need feeding and never wander off." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! My horses don't need blessing, mind, since they're past all that, but I'll not stop you if you want to try." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! You'll teleport home, I suppose, but a skeletal horse goes where your spells don't." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken! Now you'll want a proper charger, I expect, and I'll tell you plainly that my skeletal horses don't flinch at the Light, or at much of anything else." },
      },
      choices = {
        { text = "Do your horses remember what they were, Zachariah?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your horses mind a shaman on their backs, Zachariah?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "These horses should be allowed to rest, Zachariah.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your horses.", next = "BUSINESS" },
        { text = "Where do the horses come from?", next = "where" },
        { text = "I'd want a living horse over a dead one.", next = "better" },
        { text = "A skeletal horse must be quiet on the road.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My steed comes from the Nether, Zachariah. I've no need of yours.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will your horses carry a warrior into a fight, Zachariah?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "A dead horse can't keep up on the hunt, Zachariah.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would you sell a horse to a mage, Zachariah?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would a paladin ride one of your horses into battle, Zachariah?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Which of your horses is your favourite?", next = "w3_favourite" },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? The horses aren't going anywhere, and neither am I; the dead keep very few appointments." } },
    },
    where = {
      lines = { { id = "w_default", text = "The same place we come from, mostly: the plague left plenty of dead horses in Lordaeron, and the Dark Lady's servants know how to raise them. They were warhorses and farm horses once, and now they're ours." } },
      choices = {
        { text = "That's a good use for the plague's dead.", next = "BACK", reply = "It is, and I've never once heard a horse complain. They're working again, which is what they always wanted.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "They should have been left to rest.", next = "BACK", reply = "Perhaps they should, but they're up now, and they seem happy enough to carry someone. I'll not send them back.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    better = {
      lines = { { id = "b_default", text = "A living horse needs rest and food and gets frightened of everything in Tirisfal. A dead horse goes until you stop, and it doesn't care if you're riding it through the Plaguelands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They don't mind anything, which is their chief selling point. A living horse would shy from your lightning, but mine have been struck by worse and dead for longer, so if the Undercity vouches for you, I'll put you on one." } },
      choices = {
        { text = "Then I'll earn the Undercity's trust first.", next = "BACK", reply = "Good, and they'll come round soon enough, given a few dead Crusaders. The horses will wait.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep my own mount. I want no favours.", next = "BACK", reply = "Your choice, shaman, and a proud one. Your wolf, or whatever you ride, will get along fine without mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Should they? They were warhorses and plough horses once and they died in harness, so I'd say they're doing what they always did. You can tell me it's unnatural, druid, and I'll tell you so am I, and we'll both be right." } },
      choices = {
        { text = "Unnatural or not, they serve. I'll not judge them.", next = "BACK", reply = "That's all I ask, druid, and all they ask too. Thank you for not making a fuss.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "They should rest. Some things belong in the ground.", next = "BACK", reply = "Then I'd have to go back too, by that reckoning. I'll keep my horses, and you keep your thoughts.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quiet as a grave, which is near enough what it is, and it never snorts or whinnies when you'd rather it didn't. I've sold a fair few to deathstalkers for that very reason, though they never tell me where they're riding." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "A Forsaken cutpurse on a dead horse is about the quietest thing on the Tirisfal roads, aside from a Crusade patrol that's already seen you. You'll be wanting one, I think." },
      },
      choices = {
        { text = "I ride to strike unseen. Quiet suits me.", next = "BACK", reply = "Then you'll want the quietest one I've got, and I've got a very quiet one. The deathstalkers swear by her.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I ride openly, Zachariah. Let them see me coming.", next = "BACK", reply = "Then you'll want the tallest one, so they get a good look. I'll find you one with presence.", fx = { align = { honor = 1 } } },
        { text = "I'd want a living horse over a dead one.", next = "better" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "So I've heard, and very fine they are, all fire and fel, but they vanish when you're done and mine are still here in the morning. When your summoning fails you on the road to the Bulwark, you'll think of me kindly." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc who'd rather summon a horse than ride a wolf is a thing I never expected to see in Brill. Mine don't bite, either, which is more than your people's wolves can promise." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "So I've heard, and your demon is giving my horses a look they don't care for at all. Your steeds vanish when you're done with them, but mine are still here in the morning, so when your summoning fails you on the road to the Bulwark, you'll think of me kindly." },
      },
      choices = {
        { text = "A beast in the stable is wise, I'll admit.", next = "BACK", reply = "It is, and you'll thank me on the road to the Bulwark. I'll keep one saddled.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll trust my own summoning, Zachariah. It burns brighter.", next = "BACK", reply = "Then I'll wish you a long road and a reliable demon. I'll be here when it fails you.", fx = { align = { order = -1 } } },
        { text = "Where do the horses come from?", next = "where" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken ride skeletal horses because they don't tire and they don't need feeding. Any Forsaken worth his bones will want one, and I'll be happy to oblige." } },
    scourge = { { id = "tp_scourge", text = "The Scourge has its own skeletal mounts, and they're terrible things, badly put together. Mine are built by craftsmen, and you can tell the difference in the gait." } },
    thrall = { { id = "tp_thrall", text = "The orcs think my horses are an insult to the spirits, and they won't touch one. They ride wolves, and they think it's a grand idea, so I've no more to say on the matter." } },
    _none = { { id = "tp_none", text = "Don't know, friend. I only know horses, and dead ones at that." } },
  },
}
