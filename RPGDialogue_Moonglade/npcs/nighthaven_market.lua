-- Nighthaven's small market: Geenia Sunshadow (robes), Darnall (tailoring supplies), Meliri (weapons), Kharedon (light armor).
-- Voice: bibles/nighthaven_market.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Geenia Sunshadow
---------------------------------------------------------------------------
P:NPC {
  key = "geenia", id = TODO_NPC("Geenia Sunshadow"), name = "Geenia Sunshadow", title = "Speciality Dress Maker",
  bible = "bibles/nighthaven_market.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "warm", "chatty" }, values = { "craft", "friendly" },
  notices = { "druid", "naked" },

  impression = {
    first = "Geenia Sunshadow makes robes for the druids of Nighthaven, and she measures every visitor with her eyes before they've said hello. She thinks a druid ought to look as good as the forest does.",
    third = "{name} met Geenia Sunshadow, the dressmaker of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Oh, come in, come in! Let me see you in the light. Yes, I thought so; you need a new robe." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I knew that color would bring you back to me." },
  },

  notice = {
    { id = "n_druid", cat = "druid", when = { class = "DRUID", form = { "bear", "cat" } },
      text = "Oh, druid, please don't shed on my bolts! Change back, there's a dear, and then I'll show you something beautiful." },
    { id = "n_naked", cat = "naked", when = { nearlyNaked = true },
      text = "My goodness, you need me more than anyone who has walked through that door this year. Come here and let me find you something before the Keeper sees you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Geenia Sunshadow, and I make robes for the druids who come to Nighthaven, and for anyone else with the good sense to want one. Moonglade is the most beautiful place in the world, and I don't see why the people in it should dress like they've been sleeping in a barrow den." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren! I've had to learn to cut for your shoulders, and I'm still not sure I've got the horns right on the hoods. Come and stand by the window and let me take a proper look at you." },
      },
      again = { { id = "h_again", text = "What else, dear? I've a hem half-finished, but I can talk while I sew." } },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Who buys robes in Moonglade?", next = "who" },
        { text = "Where do you get your cloth?", next = "cloth" },
        { text = "Goodbye, Geenia.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Druids, mostly, from both the Horde and the Alliance, and the Keeper's peace means I sell to both and nobody minds. The tauren like heavy cloth and the night elves like it light, and I've stopped trying to make one robe that pleases both of them." } },
      choices = {
        { text = "Does the Horde ever give you trouble?", next = "who_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_horde = {
      big = true,
      lines = { { id = "wh2_default", text = "Not once, in Moonglade, though I hear the stories from Ashenvale like everyone else. Some of my neighbours say I shouldn't sell to them at all, peace or no peace." } },
      choices = {
        { text = "The peace here is sacred. Sell to anyone.", next = "BACK", reply = "That's how I've always felt, and the Keeper agrees with us both. A dress doesn't know which side its wearer fights for.", fx = { align = { order = 1 } } },
        { text = "Your neighbours have a point. Ashenvale is still bleeding.", next = "BACK", reply = "They do, and I won't pretend I haven't wondered myself. But Moonglade is the one place the bleeding stops, and I'd like to keep it so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "cl_default", text = "Darnall brings in thread and cloth from Darnassus, and I buy wool from a Horde trader who'd rather I didn't say his name. The dyes I make myself, from moonglade flowers, and those are a secret, so don't ask." } },
      choices = { { text = "I won't ask. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Robes, cloth, color, and who in Nighthaven needs a new hem." } },
    cenarion_circle = { { id = "tp_cc", text = "They're my best customers, dear, though they always want green." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask me about something I can sew." } },
  },
}
