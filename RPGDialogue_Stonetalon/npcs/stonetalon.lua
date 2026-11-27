-- Stonetalon Mountains. Voice: bibles/stonetalon.md
-- Sun Rock Retreat and Malaka'jin (Horde), Stonetalon Peak (Alliance, neutral keeper).
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maggran", id = TODO_NPC("Maggran Earthbinder"), name = "Maggran Earthbinder",
  bible = "bibles/stonetalon.md", role = "soldier", tier = "major",
  communities = { "sun_rock" }, temper = { "hard" }, values = { "loyal", "brave" },
  likesTone = "blunt",
  prejudice = { class = "WARLOCK", amount = 12, why = "Holds Sun Rock for Cairne; he believes what Cairne told him of demon blood and the orcs." },
  notices = { "kit", "race", "lock_shadow", "lock_shards" },
  impression = {
    first = "He says he was gentle once, before the battles took it.",
    third = "{name} met Maggran Earthbinder, the battle-hardened tauren who holds Sun Rock Retreat for Cairne Bloodhoof.",
  },

  greetings = {
    { id = "g_rock", text = "The wind is strong on Sun Rock and An'she stronger, which is good for old wounds. Say what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the rock, good. I've work for the ones who come back." },
    { id = "g_away", when = { away = 14 }, text = "You've been away from the rock {away}, and the wind has been blowing hard the whole time. I've work for the ones who come back, so say what you need." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were green when you first climbed to Sun Rock, and now you carry yourself like a warrior who has bled for it. The years do that, and so do battles." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word on the rock is you made someone back down without a fight. I was gentle once, and I've learned there's a time for a hard look." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "Cairne told me what demon blood made of the orcs, and I believe him. You'll keep your distance from my braves while you're on Sun Rock." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I hold this rock for the High Chieftain, and I'll not have fel carried onto it. Speak fast, and walk where my scouts can see you." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've fought for Sun Rock and kept your demons off it, as I asked. I'll not call you friend, but I'll call you useful." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear up here, where the wind could knock you off the rock. Your people's witch doctor down at Malaka'jin keeps strange company, so don't go catching it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been bloodied. Good; it means you fought. Now mend, and fight smarter." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of my people. You'll find me less gentle than the elders, for the years and the battles took that from me." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "You smell of the green skies of Draenor, warlock, the same stink that hung on the old Horde when the demon blood was in us. I spent years washing it out of my memory, and you've walked it back into my camp." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "How many souls are rattling in that bag of yours? The Shadow Council's warlocks carried them by the sackful, and I'll not have a Bloodfury's soul serve anyone who sits at my fires." },
  },

  start = "hello",
  nodes = {
    dd_goblins = {
      lines = {
        { id = "dd_gb_default", text = "No, they won't, because there's always more coin in the next valley. They cut the forest down to the stumps and sell the wood to anyone who'll buy it, and when the trees are gone they'll come for the stone under Sun Rock itself. I was gentle once, as I told you, but I'm not gentle with them." },
      },
      choices = {
        { text = "Then we drive them out of Stonetalon entirely.", next = "BACK", reply = "That's my aim, and the Warchief's, if he could spare me the grunts. Keep killing them, and maybe the next shipment won't come.", fx = { align = { light = -1 } } },
        { text = "They'd stop if someone made peace worth their coin.", next = "BACK", reply = "You may be right, but I'll not be the one to pay the Venture Company to stop murdering trees. That's a deal I'd sooner make with an axe.", fx = { align = { light = 1 } } },
        { text = "Something else, Maggran.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I hold it against the knights who carried it over the camps, and none of them were you. Cairne gave me Sun Rock to hold, and I hold it for the Horde. Hold it with me, and I won't care what you pray to." } },
      choices = {
        { text = "Then I'll hold Sun Rock with you, Maggran.", next = "BACK", reply = "Then we'll hold it together, paladin, and the harpies can learn what a Forsaken with a hammer feels like.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I hold the Light, not your rock.", next = "BACK", reply = "Hold what you like, but you'll stand on my rock while you do it. The harpies won't ask what you pray to before they dive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Sun Rock stands against them every day, though I have only so many braves and the goblins have more saws than I have spears. I was gentle once, and I would have waited for the Earth Mother to drive them out, but these days I would rather drive them out myself." } },
      choices = {
        { text = "Drive them out, but spare the workers who surrender.", next = "BACK", reply = "That is what my younger self would have said, and he'd be glad to hear it. Spare those who drop their saws, then, and break the rest.", fx = { align = { honor = 1 } } },
        { text = "No quarter. Every goblin holding a saw is an enemy.", next = "BACK", reply = "I've felt that way on the worst days, and I'll not pretend otherwise. But a brave who kills a kneeling goblin brings shame on Sun Rock.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Bloodfury harpies are not beasts, though they fight like them, and they come at us from the cliffs. Below, the Pridewing wyverns are hunting closer than they used to, and they will take a kodo calf if they can." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The Bloodfury harpies are not beasts, though they fight like them, and they come at us from the cliffs. Your {pet} has a steady eye, {class}, and I trust a beast that does not flinch from the wind. It will serve you well on these cliffs." },
      },
      choices = {
        { text = "I'll guard Sun Rock's herds from the wyverns.", next = "BACK", reply = "Then the herders will bless your name, and so will I. A kodo calf is worth more to Sun Rock than a dozen harpy feathers.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt the harpies. The herds can guard themselves.", next = "BACK", reply = "The herds can't guard themselves against wings, but the harpies need killing too. Go, then, and I'll find someone else to watch the calves.", fx = { align = { honor = -1 } } },
        { text = "Something else, Maggran.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd send you down into the Charred Vale ahead of the braves, because the Bloodfuries scatter when they see spears coming and stand when they don't. Find where Bloodfury Ripper, their leader, roosts and come back to tell me, and leave the killing to whoever I send after you." } },
      choices = {
        { text = "I'll bring you her roost, and the braves can finish it openly.", next = "BACK", reply = "That is the way I'd have it done, and the braves will be glad of the honour. Bring me the roost, and we'll take her in daylight.", fx = { align = { honor = 1 } } },
        { text = "If she sleeps when I find her, she won't wake again.", next = "BACK", reply = "I'll not stop you, but I'll not ask it of you either. If you do it, be sure it's her and not a scout.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, I blame the hands that lit it and the greed that fed it, though fire never cared much whose hands those were. If you fight the harpies with flame, fight them on the bare rock, so whatever's growing back in the vale keeps growing." } },
      choices = {
        { text = "I'll keep my fire off the green ground.", next = "BACK", reply = "Thank you, because Tammra's shoots are fragile, and so is my temper about them. Fight on the bare rock, and let the vale grow.", fx = { align = { light = 1 } } },
        { text = "Harpies first. The vale will grow back either way.", next = "BACK", reply = "Either way, maybe, but slower every time. Kill the harpies, but think of the ones who'll walk the vale after us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'll take any blade or spell that thins the Bloodfuries, and the Warchief says your kind serve the Horde now. But if I see anything of yours that crawled out of the Nether near the braves' fires, I'll put my axe through it before I ask whose it was." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'll take any blade or spell that thins the Bloodfuries, and the Warchief says your kind serve the Horde now. But you've brought one of your demons to my fire already, and our people carried that taint long enough, so keep it back, or I'll put my axe through it before I ask whose it was." },
      },
      choices = {
        { text = "Fair. My servant will keep well away from your braves.", next = "BACK", reply = "Then we'll get along, and the braves will sleep easier. Thin the Bloodfuries, and I'll remember it.", fx = { align = { order = 1 } } },
        { text = "My servant goes where I send it, Maggran.", next = "BACK", reply = "Then send it far from my fires, or you'll be sending it home in pieces. I meant what I said.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_mg = {
      lines = {
        { id = "wmg_default", text = "Windshear Crag, where the Bloodfury nest, and the Webwinder Path, where the spiders take whoever the harpies miss. I lost my patience for small fights long ago, warrior, so take the big ones and leave the small ones to the braves." },
        { id = "wmg_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "A Razor Hill grunt, a long way up a mountain. Orgrimmar trains its grunts to hold a gate; up here there are no gates, only cliffs, and the harpies come at you off every ledge." },
      },
      choices = {
        { text = "The big ones, then. I'll start with the Ripper.", next = "BACK", reply = "Then go, and may the Earth Mother guide your axe. Bring me the Ripper's head, and I'll mount it where the harpies can see it from the cliffs.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'll pick them off where they're weakest.", next = "BACK", reply = "That's a hunter's way, not a warrior's, but I'll take it. The weak ones die just as dead.", fx = { align = { honor = -1 } } },
      },
    },
    shaman_mg = {
      lines = {
        { id = "smg_default", text = "Not to me; I'm a warrior, whatever my name says, and the spirits stopped talking to me when I stopped listening. The wind up here is kind to my old wounds, though, and I suppose that is the spirits' way of speaking to someone too stubborn to hear." },
        { id = "smg_rise", when = { origin = "tauren_spirit_rise" },
          text = "You stood at the Spirit Rise and they answered you, I can see it in how you carry the totems. Then ask the wind about the Charred Vale, because it was screaming the night the fires came, and I've never known why." },
      },
      choices = {
        { text = "The wind here is restless. Something hurts it.", next = "shaman_mg2" },
        { text = "Something else, Maggran.", next = "BACK" },
      },
    },
    shaman_mg2 = {
      lines = {
        { id = "smg2_default", text = "The Venture Company's saws and the goblins' fires, most likely, and the harpies on top of it. If you can soothe what's angry up here, do it; I'd sooner have the spirits on our side than one more brave." },
      },
      choices = {
        { text = "The spirits ask for balance, not for sides.", next = "BACK", reply = "The spirits may ask it, but the goblins don't. Still, I'll take balance over another angry storm.", fx = { align = { order = -1 } } },
        { text = "Then I'll ask them to stand with Sun Rock.", next = "BACK", reply = "Then do it, shaman, and I'll owe you more than I can say. One more spirit on our side is worth a dozen braves.", fx = { align = { order = 1 }, affinity = 2 } },
      },
    },
    forsaken_mg = {
      big = true,
      lines = {
        { id = "fmg_default", text = "Then you and I have both lost something we can't get back, though I'd say you lost more of it. Cairne sent me here to heal; I don't know who sends your kind anywhere to heal, or whether you would go." },
      },
      choices = {
        { text = "Some of us would. If there were anywhere.", next = "BACK", reply = "There may be, one day, and I'd be glad to see it. The Earth Mother is patient even with the dead, I think.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Healing's for the living. I want my due.", next = "BACK", reply = "Then take it from the harpies, and I'll not ask what you mean by it. Sun Rock has its own debts to collect.", fx = { align = { light = -1 } } },
      },
    },
    xhpriest = {
      big = true,
      lines = {
        { id = "xhpriest_default", text = "It needs more than one, because the Grimtotem took Camp Aparaje and the Bloodfury harpies take whatever else they can reach. I was gentle once, before the years took it from me, so heal my braves the way I would have tried to, and don't ask me to watch." },
      },
      choices = {
        { text = "I'll heal every brave you send me.", next = "BACK", reply = "Then you'll be the most welcome face on this rock. The braves will come to you bloody, and they'll leave grateful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll heal the ones who can still fight.", next = "BACK", reply = "A brave who can't fight still has a family waiting in Thunder Bluff. Heal them all, if you can, and let the Earth Mother sort the rest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_goblins", tags = { "news" }, when = { questDone = TODO_QUEST("Goblin Invaders") },
          text = "Seereth says you've been cutting down the Venture Company's loggers in Windshear Crag. Good, because every goblin who falls there is one less saw in the forest and one less pair of eyes watching my walls." },
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "You found the bottom of one of these cliffs the hard way, I see. Stonetalon is made of drops, and the ground at the end of them doesn't care how strong you are, so watch your feet as closely as you watch your enemies." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin at Sun Rock. I was gentle once. The Silver Hand's camps took some of that, and the wars took the rest." },
        { id = "h_default", key = true,
          text = "I'm Maggran Earthbinder. Cairne gave me Sun Rock to hold, and the wind and sun here to ease what the years and a spider's fang did to me. I was gentle once, but I'm not anymore." },
        { id = "h_harpies", tags = { "news" }, when = { questActive = TODO_QUEST("Harpies Threaten") },
          text = "The Bloodfuries are why there are more harpies in Kalimdor every year, and they hem in every living thing near their roosts. Cull them in the Charred Vale, and strike hard." },
        { id = "h_bloodfury", when = { questActive = TODO_QUEST("Bloodfury Bloodline") },
          text = "Bloodfury Ripper is all but a queen to that flock, and she keeps to the western hills of the Charred Vale. End her, and the rest will scatter like leaves." },
        { id = "h_spiders", when = { questActive = TODO_QUEST("Arachnophobia") },
          text = "Besseleth and her brood hunt the Webwinder Path at night, out of Sishir Canyon. Her fang found me once, two feet of it, and I barely got clear, so kill her and I'll sleep easier." },
        { id = "h_reserves", when = { questActive = TODO_QUEST("Calling in the Reserves") },
          text = "Grish Longrunner has guarded the Great Lift a long while and asked to see his family. Take him my letter; it tells him a reserve warrior is coming to relieve him." },
        { id = "h_ripper_dead", when = { questDone = TODO_QUEST("Bloodfury Bloodline") },
          text = "Since the Ripper fell, the anger's gone quiet in me, and I hardly know what to do with the silence. Perhaps it's time I looked to the good, as a tauren should." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You came up the rock without the wind giving you away, and the harpies would pay well to learn that trick. Use it on them before they learn it from someone else." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "So you're a mage, and the Venture Company's fires are still smoking in the vale below us. I hope you keep a tighter hold on yours than the goblins did on theirs." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "There's a smell on you I've been told about. Cairne has told me what demon blood did to the orcs before Thrall freed them, and I'll not see that sickness carried onto Sun Rock in anyone's bag." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I smell demon on you, and Sun Rock has enough enemies without one walking in behind a Horde banner. Say what you have to say." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've kept your word on Sun Rock, so I'll keep mine. Speak, and I'll listen." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Sun Rock's beasts have grown restless since the vale burned, and a hunter who knows how to turn them back is worth more to me than a spear." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. Good, because I have wounded braves who need healing and a forest down the slope that needs it even more." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Sun Rock has wounded enough to keep you busy, so don't wait for me to ask." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bloodfury", min = 30 } }, text = "The Bloodfury harpies have been quieter on the cliffs since you went up among them, and my braves have noticed. Good work, and keep at it, because there are always more of them." },
      },
      again = {
        { id = "h_again", text = "What else? Say it plainly; I've no patience left for riddles." },
        { id = "h_again2", text = "Go on. The rock's quiet for once, and I can spare the time." },
      },
      choices = {
        { text = "The Venture Company won't stop at Windshear, will they?", next = "dd_goblins", when = { questDone = TODO_QUEST("Goblin Invaders") } },
        { text = "What hardened you?", next = "hard" },
        { text = "Sun Rock seems troubled.", next = "troubles" },
        { text = "Tell me about the spider that nearly had you.", next = "besseleth" },
        { text = "What does Sun Rock do up here?", next = "work" },
        { text = "The Ripper is dead. How do you feel?", next = "after", when = { questDone = TODO_QUEST("Bloodfury Bloodline") } },
        { text = "Cairne sent you here. Why?", next = "cairne", when = { race = "Tauren" } },
        { text = "I'll help hold Sun Rock.", next = "END", reply = "Then the Earth Mother has sent you, and I'll be glad of the help. The harpies hit us hardest at dawn, so rest tonight.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'm a warrior. Put me where the harpies hit hardest.", next = "warrior_mg", when = { class = "WARRIOR" } },
        { text = "Do the spirits of this mountain speak to you?", next = "shaman_mg", when = { class = "SHAMAN" } },
        { text = "I was gentle once too, before I died.", next = "forsaken_mg", when = { race = "Scourge" } },
        { text = "How would you use a rogue on Sun Rock, Maggran?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do you blame all fire for the Charred Vale?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What beasts threaten Sun Rock, Maggran?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Will you take my help against the harpies, whatever you've heard of me?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Sun Rock must stand against the Venture Company too, Maggran.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Sun Rock must need a healer, Maggran.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you hold the Light against me, Maggran?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been replanting the stumps below Sun Rock, Maggran.", next = "xorig_regrow", when = { origin = "tauren_stonetalon_regrower" } },
        { text = "Sun Rock can hold itself. I have my own road.", next = "END", reply = "Then walk it, and may it be kinder than the mountain has been to us. The rock will still be here if you change your mind.", fx = { align = { honor = -1 } } },
      },
    },
    xorig_regrow = {
      lines = {
        { id = "xrg_default", text = "I've seen your saplings on the slopes toward Windshear Crag, and I've watched the goblins cut a few of them down again. It's slow work, and some days it looks hopeless from up here. Why do you keep at it?" },
      },
      choices = {
        { text = "Because the mountain deserves someone who won't give up on it.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Because I'd rather plant trees than kill goblins, most days.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Because every tree I grow costs them a second cut.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    hard = {
      big = true,
      lines = {
        { id = "h2_default", text = "Battle and loss, and spider venom once, that left me shaking for a season. Cairne sent me here to heal, and the mountains healed the body; the rest is still working on it." },
      },
      choices = {
        { text = "Does the wind help?", next = "wind" },
        { text = "I understand.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    wind = {
      lines = {
        { id = "w_default", text = "Some days. The sun warms the old wounds and the wind blows the worst of my thoughts off the rock, and on the days it doesn't, I find a harpy to take it out on." },
      },
      choices = {
        { text = "That's honest, at least.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troubles = {
      lines = {
        { id = "tr_default", text = "Harpies, first and worst. The Bloodfuries roost in the Charred Vale and breed faster than we can thin them, and they're the reason harpies plague half of Kalimdor." },
      },
      choices = {
        { text = "How do we break them?", next = "ripper" },
        { text = "There must be something else.", next = "troubles2" },
      },
    },
    ripper = {
      lines = {
        { id = "ri_default", text = "Killing them by the score is not enough, for the cure is to kill their leader. Bloodfury Ripper rules them from the western hills, and without her they'll weaken, and maybe we can finish them." },
      },
      choices = {
        { text = "I'll find her.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { sun_rock = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troubles2 = {
      lines = {
        { id = "t2_default", text = "The Venture Company's saws, and the angry fire that came after them, and the spiders on the roads. The Horde has been strong in Kalimdor since the war, and I mean to keep these mountains part of that strength." },
      },
      choices = {
        { text = "Then I'll help keep them.", next = "BACK", fx = { affinity = 1, learn = { "venture_company" } } },
        { text = "And the Grimtotem on these roads?", next = "grimtotem_op" },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    besseleth = {
      lines = {
        { id = "b_default", text = "Besseleth is an old predator of these parts, larger than any of her brood. She took me on the Webwinder Path in the dark, and I fought her off and crawled to safety, and I've a scar to rub when the weather turns." },
      },
      choices = {
        { text = "There must be a bounty on her.", next = "bounty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bounty = {
      lines = {
        { id = "bo_default", text = "There's a poster on the main road, south of Windshear Crag, and I'll pay it gladly. Bring me her fang and more folk will dare the road to Sun Rock after dark." },
      },
      choices = {
        { text = "I'll bring you the fang.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "wo_default", text = "Orcs and tauren together, mending what the Venture Company and worse did to these mountains. Tammra Windfield plants, the braves fight, and I keep the rock standing while they do it." },
      },
      choices = {
        { text = "Who's the mage by the fire?", next = "braelyn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    braelyn = {
      lines = {
        { id = "br_default", text = "Braelyn Firehand. The Horde gives her a roof, and she pays for it in fire, and what she does with her own time is between her and her conscience. Watch her if you work for her, is all I'll say." },
      },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      big = true,
      lines = {
        { id = "a_default", text = "Strange. Knowing evil roosted near my land kept my thoughts busy for years, and now they're silent, so perhaps that's a good thing. Maybe now I can turn to the good, as the elders always told me to." },
      },
      choices = {
        { text = "You've earned a few peaceful nights.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "There'll always be another fight.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "What frightens you about the silence?", tag = "Persuade", next = "after_fear",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Tauren" }, { trait = "kind" } } } },
          fail = { next = "after_wall", fx = { affinity = -1 } } },
      },
    },
    grimtotem_op = {
      lines = { { id = "gt_default", text = "The Grimtotem walk these hills too, and they call Cairne's peace with the orcs a weakness. Magatha sits on the Elder Rise smiling at him while her clan kills travelers on my roads, so tell me what you think should be done about them." } },
      choices = {
        { text = "Cairne should cast Magatha out of Thunder Bluff.", next = "gt_cast", fx = { affinity = 1, align = { light = -1 }, opinion = { grimtotem = "lost", cairne = "too_patient" } } },
        { text = "Cairne's patience is right. Some may still come home.", next = "gt_patient", fx = { align = { light = 1 }, opinion = { grimtotem = "redeemable", cairne = "admire" } } },
        { text = "Kill the ones on the roads and leave Magatha to Cairne.", next = "gt_roads", fx = { affinity = 2, trait = { stern = 1 }, opinion = { grimtotem = "lost" } } },
        { text = "They shame every tauren. I'd face them myself.", next = "gt_tauren", when = { race = "Tauren" }, fx = { affinity = 2, opinion = { grimtotem = "hate" } } },
        { text = "That's Thunder Bluff's business, chieftain.", next = "BACK" },
      },
    },
    gt_cast = {
      lines = { { id = "gtc_default", text = "I've said the same, louder than I should have, and it's part of why I'm out here instead of on the bluff. You'll find others who agree with us, and a few who'd report you for saying it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gt_patient = {
      lines = { { id = "gtp_default", text = "That's Cairne's own answer, near enough. I'm trying to learn it, but it's hard to be patient when you've buried braves the Grimtotem killed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gt_roads = {
      lines = { { id = "gtr_default", text = "A soldier's answer, and one I can act on. It's exactly why Kaya Flathoof needed an escort home from Camp Aparaje." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gt_tauren = {
      lines = { { id = "gtt_default", text = "Then do it with your eyes open, because they wear the same hides and paint as we do. That's what makes them dangerous, and what makes it hurt." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cairne = {
      lines = {
        { id = "c_default", text = "Because he's wiser than I am, and he saw I'd stopped being humble before I did. He gave me a hard post and a gentle wind, and I think he meant me to mend here, so I'm still trying." },
      },
      choices = {
        { text = "The Earth Mother keeps her own time.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_fear = {
      lines = {
        { id = "af_default", text = "That I've forgotten how to be gentle, and that the braves only follow me because I'm hard. A hard chieftain is easy to obey, and I don't know yet whether a gentle one is someone they'd follow at all." },
      },
      choices = {
        { text = "They'll follow you either way.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then learn it slowly.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_wall = {
      lines = {
        { id = "aw_default", text = "Nothing frightens me on this rock but a harpy I didn't see coming. Ask your questions of Tammra; she likes them better." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Hm. I'm not a bull who's praised often, and I'd forgotten it could sit well. You have my thanks, and An'she's light on your road." },
        { id = "s2", text = "You speak well of an old wounded warrior, and you seem to mean it. That's worth something to me up here." },
      },
      fail = {
        { id = "f1", text = "Cairne didn't send me to Sun Rock to be flattered, and I've no patience for it. Say what you need." },
        { id = "f2", text = "Pretty words belong on the bluff. Out here I judge a {class} by what they do on the mountain, so go and do something." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You've horns on you, whatever your hide. It's been too long since anyone up here dared answer me back, and I'm the better for it." },
        { id = "s2", text = "You'd prod a wounded bull, and grin while you did it. Good, because Stonetalon eats the timid, and you plainly aren't one of them." },
      },
      fail = {
        { id = "f1", text = "I've little patience at the best of times, and you've just spent what there was. Take your tongue down the mountain." },
        { id = "f2", text = "I bled for this rock, and I'll not be mocked on it. Find Tammra if you want gentleness, because you'll get none from me now." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "I've fought long enough to know when I'm outmatched, and I don't waste pride denying it. You have my attention, {class}." },
        { id = "s2", text = "There's a hardness in you that I'd want beside me on the Webwinder Path. Very well, I'll hear you, and I'll hear you carefully." },
      },
      fail = {
        { id = "f1", text = "The Grimtotem have tried to frighten me off these roads for seasons, and I'm still on them. You're less than they are." },
        { id = "f2", text = "I'm already wounded and already angry, so you've nothing left to threaten me with. Stand down before I forget you're a guest on this rock." },
      },
    },
  },
  confides = {
    { id = "cnf_1", text = "The Venture Company overseer at Windshear Crag keeps his guards close by day, but they drink after sunset and grow careless near the lumber piles." },
    { id = "cnf_2", text = "The Bloodfury matriarch nests on the highest cliff above the Charred Vale, and the only way up is a goat path on the eastern face." },
    { id = "cnf_3", text = "The druids at Stonetalon Peak keep a quiet trail down to Sun Rock that avoids the Webwinder spiders, and they will show it to anyone I vouch for." },
  },
  blurts = {
    { id = "bl1", text = "The Venture Company's overseer keeps his camp at Windshear Crag, and he never leaves it without his guards. Kill him, and the saws stop for a season." },
    { id = "bl2", text = "The Grimtotem who attacked Camp Aparaje did not act alone, and Magatha knows it. Cairne knows it too, and he will not move against her." },
    { id = "bl3", text = "The Bloodfury harpies nest on the high cliffs above the Charred Vale, and their matriarch never comes down. My braves have tried, and lost too many." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you hold your ground when the ground is hard to hold, {name}. On Sun Rock that is the only praise that matters, and I give it to few." },
      { id = "rg_2", when = { fondness = "earned" }, text = "You have bled for this rock beside my braves, and the stones remember blood that is freely given. So do I." },
      { id = "rg_3", when = { fondness = "values" }, text = "You are brave without being foolish and loyal without being blind. Cairne sent me here to find such tauren, and I found you instead." },
      { id = "rg_al", when = { alignment = { axis = "honor", min = 30 } }, text = "You keep your word in a place where the Venture Company buys and sells it by the crate. Stonetalon needs more like you, {class}, and fewer of everyone else." },
    },
    confide = {
      { id = "cf_1", text = "Cairne sent me to Sun Rock to hold it and to mend, and I have done only the first. The battles took my gentleness, and I do not know how to ask the Earth Mother for it back." },
      { id = "cf_2", text = "I lost more braves to the Bloodfury harpies than I have told Thunder Bluff. I write the numbers small in my reports, because the truth would bring the elders down on my rock with their questions." },
    },
    trust = {
      { id = "tr_1", text = "Trust the braves of Sun Rock, every one, and trust the druids of the Circle at Stonetalon Peak. They want the mountain healed as much as we do." },
      { id = "tr_2", text = "Do not trust any Grimtotem who comes down from the north with a friendly word. The ones who attacked Camp Aparaje smiled before they drew their spears." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the Webwinder Path at night, and the spiders that hang above it. They drop without a sound, and their poison is slow enough that you do not know you are dying." },
      { id = "wo_2", text = "The Venture Company's shredders will not stop for a tauren in their way, so step aside when you hear the saws. Many braves learned too late." },
    },
    worries = {
      { id = "wy_1", text = "I worry the Venture Company will strip this mountain bare before Cairne moves against them. Every tree they cut is a tree the land will not grow again in my lifetime." },
      { id = "wy_2", text = "I worry I have become what I fought, {name}. I look at my braves and see only spears, and I remember a time I saw their faces first." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to see Stonetalon green again, with the saws silent and the Charred Vale grown over. Then I could go home to Mulgore with my work done." },
      { id = "hp_2", text = "I hope to find my gentleness again before I am too old to use it. Cairne believes I will, and I would not like to prove him wrong." },
    },
    favor = {
      { id = "fv_1", text = "Go to Windshear Crag and break the Venture Company's overseer, if you have the strength. Every season the saws are quiet is a season the mountain breathes." },
      { id = "fv_2", text = "If you pass through Thunder Bluff, tell the High Chieftain that Sun Rock holds. He worries about this rock more than he says." },
    },
    friendship = {
      { id = "fr_1", text = "I do, {name}. I have few friends left, because the battles took them too, and I am glad to have found one more." },
      { id = "fr_2", when = { fondness = { best = "earned" } }, text = "You fought beside my braves when you owed us nothing, and you did not ask for thanks. That is how a hard bull makes a friend." },
    },
    never_told = {
      { id = "nt_1", text = "In the war against the centaur, I killed a young Kolkar who had thrown down his spear. I tell myself it was the heat of battle, and I have never told anyone how calm I was when I did it." },
      { id = "nt_2", text = "Some nights I go to the edge of the rock and weep for the gentle bull I used to be. My braves think I am keeping watch, and I let them." },
    },
    grievance = {
      { id = "gv1", text = "I was gentle once, before the battles, and you have reminded me why I stopped. Say what you need and go." },
      { id = "gv_prej", when = { grudge = "prejudice" }, text = "Cairne told me what demon blood did to the orcs, and I believe him. You carry the same taint up my mountain, and I will not have it." },
      { id = "gv_values", when = { grudge = "values" }, text = "You fight like the goblins cut trees, taking everything and mending nothing. The Earth Mother does not love that, and neither do I." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You spoke to me as if Sun Rock were a place for old bulls to die. It is a place to hold, and I am holding it." },
    },
    amends = {
      { id = "am1", text = "Fight the Venture Company and the harpies, and let my braves tell me of it. Deeds carry further than words on this rock." },
      { id = "am_prej", when = { grudge = "prejudice" }, text = "Keep your demon below the switchbacks, and prove your craft can serve the land. I am slow to change my mind, but I am not stone." },
    },
    spite = {
      { id = "sp1", text = "I think you would have been one of the centaur's raiders, if you had been born with hooves. I have killed enough of them to know the look." },
      { id = "sp_prej", when = { grudge = { worst = "prejudice" } }, text = "I think the darkness you carry will eat you from the inside, as it ate the orcs. I will not be the one to mourn you." },
    },
    _gated = {
      { id = "gt1", text = "That's not something I speak of with strangers, and you're still a stranger to me. Do some good on this mountain first." },
      { id = "gt2", text = "I'll keep that to myself. I've trusted the wrong ears before, and I'm slower with it now." },
    },
    knows = {
      { id = "tp_knows", text = "I hold this rock, so I hear about everything that threatens it. Ask about any of these, and plainly." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get what every brave on this rock already knows, and nothing more, so pick one." },
    },
    background = { { id = "tp_bg", text = "Cairne sent me to Sun Rock to hold it and to mend. The holding I can do.", next = "hard" } },
    advice = { { id = "tp_ad", text = "Don't walk the Webwinder Path at night, and if you must, don't walk it alone." } },
    venture_company = { { id = "tp_venture", text = "Goblins with saws who think a mountain's worth what they can cut off it. We spend our days mending after them." } },
    cenarion_circle = { { id = "tp_circle", text = "Their keeper watches the peak to the north. We leave each other be, mostly. Mostly is a fragile word up here." } },
    cairne = { { id = "tp_cairne", text = "Cairne sent me to Sun Rock because the wind and sun ease my old pains, he said. He did not say that the Venture Company would ease them too, by giving me something to hate." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a strong orc and a fair one. He came to the tauren's aid against the centaur, and I would follow him into battle without question." } },
    centaur = { { id = "tp_centaur", text = "The centaur raided the tauren for generations, and I fought them for most of my life. That is where my gentleness went, if you want to know." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem attacked Camp Aparaje and killed tauren who had done them no wrong. Magatha sits on Elder Rise and pretends to know nothing about it, and Cairne lets her." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave us this land to protect, and the goblins are tearing it apart. I fight for her, though I am no druid." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are Horde, and I will not question the Warchief's choice. But I have seen what the dead can do, and I do not sleep easily near them." } },
    _none = { { id = "tp_none", text = "That's not my concern. Ask Tammra; she has more patience than I do, and the Earth Mother gave her my share of it." } },
  },
}

P:NPC {
  key = "tammra", id = TODO_NPC("Tammra Windfield"), name = "Tammra Windfield",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "gentle" }, values = { "hopeful", "patient" },
  notices = { "class", "form", "lock_taint" },
  impression = {
    first = "She counts five living shoots against two dead as a good night.",
    third = "{name} met Tammra Windfield, who tends what grows on Sun Rock and means to bring the Charred Vale back to life.",
  },

  greetings = {
    { id = "g_seeds", text = "Careful where you step. Those little green shoots are the first things to grow in that soil in years." },
    { id = "g_dr_druid", when = { class = "DRUID" }, text = "A druid on Sun Rock, and just when the seedlings need a friend! Come and kneel by the rows, because I've been talking to them all morning and I'm not sure they understand my accent." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and while you were gone I counted eleven new shoots and only three lost. That's a good stretch, so mind your step." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody on Sun Rock was talking about how kind you'd been to them. Kindness grows like these little shoots do, a bit at a time." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then you'll know how hard it is to make dead ground live again. Help me, if you've a moment." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "The earth draws back where you walk, and there's a green sickness in your step like the ash in the Charred Vale. The Earth Mother forgives much, but I do not think the soil will forgive it as quickly as I would." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I don't know, but I'd like to find out. Every mountain heals given time and stubbornness, and the dead have plenty of both, I imagine. Kneel here a while, and we'll see if anything grows near you." } },
      choices = {
        { text = "I'll kneel and try, Tammra.", next = "BACK", reply = "Then kneel here, beside the rows, and put your palm flat on the soil. It's warmer than you'd think.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm no gardener. Find someone else.", next = "BACK", reply = "You'd be surprised who turns out to be a gardener. But I'll not push, and the mountain will manage with what it has.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Given time and stubbornness, yes, and I have plenty of both. What I don't have is peace, because the Venture Company's machines still grind at the edge of the vale, and every shoot I coax up they'd cut down again." } },
      choices = {
        { text = "I'll guard your rows. Let the vale have its peace.", next = "BACK", reply = "Thank you. The harpies have dug up two rows this month just to spite me.", fx = { align = { honor = 1 } } },
        { text = "Planting won't stop goblins. I'd rather break their machines.", next = "BACK", reply = "Then break them, and I'll plant twice as fast behind you. The goblins can't cut what they can't reach.", fx = { align = { honor = -1 } } },
        { text = "Something else, Tammra.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A few, and slowly: deer first, then the cats that hunt them, and that's how I know the land is mending. If you hunt in the vale, take the old and the sick, and leave the young to grow." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A few, and slowly: deer first, then the cats that hunt them, and that's how I know the land is mending. Your {pet} is sniffing my seedlings, {class}, and I don't mind, because it'll be the first of its kind to walk through them." },
      },
      choices = {
        { text = "I'll take only the old and the sick.", next = "BACK", reply = "Thank you. I saw a doe in the vale last week, the first in years, and I'd like to see her again.", fx = { align = { honor = 1 } } },
        { text = "I'll take what I find. The land will manage.", next = "BACK", reply = "It will, slowly, but slower with every greedy hunt. Take what you need, and leave the young to grow.", fx = { align = { honor = -1 } } },
        { text = "Something else, Tammra.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They could, because the Venture Company still sends men into the Charred Vale to cut whatever has the nerve to grow back. If you could learn which of their foremen gives those orders, I'd know who to plead with, or who to send Maggran after." } },
      choices = {
        { text = "I'll learn his name, and you can plead with him first.", next = "BACK", reply = "Thank you, and I'll plead first, because I'd rather they left on their own. If they won't listen, then Maggran can have him.", fx = { align = { honor = 1 } } },
        { text = "Pleading's wasted on goblins. I'll deal with him quietly.", next = "BACK", reply = "I'd rather you didn't, but I won't pretend I'll weep. Just don't let it bring more fire into the vale.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I can't say for certain, but the Charred Vale burned when someone angered the fire spirits, and I've grown wary of anything that bargains with powers it can't see. A dead tree feeds the soil it falls on, and I'm not sure the things your magic kills feed anything." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I can't say for certain, but the Charred Vale burned when someone angered the fire spirits, and the air has gone heavy and hot since your servant came near. I've grown wary of anything that bargains with powers it can't see, and I'm not sure the things your magic kills feed anything." },
      },
      choices = {
        { text = "Then I'll keep my work well away from your garden.", next = "BACK", reply = "Thank you, and the shoots thank you too. I don't know what your power touches, but I'd rather not find out here.", fx = { align = { light = 1 } } },
        { text = "Power is power, Tammra. Your shoots will survive it.", next = "BACK", reply = "Perhaps they will, but I've buried too many shoots to take that chance. Keep it away from my rows.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_ta = {
      lines = {
        { id = "sta_default", text = "I thought so, though I've only the dirt under my nails to tell me. If you could ask them to be patient a little longer, I'd be grateful, because these shoots need a spring without the ground shaking under them." },
      },
      choices = {
        { text = "I'll speak for your garden.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The spirits don't take requests, Tammra.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xhpriest = {
      big = true,
      lines = {
        { id = "xhpriest_default", text = "Not the soil, but the people who work it, because my helpers come back burned and cut from the Charred Vale and I can't plant and bandage at the same time. Stay a night and look after them, and I'll count every one you mend the way I count my shoots." },
      },
      choices = {
        { text = "I'll tend your helpers, Tammra.", next = "BACK", reply = "Thank you. Half of them have blistered hands and won't say a word about it.", fx = { align = { light = 1 } } },
        { text = "Your helpers knew the risks. I've other work.", next = "BACK", reply = "They did, and they came anyway, which is more than most would. Go to your work, then, and I'll find bandages somewhere.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I fear any fire on this mountain, because the Charred Vale burned and I'm still trying to bring it back. Your frost would be welcome, though, on the harpies in the cliffs, because they dig up my shoots out of spite." },
      },
      choices = {
        { text = "I'll keep my fire away from your shoots.", next = "BACK", reply = "Thank you, because one stray spark could undo a season of work. Freeze the harpies, and I'll be glad of it.", fx = { align = { light = 1 } } },
        { text = "Fire's the quickest answer to harpies.", next = "BACK", reply = "Quickest, maybe, but it burned the vale once already. Use your frost on them, I beg you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_venture", when = { killed = { name = "Venture", min = 30 } },
          text = "The saws have gone quieter in Windshear Crag, and I'm told it's your doing. Seedlings won't take where the shredders still roll, so every goblin you stop is a tree I may yet see growing." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. I coax green shoots out of burned ground, and I'd love to know whether the Light can help." },
        { id = "h_default", key = true, text = "I'm Tammra Windfield, and I tend what grows on Sun Rock and try to bring back what doesn't. Every mountain can heal, given time and stubbornness." },
        { id = "h_kaya", tags = { "news" }, when = { questActive = TODO_QUEST("Kaya's Alive") },
          text = "Kaya's alive? My niece, alive! Oh, Earth Mother be thanked, for after the Grimtotem fell on Camp Aparaje we'd all thought her lost." },
        { id = "h_rebirth", when = { questActive = TODO_QUEST("Cycle of Rebirth") },
          text = "Death feeds life, if you let it. It's the oldest cycle there is. Help me turn it the right way round." },
        { id = "h_newlife", when = { questActive = TODO_QUEST("New Life") },
          text = "Plant them gently, and water them more gently still; they're the future of these slopes." },
        { id = "h_shoots", when = { metBefore = true }, text = "Two of the new shoots died in the night, but five lived, and I'll take five." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You came up so quietly I nearly mistook you for the wind, and I'd thank you to walk that softly through my rows of seedlings." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "There's a chill about you, and I don't think the little shoots will like it. Stand a pace back from the rows, if you would, and I'll gladly talk with you all the same." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Mind your boots, please, because I've seedlings in rows you can barely see, and they've survived worse than you, but not by much." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and I can see you've a feel for the land, so you'll know the beasts have been driven half mad by the burning." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I mend the ground and you mend people, and Sun Rock needs both." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Please keep your fire well away from my seedlings, because they've been burned once already." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Grimtotem", min = 30 } }, text = "The braves say the Grimtotem have lost a good many warriors to you, and the trail down to Aparaje is safer. I'm glad of it, though it grieves me that they were tauren." },
      },
      again = {
        { id = "h_again", text = "Anything else, while my hands are in the dirt? I can listen and plant at once." },
        { id = "h_again2", text = "Ask on. The seeds don't mind company, and the Earth Mother likes a little talk over her soil." },
      },
      choices = {
        { text = "Why bring the ground back?", next = "why" },
        { text = "What happened to the land here?", next = "land" },
        { text = "You seem to be planting something.", next = "seeds" },
        { text = "How is your niece?", next = "kaya", when = { questDone = TODO_QUEST("Kaya's Alive") } },
        { text = "I'm a druid. Could I help the shoots along?", next = "druid", when = { class = "DRUID" } },
        { text = "I can call the fallen back now. Does that break your cycle?", next = "d_cycle", when = { class = "DRUID", minLevel = 20 } },
        { text = "Did the seeds take, in the Charred Vale?", next = "future", when = { questDone = TODO_QUEST("New Life") } },
        { text = "The earth spirits here are angry. I can feel it.", next = "shaman_ta", when = { class = "SHAMAN" } },
        { text = "Could quiet feet be any use to your garden?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Nothing could grow back in the Charred Vale, surely, Tammra.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Are the beasts returning to the burned land, Tammra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does what I carry really harm your plants?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Can a priest help you mend the land, Tammra?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you fear a mage's fire, Tammra?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Can the Light heal burned ground, Tammra?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do the druids on Stonetalon Peak ever help you?", next = "ne_tammra" },
        { text = "Good luck with your garden.", next = "END", fx = { affinity = 1 } },
      },
    },
    d_cycle = {
      big = true,
      lines = { { id = "dr_tw_default", text = "Rebirth, you mean? Sheal's taught it to you, then. I'm no druid, only a gardener with stubborn hands, but I'd say a druid who calls back a friend who fell too soon is mending a tear in the cycle, not breaking it, so long as you never start thinking you own the needle." } },
      choices = {
        { text = "Death feeds life. I'll call back only those who fell too soon.", next = "BACK",
          reply = "That's how I'd want it done, if it were mine to do. The Charred Vale burned before its time, and I'm calling it back too, one shoot at a time.",
          fx = { affinity = 1, align = { order = 1 }, opinion = { druids = "balance" } } },
        { text = "If I can bring someone back, the cycle can wait.", next = "BACK",
          reply = "Spoken like someone who's lost people, and I won't argue with that grief. Just remember the ashes in the Vale fed these shoots, and something has to feed the next ones.",
          fx = { align = { order = -1 } } },
        { text = "Is that why you planted here, in the burned ground?", next = "d_cycle2" },
      },
    },
    d_cycle2 = {
      lines = { { id = "dr_tw2_default", text = "It is. Fire's part of the cycle too, but what burned the Charred Vale wasn't the land's own fire, and the ash has been sour ever since. I can't call anything back with a word the way you can, so I do it with seeds and patience and an awful lot of water." } },
      choices = { { text = "Something else, Tammra.", next = "BACK" } },
    },
    ne_tammra = {
      lines = {
        { id = "ne_default", text = "Not with their hands, though I think some of them would like to. The Circle's elves on the Peak want the same living mountain I want, but their Sentinels watch the ridge, and when a Sun Rock brave walks too far up the path he comes home with an arrow in his shoulder and a warning in his ears." },
      },
      choices = {
        { text = "Why do they shoot at tauren who mean no harm?", next = "ne_tammra_why" },
        { text = "You'd plant beside them, if they let you?", next = "ne_tammra_plant" },
        { text = "Something else, Tammra.", next = "BACK" },
      },
    },
    ne_tammra_why = {
      lines = {
        { id = "nw_default", text = "Because we walk with the Horde, and the Horde's axes are in Ashenvale, and from up on the Peak a tauren with a totem looks very like an orc with a saw. I can't blame them for fearing the saw, when I've seen what the goblins' shredders did to the vale below us." },
      },
      choices = {
        { text = "They're frightened, not cruel. I'd forgive them.", next = "BACK",
          reply = "So would I, and most days I do. Fear makes everyone a poor gardener, and the Earth Mother is patient with poor gardeners, so I try to be as well.",
          fx = { affinity = 1, align = { light = 1 }, opinion = { night_elves = "mixed" } } },
        { text = "Fear is no excuse. An arrow deserves an arrow back.", next = "BACK",
          reply = "And then the ridge burns again, and I'm back to counting shoots in the ash. Please, not up here; this mountain has had enough of everyone's anger.",
          fx = { affinity = -1, align = { light = -1 }, opinion = { night_elves = "distrust" } } },
        { text = "Something else, Tammra.", next = "BACK" },
      },
    },
    ne_tammra_plant = {
      lines = {
        { id = "np_default", text = "I would, gladly. I've left a bundle of seedlings on the stones below the Peak more than once, in case one of their druids wants to see what Sun Rock can grow, and they're always gone by morning, and no one has ever put an arrow through the bundle, so I take that as a kind of answer." },
      },
      choices = {
        { text = "That sounds like a yes, Tammra, said quietly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Tammra.", next = "BACK" },
      },
    },
    land = {
      big = true,
      lines = {
        { id = "l_default", text = "Fire, and goblin axes, and fighting, until the vale to the west burned black. But burned ground is still ground, and it remembers how to be green." },
      },
      choices = {
        { text = "Who burned it?", next = "venture" },
        { text = "I'll help it remember.", next = "BACK", reply = "Then you're a friend of the mountain, and I'll show you the first green patch in the vale. It's small, but it's ours.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Burned ground is just ground. Let the goblins have it.", next = "BACK", reply = "The goblins would cut it bare again in a season. I'll not give them that, not while I can still dig.", fx = { align = { light = -1 } } },
      },
    },
    venture = {
      lines = {
        { id = "v_default", text = "The Venture Company, chasing lumber, and the war that came with them, and then the fire spirits they angered. Greed and war together will wreck any land; it takes the Earth Mother's blessing to cure it." },
      },
      choices = {
        { text = "Then the Venture Company has a lot to answer for.", next = "BACK", fx = { learn = { "venture_company" }, trait = { stern = 1 }, opinion = { venture_company = "hate" } } },
        { text = "Can goblins ever be trusted on this mountain?", next = "goblins_op" },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    goblins_op = {
      lines = { { id = "gb_default", text = "I want to say yes, because the Ratchet goblins are kind enough when they trade for my seeds. But when I walk past the stumps at Windshear Crag, I find it hard, so tell me, friend: are the goblins all alike?" } },
      choices = {
        { text = "The Venture Company isn't all goblins. Ratchet's are different.", next = "gb_mixed", fx = { affinity = 2, align = { light = 1 }, opinion = { goblins = "mixed", venture_company = "hate" } } },
        { text = "A goblin is a goblin. They'd all strip this mountain for coin.", next = "gb_all", fx = { affinity = -1, opinion = { goblins = "distrust" } } },
        { text = "The Horde needs goblin trade, whatever it costs the hills.", next = "gb_trade", fx = { affinity = -2, align = { light = -1 }, opinion = { goblins = "useful" } } },
        { text = "The trees will outlast every saw. Plant, and wait them out.", next = "gb_wait", when = { class = "DRUID" }, fx = { affinity = 2, opinion = { venture_company = "temporary" } } },
        { text = "I don't know, Tammra.", next = "BACK" },
      },
    },
    gb_mixed = {
      lines = { { id = "gbm_default", text = "I hope so. I'll keep trading with the Ratchet ones, then, and I'll try not to flinch when I hear an engine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gb_all = {
      lines = { { id = "gba_default", text = "Maybe, but a seed doesn't care who plants it, so I try not to care who sells me the sack. It's harder some days than others." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gb_trade = {
      lines = { { id = "gbt_default", text = "Then I hope the Horde gets something better for it than stumps and fire spirits. That's what it got last time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gb_wait = {
      lines = { { id = "gbw_default", text = "That's what I tell myself every morning, and it helps to hear a druid say it back to me. Thank you, friend." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = {
        { id = "w_right", text = "Because the mountain's been cut and burned, and someone ought to make it right. It doesn't much matter who, and it happens to be me." },
      },
      choices = {
        { text = "You must have some way to make it right.", next = "blessing" },
        { text = "I'm glad it's you.", next = "BACK", reply = "Thank you, though it's only stubbornness that keeps me at it. My mother said I'd argue with a stone, and she was right.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Let the mountain mend itself. It isn't your burden.", next = "BACK", reply = "Maybe it would, given a thousand years. I'd rather it mended in my lifetime, and so I'll keep at it.", fx = { align = { light = -1 } } },
      },
    },
    blessing = {
      lines = {
        { id = "b_default", text = "I chant over the seeds and ask the Earth Mother to quicken them, and she listens, most days. The seeds do the real work; I only remind them they're allowed to." },
      },
      choices = {
        { text = "Then you and the seeds have an understanding.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seeds = {
      lines = {
        { id = "s_default", text = "Gaea seeds, which grow only here in Stonetalon, along the water's edge at Mirkfallon Lake, north of the rock. They're small and hard and stubborn, which is just what this ground needs." },
      },
      choices = {
        { text = "Where do they go once they're blessed?", next = "planting" },
        { text = "Something else.", next = "BACK" },
      },
    },
    planting = {
      lines = {
        { id = "p_default", text = "Into the mounds of good soil in the heart of the Charred Vale, where the fire was worst. The harpies and the angry fire spirits are still there, so whoever plants them has to be brave as well as gentle." },
      },
      choices = {
        { text = "I can be both.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaya = {
      lines = {
        { id = "k_default", text = "Safe with her father, my brother-in-law Makaba, and that's all I'll ask of the world this year. The Grimtotem fell on Camp Aparaje while she was there, and I still can't think of it without shaking." },
      },
      choices = {
        { text = "She's home with Makaba. Revenge can wait.", next = "BACK", reply = "It can. She's safe, she's home, and she's already complaining about Makaba's cooking, which is the best sign of all.", fx = { align = { honor = -1 }, affinity = 3, trait = { kind = 1 } } },
        { text = "The Grimtotem will answer for it.", next = "BACK", reply = "They will, and the Earth Mother keeps a longer memory than any of us. But I've no stomach for that hunt now, and I'll leave it to stronger hearts than mine.", fx = { affinity = 1, learn = { "grimtotem" }, align = { honor = 1 } } },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "Oh, would you? Talk to them, then, however you druids do it, and tell them the rock is a safe place to grow. They'll take it better from you than from me." },
      },
      choices = {
        { text = "(Kneel and lay a hand on the shoots.)", next = "BACK", reply = "Look at them, they're leaning toward your hand like grass toward the sun. Whatever you said to them, they heard it, and I'll trust the rock to hold them now.", fx = { affinity = 2, standing = { sun_rock = 1 }, align = { order = 1 } } },
        { text = "They'll grow wild and strong without my coaxing.", next = "BACK", reply = "Maybe so, and maybe that's better. I'll trust you, because you know them better than I do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    future = {
      big = true,
      lines = {
        { id = "f_default", text = "They took, and they're strong, holding back the corruption and making a foothold for everything else. In time the goblins will give up and go, the fire spirits will settle, and the new trees will crowd the harpies off their roosts, and on that day I'll sleep through till noon." },
      },
      choices = {
        { text = "I hope I see it.", next = "BACK", reply = "So do I, and I'll plant for it every day until I do. Come back in ten summers and we'll sit in the shade together.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The goblins won't give up. They never do.", next = "BACK", reply = "They never do, but the trees are more stubborn than goblins. Wait and see who's still here in fifty years.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I mostly know seeds, but people tell a gardener things while she works. Ask me about any of these." },
    },
    background = { { id = "tp_bg", text = "I tend the ground on Sun Rock and pray over seeds. My niece Kaya and her father lived at Camp Aparaje, and that's family enough to worry over." } },
    advice = { { id = "tp_ad", text = "Never step on a green shoot up here. It might be the only one for a mile." } },
    venture_company = { { id = "tp_venture", text = "They cut until there's nothing left to cut, and then they move on and leave the burning for us." } },
    cenarion_circle = { { id = "tp_circle", text = "They want the same thing I want, a living mountain. I wish we could plant side by side instead of glaring across the ridges." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem fell on my niece Kaya's camp at Aparaje, and they would have killed her if no one had come. I do not know what has become of the tauren who could do that." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is patient, and so am I. Five shoots living and two dead is a good night, and the next night will be better." } },
    cairne = { { id = "tp_cairne", text = "Cairne trusts us to heal Stonetalon, and I mean to prove him right. Every shoot I raise is a promise to him." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the Dream is greener than the waking world, and I believe them. I would like Stonetalon to look like the Dream one day, and I mean to help it." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid; I mostly know seeds, and what the Earth Mother is willing to grow in burned ground." } },
  },
}

P:NPC {
  key = "braelyn", id = TODO_NPC("Braelyn Firehand"), name = "Braelyn Firehand",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "bitter" }, values = { "ambitious", "vengeful" },
  notices = { "class", "form" },
  impression = {
    first = "Her hatred of the druids has the sound of an old wound.",
    third = "{name} met Braelyn Firehand, an embittered mage at Sun Rock who wants the druids of the Talon Den gone and the land's magic restored.",
  },

  greetings = {
    { id = "g_mage", text = "You've a capable look, and I've work for capable people. It's unpleasant work, but well paid." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Then you'll understand. Magic is being choked out of these mountains by druids who think every spell is a crime." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid, though in the Horde, at least, which I suppose is something. You'll not like the work I hand out, so I won't trouble you with it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They hate anything they can't control, and the Light isn't theirs. Neither is my fire. I don't love paladins, since the Silver Hand never liked mages who didn't bow, but an enemy of the Talon Den is a friend of mine." } },
      choices = {
        { text = "I'll stand against the Talon Den beside you.", next = "BACK", reply = "Good, then we're allies, and I keep a careful list of those. Stand with me against the Den, and you'll find me generous.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll not make enemies of druids for your grudge.", next = "BACK", reply = "My grudge, is it? You'll see soon enough that the druids make enemies on their own. I'll not ask again.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Stand between me and their claws while I work, and don't ask too many questions about what I'm working on. The druids hate anything arcane, so they'll come for me first, and you'll get your chance to swing." } },
      choices = {
        { text = "I'll guard you, but I want to know what you're doing.", next = "BACK", reply = "You'll know what you need to know, and not one word more. Guard me well, and I'll make it worth your while.", fx = { align = { order = 1 } } },
        { text = "I'll guard you. Your business is your own.", next = "BACK", reply = "Now that's the kind of help I like. Stand between me and the claws, and keep your eyes on the trees.", fx = { align = { order = -1 } } },
        { text = "Something else, Braelyn.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bird, cat and bear, and they hunt in those shapes, which is why you'll never catch them on the road. A hunter who can tell a real beast from a druid in disguise would be very useful to me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bird, cat and bear, and they hunt in those shapes, which is why you'll never catch them on the road. Your {pet} would know the difference, {class}, and that's more than I can say for most people who've walked into the Talon Den." },
      },
      choices = {
        { text = "I'll tell you what I find, but I won't murder for you.", next = "BACK", reply = "Murder is such an ugly word, and I've never asked anyone to do it. Bring me what you find, and I'll handle the rest.", fx = { align = { honor = 1 } } },
        { text = "Point me at them. A druid in fur is fair game.", next = "BACK", reply = "Good, you understand. Point your bow at the bear, and keep it there.", fx = { align = { honor = -1 } } },
        { text = "Something else, Braelyn.", next = "BACK" },
      },
    },
    forsaken_b = {
      lines = {
        { id = "fb_default", text = "Did you? Then you remember what it felt like to cast in a city that wanted you to, and you'll understand why this mountain makes me furious. Every spell up here leaks like a bucket full of holes, and the druids like it that way." },
        { id = "fb_dal", when = { origin = "forsaken_dalaran_apprentice" },
          text = "An apprentice of the Violet Citadel, walking about with a jaw that doesn't quite close. The Kirin Tor would have you burned, and I would have you help me, which is the better offer." },
      },
      choices = {
        { text = "Magic should flow freely. I'll help you.", next = "BACK", reply = "Then you understand me better than anyone on this mountain. Help me, and you'll feel the flow come back like warmth into cold fingers.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "The druids have their reasons. I won't kill them for it.", next = "BACK", reply = "They have their reasons, and I have mine, and only one of us will be proved right. I'll not ask again.", fx = { align = { order = 1 }, affinity = -1 } },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The druids of the Talon Den want the land bare of magic, and I suspect they'd want it bare of you too." },
        { id = "h_default", key = true,
          text = "I'm Braelyn Firehand. The Horde gives me a roof here, and I give it my spells. The druids of the Talon Den want this land bare of magic, and I want it back." },
        { id = "h_legacy", tags = { "news" }, when = { questActive = TODO_QUEST("Cenarius' Legacy") },
          text = "The druids at the Talon Den, and Cenarius's brood with them, would strangle every spell in the world if they could. Thin their numbers." },
        { id = "h_ordanus", tags = { "news" }, when = { questActive = TODO_QUEST("Ordanus") },
          text = "Ordanus is a keeper in Ashenvale, at the top of a great tree, and I knew him, long ago. He thought himself above even the Highborne, so bring me his head." },
        { id = "h_den", tags = { "news" }, when = { questActive = TODO_QUEST("The Den") },
          text = "The Gatekeeper's Key is hidden in a little lantern at the mouth of the Den. I had that from one of the druids, eventually, and how I got it stays between me and the druid." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. At least the elements don't lecture anyone about balance, the way the druids of the Talon Den do." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The druids talk about balance the way your sort talk about faith, and I trust neither, though at least you admit what you're praying to." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You came in without making a sound, and I like that more than I should. The Talon Den keep their secrets well, and I could use someone who's good at finding them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Good; I have work that needs someone who doesn't flinch, and spells aren't always the quickest way to make a druid listen." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know the woods near the Talon Den, then, and you'll know the druids there aren't always on two legs." },
      },
      again = {
        { id = "h_again", text = "Well? I've a fire to keep and little patience to spare." },
        { id = "h_again2", text = "Ask, then. Questions cost me nothing, though answers might cost you." },
      },
      choices = {
        { text = "Why do you hate the druids?", next = "hate" },
        { text = "What's wrong with the magic here?", next = "magic" },
        { text = "What brought you to these mountains?", next = "master" },
        { text = "I'm a mage. I feel it too.", next = "mage", when = { class = "MAGE" } },
        { text = "Jaedenar? That's the Shadow Council's hold.", next = "council", when = { class = "WARLOCK", heardLine = "braelyn.ma_default" } },
        { text = "You knew Ordanus. What was he to you?", next = "ordanus", when = { any = { { questActive = TODO_QUEST("Ordanus") }, { questDone = TODO_QUEST("Ordanus") } } } },
        { text = "I'm a druid. You're speaking of my order.", next = "druid", when = { class = "DRUID" } },
        { text = "I studied in Dalaran, before I died.", next = "forsaken_b", when = { race = "Scourge", class = "MAGE" } },
        { text = "Do you trust shamans more than druids, Braelyn?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You seem to want something from the druids of the Talon Den.", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What secrets are the druids of the Talon Den keeping?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What do you want a warrior to do about the Talon Den?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'd guess the Talon druids take beast form, Braelyn.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the druids hate the Light, Braelyn?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll think about it.", next = "END" },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "h2_default", text = "Because they decide what magic may live and what must die, and call it balance. I've seen what their balance costs, and I'll not pay it twice." },
      },
      choices = {
        { text = "That sounds like a grudge.", next = "grudge", fx = { trait = { skeptical = 1 } } },
        { text = "I see.", next = "BACK" },
      },
    },
    grudge = {
      lines = { { id = "g2_default", text = "It is a grudge, and a very old one. Old grudges are the only kind worth keeping." } },
      choices = {
        { text = "How old?", next = "temple" },
        { text = "And who do you think is right about magic?", next = "arcane_op" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arcane_op = {
      lines = { { id = "ao_default", text = "No, you tell me, {class}, since you've walked both sides of this mountain. Is magic a gift to be used, or a fire to be feared, as the druids on the peak would have it?" } },
      choices = {
        { text = "A gift. Anyone who fears it is weak.", next = "ao_gift", fx = { affinity = 2, align = { light = -1 }, opinion = { arcane_magic = "gift" } } },
        { text = "The druids are right. Magic broke the world once.", next = "ao_fear", fx = { affinity = -2, align = { light = 1 }, opinion = { arcane_magic = "dangerous", druidism = "respect" } } },
        { text = "A tool like any other. The hand matters more.", next = "ao_tool", fx = { affinity = 1, opinion = { arcane_magic = "tool" } } },
        { text = "I feel it too. Life without it would be grey.", next = "ao_mage", when = { class = "MAGE" }, fx = { affinity = 3, opinion = { arcane_magic = "need" } } },
        { text = "I'll keep my own counsel.", next = "BACK" },
      },
    },
    ao_gift = {
      lines = { { id = "aog_default", text = "Then we understand each other, and few who climb up to Sun Rock bother to try. Come and talk with me again when the druids have tried to lecture you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ao_fear = {
      lines = { { id = "aof_default", text = "The world broke because of what was done with magic, not because magic was in it. I've heard your answer from far older mouths than yours, and I liked it no better then." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ao_tool = {
      lines = { { id = "aot_default", text = "A careful answer. A tool you can set down, though, and I've never met anyone who truly set this one down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ao_mage = {
      lines = { { id = "aom_default", text = "Yes, grey, exactly that. Don't let anyone shame you out of it, least of all a druid with leaves in her hair." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    magic = {
      lines = {
        { id = "m_default", text = "The druids on the peak use their little powers to stifle the flow of magic, even this far south of their precious forests. Casting here is like drawing water from a well with a bucket full of holes." },
      },
      choices = {
        { text = "Why does that matter so much to you?", next = "rush" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rush = {
      lines = {
        { id = "r_default", text = "Because life without magic coursing through your veins is a pale, grey mockery of living. The kaldorei spurn that gift and call themselves wise for it, and I'll never understand them." },
      },
      choices = {
        { text = "Some would call that hunger.", next = "BACK", reply = "Hunger, thirst, call it whatever you like, but at least I know I'm alive when I feel it. The druids starve themselves and call it balance, which sounds a great deal worse to me.", fx = { trait = { skeptical = 1 }, align = { light = 1 }, opinion = { arcane_magic = "dangerous" } } },
        { text = "I know the feeling.", next = "BACK", reply = "Then you're one of the few. The druids would sooner gnaw their own antlers than admit it.", fx = { affinity = 1, align = { light = -1 }, opinion = { arcane_magic = "gift" } } },
      },
    },
    temple = {
      lines = {
        { id = "t_default", text = "Old enough to remember that the ruins on Stonetalon Peak were a temple of Queen Azshara. The night elves crawl over our sacred stones now and call it a grove, and they think I should be grateful." },
      },
      choices = {
        { text = "Our sacred stones? Yours?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master = {
      lines = {
        { id = "ma_default", key = true, text = "My master, who is none of your concern. Would that I could go back to Jaedenar and feel magic flow freely again, but I'm not allowed to return until my work here is done." },
      },
      choices = {
        { text = "And the Horde doesn't mind your master?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = {
        { id = "co_default", text = "You've a good memory and a loose tongue, and only one of those will serve you well. Keep the name of that place out of Maggran's hearing, and we'll get along." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", reply = "Good, and I'll remember it. Maggran asks a great many questions for a tauren.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "We'll see.", next = "BACK", reply = "We will, and I'll be watching. Choose your words carefully around Maggran.", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },
    mage = {
      lines = {
        { id = "mg_default", text = "Then you know what I mean by the bucket full of holes. Help me break the druids' grip on the peak, and you'll feel the flood come back, sweet as anything." },
      },
      choices = {
        { text = "I'll consider it.", next = "BACK", reply = "Consider it, but don't consider it too long. The druids won't wait for you to decide.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Not at that price.", next = "BACK", reply = "Then you'll never know what you're missing. Pity.", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    ordanus = {
      big = true,
      lines = {
        { id = "o_default", text = "One of the eldest sons of their forest god, with all the arrogance of his kind. They spirited him away from the peak before I could reach him, but my magic found him at Raynewood all the same." },
        { id = "o_done", when = { questDone = TODO_QUEST("Ordanus") },
          text = "I knew him long ago, when he looked down on everyone, even the Highborne. He isn't holding his head so high these days, is he?" },
      },
      choices = {
        { text = "You never said how you knew him.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "I am, and I don't take a word back. You wear the Horde's colours, so we'll be civil, but don't expect me to like what you are." },
      },
      choices = {
        { text = "Civil will do.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "You'll find I'm not what you think.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I want them to stop pretending that magic is a sickness in the land, because my magic kept this outpost warm all last winter. If they ever cared to ask me, I'd tell them so, but they never ask, and I've stopped waiting." } },
      choices = {
        { text = "Then take your power back. Don't wait for permission.", next = "BACK", reply = "That's what I've been doing all along, and you're the first on this mountain to say so without flinching.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Their ways are old. You could try to understand them.", next = "BACK", reply = "I've tried, and they've given me nothing but scorn. Understand them yourself, if you have the patience.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "That's the question, isn't it, and how I know they have any is my own business. They keep to their den more than they used to, and whatever they're planning, I'd like to hear it before the Horde has to." } },
      choices = {
        { text = "I'll get you whatever they're hiding. Your grudge is yours.", next = "BACK", reply = "Good, then we understand each other. Bring me what they're planning, and I'll take it from there.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll listen, but I won't rob druids for your grudge.", next = "BACK", reply = "Then listen well, and tell me what you hear. That's all I've ever asked.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A little more, because your elements are honest about being powerful, and the druids pretend their power is humble. They'd strip this land bare of magic and call it peace, and give me a fire elemental that admits it wants to burn any day." } },
      choices = {
        { text = "Power should be used openly, without false modesty.", next = "BACK", reply = "Exactly. The druids hide their power and then call everyone else arrogant for using theirs.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hidden power is safer power. The druids are wise to stay quiet.", next = "BACK", reply = "Safer for them, perhaps, but not for the rest of us. Hidden power always surprises someone eventually.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a mage, and I'm here on business that isn't yours. That's all the story you'll get." } },
    advice = { { id = "tp_ad", text = "Never let anyone tell you which magic you're allowed to love." } },
    cenarion_circle = { { id = "tp_circle", text = "Gardeners with claws, so don't let their smiles fool you." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was the greatest city of magic in the world, and the Legion burned it to ash. The Kirin Tor are rebuilding, but they will never be what they were, and they do not deserve to be." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor were arrogant, and the Legion punished them for it. I knew some of them, long ago, and I do not miss them." } },
    scourge = { { id = "tp_scourge", text = "The Scourge burned my homeland, and the prince who led them burned it with a smile. I do not speak of it often, and I will not speak of it now." } },
    arthas = { { id = "tp_arthas", text = "Arthas Menethil killed my people and defiled the Sunwell, and I would see him dead a thousand times over. I hope he is suffering in the north, wherever he went." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a practical orc, and he does not ask too many questions about my magic. I respect that, and I serve him well for it." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the Dream is a green paradise, and they walk it in their sleep. I have seen what their arrogance costs others, and I do not trust their paradise." } },
    _none = { { id = "tp_none", text = "Irrelevant, unless it's magic, and then it's mine." } },
  },
}

P:NPC {
  key = "jinzil", id = TODO_NPC("Witch Doctor Jin'Zil"), name = "Witch Doctor Jin'Zil",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "sly" }, values = { "loyal", "curious" },
  notices = { "class", "race" },
  impression = {
    first = "He says most of his cages are empty, which worries me.",
    third = "{name} met Witch Doctor Jin'Zil, a sly Darkspear who keeps a cave full of cages and a pot always on the boil near Sun Rock.",
  },

  greetings = {
    { id = "g_cave", text = "Come in, come in, mon, and don't mind the cages; most of dem be empty. Most." },
    { id = "g_away", when = { away = 14 }, text = "Ah, you been gone {away}, mon, and Jin'Zil was starting to think you ran off to Darsok. Come in, come in, and don't mind the cages." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Jin'Zil hear somebody on the rock believed a story you told them, mon. A good trick, that, and Jin'Zil knows good tricks better than Darsok ever will." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Ya smell like the Echo Isles, mon. Sit, sit, Jin'Zil got stories and stew." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Ah, the spirits like you, and dey whisper about you. Not all good things, but dey whisper." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Jin'Zil don't fear you, mon, but he watch you. The dead be dangerous, and the Light be dangerous, and you be both, mon. But you be Horde, and I be Horde, and if you ever need a cage for somethin', I got plenty empty ones. Most." } },
      choices = {
        { text = "I'll not be needing your cages, Jin'Zil.", next = "BACK", reply = "Dat be fine, mon, Jin'Zil got plenty of customers anyway. But the offer stand, if you change your mind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep a cage ready. I may bring you something.", next = "BACK", reply = "Ha! Dat be the spirit, mon, and Jin'Zil keep one dusted for you. Bring him somethin' interesting.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing dat would be bothering a druid, mon, mostly. A few forest spirits who got too curious, and Jin'Zil be letting dem go once dey tell him what he want to know." } },
      choices = {
        { text = "Let them go now. Spirits shouldn't be kept in cages.", next = "BACK", reply = "Dey be goin' soon enough, mon, when dey stop bein' useful. Jin'Zil not cruel to spirits, only curious.", fx = { align = { honor = 1 } } },
        { text = "Your business is yours. Learn what you can from them.", next = "BACK", reply = "Dat be the right answer, mon, and Jin'Zil like you better already. The forest got plenty more to teach.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Da Venture goblins and dem night elves both be pokin' round Jin'Zil's cave, mon, and Jin'Zil be too busy stirrin' to chase dem off. You stand at da door with dat axe, and Jin'Zil cook you somethin' special, maybe." } },
      choices = {
        { text = "I'll guard your cave, Jin'Zil. Fair is fair.", next = "BACK", reply = "Fair be fair, mon. Jin'Zil cook you somethin' special when you done, maybe with fewer eyes in it.", fx = { align = { honor = 1 } } },
        { text = "I'll guard it, but I'm not eating your cooking.", next = "BACK", reply = "Ha! Smart, mon, very smart, and Jin'Zil won't be offended. Most who eat his cooking don't say much after.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jin'Zil.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Da spiders, for da venom, and da harpy feathers, for da curse, and da wyvern's tail, for da flavour, mon. Jin'Zil be better than Darsok at dis, and Darsok know it, even if he never say." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Da spiders, for da venom, and da harpy feathers, for da curse, and da wyvern's tail, for da flavour, mon. Ah, your {pet} be a fine beast, mon, and Jin'Zil promise not to put it in da pot, at least not today." },
      },
      choices = {
        { text = "I'll hunt for you, but only what we need.", next = "BACK", reply = "Dat be fine, mon, Jin'Zil only need what he need anyway. Bring da venom and da feathers first.", fx = { align = { honor = 1 } } },
        { text = "I'll bring you anything. Fill every cage.", next = "BACK", reply = "Now dat be my kind of hunter, mon! Jin'Zil got cages to spare, and Darsok gonna be so jealous.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jin'Zil.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A few quiet friends, mon, who walk up by da peak at night while da Sentinels be watching da wrong path. Jin'Zil could use one more pair of quiet feet, if you don't mind da sound of cages rattlin'." } },
      choices = {
        { text = "I'll fight the elves, but I won't catch them for your pot.", next = "BACK", reply = "Fair enough, mon, Jin'Zil catch his own. You fight the elves, and Jin'Zil take care of the rest.", fx = { align = { light = 1 } } },
        { text = "Show me the path. The rattling won't bother me.", next = "BACK", reply = "Good, mon, dat be what Jin'Zil like to hear. Follow da quiet path, and mind the Sentinels.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Very different, mon, because you pull your magic out of books and Jin'Zil pull his out of da forest and da loa. Da elves up by da peak say your kind of magic broke da whole world once, and for once Jin'Zil think dey might be right." } },
      choices = {
        { text = "The arcane is a tool, and I use it carefully.", next = "BACK", reply = "Carefully be the only way, mon. Jin'Zil seen what happen to da careless ones, and it ain't pretty, even for stew.", fx = { align = { light = 1 } } },
        { text = "If it broke the world once, it can break the Alliance.", next = "BACK", reply = "Ha! Dat be a dangerous thought, mon, and maybe a good one. Just don't break the Horde while you do it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock_j = {
      big = true,
      lines = {
        { id = "wj_default", text = "Ah, so you be one of dose. Jin'Zil keep elves in cages and boil dere eyes, so I ain't gonna lecture you, but the loa know who you talk to, {g:nephew|niece}, and dey don't forget it." },
        { id = "wj_voice", when = { origin = "troll_other_voice" },
          text = "Dat other voice been with you since you were small, eh? Some witch doctors say send it back, some say make it work for you, and Jin'Zil say find out what it want before it find out what you want." },
      },
      choices = {
        { text = "The loa had their chance. I'll use whatever answers.", next = "BACK", reply = "Dat be your choice, mon, and Jin'Zil won't stop you. But the loa remember, and dey wait a long time.", fx = { align = { light = -1 } } },
        { text = "I'll keep the voice on a short leash.", next = "BACK", reply = "Good, mon. Keep dat leash short, and keep a little salt in your pocket, just in case it start talkin' back.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = {
        { id = "xhpriest_default", text = "Priests heal, witch doctors heal, and Jin'Zil heal best, mon, ask anybody but Darsok. I could use a priest's steady hands with my brews, because some of them be for the healing too, and some of them, well, you ask me about the cages later." },
      },
      choices = {
        { text = "I'll help with your brews, if they're for healing.", next = "BACK", reply = "Dat be fine, mon, Jin'Zil got plenty of healing ones. We start with dose, and you don't ask about da others.", fx = { align = { light = 1 } } },
        { text = "I'll help, whatever the brews are for.", next = "BACK", reply = "Ha! Now dat be a priest Jin'Zil can work with, mon. Don't ask questions, and Jin'Zil won't tell lies.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "Ah, humans! Jin'Zil never had one in a cage, mon, and he be very curious. They live fast like a fire in dry grass, they build a stone town in a lifetime, and dey never stop talking about it after." },
        { id = "hum_v_undead", when = { race = "Scourge" },
          text = "Ooh, you used to be one, didn't you, mon? Jin'Zil never had a living human in a cage, and he be very curious, so maybe you tell him what they keep in that busy little heart." },
      },
      choices = {
        { text = "Would you really cage a human?", next = "hu_stance" },
        { text = "The Darkspear have no grudge against them?", next = "BACK", reply = "Grudge, plenty! Kul Tiras shoot our people on the isles, mon. But a grudge and a curiosity can share a hut, if they don't fight over the blanket.", fx = { opinion = { humans = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "Only for a little while, to watch what it eat, and maybe what it dream! The Kul Tirans put our people in chains on the isles, so Jin'Zil figure a human in a cage be only fair turnabout, but he would feed it better." },
      },
      choices = {
        { text = "Turnabout is fair. They caged orcs for years.", next = "BACK", reply = "You see, you see! Jin'Zil not crazy, he only remember. Now help him with dese cages and we talk more.", fx = { align = { light = -1 }, opinion = { humans = "hate" } } },
        { text = "No cages for anyone. That's how the camps began.", next = "BACK", reply = "Hmph, you sound like an orc shaman, all frowns. Fine, fine, Jin'Zil keep his curiosity in his head, where nobody can see it.", fx = { align = { light = 1 }, opinion = { humans = "mixed" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_feeders", when = { questDone = TODO_QUEST("Blood Feeders") },
          text = "Xen'Zilla say you cleared out dem Deepmoss spiders from the slopes near Malaka'jin. Good, mon, because I need dem slopes for my herbs, and I don't like sharin' them with things dat got eight legs and too many eyes." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one wieldin' the Light! Jin'Zil seen many things in dis cave, mon, but never dis. You be a strange one." },
        { id = "h_default", key = true,
          text = "Jin'Zil be my name: witch doctor, Darkspear, and friend to Darsok and Rokhan. Dis cave be my workshop, and da forest out dere be my pantry." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Letter to Jin'Zil") },
          text = "A letter from Darsok, dat old knife? Is he still bragging? Course he still bragging, so give it here, mon." },
        { id = "h_magic", when = { questActive = TODO_QUEST("Jin'Zil's Forest Magic") },
          text = "Da forest got magic in it, if you know where to cut. Bring Jin'Zil what he asked, and don't let da tree-folk catch you." },
        { id = "h_darsok", when = { heardLine = "darsok.h_default" },
          text = "You met Darsok at da Crossroads? Ha! He tell you he the best? He always say dat, but he be second best, and Jin'Zil be first." },
        { id = "h_quiet", when = { metBefore = true }, text = "De spirits been quiet today. Quiet spirits make Jin'Zil nervous, mon, like a cage that stop rattlin'." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You be a sneaky one, eh? Jin'Zil like sneaky, mon, because sneaky be how dem elves end up in Jin'Zil's cages." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "Ah, Jin'Zil can smell da arcane on you like burnt hair, mon. Don't go pointin' dat fire at da cauldron, because dis stew been bubblin' three days." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon! Jin'Zil like a big strong one, because big strong ones carry da heavy cages back from da forest." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon! Jin'Zil got empty cages need fillin', and da forest out dere be full of fine ingredients." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, eh? You be talking to beasts and I be talking to spirits, so maybe we gonna get along, as long as you don't be asking what's in da cages." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon! Jin'Zil heal better than any priest, but you can stay anyway." },
        { id = "h_apprentice", when = { origin = "troll_witch_doctor_apprentice" }, text = "Ha! A Sen'jin root-grinder, all grown up! Jin'Zil know dat look, mon, because Jin'Zil boil things dat still moved for an old witch doctor too, and look how well he turned out." },
      },
      again = {
        { id = "h_again", text = "What else you want, mon? Jin'Zil got all day and a pot on da boil." },
        { id = "h_again2", text = "Ask, ask, and mind da cauldron while you do." },
      },
      choices = {
        { text = "What do you make of humans, Jin'Zil?", next = "hu_view" },
        { text = "What's in the cages?", next = "cages" },
        { text = "You seem to know Darsok well.", next = "darsok" },
        { text = "What do the spirits tell you?", next = "spirits" },
        { text = "Something must have become of the elves in the cages.", next = "after", when = { questDone = TODO_QUEST("Jin'Zil's Forest Magic") } },
        { text = "The Echo Isles send their greetings, uncle.", next = "troll", when = { race = "Troll" } },
        { text = "I hear another voice when I cast, uncle. It isn't the loa.", next = "warlock_j", when = { race = "Troll", class = "WARLOCK" } },
        { text = "Want an extra pair of hands at the pot, uncle?", next = "xpot", when = { origin = "troll_witch_doctor_apprentice" } },
        { text = "Who caught the elves for your cages, Jin'Zil?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is your magic so different from mine, Jin'Zil?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "You seem to need a warrior, Jin'Zil.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What beasts does Jin'Zil want for his cauldron?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What is in the cages, Jin'Zil?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "You and the priests must get along, Jin'Zil.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do trolls fear the Light, Jin'Zil?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    cages = {
      lines = { { id = "c_default", text = "Ingredients, mon, and sometimes ingredients be talking. Dat's normal, so don't listen to dem." } },
      choices = {
        { text = "...those are night elves.", next = "elves" },
        { text = "...right.", next = "BACK" },
      },
    },
    elves = {
      big = true,
      lines = {
        { id = "e_default", text = "Three little cages for three little elves, from up by da peak where dey hug dem trees. Jin'Zil gonna give dem a taste of dey own forest magic, mon, and dey gonna feel right at home." },
      },
      choices = {
        { text = "What's in the brew?", next = "brew" },
        { text = "That's cruel, even for war.", next = "BACK", reply = "Cruel? Mon, dey cage our spirits with their forests every day. Jin'Zil only return the favour.", fx = { affinity = -1, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Let the elves taste their own magic, then.", next = "BACK", reply = "Dat be the spirit, mon, and Jin'Zil knew you understand. Dey gonna feel right at home.", fx = { align = { light = -1 } } },
      },
    },
    brew = {
      lines = {
        { id = "b_default", text = "Stonetalon sap, whiskers off dem twilight runners, a fey dragon's scale, and eyes, lots of courser eyes, because you can never have enough eyes. All of it from da peak, mon, so da elves be gettin' a little bit of home." },
      },
      choices = {
        { text = "I'll fetch it.", next = "BACK", reply = "Good, mon, and bring plenty of eyes. Jin'Zil always run short of eyes.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I won't help you poison anyone, Jin'Zil.", next = "BACK", reply = "Poison be a strong word, mon, but fine, Jin'Zil find another pair of hands. Off with you, then.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darsok = {
      lines = {
        { id = "d_default", text = "Darsok Swiftdagger and Jin'Zil go way back, but Jin'Zil not heard from him in many years before dat letter. He wrote dat da last of da Bloodfeathers be dead, and dat make an old troll smile." },
      },
      choices = {
        { text = "The Bloodfeathers?", next = "rokhan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rokhan = {
      lines = {
        { id = "r_default", text = "Harpies in da Barrens, mon, nasty ones. My friend Rokhan went with dat crazy mok'nathal Rexxar to kill da older sister, back in da day. Ah, to be young like you again." },
      },
      choices = {
        { text = "Rexxar? The Champion of the Horde?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = {
        { id = "s_default", text = "Dey tell Jin'Zil when it gonna rain, when somebody lyin', and when somebody about to knock over da good pot. Dey talk more when dey hungry, so Jin'Zil keep dem fed." },
      },
      choices = {
        { text = "Fed with what?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "a_default", text = "Dey went out like little lights, mon, little wisps flyin' out da cave and gone. So much for da power of nature, eh?" },
      },
      choices = {
        { text = "I'll carry that one a while.", next = "BACK", reply = "Carry it, then, mon, and Jin'Zil won't laugh at you for it. Most who see da little lights go out carry dem longer than dey think.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "So much for it.", next = "BACK", reply = "So much for it, ya, and Jin'Zil sleep fine tonight. Da forest be strong only when nobody be lookin', mon.", fx = { affinity = 1, align = { light = -1 }, trait = { cruel = 1 } } },
      },
    },
    troll = {
      lines = {
        { id = "t_default", text = "Ha! Don't call Jin'Zil uncle, he not dat old, not yet. Sit by da fire, Darkspear, and tell me how da Isles be doin' since Zalazane went bad." },
      },
      choices = {
        { text = "Not well, uncle. Not yet.", next = "BACK", fx = { affinity = 2, learn = { "echo_isles" } } },
        { text = "Another time.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xpot = {
      big = true,
      lines = {
        { id = "xpt_default", text = "Uncle again! Fine, fine, a root-grinder can call Jin'Zil what dey like. Your old master teach you every loa want somethin', yes? Well, dis pot want harpy feathers and an elf's patience, and Jin'Zil got neither, so tell me, mon, would you stir a pot if you didn't know what was in it?" },
      },
      choices = {
        { text = "Never. You learn what a brew wants before you stir.", next = "BACK", reply = "Ha! Your old master teach you right, mon, and Jin'Zil got nothin' to add. Learn da brew, and da brew don't eat you.", fx = { affinity = 1, align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Sometimes stirring is how you find out, Jin'Zil.", next = "BACK", reply = "Dat be how Jin'Zil lose two eyebrows and a cousin, mon, but you not wrong. Stir careful, and stand back.", fx = { affinity = 2, align = { order = -1 }, trait = { curious = 1 } } },
        { text = "There must be more in it than that.", next = "xpot_what" },
      },
    },
    xpot_what = {
      lines = {
        { id = "xpw_default", text = "Ha! A good apprentice always want to know, and a good witch doctor never tell da whole of it. Some of it be for Darsok's sore knees and some of it be for da elves up at da peak, and you can guess which half Jin'Zil enjoy more." },
      },
      choices = {
        { text = "I'll leave the guessing to you, uncle.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Jin'Zil be a witch doctor of da Darkspear, mon. Dat be all da story you need, and most of it true." } },
    advice = { { id = "tp_ad", text = "Never eat nothin' in a witch doctor's cave, mon, not even if he say it be stew, and especially if it blink at you." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear be the finest witch doctors in Kalimdor, mon, and Jin'Zil be the finest of the Darkspear. Darsok will tell you different, but Darsok be wrong." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin be a good chief, and he lets Jin'Zil do his work without asking too many questions. That's the best kind of chief, if you ask me." } },
    the_elements = { { id = "tp_the_elements", text = "The spirits and the loa be different things, mon, and a witch doctor knows both. The spirits be the wind and the rain, and the loa be older and hungrier." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi be fools, trying to wake the blood god in Zul'Gurub. Hakkar don't care who feeds him, mon, and he'll eat the Gurubashi first." } },
    _none = { { id = "tp_none", text = "Da spirits don't say, mon. Ask again tomorrow; maybe dey change dey minds." } },
  },
}

P:NPC {
  key = "jayka", id = TODO_NPC("Innkeeper Jayka"), name = "Innkeeper Jayka",
  bible = "bibles/stonetalon.md", role = "innkeeper", tier = "service",
  communities = { "sun_rock" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary" },
  impression = {
    first = "She wants weapons down, boots off and a story first.",
    third = "{name} rested at Innkeeper Jayka's inn on Sun Rock, where weary warriors trade stories for a seat by the fire.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Weapons down, boots off, friend, and tell me about your fights. I've your favorite bed ready." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Weapons down, boots off, and tell me who you've been fighting. If it's my guests, out." },
    { id = "g_inn", text = "Weapons down, boots off, and tell me who you've been fighting. That's how we do it on Sun Rock, and how my clan did it round the fires in Durotar." },
    { id = "g_home", when = { homeInn = { "Sun Rock Retreat" } }, text = "Home on the rock again! The wind's howling tonight, so it's a good night to be indoors." },
    { id = "g_away", when = { away = 14 }, text = "Look who's back on the rock after {away}! Weapons down, boots off, and tell me everybody you fought while you were gone." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole inn's been talking about the help you've given Sun Rock. Sit down and tell me the story yourself, and your drink's on me." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody came in here last week cursing your name over their ale. Fight whoever you like outside, but in my inn it's boots off and tempers down." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Harpies or spiders? It's always one or the other up here. Sit down and eat; both kinds of trouble will wait." },
  },

  start = "hello",
  nodes = {
    dd_kaya = {
      lines = {
        { id = "dd_ky_default", text = "Shaken, but she's young and she'll mend. The Grimtotem were waiting for her on the road, which means someone knew she'd be walking it, and that worries Maggran more than any ambush. Do you think the Grimtotem have eyes on Sun Rock?" },
      },
      choices = {
        { text = "They do. Maggran should root out whoever's talking.", next = "BACK", reply = "That's what he's doing, and he's not gentle about it. I'll keep my ears open at the bar, because people talk when they drink.", fx = { align = { order = 1 } } },
        { text = "Maybe it was only bad luck. Don't turn on your own.", next = "BACK", reply = "I hope you're right, because suspicion on a small rock like this spreads faster than fire. I'll tell Maggran you said so.", fx = { align = { order = -1 } } },
        { text = "Something else, Jayka.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "We welcome everyone who comes in tired. Some of the orcs here might stare at the Light, because they remember the camps, but nobody starts trouble in my inn. Sit, rest, and tell me a story." } },
      choices = {
        { text = "I'll rest and tell you a story, Jayka.", next = "BACK", reply = "Then sit by the fire, and I'll bring you something warm while you think of one. The last good story I heard was about a kodo stuck in a well.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll rest. Stories are for others.", next = "BACK", reply = "Then rest well, and keep your stories if you like. The fire will tell me plenty while you sleep.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only what travellers carry up the mountain, and none of it is good, because the Venture Company burns faster than the tauren can plant. I sometimes wonder whether Orgrimmar even knows, or whether anyone there cares." } },
      choices = {
        { text = "The Warchief will act once Sun Rock asks him plainly.", next = "BACK", reply = "I hope you're right, and I hope someone asks him soon. The vale doesn't have many seasons left to wait.", fx = { align = { order = 1 } } },
        { text = "Orgrimmar is far away. We'll defend the vale ourselves.", next = "BACK", reply = "That's what Maggran says, and the braves agree with him. Orgrimmar is very far from the smoke.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than I'd like, because it means there's more fighting than I'd like. The Grimtotem and the harpies keep them busy, and they come in here bleeding and leave a little better, which is all I can do for them." } },
      choices = {
        { text = "I'll fight so fewer have to come in bleeding.", next = "BACK", reply = "Then you're the kind of guest I'm gladdest to see. Come back whole, because I'm tired of scrubbing blood off my blankets.", fx = { align = { honor = 1 } } },
        { text = "Fighting's the job. I'll rest when it's done.", next = "BACK", reply = "Then rest here when it is, and I'll have the fire warm. Fighting is a long job on this mountain.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jayka.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the wyverns are hunting closer to the road, and the harpies have grown bold enough to swoop at caravans. A hunter who could thin them out would have every traveller in Sun Rock buying them a drink." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That the wyverns are hunting closer to the road, and the harpies have grown bold enough to swoop at caravans. Your {pet} is welcome by my fire, {class}, and if it snores, it'll not be the loudest in here." },
      },
      choices = {
        { text = "I'll thin them out for the travellers' sake.", next = "BACK", reply = "Then the first drink is on the travellers, and I'll tell them who to thank. They'll be glad to stop running from shadows.", fx = { align = { honor = 1 } } },
        { text = "Travellers can hire their own guards.", next = "BACK", reply = "They can, if they have the coin, but most of them don't. I'll find someone else to ask, then.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jayka.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_kaya", tags = { "news" }, when = { questDone = TODO_QUEST("Kaya's Alive") },
          text = "Tammra came in last night and cried into her stew, and then she laughed, and then she told the whole inn how you brought young Kaya home alive. Nobody on Sun Rock will forget that, and neither will I." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light! Weapons down, boots off, and tell me who you've been fighting. I don't care what you pray to." },
        { id = "h_default", text = "I'm Jayka, and I keep the inn on Sun Rock. Warriors come in tired and leave rested, or at least less tired, and an orc who feeds the Horde's fighters serves it as well as any grunt." },
        { id = "h_op_magatha", tags = { "news" }, when = { gossip = { topic = "grimtotem", stance = "lost" } },
          text = "Maggran says you'd see the Grimtotem gone from the bluff. Keep your voice down about Magatha in here, because you never know which of my guests paints their face at night." },
        { id = "h_op_arcane", tags = { "news" }, when = { gossip = { topic = "arcane_magic", stance = "gift" } },
          text = "Braelyn's been almost cheerful since you two talked about magic, and I'd like to know what you said, because nobody else has managed it in years." },
        { id = "h_op_goblins", tags = { "news" }, when = { gossip = { topic = "goblins", stance = "useful" } },
          text = "Tammra came in quiet tonight and said someone told her the Horde needs goblin trade whatever it costs. I'm not saying it was you, but you've the look." },
        { id = "h_harpies", when = { metBefore = true }, text = "The harpies screamed all night, the braves screamed back, and nobody slept. Breakfast?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then you'll know the wind howling round this inn isn't angry, only talkative, and you can tell the other guests so." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Sit down, take your boots off, and tell me who you've been patching up, because the braves who come in here never tell me the whole story." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, and you'll want a warm corner, I expect, though you could probably warm it yourself. Tell me who you've been fighting, and I'll find you a bed." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "Leave whatever you keep in that bag outside the door, please. It's twitching, and the rugs in here are old and catch fire very easily." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You came in so quietly I nearly poured you a drink before I saw you. Weapons down, boots off, and keep your hands where my other guests can see them, if you please." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and a tired one, I'd wager. Put that axe down, take your boots off, and tell me who you've been fighting." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast can sleep by the fire, and you can tell me what's out in the hills, because I hear plenty but I never see it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, and I can see the forest on you, leaves and all. Boots off, sit down, and tell me what's been happening down in the Charred Vale." },
      },
      again = {
        { id = "h_again", text = "Anything else? The fire's warm and the stew's hot, so sit and tell me a story with some blood in it." },
        { id = "h_again2", text = "Sit a while longer if you like. Nobody hurries on the rock, and a warrior who rests fights better." },
      },
      choices = {
        { text = "Kaya's safe now, Jayka. How is she?", next = "dd_kaya", when = { questDone = TODO_QUEST("Kaya's Alive") } },
        { text = "Do you like it up here?", next = "rock" },
        { text = "The rock must have news of its own.", next = "news" },
        { text = "Want to hear how my last fight went?", next = "story" },
        { text = "Is the wind on Sun Rock as friendly as you say, Jayka?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What troubles Sun Rock that magic might help with?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Your inn must hear plenty of talk.", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do many warriors rest at Sun Rock, Jayka?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do travellers say about the hills, Jayka?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You must hear news from the Charred Vale, Jayka.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Do the tauren of Sun Rock welcome a paladin, Jayka?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just resting.", next = "END" },
      },
    },
    rock = {
      lines = {
        { id = "r_high", text = "It's high, it's windy, and the water's cold enough to stop your heart. I wouldn't live anywhere else." },
      },
      choices = {
        { text = "Why not?", next = "lands" },
        { text = "I can see why.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lands = {
      lines = {
        { id = "l_default", text = "If the Horde means to hold these new lands, it needs somewhere to rest its bones between battles, and someone has to keep that place. I'd rather it was me than some goblin who charges extra for the blanket and more again for the blanket without fleas." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    news = {
      lines = {
        { id = "n_default", text = "Maggran's still after the Bloodfuries, Tammra's still on her knees in the dirt, and Braelyn, the mage by the fire, still won't eat my stew. Same as every week, and I'm glad of it." },
      },
      choices = {
        { text = "The mage won't eat?", next = "braelyn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    braelyn = {
      lines = {
        { id = "b_default", text = "Says the food's too plain, and I say she's too thin. She pays her board, though, and she keeps the fire lit without wood, so I only complain about the scorch marks on the ceiling." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    story = {
      lines = {
        { id = "s_default", text = "Always! Put your axe down by the hearth and tell it properly, mind, with the bit where it nearly killed you." },
      },
      choices = {
        { text = "(Tell it straight, the bad parts too.)", next = "story_true", fx = { trait = { kind = 1 } } },
        { text = "(Tell it bigger than it was.)", next = "story_tall", fx = { trait = { witty = 1 } } },
      },
    },
    story_true = {
      lines = { { id = "st_default", text = "Now that's a story worth hearing, because it's true. The braves will be telling it wrong by tomorrow, but you and I will know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { sun_rock = 1 } } } },
    },
    story_tall = {
      lines = { { id = "sl_default", text = "Ha! Twelve of them, was it, and you with one arm? You'll fit right in on Sun Rock, where every harpy grows a foot with each telling." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Grimtotem, mostly, and the harpies up on the ridge, who steal anything that isn't tied down. The braves say a little fire chases off a harpy faster than a spear, so if you're staying a few nights, they'd be glad of the company." } },
      choices = {
        { text = "I'll go up the ridge tomorrow and drive them off.", next = "BACK", reply = "Thank you. The harpies have been stealing our washing for weeks, and I'm down to one good apron.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The braves can manage harpies. I'm only here for the bed.", next = "BACK", reply = "Then sleep well, and I won't ask again. The bed is the best thing I have to offer anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Everyone talks in my inn, that's what the drinks are for. Grimtotem traders come through now and then, very polite and very curious about the roads, and I don't like them at all." } },
      choices = {
        { text = "Point one out to me, and I'll see where he goes.", next = "BACK", reply = "I'll point, and you follow, quietly, and tell me nothing I don't want to hear. Maggran will want to know where they go.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Tell the elders, and let them handle it.", next = "BACK", reply = "That's the wiser course. I'll speak to them in the morning, once Maggran's had his first mug and can be reasoned with.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Friendly enough to me, but it blew three tents off the ledge last spring, so maybe it only likes the inn. The Grimtotem down at their camps say the mountain wind belongs to them, and I say it belongs to whoever pays for drinks." } },
      choices = {
        { text = "The wind should be shared by every tribe under Cairne.", next = "BACK", reply = "That's what Cairne would say, and I'd like to believe it. The Grimtotem have never listened to him, though.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wind belongs to no one, not Cairne and not the Grimtotem.", next = "BACK", reply = "Then it belongs to the inn tonight, and I'll be glad of it. Just keep your tent pegged down.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the inn on Sun Rock, and I've heard more battle stories than any war chronicler alive." } },
    advice = { { id = "tp_ad", text = "Sleep while you can up here. The harpies don't keep regular hours, and they shriek like a kodo with its tail in a door." } },
    thrall = { { id = "tp_thrall", text = "The Warchief built a home for the orcs, and he gave me the chance to build one too. My inn is small, but it's mine, and that's thanks to him." } },
    cairne = { { id = "tp_cairne", text = "Cairne's tauren built Sun Rock, and they let me run the inn. They're good folk, though they eat more than orcs." } },
    second_war = { { id = "tp_second_war", text = "Half my guests are old soldiers from the Second War, and they tell the same stories every night. I don't mind, because the stories get better every time." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken stop at my inn sometimes, and they don't eat or drink or sleep. I charge them for the chair anyway, because it's still my chair." } },
    _none = { { id = "tp_none", text = "Ask Maggran. He knows the mountain; he just doesn't like saying much about it until his third mug." } },
  },
}

P:NPC {
  key = "albagorm", id = TODO_NPC("Keeper Albagorm"), name = "Keeper Albagorm",
  bible = "bibles/stonetalon.md", role = "noble", tier = "quest",
  communities = { "stonetalon_peak" }, temper = { "serene" }, values = { "patient", "protective" },
  spiritSensitive = true,
  notices = { "class", "form", "lock_steed" },
  impression = {
    first = "He says crimes are done with hands, not banners.",
    third = "{name} met Keeper Albagorm, the serene keeper of the grove at Stonetalon Peak who mourns the burning of the Charred Vale.",
  },

  greetings = {
    { id = "g_grove", text = "Peace, little one, and Elune's light upon you. This grove is old, and wise, and wary; tread softly and you'll find it kind." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, little one, and the grove has grown a little older while you were gone. Tread softly, and welcome back." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard someone on the peak was left angry after speaking with you, little one. Anger spreads like fire in dry timber, so I'd ask you to be careful." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the Circle! Welcome, welcome. The mountain has missed druids, and so have I." },
    { id = "n_horde", cat = "class", when = { faction = "Horde" },
      text = "You come from Sun Rock's side of the ridges, but that's no crime here; crimes are done with hands, not banners." },
    { id = "n_lock_steed", cat = "lock_steed", when = { aura = { 5784, 23161 } },
      text = "That horse of yours leaves burning prints in the moss, little one, and every one of them is a wound the grove must heal. Walk here on your own feet, if you would be so kind." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, little one, and so do the goblins' saws. The earth's spirits were here before any banner, so tell them, if you can, that not all of us have forgotten them." } },
      choices = {
        { text = "I'll tell it, Keeper, and help the forest heal.", next = "BACK", reply = "Then the earth will hear you, little one, and it will remember. Go to Tammra on Sun Rock; she has more seeds than hands.", fx = { align = { light = 1 } } },
        { text = "The goblins will pay for those fires, in full.", next = "BACK", reply = "They will, little one, though I hope the paying leaves less ash than the fires did. Let justice be swift and the vale be spared.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The same as I ask of everyone: to judge each deed by itself. You walk under the Horde's banner, whose raiders come up the ridges with fire, and you call on the Light that once hunted your kind. Banners tell me nothing, so I would see what your hands do." } },
      choices = {
        { text = "Judge me by my deeds, Keeper. They'll be just.", next = "BACK", reply = "Then I'll watch your deeds with hope, little one, though the trees will tell me of them before you do.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I owe the trees no answers, Keeper.", next = "BACK", reply = "You owe them nothing, little one, but they will judge you anyway. Trees have long memories and no need of answers.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It welcomes anyone who comes in peace, little one, and a warrior can come in peace as well as any druid. The fires in the vale were set by greedy hands, not by soldiers, and I know the difference." } },
      choices = {
        { text = "Then I'll keep my blade sheathed among your trees.", next = "BACK", reply = "Then you are welcome under every bough, little one. The dryads will come out to look at you, once they trust you.", fx = { align = { honor = 1 } } },
        { text = "My blade goes where I go, Keeper.", next = "BACK", reply = "Then the trees will watch you closely, little one, as I will. Walk carefully among them.", fx = { align = { honor = -1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You may, little one, if you take what you need and no more, and thank what you take. The fires in the vale have driven many creatures up the slopes, and the forest cannot feed them all." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "You may, little one, if you take what you need and no more, and thank what you take. Your {pet} has the bearing of the old forest's creatures, little one, and the trees take note of it. They're glad it walks with you." },
      },
      choices = {
        { text = "I'll take what I need and thank what I take.", next = "BACK", reply = "Then the forest welcomes you, little one, and so do I. The stags on the high slopes are thin this year, so spare the does.", fx = { align = { honor = 1 } } },
        { text = "The forest is crowded. I'll hunt as I see fit.", next = "BACK", reply = "Then the forest will remember, little one, and it remembers longer than you'll live. Hunt gently, I beg you.", fx = { align = { honor = -1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No, little one, though I've learned that quiet feet and quick hands can go either way, as all hands do. The Venture Company sends men up the slopes to mark the oldest trees for cutting, and someone who could take their markers down unseen would do this mountain a great kindness." } },
      choices = {
        { text = "I'll pull their markers and harm none of them.", next = "BACK", reply = "Then the oldest trees will stand another season because of you, little one. Some of them watched the Sundering.", fx = { align = { light = 1 } } },
        { text = "I'll pull their markers, and the men who set them.", next = "BACK", reply = "I cannot ask that of you, little one, and I will not thank you for it. But I will not pretend the markers didn't matter.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They hold nothing against you, little one, but they remember the Well of Eternity, and so do the kaldorei who were alive to see it drown. Use your gift to help the vale grow back and the grove will think well of you, whatever the old memories say." } },
      choices = {
        { text = "Then I'll use my gift as the grove asks.", next = "BACK", reply = "Then the grove will think well of you, little one, and so will I. Help the vale grow, and the Well will be a little further from their minds.", fx = { align = { order = 1 } } },
        { text = "Old memories shouldn't chain my magic, Keeper.", next = "BACK", reply = "They chain nothing, little one, they only remember. Use your magic freely, but remember with them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The grove remembers the Burning Legion, little one, and the demons who walked through Ashenvale and Felwood and left them sick. A tree can't tell a bound thing from a free one, so to the grove yours is only one more fire waiting to happen." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The grove remembers the Burning Legion, little one, and the leaves nearest your servant have curled already, as they did when the demons walked through Ashenvale and Felwood. A tree can't tell a bound demon from a free one, so to the grove yours is only one more fire waiting to happen." },
      },
      choices = {
        { text = "Then it stays bound, and far from your trees.", next = "BACK", reply = "Thank you, little one. The dryads would flee the grove if they caught its scent.", fx = { align = { light = 1 } } },
        { text = "The trees will have to learn to bear it.", next = "BACK", reply = "Trees learn slowly, little one, and they forget even slower. Keep it away from them, I ask you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_al = {
      lines = {
        { id = "tal_default", text = "And I return them, gladly. Malfurion chose well when he taught your people, whatever the Archdruid in Darnassus says about it, and this grove has seen tauren druids walk its paths with more care than some of my own kind." },
        { id = "tal_pupil", when = { origin = "tauren_hamuul_pupil" },
          text = "You learned at Hamuul's own fire? Then you'll know his patience, and you'll need it here, for the vale won't heal for any of us in a single season." },
      },
      choices = {
        { text = "The Circle should be one, whatever its races.", next = "BACK", reply = "That is my hope too, little one, and Malfurion's, I think. Hamuul's tauren have already proved it can be done.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "My people walk their own path, Keeper.", next = "BACK", reply = "They do, little one, and they walk it well. The Earth Mother and the forest are not so far apart.", fx = { align = { order = -1 } } },
      },
    },
    sky_al = {
      lines = {
        { id = "sal_default", text = "I've heard there were druids among the sky-folk, and that they lean to the winds more than to Elune. You're welcome in this grove, though I'll admit you're the first of your people I've ever spoken to, and I'm curious what the wind tells you about the vale." },
      },
      choices = {
        { text = "It tells me the fire isn't finished.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Very little. The winds here are strangers.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "To remember that crimes are done with hands, not banners, and to judge each one alone. The fires in the vale were set by some, and not by all, and justice must know the difference." } },
      choices = {
        { text = "I'll judge each deed by itself, not by its banner.", next = "BACK", reply = "Then you understand justice, little one, better than many who wear the Sentinels' green. Walk with that in your heart.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Those who stand with arsonists share their guilt.", next = "BACK", reply = "Some do, little one, but not all who stand near a fire lit it. Judge carefully, or you'll burn the innocent with the guilty.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_mara = {
      big = true,
      lines = {
        { id = "xcl_mara_default", text = "Then the earth to the south may begin, very slowly, to forgive us all. I sent Marandis and her sisters down from this peak to watch over Maraudon, and I have spent every season since listening for the day they would stop sending bad news, and that day may have come." },
      },
      choices = {
        { text = "Let the earth heal in its own time. I only cleared the way.", next = "BACK", reply = "Then you've done a great thing, little one, and the earth will heal in its own time. Marandis would have thanked you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "She was a threat, and I removed it. Healing is your concern.", next = "BACK", reply = "Removed, yes, and the earth will thank you for that much. The healing is ours, and we will see to it.", fx = { align = { light = -1 } } },
        { text = "How long will Desolace take to heal, Keeper?", next = "xcl_mara2" },
      },
    },
    xcl_mara2 = {
      lines = { { id = "xcl_mara2_default", text = "Longer than you will live, I think, and perhaps longer than I will. A grove is patient, though, and so is a keeper, and the first green shoot in Desolace will be worth all the waiting." } },
      choices = {
        { text = "Then I hope you see that first green shoot, Keeper.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_mara", tags = { "news" }, when = { cleared = "Maraudon" }, text = "The wind from Desolace smells cleaner this week, little one, and the dryads say the princess of Maraudon has fallen. I would ask whether that was your doing, but I can see the stone dust still on your boots." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin among the dead, little one. The Light walks strange roads, and the trees have never seen it walk this one." },
        { id = "h_default", key = true,
          text = "Albagorm, keeper of the grove. I watch over this peak and its forest, and lately I watch the vale to the south, where the fires came." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "You climbed all this way? Good; the mountain needs friends who can climb. Rest a moment, and then listen." },
        { id = "h_vale", tags = { "news" }, when = { questActive = TODO_QUEST("Reclaiming the Charred Vale") },
          text = "The Charred Vale was green once. Those who burn it must be driven out, and then we can begin again. Will you help?" },
        { id = "h_falfindel", when = { questDone = TODO_QUEST("Reclaiming the Charred Vale") },
          text = "The Bloodfuries are broken for now, but they will gather again unless we move quickly. If Falfindel can call the forest's spirits to the vale, the regrowth can finally begin." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You came through the grove so softly that even the birds kept singing, little one. I'd ask only that you bring nothing out of it that you didn't carry in." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "There's arcane in you, little one, and the old trees here remember what such power did to the world before the Sundering. They'll forgive you if you're gentle, because they're very old and very patient." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Something dark walks a step behind you, little one, and the grove has gone very still to watch it. I won't turn you away, because what you do matters more to me than what you carry, but please keep it out of the trees." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, little one, with steel in your hands and Talondeep's dust still on your boots. The grove will let you pass, so long as the steel stays sheathed among the trees." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, little one, and you'll know that the beasts of this forest belong to it as much as the trees do." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" }, text = "A paladin, little one, so far from your mountains and fields. The Silver Hand's vows are known even here, though the trees remember older ones." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bloodfury", min = 30 } }, text = "The Bloodfury are fewer over the Charred Vale, little one, and the druids can plant again where they could not before. You've done the grove a kindness, and it will remember." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman of the mountain folk, little one. The earth of Stonetalon remembers the fires in the vale, and I think you will hear it weeping." },
      },
      again = {
        { id = "h_again", text = "Ask what you will, little one. The grove has time, as it has had since before the Sundering, and so do I." },
        { id = "h_again2", text = "Speak on. The wind is gentle up here, and so are the trees, most days." },
      },
      choices = {
        { text = "How old is the grove?", next = "age" },
        { text = "The vale looks like it burned for days.", next = "vale" },
        { text = "Who else guards this peak, Keeper?", next = "den" },
        { text = "Faldreas in Astranaar sent me to you.", next = "faldreas", when = { any = { { questActive = TODO_QUEST("Journey to Stonetalon Peak") }, { questDone = TODO_QUEST("Journey to Stonetalon Peak") } } } },
        { text = "Humans must have come up here before.", next = "human", when = { race = "Human" } },
        { text = "Can the Light heal burned land?", next = "priest", when = { class = "PRIEST" } },
        { text = "What would you ask of a paladin, Keeper Albagorm?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Princess Theradras is dead, Keeper. I fought her in Maraudon.", next = "xcl_mara", when = { cleared = "Maraudon" } },
        { text = "I'll help the grove.", next = "END", reply = "Then the grove welcomes you, little one. Walk gently among the roots; they are still tender from the fire.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hamuul Runetotem sends his respects, Keeper.", next = "tauren_al", when = { race = "Tauren", class = "DRUID" } },
        { text = "My people's druids honour the Circle too.", next = "sky_al", when = { race = "Skyborne", class = "DRUID" } },
        { text = "Do you think I'd steal from the grove, Keeper?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the trees really hold the arcane against me?", next = "xmage", when = { class = "MAGE" } },
        { text = "The grove might welcome a warrior, Keeper.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Can I hunt in your forest, Keeper?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What does the grove fear from what walks behind me?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What would you ask of a Forsaken paladin, Keeper?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do the fires in the vale trouble the spirits, Keeper?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "The vale's already burned, and I've no time for trees.", next = "END", reply = "Then go, little one, and may the road be kind to you. The grove will grow back without you, as it always has.", fx = { align = { light = -1 } } },
      },
    },
    vale = {
      big = true,
      lines = {
        { id = "v_default", text = "Fire, and greed, and those who'd rather the mountain bare. Forests have died before. They come back, if someone stands between them and the next fire." },
      },
      choices = {
        { text = "Who set the fire?", next = "venture" },
        { text = "Then I'll stand there.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    venture = {
      lines = {
        { id = "ve_default", text = "A greedy army of machines and the industrialists who drive them, little one, the goblins of the Venture Company. And now the Bloodfury harpies have settled on the burned ground and refuse us passage, so not one seed can be planted." },
      },
      choices = {
        { text = "Then the harpies must go.", next = "falfindel" },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    falfindel = {
      lines = {
        { id = "f_default", text = "They must, and then we will need more than saplings. Far to the south, where Thousand Needles meets the edge of Feralas, a wise druid named Falfindel Waywarder can call great spirits of the forest to the vale's aid." },
      },
      choices = {
        { text = "I'll carry word to him when the time comes.", next = "BACK", fx = { affinity = 2, standing = { stonetalon_peak = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    age = {
      lines = {
        { id = "a_old", text = "Older than the mountain's name and older than the Horde's coming, though that's young, for a tree. The oldest trees here would laugh at you for asking." },
      },
      choices = {
        { text = "What was here before the grove?", next = "temple" },
        { text = "Then I'll ask the trees.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    temple = {
      lines = {
        { id = "t_default", text = "The old stones you walked past were a temple of Queen Azshara, long ago, before the world broke. Not everyone is glad that druids tend those ruins now, and some would rather see us gone from them." },
      },
      choices = {
        { text = "Someone must want you gone.", next = "raiders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raiders = {
      big = true,
      lines = {
        { id = "r_default", text = "Raiders come up from the Horde's side of the ridges and kill my kin, the sons and daughters of Cenarius, and the botanists who tend the peak. They say the druids choke their magic, and so they come with fire." },
      },
      choices = {
        { text = "I'll stand with your kin.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { stonetalon_peak = 1 } } },
        { text = "Do the druids choke their magic?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "What would you have the Horde do, Keeper?", next = "forest_op" },
      },
    },
    forest_op = {
      lines = { { id = "fo_default", text = "I would rather hear what you would have it do, little one. The orcs who cut Ashenvale say they need timber to live, and my kin say every tree is sacred, so tell an old tree what you believe." } },
      choices = {
        { text = "The orcs have no right to these forests. Drive them out.", next = "fo_drive", fx = { affinity = 2, align = { light = 1 }, opinion = { ashenvale = "defend", warsong = "hate" } } },
        { text = "Trees grow back. The Horde's need comes first.", next = "fo_need", fx = { affinity = -2, align = { light = -1 }, opinion = { ashenvale = "necessary" } } },
        { text = "Let them take deadfall and leave the living trees.", next = "fo_dead", fx = { affinity = 1, opinion = { ashenvale = "compromise" } } },
        { text = "My people have guarded these forests for ten thousand years.", next = "fo_elf", when = { race = "NightElf" }, fx = { affinity = 2, opinion = { night_elves = "proud" } } },
        { text = "I'm not wise enough to answer that, Keeper.", next = "BACK" },
      },
    },
    fo_drive = {
      lines = { { id = "fod_default", text = "Spoken like a Sentinel, and the Sentinels will thank you. I only hope you have the patience to keep driving, for the orcs are as stubborn as the stone they build with." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fo_need = {
      lines = { { id = "fon_default", text = "Trees grow back, yes, in a hundred years, and the creatures who lived in them do not wait. I will not argue, little one, but I will remember." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fo_dead = {
      lines = { { id = "fodd_default", text = "A gentle answer, and an old one. My kin offered something like it, long ago, and no one on either side was listening." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fo_elf = {
      lines = { { id = "foe_default", text = "We have, and the trees know it. Guard them with patience, child of Elune, not only with glaives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    den = {
      lines = {
        { id = "d_default", text = "The druids of the Talon Den keep a barrow in the mountain's heart, where dryads and keepers of Mirkfallon stand guard. They keep many things there that must never fall into the wrong hands, and so the way in is guarded by a scheme of hidden keys." },
      },
      choices = {
        { text = "Keys?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    faldreas = {
      lines = {
        { id = "fa_default", text = "So Faldreas listened to the forest spirits after all, and they told him true; they said you were brave and didn't mind sore feet. The Talondeep Path is no gentle road, and you are here." },
      },
      choices = {
        { text = "What do you need of me?", next = "vale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    human = {
      lines = {
        { id = "hu_default", text = "In the war against the Burning Legion, the Lady Proudmoore's expedition camped near the caverns below this peak, and the orcs came after, searching for a prophet. The trees remember the noise of it, and they were glad when both had gone." },
      },
      choices = {
        { text = "We're quieter now, I hope.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Your Light mends flesh, little one, and I have seen it close wounds my own craft could not. Burned land wants seeds and rain and the slow patience of roots, but a healer who keeps the planters alive is welcome in my grove." },
      },
      choices = {
        { text = "Then I'll keep your planters alive.", next = "BACK", reply = "Thank you, little one. The planters come back from the vale coughing ash, and they need gentle hands more than they'll admit.", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Your planters will have to keep themselves alive.", next = "BACK", reply = "Then the grove will mourn those it loses, little one. I had hoped for more from a healer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The grove remembers ages, little one, and I remember some of what it tells me. Ask about any of these." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've been a friend to this peak, so the grove has no secrets from you that it's mine to share. Ask, little one." },
    },
    background = { { id = "tp_bg", text = "I am a keeper of the grove, as my brothers are, and this peak is the place I keep." } },
    advice = { { id = "tp_ad", text = "Go around the Charred Vale if you can, little one, and if you can't, go quickly and look up. The harpies come from above." } },
    venture_company = { { id = "tp_venture", text = "They brought fire and machines to a sacred mountain and called it business. The mountain will outlast them, but not without help." } },
    cenarion_circle = { { id = "tp_circle", text = "My father's children and their students. We keep the old places, and not everyone thanks us for it." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind is the high priestess of Elune and the leader of the Sentinels. She is wise, little one, though some say she is too quick to draw her glaive." } },
    malfurion = { { id = "tp_malfurion", text = "Malfurion Stormrage sleeps in the Dream, and the Circle waits for him to wake. I have waited a long time, little one, and I will wait longer." } },
    elune = { { id = "tp_elune", text = "Elune watches over the night elves and the druids both, and her light guides us in the dark. I pray to her, though I am more of the forest than of the temple." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is the world as it was meant to be, little one, and the druids walk it in their sleep. Something troubles it now, and I fear for those who sleep there." } },
    thrall = { { id = "tp_thrall", text = "The orcs' Warchief is wiser than the last, I am told, and he keeps a peace with Theramore. But his people still cut our forests, little one, and crimes are done with hands, not banners." } },
    _none = { { id = "tp_none", text = "The grove doesn't know, little one, nor do I. Some things not even ten thousand years will tell you." } },
  },
}

P:NPC {
  key = "faralia", id = TODO_NPC("Innkeeper Faralia"), name = "Innkeeper Faralia",
  bible = "bibles/stonetalon.md", role = "innkeeper", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "quiet" }, values = { "kind" },
  notices = { "weary" },
  impression = {
    first = "She tries to count the stars from her step.",
    third = "{name} found Innkeeper Faralia's small inn atop Stonetalon Peak, a quiet refuge for the few who climb that far.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ishnu-alah, friend. Rest here; the trees keep the quiet, and I'm glad to keep you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Rest if you must. The trees are quiet, and I would like you to keep them so." },
    { id = "g_inn", text = "Ishnu-alah. Rest here; it's quiet on the peak, and the trees keep the wind off." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I've counted a great many stars from this step without you. Rest here a while, it's quiet tonight." },
    { id = "g_word_helped", when = { word = "helped" }, text = "People on the peak say you've been helping out, and I'm glad of it. Rest here as long as you like, and mind the path down after dark." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not in words, but the wind changes when the fires burn below, and I've learned to read it like a letter. You'd read it better than I do, I'd guess." } },
      choices = {
        { text = "Trust the wind, Faralia. It knows more than we do.", next = "BACK", reply = "It does, and I'll trust it as long as it keeps telling me true. Tonight it smells of rain, which is a mercy.", fx = { align = { order = -1 } } },
        { text = "Trust the Sentinels' scouts, not the wind.", next = "BACK", reply = "I trust them too, but they can't be everywhere at once. The wind reaches places the scouts can't.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They are, though they speak of it quietly, because the Venture Company's smoke rises up the valley and they can taste it in the morning mist. Some of them want to go down and fight, but the elders say the peak must be kept first." } },
      choices = {
        { text = "The elders are right. The grove must be guarded first.", next = "BACK", reply = "They are, and I'll not argue with the elders. If the grove falls, there's nothing up here worth keeping an inn for.", fx = { align = { order = 1 } } },
        { text = "The forest below matters too. Someone must go down.", next = "BACK", reply = "Someone must, and some of the younger druids are already packing. Elune go with them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Safe enough by day, but after dark the harpies come down off the cliffs, and the paths are steep enough to kill you on their own. A warrior walking down with the travellers would make them braver, and I'd sleep easier." } },
      choices = {
        { text = "I'll walk the travellers down. Nobody should go alone.", next = "BACK", reply = "Thank you. I'll sleep easier knowing they're not alone on that path; it's narrower than it looks.", fx = { align = { honor = 1 } } },
        { text = "Travellers should know the risks before they climb.", next = "BACK", reply = "They should, but most don't, and I've lost guests to it. Walk them down, if you can bear it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Faralia.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mostly birds, and the hippogryphs Teloren keeps, though the cats from the forest come up now and then when they're hungry. Since the vale burned, more of them climb up here every season." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Mostly birds, and the hippogryphs Teloren keeps, though the cats from the forest come up now and then when they're hungry. Your {pet} can sleep by the hearth, {class}, and I'll put out a dish of water. It must be tired after that climb." },
      },
      choices = {
        { text = "I'll keep the cats off the path for your guests.", next = "BACK", reply = "Thank you. A cat took a guest's pack right off the step last week, bread and all.", fx = { align = { honor = 1 } } },
        { text = "The cats were here first. I'll let them be.", next = "BACK", reply = "They were, and I won't argue it. I'll warn the guests to keep to the lanterns.", fx = { align = { honor = -1 } } },
        { text = "Something else, Faralia.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Hardly ever, because there's little to steal on a mountaintop but the view and the Keeper's patience. The last one came up to watch the goblins at Windshear Crag from above, and he paid for his bed, which was more than I expected." } },
      choices = {
        { text = "I'd pay for my bed, the same as anyone.", next = "BACK", reply = "Then you're welcome here as long as you like. Ask for the room by the east window; the sunrise is worth waking for.", fx = { align = { honor = 1 } } },
        { text = "A rogue who pays his way isn't trying hard enough.", next = "BACK", reply = "Then he was a poor rogue and an excellent guest, and I'll take the guest. Pay for yours, please.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The druids of the Talon Den don't love the arcane, and they're too polite to say so, so mages tend to feel unwelcome without anyone telling them why. I don't mind it myself, as long as nothing in my inn starts glowing." } },
      choices = {
        { text = "I'll respect the druids' wishes while I'm on their mountain.", next = "BACK", reply = "Thank you. The druids will notice, though you'll only know it because they stop watching you.", fx = { align = { order = 1 } } },
        { text = "The druids can say it to my face, or not at all.", next = "BACK", reply = "They won't, because the kaldorei don't work that way. But they'll remember how you behaved.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It is, with the harpies in the cliffs and worse on the lower road, and I've lost guests to it before. If you're going down tonight, I'd ask you to walk with anyone else who's leaving." } },
      choices = {
        { text = "I'll see the others down safely before myself.", next = "BACK", reply = "Thank you, and Elune will see it. Last spring a lone traveller missed the path in the fog, and we didn't find him until summer.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They can walk down on their own.", next = "BACK", reply = "They can, but some of them won't make it, and I'll have to write to their families. Please walk with them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'll mind, because the Talon Den guards a grove whose keepers remember the Burning Legion, and they'll say what follows you smells of it. Keep it out of the grove and away from the hippogryphs, and nobody will say a word, though they'll think it loudly." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They'll mind, because the Talon Den guards a grove whose keepers remember the Burning Legion, and anyone downwind of you can smell the sulphur on your demon from here. Keep it out of the grove and away from the hippogryphs, and nobody will say a word, though they'll think it loudly." },
      },
      choices = {
        { text = "I'll keep it out of the grove, Faralia.", next = "BACK", reply = "Thank you. The druids will be grateful, though they'll never tell you so, and the hippogryphs will stop screaming.", fx = { align = { order = 1 } } },
        { text = "The druids can think what they like.", next = "BACK", reply = "They will, and they'll keep thinking it. But nobody will say a word, as long as it stays out of the grove.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_charredvale", when = { questDone = TODO_QUEST("Reclaiming the Charred Vale") },
          text = "Keeper Albagorm says you went down into the Charred Vale for him. He barely says a word to anyone, so if he spoke of you to me, it must have mattered to him a great deal." },
        { id = "h_default", text = "I'm Faralia, and I keep a small inn for those who climb up to the grove. Not many do, and the ones who do usually need the bed." },
        { id = "h_druid", when = { metBefore = true }, text = "A druid came up from the grove at dawn and sat on my step without a word, watching the mountain, and then she left. I've decided it was a compliment." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Up here the stars are near enough to count, and I've tried, but I always lose my place somewhere past the ridge." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I didn't hear the door at all, so you must be either a druid or a rogue, and I don't see any fur. Either way the bed's warm and the kettle's on." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You'd be the first mage I've seen up on the peak in a long while, and I'm glad of the company. The wind finds every crack in these walls, so sit close to the hearth." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you climbed the whole peak in that armour? Sit down by the hearth, then, before you fall down." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The climb must have been easy for you, then, with a beast to scout the path ahead of you." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, up here on the peak! The climb must have been hard in that armour, so sit and rest before you go anywhere." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, come up to the Talon Den! The grove will be glad of you, and so will I, because the druids here are the only guests who ever stay for a second cup." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Up on the peak, in this cold? The druids won't like whatever's lurking at your heel, but the kettle doesn't mind, so come in out of the wind." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, up on the peak. The wind here is strong enough to carry a voice to the stars, so if the spirits ever answer you, tell them I've been counting." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm in no hurry, and neither is the peak; it has watched the moon rise for longer than my people can remember." },
        { id = "h_again2", text = "Ask whatever you like while the kettle's on." },
      },
      choices = {
        { text = "Who comes up here?", next = "visitors" },
        { text = "Getting up and down the peak can't be easy.", next = "roads" },
        { text = "Do you pray to Elune, Faralia? I pray to the Light.", next = "elune", when = { class = "PRIEST" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Do rogues often climb this far up the peak?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why are mages so rare on the peak?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The peak doesn't look safe for travellers, Faralia.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What beasts live up on the peak, Faralia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is the path down the peak dangerous after dark?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The goblins below must trouble the Talon Den druids.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will the druids mind someone like me on the peak?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the spirits up here answer you, Faralia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just resting.", next = "END" },
      },
    },
    visitors = {
      lines = {
        { id = "v_default", text = "Druids from the Talon Den, Sentinels on their rounds, and adventurers sent up by the Keeper, most of them with harpy scratches. Now and then a human or a dwarf, looking very surprised to find an inn at the top of a mountain." },
      },
      choices = {
        { text = "Why does the Keeper need adventurers?", next = "keeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeper = {
      lines = {
        { id = "k_default", text = "For the Charred Vale, mostly, where the Bloodfuries keep the druids from planting. He'll tell you himself, gently, and then he'll send you somewhere dreadful." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    roads = {
      lines = {
        { id = "r_default", text = "Teloren keeps the hippogryphs here on the peak, and they'll take you to Auberdine, Astranaar or Nijel's Point. Otherwise it's the long walk down past Windshear Crag, and I wouldn't do it after dark." },
      },
      choices = {
        { text = "You seem worried about the road after dark.", next = "dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark = {
      lines = {
        { id = "d_default", text = "Goblin camps at Windshear Crag and spiders in the canyons, and none of them keep an innkeeper's hours. Sleep here, and go down in the morning light." },
      },
      choices = { { text = "Sound advice.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    elune = {
      lines = {
        { id = "e_default", text = "I ask her to guide my guests' dreams, that's all; I'm no priestess. If your Light gives a tired traveller a good night's sleep, then I think she and it would get along." },
      },
      choices = {
        { text = "I think they would.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the inn on the peak. There isn't much more to it than that, and I like it that way." } },
    advice = { { id = "tp_ad", text = "You look worn through. Rest under a roof tonight, and let Elune see to your dreams." } },
    elune = { { id = "tp_elune", text = "Elune watches over the travellers who sleep beneath her stars. I ask her to guide your dreams each night, and I hope she listens." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind is our high priestess and our leader, and she watches over us all. I have seen her only once, in Darnassus, and I have never forgotten it." } },
    teldrassil = { { id = "tp_teldrassil", text = "Teldrassil is the new World Tree, and Darnassus sits in its branches. It is beautiful, but I prefer the stars here on the peak." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids walk the Dream in their sleep, and they say it is greener than anything in this world. I dream of the stars instead, and I think they are just as beautiful." } },
    _none = { { id = "tp_none", text = "Ask the Keeper. He's lived here longer than the trees, and he remembers what the Sentinels have long forgotten." } },
  },
}
