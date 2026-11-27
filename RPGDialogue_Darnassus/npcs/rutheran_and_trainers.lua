-- Rut'theran's hippogryph master and two Darnassian trainers. Voice: bibles/rutheran_and_warriors.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC = P.TODO_NPC

-- Vesprystus: hippogryph master at Rut'theran Village.
P:NPC {
  key = "vesprystus", id = TODO_NPC("Vesprystus"), name = "Vesprystus", title = "Hippogryph Master",
  bible = "bibles/rutheran_and_warriors.md", role = "flightmaster", tier = "service",
  communities = { "darnassus" }, temper = { "calm" }, values = { "nature", "freedom" },
  impression = {
    first = "He speaks of the sea wind like an old friend.",
    third = "{name} met Vesprystus, who keeps the hippogryphs of Rut'theran Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. The wind is kind, and so are the birds to you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The hippogryphs are ready. Pay and fly." },
    { id = "g_default", text = "Ishnu-alah, traveler. The hippogryphs are ready, and the wind off the sea is kind today." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the roots of Teldrassil. Where will the wind take you this time?" },
    { id = "g_outsider", when = { race = { "Human", "Dwarf", "Gnome" } }, priority = 5,
      text = "Another face off the boat from Auberdine. The hippogryphs will carry you, traveler, though I confess I've stopped trying to learn all your names." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They ride it like a river. Your wind spirits might speak with them better than I can." } },
      choices = {
        { text = "Then let them fly freely and safely, Vesprystus.", next = "BACK", reply = "Freely and safely is all I ever ask of the sky, shaman, and I am glad your spirits wish the same. The birds will feel it, I think.", fx = { align = { order = 1 } } },
        { text = "The wind is wild. Let them struggle.", next = "BACK", reply = "The wind is wild enough without anyone wishing it harder on them. I have mended too many torn wings to find any lesson in it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Too often, from Auberdine and beyond, and the hippogryphs know it, because they fly gently when they carry someone hurt. If you're ever going that way, ride with the wounded, and you'll ease two hearts at once." } },
      choices = {
        { text = "I'll ride with them whenever I can.", next = "BACK", reply = "Then they will carry you as gently as they carry the wounded, and that is the highest honour a hippogryph gives. Elune bless your hands.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll fly where my own work takes me.", next = "BACK", reply = "Of course, and the birds will take you wherever that is. Only remember the roost when someone in Auberdine needs you more than your errand does.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "To Auberdine across the water, and from there the roads and flights go south toward Ashenvale. Sit still and trust the beast, which I suspect is harder for your kind than for mine." } },
      choices = {
        { text = "I'll sit still and trust it, then.", next = "BACK", reply = "Good, then you will land in Auberdine with your dignity and your breakfast both intact. The beast will be grateful for the quiet.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I trust my own feet more than any beast.", next = "BACK", reply = "Then walk to the water's edge and swim, if you must, but the hippogryph will be faster. Trust is a short flight, paladin.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They carry anyone who's walked the road and knows the roost, and plenty of them are warriors bound for Astranaar. I always know the ones heading for the Warsong lines, because they sit very still and look south the whole way." } },
      choices = {
        { text = "I'll go where I'm needed, however far.", next = "BACK", reply = "Then the birds will carry you as far as the war reaches, and I will watch the sky for you. Astranaar needs every steady blade.", fx = { align = { honor = 1 } } },
        { text = "I go where the pay is, not the front.", next = "BACK", reply = "Pay is honest enough, and I will not lecture you about it. The front will find you sooner or later whether you go looking for it or not.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Badly, because a hippogryph is half eagle and the eagle half thinks your companion is supper, or the other way round. Keep your beast at heel near the roost, and nobody loses a feather." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Badly, because the eagle half of a hippogryph thinks your companion is supper, or the other way round. Your {pet} is staring at my birds already, and they've noticed, so keep it by your side, friend." },
      },
      choices = {
        { text = "I'll keep it at heel. Your birds come first here.", next = "BACK", reply = "You are kind to think of them, and your companion will be safer for it too. I would hate to see either one of them hurt over supper.", fx = { align = { order = 1 } } },
        { text = "My companion goes where I go, birds or not.", next = "BACK", reply = "Then mind them both very closely on my roost, because I will not answer for a hippogryph that feels its nest is threatened. Feathers heal slowly.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Perhaps because you don't startle them, and a hippogryph that isn't startled flies straight. Mind that you're honest with them, though, because they remember a rider who mistreated them for years." },
      },
      choices = {
        { text = "I'll treat them well. They've earned it.", next = "BACK", reply = "They have, many times over, and they remember every kindness. I think you will find them returning it in the air.", fx = { align = { light = 1 } } },
        { text = "A mount is a mount. I'll ride what I'm given.", next = "BACK", reply = "A hippogryph is not a mount, friend, it is a creature of Cenarius that has chosen to carry you. Ride it that way and it will choose you again.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Never, and I'm glad of it, because the hippogryphs are older than any spell for going places. The druids say a road you didn't travel is one you don't understand, and I've come to think they're right about that much." },
      },
      choices = {
        { text = "Then I'll fly with you and learn the road.", next = "BACK", reply = "Gladly, and you will see Darkshore the way the birds see it, which no spell can show you. I think you will be glad you came.", fx = { align = { order = 1 } } },
        { text = "A shorter road is still a road, flight master.", next = "BACK", reply = "A shorter road, perhaps, but you will never know what lay beneath it. The druids say that is how a people forgets its own land.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They settle the moment one of the Circle climbs on, because hippogryphs have flown beside the druids since the days of Cenarius and they remember who keeps his ways. The Sentinels ride them to war now, though I don't think they were ever meant for it." } },
      choices = {
        { text = "They serve the Sentinels well, and that's an honourable use.", next = "BACK", reply = "They do, and the birds go willingly, which is the only reason I allow it. Every flight to Astranaar is a gift they choose to give.", fx = { align = { order = 1 } } },
        { text = "They should fly free, not carry anyone to war.", next = "BACK", reply = "There are days I agree with you, druid, and the birds may agree as well. But the Sentinels need them, and the birds do not seem to mind.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Many of them flew over Hyjal when the Legion burned it, and the rest learned their fear from those that did. Send that creature away on the dock, and they'll fly you as gently as anyone." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Many of them flew over Hyjal when the Legion burned it, and they remember it now, which is why the whole roost has gone silent to watch your servant. Dismiss it on the dock, and they'll fly you as gently as anyone." },
      },
      choices = {
        { text = "I'll dismiss it on the dock.", next = "BACK", reply = "Thank you, truly. The birds will never know you did it, but I will, and I will remember it of you.", fx = { align = { honor = 1 } } },
        { text = "They'll carry it if I command it.", next = "BACK", reply = "Then you will be walking to Auberdine, because no bird of mine flies with that thing on its back. Command whatever else you like, but not my roost.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    dd_fall = {
      lines = {
        { id = "ddf_default", text = "As safe as anything that flies. A hippogryph has never lost a rider who held on, and they know the way to Auberdine better than I know the steps of this dock. Falls happen on the ground, from cliffs and branches, where nobody is holding you up." },
      },
      choices = {
        { text = "The hippogryphs connect our people.", next = "BACK", reply = "They do. You understand.", fx = { align = { order = 1 } } },
        { text = "Hippogryphs are just mounts.", next = "BACK", reply = "Then walk.", fx = { align = { order = -1 } } },
        { text = "Then I'll trust the bird.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll keep both hands on the saddle, all the same.", next = "BACK", reply = "Wise. Every hippogryph prefers a rider who holds on tight." },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "You have fallen from a height at least once, I can tell, for you look at my hippogryphs as though they might drop you. They will not, I promise, so long as you keep your seat and don't try to leap off over Auberdine." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My hippogryphs carry the wounded home more often than I'd like, and they're always calmer when a healer rides with them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. My hippogryphs have never carried so much armor, {class}, but they're stronger than they look, and they won't let you fall." },
        { id = "h_default", text = "I am Vesprystus, keeper of the hippogryphs. They carry our people from the roots of Teldrassil to Auberdine across the water, and from there to the rest of a world that has grown very large since the Sundering." },
        { id = "h_cond", when = { race = "Human" }, text = "A human, here at the roots of our tree! Our hippogryphs are gentler than your gryphons, I think, though I would not say so in Ironforge." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "Elune-adore, child of the kaldorei. It is a comfort to see one of our own on this dock, for most of the faces coming off the boat these days have never seen a moonwell." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "My hippogryphs are fond of you, rogue, which is odd, since they're usually wary of anyone who walks that quietly." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage taking the long way! I'd heard your kind can step from one place to another with a word, so it's a compliment that you'd choose my birds." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, flying on to Auberdine? Hold on tight and don't lean, because armor makes the birds nervous." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! My birds can smell your companion from here, so let me settle them before you come any closer." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You could swim to Auberdine in seal shape if you liked, but my hippogryphs are faster and a good deal drier." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My hippogryphs are shifting on their perches, and I think you know why. They'll carry you to Auberdine, but not what follows you, for they remember the Legion's fires." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The sea wind has been an old friend of mine for a very long time, so tell me, does your wind spirit know it too?" },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The wind can wait, and so can I." },
        { id = "h_again2", text = "Speak. The birds can wait a moment." },
      },
      choices = {
        { text = "I've had a bad fall before. How safe is the flight?", next = "dd_fall", when = { deathCause = "falling" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Why live at the roots, not in the city?", next = "a" },
        { text = "Many strangers must come through Rut'theran now.", next = "gate" },
        { text = "Do you wish my kind hadn't come, Vesprystus?", next = "xout", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Are the hippogryphs hard to train?", next = "b" },
        { text = "Why would a hippogryph trust someone who walks quietly?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the kaldorei ever travel by magic instead?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your hippogryphs carry warriors toward the Ashenvale front?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your hippogryphs get on with hunters' companions?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the wounded often fly home on your hippogryphs?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can your hippogryphs carry a paladin toward the front?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your hippogryphs know a druid when they carry one?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why do your hippogryphs remember the Legion?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the hippogryphs feel the sea wind, Vesprystus?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Did our people fly hippogryphs in the old world?", next = "ne_hippo", when = { race = "NightElf" } },
        { text = "Could a hunter ever tame a hippogryph?", next = "hunt_hippo", when = { class = "HUNTER" } },
        { text = "Thank you, Vesprystus.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because someone must stand at the gate between Teldrassil and the world. Darnassus looks up toward the stars, and I prefer to look out at the sea." } },
      choices = {
        { text = "Does the outside world worry you?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "It does. Our people hid in the forest for ten thousand years, and now we have joined an alliance of humans and dwarves who build with fire and stone." } },
      choices = {
        { text = "The Alliance is our strength now. We must stand with them.", next = "BACK", reply = "Perhaps we must, and Elune knows the humans and dwarves bled for Hyjal. I only pray we keep our own ways while we learn theirs.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Our people should keep to our own ways and our own forest.", next = "BACK", reply = "I feel it too when the wind blows from the human cities. Yet the forest that hid us for ten thousand years was not enough to stop the Legion.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate = {
      big = true,
      lines = {
        { id = "gt_default", key = true,
          text = "More every season, off the boat from Auberdine, and the ships from Menethil before that. Each one climbs up to my roost smelling of coal smoke and powder, and I swear the young tree shivers a little more with every boatload." },
      },
      choices = {
        { text = "Strangers bring trade and allies. That's good for Darnassus.", next = "BACK",
          reply = "Trade and allies, yes, and their wars and their sicknesses folded in among the cloth. I hope you are right, and I watch the boats in case you are not.", fx = { align = { order = 1 } } },
        { text = "Strangers bring their troubles with them.", next = "BACK",
          reply = "They do, and they never declare those at the dock. The birds smell it on them before I do.", fx = { align = { order = -1 } } },
        { text = "Would you turn them away?", next = "gate2" },
      },
    },
    gate2 = {
      lines = {
        { id = "gt2_default", text = "I would close the gate to all of them, and I mean all: the humans and the dwarves and the gnomes, and the orcs and the tauren too, if they ever came asking. For ten thousand years the world forgot we existed, and in all that time no axe was ever raised against our trees." },
      },
      choices = {
        { text = "Hiding didn't stop the Legion. You said so yourself.", next = "BACK",
          reply = "I did, and it is the stone in my shoe every night. But the Legion came for the Well, and the Well is gone, so perhaps this time the world would leave us be.", fx = { align = { order = 1 } } },
        { text = "Then speak for it. Others in Darnassus feel the same.", next = "BACK",
          reply = "Some do, and they speak more loudly than an old bird-keeper. I keep my gate the only way I can, by watching every face that comes up from the water.", fx = { align = { order = -1 } } },
        { text = "Who else feels as you do?", next = "gate3" },
      },
    },
    gate3 = {
      lines = {
        { id = "gt3_default", text = "Half the old ones who never wanted to leave Hyjal, and Sentinels like Arynia at the Oracle Glade, who blames the mainland for every harpy on the tree. Raedon Duskstriker on the Craftsmen's Terrace would shut the gate on Stormwind and leave it open for Theramore's coin, though, and that is only half a gate." },
      },
      choices = {
        { text = "And who would keep it open?", next = "gate4" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate4 = {
      lines = {
        { id = "gt4_default", text = "Mathiel the smith, who writes to dwarves, and the young ones who camp by the Dolanaar road and dream of Ironforge. And the High Priestess, which is the end of the argument for most, though not, I'm afraid, for me." },
      },
      choices = {
        { text = "You'd disagree with Tyrande herself?", next = "BACK",
          reply = "Quietly, and with love, as one disagrees with the moon for setting. She has never once asked me to stop." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xout = {
      big = true,
      lines = {
        { id = "xo_default", text = "I wish none of you had needed to, which is not the same thing, and I'll fly you as gently as any kaldorei. But every stranger who learns the way here teaches it to ten more, and one day the wrong ten will come." },
        { id = "xo_dwarf", when = { race = "Dwarf" },
          text = "I'll fly you as gently as any kaldorei, so don't fear the birds. But your Explorers' League has been digging in Darkshore's hills for our oldest ruins, and I wonder what the next dwarf off the boat will want to dig up." },
        { id = "xo_gnome", when = { race = "Gnome" },
          text = "I'll fly you as gently as any kaldorei, and I am sorry for the city you lost. But a people who lost a mountain to their own machines will forgive me for keeping them far from a young tree." },
      },
      choices = {
        { text = "Then I'll be one who keeps your secrets.", next = "BACK",
          reply = "That is a kind promise, and I'll hold you to it for longer than you'll live, which is the trouble with promising a kaldorei anything.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The way is already known. Closing it now helps no one.", next = "BACK",
          reply = "You may be right, and that is what frightens me. A secret can't be unlearned, only outlived.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "No, only patient work, and baskets of fish. They choose their riders more than we choose them, so I let them sniff you first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ne_hippo = {
      lines = {
        { id = "nhp_default", text = "We did, and the Sentinels rode them into battle against the Legion before the Sundering. Their grandmothers' grandmothers flew over the Well of Eternity, and some of them still shy from the sea as if they remember what lies beneath it." },
      },
      choices = {
        { text = "Do you think they remember?", next = "ne_hippo2" },
        { text = "Something else, Vesprystus.", next = "BACK" },
      },
    },
    ne_hippo2 = {
      lines = {
        { id = "nhp2_default", text = "I think beasts remember more than we credit, and hippogryphs more than most. Aviana's children were never fools, and they have kept faith with us through everything we have done to the world, which is more than we deserve." },
      },
      choices = { { text = "Then I'll treat them as allies.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunt_hippo = {
      lines = {
        { id = "hh_default", text = "No, and please do not try on mine. A hippogryph gives its trust to the Sentinels and to Aviana's line, and it does not follow a hunter home however steady the hand. Tame an owl, if you want wings beside you, and leave my flock to the sky." },
      },
      choices = { { text = "An owl it is, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept beasts of the air since long before Teldrassil was planted." } },
    nordrassil = { { id = "tp_nordrassil", text = "My birds came down from Hyjal with us, and they still turn their heads north sometimes. I think they remember the first tree, the way we do." } },
    everlook = { { id = "tp_everlook", text = "Everlook is a goblin town up in Winterspring, and my birds hate the cold of it. Druids fly there anyway, being druids." } },
    theramore = { { id = "tp_theramore", text = "Theramore is a long way south by hippogryph, over the Barrens and its Horde. I don't send my birds there lightly." } },
    _none = { { id = "tp_none", text = "That is beyond my knowledge. Ask in the city above, where the priestesses keep longer memories than mine." } },
  },
}

-- Ilyenia Moonfire: weapon master in Darnassus.
P:NPC {
  key = "ilyenia", id = TODO_NPC("Ilyenia Moonfire"), name = "Ilyenia Moonfire", title = "Weapon Master",
  bible = "bibles/rutheran_and_warriors.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "exacting" }, values = { "discipline", "duty" },
  impression = {
    first = "She does not hide her opinion of sloppy footwork.",
    third = "{name} met Ilyenia Moonfire, Darnassus' exacting weapon master.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Show me your stance. Good. You've improved, friend." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Show me your stance. No. Again." },
    { id = "g_default", text = "You wish to learn a new weapon? Show me your stance first." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I trust you have been practicing, for the Sentinels practiced for a thousand years before they called themselves ready." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Anyone can, with discipline. Your spirits may guide you, but your feet must obey me." } },
      choices = {
        { text = "I will learn proper discipline, Ilyenia.", next = "BACK", reply = "Good, because your spirits will not be holding the staff when the blow comes. Your feet will thank you in Ashenvale.", fx = { align = { order = 1 } } },
        { text = "My spirits guide my feet well enough.", next = "BACK", reply = "Then let us see how well they guide you when I sweep them out from under you. Discipline begins when you lose the argument with the floor.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A priest who can't defend themselves is a priest who needs a Sentinel beside them, when that Sentinel ought to be fighting. Learn the staff well enough to keep an enemy at arm's length, and your prayers will have time to work." } },
      choices = {
        { text = "My faith is my first defense, but I'll learn the staff.", next = "BACK", reply = "Faith first and the staff second is a fine order, priest, so long as the second is not neglected. I will make sure it is not.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd trade a long prayer for a good staff any day.", next = "BACK", reply = "Ha, careful, or your Temple will hear you say it. Still, a priestess who can crack a skull is worth two who can only pray over one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Exactly as I teach the Sentinels, with patience first and the weapon after, because I've seen too many strong arms wasted by an impatient mind. Your oaths will mean little if your swing leaves you open." } },
      choices = {
        { text = "Then I'll begin again, as you say.", next = "BACK", reply = "That is the hardest thing a strong warrior can say, and I respect it. We will start with your stance and leave your pride at the door.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My training served me well enough before this.", next = "BACK", reply = "Before is not Ashenvale, paladin, and the Warsong do not fight like your training dummies. Humour me for a week and then decide.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whichever one you'll still respect after a hundred hours of drills, because that's what mastery costs. Most warriors want a great sword the moment they arrive, but I'd sooner see you learn the staff first, since it teaches your feet before it flatters your arms." } },
      choices = {
        { text = "I'll start with the staff and earn the sword.", next = "BACK", reply = "Wisely chosen, and you will hold that sword better for every hour on the staff. Come back tomorrow and we begin.", fx = { align = { order = 1 } } },
        { text = "I came for a sword, not a lesson in patience.", next = "BACK", reply = "Every warrior does, and every warrior learns that the sword is the easy part. Swing it once for me, and we shall see what you came for.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I can teach you to draw it the same way a thousand times, which is what the Sentinels need when the Warsong come through the trees. A hunter's instinct is a fine thing, but instinct tires and a trained arm doesn't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I can teach you to draw it the same way a thousand times, because instinct tires and a trained arm doesn't. Your {pet} may sit and watch, and I suspect it'll learn more from your footwork than you will." },
      },
      choices = {
        { text = "Discipline, then. I'll draw it your way.", next = "BACK", reply = "Then the Sentinels will be glad to have you on the line beside them. A thousand identical draws is how a forest is held.", fx = { align = { order = 1 } } },
        { text = "My instincts have kept me alive this long.", next = "BACK", reply = "They have, out in the wild, where only you need to live. In a line of Sentinels your instincts must match everyone else's, or someone dies.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "We do, but a Sentinel's dagger is a last answer, and a rogue's is often the first. I'll teach you either way, but I'd rather you learned patience with the blade before speed, because speed without patience gets people killed." },
      },
      choices = {
        { text = "Patience first, then, and teach me properly.", next = "BACK", reply = "Then you will have a dagger worth trusting when the first answer fails. Stand straight, and we begin with your feet.", fx = { align = { order = 1 } } },
        { text = "Speed's kept me alive so far. I'll take it.", next = "BACK", reply = "It has, so far, and so far is a short word to someone of my years. Take your speed, but take my patience too, for the night it runs out.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "One day you'll be out of mana in Ashenvale with a Warsong grunt in front of you, and then you'll be very glad you listened to an old weapon master. I teach patience above all, and a mage with an empty well needs it most of all." },
      },
      choices = {
        { text = "Then show me. I'd rather be ready.", next = "BACK", reply = "Good, and I promise the staff will not judge you for your robes. Grip it lower than you think, and we will begin.", fx = { align = { order = 1 } } },
        { text = "My spells won't run dry if I'm careful.", next = "BACK", reply = "Every mage who said that to me is either very careful or very dead. I would much rather you were the first kind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because a bear that is struck down wakes up as an elf with nothing in hand, and I've seen that happen in Ashenvale more than once. Learn the staff, and you'll be glad of it on the day your shapes fail you." } },
      choices = {
        { text = "Then I'll learn the staff properly, as you say.", next = "BACK", reply = "Thank you, druid, because I have no wish to bury another one of the Circle. A staff will catch you when your shape falls away.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My claws have never failed me, and I trust them more.", next = "BACK", reply = "They have not failed you yet, which is not the same thing at all. When they do, I hope you remember this conversation.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because patience and a sound grip will save you on the day whatever fights for you falls and your spells run dry, and that day comes for everyone. I teach daggers, staves and blades, and I teach them to anyone who'll stand still and listen." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because patience and a sound grip will save you on the day your servant falls and your spells run dry, and that day comes for everyone. Yours is watching me as though it knows the day and is counting toward it, so pick up a staff and let's make sure you're ready." },
      },
      choices = {
        { text = "Teach me, then. I'll stand and listen.", next = "BACK", reply = "Good, because the lessons I teach your sort are the ones that keep you alive when everything else has gone. Stand here and watch my feet.", fx = { align = { order = 1 } } },
        { text = "What I bring holds the line for me. I need no blade.", next = "BACK", reply = "Then pray it never falls, because it will not mourn you when it does. I teach the grip for the day it does.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want a staff or a mace, I suppose, and I can teach you both, but I'll teach you patience first, as I teach everyone." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll favor the mace and the two-handed sword, I expect, and I don't care what your order taught you before you came." },
        { id = "h_default", text = "I am Ilyenia Moonfire, weapon master of Darnassus. I teach daggers, staves, bows and blades, but first I teach patience." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior. You will have the strength, but the Sentinels would tell you strength without balance is only a slower way to fall." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Daggers, I'd wager, and I can see you favour the right hand. Come, let me show you why the left matters just as much." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A staff, of course, and you'll want to know how to swing it when the spells run dry. Every mage thinks they'll never need to, and every mage is wrong." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, I'll have someone to teach who won't flinch when the staff comes round." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I teach bows here, though the hunters always tell me they know better." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll want a staff or a mace, and I'll teach you either, though you'll fight half your battles with claws and never thank me for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ink on your fingers and sulphur on your cloak. I can teach you staff and dagger, though your sort usually lets something else hold the line." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Your footwork is sloppy, spirits or no, so stand properly, as a Sentinel would." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask with your weight on both feet." },
        { id = "h_again2", text = "Ask, but stand straight while you do." },
      },
      choices = {
        { text = "A good stance is the foundation.", next = "BACK", reply = "It is. You understand.", fx = { align = { order = 1 } } },
        { text = "Stance doesn't matter in a real fight.", next = "BACK", reply = "It does. Again.", fx = { align = { order = -1 } } },
        { text = "Teach me a weapon.", next = "BUSINESS" },
        { text = "What do the Sentinels favor?", next = "a" },
        { text = "You can't be the only trainer here.", next = "b" },
        { text = "Do the Sentinels train with daggers as rogues do?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Will I really need a staff in a fight?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which weapon should a warrior master first, Ilyenia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you teach a hunter anything new about the bow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Must a priest learn weapons as well, Ilyenia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will you teach a paladin as you teach the Sentinels?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why should a druid learn weapons when the claws do the work?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why should someone with my gifts bother learning a weapon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Can a shaman learn proper footwork, Ilyenia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Should a hunter learn the bow or the gun first?", next = "hunt_bow", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "The glaive and the bow, for they keep the enemy at a distance and the forest quiet. Our sisters have fought with them since long before your kingdoms rose." } },
      choices = {
        { text = "Fighting from a distance seems a coward's way.", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "A Sentinel who lives to fight again has served her people better than one who dies proudly. Pride is a luxury; discipline is a duty." } },
      choices = {
        { text = "A warrior should face the enemy close, with honor.", next = "BACK", reply = "There is honour in that, and many Sentinels have died with honour in Ashenvale. I would sooner they lived to fight beside me tomorrow.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Winning matters more than how it looks. You're right.", next = "BACK", reply = "It is not about looks, only about who walks home, though I am glad we agree. Pride can wait until after the battle is won.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Arias'ta Bladesinger trains our warriors, and I teach any of them a new weapon once she says they are ready. Few are as ready as they think." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunt_bow = {
      big = true,
      lines = {
        { id = "hb_default", text = "Whichever you will practise with every day, which for a kaldorei is the bow, because the forest hears a gun from a league away. I can teach you bows, and crossbows as well, though the dwarves will tell you a rifle is the only honest weapon in the world." },
        { id = "hb_dwarf", when = { race = "Dwarf" }, text = "You'll tell me the gun, and you'll be right for you, because you have practised with it since you could walk. I teach bows and crossbows here, and I would only ask that you not fire it within the city, because the sabers take it very personally." },
      },
      choices = {
        { text = "The bow, then. Silence is a weapon too.", next = "BACK", reply = "It is the best weapon. Come back when you can split a string at fifty paces.", fx = { align = { honor = -1 } } },
        { text = "I'll use whatever strikes hardest, noise or no.", next = "BACK", reply = "A plain answer, and an honest one. I respect it, even if the sabers will not.", fx = { align = { honor = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served among the Sentinels before I came to teach. My hands remember more than my mouth will tell." } },
    centaur = { { id = "tp_centaur", text = "I fought centaur once in the Barrens, when our patrols ran farther south. They hit like a falling oak, and they are smarter than they let you see." } },
    warsong = { { id = "tp_warsong", text = "I've fought the Warsong in Ashenvale, and I'll fight them again if they ask. Strong arms, poor patience, which is what I teach my students to use against them." } },
    blackfathom = { { id = "tp_blackfathom", text = "The deeps swallowed a temple and more than one patrol. Fight with your back to stone and your feet out of the water." } },
    _none = { { id = "tp_none", text = "That is not something a blade can answer, and I have asked my blades a great many things." } },
  },
}

-- Jeen'ra Nightrunner: hunter trainer in Darnassus.
P:NPC {
  key = "jeenra", id = TODO_NPC("Jeen'ra Nightrunner"), name = "Jeen'ra Nightrunner", title = "Hunter Trainer",
  prejudice = { race = "Human", amount = 8, why = "Saw a Stormwind hunting party leave stags to rot on the Darkshore coast." },
  bible = "bibles/rutheran_and_warriors.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "quiet" }, values = { "nature", "freedom" },
  impression = {
    first = "The beasts put her at ease far more than people do.",
    third = "{name} met Jeen'ra Nightrunner, a quiet hunter trainer of Darnassus.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Darnassus honors you, friend, and so do I. Walk with me." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Darnassus honors you. I am less sure." },
    { id = "g_rep1", when = { rep = { faction = "Darnassus", min = "Honored" } }, text = "Darnassus honours you, and the Sentinels know it. Walk these terraces as one of our own." },
    { id = "g_prej", when = { prejudiced = true }, text = "A human, come to learn the bow from me. I'll teach you, {class}, but you'll learn first that a hunter here kills to eat, and not to hang a head over the hearth." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ah, you again. You've never once brought a trophy head back from the hunt, and I've stopped expecting one." },
    { id = "g_default", text = "Speak softly. The beasts are listening, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Your companion looks well, and so do you." },
  },
  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I think humans hunt hungrily. A party from Stormwind came through Darkshore last spring, twelve men and their hounds, and they left four stags on the shore with only the antlers taken." } },
      choices = {
        { text = "Then those men shamed every hunter, human or not.", next = "prej_a", fx = { align = { light = 1 } } },
        { text = "A kill is a kill. What's taken is the hunter's business.", next = "prej_b", fx = { align = { light = -1 } } },
        { text = "What would you have a hunter take from a kill?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Yes, they did, and I'm glad to hear a human say it. Say it to the next party that sails over from Menethil, if you can do it without getting shot." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Then we'll disagree, and I'll still teach you, because Elune doesn't ask me to like my students. Only remember that the forest keeps count." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Everything you can use, and a word of thanks for the rest. Take the hide, the sinew and the meat; leave the antlers if you must, but leave nothing to rot that something else could have eaten." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They trust those who listen, and you seem to. I am more at ease with beasts than with people myself, and you may be the same." } },
      choices = {
        { text = "A hunter guards the forest.", next = "BACK", reply = "We do. You understand.", fx = { align = { order = 1 } } },
        { text = "A hunter hunts for himself.", next = "BACK", reply = "Then hunt alone.", fx = { align = { order = -1 } } },
        { text = "Then I will treat them gently, Jeen'ra.", next = "BACK", reply = "Gently is how they best understand us, shaman. The nightsabers will remember you for it, and so will I.", fx = { align = { honor = 1 } } },
        { text = "Beasts are beasts, Jeen'ra. I don't need their trust.", next = "BACK", reply = "Then they will treat you the same way, and a nightsaber that does not trust you is a very bad thing to meet. I hope you learn otherwise.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Rarely, because they're proud and think a wound from the wild is a lesson. I tell them a lesson is no good to the dead, and perhaps they'll believe it from you." } },
      choices = {
        { text = "I'll heal any hunter who comes to me, proud or not.", next = "BACK", reply = "Then you are a better priest than they deserve, and I will tell them so. Perhaps one of them will even thank you for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they're too proud to ask, I won't chase them.", next = "BACK", reply = "They will not ask, and some of them will die proud in the brush. I hoped you might be the one to chase them anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They'll trust what you do, not what you wear, as all beasts do. Kill only what you must and leave the rest in peace, and they'll let you pass soon enough." } },
      choices = {
        { text = "I'll kill only what I must, and leave the rest.", next = "BACK", reply = "Then you will walk Teldrassil as a guest and not a trespasser, and the sabers by Ban'ethil will let you pass without a second look.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go as I please, and the beasts can mind themselves.", next = "BACK", reply = "The beasts will mind themselves, paladin, and that is exactly what you should fear. They forget nothing on Teldrassil.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, mostly, and how to read a beast before it moves, because a nightsaber shows you its charge a breath before it comes. Warriors fight the claw they see, and hunters watch the shoulder that throws it." } },
      choices = {
        { text = "I'll learn to watch the shoulder, then.", next = "BACK", reply = "Good, and you will see the charge before it comes. A nightsaber drops its shoulder a heartbeat before it springs, every time.", fx = { align = { order = 1 } } },
        { text = "I'll take the claw and answer it with steel.", next = "BACK", reply = "You may, and I suppose you will even win, most of the time. But the saber you killed may have only been warning you off its cubs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "To listen before you draw, because Teldrassil is full of beasts that are not your enemies, and the nightsabers of the old groves deserve that much from us. The Sentinels ride with hunters for that reason, since we know which shadow is a cat and which is a Gnarlpine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "To listen before you draw, because Teldrassil is full of beasts that are not your enemies. Your {pet} has chosen you well, so speak to it often, because it understands more of you than you know." },
      },
      choices = {
        { text = "I'll listen first, and draw only when I must.", next = "BACK", reply = "Then you will make a hunter of the old kind, and the groves will be glad of you. Draw slowly, and live long.", fx = { align = { honor = 1 } } },
        { text = "Anything that stalks me gets an arrow first.", next = "BACK", reply = "Even the ones that only wanted to see what you were? A hunter who cannot tell curiosity from hunger will run out of arrows quickly.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That every track is a story about something hungry or frightened, and you should know which before you follow it. A rogue tracks to take, but a hunter tracks to understand, and I think you'd do your work better if you tried my way once." },
      },
      choices = {
        { text = "I'll try it your way. Understanding helps.", next = "BACK", reply = "It does, and you may find you take less and gain more. I hope the trail treats you kindly.", fx = { align = { light = 1 } } },
        { text = "Understanding takes too long. Taking is quicker.", next = "BACK", reply = "So it is, and quick things are rarely remembered fondly. Come back after a season of taking, and tell me how many of your trails still lead anywhere.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Of what follows you, though she's no fonder of you for bringing it. Beasts know the fel by its stink, as surely as they know fire, and every hunter in Darnassus will read the same thing in their pets the moment you walk past." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Of your servant, and you can see it in her now, pressed against my legs with every hair on end since it came round the tree. Beasts know the fel by its stink, as surely as they know fire, and every hunter in Darnassus will read the same thing in their pets the moment you walk past." },
      },
      choices = {
        { text = "Then I'll keep my distance from your cats.", next = "BACK", reply = "That is courteous of you, and the cats will notice it even if they never warm to you. Keep the creature far behind you as well.", fx = { align = { light = 1 } } },
        { text = "Your cat can get used to it.", next = "BACK", reply = "She will not, and neither will I. The fel does not belong among living things, and a beast knows that before we do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because you smell a little of them, I think, and you've walked in their shapes, so they know you won't put a collar on them. My hunters earn that trust slowly, and you arrived with half of it already." } },
      choices = {
        { text = "A beast should only follow someone it has chosen freely.", next = "BACK", reply = "That is the old way, and the right one, druid. My own cat walked beside me for a week before she let me touch her, and she has never left since.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some beasts need a firm hand before they'll trust anyone.", next = "BACK", reply = "Perhaps, but a firm hand and a cruel one are not the same. Be sure you know which one you are using.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Most beasts do, I think, because magic makes the air feel wrong to them, the way a storm does. She'll settle if you stand still and let her come to you, which is good advice for most of the wild, if you'll take it from me." },
      },
      choices = {
        { text = "I'll stand still and let her come.", next = "BACK", reply = "That is all she needs, and you will find her patient once she understands you. She once took three days to forgive me for a sneeze, so be very still.", fx = { align = { light = 1 } } },
        { text = "Beasts will learn to bear it.", next = "BACK", reply = "Some will learn to bear it, and some will learn to avoid you entirely. I would rather they did not have to do either.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My hunters come back bitten and clawed, and they rarely think to ask a healer, so I'm glad to see one of you here." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You walk loudly for these woods, {class}, but the beasts of Teldrassil will forgive you that if you come in peace." },
        { id = "h_default", text = "I am Jeen'ra Nightrunner, and I teach the hunters of Darnassus to track, to shoot and to bond with the wild beasts of Teldrassil, as our hunters did in the forests of the old world." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "Ah, one of mine. Your beast trusts you; I can see it in how it stands. I can teach you skills, but I can't teach that." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You'd make a fine tracker, rogue, if only you'd learn to follow something other than a purse." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My cat has had her ears flat and her tail low since you walked up, and I've learned to trust her over my own eyes." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior among the hunters. The beasts in the pens are watching you, so try not to rattle that armor." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Come and sit, and tell me what walks beside you; the people can wait." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The cats in the pens have stopped pacing, and they only do that for one of the Circle, so come in and let them look at you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. My cat doesn't like the smell of the arcane, so forgive her if she growls at you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The beasts here are calm around you, and that is rare in a stranger, so I think the forest has already decided about you." },
      },
      again = {
        { id = "h_again", text = "What else? Speak as you would on the hunt, softly and to the point." },
        { id = "h_again2", text = "Speak, but softly, for a nightsaber hears a careless word a long way off." },
      },
      choices = {
        { text = "You think humans hunt badly, Jeen'ra?", next = "prej", when = { prejudiced = true } },
        { text = "I want training.", next = "BUSINESS" },
        { text = "How do you bond with a beast?", next = "a" },
        { text = "A young hunter needs somewhere to start.", next = "b" },
        { text = "What would a hunter teach a rogue about tracking?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there anything a warrior can learn from hunters?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter of Darnassus learn first, Jeen'ra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is your cat afraid of me, or of what follows me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your hunters ever ask a priest for help?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will the beasts of Teldrassil trust a paladin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do the beasts settle for a druid, Jeen'ra?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why does your cat dislike the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the beasts trust shamans, Jeen'ra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "When will I learn to cheat death, Jeen'ra?", next = "hr_feign", when = { class = "HUNTER", minLevel = 20 } },
        { text = "What did hunting mean in the old forests?", next = "ne_oldforest", when = { race = "NightElf" } },
        { text = "Farewell, Jeen'ra.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Patience, and respect. You do not own a beast, you walk beside it, and when it chooses to walk beside you, the bond is made." } },
      choices = {
        { text = "Do some hunters treat beasts as tools?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Some do, and the beasts know it. A hunter who uses a beast like a weapon will lose it the first time he needs it most." } },
      choices = {
        { text = "A companion deserves respect and care.", next = "BACK", reply = "Then you will never lose a companion when you need one most. I have seen a nightsaber stand over a fallen hunter until the Sentinels came for him.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A beast is a beast. It serves the hunter.", next = "BACK", reply = "It serves, until the day it decides it no longer has to. I hope you are standing somewhere safe that day.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Into the forest around Dolanaar, where the nightsabers prowl, and then across the sea to Darkshore. The wild will teach you more than I can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hr_feign = {
      lines = {
        { id = "jhf_default", text = "Soon, if you live long enough to learn it, which is the joke every trainer in Darnassus tells. When you are ready, I will teach you to fall as though struck and lie as still as a log, and to trust your companion to keep the wolves off while you do." },
        { id = "jhf_has", when = { minLevel = 30 }, text = "You already know how, so I'll tell you what most hunters learn too late: falling is easy, and getting up again at the right moment is the art. Wait for the enemy to turn away, and wait a breath longer than feels right." },
      },
      choices = {
        { text = "A breath longer than feels right.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Jeen'ra.", next = "BACK" },
      },
    },
    ne_oldforest = {
      big = true,
      lines = {
        { id = "jno_default", text = "Everything, before the Sundering. The forests of the old world stretched from sea to sea, and hunters walked them for a year at a time with only a beast for company. Teldrassil is beautiful, but I can walk it in a week, and I miss the old distances." },
      },
      choices = {
        { text = "Then we'll make Kalimdor our forest again.", next = "BACK", reply = "One grove at a time, as the Archdruid says. I hope he's right.", fx = { align = { order = -1 } } },
        { text = "We should guard what we have, not reach for more.", next = "BACK", reply = "That's the Temple's teaching, and it has kept us alive. Perhaps it's wiser.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have hunted these woods since before the tree was grown. Before that, I hunted the old forests of Ashenvale." } },
    centaur = { { id = "tp_centaur", text = "Centaur ride the southern plains in war bands, and they hunt the way we do, without mercy. I respect them, and I'd shoot one without hesitation." } },
    green_dragons = { { id = "tp_green_dragons", text = "In the old forest I saw a green dragon once, sleeping under a great tree. The beasts all went quiet around it, and so did I." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw used to trade furs with us before the corruption came. Those who are left are as proud as ever, and twice as wary." } },
    _none = { { id = "tp_none", text = "I do not know. Ask the wind; it knows more than I." } },
  },
}
