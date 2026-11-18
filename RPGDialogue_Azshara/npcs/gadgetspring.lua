-- The Gadgetsprings' house on the beach of the Ruined Reaches: Jubie (engineering supplies) and her husband Blimo (trade supplies).
-- Voice: bibles/gadgetspring.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Jubie Gadgetspring
---------------------------------------------------------------------------
P:NPC {
  key = "jubie", id = TODO_NPC("Jubie Gadgetspring"), name = "Jubie Gadgetspring", title = "Engineering Supplies",
  bible = "bibles/gadgetspring.md", role = "vendor", tier = "service",
  communities = { "ruined_reaches" }, temper = { "brisk", "cheerful" }, values = { "inventive", "practical" },
  notices = { "engineer" },

  impression = {
    first = "Jubie Gadgetspring sells engineering supplies from a two-story house on a lonely Azshara beach, and she seems delighted that anyone found it. She talks about her husband Blimo with fond exasperation.",
    third = "{name} met Jubie Gadgetspring, the gnome who sells engineering supplies on the beach of the Ruined Reaches.",
  },

  greetings = {
    { id = "g_default", text = "A customer! On our beach! Blimo, put the kettle on, we've got a customer!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Blimo owes me a silver; he said nobody comes back." },
  },

  notice = {
    { id = "n_eng", cat = "engineer", when = { profession = "Engineering" },
      text = "Oh, an engineer, I can tell by the soot! Do you need tubes? Everybody always needs tubes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jubie Gadgetspring, engineering supplies: tubes, frameworks, blasting powder, parchment and ink. My husband Blimo sells everything else downstairs, and between the two of us, we've got whatever an adventurer forgets to bring to the end of the world." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, all the way out here! Oh, it's been so long since I talked shop with someone who understood a single word I said. Pull up a crate and tell me how things are in Ironforge." },
      },
      again = { { id = "h_again", text = "Anything else, dear? I've a schematic on the boil." } },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why live on a beach in Azshara?", next = "beach" },
        { text = "Aren't you afraid of the naga?", next = "naga" },
        { text = "Goodbye, Jubie.", next = "END" },
      },
    },
    beach = {
      lines = { { id = "be_default", text = "Blimo wanted somewhere quiet after Gnomeregan, and I wanted somewhere I could test a rocket without the neighbors complaining. There aren't any neighbors here, unless you count the giants, and the giants have never once complained about the noise." } },
      choices = {
        { text = "You fled Gnomeregan?", next = "beach_gnomer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beach_gnomer = {
      lines = { { id = "bg_default", text = "Before the end, thankfully, on one of the last carts to Ironforge. We didn't like Ironforge much, all that stone, so we kept going until we found sand. I miss the old workshops, but I don't miss the trogg-shaped things in them now." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    naga = {
      big = true,
      lines = { { id = "na_default", text = "Terrified, dear, every night! But they mostly stay out by the wreck and the ruins, and I've rigged the porch with enough blasting powder to make them think twice. Blimo says we should move somewhere safer, and I say there's no such thing." } },
      choices = {
        { text = "Blimo's right. Move somewhere safe.", next = "BACK", reply = "Oh, he'd love to hear you say that, dear, and he'll never let me forget it. But I've put too much powder in that porch to leave it now.", fx = { align = { order = 1 } } },
        { text = "Stay. It's your home, so defend it.", next = "BACK", reply = "That's what I keep telling him, dear, and now I've got a witness! Blasting powder and a stubborn wife, that's the best defence there is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Parts, powder, and our little stretch of beach." } },
    gnomeregan = { { id = "tp_gn", text = "We got out in time. Not everyone did." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know, dear. Ask Blimo; he likes to pretend he knows things." } },
  },
}

---------------------------------------------------------------------------
-- Blimo Gadgetspring
---------------------------------------------------------------------------
P:NPC {
  key = "blimo", id = TODO_NPC("Blimo Gadgetspring"), name = "Blimo Gadgetspring", title = "Trade Supplies",
  bible = "bibles/gadgetspring.md", role = "vendor", tier = "service",
  communities = { "ruined_reaches" }, temper = { "nervous", "gentle" }, values = { "careful", "kind" },

  impression = {
    first = "Blimo Gadgetspring sells trade supplies downstairs from his wife's workshop, and he jumps at every bang from the floor above. He'd rather be anywhere quieter, and says so politely.",
    third = "{name} met Blimo Gadgetspring, who sells trade supplies in a beach house in Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Hello, hello! Don't mind the thumping upstairs, that's just Jubie. At least, I hope it is." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again! I lost a silver on you, you know. Jubie was quite smug." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Blimo Gadgetspring, trade supplies: thread, dye, vials, coal, fishing lures, a bit of everything. Jubie handles the explosive things upstairs, and I handle the things that don't explode, which is a much shorter list than you'd think in this house." },
      },
      again = { { id = "h_again", text = "Anything else? I've time; nobody else is coming." } },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Do you like living here?", next = "here" },
        { text = "What's out on the cliffs?", next = "cliffs" },
        { text = "Goodbye, Blimo.", next = "END" },
      },
    },
    here = {
      big = true,
      lines = { { id = "he_default", text = "I like Jubie, and Jubie likes it here, so I suppose I like it here. Mostly I count the naga on the beach every morning and hope the number doesn't go up. I'd move to Ratchet tomorrow, but she won't hear of it." } },
      choices = {
        { text = "Tell her you're leaving. Your safety matters too.", next = "BACK", reply = "I couldn't, not really, she'd be all alone with the naga and her powder. But it's kind of you to think of me.", fx = { align = { honor = -1 } } },
        { text = "Stay with her. That's what marriage is.", next = "BACK", reply = "That's what I keep telling myself, every morning when I count the naga. It helps, a little.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cliffs = {
      lines = { { id = "cl_default", text = "Giants, mostly, the big blue cliff walkers, who stomp about and don't seem to notice us at all. Jubie says they're harmless. I've noticed she says that from upstairs, though, where the windows are higher." } },
      choices = {
        { text = "Do the giants ever come close?", next = "cliffs_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cliffs_close = {
      lines = { { id = "cc_default", text = "One did, last spring, and picked up our rain barrel and looked into it for a very long time. Then it put it down, quite gently, and walked off. I didn't sleep for a week." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, naga counts, and giants' habits. Not much else." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Jubie might, if you shout up the stairs." } },
  },
}
