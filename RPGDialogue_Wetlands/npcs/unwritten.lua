-- Wetlands folk without a conversation yet: Einar Stonegrip, the croc hunter at the crossroads who won't set foot in Menethil.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Einar Stonegrip: dwarf hunter at the Wetlands crossroads.
P:NPC {
  key = "wl_einar_stonegrip", id = TODO_NPC("Einar Stonegrip"), name = "Einar Stonegrip", gender = "male",
  bible = "bibles/missed.md", role = "hunter", tier = "quest",
  communities = { "wetlands" }, temper = { "gruff", "stubborn" }, values = { "work", "proud" },
  impression = {
    first = "Einar Stonegrip camps at the crossroads where the roads from Dun Modr, Dun Algaz and Menethil Harbor meet, with crocolisk skins stretched on frames behind him. He is a dwarf hunter who looks at the road to Menethil as if it had insulted him.",
    third = "{name} met Einar Stonegrip, a dwarf hunter who camps at the Wetlands crossroads and won't go into Menethil.",
  },
  greetings = {
    { id = "g_default", text = "Hail, traveller. Ye headed to Menethil, by any chance?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, I've another bundle needs deliverin'." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("Daily Delivery") }, text = "Take that bundle to James Halloran in Menethil, an' don't let him short ye." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("Daily Delivery") }, tags = { "news" }, text = "Halloran paid ye fair? Good, he's a decent sort, for a harbour man." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Einar Stonegrip, hunter, an' this is my camp, an' that's the road to Menethil I'll not walk. I trap crocolisks in the marsh an' sell the skins to James Halloran, if someone'll carry them for me." } },
      again = { { id = "h_again", text = "What else, {g:lad|lass}?" }, { id = "h_again2", text = "Aye, go on." } },
      choices = {
        { text = "Why won't you go to Menethil?", next = "why" },
        { text = "How's crocolisk hunting?", next = "crocs" },
        { text = "This crossroads sees a lot of traffic.", next = "road" },
        { text = "Any tips for hunting crocolisks?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because my wife Sida's there, an' we've had words, an' I'll not be the first to say sorry. She knows where I am if she wants me." } },
      choices = {
        { text = "What did you argue about?", next = "argue" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    argue = {
      lines = { { id = "argue_default", text = "Her granny's tomb, at Ironbeard's, an' whether it's worth riskin' her neck to visit. I said it wasn't, an' she said I'd no heart, an' that was that." } },
      choices = {
        { text = "Maybe you should apologise.", next = "sorry" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    sorry = {
      lines = { { id = "sorry_default", text = "Maybe I should, an' maybe she should, an' maybe the marsh'll dry up tomorrow. I'll think on it, but don't hold yer breath." } },
      choices = {
        { text = "Pride isn't worth losing your wife over.", next = "BACK", reply = "Hmph. Ye sound like Sida.", fx = { align = { order = -1 } } },
        { text = "She should come to you first.", next = "BACK", reply = "Exactly what I've been sayin'!", fx = { align = { order = 1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    crocs = {
      lines = { { id = "crocs_default", text = "Good, if ye don't mind wet boots an' the odd missin' finger. The big ones lurk by the river, an' their hides fetch the best price from Halloran." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "road_default", text = "Aye, everyone headin' north to Dun Modr or south to Loch Modan passes right by me. It's lonely, but it's never quiet." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hunter_default", text = "Go for the soft belly, never the back, an' keep yer pet clear of their jaws. A croc'll take a wolf's leg off in one snap." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Nae idea. Ask somebody in Menethil, since I'll not be goin' there." } },
  },
}

