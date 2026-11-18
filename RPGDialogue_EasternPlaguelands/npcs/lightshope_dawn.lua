-- Light's Hope Chapel: the spirit in the crypt who tests priests.
-- Voice: bibles/eris_havenfire.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eris_havenfire", id = TODO_NPC("Eris Havenfire"), name = "Eris Havenfire",
  bible = "bibles/eris_havenfire.md", role = "priest", tier = "quest",
  communities = { "light_hope" }, temper = { "calm", "gentle" }, values = { "pious", "kind" },
  notices = { "class", "race" },
  impression = {
    first = "Eris Havenfire is a spirit beneath Light's Hope who speaks of Light and Shadow as two hands of one healer. She weighed me before she spoke, and I'm still not sure what she found.",
    third = "{name} met Eris Havenfire, a priestly spirit who keeps a quiet vigil in the crypt beneath Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_vigil", text = "Few come down here with their eyes open, and fewer still can see me. Be welcome, and speak softly; the stones remember everything." },
    { id = "g_back", when = { metBefore = true }, text = "You've come down to the crypt again. I'm glad, for the living bring warmth even when they don't intend to." },
    { id = "g_trial", when = { questActive = TODO_QUEST("The Balance of Light and Shadow") }, text = "The frightened ones are waiting on the road. Heal them and guard them both, and don't let pride tell you that one hand is enough." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}. I counted the days by the prayers said above me, and there were fewer than there ought to have been." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, and one who has walked far to stand here. I can see both lights in you, {class}, the bright and the dim, and neither one is wicked by itself." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You died and returned, as I died and did not quite leave. We are neither of us where we were meant to be, I think, and yet here we both stand." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Eris Havenfire. In life I served the Light, and in death I keep watch beneath this chapel for those who would learn its harder lessons." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Balance of Light and Shadow") },
          text = "You kept them alive, and you kept the dead from them, and you did both at once. That is the lesson, and it is one most priests never learn in a lifetime." },
        { id = "h_notpriest", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "MAGE", "WARLOCK", "SHAMAN", "DRUID" } },
          text = "My trial is for priests, and you are not one, though you may sit with me awhile if you like. The dead are glad of company, whatever road brought it." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, the Light's sword and shield together. My trial isn't yours to take, but you understand already that the Light must sometimes strike, so we'll get along." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. The crypt is patient, and so am I." },
        { id = "h_again2", text = "There's more on your mind; I can see it. Go on." },
      },
      choices = {
        { text = "What is the balance you speak of?", next = "balance" },
        { text = "What is your trial?", next = "trial" },
        { text = "Who were you, in life?", next = "life" },
        { text = "Why keep watch beneath Light's Hope?", next = "chapel" },
        { text = "Some say Shadow has no place in a priest.", next = "shadow", when = { class = "PRIEST" } },
        { text = "Can a Forsaken priest still serve the Light?", next = "forsaken", when = { race = "Scourge", class = "PRIEST" } },
        { text = "I'll leave you to your vigil.", next = "END" },
      },
    },

    balance = {
      lines = { { id = "ba_default", text = "The Light mends and the Shadow ends, and a healer who can only mend will watch her patients die of what she won't strike down. A priest must carry both, and know which one the moment asks for." } },
      choices = {
        { text = "Isn't Shadow dangerous to wield?", next = "balance_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance_danger = {
      lines = { { id = "bd_default", text = "Very, as fire is dangerous and a knife is dangerous, and we use both every day. The danger is in loving it, in reaching for the Shadow because it answers quicker than the Light." } },
      choices = {
        { text = "Which do you trust more?", next = "balance_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance_trust = {
      big = true,
      lines = { { id = "bt_default", text = "I trust the hand that holds them, and nothing else. Now I'll ask you, since you've asked me: if you could carry only one, which would you choose?" } },
      choices = {
        { text = "The Light. Healing is worth more than any killing.", next = "BACK", reply = "A healer's answer, and a good one. Carry it well, and don't be ashamed when the other hand is needed.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Shadow. A dead enemy harms no one else.", next = "BACK", reply = "An honest answer, and a cold one. Remember that a healed friend harms no one either.", fx = { align = { light = -1 } } },
        { text = "Both, as you said. I won't choose.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
      },
    },

    trial = {
      lines = {
        { id = "tr_default", text = "Frightened folk flee along the road, and the Scourge hunts them from the trees. A priest must keep them living with one hand and keep death off them with the other, and many must reach safety, or the trial is lost." },
        { id = "tr_other", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "MAGE", "WARLOCK", "SHAMAN", "DRUID", "PALADIN" } }, text = "It is a priest's test, and I'll tell you of it only because you asked kindly. Frightened folk flee along a road while the Scourge hunts them, and the priest must heal and fight at once." },
      },
      choices = {
        { text = "Are those people real?", next = "trial_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trial_real = {
      lines = { { id = "trr_default", text = "They were, once. The Plaguelands are full of the moment folk ran and didn't make it, and I can call that moment back for a little while. This time they might make it, and that matters to them, I think, even now." } },
      choices = {
        { text = "So the trial is a mercy for them too.", next = "trial_mercy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trial_mercy = {
      big = true,
      lines = { { id = "tm_default", text = "I hope so, though I can't be certain, and I've wondered whether I'm wrong to wake them at all. Tell me what you think, since you'll be the one standing among them." },
      },
      choices = {
        { text = "Giving them a second chance is right. Wake them.", next = "BACK", reply = "Then I'll wake them, and I'll trust you to stand among them kindly. A second chance should not be wasted.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the dead rest. Find another way to test us.", next = "BACK", reply = "Perhaps you're right, and perhaps I've been selfish in my hope. I'll think on it, though I make no promise.", fx = { align = { light = -1 } } },
        { text = "I can't answer that, Eris.", next = "BACK" },
      },
    },

    life = {
      lines = { { id = "li_default", text = "A priestess of Lordaeron, as many were, and not a famous one. I tended the sick in the plague's first months, and I learned there what this trial teaches, though I learned it too late for most of them." } },
      choices = {
        { text = "How did you die?", next = "life_death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_death = {
      lines = { { id = "ld_default", text = "Tending a village that had already turned, and not knowing it until the first of them rose. I had only healing in my hands that night, and healing was not what the night needed." } },
      choices = {
        { text = "I'm sorry, Eris.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    chapel = {
      lines = { { id = "ch_default", text = "This ground is holy, and the Scourge will not walk it willingly, so the dead who are not theirs gather here. I am one of them, and I've made myself useful, where most ghosts only drift and mourn." } },
      choices = {
        { text = "Does Lord Tyrosus know you're here?", next = "chapel_tyrosus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chapel_tyrosus = {
      lines = { { id = "ct_default", text = "He comes down at dawn sometimes and prays, and I think he feels me listening, though he has never said so. Leonid knows, of course; the risen always know their own." } },
      choices = {
        { text = "Then you're in good company.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shadow = {
      lines = { { id = "sh_default", text = "Those who say so have never watched a patient die of what they refused to strike. Shadow is not evil, {class}; it is only dark, and a priest should not be frightened of the dark." } },
      choices = {
        { text = "My teachers would call that heresy.", next = "shadow_heresy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_heresy = {
      big = true,
      lines = { { id = "shh_default", text = "Your teachers lived in cities with walls, and I lived here, at the end of things. Whose lesson will you carry out of this crypt, theirs or mine?" } },
      choices = {
        { text = "Yours. The Plaguelands taught you what walls never could.", next = "BACK", reply = "Then carry it carefully, because the Plaguelands teach hard lessons. Walls are not the only things that fall.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Theirs. Doctrine keeps priests from losing themselves.", next = "BACK", reply = "It does, and I won't mock it. Only remember that doctrine was written by those who never stood here.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    forsaken = {
      lines = { { id = "fo_default", text = "If you can call it and it answers, then it serves you, and that's all the answer the Light gives anyone. It burns you a little, I expect, and you call it anyway, which says more of your faith than any sermon." } },
      choices = {
        { text = "It burns. I call it anyway.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priestess of Lordaeron who learned her best lesson too late, and has spent her death teaching it." } },
    advice = { { id = "tp_ad", text = "Never let your patient die of your principles. Heal what you can, and end what you must." } },
    argent_dawn = { { id = "tp_argent", text = "The living who keep this chapel, and they keep it well. They pray above me every dawn, and I listen." } },
    _none = { { id = "tp_none", text = "That is a matter for the living above, and I've not been one of them for a long while. Ask in the chapel." } },
  },
}

-- Light's Hope: Quartermaster Miranda Breechlock, the dwarf who keeps the Argent Dawn's stores and won't
-- open them to anyone the Dawn hasn't learned to trust. Voice: bibles/lightshope_dawn.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "miranda_breechlock", id = TODO_NPC("Quartermaster Miranda Breechlock"), name = "Quartermaster Miranda Breechlock",
  title = "The Argent Dawn",
  bible = "bibles/lightshope_dawn.md", role = "vendor", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "brisk", "gruff" }, values = { "dutiful", "practical" },
  notices = { "status", "race", "kit" },

  impression = {
    first = "Quartermaster Miranda Breechlock keeps the Argent Dawn's stores at Light's Hope and keeps them shut to anyone the Dawn doesn't know. She counts everything twice, and she told me so as a warning.",
    third = "{name} met Quartermaster Miranda Breechlock, the dwarf who keeps the Argent Dawn's stores at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "Quartermaster's stores. If ye're here tae browse, ye can browse wi' yer eyes, because the Dawn's goods are for the Dawn's friends." },
    { id = "g_stranger", when = { reputation = { faction = "Argent Dawn", max = "neutral" } }, text = "I don't know yer face, an' neither does the Dawn yet. Bring in some scourgestones, help the officers, an' come back when they've heard yer name." },
    { id = "g_honored", when = { reputation = { faction = "Argent Dawn", min = "honored" } }, text = "There's a face the officers speak well of! Come in, come in, an' see what the chapel can spare for ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, my ledger likes regular customers. It's the irregular ones that make it twitch." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' still in one piece! Ye'd be amazed how many I stop seein' after a fortnight out there." },
  },

  notice = {
    { id = "n_revered", cat = "status", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
      text = "Revered by the Dawn, are ye? Then ye'll be wantin' tae hear about the mantles, I'd wager." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' mine, all this way from the mountain! Ye'll have smelt the chapel's ale already, so I'll say no more." },
    { id = "n_broken", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer kit's in tatters, an' I don't sell repairs, so take it tae the smith before it falls off ye in front o' a ghoul." },
  },

  start = "hello",
  nodes = {
    dd_scourge = {
      lines = {
        { id = "dd_scourge_1",
          text = "Not every one, but they count the stones, an' I count what comes through my door, an' that's the same thing in the end. The Dawn's never had coin to spare, so it pays in trust, an' trust gets ye into my stores." },
        { id = "dd_scourge_2",
          text = "I'll tell ye what I tell every young soldier who brags: the dead don't stay down because ye're proud of yerself. They stay down because ye were careful." },
      },
      choices = {
        { text = "I'm proud of it all the same. I've earned it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Fair enough. I'll be careful and keep at it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_scourge", when = { killed = { name = { "Skeletal", "Ghoul", "Rotting", "Zombie", "Gargoyle", "Abomination" }, min = 100 } },
          text = "The scouts've been bringin' in stories about you an' a great heap o' broken Scourge, an' I believe every word. Bring the stones to the Dawn an' the officers'll be speakin' yer name before long." },
        { id = "h_default", key = true,
          text = "Miranda Breechlock, quartermaster tae the Argent Dawn. Every bandage, every potion an' every bolt o' cloth in this chapel goes through my hands an' into my ledger, an' none of it goes out tae strangers." },
        { id = "h_mantle", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
          text = "The officers say ye're revered among us now, an' that means I can offer ye the mantles, if ye bring me ten valor tokens as a sign o' faith. It's no' the price that matters; it's what payin' it says about ye." },
        { id = "h_mantle_done", when = { questDone = TODO_QUEST("Mantles of the Dawn") },
          text = "Ye've paid yer tribute, an' yer name's in the book, so any quartermaster o' the Dawn will sell ye a mantle while ye keep yer standin'. Mind ye keep it." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Aye, I'll serve ye, if the Dawn knows ye. There's Forsaken in our ranks an' they fight as hard as any, though I'll admit it took me a while tae stop reachin' for my axe." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The ledger's waitin', an' it's no' a patient book." },
        { id = "h_again2", text = "Ask away, but quick. There's a cart o' bandages tae count before dark." },
      },
      choices = {
        { text = "Do the officers really count every Scourge I kill?", next = "dd_scourge", when = { killed = { name = { "Skeletal", "Ghoul", "Rotting", "Zombie", "Gargoyle", "Abomination" }, min = 100 } } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why won't you sell to strangers?", next = "strangers" },
        { text = "What are the mantles of the Dawn?", next = "mantles", when = { reputation = { faction = "Argent Dawn", min = "honored" } } },
        { text = "How does a dwarf end up at Light's Hope?", next = "how" },
        { text = "What does the chapel run short of?", next = "short" },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    strangers = {
      big = true,
      lines = { { id = "st_default", text = "Because the Crusade sends spies, an' the Cult sends worse, an' I've seen what both would do wi' a crate o' our holy water. Earn the Dawn's trust first, an' my door's open; that's fair, an' it keeps the chapel standin'." } },
      choices = {
        { text = "That's sensible. Trust has to be earned.", next = "BACK", reply = "Aye, it does, an' it's nice tae hear it said wi'out a scowl. Bring me a few tokens an' we'll talk.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hoarding supplies while folk die isn't sensible. It's cold.", next = "BACK", reply = "Cold, is it? Ye'll think different when ye see what the Cult does wi' a crate o' holy water. I'll keep my door shut, thanks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },

    mantles = {
      lines = { { id = "mn_default", text = "Enchanted mantles for yer shoulders, tae turn aside fire, frost, shadow, nature or the arcane. Once the Dawn reveres ye, bring me ten valor tokens as a sign o' faith, an' I'll sell ye whichever ye need." } },
      choices = {
        { text = "Why ask for tokens on top of reputation?", next = "mantles_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mantles_why = {
      big = true,
      lines = { { id = "mw_default", text = "Because standin' is somethin' the Dawn gives ye, an' the tokens are somethin' ye give back. A body that won't give back isn't one I'd trust wi' the chapel's best enchantments." } },
      choices = {
        { text = "Fair. Service should cost something.", next = "BACK", reply = "It should, an' it does here. Bring me yer tokens an' the chapel's best is yers.", fx = { align = { honor = 1 } } },
        { text = "Sounds like a tithe dressed up as a test.", next = "BACK", reply = "Call it what ye like, but it's kept the chapel stocked through two winters. The tokens stay.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    how = {
      lines = { { id = "hw_default", text = "I kept the stores for a dwarven company that marched north tae help Lordaeron, an' when Lordaeron was gone an' the company wi' it, I found I couldnae go home an' sit by a fire. The Dawn needed somebody who could count, so here I am." } },
      choices = {
        { text = "You lost your company?", next = "how_company" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_company = {
      lines = { { id = "hc_default", text = "Most o' them, aye, at Andorhal or near it. I count bandages now instead o' graves, an' I find I prefer it, though some nights the numbers look the same." } },
      choices = {
        { text = "I'm sorry for your loss, quartermaster.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    short = {
      lines = { { id = "sh_default", text = "Everythin', always, but holy water an' linen most of all. The Scourge never runs out o' bodies, an' we never run out o' wounds tae wrap, so if ye see Jase Farlane at the trade goods table, tell him I want my linen." } },
      choices = {
        { text = "I'll pass the message on.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Quartermaster tae a company that's gone, an' now tae the Dawn. I keep the stores; that's the whole o' me." } },
    argent_dawn = { { id = "tp_ad", text = "Folk o' every race, fightin' the Scourge together, an' every one o' them needin' bandages. I'm proud tae keep their stores." } },
    _none = { { id = "tp_none", text = "If it's no' in my ledger, I don't know it. Try Lord Tyrosus." } },
  },
}
