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
    hello = {
      lines = { { id = "h_default", text = "Ashlan Stonesmirk, gunsmith. I had a proper shop inside those walls a while back, an' now I've a crate, a file an' a tarpaulin, an' the Dark Irons have the shop.", fx = { learn = { "dark_iron" } } } },
      again = {
        { id = "h_again", text = "What else? Keep yer voice down while ye ask it." },
        { id = "h_again2", text = "Aye, go on, I can file an' listen." },
      },
      choices = {
        { text = "How did Dun Modr fall?", next = "fall" },
        { text = "How do you keep rifles working out here?", next = "rifles" },
        { text = "You're smiling. In this place?", next = "smile" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I was Dun Modr's gunsmith when it had a garrison tae arm. I still am, though the garrison would fit round one fire now." } },
    dark_iron = { { id = "tp_di", text = "They hold our town an' they broke the Span. I've a ball cast for every one o' them." } },
    _none = { { id = "tp_none", text = "I cannae help ye wi' that. Ask Longbraid, though he's no' much for talk these days." } },
  },
}
