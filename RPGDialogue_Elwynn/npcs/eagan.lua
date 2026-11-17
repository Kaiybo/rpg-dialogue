-- Eagan Peltskinner, Northshire Valley. Voice: bibles/eagan.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eagan", id = TODO_NPC("Eagan Peltskinner"), name = "Eagan Peltskinner",
  bible = "bibles/eagan.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "beast", "form", "skinner" },
  impression = {
    first = "Eagan Peltskinner walks his trap lines like a man who knows where every snare is buried, and he'd much rather I stepped where he stepped. He looks at every creature as a coat first.",
    third = "{name} met Eagan Peltskinner, the Northshire trapper who judges every creature by the quality of its pelt.",
  },

  greetings = {
    { id = "g_traps", text = "Step where I step, friend. There are traps all through here." },
    { id = "g_fur", text = "Bring me something with fur on it." },
  },

  notice = {
    { id = "n_bear", cat = "form", place = "replace", when = { form = "bear" },
      text = "I've skinned bears before, so don't take it personally." },
    { id = "n_cat", cat = "form", place = "replace", when = { form = "cat" },
      text = "Hold still, I'm only looking at the coat. It's a good coat, too." },
    { id = "n_pet", cat = "beast", when = { pet = { type = "Beast" } },
      text = "That's a good animal. Feed it before you feed yourself and it'll keep you alive." },
    { id = "n_skinner", cat = "skinner", when = { profession = "Skinning" },
      text = "You skin. I can tell from your knife. Most folk hack at a pelt like it owes them money." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Easy, now. I've no quarrel with bears that pay their way." },
    { id = "r_pet", on = "pet", when = { pet = { type = "Beast" } }, text = "Where'd that one come from? Healthy, too, and well kept." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It would, because the young ones scatter before a man gets within a stone's throw of them, and then they come back for my drying racks after dark. If you can get close enough to see the whites of their eyes, you'll do better than most of the Abbey's recruits." } },
      choices = {
        { text = "I'll thin the pack so they stop starving on your racks.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll kill every wolf on that ridge, pups and all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every animal does, and mine have been howling at the graveyard behind the Abbey since La Salle took up her post there. A wolf knows something wrong when it smells it, and I've learned to trust a wolf's nose over a man's word." } },
      choices = {
        { text = "Your wolves are right to fear it. I'll keep it leashed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them howl. Fear keeps beasts in their place.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wolves are pushing over the ridge, hungry ones, and they take whatever they can carry." },
        { id = "h_willem", when = { questRecent = { TODO_QUEST("Eagan Peltskinner"), days = 1 } },
          text = "Willem sent you? Then he thinks you can hold a knife, and we'll soon see if he's right." },
        { id = "q_wolves_active", when = { questActive = TODO_QUEST("Wolves Across the Border") },
          text = "Tough meat, not tender. That's how I know they're the hungry ones." },
        { id = "q_wolves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wolves Across the Border"), days = 2 } },
          text = "Quieter nights. The pelts from those wolves will keep somebody warm in the Abbey come winter." },
        { id = "h_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A human hunter. My grandfather would've called that a trapper with ambitions. He'd not have meant it kindly." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You're one of the ones who turns into the animals. Hard to know whether to shake your hand or check your teeth." },
        { id = "h_steaks", when = { questDone = TODO_QUEST("Wolves Across the Border") },
          text = "I ate the last of your wolf last night, slow over coals with a bit of salt. Tough as a boot, and I'd not change a thing." },
        { id = "h_veteran", when = { minLevel = 20 },
          text = "You've a better knife than you came here with, and a few scars from things bigger than wolves, by the look of you. That's good." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk light, like a hunter who's learned not to step on twigs. Good; the wolves on the ridge hear everything else." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Keep whatever that is on a short leash, because the wolves smell it and it puts them in a temper." },
      },
      again = {
        { id = "h_again", text = "Something else? Be quick about it; the traps don't check themselves." },
        { id = "h_again2", text = "Well? I've traps to see to." },
      },
      choices = {
        { text = "What do you need?", next = "BUSINESS" },
        { text = "What do you want with wolf meat?", next = "meat" },
        { text = "Why so many wolves this year?", next = "why" },
        { text = "Do you ever feel sorry for them?", next = "pity" },
        { text = "Teach me a cleaner cut?", next = "skin", when = { profession = "Skinning" } },
        { text = "Would you skin me, if I were a bear?", next = "druid", when = { class = "DRUID" } },
        { text = "Could a quiet step help with your wolves?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do your wolves truly sense a warlock's demon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    meat = {
      lines = {
        { id = "m_default", text = "I eat it. I hate those timber wolves, but I do like a wolf steak, funny as that sounds. The pelts go down to Goldshire." },
      },
      choices = {
        { text = "Who takes the pelts?", next = "meat_helene" },
        { text = "Wolf steak? Really?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    meat_helene = {
      lines = {
        { id = "mh_default", text = "Helene, my wife. She skins and sews down in Goldshire, and she's more orders than I've wolves. If you skin, go and learn from her; she's better at it than me." },
      },
      choices = {
        { text = "High praise, from you.", next = "meat_praise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_praise = {
      lines = {
        { id = "mp_default", text = "It's not praise, it's a fact. I hunt and she makes something of it, and most folk only ever see the second half." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = {
        { id = "w_default", text = "Hungry ones, come over the border from the hills: young wolves mostly, and the timber wolves after them. It's easy pickings down here, and recruits are the easiest pickings of all." },
      },
      choices = {
        { text = "Then I'll thin them out.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "What about the kobolds?", next = "why_kobolds" },
      },
    },
    why_kobolds = {
      lines = {
        { id = "wk_default", text = "Kobolds don't wear anything worth taking. Wolves keep clear of their mine, though, so even a wolf has standards." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pity = {
      lines = { { id = "p_default", text = "Sorry for them? They'd eat me if I let them, and I don't let them." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Seems a hard way to see it.", next = "pity_hard", fx = { align = { light = 1 }, trait = { kind = 1 }, affinity = -1 } },
      },
    },
    pity_hard = {
      lines = {
        { id = "ph_default", text = "Soft folk keep pets and I keep a larder, so we both feed something. Mine just doesn't follow me home." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skin = {
      lines = {
        { id = "s_default", text = "Keep the knife flat and follow the fat; don't saw at it. If you hear it tearing, you've already ruined it. Helene teaches it properly, down in Goldshire." },
      },
      choices = { { text = "Knife flat. Thanks.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "d_default", text = "Depends on the coat. Don't look at me like that; you asked." } },
      choices = { { text = "Fair.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a trapper and a skinner, here in Northshire, and that's the lot." } },
    advice = { { id = "tp_ad", text = "Feed your animal before yourself. Clean your knife before you sleep. Never turn your back on a wolf that's stopped growling." } },
    kobolds = { { id = "t_kobolds", text = "Kobolds don't wear anything worth taking." } },
    hogger = { { id = "t_hogger", text = "A gnoll that big has a hide like a door. I'd like it, but I'd not like to be the one taking it." } },
    _none = { { id = "t_none", text = "Ask someone who talks more." } },
  },
}
