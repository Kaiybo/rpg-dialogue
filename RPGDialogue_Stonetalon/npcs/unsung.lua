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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They have, in older days, and they would again if Darnassus called for it. For now I keep them for messengers and travellers, and I watch the smoke from the vale so I'll know when that day is coming." } },
      choices = {
        { text = "If that day comes, I'll answer it alongside the Sentinels.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your wars aren't mine. I fight for my own cause.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Teloren.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only the harpies, and only because they come in numbers, which no hippogryph will face alone. I'd welcome a hunter who could keep the cliffs clear while my birds rest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is watching my birds, {class}, and they're watching it right back. I think they'll get along, if neither of them blinks." },
      },
      choices = {
        { text = "I'll keep the cliffs clear while your birds rest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Harpies are a soldier's problem. I'll hunt elsewhere.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Teloren.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than you'd think, because the Venture Company sends scouts up the cliffs to see what the druids are planting, and my birds can't follow them into the rocks. If you find one, tell me where he climbed, so I can watch that path from the air." } },
      choices = {
        { text = "I'll find the path and tell you, nothing more.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll find the scout, and he won't climb back down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, because a portal can't see the Charred Vale burning from above, and a hippogryph's rider sees everything on the way. You'd be surprised how much of what the Keeper knows came to him from someone looking down out of the sky." } },
      choices = {
        { text = "The old ways have a wisdom no spell replaces.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Quicker roads will win out in the end, Teloren.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The druids in the Talon Den, likely, and whoever was caught in the fires of the vale. I can fly you to the edges, but I can't fly you into the smoke." } },
      choices = {
        { text = "Then I'll walk into it myself to find them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the smoke is that thick, I'll stay out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The smoke in the vale, and the Venture Company's saws at Windshear, because the mountain has not been quiet since they came. I watch and count, but someone has to go down and do something about it." } },
      choices = {
        { text = "I'll go down and put a stop to the burning.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The fires aren't my concern. I'm only passing through.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Teloren, and I keep the hippogryphs here on Stonetalon Peak. From here they'll carry you to Auberdine, to Astranaar or down to Nijel's Point in Desolace, which is a great deal quicker than the paths." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, come to see the Keeper? He'll be glad of it. Most who climb this far come for the Peak's sake, but few of them can feel what the Vale has lost." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came up the last switchback so quietly the birds didn't stir, and they hear nearly everything. I'd like to know where you learned that, though I don't suppose you'll tell me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "So you're a mage, and I've heard your kind can open doorways across the whole world. I hope you never teach that trick to too many people, or my hippogryphs and I will have nothing to do but watch the smoke." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My hippogryphs will carry you anywhere you need, though they'll want your blade stowed before they let you on their backs." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and I can see by how your beast watches the hippogryphs that it knows what a flying predator is." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll see the smoke from up here too, I expect, and you'll know there are wounded somewhere beneath it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. My birds will carry you, though you'll want to hold on tight, because the mountain winds don't respect armour." },
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
        { text = "Would a quiet walker be any use to you up here?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you really think magic could replace your hippogryphs?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your hippogryphs ever carry Sentinels into battle, Teloren?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the hippogryphs fear predators up here, Teloren?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there anyone below who needs a healer, Teloren?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have a paladin watch for from up here?", next = "xapala", when = { class = "PALADIN" } },
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
