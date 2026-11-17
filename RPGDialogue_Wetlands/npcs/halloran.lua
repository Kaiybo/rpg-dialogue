-- James Halloran: Menethil's tanner, whose crocolisk leather sails to every port. Voice: bibles/halloran.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wl_halloran", id = TODO_NPC("James Halloran"), name = "James Halloran",
  bible = "bibles/halloran.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "brisk", "cheerful" }, values = { "practical", "proud", "craft" },
  notices = { "craft", "kit" },

  impression = {
    first = "James Halloran tans the crocolisk hides that leave Menethil for ports all over the world, and he's proud of every one. He jokes easily, even about the apprentice the crocs nearly killed.",
    third = "{name} met James Halloran, Menethil Harbor's tanner, famous for his cured crocolisk skins.",
  },

  greetings = {
    { id = "g_default", text = "Mind the vats, they bite worse than the crocs. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Brought me any hides, or just your good company?" },
    { id = "g_away", when = { away = 14 }, text = "There you are, after {away}! Three ships have sailed with my leather since you left, and not one came back with a complaint." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown tougher than the hides I sell, by the look of you. That's a compliment, coming from a tanner." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The harbour's been saying good things about you, and around here that's rarer than a soft croc skin." },
    { id = "g_young", when = { questActive = TODO_QUEST("Young Crocolisk Skins") }, text = "The young ones are right outside town in the marshes. Soft skins, mind, so don't hack at them." },
    { id = "g_giant", when = { questActive = TODO_QUEST("Apprentice's Duties") }, text = "The giant crocs are north up the coast, past the murloc hovels. Go careful." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { name = "Leatherworking" } },
      text = "You've a leatherworker's hands, I can tell by the stains. Come and look at a proper cure some time, for it'll change how you work." },
    { id = "n_skin", cat = "craft", when = { profession = { name = "Skinning" } },
      text = "A skinner! You've no idea how many hides come to me ruined by somebody who thought a sword was a skinning knife." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That leather of yours is cracking, friend. Oil it before it splits, or come see me and I'll show you how." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "James Halloran, tanner. My cured crocolisk skins are sought after all over, and the shipments leave Menethil by boat for ports from here to Booty Bay." },
        { id = "h_young_before", when = { questBefore = TODO_QUEST("Young Crocolisk Skins") },
          text = "I'm in a bit of a pinch, running low on the softer skins that come off crocolisk young. I'll pay good coin for a stack of them, if you're heading into the marsh." },
        { id = "h_young_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Young Crocolisk Skins"), days = 3 } },
          text = "Those skins were superb, and they're curing now. Which reminds me, I've some other work, if you've the stomach for bigger crocs." },
        { id = "h_apprentice", when = { questBefore = TODO_QUEST("Apprentice's Duties"), questDone = TODO_QUEST("Young Crocolisk Skins") },
          text = "I sent my apprentice into the marsh for giant croc skins, and when he didn't come back, I went looking. Let's just say it wasn't a pretty sight." },
        { id = "h_apprentice_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Apprentice's Duties"), days = 3 } },
          text = "Fine skins, and I'll put them to good use. Don't suppose you'd like to be my apprentice? No, you're much too old, and you've other ambitions besides." },
        { id = "h_highland", when = { questActive = TODO_QUEST("Highland Hides") },
          text = "Thicket raptors, up in those highlands where the expedition's digging. Bring me four hides and I'll work out a trade worth your while." },
        { id = "h_daily", tags = { "news" }, when = { questActive = TODO_QUEST("Daily Delivery") },
          text = "That's Einar's bundle, I'd know his knots anywhere. He'd rather send a stranger than walk into town himself, and I've stopped asking why." },
        { id = "h_hunter", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! If you've skins to sell, you've come to the right man, and if your beast's hungry, the scraps are behind the shed." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've hides soaking and they don't like waiting." },
        { id = "h_again2", text = "Ask away. Tanning's slow work, so I've time to talk." },
      },
      choices = {
        { text = "What makes Wetlands crocolisk so prized?", next = "crocs" },
        { text = "How's your apprentice?", next = "apprentice" },
        { text = "Who brings you your skins?", next = "einar" },
        { text = "How does a hide go from marsh to market?", next = "trade" },
        { text = "Any tips for a working leatherworker?", next = "craft", when = { profession = { name = "Leatherworking" } } },
        { text = "Good day, James.", next = "END" },
      },
    },

    crocs = {
      lines = {
        { id = "cr_default", text = "The salt marsh makes them tough and the fresh water keeps them supple, and nowhere else on the coast gives you both. A cured Wetlands hide will outlast the boots it's sewn into." },
      },
      choices = {
        { text = "How do you cure them?", next = "crocs_cure" },
        { text = "Something else, James.", next = "BACK" },
      },
    },
    crocs_cure = {
      lines = {
        { id = "cc_default", text = "Salt, bark and patience, and a recipe I'll take to my grave, thank you very much. The smell's the price of it, and the harbour's never let me forget that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    apprentice = {
      big = true,
      lines = {
        { id = "ap_default", text = "Alive, last I heard. The midwife says he might pull through, and she's not one to say so if she doesn't mean it." },
        { id = "ap_before", when = { questBefore = TODO_QUEST("Apprentice's Duties") },
          text = "Which one? I've had three, and two went home to their mothers. The current lad's keen, I'll give him that, though keen and careful are different words." },
      },
      choices = {
        { text = "You shouldn't have sent a boy after giant crocs.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hard trade, hard lessons. He'll be better for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    einar = {
      lines = {
        { id = "ei_default", text = "Einar Stonegrip, one of the hunters who brings me croc skins. He camps out on the road east and won't set foot in Menethil, which suits the harbour fine and suits me less." },
      },
      choices = {
        { text = "Why won't he come into town?", next = "einar_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    einar_why = {
      lines = {
        { id = "ew_default", text = "There's someone in Menethil he'd rather not meet, and I'll leave it at that, for it's not my tale to tell. He pays his debts and his skins are clean, and that's all a tanner needs to know about a man." },
      },
      choices = { { text = "Something else, James.", next = "BACK" } },
    },

    trade = {
      lines = {
        { id = "tr_default", text = "The hunters bring them in raw, I salt and cure them, and the bales go aboard whatever ship's sailing south. Half the leather in Booty Bay started life in that marsh out there." },
      },
      choices = {
        { text = "Is the bay safe for your shipments?", next = "trade_fleet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_fleet = {
      big = true,
      lines = {
        { id = "tf_default", text = "Cursed ships and murlocs on the beach, and now the dragons over the hills to boot. A merchant learns to price in trouble, or he learns another trade." },
      },
      choices = {
        { text = "Someone should clear the bay for honest traders.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trouble's good for prices. You'll do fine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "third_fleet" } } },
      },
    },

    craft = {
      lines = {
        { id = "ct_default", text = "Never rush the cure, never cut against the grain, and never let a customer see you squint at your own stitches. The rest you'll learn by ruining a few hides, same as I did." },
      },
      choices = {
        { text = "Thanks, James. I'll remember that.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Every hunter in the Wetlands sells to me sooner or later, and they all talk while I count their skins. Ask." } },
    background = { { id = "tp_bg", text = "I've been a tanner since I could lift a scraping knife, and a good one since I stopped cutting myself with it." } },
    advice = { { id = "tp_ad", text = "Never wade after a croc. Make it come to you, on dry land, where you've got your footing and it hasn't." } },
    third_fleet = { { id = "tp_fleet", text = "Ghost ships in the bay, and sailors won't take my bales out past them at night. It's bad for business, and worse for the sailors." } },
    _none = { { id = "tp_none", text = "No idea, friend, but ask at the inn. Somebody there always knows, or says they do." } },
  },
}
