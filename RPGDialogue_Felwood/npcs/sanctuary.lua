-- The Emerald Sanctuary: the Emerald Circle's camp in southern Felwood. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eridan", id = TODO_NPC("Eridan Bluewind"), name = "Eridan Bluewind",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "hopeful" }, values = { "devout", "patient" },
  notices = { "class", "race" },

  impression = {
    first = "Eridan Bluewind insists there's still green under Felwood's sickness, and she plants a seed every morning to prove it. Her hope is stubborn enough to be almost catching.",
    third = "{name} met Eridan Bluewind of the Emerald Circle, who believes Felwood can be healed.",
  },

  greetings = {
    { id = "g_green", text = "Welcome, traveler. Look past the sickness, if you can, for there's still green under it." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to Felwood, when most don't once they've seen it. Thank you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Can you feel it? The forest is still alive under the poison, and it's screaming, but it's alive." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One of our own! You'll remember this forest as it was, or your parents will, so help me make it that again." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Thin their numbers, and find out what Xavaric, their leader, is planning, if you can get close enough. Every satyr that falls is a little less poison in the soil, and I'd rather you did it quickly and quietly than with a war band that would trample all my seedlings." } },
      choices = {
        { text = "I'll strike quickly and spare your seedlings.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll do it my way, seedlings or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I plant a seed every morning, and some mornings one of them sprouts, and that's all the proof I need. The Jadefire satyrs and the corruption in the streams fight me every step, but your Light shows that a dark place can hold something bright, and I think the forest is the same." } },
      choices = {
        { text = "I believe you. The Light and the land can both heal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some things are too far gone. Burn the rot away.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Jadefire satyrs, mostly, and the fel that leaks from their camps into the soil. A warrior can't heal the ground, but every satyr you put down in Jadefire Glen is one less hand pouring poison into it." } },
      choices = {
        { text = "Then I'll fight them to protect your work, Eridan.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight them for the bounty. The seedlings are your business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Eridan.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "One, a fawn by the sanctuary's edge that drank from our cleansed water and grew up with clear eyes. It's a small thing, but I count it, because if one fawn can be saved, then the forest is only sick, not dead." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And look at {pet}, healthy and bright-eyed in the middle of Felwood! That does my heart more good than you know." },
      },
      choices = {
        { text = "Then there's hope for the rest. I'll help you find it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "One fawn proves nothing. The forest's beasts are lost.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I have never seen fel touch a living thing and leave it better, and I have looked, because I am the hopeful sort. Perhaps a warlock can hold it without spilling it, but Felwood is what happens when even one hand slips." } },
      choices = {
        { text = "Then I'll hold it carefully, and never here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A slip is the price of real power.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep clear of your seedlings.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They corrupt the ancients of the forest and turn their own hearts to fel, and every glade they touch withers to ash. Xavaric leads them from Jadefire Run, and I think an arcane eye might see how his magic spreads where mine only sees the damage it leaves behind." } },
      choices = {
        { text = "Then let's root Xavaric out together.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strike his glades by surprise and leave nothing standing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll look closer when I'm out there.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I don't know, and I'd love to find out, because nothing I've tried has made one take yet. The corruption is in the roots and the water both, so perhaps it needs a blessing as much as a salve, or perhaps I'm only hoping out loud again." } },
      choices = {
        { text = "Hope is a kind of prayer too. Keep planting, Eridan.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Blessings won't touch the satyrs. Kill them, and the soil follows.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I honestly don't know, and that's why I asked. The Circle tends the land through the Emerald Dream and your faith reaches for something else entirely, but every seed I plant here dies of the same poison, so I'm in no position to refuse help." } },
      choices = {
        { text = "Anything that heals is worth trying. I'll pray over them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers are for people. Your seeds will have to fend for themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Jadefire", min = 30 } },
          text = "The Jadefire satyrs are fewer, and I swear one of my seedlings sprouted the morning after you came back from their camps. I'll not call it a coincidence." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You move so quietly the satyrs won't hear you coming, which is good, because the Jadefire satyrs wear the corruption like a crown, and I'd love to see someone knock it off." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I won't ask you to plant anything, but I'll show you the seedlings if you've a moment, because there's green under all this sickness, and I want someone else to see it too." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! I won't ask you to plant seeds, though I'll warn you that half the work of mending a forest is clearing away what tries to kill the seedlings." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You've seen what the corruption does to the beasts, then, and I'd love to hear whether any of them are getting better." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock at the Emerald Sanctuary. The jadefire satyrs burn with the same flame you carry, and I'll ask you to keep it far from my seedlings while you're here." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! I wonder whether your arcane eye sees what the Jadefire satyrs are doing to the land, because to me it only looks like sickness and rot." },
        { id = "h_default", key = true,
          text = "I am Eridan Bluewind, of the Emerald Circle. Felwood was green once, and under all of this, somewhere, it still is, and we mean to find it again." },
        { id = "h_jadefire", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Corruption of the Jadefire") }, { questActive = TODO_QUEST("Further Corruption") } } },
          text = "The Jadefire satyrs wear the corruption like a crown, so thin their numbers; every one that falls is a little less poison in the soil." },
        { id = "h_flute", when = { questActive = TODO_QUEST("Flute of Xavaric") },
          text = "Xavaric carries a flute, and I want it out of satyr hands, because what it does in theirs I'd rather not see again." },
        { id = "h_ancients", when = { questActive = TODO_QUEST("Felbound Ancients") },
          text = "The ancients guarded this forest once, and now the corruption holds them, and it hurts to look at them. Do what must be done." },
        { id = "h_purified", when = { questDone = TODO_QUEST("Purified!") },
          text = "Purified... say it again, please, for I've waited a long time to hear that word in Felwood." },
        { id = "h_linken", when = { heardLine = "linken.h_default" },
          text = "You've met the gnome in Un'Goro who lost his memory? If his friends send you for a totem, come to me. The water spirit and I can do a great deal together." },
        { id = "h_rest", when = { metBefore = true },
          text = "I planted a seed by the sanctuary's edge this morning, and it won't take, but I plant one every morning anyway. One day one will." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, at the Emerald Sanctuary! The druids here mend the soil, but I've always thought a priest mends something deeper, so you are very welcome among my seedlings." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, at the Emerald Sanctuary. You're welcome so long as you help things grow, and I'll confess I'm curious what a prayer might do for my seedlings." },
      },
      again = { { id = "h_again", text = "What else? Softly; the sanctuary listens." } },
      choices = {
        { text = "What happened to Felwood?", next = "what" },
        { text = "What is the Emerald Circle?", next = "circle" },
        { text = "Why plant seeds that won't grow?", next = "seeds" },
        { text = "I can feel the sickness in the ground.", next = "druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Is fel always poison, or only in the wrong hands?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What are the satyrs doing to the land?", next = "xmage", when = { class = "MAGE" } },
        { text = "Could a priest's prayer help your seedlings take root, Eridan?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What kills your seedlings, Eridan?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Have you seen any of Felwood's beasts recover, Eridan?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'll help heal it.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Could a priest's prayers help your seedlings take?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you truly believe Felwood can heal, Eridan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you have me do to the Jadefire satyrs, Eridan?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'm here for the satyrs, not for the trees.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    what = {
      big = true,
      lines = {
        { id = "w_default", text = "It was the demons' war. To weaken Hyjal's defenders, a dreadlord poisoned the forest around the mountain with a cursed skull. The beasts twisted and the ancients turned, and the land itself sickened, and it has not stopped." },
      },
      choices = {
        { text = "Can it be undone?", next = "what_undone" },
        { text = "I'll help heal it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Some places are past saving, and this is one of them.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    what_undone = {
      lines = { { id = "wu_default", text = "Slowly, and not in my lifetime, perhaps, and mine is long. But every satyr gone and every spring cleansed is a step, and healing is mostly stubbornness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "c_default", text = "We are those of the Cenarion Circle, and friends of it, who came to Felwood to fight for it, kaldorei and tauren side by side. The forest doesn't ask which." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    seeds = {
      lines = { { id = "s_default", text = "Because the day one takes, I want to have been here. And because a druid who stops planting has already lost." } },
      choices = {
        { text = "Do you ever stop believing one will take?", tag = "Persuade", next = "seeds_doubt",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "DRUID", "PRIEST" } }, { trait = "kind" } } } },
          fail = { next = "seeds_hope", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    druid = {
      lines = { { id = "d_default", text = "Then you know why we stay. It doesn't hurt less with time; it only hurts more honestly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    seeds_doubt = {
      lines = {
        { id = "sd_default", text = "Most mornings, if I'm honest, and I've never said so inside the sanctuary. I plant the seed because my hands remember how to hope even when the rest of me has forgotten, and I've decided that has to be enough." },
      },
      choices = {
        { text = "It is enough.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then I'll plant one with you tomorrow.", next = "BACK", fx = { affinity = 3 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seeds_hope = {
      lines = {
        { id = "sh_default", text = "Never, traveler, and I'd thank you not to put the thought in my head. Felwood has enough poison in it already." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The forest tells the Circle a great deal, if we listen gently enough. Ask me about any of these." },
    },
    background = { { id = "tp_ba", text = "I'm a druid of the Circle, sent where the land hurts most, and Felwood hurts most.", next = "what" } },
    advice = { { id = "tp_ad", text = "Don't drink from the streams, don't eat the fruit, and don't trust anything that glows green." } },
    cenarion_circle = { { id = "tp_circle", text = "The Emerald Circle is the Cenarion Circle's hands in Felwood, and our hands are tired, but they're still working." } },
    _none = { { id = "tp_none", text = "I don't know, but the forest might, if you ask it gently." } },
  },
}

P:NPC {
  key = "greta", id = TODO_NPC("Greta Mosshoof"), name = "Greta Mosshoof",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "wary" }, values = { "protective", "wise" },
  notices = { "class", "race" },

  impression = {
    first = "Greta Mosshoof keeps a stone from Mulgore in her pocket for when the forest grows too loud. She is wary of anyone who might be tempted by the power here, and she says so.",
    third = "{name} met Greta Mosshoof of the Emerald Circle, who fights Felwood's corruption from the Emerald Sanctuary.",
  },

  greetings = {
    { id = "g_welcome", text = "The Emerald Circle welcomes you. Stay on the path, and don't touch anything that glows." },
    { id = "g_back", when = { metBefore = true }, text = "Still clean? Good; Felwood gets into people, so watch for it." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the same power that did this to the forest. I'll accept your help, but I'll be watching while I do." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Earth Mother, here in all this poison! She'd weep to see it, so help me dry her tears." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Safer, but not safe, because I hear the Shadow Council at Jaedenar tempts warriors with strength instead of knowledge, and some take it. They come back with green eyes and a bigger swing, and they stop being themselves soon after." } },
      choices = {
        { text = "I'll trust my own strength. The fel can keep its gifts.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If that strength beats the Council, maybe it's worth the price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Greta.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Made them hungry and angry and wrong, like the felpaw wolves who'll chase you to the edge of the sanctuary and then stand there snarling at the trees. I pity them, but I won't let one near the camp, and I'd ask you to do the same." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} close to you while you're in the forest. I've seen beasts turn after a single night of drinking from the wrong stream." },
      },
      choices = {
        { text = "I'll keep my beast close and leashed. Felwood demands care.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast runs free. If it turns, I'll deal with it then.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They do, and the elements are losing, which is the worst of it. The Shadow Council at Jaedenar drew fel up through the roots until the earth itself turned sour, and now even the fire in this forest burns green. A shaman who listens too closely here may find something other than the spirits listening back." } },
      choices = {
        { text = "I'll keep to the old ways and leave the fel alone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every power can be mastered, given the will. Even this one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only the satyrs, and they don't steal so much as spoil. When the Shadow Council were at Jaedenar, though, they sent creeping folk to watch every road, so I keep an ear open for footsteps that are softer than they ought to be." } },
      choices = {
        { text = "Better to watch the roads yourself, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good rogue would slip past you anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll make some noise next time.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Someone should, I suppose, and that is what the Emerald Circle does, with care and with prayers to the Earth Mother. What I fear is the scholar who studies it and grows fond of it, and I have heard of such scholars from Dalaran." } },
      choices = {
        { text = "Knowledge should serve the healing, nothing else.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Knowledge has no master. Whatever is learned is ours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll keep that warning in mind.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I think any power held too tightly can be turned, and the Shadow Council were once orcs who only wanted to win a war. I don't doubt your heart, paladin, but Jaedenar is full of people who never doubted theirs either." } },
      choices = {
        { text = "The Light asks for humility. I'll hold it gently, not tightly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is a tool, and I'll use whatever I need to win.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Demons, and the power that comes with them, which they poured into the ground at Jaedenar until the trees grew teeth. They thought themselves wise the whole while, so any priest who leans on shadow should look long at that place before calling it a tool." } },
      choices = {
        { text = "No power is worth what was done to this forest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is only as foul as the hand that holds it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I believe it can, but not quickly, and not by druids alone. The satyrs and the Shadow Council poisoned it on purpose, and they're still here, so we cleanse a grove and they foul the next one. Every seed you plant in clean soil is a small victory, and I've learned to be grateful for small ones." } },
      choices = {
        { text = "Then we plant, and keep planting. The land will answer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Strike at the Shadow Council first. Healing means little while they live.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Greta.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Jaedenar", min = 40 } },
          text = "Jaedenar is quieter than it was, and I know who's been walking into it. Mind what you saw down there, because the Shadow Council's tricks don't always show until later." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Good, steel is honest, and it can't be tempted by the fel the way a spell can, so you may be the safest visitor I've had all month." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Then you'll have seen what the fel does to the beasts here, and you'll understand why I keep my stone in my pocket." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here? Then you'll feel the fel in this place pulling at you, so mind you don't answer it; I've watched stronger spirits than yours bend." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You move very quietly for someone in a camp full of druids, rogue. Quiet is good in Felwood; the Deadwood furbolgs hear everything else." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Your kind and mine see the world differently, but we agree, I hope, that whatever the demons left in Felwood was not left for anyone to study." },
        { id = "h_default", key = true,
          text = "Greta Mosshoof, of the Emerald Circle. The satyrs and the Shadow Council made this forest what it is. I'd like to unmake it. Don't let the power here tempt you; it's what poisoned the land." },
        { id = "h_jaedenar", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Forces of Jaedenar") }, { questActive = TODO_QUEST("A Final Blow") } } },
          text = "Jaedenar belongs to the Shadow Council now, warlocks and demons, and worse beneath. Every one you put down gives the forest room to breathe." },
        { id = "h_water", when = { any = { { questActive = TODO_QUEST("Collection of the Corrupt Water") }, { questActive = TODO_QUEST("Seeking Spiritual Aid") } } },
          text = "The water carries the corruption downstream, into everything. A friend of mine, Islen Waterseer, may know how to cleanse it. Bring her what we gather." },
        { id = "h_cleansed", when = { questDone = TODO_QUEST("Cleansed Water Returns to Felwood") },
          text = "Clean water, back in Felwood, is a small thing, but it's how forests heal: one small thing, and then the next." },
        { id = "h_flames", when = { questActive = TODO_QUEST("Dousing the Flames of Protection") },
          text = "The Council's fires protect them. Put them out, and their walls come down with them." },
        { id = "h_watch", when = { metBefore = true },
          text = "I keep a stone from Mulgore in my pocket, and when the forest gets too loud, I hold it. It's quiet, the way stones should be." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin of the Alliance, with the Light shining off your armour. The Light is a power too, so I'll say to you what I say to everyone: don't let what's here tempt you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I'll be plain with you: I watch what every spellcaster reaches for in these woods, because the Shadow Council reached too, and Felwood is what they caught." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and here at the Sanctuary. Good; we need every pair of hands, and every one that can call the roots back to life is worth ten that only hold a sword." },
      },
      again = { { id = "h_again", text = "Yes? Ask, and I'll hold my stone while you do." } },
      choices = {
        { text = "Do the fel and the elements fight each other here, Greta?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who are the Shadow Council?", next = "council" },
        { text = "Tempt me? How?", next = "tempt" },
        { text = "Tell me about the stone.", next = "stone", when = { metBefore = true } },
        { text = "The power here doesn't frighten me.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Have you had trouble with thieves out here?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Shouldn't someone study the corruption to understand it?", next = "xmage", when = { class = "MAGE" } },
        { text = "What did the Shadow Council reach for, Greta?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is a warrior safer from Felwood's temptations, Greta?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What has the fel done to Felwood's beasts, Greta?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can Felwood truly be healed, Greta?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Do you truly think the Light could be turned to corruption?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Power's power, and I'll take what this forest offers.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Warlocks who serve the demons, the same kind who poisoned the orcs long ago. They've made Jaedenar their home. They like this forest the way it is." } },
      choices = {
        { text = "Why Jaedenar?", next = "council_why" },
        { text = "Then we change it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The forest suits them, so leave them to it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    council_why = {
      lines = { { id = "cw_default", text = "It was a kaldorei village once, and something lies beneath it that they want, though I don't know what. I know they dig, and that the digging makes the forest worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tempt = {
      big = true,
      lines = { { id = "t_default", text = "The fel here hums, and some feel it as strength. Take a little, and you'll fight better tomorrow; take a little more, and you'll fight for them the day after." } },
      choices = {
        { text = "I won't touch it.", next = "BACK", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Power is power. It's how you use it.", next = "BACK", fx = { align = { light = -2 }, affinity = -2 } },
      },
    },
    stone = {
      lines = { { id = "s_default", text = "It's from the plains near home, plain grey and a little warm, and it's never once tried to be anything it isn't. I find that restful, here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "w_default", text = "It should, since you know better than any of us what it costs. Mind your hands while you're here, warlock, because the forest is watching what you reach for." } },
      choices = {
        { text = "I'll reach for whatever serves me, druid.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll keep my hands to myself while I'm here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I'll speak only of what the Circle knows for certain, and these I know. Ask me, and stay on the path." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what any traveler might learn here, and I'll be watching while I do." },
    },
    background = { { id = "tp_ba", text = "I'm a daughter of Mulgore who followed the Circle north. Some days I think I'll go home, and then I see one clean spring, and I stay." } },
    advice = { { id = "tp_ad", text = "If something here offers you strength, ask what it wants back. It always wants something back.", next = "tempt" } },
    _none = { { id = "tp_none", text = "That's not something the Circle has spoken of, and better I say nothing than something wrong." } },
  },
}

P:NPC {
  key = "maybess", id = TODO_NPC("Maybess Riverbreeze"), name = "Maybess Riverbreeze",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "earnest" }, values = { "kind", "practical" },
  notices = { "craft" },

  impression = {
    first = "Maybess Riverbreeze believes the forest can be mended more than fought for, one salve at a time. She asks everyone to help and seems to mean everyone.",
    third = "{name} met Maybess Riverbreeze of the Emerald Circle, who asks the Horde to help heal Felwood.",
  },

  greetings = {
    { id = "g_hello", text = "The Earth Mother's blessing on you. Come and sit a moment; there's always more work than hands in Felwood." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Skinning", "Mining", "Enchanting" } },
      text = "You've a trade, and that's good, because the salve needs all kinds of hands: herbs, hides, ore, enchanting dust. Everyone can help heal this place." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not on its own, I think, but a mage knows magic better than most, and the corruption here is a kind of magic gone very wrong. If you can help me understand why the salves work on some plants and not on others, you'd be worth ten druids who only know how to hope." } },
      choices = {
        { text = "I'll study the corruption to help you mend it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd rather study it for its own sake.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The same way anyone can: one salve at a time, one plant at a time, one corrupted beast at a time. The Cenarion beacons show where the cleansing's needed, and I'll take any hand that will carry one, Horde or Alliance, because the forest doesn't care whose hand it is." } },
      choices = {
        { text = "Then I'll carry a beacon, whatever banner I fly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll mend what I can, but my own people come first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you'd think, because the corrupted plants fight back, and the things guarding the Irontree Caverns fight harder. You'll clear the way, I'll lay the salve, and between us we'll make one corner of Felwood a little greener." } },
      choices = {
        { text = "Then I'll follow your lead and guard the menders.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight where I please. The menders can keep up.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Maybess.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Where the beasts still graze, mostly, because they know better than we do which leaves are safe. Follow a deer that's still healthy and it'll lead you to the last clean patches in the forest, if you're patient and don't spook it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} might sniff them out faster than either of us. Animals know a sick plant from a clean one, even when I can't." },
      },
      choices = {
        { text = "I'll follow the deer gently and leave them in peace.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Easier to follow the deer, then have it for supper.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_mb = {
      lines = {
        { id = "smb_default", text = "Not these ones, I'm afraid. The elementals in Felwood are twisted by the corruption, the way the furbolgs are, and there isn't anything left in them to call kin. Ask your spirits, if you doubt me; I think they'll tell you the same." },
      },
      choices = {
        { text = "Then freeing them is a mercy. I'll do it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Twisted or not, they're kin. Find someone else.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "If you carry salve and gather blood amber like everyone else, yes, and gladly. The forest doesn't care whose hands mend it, only that they don't add more poison while they work, and I'll trust you to know the difference." } },
      choices = {
        { text = "I'll mend, then. The forest has suffered enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Healing's not my work. Burning the satyrs is.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "We'll see how I can help.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The corrupted creatures, mostly, because the sap and amber I need lie right beside them and the beasts don't like to share. I'd rather you slip in and slip out than fight your way through, since every fight here spills more poison into the ground." } },
      choices = {
        { text = "Slipping in quietly suits me fine.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face them openly and end it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll see what I can gather.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Salves for the sick beasts, clean water for the saplings, and patience for all of it, because the Jadefire satyrs can undo a week's work in a night. A priest's hands are steady ones, and I'd sooner have yours here than out hunting satyrs for their horns." } },
      choices = {
        { text = "Then I'll stay and mend for as long as I can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the satyrs choke on their own fel. That's quicker mending.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Patience, more than anything. The corrupted plants here can be cleansed if they're tended with care, and the Cenarion water we use is precious, so I'd rather you healed one grove slowly than burned through a whole season's supply in a day." } },
      choices = {
        { text = "Slow and careful, then. I'll tend each grove properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We haven't time to go slowly. The corruption is spreading.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Maybess.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! I hope you came to mend, friend, because Felwood's had enough magic thrown at it, and I'd much rather see you use yours to make something grow." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Good, because mending is what we do here, and your Light mends too, so you'll understand. Will you lend Felwood a hand while you're passing through?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! I know, I know, you came to fight, and I'm going to ask you to mend instead, but bear with me, because this forest needs both." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! Oh, you could help me so much, because you know how to find things that don't want to be found, and the cleanest plants in Felwood are the best hidden." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock of the Horde, here among the menders! I won't pretend that doesn't worry me a little, but I'll take any hands willing to help, and I mean that." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue! You've a light step, and I could use someone who can get close to things that would rather not be got close to, if you'll forgive me for saying so." },
        { id = "h_default", key = true,
          text = "Maybess Riverbreeze, of the Emerald Circle. I ask the Horde to help take Felwood back from the poison, not by fighting, mostly, but by mending." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing Felwood") },
          text = "Bring me blood amber, the sap of the Warpwood elementals in the Irontree Caverns to the north. They're beyond saving, and what I learn from them may save everything else." },
        { id = "h_trusted", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cleansing Felwood"), days = 3 } },
          text = "I trust you now, friend, and I don't say that lightly in this forest. Take a Cenarion beacon, and let's begin on the plants." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You'll want Arathandris, to the south, who does for the Alliance what I do for the Horde. It's the same forest, and the same work." },
        { id = "h_daily", when = { metBefore = true },
          text = "Every day a little salve, and every day a little less poison. I'll not live to see it all clean, but somebody will." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Good, because mending is what we do here, and you'll understand that better than most. Will you lend Felwood a hand while you're passing through?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of the Earth Mother, here to mend Felwood. You're very welcome at the Sanctuary, and the Emerald Circle has work enough for you to last a season." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask while my hands are busy; they work better when I'm talking." },
      },
      choices = {
        { text = "How do you mend a forest?", next = "mend" },
        { text = "Why must I kill elementals to earn your trust?", next = "trust" },
        { text = "What is the Emerald Circle?", next = "circle" },
        { text = "What was Felwood before?", next = "past" },
        { text = "I'm an herbalist. What should I look for?", next = "herb", when = { profession = "Herbalism" } },
        { text = "I'm Alliance. Can I still help?", next = "alliance", when = { faction = "Alliance" } },
        { text = "The alchemist at Bloodvenom wants the corruption.", next = "winna", when = { heardLine = "winna.h_default" } },
        { text = "Would you really let a warlock help the cleansing?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do you need someone to get close to?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What does Felwood need mending most, Maybess?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What use is a warrior in mending a forest?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Where would I find clean plants in Felwood?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What does the Emerald Circle need most from me?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I'll help mend it.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Must I kill elementals? The spirits are my kin.", next = "shaman_mb", when = { class = "SHAMAN" } },
        { text = "How can a paladin help mend Felwood, Maybess?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can a mage's magic truly heal a forest, Maybess?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'm here for what I can take, not to mend.", next = "END", fx = { align = { light = -1 } } },
      },
    },

    mend = {
      lines = {
        { id = "m_default", text = "With a salve the Cenarion Circle taught us, laid on the corrupted plants one by one. Some of them come back from it, and every one that does is a little root of the old forest taking hold again." },
      },
      choices = {
        { text = "How do you find the sick ones?", next = "mend_beacon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mend_beacon = {
      lines = {
        { id = "mb_default", text = "A Cenarion beacon shows you the taint the naked eye misses, the fel creep in the herbs and the sickness in the soil. I can make the salve from many things, so whatever your trade is, there's a way for you to help." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },

    trust = {
      big = true,
      lines = {
        { id = "t_default", text = "Because what I know about cleansing this forest would be a terrible weapon in the wrong hands, and I can't give it to just anyone who asks kindly. It seems odd, I know, that killing proves you'll help me heal." },
      },
      choices = {
        { text = "It does seem odd.", next = "trust_odd" },
        { text = "I understand.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    trust_odd = {
      lines = {
        { id = "to_default", text = "The Warpwood elementals are past any saving, and their sap may teach me how to save everything that isn't. When so many lives hang on it, I've decided the end has to justify the means, and I pray to the Earth Mother that I'm right." },
      },
      choices = {
        { text = "I think you are.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'm not so sure.", next = "BACK", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
      },
    },

    circle = {
      lines = {
        { id = "c_default", text = "Those of us here at the sanctuary who answer to the Cenarion Circle, tauren and night elves both. We came to learn what's poisoning Felwood and to stop it, and the stopping is slower than the learning." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },

    past = {
      lines = {
        { id = "p_default", text = "A green and peaceful forest, north of Ashenvale, before the demons came in the last war and twisted everything that grew here. The bears and the treants you see out there were whole once, and some part of them remembers it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    herb = {
      lines = {
        { id = "h2_default", text = "The fel creep, which clings to the herbs here like black moss. With the beacon you'll see it, and if you bring it to me I can purify it into the salve itself." },
      },
      choices = { { text = "I'll gather it.", next = "BACK", fx = { affinity = 2 } } },
    },
    alliance = {
      lines = {
        { id = "a_default", text = "Of course, though not from my hands; our peoples aren't ready for that, and I won't pretend otherwise. Arathandris to the south makes the same salve, and the plants won't care whose banner you fly." },
      },
      choices = { { text = "Thank you, Maybess.", next = "BACK", fx = { affinity = 1, opinion = { peace = "for" } } } },
    },
    winna = {
      lines = {
        { id = "w_default", text = "I've heard of her, and of the moonwell she wants water from. It grieves me that anyone of the Horde would look at this poison and see a tool, but I can't mend her, only the forest." },
      },
      choices = {
        { text = "She's helping the Horde, in her way.", next = "BACK", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "I'll keep my distance from her.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A tauren of the Emerald Circle, who came to Felwood to heal what she could. I'll leave when it's healed, or when I'm too old to carry the salve." } },
    advice = { { id = "tp_ad", text = "Don't drink from any stream in Felwood, however clear it looks. The poison here is patient, and it doesn't always show itself." } },
    _none = { { id = "tp_none", text = "I only know the forest, and only this bit of it." } },
  },
}

P:NPC {
  key = "arathandris", id = TODO_NPC("Arathandris Silversky"), name = "Arathandris Silversky",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "determined" }, values = { "protective", "devout" },
  notices = { "craft" },

  impression = {
    first = "Arathandris Silversky spent a whole morning watching a single clean flower by the road. Her patience is the fighting kind, and she says the curse is no more stubborn than she is.",
    third = "{name} met Arathandris Silversky of the Emerald Circle, who asks the Alliance to help cleanse Felwood.",
  },

  greetings = {
    { id = "g_hello", text = "These woods were beautiful, once. Help me make them so again." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Herbalism", "Skinning", "Mining", "Enchanting" } },
      text = "Your trade can heal, here, because the salve needs what you gather, and Felwood will thank you, in its slow way." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because it's proof, and proof is precious in Felwood. The curse is stubborn, and so am I, and I'll not stop until every flower in this forest is clean, but a mage might see the corruption in a way that a druid can't, and I'd welcome that, if you're patient enough to look." } },
      choices = {
        { text = "I'll look, and help you find the source.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Patience won't cure this. Bold magic might.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because cleansing is like a long stalk, waiting for the moment the plant is ready and not a moment before. Most of the Alliance's soldiers want it finished in an afternoon, but a hunter knows that some prey takes days." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} may help, I think. The plants here seem to grow a little cleaner where something healthy has walked, though I can't prove it." },
      },
      choices = {
        { text = "Then I'll be patient and do it properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Patience is fine, but I'd rather burn the sick plants and start again.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_ar = {
      lines = {
        { id = "war_default", text = "So would I, most days, and there's plenty in Felwood you can hit. But a warrior who only knows how to win a fight will lose this forest, because there's nothing here to defeat, only something to outlast." },
      },
      choices = {
        { text = "Then I'll outlast it. Patience is a weapon.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Show me what to hit. I'll leave the patience to you.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It goes down to the roots and the water both, which is why salves and seeds take so long. My people would say Elune's light has gone out of this place, and yours would say the spirits are sick, and I think we're describing the same wound from opposite sides. That's as near as I'll come to agreeing with the Horde today." } },
      choices = {
        { text = "The spirits don't care about banners, and neither do I.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "My place is with the Horde, and I'll mend from there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Circle is not Stormwind, and this forest is the reason why. I will work beside you, and I will thank you for the work, but I watched the Shadow Council turn Jaedenar into a nest of demons, and I cannot forget it on your account." } },
      choices = {
        { text = "I don't blame you. I'll keep my demon away.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Circle has no right to judge me.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Let's just get the work done.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I have seen SI:7's sort in Talonbranch Glade from time to time, though they never say so and I never ask. Their business is the Shadow Council and the Horde, I suppose, and mine is the land, which is slower work but more honest." } },
      choices = {
        { text = "Your work is the more honest of the two.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spies keep the Alliance alive. Honesty doesn't.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I wouldn't know anything about that.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Tired, mostly, because the work is slow and the poison never sleeps, and Jaedenar's fires light the sky to the south every night. They won't complain to me, but they might talk to a priest, and I would count that a kindness." } },
      choices = {
        { text = "I'll sit with them a while. Healing isn't only for wounds.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tired hands still work. They can rest when the forest's clean.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than you'd think, because the corrupted things here don't like the Light, and my salve-bearers need someone at their backs on the road. The cleansing is slow and dull, though, and I've seen braver souls than you grow bored of it." } },
      choices = {
        { text = "Slow work done right is worth it. I'll stand guard.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather strike at Jaedenar than guard flowerbeds.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The curse is older than your Horde and my Alliance both, and it will happily outlast our quarrels if we let it. I'll take any honest help, though I'll be watching the shadow in you as closely as I watch the shadow in these trees." } },
      choices = {
        { text = "Watch all you like. My help is honest.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll help where it profits the Horde, and nowhere else.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Slowly, and only if we are stubborn. The demons and their servants poured fel into this land for a reason, and the felwood itself remembers the taint, so we cleanse a patch at a time and guard it fiercely. I have outlasted worse hopes than this one, and I mean to outlast this too." } },
      choices = {
        { text = "Then we'll be stubborn together. Felwood will be green again.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some ground is too far gone. Wall it off and save the rest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Arathandris.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. I spent a morning watching one clean flower by the road, and I'd wager you've spent mornings watching stranger things, so perhaps we're more alike than we look." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter of the Alliance! Then you have patience, which is the one thing the curse can't take from us, and the thing it tests hardest." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A Horde shaman. I'll say plainly that it's the Alliance I ask for help, but I won't pretend your kind don't know the land's voice, so speak." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock of the Alliance, and in my camp. Stormwind permits your kind, I know, but I will be honest with you: I would rather you left your demon outside the sanctuary." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Patient, quiet and careful, that is the sort of help a cleansing needs, and a rogue is all three when it suits them. I hope it suits you today." },
        { id = "h_default", key = true,
          text = "Arathandris Silversky, of the Emerald Circle. I ask the Alliance to help me cleanse Felwood, and the curse is old and stubborn, but so am I." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing Felwood") },
          text = "The salve is laid on the sick plants a little each day. It doesn't look like war, but it's harder than war." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Maybess, to the north of here, works with the Horde, so go to her; the forest doesn't care who heals it." },
        { id = "h_daily", when = { metBefore = true },
          text = "One of the plants by the road flowered yesterday, clean, a small white flower, and I've been watching it all morning." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance, at last! The salve does its work on the plants, but the people who lay it need tending too, and they rarely ask." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I asked the Alliance for help cleansing Felwood and expected archers, so forgive me if I stare a little at all that plate." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Maybess works with your people, to the north, but the curse doesn't care whose prayers it hears, so I'll hear you out." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle, come to Felwood. The curse here is older than you are, sister or brother, but it is not older than the forest, and the forest remembers being green." },
      },
      again = { { id = "h_again", text = "Something else? Mind the flower, though." } },
      choices = {
        { text = "Does the curse here go deeper than the trees?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why is it harder than war?", next = "harder" },
        { text = "Tell me about the flower.", next = "flower", when = { metBefore = true } },
        { text = "Do you work with Maybess?", next = "maybess" },
        { text = "I've some herb lore.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "Stormwind's laws allow warlocks. Why shouldn't the Circle?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Alliance send its spies into Felwood?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you accept a Horde priest's help against the curse?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a hunter make a good cleanser, Arathandris?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can the corruption be undone, Arathandris?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'll help cleanse it.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather fight something I can hit.", next = "warrior_ar", when = { class = "WARRIOR" } },
        { text = "How are your people holding up against the curse?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can a paladin be of use in cleansing work?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why watch a single flower for a whole morning, Arathandris?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'll leave the salving to you, because it isn't my fight.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    harder = {
      lines = { { id = "h2_default", text = "In war you win or lose and it's over. Here you do the same small thing every day, and most days nothing changes. You have to keep believing anyway." } },
      choices = {
        { text = "How do you keep believing?", next = "harder_how" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    harder_how = {
      lines = { { id = "hh_default", text = "I don't, every day, and on the days I don't, I put the salve on anyway. Belief catches up eventually, because hands are more reliable than hearts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flower = {
      lines = { { id = "f_default", text = "It's still there, and still white. A satyr walked past it this morning and didn't notice, and I've never wanted anything so badly to stay unnoticed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maybess = {
      lines = { { id = "m_default", text = "Not side by side; our people won't allow it yet. But we use the same salve, and we leave each other notes by the road. The forest gets both of us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Then pick nothing here that looks too healthy, because in Felwood the bright ones are the sick ones, and the dull grey ones might be getting better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know the curse well, and a few other things besides. Ask me about any of these." },
    },
    background = { { id = "tp_ba", text = "Kaldorei, Emerald Circle, and too stubborn to be told a forest can't be saved." } },
    advice = { { id = "tp_ad", text = "Do one good thing a day here, only one, and then do it again tomorrow, because that's how this works.", next = "harder" } },
    cenarion_circle = { { id = "tp_circle", text = "We are the Circle's in this forest, where few others would come." } },
    _none = { { id = "tp_none", text = "That I don't know, though the curse I know." } },
  },
}
