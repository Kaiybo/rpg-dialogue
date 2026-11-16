-- Stonetalon Peak's hippogryph master (0.39.0). Voice: bibles/unsung.md.
-- Classic: Teloren stands on Stonetalon Peak (Thal'darah Overlook is Cataclysm and is never named).
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

-- Teloren: hippogryph master at Stonetalon Peak.
P:NPC {
  key = "teloren", id = TODO_NPC("Teloren"), name = "Teloren", title = "Hippogryph Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "calm", "watchful" }, values = { "duty", "nature" },
  notices = { "race", "weary" },
  impression = {
    first = "Teloren keeps the hippogryphs on Stonetalon Peak and watches the smoke rising from the valleys below as if he were counting it. He is calm, but he misses nothing.",
    third = "{name} met Teloren, the watchful hippogryph master of Stonetalon Peak.",
  },

  greetings = {
    { id = "g_default", text = "You climbed all the way up here on foot? Then you've earned a ride down, wherever you're bound." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the peak again. The birds know your scent by now, so they won't fuss." },
  },

  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "I've heard your people can step off a ledge and drift down on the wind. That's a fine trick for going down, but a hippogryph takes you back up again." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like the mountain chewed you up on the way. Rest by the inn a while before you fly, because the birds don't like a rider who can't hold on." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Teloren, and I keep the hippogryphs here on Stonetalon Peak. From here they'll carry you to Auberdine, to Astranaar or down to Nijel's Point in Desolace, which is a great deal quicker than the paths." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, come to see the Keeper? He'll be glad of it. Most who climb this far come for the Peak's sake, but few of them can feel what the Vale has lost." },
      },
      again = {
        { id = "h_again", text = "What else? The wind's steady, so there's no hurry." },
        { id = "h_again2", text = "Ask whatever you like while the hippogryphs settle their feathers." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What do you see from up here?", next = "see" },
        { text = "Is it hard to fly in the mountains?", next = "fly" },
        { text = "Why keep a post this high?", next = "post" },
        { text = "Farewell, Teloren.", next = "END" },
      },
    },
    see = {
      lines = {
        { id = "se_default", text = "Smoke, mostly. The goblins of the Venture Company are cutting and burning their way through the valleys to the south, and the Charred Vale still smolders where the fires ran. On a clear day I can see the Barrens beyond, yellow as dry grass." },
      },
      choices = {
        { text = "Can nothing stop the goblins?", next = "see2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    see2 = {
      lines = {
        { id = "se2_default", text = "Keeper Albagorm and his kin are trying, and anyone with a blade who'll help them. But the goblins are many, and they care only for what the mountain can be sold for, so it will take more than a few of us." },
      },
      choices = {
        { text = "Then they must be stopped by force.", next = "BACK", fx = { align = { light = -1 }, learn = { "venture_company" } } },
        { text = "Heal what's burned first. The fighting can wait.", next = "BACK", fx = { align = { light = 1 }, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    fly = {
      lines = {
        { id = "fl_default", text = "The winds here come up off the cliffs without warning, and a young bird can be thrown off course in a moment. I only send the older ones out from the Peak, and I'd ask you to hold on tightly when you cross the ridges." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = {
        { id = "po_default", text = "Because the Keeper is here, and the druids who serve him, and they need a way to reach the rest of our people quickly. Besides, nothing on foot can surprise us up here, and that's worth a great deal in these mountains." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    venture_company = { { id = "tp_vc", text = "The goblins cut and burn the valleys south of here. I see their smoke every morning." } },
    background = { { id = "tp_bg", text = "I keep the hippogryphs on Stonetalon Peak. Before that I flew the coast of Darkshore, which was gentler." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask Faralia at the inn, or the Keeper, if he's not too busy." } },
  },
}
