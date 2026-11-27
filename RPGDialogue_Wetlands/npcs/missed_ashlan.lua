-- Ashlan Stonesmirk of the Dun Modr camp, moved here from the Loch Modan roster (a later-era placement). Voice: bibles/missed_ashlan.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ashlan Stonesmirk: gunsmith with Longbraid's dwarves at the Dun Modr camp (Wetlands).
P:NPC {
  key = "lm_ashlan", id = TODO_NPC("Ashlan Stonesmirk"), name = "Ashlan Stonesmirk", title = "Gunsmith", gender = "male",
  bible = "bibles/missed_ashlan.md", role = "soldier", tier = "service",
  communities = { "menethil" }, temper = { "wry", "steady" }, values = { "craft", "loyal" },
  notices = { "class", "craft" },
  impression = {
    first = "Ashlan Stonesmirk keeps the rifles working for Longbraid's dwarves at the edge of Dun Modr. He has the crooked half-smile his name promises and wears it even when he talks about the town they lost.",
    third = "{name} met Ashlan Stonesmirk, gunsmith to the dwarves camped outside Dun Modr.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back, an' still in one piece! Come under the tarp, friend, an' I'll look at yer gun for the price o' a story." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll mend what ye bring, for it's my trade, but keep yer head down an' yer mouth shut." },
    { id = "g_default", text = "Stay low, friend, an' welcome tae what's left o' the Dun Modr garrison. If ye've a gun that needs lookin' at, I'm the dwarf, an' if ye havenae, I'm still the dwarf." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' nobody's shot ye. The Dark Irons must be slippin'." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye keep yer piece clean in a swamp, which is more than I can say for half this camp. I could use ye on the firin' line, if Longbraid hasnae claimed ye already." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Ye've an engineer's hands. Ye wouldnae have a spare mainspring about ye, would ye, because I'm down tae cuttin' them from saw blades." },
  },
  start = "hello",
  nodes = {
    w8_shot = {
      lines = { { id = "w8_shot_a", text = "Roggo Harlbarrow, an' he'll no' thank me for sayin' it. He's got eyes like a hawk an' a temper tae match, an' he hasnae missed a Dark Iron on that wall since the Span fell." } },
      choices = {
        { text = "And the second best?", next = "w8_shot2" },
        { text = "A good shot needs a good gunsmith.", next = "w8_shot2" },
        { text = "I'm a hunter. I could give Roggo a contest.", next = "w8_shot2", when = { class = "HUNTER" } },
        { text = "Something else, Ashlan.", next = "BACK" },
      },
    },
    w8_shot2 = {
      lines = {
        { id = "w8_shot2_a", text = "Me, though only at a target that holds still, which a Dark Iron rarely does. I'd sooner make the guns than fire them, an' every one I mend is a few more shots for Roggo, so we're both doin' our bit." },
        { id = "w8_shot2_hu", when = { class = "HUNTER" }, text = "Ha! I'd pay tae see that, {g:lad|lass}, if I'd any coin left. Go an' tell him so, an' stand well back when ye do, for Roggo doesnae laugh at much these days." },
      },
      choices = {
        { text = "I'll leave Roggo to his count.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "Ashlan Stonesmirk, gunsmith. I had a proper shop inside those walls a while back, an' now I've a crate, a file an' a tarpaulin, an' the Dark Irons have the shop.", fx = { learn = { "dark_iron" } } } },
      again = {
        { id = "h_again", text = "What else? Keep yer voice down while ye ask it." },
        { id = "h_again2", text = "Aye, go on, I can file an' listen." },
      },
      choices = {
        { text = "We should win back Dun Modr fairly, by fighting for it.", next = "BACK", reply = "Aye, an' we will, someday, though the Dark Irons dinnae fight fair at all.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Poison the Dark Irons' wells. They'd do it to us.", next = "BACK", reply = "They would, an' that's what makes them Dark Irons. I'll no' sink tae it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How did Dun Modr fall?", next = "fall" },
        { text = "How do you keep rifles working out here?", next = "rifles" },
        { text = "You're smiling. In this place?", next = "smile" },
        { text = "What was your shop like inside the walls?", next = "yshop" },
        { text = "What worries you most in camp?", next = "yworry" },
        { text = "I'm a hunter. Can you look at my rifle?", next = "BACK", when = { class = "HUNTER" }, reply = "Hand it over. Aye, the marsh has been at yer lock. Oil it nightly or it'll rust shut by the week's end." },
        { text = "Who's the best shot in the garrison?", next = "w8_shot" },
        { text = "Keep them firing, Ashlan.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "The Dark Irons came down on us in numbers we'd no' reckoned on, an' they blew the Thandol Span behind us so nae help could come from Arathi. Longbraid got out those he could, an' we've been starin' at our own walls from the wrong side ever since." } },
      choices = {
        { text = "Can it be taken back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "Wi' the dwarves we have, nae, an' I'll no' lie tae ye about it. Wi' a few more good hands an' their leaders dead, maybe, an' that's what Longbraid an' Rhag are askin' of anyone who'll listen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rifles = {
      lines = { { id = "r_default", text = "Badly, {g:lad|lass}. The marsh gets intae the locks an' the powder both, so I strip every piece in camp each night an' dry the charges over the fire in a pan, which ye should never do an' I do anyway." } },
      choices = {
        { text = "That sounds like a fine way to lose a beard.", next = "beard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beard = {
      lines = { { id = "be_default", text = "I've lost the left side twice, an' it grows back crooked, which suits the name. Better a singed gunsmith than a line o' rifles that go click when the Dark Irons come over the wall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smile = {
      lines = { { id = "s_default", text = "It's how the face is built, friend, an' I've stopped apologisin' for it. My father had it at his own wake, I'm told, an' it's seen me through worse days than this one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  
    yshop = {
      lines = {
        { id = "yashlan_yshop_d", text = "Two rooms an' a forge, wi' a sign my father carved that said Stonesmirk an' Son. I left it hangin' when we ran. Some Dark Iron's likely usin' it for kindlin' by now, or worse, hangin' it over his own door." },
        { id = "yashlan_yshop_v0", when = { race = "Dwarf" }, text = "Two rooms an' a forge, an' a sign my father carved. Ye'll know what it is tae leave a family name behind, {g:lad|lass}. Some Dark Iron's likely burnin' it for warmth." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yworry = {
      lines = {
        { id = "yashlan_yworry_d", text = "Powder, mostly. We've enough for a week o' hard fightin', no' more, an' the supply road from Menethil's long an' watched. Some o' the lads want tae raid the Dark Iron stores inside Dun Modr itself." },
      },
      choices = {
        { text = "Would that work?", next = "yraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yraid = {
      lines = {
        { id = "yashlan_yraid_d", text = "It might, an' it might get six good dwarves killed for three kegs. Longbraid says wait for supply. The younger lads say waitin' is how we lost the town in the first place. I've nae made up my mind." },
      },
      choices = {
        { text = "Wait for supply. Longbraid knows the risks.", next = "BACK", reply = "Aye, likely right. I'll tell the lads tae keep their fuses dry an' their tempers drier.", fx = { align = { order = 1 } } },
        { text = "Raid the stores. Waiting lost you the town.", next = "BACK", reply = "Ye've a point, an' a hard one. I'll put it tae Longbraid, an' he'll no' thank me for it.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    longbraid = { { id = "yashlan_tp_longbraid", text = "Longbraid the Grim leads us now. He's earned the name, an' he's earned our trust besides." } },
    thandol_span = { { id = "yashlan_tp_thandol_span", text = "The Thandol Span was the greatest bridge in Khaz Modan. The Dark Irons blew it, an' a part o' me fell wi' it." } },

    background = { { id = "tp_bg", text = "I was Dun Modr's gunsmith when it had a garrison tae arm. I still am, though the garrison would fit round one fire now." } },
    dark_iron = { { id = "tp_di", text = "They hold our town an' they broke the Span. I've a ball cast for every one o' them." } },
    _none = { { id = "tp_none", text = "I cannae help ye wi' that. Ask Longbraid, though he's no' much for talk these days." } },
  },
}
