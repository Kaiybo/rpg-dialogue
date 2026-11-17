-- Thorium Point's two flight masters (0.39.0): an Ironforge dwarf and an orc, both guests of the
-- Thorium Brotherhood. Voice: bibles/searinggorge.md ("Thorium Point's flight masters")
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "lanie_reed", id = TODO_NPC("Lanie Reed"), name = "Lanie Reed", title = "Gryphon Master",
  bible = "bibles/searinggorge.md", role = "flightmaster", tier = "service",
  communities = { "thorium_point" }, temper = { "wry" }, values = { "dutiful", "careful" },
  notices = { "race" },

  impression = {
    first = "Lanie Reed keeps the Alliance gryphons at Thorium Point, a Bronzebeard dwarf living as a guest among Dark Irons. She's wry about it, careful about it, and honest that it still sits strangely with her.",
    third = "{name} met Lanie Reed, the dwarf gryphon master at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Need a bird out of the Gorge? Wise, because there's more ash than air in this place, and the gryphons cough all night." },
    { id = "g_horde", when = { faction = "Horde" }, text = "My birds fly for the Alliance, friend. Your orc is just over there with the wind riders, and she'll see you right." },
    { id = "g_away", when = { away = 14, faction = "Alliance" }, text = "You've been gone {away}, and the gryphons have been coughing ash the whole time. They'll be glad of a flight out with you." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard face! I'm glad of it, friend; you'd not believe how strange it is to wake every morning surrounded by Dark Irons who mean you no harm." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Honestly, it's a close race. The Dark Irons called up fire and it burned half their own kingdom, so you'll forgive me if I watch anyone who talks to the elements a little closely, even one of ours." } },
      choices = {
        { text = "Ironforge's law keeps me honest, whatever the spirits say.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The elements answer to no king, and neither will I.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Welcome is a strong word, but you'd not be thrown off the cliff, which is more than our grandfathers would have said. Our clans have been at each other since the War of the Three Hammers, and I still flinch at the soot on their beards, but these ones turned their backs on the mountain, and I give them their due." } },
      choices = {
        { text = "Old wars should stay old. These Dark Irons earned a chance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A Dark Iron's a Dark Iron. I'll keep my hand near my sword.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Poorly, though they'll never admit it, for they're mountain birds and this place is all ash and sulfur. I water them twice as often as I would in Ironforge, and they still fly out of here a good deal faster than they fly in." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Poorly, though they'll never admit it, for they're mountain birds and this place is all ash and sulfur. I water them twice as often as I would in Ironforge, and they still fly out of here a good deal faster than they fly in. And {pet} looks hot and bothered too, poor thing, so give it a drink before you go, because the Gorge is cruel to anything with fur." },
      },
      choices = {
        { text = "A beast in pain should be cared for, whatever the cost.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They'll toughen up. A beast adapts or it doesn't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They hate the heat and they hate the ash, and most of all they hate the fire elementals that rise off the slag heaps like sparks off a forge. I can't say I blame them." } },
      choices = {
        { text = "Then don't ask more of them than you must.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A gryphon goes where it's needed, heat or no.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a teleport takes you home and nowhere else, and my gryphons will carry you to Morgan's Vigil, which your spell can't. Besides, the birds like a passenger who doesn't smell of slag, and you smell of library." } },
      choices = {
        { text = "Old ways are good ways. I'll fly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spells are faster. Your birds are a luxury.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Brotherhood swear they don't, and Oilfist would skin anyone who did, but I seal every letter twice all the same. A Bronzebeard living among Dark Irons learns to trust slowly, and to keep a knife in her boot." } },
      choices = {
        { text = "Trust them, Lanie. They broke with the mountain.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep the knife. Old enemies stay enemies.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Lanie.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Harder than I'd like to say out loud, friend. I was raised on tales of Dark Iron sorcerers and the Firelord's fire, and some nights I lie awake listening to their forges, but they've never once done me wrong, and I think the Light asks me to judge them by that." } },
      choices = {
        { text = "Judge them by their deeds, Lanie, not their grandfathers'.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Old blood runs true. Keep watching them closely.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They're polite to everyone, which isn't the same as trust, and a knight of the Light reminds them of every Bronzebeard who ever marched on Blackrock. Be civil, mind your tongue around Oilfist, and remember that every one of them walked away from Thaurissan with nothing but their hands." } },
      choices = {
        { text = "They broke free. That earns my respect, Lanie.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A Dark Iron is a Dark Iron. I'll keep watch.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only the young ones, and only once, because they learn soon enough that you smell much the same as the rest of this place. The old birds have flown through so much sulfur that a little brimstone hardly turns their heads anymore, which I find both sad and useful." } },
      choices = {
        { text = "I'll keep my demon away from the young ones.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the old birds don't mind, then neither do I.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Keep your demon on the ground, please, because a gryphon in the Gorge has enough to worry about with fire elementals and doesn't need a passenger that smells of brimstone." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll be glad of a gryphon here, I'd wager, because there's nothing in the Gorge a knight can charge that doesn't either bite back or burst into flames." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light, and a fellow Alliance face besides! Thorium Point's a long way from the Cathedral, so if you've a blessing to spare, my birds and I won't turn it down." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. If you're here to read the letters my birds carry, they're sealed, they're dull, and the birds bite." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, flying? Most of your lot teleport off to Ironforge or Stormwind in a flash of light, and leave my birds wondering what they did wrong." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A night elf druid! The gryphons don't trust the Gorge any more than you would, and they'll fly you out of here gladly, back to where things still grow." },
        { id = "h_default", key = true,
          text = "Lanie Reed, gryphon master for the Alliance here at Thorium Point. My birds fly to Ironforge and to Morgan's Vigil in the Burning Steppes, and anywhere else the Alliance has a roost, and they're glad to leave every time." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Keep your hand off that hilt while you're at the Point, because the Dark Irons here are friends, or near enough, and they notice these things." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! My gryphons are restless round strange beasts, so if you've one with you, keep it close and don't let it eye the birds like supper." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A Bronzebeard shaman, at a Dark Iron camp. I thought I'd seen every odd thing Thorium Point had to offer, and then you walked up the path." },
      },
      again = {
        { id = "h_again", text = "What else? The birds are getting twitchy in this smoke." },
        { id = "h_again2", text = "Go on, ask. I've nowhere to be but here." },
      },
      choices = {
        { text = "Do the gryphons hate the Gorge?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "A Bronzebeard among Dark Irons?", next = "brotherhood" },
        { text = "How do the gryphons stand the Gorge?", next = "ash" },
        { text = "Why fly when I could teleport home, Lanie?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the Dark Irons here ever try to read your letters?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is it hard keeping faith among the Dark Irons, Lanie?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would a Bronzebeard warrior be welcome at Thorium Point, Lanie?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do your gryphons fare in the Gorge's heat, Lanie?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Dark Irons here trust a paladin, Lanie?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your gryphons ever refuse a warlock, Lanie?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is a dwarf shaman stranger than a Dark Iron ally, Lanie?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "Aye, and I'll not pretend it was easy. My grandfather told me stories about Dark Irons that would curl your beard, but the Thorium Brotherhood walked away from Thaurissan and his master, and they've treated me fair." },
        { id = "b_dwarf", when = { race = "Dwarf" }, text = "You'll know the stories as well as I do, the ones about the War of the Three Hammers. But the Thorium Brotherhood walked away from Thaurissan and his fire master, and they've treated me fairer than some of our own." } },
      choices = {
        { text = "Can you really trust them?", next = "brotherhood_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood_trust = {
      lines = { { id = "bt_default", text = "I trust them to keep their word, because they keep it to each other, and they've not broken it to me yet. I'll not say I'd turn my back on every one of them, but I'd say the same in Ironforge." } },
      choices = {
        { text = "People can change. They've proved it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A Dark Iron is a Dark Iron.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ash = {
      lines = { { id = "a_default", text = "Poorly. The ash gets into their feathers and their lungs, so I brush them out every night and keep them out of the wind when the volcano's grumbling. They fly high over the Gorge, too, well above the smoke and the fire elementals." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep gryphons, and Ironforge sent me where they were needed. That's the long and the short of it." } },
    advice = { { id = "tp_ad", text = "Tie a wet cloth over your face if you're walking the Gorge for long. Your lungs will thank you." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask one of the Brotherhood; they know this place better than I ever will." } },
  },
}

P:NPC {
  key = "grisha", id = TODO_NPC("Grisha"), name = "Grisha", title = "Wind Rider Master",
  bible = "bibles/searinggorge.md", role = "flightmaster", tier = "service",
  communities = { "thorium_point" }, temper = { "gruff" }, values = { "dutiful", "careful" },
  notices = { "race" },

  impression = {
    first = "Grisha keeps the wind riders at Thorium Point and keeps a careful eye on the dwarves around her, Dark Iron or otherwise. She's blunt and wary, and fond of her beasts in a way she doesn't bother to hide.",
    third = "{name} met Grisha, the orc wind rider master at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Wind riders are fed and ready. Where are you going, and how fast do you want to get there?" },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "No wind riders for the Alliance. The dwarf with the gryphons is over there, if you want a bird." },
    { id = "g_away", when = { away = 14, faction = "Horde" }, text = "Back after {away} away, then. The wind riders still know your smell, so climb on whenever you're ready." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}. Good to see another orc face among all these dwarves; it gets lonely being the only one of us in camp." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Politely, which they do to everyone, and warily, which they do to me. The Brotherhood remembers Bronzebeard paladins marching on their mountain, and you wear the same Light, so don't be surprised if they count your swings." } },
      choices = {
        { text = "Mercy suits the Light. They broke their chains.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A Dark Iron is a Dark Iron. I'll keep my guard up.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I trust them as far as my wind riders could throw them, which isn't far, but they keep their word and they've never once cheated me. A warrior learns to judge a fighter by what they do, not by who their grandfather served, and these ones have done well enough." } },
      choices = {
        { text = "Judge them by their deeds. That's only fair.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dwarves are dwarves. I'll keep my axe ready.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "A strict routine keeps a beast healthy anywhere.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them fly when they want. A beast knows best.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Better than the gryphons, but only because they're too stubborn to complain. The ash gets in their wings and the heat makes them cross, and I spend my evenings picking cinders out of their manes." } },
      choices = {
        { text = "They serve the Horde. A little ash won't stop them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Beasts shouldn't be kept somewhere this foul.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They mind the smell of the arcane, which they say is like lightning that never lands, but they carry you all the same. Watch what you buy from the dwarves while you're here, mage, because some of their enchantments were first made for Ragnaros." } },
      choices = {
        { text = "Power is power, whoever forged it first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Nothing made for Ragnaros belongs in Horde hands.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Grisha.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Wind riders came to us in Kalimdor, after the old days, and they never learned to love the fel the way the old Horde did. Some of my grunts haven't forgiven the warlocks either, and I'd not ask them to." } },
      choices = {
        { text = "Fel is a tool, and the Horde will need it again.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "The old warlocks earned that hatred. I'll do better.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "As closely as I watch them, which is very closely indeed, because every one of them swears he left the mountain behind and none of us can prove it. They trade fair and keep their word, so far, but I sleep with my axe by the bed and I'd advise you to do the same." } },
      choices = {
        { text = "They've kept their word. That should count, Grisha.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fair enough. I'll watch them and trust none.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More than I'd like, since the fire elementals throw flame at anything in the air and the Dark Iron watchtowers throw everything else. I patch them up as best I can, and if you'd lay a hand on the worst of them before you fly, I'd count it a kindness." } },
      choices = {
        { text = "I'll tend your riders gladly before I go, Grisha.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Beasts heal on their own, Grisha. I'll save my prayers.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Heat off the Cauldron, ash off Blackrock and the fire spirits the Dark Irons keep stirring up, all of it churning together until a wind rider can't find a straight line through. I've lost no riders yet, but I've lost a great deal of sleep, and I'd give a week's pay for one calm crossing." } },
      choices = {
        { text = "Keep flying the routes, Grisha. The Horde relies on them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ground the riders on bad days, Grisha. They come first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman. The air over the Gorge is angry and my riders feel it in their wings, so if you can make it behave, you'll be the most popular passenger I've ever had." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because the riders come back from the Cauldron singed and limping, and I can only bandage so much before I run out of linen." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. The Dark Irons here keep their doors locked and their eyes open, so whatever you're planning, don't plan it near my perch." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Keep your demon on the far side of the perch, because my riders have long memories and short tempers, and they don't like demons." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. You could teleport home and leave my riders idle, but you came to me, so I'll take it as a compliment." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid at Thorium Point. My wind riders will sniff you over, because you smell of grass and they haven't had that in a while." },
        { id = "h_default", key = true,
          text = "Grisha, wind rider master for the Horde at Thorium Point. My beasts fly to Kargath in the Badlands and to Flame Crest in the Burning Steppes, and from there anywhere you like." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Keep your axe on your back while you're here, because the dwarves have long memories and short tempers, and I'd rather not lose a customer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll understand my beasts, then, and why I won't let anyone near them who doesn't know how to treat an animal." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The dwarves around here will stare at you twice, once for the Light and once for the rot, so let them stare and keep your hand off your hammer." },
      },
      again = {
        { id = "h_again", text = "What else? The riders smell the lava and they want to be gone." },
        { id = "h_again2", text = "Speak. I'm listening." },
      },
      choices = {
        { text = "How do the wind riders fare in the Gorge?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How do you feel about the dwarves here?", next = "dwarves" },
        { text = "Do you get along with the gryphon master?", next = "lanie" },
        { text = "Do your riders mind carrying a mage?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do your riders hate demons so much?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you trust the Dark Irons here, Grisha?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How do your wind riders handle the Gorge, Grisha?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the Dark Irons here watch the Horde closely, Grisha?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Are your wind riders often hurt over the Gorge, Grisha?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What makes the air over the Gorge so angry, Grisha?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "How do the Dark Irons here treat a Forsaken paladin, Grisha?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "The Brotherhood keeps to their forges and I keep to my riders, and nobody makes trouble. I watch them, mind you, because their kin inside Blackrock Mountain are at war with orcs as we speak." } },
      choices = {
        { text = "Which orcs are they fighting?", next = "dwarves_past" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves_past = {
      lines = { { id = "dp_default", text = "The Blackrock clan, up in the Spire, while the Dark Irons hold the Depths below them, and neither side cares who gets caught in between. They're no friends of Thrall's, but they're orcs, and the Dark Irons won't ask which clan you belong to. The Brotherhood isn't them, but they came from the same place, and I remember that." } },
      choices = {
        { text = "Being careful is wise.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You should give them a chance.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
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
    background = { { id = "tp_ba", text = "I fly wind riders for the Horde. What I did before that is my own business." } },
    advice = { { id = "tp_ad", text = "Don't walk down into the Gorge without a reason. The Dark Irons down there aren't the friendly kind." } },
    _none = { { id = "tp_none", text = "Don't know. Ask the dwarves." } },
  },
}
