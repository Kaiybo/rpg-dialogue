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
          text = "My pocket watch. Verna's father gave it to me the day we wed. It's in the wardrobe at the old house, and there's thieves sleeping in our beds." },
        { id = "h_heirloom_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Forgotten Heirloom"), days = 3 } },
          text = "Her father's watch. You brought it back. I've nothing to give you but this handshake, and it's a good one." },
        { id = "h_wagon", text = "We tried to leave for Elwynn. The wagon broke on the road. So here we are, in someone else's empty house. Waiting for a wheel." },
        { id = "h_dream", when = { metBefore = true }, text = "I dreamt about the pumpkins again. Big as wagon wheels, all of them. Woke up and remembered. Still, it was a good dream, while it lasted." },
      },
      again = {
        { id = "h_again", text = "Something else? I've time. Time's about all I've got." },
        { id = "h_again2", text = "Go on. I'm only watching the road for a wheelwright." },
      },
      choices = {
        { text = "Will you go back to your farm?", next = "back" },
        { text = "What happened the night you left?", next = "night" },
        { text = "Why not fix the wagon and go?", next = "wagon" },
        { text = "Tell me about your deed.", next = "deed" },
        { text = "Fear isn't a sin, Theodore.", next = "courage", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I remember your pumpkins. Everyone did.", next = "pumpkins", when = { origin = "human_westfall_farmhand" } },
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
        { text = "You will. Give it time.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "There's no shame in starting over.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
        { text = "What would it take?", next = "back_take" },
      },
    },
    back_take = {
      lines = { { id = "bt_default", text = "The thieves gone. The walking scarecrows gone. And me not jumping every time a crow lands. That last one's the hardest." } },
      choices = {
        { text = "The first two, I can help with.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      lines = {
        { id = "ni_default", text = "Verna heard it first. Noise in the fields. I looked out and they were everywhere, red in the lamplight. We took what we could carry and ran." },
        { id = "ni_done", when = { questDone = TODO_QUEST("The Forgotten Heirloom") },
          text = "We ran so fast I left the one thing I'd have carried through fire. You fetched it back. I still can't believe it." },
      },
      choices = {
        { text = "Did you leave anything behind?", next = "watch" },
        { text = "Running kept you both alive.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    watch = {
      lines = { { id = "wa_default", key = true, text = "My pocket watch, in the wardrobe. Verna's father gave it to me on our wedding day, and I left it for thieves. I'd like it back before I'm too old to wind it." } },
      choices = {
        { text = "I'll find it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagon = {
      lines = { { id = "wg_default", text = "With what? The wheel's split clean through, and nobody out here mends wheels anymore. They've all gone east. So we sit. Verna calls it resting." } },
      choices = {
        { text = "Saldean stayed. Why not you?", next = "saldean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saldean = {
      lines = { { id = "sd_default", text = "Saldean's stubborn as a stump. I begged him to pack up and come with us. He laughed. Well, I'm not stubborn. I'm stuck. There's a difference." } },
      choices = {
        { text = "He calls you the fool.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Maybe staying takes a different courage.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    deed = {
      lines = { { id = "de_default", text = "The thieves leaned on me till I signed it over. I'm not proud of it. They'd have burned the house with us in it." } },
      choices = {
        { text = "Why would thieves want a deed?", next = "forgery" },
        { text = "You did what you had to.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    forgery = {
      lines = { { id = "fg_default", text = "To copy, the note said. Forge their own and call our farms theirs, all neat and legal. Paper's a weapon too, in the wrong hands." } },
      choices = {
        { text = "Then the deed's worth fighting for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    courage = {
      big = true,
      lines = { { id = "co_default", text = "Isn't it? Feels like one. A man's supposed to stand in front of his wife, not behind her with the lamp." } },
      choices = {
        { text = "You got her out alive. That's what matters.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Then stand in front of her next time.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    pumpkins = {
      lines = { { id = "pu_default", text = "You remember? Rows of them, orange right to the hills. Someone remembers. That's... well. Thank you." } },
      choices = { { text = "They'll grow again.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Pumpkin farmer. Husband to Verna, which is the better job. Not much else, these days.", next = "night" } },
    advice = { { id = "tp_ad", text = "Get out of Westfall while you can. Or don't. Nobody listens to me. Saldean certainly doesn't." } },
    defias = { { id = "tp_defias", text = "Don't. Please. I see red masks when I close my eyes." } },
    old_blanchy = { { id = "tp_blanchy", text = "Pulled our wagon longer than I can remember. Now she can barely pull herself. Verna won't hear of selling her." } },
    westfall = { { id = "tp_westfall", text = "Pumpkins. Rows of them, all the way to the hills. You'd never believe it now." } },
    _none = { { id = "tp_none", text = "I don't know much anymore. Ask Verna; she remembers for both of us." } },
  },
}
