-- Farmer Furlbrow (Theodore), squatting at the Jansen Stead. Voice: bibles/furlbrow.md
-- Lost his farm to the Defias and his wagon to the road.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "furlbrow", id = TODO_NPC("Farmer Furlbrow"), name = "Farmer Furlbrow",
  bible = "bibles/furlbrow.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "cowardly" }, values = { "honest" },
  notices = { "startle", "mount" },

  greetings = {
    { id = "g_porch", text = "This isn't our place. We're just minding it. For now." },
    { id = "g_deed", when = { questActive = TODO_QUEST("Furlbrow's Deed") }, text = "The deed? You've found it? Let me see. Let me see." },
    { id = "g_watch", when = { questDone = TODO_QUEST("The Forgotten Heirloom") }, text = "Still ticks, you know. Wind it every morning. Silly old man." },
  },

  notice = {
    { id = "n_startle", cat = "startle", place = "replace", when = { stealthed = true },
      text = "Light's sake! Don't creep up on a man like that. Not out here. Not after what we've had." },
    { id = "n_horse", cat = "mount", when = { mounted = true },
      text = "Lovely animal. Don't let it near our wagon wheel; it's the only one that still turns." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Theodore Furlbrow. We grew pumpkins north of here, Verna and I. Then the thieves came, and now we grow nothing." },
        { id = "h_deed_before", when = { questBefore = TODO_QUEST("Furlbrow's Deed") },
          text = "They made me give up the deed. Stood over me till I did. It's out there somewhere, in one of their pockets." },
        { id = "h_deed_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Furlbrow's Deed"), days = 3 } },
          text = "Our deed. Our names, Verna's and mine. They kept it to copy for their forgeries, the note says. Not anymore." },
        { id = "h_heirloom", when = { questActive = TODO_QUEST("The Forgotten Heirloom") },
          text = "My pocket watch. My father's, before that. It's in one of their houses. They didn't even want it. They just took it." },
        { id = "h_heirloom_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Forgotten Heirloom"), days = 3 } },
          text = "My father's watch. You brought my father's watch back. I've nothing to give you but this handshake, and it's a good one." },
        { id = "h_wagon", text = "We tried to leave for Elwynn. The wagon broke on the road. So here we are, in someone else's empty house. Waiting for a wheel." },
      },
      choices = {
        { text = "Will you go back to your farm?", next = "back" },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "Take care, Theodore.", next = "END" },
      },
    },
    back = {
      big = true,
      lines = {
        { id = "b_default", text = "Verna says yes. I say yes when she's listening. Truth is, I don't know if I've the stomach for it anymore." },
      },
      choices = {
        { text = "You will. Give it time.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "There's no shame in starting over.", next = "END", fx = { affinity = 1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Don't. Please. I see red masks when I close my eyes." } },
    old_blanchy = { { id = "tp_blanchy", text = "Pulled our wagon longer than I can remember. Now she can barely pull herself. Verna won't hear of selling her." } },
    westfall = { { id = "tp_westfall", text = "Pumpkins. Rows of them, all the way to the hills. You'd never believe it now." } },
    _none = { { id = "tp_none", text = "I don't know much anymore. Ask Verna; she remembers for both of us." } },
  },
}
