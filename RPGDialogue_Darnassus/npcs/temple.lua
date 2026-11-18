-- The Temple of the Moon and the Temple Gardens: the priest trainers, Sister Aquinne, the bank.
-- Voices: bibles/temple.md
-- Year 1: Tyrande leads the Sisterhood; Malfurion sleeps in the Dream; the tree is young and unblessed.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Priestess Alathea: the Temple's senior priest trainer; trains human priests too and sends them to Laurena.
P:NPC {
  key = "alathea", id = TODO_NPC("Priestess Alathea"), name = "Priestess Alathea",
  title = "Priest Trainer",
  bible = "bibles/temple.md", role = "trainer", tier = "major",
  communities = { "darnassus" }, temper = { "calm", "formal" }, values = { "devout", "wise", "loyal" },
  notices = { "class", "race", "arcane" },

  impression = {
    first = "Priestess Alathea praised Elune and the Light in the same breath, and meant both. She is gracious until arcane magic comes up, and then something old and wary looks out of her eyes.",
    third = "{name} met Priestess Alathea, who trains the priests of the Temple of the Moon, and some of the Light's as well.",
  },

  greetings = {
    { id = "g_elune", text = "Elune be with you. The Temple is quiet at this hour, so speak softly and you'll be heard." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Welcome back to the Temple, young priest. Sit, if you have time; the lessons keep." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and I'm glad of it. The moon notices who comes back to her." },
    { id = "g_away", when = { away = 14 }, text = "You have been away {away}, and the Temple kept its quiet in your absence. Sit a while, and let it settle you again." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown much since your last lesson here, and I can see the road in how you carry yourself. Elune has watched over you, it seems, and so has your own resolve." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear harsh words have passed between you and one of our people. Anger is a poor companion in the Temple, so leave it at the door if you can." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the city has spoken kindly of you, and such words travel softly but far among the branches. Elune smiles on gentleness." },
  },

  notice = {
    { id = "n_priest_human", cat = "class", when = { class = "PRIEST", race = "Human" },
      text = "A priest of Stormwind's Cathedral, under our roof. Laurena sends me her students now and then, and they always look up at the open sky before they look at me." },
    { id = "n_human", cat = "race", when = { race = "Human", ["not"] = { class = "PRIEST" } },
      text = "Humans come to the Temple to look at the moonlight on the water, mostly. You're welcome to look; just don't throw coins in the pool, because it isn't that kind of pool." },
    { id = "n_shadow", cat = "class", when = { form = "shadow" },
      text = "You come into Elune's house wrapped in shadow. I know your Church teaches it, and I won't send you out, but I'd ask you to set it aside while you're under this roof." },
    { id = "n_nelf_priest", cat = "class", when = { class = "PRIEST", race = "NightElf" },
      text = "Sister, brother, whichever the moon made you, you've been out in the world, and it shows in how you stand. Come and tell me what you've seen." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You've brought the arcane in on your sleeves; it smells like old candle smoke. I'll answer your questions, mage, but I will keep my hands folded while I do." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "They trouble every priestess who remembers the Well. Their children in Quel'Thalas wield the same magic, the humans built Dalaran upon it, and none of them seem to have learned a thing. Tell me, what do you think of the arcane?" },
      },
      choices = {
        { text = "It's a tool, Priestess, and the Kirin Tor keep it in hand.", next = "op_r1", fx = { affinity = -1, align = { order = 1 }, opinion = { arcane_magic = "useful", kirin_tor = "trust" } } },
        { text = "It's a hunger, and the high elves never stopped feeding it.", next = "op_r2", fx = { affinity = 1, trait = { cautious = 1 }, opinion = { arcane_magic = "dangerous", high_elves = "distrust" } } },
        { text = "Every tome should burn, and Dalaran's towers with them.", next = "op_r3", fx = { affinity = -1, align = { order = -1 }, trait = { stern = 1 }, opinion = { arcane_magic = "hate" } } },
        { text = "I study it, Priestess, and I know its price.", next = "op_r4", fx = { align = { order = 1 }, opinion = { arcane_magic = "respect" } }, when = { class = "MAGE" } },
        { text = "I'll leave magic to the magi.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "So the Highborne told us in Zin-Azshari, the night before the sky opened. I pray your Kirin Tor have steadier hands than Azshara's court had." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "You speak like a priestess of the old Temple. Be careful saying it near the dwarves, because they've grown fond of their gnome friends and their Dalaran mages." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Burning is the Legion's answer to everything, {class}. I distrust the arcane, but I will not set a torch to Dalaran's students for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then you know more than Azshara ever did. Pay that price yourself, and never let anyone else pay it for you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I trust any who heal. Only arcane magic troubles me; spirits are a gentler thing, I hope." } },
      choices = {
        { text = "The spirits are gentle, Alathea. I will prove it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Trust whom you like. I need no approval.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every night, and most of all for those who stand on the line in Ashenvale. We cannot hold a shield for you, but we send healers with the Sentinels, and many a warrior has come home because a priestess stood behind them." } },
      choices = {
        { text = "Then I'll guard your healers with my life.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'd rather trust my shield than a prayer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "She lights the night so that hunter and hunted can both see, and I think that is her answer. Take what you need with a clean shot and a grateful heart, and the goddess will not mind." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is welcome under the Temple's roof, so long as it keeps its paws out of the fountain. Elune loves her creatures, though the Sisters love their floors." },
      },
      choices = {
        { text = "A clean shot, and thanks after. Always.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt to eat, not to pray.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "She is the moon, and the moon is what lights the dark without driving it away. Our Sentinels walk at night in her name, so I have never thought the shadows themselves were wicked, only some of what hides in them." },
      },
      choices = {
        { text = "Then I'll be one of the shadows she smiles on.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Wicked or not, the shadows keep me alive.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_a = {
      lines = {
        { id = "mga_default", text = "A place to sit, certainly, and a place to pray if you want one. But don't ask me to teach you anything while your hands still smell of the Well, because the last of my people who mixed the two are at the bottom of the sea." },
        { id = "mga_gnome", when = { race = "Gnome", class = "MAGE" },
          text = "I've heard your people's magic is mostly sums and sparks, and I'd like to believe that's all it is. Sit, then, and don't count anything while you're here." },
      },
      choices = {
        { text = "The arcane can heal, too, Priestess.", next = "mage_a2" },
        { text = "I'll pray, then, and leave the spells outside.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    mage_a2 = {
      lines = {
        { id = "mga2_default", text = "It can mend a thing, yes, the way a smith mends a sword. It has never once asked the sword's permission, though, and Elune always asks; that's the difference, and it's all of the difference." },
      },
      choices = {
        { text = "Power doesn't need permission.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Asking first is wiser. I'll remember.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    warlock_a = {
      big = true,
      lines = {
        { id = "wa_default", text = "Very well: you carry the same fire that burned Zin-Azshari, and you carry it into a temple built by those who survived it. I will not send you out, because Elune turns no one from her door, but I will stand a little nearer to it while you are here." },
      },
      choices = {
        { text = "I bind it so it can't bind anyone else.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Comfort isn't what I came for, Priestess.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Could Elune ever forgive one like me?", next = "warlock_a2" },
      },
    },
    warlock_a2 = {
      lines = {
        { id = "wa2_default", text = "Sister Astarii would tell you yes, without even stopping to think, and she has better reason to know than I do. Ask her about the golden tablet some night, and watch how she holds it." },
      },
      choices = { { text = "I'll ask her. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    paladin_a = {
      lines = {
        { id = "pa_default", text = "So I've seen; Stormwind's paladins pray with a hammer in hand, and the Sisterhood understands that better than they might expect. Our priestesses stood at Hyjal with bows and the moon behind them, and nobody called it a contradiction." },
      },
      choices = {
        { text = "Then the Light and Elune fight on the same side.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What was it like, at Hyjal?", next = "tyrande" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We do, for we both remember the Well of Eternity and what the Highborne's hunger cost us. Malfurion taught your Circle to draw on the living world instead, and that is why I trust a druid's power where I never would a mage's." } },
      choices = {
        { text = "The arcane should stay forbidden to our people, as Malfurion wished.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of magic is old, Priestess, and it shouldn't rule us forever.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Alathea, a priestess of Elune, and I teach those who would heal in her name. Praise be to Elune, and to whatever light you carry, {class}." },
        { id = "h_prayer", tags = { "news" }, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "About this time in a priest's training, my sisters learn gifts that belong to Elune alone. I believe your order is the same, so when your business here is finished, go home to High Priestess Laurena in Stormwind." },
        { id = "h_fear", tags = { "news" }, when = { questActive = TODO_QUEST("A Lack of Fear") },
          text = "Your High Priest Rohan wants you in Ironforge, and I'd not keep a dwarf from his own rites. I wish I could see them, but my place is here, so go with your Light." },
        { id = "h_grace", tags = { "news" }, when = { questActive = TODO_QUEST("Elune's Grace") },
          text = "You've given yourself to Elune and to our people, and she has noticed. Not every one of us reaches that place, and those who do are taught a little more of her grace." },
        { id = "h_stars", tags = { "news" }, when = { questActive = TODO_QUEST("Stars of Elune") },
          text = "You've earned Elune's attention, and that is not a small thing. When you're ready, I'll teach you to call down her stars, as the priestesses of old did against the Legion." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The moon's up, and the Temple is at its best. The water holds her light long after the clouds cover her; stand by the pool a while before you go." },
        { id = "h_human_priest", when = { class = "PRIEST", race = "Human" },
          text = "Laurena's students all pray with their eyes shut, I've noticed, and I expect you do too. We pray with ours open, toward the moon, and neither of us has been struck down for it yet." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Elune shines on the shadows as well as the open ground, rogue, so you needn't stand at the edge of the room like that." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you bear yourself well. Elune keep you, for you will meet the blows the rest of us only hear about." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter of the woods, walking under Elune's own light. Praise be to her, {class}, and to every beast you spare." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Praise Elune, a druid in her Temple. The Circle and the Sisterhood have kept faith beside each other since Malfurion first went into the Dream, and you are as welcome here as any of my priestesses." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Elune and the Light both bless the faithful, and though your spirits are less known to me, I have lived long enough not to condemn what I don't understand." },
        { id = "h_novice", when = { origin = "nightelf_priestess" }, text = "One of our own novices, home from the road. I remember the night Elune's light first found you, child, because you were so startled you dropped the water jug in the moonwell, and the elder sisters have never let me forget it." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I have time; the moon is patient, and so am I." },
        { id = "h_again2", text = "Go on. Elune has heard stranger questions than yours, mostly from children." },
        { id = "h_again3", when = { class = "PRIEST" }, text = "Ask, young priest. A teacher who tires of questions should stop teaching." },
      },
      choices = {
        { text = "Do the Highborne still trouble the Sisterhood?", next = "op_ask" },
        { text = "I'm ready for my training.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why would you teach a priest of the Light?", next = "light", when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "What gifts does Elune give her own priests?", next = "gifts", when = { class = "PRIEST", race = "NightElf" } },
        { text = "The Sisterhood must teach more than prayer.", next = "sisterhood" },
        { text = "Elune found me young, Priestess. Why is she so silent now?", next = "xsilence", when = { origin = "nightelf_priestess" } },
        { text = "You don't trust arcane magic, do you?", next = "arcane" },
        { text = "The High Priestess must carry a heavy load.", next = "tyrande" },
        { text = "Is there a place for a mage in Elune's house?", next = "mage_a", when = { class = "MAGE" } },
        { text = "You've noticed what I carry. Say it.", next = "warlock_a", when = { class = "WARLOCK" } },
        { text = "The Light makes a soldier of me, Priestess.", next = "paladin_a", when = { class = "PALADIN" } },
        { text = "Does Elune really look kindly on the shadows?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the priestesses pray for warriors, Alathea?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does Elune smile on the hunt, Priestess?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do druids and priestesses guard against the same old danger, Priestess?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you trust shamans as you trust priests, Alathea?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Elune be with you, Priestess.", next = "END" },
      },
    },

    xsilence = {
      big = true,
      lines = {
        { id = "xsi_default", text = "Because she isn't silent, child, only quiet, and the two sound alike for the first few centuries. Her light found you before you knew how to ask for it, so now she waits to hear what you'll ask for when you do know. Tell me, when she says nothing, what do you do?" },
      },
      choices = {
        { text = "I keep praying. Her quiet is an answer of its own.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "I act on my own judgment and trust she'd approve.", next = "BACK", fx = { affinity = -1, align = { light = -1 }, trait = { ambitious = 1 } } },
        { text = "Did she ever speak plainly to you, Priestess?", next = "xsilence_you" },
      },
    },
    xsilence_you = {
      lines = {
        { id = "xsy_default", text = "Once, on the road from Ashenvale with a dying Sentinel in my arms, and all she said was that I should keep walking. I've wondered for a long age whether I imagined it, and I've decided it doesn't matter, because I kept walking and the Sentinel lived." },
      },
      choices = {
        { text = "Then I'll keep walking too.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },

    light = {
      big = true,
      lines = {
        { id = "l_default", text = "Because your race and mine are allies, and because a wound doesn't care who closes it. Laurena and I write to each other, and we've agreed that the sick should never have to choose between us." },
        { id = "l_human", when = { race = "Human" },
          text = "Because Laurena asked me to, and because I've watched her students heal Sentinels on the road to Astranaar. A priest who heals my people is welcome in my Temple, whatever she prays to." },
      },
      choices = {
        { text = "Is the Light the same as Elune's light?", next = "light_same" },
        { text = "Then the Light and Elune serve the same good.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Faith is a tool, Priestess. I use what works.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_same = {
      lines = {
        { id = "ls_default", text = "I don't know, and I distrust anyone who says they do. I've seen both heal the same wounds and both comfort the dying, and for now that's as far as I'll walk out on that branch." },
      },
      choices = {
        { text = "Your priests must pray differently, then.", next = "light_pray" },
        { text = "Some questions should stay open.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "The Church would want a firmer answer than that.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    light_pray = {
      lines = {
        { id = "lp_default", text = "At night, with our eyes on the moon, and mostly we listen rather than ask. Your Church kneels and speaks; we stand and wait. I've tried it your way, once, and my knees forgave me eventually." },
      },
      choices = {
        { text = "I'll try it your way tonight.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll keep to my Church's way.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },

    gifts = {
      big = true,
      lines = {
        { id = "gi_default", text = "Her grace, which turns aside the blows meant for you, and her stars, which the priestesses called down on the Legion ten thousand years ago. Neither is given to the merely clever; she gives them to the devoted." },
        { id = "gi_done", when = { questDone = TODO_QUEST("Stars of Elune") },
          text = "You carry her stars now. Use them as the old priestesses did, against what really threatens the forest, and never to settle a quarrel." },
      },
      choices = {
        { text = "What did the old priestesses face?", next = "gifts_old" },
        { text = "I'll use them only in her service.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "A weapon is a weapon, whoever gives it.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    gifts_old = {
      lines = {
        { id = "go_default", text = "Demons, and the Highborne who welcomed them. The Sisterhood held the line beside the Sentinels when the sky burned, and we've kept the bow and the prayer together ever since." },
      },
      choices = { { text = "Something else, Priestess.", next = "BACK", fx = { learn = { "highborne" } } } },
    },

    sisterhood = {
      lines = {
        { id = "si_default", text = "To heal, to pray, and to stand guard, all three. Visitors expect the first two from a temple and are startled by the archery. We've watched over our people since before the Sundering, and we've learned to be ready." },
      },
      again = { { id = "si_again", text = "You want more of the Sisterhood? There is always more to tell." } },
      choices = {
        { text = "What troubles the young priestesses?", next = "young" },
        { text = "Healing should come before the bow.", next = "BACK", fx = { align = { order = 1 }, trait = { kind = 1 }, learn = { "sisterhood_of_elune" } } },
        { text = "A temple that can fight is wiser than one that can't.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 }, learn = { "sisterhood_of_elune" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = {
        { id = "yo_default", text = "The same things that trouble the young everywhere, and one thing that is new. They're learning their trade in a city that is still growing, on a tree that is still settling, and they ask me when it will all feel like home." },
      },
      choices = {
        { text = "They're afraid of dying, aren't they?", tag = "Persuade", next = "mortal",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "kind" } } } },
          fail = { next = "mortal_no", fx = { affinity = -1 } } },
        { text = "Home is the people, not the tree.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Home is what you build and defend.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    mortal = {
      big = true,
      lines = {
        { id = "mo_default", text = "Yes. We gave up our immortality when Nordrassil was spent, and the young ones have never known an old age to compare it to. They come to me at night and ask what happens after, and I have only prayers to give them." },
      },
      choices = {
        { text = "How do you answer them?", next = "mortal_answer" },
        { text = "The Light teaches there's peace after. Tell them that.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 }, when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "Then they should live as if every day counts.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Fear keeps people alive. Let them keep a little.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    mortal_answer = {
      lines = {
        { id = "ma_default", text = "I tell them that A'moora names the lost by the pool every night, and that Elune hears every name. Some nights that is enough for them, and some nights it is not enough for me, though I'd thank you not to repeat that to the High Priestess." },
      },
      choices = { { text = "It stays with me.", next = "BACK", fx = { affinity = 3, trait = { discreet = 1 } } } },
    },
    mortal_no = {
      lines = {
        { id = "mn_default", text = "The young priestesses' fears are theirs to tell, not mine. They're doing well, and that is all I'll say about them to a stranger." },
      },
      choices = { { text = "Of course. Forgive me.", next = "BACK" } },
    },

    arcane = {
      big = true,
      lines = {
        { id = "ar_default", text = "No, I don't, and I'll not pretend otherwise to be polite. The Highborne's magic called the Burning Legion into the world once, and I don't care whether the next one who reaches for that power calls it scholarship or calls it holy." },
        { id = "ar_mage", when = { class = "MAGE" },
          text = "You ask me that with frost still on your sleeves. No, I don't, mage, but your people and mine are allies, and I'll not betray that over my own unease." },
      },
      choices = {
        { text = "Even arcane that serves a god?", next = "arcane_divine" },
        { text = "You're right. That power should be left alone.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, learn = { "highborne" } } },
        { text = "Power isn't evil. People are.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arcane_divine = {
      lines = {
        { id = "ad_default", text = "Be it divine-inspired or not, magic that pulls on the world's threads makes me uneasy. Your Church would tell you some of its own wonders lean that way; ask Laurena about it when you're home, and watch her face." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'd rather not stir up the Cathedral.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    tyrande = {
      lines = {
        { id = "ty_default", text = "She carries the whole of our people while the Arch Druid carries the tree, and Malfurion sleeps in the Emerald Dream. She hears the Sentinels' reports at moonrise and prays after, and I've never once seen her hurry the prayer." },
      },
      choices = {
        { text = "I hope Malfurion wakes one day.", next = "tyrande_dream" },
        { text = "She should lean on the Arch Druid more.", next = "BACK", fx = { align = { order = 1 }, learn = { "malfurion" } } },
        { text = "She shouldn't wait on anyone, druid or not.", next = "BACK", fx = { align = { order = -1 }, learn = { "malfurion" } } },
      },
    },
    tyrande_dream = {
      lines = {
        { id = "td_default", text = "We pray that he will, and the High Priestess believes it, so I believe it. The druids say the Dream keeps its own hours. I'm a priestess, so I keep the moon's, and wait." },
      },
      choices = {
        { text = "I'll add him to my prayers.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayers won't wake him. Someone should go after him.", next = "BACK", fx = { align = { light = -1 }, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A teacher in this Temple hears much from the young priests who pass through it. Ask, and I'll tell you what I can in good conscience." } },
    background = { { id = "tp_bg", text = "I teach Elune's priests, and some of the Light's, when Laurena sends them. Mostly it means teaching young priests not to fidget through the long hymns." } },
    advice = { { id = "tp_ad", text = "Heal the one in front of you before you worry about the one across the sea. Prayer can wait a breath; bleeding can't." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "We've healed and guarded our people since before the Sundering. Ask me about it properly and I'll tell you more.", next = "sisterhood" } },
    highborne = { { id = "tp_highborne", text = "They reached for power and called the Legion down on us. That is why I keep my hands folded around the arcane.", next = "arcane" } },
    malfurion = { { id = "tp_malfurion", text = "He sleeps in the Emerald Dream, and the High Priestess waits for him. So do we all, in our way." } },
    holy_light = {
      { id = "tp_holy_light", text = "The humans' Light and our Elune heal the same wounds, and I've taught enough of Laurena's priests to know their hearts are good. Their hymns are shorter, too, which the young ones appreciate." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You serve the Light and you've come to learn among Elune's priests, which pleases me. Pray how you like here, because the Temple has room for both." },
    },
    elune = { { id = "tp_elune", text = "Elune is patient, and she asks her priests to be patient too, which is the hardest thing I teach. The healing comes easily by comparison." } },
    forsaken = { { id = "tp_forsaken", text = "The humans' dead who walk in the north, and some claim to have freed themselves. I pray for them, though I don't think they'd thank me." } },
    scourge = { { id = "tp_scourge", text = "I've read the reports from the human lands, of whole towns rising as the dead. If there's one thing our priests are for, it's that." } },
    _none = { { id = "tp_none", text = "That is outside what a priestess of the Temple can speak to. The Sentinels or the Enclave might know more." } },
  },
}

-- Astarii Starseeker: priest trainer; receives Zamael Lunthistle's golden prayer from the Searing Gorge.
P:NPC {
  key = "astarii", id = TODO_NPC("Astarii Starseeker"), name = "Astarii Starseeker",
  title = "Priest Trainer",
  bible = "bibles/temple.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "gentle", "earnest" }, values = { "devout", "kind" },
  notices = { "class", "light", "origin" },

  impression = {
    first = "Astarii Starseeker believes no soul is too far gone for Elune to hear, not even one that served the Twilight's Hammer. She says it gently, and she plainly means it.",
    third = "{name} met Astarii Starseeker, a priestess of the Temple of the Moon who believes in second chances.",
  },

  greetings = {
    { id = "g_elune", text = "Elune be with you, {class}. Come in out of the wind." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. I hoped you would; the Temple likes familiar faces." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
      text = "Another priest! Whatever we each pray to, we both get called out of bed at the same hours, and I think that makes us family of a sort." },
    { id = "n_novice", cat = "origin", when = { origin = "nightelf_priestess" },
      text = "A novice of the Temple, back from the world. You've got the look we all get in the first years, as if you're listening for something just past the edge of hearing, and I'll tell you a secret: it doesn't go away, but you stop minding it." },
    { id = "n_human", cat = "light", when = { race = "Human", class = { "PALADIN", "PRIEST" } },
      text = "Your Light burns like a lantern, the way your people's does. Ours is more like moonlight on water, but I've seen both find the way home." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I do, with all my heart. Even those who served darkness. A shaman is far from darkness." } },
      choices = {
        { text = "Then I share your hope, Astarii. Every soul matters.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some souls are beyond saving.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because most of those who come to me at night aren't wounded in any way a prayer can mend. They want to be heard, and once they've been heard, Elune or your Light can do the rest far more easily." } },
      choices = {
        { text = "Then I'll learn to listen before I pray.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A healer's work is the body, and the rest is for friends.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mostly the faces of those they couldn't save, and sometimes the faces of those they killed, which troubles them more than they expect. I'd guess you carry a few of each, and you may set them down here if you need to." } },
      choices = {
        { text = "Every soldier needs mercy, even toward themselves.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are behind me, and I don't look back at them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Often, though they always start by saying they're only passing. Holding the line means seeing what breaks it, and Elune can hear about that as well as anything else, so if you ever want to tell me, I'll listen." } },
      choices = {
        { text = "Maybe someday. It helps to say it aloud.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What happens on the field stays there.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Sometimes, usually about a beast they couldn't save or one they had to put down. That kind of grief is real, and Elune doesn't weigh it any less because it was for an animal." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the look of a companion that's been through a few things with you. Be kind to each other; that's all I'd ask of either of you." },
      },
      choices = {
        { text = "I grieve every companion I've lost.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Beasts die. I don't dwell on it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "We hear whatever anyone needs to say, and Elune doesn't ask for your trade before she listens. I doubt I'd approve of everything you've done, but I would rather you said it here than carried it into Ashenvale alone." },
      },
      choices = {
        { text = "Then I'll speak, and try to do better.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some things I carry. That's how I prefer it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because our ancestors went from wonder to hunger without noticing the step between, and the Well of Eternity swallowed a whole kingdom for it. I don't think every mage is Azshara, but I'd like you to notice the step, if you ever come to it." },
      },
      choices = {
        { text = "I'll watch for the step. Thank you, Priestess.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hunger is how anyone learns anything worth knowing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock_s = {
      big = true,
      lines = {
        { id = "ws_default", text = "She heard a man who served the Twilight's Hammer, and he'd done worse than summon an imp, I promise you. Whether you want her to listen is the harder question, and only you can answer it." },
      },
      choices = {
        { text = "I want to be heard. Even like this.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "I don't need a goddess. I have my pact.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I do, because they never chose the corruption that took them, and Elune does not turn away from the lost. Athridas in Dolanaar believes it too, and I would rather stand beside him than beside those who only count the dead." } },
      choices = {
        { text = "Then I'll spare any Gnarlpine I can, and help seek a cure.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A maddened furbolg kills just the same, so I'll do what's needed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I do more listening than teaching, as you'll learn, and I think it's the most important thing a priest ever does." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The Sentinels bring me their worries after a battle, and I suspect paladins carry theirs a good deal longer." },
        { id = "h_default", text = "I am Astarii, one of the priestesses who teach here. Most of what I do is listen, and I'm told that after all these centuries I am better at it than at lecturing." },
        { id = "h_prayer", tags = { "news" }, when = { questActive = TODO_QUEST("Prayer to Elune") },
          text = "What brings you to the Temple? Is that gold, under all that soot? Let me see it, gently, because I think I know whose hand wrote this." },
        { id = "h_prayer_done", when = { questDone = TODO_QUEST("Prayer to Elune") },
          text = "Elune smiled on you that night, and I think she still does. You brought a lost soul back to her, and I don't say that lightly." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Most of the city is asleep, and the Temple is at its busiest. The ones who can't sleep come here, and I'm one of them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You can sit down, rogue. I listen better than I lecture, and you look like someone who has things they don't say." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, and you look tired in a way spells don't fix. Sit for a while, if you like; the Temple is quiet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You look like someone who's carried a few things home from the field that weren't wounds." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and a quiet one. I like hunters, because they listen nearly as well as I do." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, welcome. The Circle teaches that a forest can grow back after any fire, and I've always thought souls are much the same." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and welcome. No soul is too far for Elune to hear, and that includes those who speak with spirits." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm in no hurry tonight." },
        { id = "h_again2", text = "Go on; I'm listening, and the moon is listening with me." },
      },
      choices = {
        { text = "Train me, please.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is this golden tablet?", next = "tablet", when = { any = { { questActive = TODO_QUEST("Prayer to Elune") }, { questDone = TODO_QUEST("Prayer to Elune") } } } },
        { text = "Surely some deeds can't be forgiven.", next = "forgive" },
        { text = "What do the people who can't sleep tell you?", next = "listen" },
        { text = "Could Elune hear a warlock, Priestess?", next = "warlock_s", when = { class = "WARLOCK" } },
        { text = "Do priestesses hear confessions from rogues?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why do priestesses distrust the arcane so deeply?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warriors come to you to talk, Astarii?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters bring their troubles to you as well?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why is listening the most important thing a priest does?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the Sentinels bring you after a battle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think the Gnarlpine can still be saved, Astarii?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you believe all souls can be redeemed, Astarii?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good night, Priestess.", next = "END" },
      },
    },
    tablet = {
      lines = {
        { id = "ta_default", text = "A prayer, etched in pure gold by a night elf named Zamael Lunthistle. He followed the Twilight's Hammer for years, until Elune sent him a vision, and he spent the rest of his life writing his sorrow into this." },
      },
      choices = {
        { text = "What happened to him?", next = "tablet2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    tablet2 = {
      lines = {
        { id = "t2_default", text = "The cult found the tablet, called him a blasphemer and killed him, and his spirit is still caged in the Searing Gorge as a warning to the others. The prayer will be read here, in the Temple, and Elune will hear it whether he expects her to or not." },
      },
      choices = {
        { text = "He earned that cage.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "His repentance should count for something.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Can a prayer free a spirit?", next = "tablet3" },
      },
    },
    tablet3 = {
      lines = {
        { id = "t3_default", text = "I don't know, and I won't promise you it can. What I know is that a prayer heard is better than a prayer lost in a cultist's pack, and that I'll read it aloud by the pool tonight." },
      },
      choices = { { text = "Read it for him. Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    forgive = {
      big = true,
      lines = {
        { id = "fo_default", text = "I believe Elune hears anyone who turns back toward her, however far they've wandered. Some of my sisters think I'm soft for it, and perhaps I am, but I've never regretted being soft." },
      },
      choices = {
        { text = "Mercy should be earned, not given.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Mercy freely given is the only kind that heals.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "I'd guess someone thinks you're soft.", next = "forgive2" },
      },
    },
    forgive2 = {
      lines = {
        { id = "f2_default", text = "The Sentinels, mostly, and they have their reasons, since they bury the ones the Horde kills in Ashenvale. I pray for them too, and they pretend not to notice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    listen = {
      lines = {
        { id = "li_default", text = "They tell me about the boats, and about the war in Ashenvale, and how the branches creak in the wind. More than one has told me the tree doesn't feel finished yet, and I tell them neither are we." },
      },
      choices = {
        { text = "That's a kind answer.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "They'd sleep better with plain facts.", next = "BACK", fx = { align = { order = 1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "People tell a priestess things at night that they'd never say by day. Ask what you like, and I'll share what isn't a confidence." } },
    background = { { id = "tp_bg", text = "I teach, and I listen, and on the bad nights I sit with whoever is awake. It's a good life." } },
    advice = { { id = "tp_ad", text = "Don't carry what you can set down. Elune can hold it while you sleep." } },
    twilights_hammer = { { id = "tp_twilight", text = "A cult that worships something older and worse than demons. One of them found his way back to Elune, which gives me hope for the rest, a little." } },
    elune = { { id = "tp_elune", text = "Elune shines on the night, and the night is when most people are lonely, which I don't think is a coincidence. She keeps company with whoever's awake." } },
    blackfathom = { { id = "tp_blackfathom", text = "The Twilight's Hammer worship in the old temple at Blackfathom now, and it was Elune's temple once. I've prayed for it to be cleansed for longer than I like to say." } },
    scourge = { { id = "tp_scourge", text = "We hear of the plague from human pilgrims, and some of them have lost everyone. I sit with them, and it helps a little, and I suppose that's all it can do." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids talk of the Dream as the world unspoiled, and I envy them a little. Then I remember they have to come back, and I don't envy them so much." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Alathea might; she's been teaching longer than I have." } },
  },
}

-- Jandria: priest trainer in the Temple; little canon beyond her post. Kept modest.
P:NPC {
  key = "jandria", id = TODO_NPC("Jandria"), name = "Jandria",
  title = "Priest Trainer",
  bible = "bibles/temple.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "class" },

  impression = {
    first = "Jandria treats prayer as a craft to be practised, like archery or bandaging. She has little patience for grand speeches and a great deal for anyone willing to work.",
    third = "{name} met Jandria, a no-nonsense priest trainer of the Temple of the Moon.",
  },

  greetings = {
    { id = "g_short", text = "Elune be with you. If you're here to learn, let's begin; if not, the pool is that way." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Back for more training? Good, because your hands are steadier than last time, I think." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = { "Human", "Dwarf", "Gnome" } },
      text = "One of the Light's own, here for lessons. Alathea's the one for the long talks; I'm the one for the practice, so roll up your sleeves." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everything answers practice. I have little patience for grand speeches, but I respect hard work. Show me yours." } },
      choices = {
        { text = "I will practise honestly, Jandria.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some things answer instinct, not practice.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A Sentinel with an orc arrow in her side who refused to stop running until the fight was done, so I healed her at a sprint. Prayer is all very well in the Temple, but out there you heal whoever is in front of you, whatever they're doing." } },
      choices = {
        { text = "Then I'll heal whoever's in front of me, whatever comes.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd let the stubborn ones bleed until they stop running.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Healing yourself when the person beside you needs it more, and fighting when you should be healing, which paladins do more than anyone. Decide before the fight which one you are, and you'll last longer." } },
      choices = {
        { text = "The person beside me comes first, and I'll remember it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I keep myself standing first, so that I can help.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Stay where they can see you, and don't charge three trees ahead and then wonder why the healing never reached you. The Sentinels learned that lesson in Ashenvale with their own blood, and it costs nothing to learn it here." } },
      choices = {
        { text = "I'll stay in sight and hold my ground.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I wait for the healer, the fight's already lost.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They will, though most forget to try until the hunter shouts. I tell my students to watch your beast as closely as they watch you, because a hunter whose companion falls usually follows it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a fighter, I can see that much. Keep it where the healer can see it and tell them its name, because people heal what they've been introduced to." },
      },
      choices = {
        { text = "I'll watch my companion's back as it watches mine.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My companion can take care of itself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Don't spend your last spell on the last enemy, because there's always one more coming up the road from the Barrens. A Sentinel who can't move keeps fighting with her bow, and you should keep something back in the same way." },
      },
      choices = {
        { text = "I'll hold something back. That's sensible.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hold back, and you lose the fight early.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I think you've chosen a hurt and called it a tool, and that's the hardest sort to heal because you won't let anyone near it. If you ever want to set it down, come back here, and I'll help however I can." },
      },
      choices = {
        { text = "Maybe one day. Thank you for the offer.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I don't need mending. My power works fine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Mind your mana before you change shape, because every shift costs you, and a bear with nothing left can't become a healer again in time. I've watched druids win the fight and lose the Sentinel beside them that way." } },
      choices = {
        { text = "I'll heal first and fight second, whatever the fight looks like.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ending a fight quickly saves more lives than any healing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That bandages are slow and a priest is rarely close by when you need one, so learn first aid properly and carry more linen than you think. I've patched up Sentinel scouts who thought they could walk off a Warsong axe, and not one of them managed it." },
      },
      choices = {
        { text = "I'll learn it properly. Thank you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't plan on getting hit, Priestess.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, because I can always use another pair of hands that knows how to heal someone who won't stop moving." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You heal and fight both, which means you'll make every mistake my students make, only in heavier armor." },
        { id = "h_default", text = "I am Jandria, and I teach the practical side of things here: how to keep your mana when the fight runs long, and how to heal a Sentinel who won't stop moving." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night is when the wounded come up from the portal, so I keep my hands busy and my lessons short." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Mana's a practical matter, mage, and you burn through it faster than any priest I train. Want some advice for the long fights?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock in the Temple. I teach healing, not banishing, but I've read enough to know what that is at your heel." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, you're the one who'll be bleeding while my students learn to work quickly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, so you'll be the one at the back, which suits me, because my students can reach you easily." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Good, you heal too, so you know what it's like to keep a Sentinel standing while she's still running at the enemy." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. You'll be the one bleeding behind some Warsong camp one day, so listen while I tell you how to stop it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Prayer is a craft, like archery or bandaging, and my sisters have practiced it since before the Well was lost, so tell me, do your spirits require practice too?" },
      },
      again = { { id = "h_again", text = "Something more? Be quick about it, because a student of mine is kneeling by the pool and pretending not to listen." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What's the hardest thing to teach?", next = "hard" },
        { text = "You must heal a great many here.", next = "wounded" },
        { text = "What advice would a priestess give a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What should a warrior know about fighting beside a healer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Will your priestesses heal a hunter's companion too?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you think I'm beyond healing, Priestess?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What's the hardest healing you've done in the field?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Which mistakes do you mean, Jandria?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Any advice for a druid who heals in the thick of it?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What should a rogue know about healing, Priestess?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the spirits answer practice, Jandria?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    hard = {
      lines = {
        { id = "ha_default", text = "Patience. The young ones want to throw every prayer they know at the first scratch, and then they've nothing left when the real wound comes." },
      },
      choices = {
        { text = "Better to heal early than too late.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Discipline first, then mercy.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "How do you teach patience?", next = "hard2" },
      },
    },
    hard2 = {
      lines = {
        { id = "h2_default", text = "I make them sit with a wounded hunter's cat until it lets them near. Nothing teaches patience like a nightsaber that doesn't want a bandage." },
      },
      choices = { { text = "That sounds dangerous. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    wounded = {
      lines = {
        { id = "wo_default", text = "Sentinels back from Ashenvale, and more of them than I'd like. The Warsong cut the forest and our sisters bleed for it, so the Temple stays open all night." },
      },
      choices = {
        { text = "The Horde should answer for that.", next = "BACK", fx = { align = { honor = 1 }, learn = { "warsong" } } },
        { text = "Every war has two sets of wounded.", next = "BACK", fx = { align = { honor = -1 }, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear what the wounded say while I'm patching them up. Ask, and be quick about it." } },
    background = { { id = "tp_bg", text = "I teach priests to heal without wasting themselves. That's all there is to me, and it's enough." } },
    advice = { { id = "tp_ad", text = "Save your strongest prayer for the wound that needs it. You'll know it when you see it." } },
    warsong = { { id = "tp_warsong", text = "Orcs with axes in Ashenvale, cutting down a forest older than their whole history. I mend what they leave behind." } },
    holy_light = { { id = "tp_holy_light", text = "Light, Elune, whatever we call it, the wound still closes. I teach my students to spend it carefully whichever name they use." } },
    scourge = { { id = "tp_scourge", text = "The plague does things to the body that healing struggles to undo, from what the human priests write. I would study it gladly, from letters, and pray it never crosses the sea to us." } },
    thrall = { { id = "tp_thrall", text = "The orcs' warchief seems a better sort than the warlords before him, by most accounts. I still have to heal what his Warsong do to our Sentinels." } },
    centaur = { { id = "tp_centaur", text = "I've stitched centaur arrows out of Sentinels coming back from the south. They use barbed heads, made to tear on the way out, and that says enough about them." } },
    _none = { { id = "tp_none", text = "Not my concern, I'm afraid. Ask Alathea, for she likes questions and has had a long time to collect answers." } },
  },
}

-- Lariia: priest trainer in the Temple; quiet and observant. Kept modest.
P:NPC {
  key = "lariia", id = TODO_NPC("Lariia"), name = "Lariia",
  title = "Priest Trainer",
  bible = "bibles/temple.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "gentle", "watchful" }, values = { "devout", "careful" },
  notices = { "class", "weary" },

  impression = {
    first = "Lariia notices everything and says about half of it. She told me the Temple's pool shows the moon even on cloudy nights, and I still don't know whether she was teasing.",
    third = "{name} met Lariia, a quiet priest trainer who keeps watch over the Temple of the Moon's pool.",
  },

  greetings = {
    { id = "g_quiet", text = "Elune be with you. The pool is very still tonight; I'd keep it that way." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ready to learn something new? I can see you've been using what I taught you." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your armor has seen hard roads, and you're carrying them in your shoulders. Sit by the water before you do anything else." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Human" },
      text = "A priest from Stormwind, and you've come all this way to learn from us. That pleases me more than I'd like to admit." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It always does, though some say I tease. Perhaps your spirits can tell whether it is true." } },
      choices = {
        { text = "I believe you, Lariia. Faith sees clearly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It is a trick of the light.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When the night is troubled the light on the water trembles, even with no wind, and I've learned to send word to Ashenvale when I see it. I won't say Elune speaks through it, but I won't say she doesn't, either." } },
      choices = {
        { text = "Signs like that should be heeded, so I'll watch with you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Light on water trembles, and I wouldn't read more into it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only a little, and I don't mind, because moonlight on steel tells me something too. It tells me there's someone on the Terrace tonight who would stand against whatever troubles the night, which is more than the water can do." } },
      choices = {
        { text = "I'll stand against it, whatever it is.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm only passing through, so don't count on me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It tells me when the clouds come in from Darkshore and when the Sentinels ride out, and few in this city bother to notice either. Whether it tells me about a fight I'll leave you to decide, warrior, because you'd only laugh if I said yes." } },
      choices = {
        { text = "I'll trust your pool. Signs are worth heeding.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I trust what I can see with my own eyes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The owls, mostly, because they hunt by the same light I study and they never miss a change in it. When the owls go quiet over the Temple, something is moving in the dark, and that is a hunter's errand, not a priestess's." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} watched the pool with me just now, did you notice? I think it saw something I missed." },
      },
      choices = {
        { text = "I'll listen when the owls go quiet.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Owls are owls. I don't read omens in them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Who comes in and who leaves, how long they stand by the water, and what they look at when they think no one sees them. I'd guess you watch people the same way, so be gentle with what you learn." },
      },
      choices = {
        { text = "I'll be gentle with it. People deserve that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What I learn is mine to use as I please.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It tugs at it, the way a current in a pool tugs at a leaf. The old stories say the Well of Eternity did the same to the stars before the Sundering, and so I'd ask you not to stand too near the water for too long." },
      },
      choices = {
        { text = "Of course. I'll leave the pool to the moon.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The moon can bend a little. It'll survive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That the tree is restless, though I couldn't tell you why, and the druids who come here look more tired every season. You would know better than I whether Teldrassil sleeps well, and I won't make you say so if it doesn't." } },
      choices = {
        { text = "The Archdruid tends the tree, and I trust him to.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It doesn't sleep well, and someone ought to say so aloud.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A shadow sitting a little apart from you, like a guest who hasn't been invited to the table. The pool doesn't judge, it only shows, and I'd ask you to look into it yourself some night and see what you make of it." },
      },
      choices = {
        { text = "I'll look, and I'll face what I see.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I know what I carry. I needn't look.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Come and look at the pool with me a moment, because the moonlight on it tonight is quieter than it was yesterday, and I don't yet know why." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your armor catches the moonlight from across the gardens, {class}, and I'm afraid you've rather spoiled my watching." },
        { id = "h_default", text = "I am Lariia, and I teach here. When I'm not teaching I watch the pool, because Elune's light on its surface will tell you how the night is turning if you look long enough." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You chose the darkest corner by the pool, rogue, which is where I'd sit too. The moonlight shows more from there." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "The moonlight bends a little around you, mage, and I'm not sure you even know it does. It's very pretty, and slightly unsettling." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The moonlight on the pool tonight says a fight is coming, though I'll admit it says that most nights." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You watch the way I do, I think, long enough to see what everyone else walks past." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The moonlight on the pool went still when you came in, and it does that for the Circle more often than for anyone else." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "The moonlight on the pool went dim when you came in, warlock, and it only does that for a few. Don't worry, I've seen it go dimmer." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and your spirits are restless today; I notice such things. The Temple pool shows the moon even on cloudy nights, so perhaps it can calm them." },
      },
      again = { { id = "h_again", text = "Is there more you wish to know? Keep your voice low by the moonwell, for it carries." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What does the pool tell you?", next = "pool" },
        { text = "Do the Temple's priests ever leave Darnassus?", next = "leave" },
        { text = "What does the moonlight show you, Priestess?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the arcane change the moonlight somehow?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can the pool really tell you anything about a fight?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you watch the beasts as closely as the moonlight?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does the moonlight tell a priest, Lariia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does my armor really spoil your watching, Lariia?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does the moonlight on the pool tell you tonight, Lariia?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does the moonlight show of a warlock?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the pool really show the moon always, Lariia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Lariia.", next = "END" },
      },
    },
    pool = {
      lines = {
        { id = "po_default", text = "Whether the moon is clear over Teldrassil, which way the wind is going, and whether the sea is restless. Some of my sisters say they've seen more in it than that, but I've only ever seen the moon." },
      },
      choices = {
        { text = "Honest of you to say so.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Perhaps you'll see more, with faith.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What have your sisters seen?", next = "pool2" },
      },
    },
    pool2 = {
      lines = {
        { id = "p2_default", text = "Faces, they say, and the shapes of things far away. I don't call them liars, and I don't stand behind them either; I just keep watching the water." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = {
        { id = "le_default", text = "Some go to Auberdine, or to the Sentinels in Ashenvale, and a few even take ship for your kingdoms. I've stayed, because someone has to keep the lamps trimmed for the ones who come home." },
      },
      choices = {
        { text = "Someone has to keep the home fires.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "You should see the world while you can.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I watch more than I speak, so I've gathered a little here and there. Ask, and I'll tell you what the water and the travellers have shown me." } },
    background = { { id = "tp_bg", text = "I teach priests and watch the pool. I'm content with both." } },
    advice = { { id = "tp_ad", text = "Look longer than you think you need to. Most people miss things by being in a hurry." } },
    elune = { { id = "tp_elune", text = "Elune's light falls on the pool every night, and I watch it. Sometimes it's all the prayer I need to make." } },
    nordrassil = { { id = "tp_nordrassil", text = "The old tree on Hyjal is ours, and Teldrassil is ours too. I try not to choose between them, because a mother shouldn't." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Some of the novices slipped away to the Faire once, when it came close. They came back with painted faces and a long list of things to confess." } },
    _none = { { id = "tp_none", text = "The pool hasn't shown me anything about that, and I have watched it a long while. Try Alathea." } },
  },
}

-- Sister Aquinne: a young sister of the Temple in the Temple Gardens; sends heroes to A'moora about Lady Sathrah.
P:NPC {
  key = "aquinne", id = TODO_NPC("Sister Aquinne"), name = "Sister Aquinne",
  bible = "bibles/temple.md", role = "priest", tier = "quest",
  communities = { "darnassus" }, temper = { "earnest", "gentle" }, values = { "devout", "kind" },
  notices = { "class", "greenness" },

  impression = {
    first = "Sister Aquinne is still studying at the Temple and takes every task the priestesses give her as a sacred trust. She spoke of Lady Sathrah as if mourning someone she had known.",
    third = "{name} met Sister Aquinne, a young sister of the Temple of the Moon who spends her days weeding the Temple Gardens.",
  },

  greetings = {
    { id = "g_garden", text = "Oh, hello! Isn't the garden lovely tonight? I come here to study where it's quiet." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I was hoping you'd come by; I've been thinking about what you said." },
    { id = "g_novice", when = { origin = "nightelf_priestess" }, text = "Oh, it's you! We sat the same lessons, do you remember, and you were the only novice who admitted you couldn't hear Elune at all yet. I've been so glad of that ever since, because I couldn't either." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
      text = "You're a priest! I've never spoken properly with one of the Light's. Do you study the way we do, with books and a teacher who sighs at you?" },
    { id = "n_green", cat = "greenness", when = { maxLevel = 15 },
      text = "You look as new to all this as I am. That's all right; the priestesses say the moon is kindest to beginners." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I knew her only through stories, but I mourn her as if I did. Your spirits might know where she rests." } },
      choices = {
        { text = "Then honour her memory, Aquinne. That is sacred too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Mourning strangers is foolish.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Much harder, because the prayers are simple enough but the faith behind them has to be real, and some days I'm not sure mine is. The priestesses say doubt is part of it, and I hope they're right." } },
      choices = {
        { text = "Doubt is part of it, and your faith will grow.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith is overrated, and a steady hand heals just as well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Good luck with your studies.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That your order was founded to fight the orcs, and that you swore to protect the weak and heal them too. They also said you were all very solemn, but I think the writer may simply have been solemn himself." } },
      choices = {
        { text = "It's true, for we swear to protect the weak.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Oaths are fine words, but most of us just fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Good luck with your studies.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only if you came by your bruises fairly, because the priestesses can always tell. I'll be sent to the Sentinels in Ashenvale one day, and I'd like to have patched up a real warrior before then, so perhaps come back after you've met the Gnarlpine." } },
      choices = {
        { text = "I'll come back bruised, and you'll be ready in time.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll trust a seasoned priestess, not a student.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The squirrels do, and a white owl who sits on the moonwell some evenings as though he were a priestess himself. I'm not allowed to feed them, but I may have dropped a few seeds by accident once or twice." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} is lovely, and it's looking at me as if it knows I'm a soft touch. I won't feed it, I promise, though I'd like to." },
      },
      choices = {
        { text = "Rules are rules. Wild things should find their own food.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Drop all the seeds you like. It hurts nobody.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Something about the Highborne and the Well of Eternity, which I've read about until I could recite it, though it all happened so long ago. The priestesses still talk as if Azshara were in the next room, and I'm told one day I'll understand why." },
      },
      choices = {
        { text = "Listen to them. They lived through it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Old fear shouldn't decide what you think, Aquinne.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A little, yes, though the priestesses say fear is a poor teacher and pity a better one. I'll pray for you tonight, if you'll let me, and I'll keep the flowers between us until I've finished." },
      },
      choices = {
        { text = "Pray if you like. I won't refuse it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Save your prayers. I don't need them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky_a = {
      lines = {
        { id = "sk_default", text = "In the sky? Islands, just floating up there? I've only read about Eldre'Thalas in old books, and none of them said anything about sky, so I'm afraid you'll have to tell me everything." },
      },
      choices = {
        { text = "Wind spirits held them up. Now they're gone.", next = "sky_a2" },
        { text = "Another time, Sister.", next = "BACK" },
      },
    },
    sky_a2 = {
      lines = {
        { id = "sk2_default", text = "Gone, and you had to come all this way down. I'm sorry, and I'm also a little glad, because otherwise I'd never have met you; is that terrible of me?" },
      },
      choices = {
        { text = "Not terrible. I'm glad too.", next = "BACK", fx = { affinity = 2 } },
        { text = "A little, yes.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Once, when I was very young, but I couldn't bear the thought of sleeping for years while the world went on without me. The Sisterhood stays awake, and I think I would rather keep watch than dream." } },
      choices = {
        { text = "The Sisterhood's watch is the more needed duty right now.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Dream holds answers no watch on this side ever will.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not of rogues, exactly, but of anything done in the dark that couldn't bear Elune's light on it. I think a quiet step can serve her as well as a loud one, though I'd never say so in front of A'moora." },
      },
      choices = {
        { text = "My work could stand in her light.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some work is best done in the dark.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, I hope you'll tell me what it was like when you first began, because I'm still learning and the priestesses make it look so easy." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've read about your order in the Temple's books, though there weren't many, and I'd love to know whether any of them were true." },
        { id = "h_default", text = "I'm Aquinne, a sister of the Temple, though not a priestess yet. The priestesses give me errands and I try to do them well, and in between I study out here among the flowers." },
        { id = "h_temple", tags = { "news" }, when = { questActive = TODO_QUEST("The Temple of the Moon") },
          text = "A once great creature of the forest needs help, and it's a hard thing that must be done. Priestess A'moora will explain; she's inside the Temple, southeast of here." },
        { id = "h_sathrah", when = { questDone = TODO_QUEST("Sathrah's Sacrifice") },
          text = "A'moora told me you laid Lady Sathrah to rest at the fountain. I cried a little, I'm afraid, and then I went and lit a lamp for her." },
        { id = "h_tears", when = { questActive = TODO_QUEST("Tears of the Moon") },
          text = "You're going after Lady Sathrah, aren't you? Be gentle with her, if you can, because she was beautiful once." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Oh, a mage! I've never spoken to one properly, because the priestesses don't really approve. Is it true you can make flowers bloom out of season?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Elune protect me, that's a demon, isn't it? I'm sorry, I didn't mean to stare, only I've never seen one up close." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Oh, a warrior! The priestesses say I should practice my healing on someone who actually gets hurt, but please don't take that as an invitation." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! The priestesses say I'm too familiar with animals, but I can't help being glad to see one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Oh, a druid! I study out here among the flowers, and I've always wondered whether they say more to one of the Circle than they ever say to me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Oh! You startled me, coming up through the flowers like that. The priestesses say a quiet step is a gift, though I don't think they meant for sneaking." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The priestesses give me every task as a sacred trust, even the dusting, so I wonder whether your spirits give you tasks too." },
      },
      again = {
        { id = "h_again", text = "What else? The bell won't ring for my lessons for a while yet, so ask away." },
        { id = "h_again2", text = "Ask me anything; I'll tell you if I know, and if I don't I'll find out." },
      },
      choices = {
        { text = "Who was Lady Sathrah?", next = "sathrah", when = { any = { { questActive = TODO_QUEST("Tears of the Moon") }, { questActive = TODO_QUEST("Sathrah's Sacrifice") }, { questDone = TODO_QUEST("Sathrah's Sacrifice") } } } },
        { text = "You look deep in your studies.", next = "study" },
        { text = "What's it like, training at the Temple?", next = "training" },
        { text = "We study the Light much the same way.", next = "light", when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "My people lived on islands in the sky.", next = "sky_a", when = { race = "Skyborne" } },
        { text = "Why do the priestesses disapprove of mages, Aquinne?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you like a warrior to practice your healing on?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the animals in the gardens keep you company out here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Are you frightened of me, Aquinne?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is learning to heal harder than you expected, Aquinne?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What did the Temple's books say about paladins?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have you ever thought of joining the Circle, Aquinne?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the priestesses disapprove of rogues, Aquinne?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Did you know Lady Sathrah, Aquinne?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    sathrah = {
      lines = {
        { id = "sa_default", text = "A great spider beloved of Elune, who spun silver threads through the moonlight. The dew that gathered on them healed the sick in the Temple, and now she's gone mad, and nobody can tell me why." },
      },
      choices = {
        { text = "It's strange that a holy creature would go mad.", next = "sathrah2" },
        { text = "Then ending her suffering is a mercy.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Then she's a danger, and must be stopped.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    sathrah2 = {
      lines = {
        { id = "s2_default", text = "I asked A'moora about it, and she only said the tree is young. The Temple's waters can cleanse whatever's in her, though, and then Elune will let her be born again, at peace." },
      },
      choices = {
        { text = "I hope she spins again someday.", next = "BACK", fx = { affinity = 2, learn = { "teldrassil" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    study = {
      lines = {
        { id = "st_default", text = "The history of the Sisterhood, mostly, back before the Sundering and through the long years after. There's so much of it, and I keep falling asleep over the War of the Ancients, which is shameful." },
      },
      choices = {
        { text = "History matters. Keep at it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some days the garden teaches more than books.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "What happened in the War of the Ancients?", next = "study2" },
      },
    },
    study2 = {
      lines = {
        { id = "s2b_default", text = "Queen Azshara and her Highborne opened the way for the Burning Legion, and the Sisterhood and the druids drove them back. That's the short version, which is the only one I can say without yawning." },
      },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 }, learn = { "queen_azshara" } } } },
    },
    training = {
      lines = {
        { id = "tr_default", text = "Wonderful, and frightening, and very early in the morning. Priestess A'moora is patient with me, Alathea is strict, and the High Priestess once looked at me across the hall, and I didn't sleep that night." },
      },
      choices = {
        { text = "What did the High Priestess say?", next = "training2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    training2 = {
      lines = {
        { id = "t2_default", text = "Nothing at all! She looked, and nodded, and went on with the Sentinels' reports. I've decided it was an approving sort of nod." },
      },
      choices = {
        { text = "I'm sure it was.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Don't read too much into a nod.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    light = {
      lines = {
        { id = "lg_default", text = "Do you really? With old books and a teacher who sighs? That makes me feel much better about the whole thing, and about the Light too, I think." },
      },
      choices = {
        { text = "Our faiths have more in common than not.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Our teachers sigh. Our faiths differ.", next = "BACK", fx = { align = { light = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I'm only a sister, but I listen to everything the priestesses say in the halls. Ask, and I'll tell you what I've picked up." } },
    background = { { id = "tp_bg", text = "I'm a sister of the Temple, studying to be a priestess. I'm not very far along yet, but I'm trying." } },
    advice = { { id = "tp_ad", text = "Be kind to anyone who is hurting, even if it's a spider. Especially if it's a spider, A'moora would say." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "We've guided and healed our people since before the Sundering. I'm the newest and least of us, but I'm part of it." } },
    elune = { { id = "tp_elune", text = "Elune is the moon, and the moon's light, and the reason we're still here at all, I think. I'm still learning which of those the high priestesses mean when they say her name." } },
    holy_light = { { id = "tp_holy_light", text = "Human priests visit sometimes, and they pray to the Light, which they say is everywhere. I asked one if Elune was part of it, and he looked very worried, so I stopped asking." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "A traveller told me the Darkmoon Faire has a fortune teller who's always right. I'd like to ask her if I'll ever finish my studies." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess is so kind to the novices, and she never tells us when we're making mistakes, she just looks at us until we notice. It works every time." } },
    _none = { { id = "tp_none", text = "Oh, I don't know that one. I could ask A'moora for you, if I remember." } },
  },
}

-- Idriana: banker in the Temple Gardens; pays out Gracina Spiritmight's reward (Calm Before the Storm).
P:NPC {
  key = "idriana", id = TODO_NPC("Idriana"), name = "Idriana",
  title = "Banker",
  bible = "bibles/temple.md", role = "banker", tier = "service",
  communities = { "darnassus" }, temper = { "formal", "steady" }, values = { "careful", "honest" },
  notices = { "purse" },

  impression = {
    first = "Idriana keeps the Bank of Darnassus with perfect courtesy and an even more perfect memory for who owns which box. Nothing leaves her vault without a reason she can write down.",
    third = "{name} met Idriana, the courteous banker of the Bank of Darnassus in the Temple Gardens.",
  },

  greetings = {
    { id = "g_bank", text = "Ishnu-alah, and welcome to the Bank of Darnassus. Do you already have an account with us, {g:sir|ma'am}?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your box is exactly where you left it, as always." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "You carry a good deal on your person, if you'll forgive my noticing. We do have boxes for that, and none of them has ever been robbed." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everything that leaves my vault does. Your spirits might not need reasons, but my ledgers do." } },
      choices = {
        { text = "Good records protect us all, Idriana.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Reasons are overrated.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A few, recorded with as much care as any gold and returned exactly as they were left. I don't ask what they mean to their owners, only that they be kept safe until they're needed." } },
      choices = {
        { text = "Some relics are sacred, and I'm glad they're kept with care.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Relics are trinkets, and I'd sell mine if the price were right.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Everything here is guarded, recorded and returned, and the Sentinels outside see to the guarding. Plenty have tried, I'll admit, and not one of them has succeeded." } },
      choices = {
        { text = "An honest record is the best guard of all.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Locks are fine, but I trust my own hands more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Thank you.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than anyone, and most leave a note with it, saying who should have the box if they don't come home from Ashenvale. I keep every one of those notes sealed, and I'm always glad to hand the box back to its owner instead." } },
      choices = {
        { text = "I'll leave a note. A warrior plans for the worst.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No note. I'm coming back for it myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Trophies, mostly, claws and teeth and once a whole stuffed owl, which I recorded as one stuffed owl, wings slightly damaged. I don't ask why anyone wants such things kept safe, only that they're listed properly." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} may not come behind the counter, however politely it asks. The ledgers are very old and very chewable." },
      },
      choices = {
        { text = "I keep only what I need from a hunt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good trophy is worth keeping forever.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not often, because the Sentinels outside are very good at their work, but once is enough to make a banker careful. Store what you like and take it back whenever you wish, and leave everyone else's boxes exactly where they are." },
      },
      choices = {
        { text = "Your boxes are safe from me. I'm no thief.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Watch my hands all you like. You'll see nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Call the Sentinels, and then a priestess, and then very probably the Archdruid himself, and none of them would thank me for it. Keep your stranger possessions on your own person, please, and our accounts will stay friendly." },
      },
      choices = {
        { text = "Agreed. Nothing that whispers goes in your vault.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What I store is my business, banker.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A few do, when they go into the long sleep at the Enclave, and I keep a separate ledger for them so nothing is lost if they stay away for years. One box has waited since the city was founded, and I still dust it every month." } },
      choices = {
        { text = "Their things should wait for them, however long they sleep.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "After a few years, I'd open the box and move on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Only now and then, mostly human ones, who keep trying to store things that hum, glow or answer back. Everything that comes into this vault must be recorded and returned as it was given, and that's difficult when the thing in question changes colour overnight." },
      },
      choices = {
        { text = "Fair rules. I'll store nothing that hums.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Make a new column, banker.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Some of the Temple's own keep their things with us, so you needn't worry that your relics will be treated without respect." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order's things are usually heavy, {class}, but I'll find a box for them, and nobody will touch them but you." },
        { id = "h_default", text = "I'm Idriana, and I keep accounts and safety deposit boxes for anyone with valuables they'd rather not carry through Ashenvale. Everything here is guarded, recorded and returned on request." },
        { id = "h_voucher", tags = { "news" }, when = { questActive = TODO_QUEST("Calm Before the Storm") },
          text = "Gracina Spiritmight has told me to expect you. When you bring her voucher, I'm to withdraw something from her account and present it to you, so congratulations would seem to be in order." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Everything here is guarded and recorded, rogue, so do not take it amiss if I watch your hands while we talk." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll keep your deposits, warlock, as I keep anyone's, though I'll ask you not to store anything that whispers." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Please sheathe that before you lean on the counter, because the last warrior who didn't scratched it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you're depositing hides, I'm afraid they go to the auction house and not to me, whatever you've heard." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Your Circle leaves very little in my vaults, I find, though the ones who go into the long sleep do like to know their things will be here when they wake." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I'd ask you not to open any portals inside the vault, because I'd have to write it down, and I've no column for it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Your box will be safe beneath the Temple's roof, though I must write down the reason for anything that leaves it, as we always have." },
      },
      again = { { id = "h_again", text = "Is there anything else? Your coin is as safe under the Temple's roof as anywhere in Darnassus." } },
      choices = {
        { text = "I'd like to see my box.", next = "BUSINESS" },
        { text = "Who keeps accounts here?", next = "accounts" },
        { text = "Is anything here ever stolen?", next = "stolen" },
        { text = "Do rogues really trouble the bank so often?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors leave much with you before they go to war?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters keep anything unusual in your vault?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you do if a box started whispering?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the priestesses keep relics in your vault?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the vault really safe from thieves, Idriana?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do druids really leave their things here while they dream?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do mages trouble the bank often, Idriana?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does everything require a reason, Idriana?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you.", next = "END" },
      },
    },
    accounts = {
      lines = {
        { id = "ac_default", text = "Priestesses, druids, craftsmen and a great many visitors from your kingdoms. Scholars use us most, oddly; Gracina Spiritmight has more specimens in her box than coins." },
      },
      choices = {
        { text = "I wouldn't have expected specimens in a bank.", next = "accounts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    accounts2 = {
      lines = {
        { id = "a2_default", text = "Sealed, labelled and, I'm assured, entirely dead. I don't open the boxes; I only keep the records and the keys." },
      },
      choices = {
        { text = "Wise policy.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "I'd have peeked.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
      },
    },
    stolen = {
      lines = {
        { id = "sto_default", text = "Never, and I intend to keep it that way. The Sentinels walk the gardens day and night, and a thief would have to get past them and then past me." },
      },
      choices = {
        { text = "The Sentinels are thorough.", next = "BACK", fx = { align = { order = 1 }, learn = { "sentinels" } } },
        { text = "Every vault has a weakness.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A banker hears much and repeats very little. I can speak to a few matters, if you ask." } },
    background = { { id = "tp_bg", text = "I keep the bank's records and its keys. Both are always in order." } },
    advice = { { id = "tp_ad", text = "Don't carry everything you own into the wilds. The wilds will take a share." } },
    booty_bay = { { id = "tp_booty_bay", text = "The goblin bank in Booty Bay is very efficient, I'm told, and charges for the privilege of telling you so. We do not charge for honesty here." } },
    theramore = { { id = "tp_theramore", text = "Theramore's merchants send letters of credit on the Auberdine boat. They are always correct, which I appreciate more than they know." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "A goblin cartel, very organised and very expensive. Their ledgers are a marvel, though I'd never tell them that." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't a banking matter, and the bank has kept to banking for a very long time." } },
  },
}
