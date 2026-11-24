-- Thorium Point's two flight masters (0.39.0): an Ironforge dwarf and an orc, both guests of the
-- Thorium Brotherhood. Voice: bibles/searinggorge.md ("Thorium Point's flight masters")
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "lanie_reed", id = TODO_NPC("Lanie Reed"), name = "Lanie Reed", title = "Gryphon Master",
  bible = "bibles/searinggorge.md", role = "flightmaster", tier = "service",
  communities = { "thorium_point" }, temper = { "wry" }, values = { "dutiful", "careful" },
  notices = { "race", "lock_pact" },

  impression = {
    first = "Living as a guest among Dark Irons still sits strangely with her.",
    third = "{name} met Lanie Reed, the dwarf gryphon master at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Need a bird out of the Gorge, {g:lad|lass}? Wise, because there's more ash than air in this place, and the gryphons cough all night and spit black on my boots in the morning." },
    { id = "g_horde", when = { faction = "Horde" }, text = "My birds fly for the Alliance, friend, and nae other. Your orc is just over there with the wind riders, and she'll see ye right." },
    { id = "g_away", when = { away = 14, faction = "Alliance" }, text = "You've been gone {away}, and the gryphons have been coughing ash the whole time. They'll be glad of a flight out with you." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard face! I'm glad of it, friend; you'd not believe how strange it is to wake every morning surrounded by Dark Irons who mean you no harm." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "Ye're runnin' hotter than the Gorge itself, an' that's an imp's blood pact or I'm a gnome. The birds are used tae heat, mind, so climb on an' dinnae fret." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It's a close race, by my beard. The Dark Irons called up fire and it burned half their own kingdom, so I keep a close eye on anyone who talks to the elements, even one of ours." } },
      choices = {
        { text = "Ironforge's law keeps me honest, whatever the spirits say.", next = "BACK", reply = "Aye, that's the answer I hoped for, and Ironforge will be glad of you. Fly safe out of this soot.", fx = { align = { order = 1 } } },
        { text = "The elements answer to no king, and neither will I.", next = "BACK", reply = "That's what Thaurissan's sorcerers told themselves, {g:lad|lass}, and look what's left of their kingdom. Mind yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Welcome is a strong word, but you'd not be thrown off the cliff, which is more than our grandfathers would have said. Our clans have been at each other since the War of the Three Hammers, and I still flinch at the soot on their beards, but these ones turned their backs on the mountain, and I give them their due." } },
      choices = {
        { text = "Old wars should stay old. These Dark Irons earned a chance.", next = "BACK", reply = "Aye, that's what I keep telling myself on the bad nights. They've earned that much, by my reckoning.", fx = { align = { light = 1 } } },
        { text = "A Dark Iron's a Dark Iron. I'll keep my hand near my sword.", next = "BACK", reply = "Keep it near if you must, but keep it sheathed, or you'll have Oilfist to answer to. They've been good hosts.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Poorly, though they'll never admit it, for they're mountain birds and this place is all ash and sulfur. I water them twice as often as I would in Ironforge, and they still fly out faster than they fly in." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Poorly, though they'll never admit it, for they're mountain birds and this place is all ash and sulfur. I water them twice as often as I would in Ironforge, and they still fly out faster than they fly in. And {pet} looks hot and bothered too, poor thing, so give it a drink before you go." },
      },
      choices = {
        { text = "A beast in pain should be cared for, whatever the cost.", next = "BACK", reply = "Aye, and I'd spend my last silver on them before I'd see them suffer. They're good birds.", fx = { align = { light = 1 } } },
        { text = "They'll toughen up. A beast adapts or it doesn't.", next = "BACK", reply = "Toughen up in sulfur? Their lungs don't care how tough they are, so I'll keep watering them twice over and brushing out the ash.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They hate the heat and they hate the ash, and most of all they hate the fire elementals that rise off the slag heaps like sparks off a forge. I can't say I blame them." } },
      choices = {
        { text = "Then don't ask more of them than you must.", next = "BACK", reply = "I don't, and I won't, so long as I'm their keeper. They've earned their rest.", fx = { align = { light = 1 } } },
        { text = "A gryphon goes where it's needed, heat or no.", next = "BACK", reply = "Aye, and they go, but they go grumbling, and I don't blame them. Neither would you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a teleport takes you home and nowhere else, and my gryphons will carry you to Morgan's Vigil, which your spell can't. Besides, the birds like a passenger who doesn't smell of slag, and you smell of library." } },
      choices = {
        { text = "Old ways are good ways. I'll fly.", next = "BACK", reply = "Good, and the birds will be glad of the company. Morgan's Vigil it is, then.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spells are faster. Your birds are a luxury.", next = "BACK", reply = "A luxury that'll carry you over the Burning Steppes, which your spell won't. Suit yourself, friend.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Brotherhood swear they don't, and Oilfist would skin anyone who did, but I seal every letter twice all the same. A Bronzebeard living among Dark Irons learns to trust slowly, and to keep a knife in her boot." } },
      choices = {
        { text = "Trust them, Lanie. They broke with the mountain.", next = "BACK", reply = "I do, mostly, but the knife stays in my boot. My grandmother would rise from her cairn if I took it out.", fx = { align = { light = 1 } } },
        { text = "Keep the knife. Old enemies stay enemies.", next = "BACK", reply = "Aye, they might, and they might not. I'll keep watching and keep the knife where it is.", fx = { align = { light = -1 } } },
        { text = "Something else, Lanie.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Harder than I'd like to say out loud, friend. I was raised on tales of Dark Iron sorcerers and the Firelord's fire, and some nights I lie awake listening to their forges, but they've never once done me wrong, and I think the Light asks me to judge them by that." } },
      choices = {
        { text = "Judge them by their deeds, Lanie, not their grandfathers'.", next = "BACK", reply = "That's the Light's way, and it's what I tell myself when their forges keep me up at night. Thank you, friend.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Old blood runs true. Keep watching them closely.", next = "BACK", reply = "I will, friend, but I'll judge them on their deeds as well. It's only fair.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They're polite to everyone, which isn't the same as trust, and a knight of the Light reminds them of every Bronzebeard who ever marched on Blackrock. Be civil, mind your tongue around Oilfist, and remember that each of them walked away from Thaurissan with nothing but their hands." } },
      choices = {
        { text = "They broke free. That earns my respect, Lanie.", next = "BACK", reply = "Good, and they'll notice it, even if they never say so. Mind Oilfist, all the same.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Broken chains or not, I'll keep an eye on them.", next = "BACK", reply = "Keep watch, then, but keep your hammer down. These ones have done nothing to earn it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Only the young ones, and only once, because they learn soon enough that you smell much the same as the rest of this place. The old birds have flown through so much sulfur that a little brimstone hardly turns their heads anymore, which I find both sad and useful." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Only the young ones, and only once, because they learn soon enough that you smell much the same as the rest of this place. Even with your demon standing right below the roost, the old birds barely lift their heads, which I find both sad and useful." },
      },
      choices = {
        { text = "I'll keep what travels with me away from the young ones.", next = "BACK", reply = "They'll thank you for it, though they'll not say so. Mind their feathers.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the old birds don't mind, then neither do I.", next = "BACK", reply = "That's the sad and useful part, aye. Up you get, then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_lr_fall = {
      lines = {
        { id = "dd_lr_fall1", text = "Treacherous is kind. The heat cracks the stone from underneath, so a ledge that held a dwarf yesterday drops a gnome today. My birds can feel the hot air rising off the cliffs and ride it, which is more than any of us can say." },
      },
      choices = {
        { text = "Then I'll leave the cliffs to your gryphons.", next = "BACK", reply = "They'll be glad of the company. I'll have one saddled whenever you want it.", fx = { align = { order = 1 } } },
        { text = "I'll climb anyway. I like seeing the Gorge myself.", next = "BACK", reply = "Brave, and a little daft. Wave to me from the ledge, so I know where to send the search.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Keep whatever's at your heel on the ground, please, because a gryphon in the Gorge has enough to worry about with fire elementals and doesn't need a passenger that smells of brimstone." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll be glad of a gryphon here, I'd wager, because there's nothing in the Gorge a knight can charge that doesn't either bite back or burst into flames." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light, and a fellow Alliance face besides! Thorium Point's a long way from the Cathedral, so if you've a blessing to spare, my birds and I won't turn it down." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. If you're here to read the letters my birds carry, they're sealed, they're dull, and the birds bite." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, flying? Most of your lot teleport off to Ironforge or Stormwind in a flash of light, and leave my birds wondering what they did wrong." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID" },
          text = "A night elf druid! The gryphons don't trust the Gorge any more than you would, and they'll fly you out of here gladly, back to where things still grow." },
        { id = "h_default", key = true,
          text = "Lanie Reed, gryphon master for the Alliance here at Thorium Point. My birds fly to Ironforge and to Morgan's Vigil in the Burning Steppes, and anywhere else the Alliance has a roost, and they're glad to leave every time." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Keep your hand off that hilt while you're at the Point, because the Dark Irons here are friends, or near enough, and they notice these things." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! My gryphons are restless round strange beasts, so if you've one with you, keep it close and don't let it eye the birds like supper." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A Bronzebeard shaman, at a Dark Iron camp. I thought I'd seen every odd thing Thorium Point had to offer, and then you walked up the path." },
        { id = "dd_fall", when = { deathCause = "falling" },
          text = "You came off one of the Gorge's ledges, didn't you? It happens to everyone who tries to walk where my birds fly, and the rock out there is loose as ash." },
      },
      again = {
        { id = "h_again", text = "What else, {g:lad|lass}? The birds are getting twitchy in this smoke, and so am I." },
        { id = "h_again2", text = "Go on, ask. I've nowhere to be but here." },
      },
      choices = {
        { text = "I did fall, yes. The ledges here are treacherous.", next = "dd_lr_fall", when = { deathCause = "falling" } },
        { text = "Do the gryphons hate the Gorge?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "A Bronzebeard among Dark Irons?", next = "brotherhood" },
        { text = "How do the gryphons stand the Gorge?", next = "ash" },
        { text = "Why fly when I could teleport home, Lanie?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd wager the Dark Irons here would read the odd letter.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is it hard, keeping faith among Dark Irons?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would they welcome a Bronzebeard warrior here?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Your gryphons look miserable in this heat.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How do the Dark Irons here take to a paladin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your gryphons balk at carrying someone like me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Who's stranger here, a dwarf shaman or a Dark Iron ally?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "Aye, and I'll not pretend it was easy. My grandfather told me stories about Dark Irons that would curl your beard, but the Thorium Brotherhood walked away from Thaurissan and his master, and they've treated me fair." },
        { id = "b_dwarf", when = { race = "Dwarf" }, text = "You'll know the stories as well as I do, the ones about the War of the Three Hammers. But the Thorium Brotherhood walked away from Thaurissan and his fire master, and they've treated me fairer than some of our own." } },
      choices = {
        { text = "Trusting Dark Irons seems a hard thing to do.", next = "brotherhood_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood_trust = {
      lines = { { id = "bt_default", text = "I trust them to keep their word, because they keep it to each other, and they've not broken it to me yet. I'll not say I'd turn my back on all of them, but I'd say the same of a Stormwind tavern." } },
      choices = {
        { text = "People can change. They've proved it.", next = "BACK", reply = "They have, and here I am, sleeping among them every night with my throat uncut. That's proof enough for me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Changed or not, they're still Dark Irons.", next = "BACK", reply = "That's what my grandfather said, and he never met these ones. I'll judge them myself.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ash = {
      lines = { { id = "a_default", text = "Poorly. The ash gets into their feathers and their lungs, so I brush them out every night and keep them out of the wind when the volcano's grumbling. They fly high over the Gorge, too, well above the smoke and the fire elementals." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep gryphons, and Ironforge sent me where they were needed, though I'd trade this ash for a mug of Thunderbrew in a heartbeat. That's the long and the short of it." } },
    advice = { { id = "tp_ad", text = "Tie a wet cloth over your face if you're walking the Gorge for long. Your lungs will thank you." } },
    magni = {
      { id = "tp_magni", text = "King Magni sent me to keep gryphons among Dark Irons, an' I've done it. I'd like to know what he was thinkin', but I don't ask." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Ye'll know what it's like, then, to stand among the Dark Irons an' bite yer tongue. The king says peace is worth it, an' I'm tryin' to believe him." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "The Thorium Brotherhood are decent enough, for Dark Irons, but I sleep wi' one eye open. Old habits." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer taught me to fly, though I'm Bronzebeard born. They'd laugh at me keepin' gryphons in a place like this." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, friend. Ask one of the Brotherhood, for they know this stone better than I ever will." } },
  },
}

P:NPC {
  key = "grisha", id = TODO_NPC("Grisha"), name = "Grisha", title = "Wind Rider Master",
  bible = "bibles/searinggorge.md", role = "flightmaster", tier = "service",
  communities = { "thorium_point" }, temper = { "gruff" }, values = { "dutiful", "careful" },
  notices = { "race", "lock_soulstone" },

  impression = {
    first = "She is wary of every dwarf and openly fond of her beasts.",
    third = "{name} met Grisha, the orc wind rider master at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "The wind riders are fed and ready, {class}. Where are you going, and how fast do you want to get there?" },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "No wind riders for the Alliance, not while I hold this perch for the Horde. The dwarf with the gryphons is over there, if you want a bird." },
    { id = "g_away", when = { away = 14, faction = "Horde" }, text = "Back after {away} away, then. The wind riders still know your smell, so climb on whenever you're ready." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}. Good to see another orc face among all these dwarves; it gets lonely being the only one of us in camp." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Someone has bound your soul in a stone; I can smell the warlock's work on you. In the old Horde the warlocks bound souls for their own use and called it a gift, so I hope yours was given by a friend." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Politely, which they do to everyone, and warily, which they do to me. The Brotherhood remembers Bronzebeard paladins marching on their mountain, and you wear the same Light, so don't be surprised if they count your swings." } },
      choices = {
        { text = "Mercy suits the Light. They broke their chains.", next = "BACK", reply = "They did, and they'll remember a paladin who sees it. Mind your swings all the same.", fx = { align = { light = 1 } } },
        { text = "Free or not, they're Dark Irons. I'll keep my guard up.", next = "BACK", reply = "Then they'll count your swings twice over, paladin. Don't give them a reason to.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I trust them as far as my wind riders could throw them, which isn't far, but they keep their word and they've never once cheated me. A warrior learns to judge a fighter by what they do, not by who their grandfather served, and these ones have done well enough." } },
      choices = {
        { text = "Judge them by their deeds. That's only fair.", next = "BACK", reply = "That's the orc way. We were judged by our blood long enough behind the camp fences.", fx = { align = { light = 1 } } },
        { text = "Dwarves are dwarves. I'll keep my axe ready.", next = "BACK", reply = "Keep it ready, but keep it on your back. They've done nothing to earn it, yet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They hate it, all smoke and fire and no clean wind, so I fly them out early in the day before the heat comes up off the Cauldron. They're tough beasts, but they weren't made for this place, and neither was I." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They hate it, all smoke and fire and no clean wind, so I fly them out early in the day before the heat comes up off the Cauldron. They're tough beasts, but they weren't made for this place, and neither was I. Your {pet} looks like it's handling the heat better than my riders, so whatever you're feeding it, keep on doing it." },
      },
      choices = {
        { text = "A strict routine keeps a beast healthy anywhere.", next = "BACK", reply = "That's what keeps mine alive in this pit. Early wings, home by noon.", fx = { align = { order = 1 } } },
        { text = "Let them fly when they want. A beast knows best.", next = "BACK", reply = "Then they'd never leave the roost, in this heat. I'll keep my routine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Better than the gryphons, but only because they're too stubborn to complain. The ash gets in their wings and the heat makes them cross, and I spend my evenings picking cinders out of their manes." } },
      choices = {
        { text = "They serve the Horde. A little ash won't stop them.", next = "BACK", reply = "They do, and they'll serve until the ash chokes them. I'll keep picking the cinders out.", fx = { align = { order = 1 } } },
        { text = "Beasts shouldn't be kept somewhere this foul.", next = "BACK", reply = "Maybe not, but the Horde needs the route, and I go where I'm sent. So do they.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They mind the smell of the arcane, which they say is like lightning that never lands, but they carry you all the same. Watch what you buy from the dwarves while you're here, mage, because some of their enchantments were first made for Ragnaros." } },
      choices = {
        { text = "Power is power, whoever forged it first.", next = "BACK", reply = "Then you'll carry Ragnaros's work home on your back, mage. Mind what it whispers.", fx = { align = { light = -1 } } },
        { text = "Nothing made for Ragnaros belongs in Horde hands.", next = "BACK", reply = "Good, that's a mage with sense. The Warchief would agree with you.", fx = { align = { light = 1 } } },
        { text = "Something else, Grisha.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Wind riders came to us in Kalimdor, after the old days, and they never learned to love the fel the way the old Horde did. Some of my grunts haven't forgiven the warlocks either, and I'd not ask them to." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Wind riders came to us in Kalimdor, after the old days, and they never learned to love the fel the way the old Horde did. They've pinned their ears back at your demon, and so have my grunts, and I'll not ask either of them to forgive it, because I remember the blood too." },
      },
      choices = {
        { text = "That power is a tool, and the Horde will need it again.", next = "BACK", reply = "It might, but my grunts won't thank you for saying so. Keep it far from my riders.", fx = { align = { light = -1 } } },
        { text = "The old warlocks earned that hatred. I'll do better.", next = "BACK", reply = "Then do better, and they'll see it. Deeds, not words.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "As closely as I watch them, which is very closely, because each of them swears he left the mountain behind and none of us can prove it. They trade fair and keep their word, so far, but I sleep with my axe by the bed and I'd advise you to do the same." } },
      choices = {
        { text = "They've kept their word. That should count, Grisha.", next = "BACK", reply = "It does, and I'll not forget it. But my axe stays by the bed.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll watch them too, and trust none of them.", next = "BACK", reply = "Good. Two pairs of eyes are better than one, and mine get tired by nightfall.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More than I'd like, since the fire elementals throw flame at anything in the air and the Dark Iron watchtowers throw everything else. I patch them up as best I can, and if you'd lay a hand on the worst of them before you fly, I'd count it a kindness." } },
      choices = {
        { text = "I'll tend your riders gladly before I go, Grisha.", next = "BACK", reply = "My thanks, and theirs too, though they'll only snort. The worst is the grey on the end.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Beasts heal on their own, Grisha. I'll save my prayers.", next = "BACK", reply = "They heal slowly, priest, and slow gets them killed up here. Suit yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Heat off the Cauldron, ash off Blackrock and the fire spirits the Dark Irons keep stirring up, all of it churning together until a wind rider can't find a straight line through. I've lost no riders yet, but I've lost plenty of sleep, and I'd give a week's pay for one calm crossing." } },
      choices = {
        { text = "Keep flying the routes, Grisha. The Horde relies on them.", next = "BACK", reply = "I will, as long as I've a rider left to fly them. Lok'tar, friend.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ground the riders on bad days, Grisha. They come first.", next = "BACK", reply = "I do, more often than the Horde knows. Thank you for saying it aloud.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman. The air over the Gorge is angry and my riders feel it in their wings, so if you can make it behave, you'll be the most popular passenger I've ever had." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because the riders come back from the Cauldron singed and limping, and I can only bandage so much before I run out of linen." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. The Dark Irons here keep their doors locked and their eyes open, so whatever you're planning, don't plan it near my perch." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Keep whatever you've brought on the far side of the perch, because my riders have long memories and short tempers, and they don't like your sort's pets." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. You could teleport home and leave my riders idle, but you came to me, so I'll take it as a compliment." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" },
          text = "A tauren druid at Thorium Point. My wind riders will sniff you over, because you smell of grass and they haven't had that in a while." },
        { id = "h_default", key = true,
          text = "I am Grisha, wind rider master for the Horde at Thorium Point, and the only orc fool enough to sleep among Dark Irons. My beasts fly to Kargath in the Badlands and to Flame Crest in the Burning Steppes, and from there anywhere you like." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Keep your axe on your back while you're here, because the dwarves have long memories and short tempers, and a dead rider pays no fare." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll understand my beasts, then, and why I won't let anyone near them who doesn't know how to treat an animal." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The dwarves around here will stare at you twice, once for the Light and once for the rot, so let them stare and keep your hand off your hammer." },
      },
      again = {
        { id = "h_again", text = "What else? The riders smell the lava and they want to be gone." },
        { id = "h_again2", text = "Speak, then. I'm listening, and an orc doesn't ask twice." },
      },
      choices = {
        { text = "How do the wind riders fare in the Gorge?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How do you feel about the dwarves here?", next = "dwarves" },
        { text = "Do you get along with the gryphon master?", next = "lanie" },
        { text = "Do your riders mind carrying a mage?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do your riders glare at me like that?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you trust the Dark Irons here, Grisha?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Your wind riders must hate this place.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the Dark Irons keep a close eye on the Horde?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do your riders get hurt much over the Gorge?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why is the air over the Gorge so angry?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "How do the dwarves here treat a Forsaken paladin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "The Brotherhood keeps to their forges and I keep to my riders, and nobody makes trouble. I still watch them, because their kin inside Blackrock Mountain are at war with orcs as we speak." } },
      choices = {
        { text = "Which orcs are they fighting?", next = "dwarves_past" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves_past = {
      lines = { { id = "dp_default", text = "The Blackrock clan, up in the Spire, while the Dark Irons hold the Depths below them, and neither side cares who gets caught in between. They're no friends of Thrall's, but they're orcs, and the Dark Irons won't ask which clan you belong to. The Brotherhood isn't them, but they came from the same place, and I remember that." } },
      choices = {
        { text = "Careful's the right way to be up here.", next = "BACK", reply = "It is, and it's kept me breathing here. Mind the Spire.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You should give them a chance.", next = "BACK", reply = "I have, and they've earned some of it. But I'll keep my axe close.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lanie = {
      lines = { { id = "l_default", text = "We don't talk much. She keeps her birds clean and I keep my riders clean, and the Brotherhood made it clear there'd be no fighting here, so there isn't." },
        { id = "l_dwarf", when = { race = "Dwarf" }, text = "Your kinswoman keeps her birds well, I'll give her that. We don't talk much, and the Brotherhood made it clear there'd be no fighting here, which suits us both." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I fly wind riders for the Horde. What I did before that, behind the camp fences and after, is my own business." } },
    advice = { { id = "tp_ad", text = "Don't walk down into the Gorge without a reason. The Dark Irons down there aren't the friendly kind." } },
    thrall = { { id = "tp_thrall", text = "The Warchief sends us where we're needed, and I'm needed here, among dwarves. I don't understand why, but I don't ask." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are dwarves, and dwarves are dwarves. I watch them all the same, whatever they call themselves." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Blackrock in the Spire are what the Horde used to be, and the Warchief means to make sure we never go back. I'd like to help." } },
    _none = { { id = "tp_none", text = "I don't know it. Ask the dwarves, and bring earplugs, because they never stop at one story." } },
  },
}
