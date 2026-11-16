-- The Defias Traitor: turncoat who leads the way to Moonbrook. Voice: bibles/defias_traitor.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "defias_traitor", id = TODO_NPC("Defias Traitor"), name = "Defias Traitor", title = nil,
  bible = "bibles/defias_traitor.md", role = "questgiver", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "nervous" }, values = { "survival" },
  impression = {
    first = "The Defias Traitor talks fast and looks over his shoulder while he does it, a man who has sold out his old crew and knows exactly what they'd do to him for it.",
    third = "{name} met the Defias Traitor, a jumpy turncoat who knows the way to the Brotherhood's hideout.",
  },
  greetings = {
    { id = "g_default", text = "Keep your voice down, will you? If any of my old mates see me talking to you, I'm a dead man." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Are we going or not? Every hour I sit here is another hour for them to find me." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Stoutmantle says you're the one taking me to Moonbrook. I'll show you where the Brotherhood hides, but you keep me alive on the road, because they'll be watching for me." },
        { id = "h_active", when = { questActive = TODO_QUEST("The Defias Brotherhood") },
          text = "Right, we're doing this, then. Stay close, keep your blade out and don't stop for anything, not even if they call my name." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "You've the look of someone who'd have done well with us, you know. Don't take that wrong, it's meant kindly, more or less." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, I don't like standing still." },
        { id = "h_again2", text = "Go on, ask, but keep one eye on the road while you do." },
      },
      choices = {
        { text = "Why did you turn on them?", next = "why" },
        { text = "What's waiting in Moonbrook?", next = "moonbrook" },
        { text = "Tell me about Edwin VanCleef.", next = "vancleef" },
        { text = "I ran with the Brotherhood too, once.", next = "kin", when = { class = "ROGUE" } },
        { text = "Let's go.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because I joined for the pay and the pay stopped coming, and because I saw what they did to the Furlbrows' neighbours. I'm no hero, mind, I just want to live long enough to be a farmer again." } },
      choices = {
        { text = "What did they do?", next = "why_farm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_farm = {
      lines = { { id = "wf_default", text = "Burned the house with the old man still arguing inside it, over a cart of turnips. I held the torches, and I've not slept right since." } },
      choices = {
        { text = "Then what's your price for the truth?", next = "why_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_price = {
      lines = { { id = "wp_default", text = "A pardon from Stoutmantle and a road out of Westfall, that's all. He's promised me both, though I've learned not to trust promises much." } },
      choices = {
        { text = "You held the torches. You deserve the gallows.", next = "BACK", fx = { align = { order = 1 }, affinity = -2 } },
        { text = "A man who turns from evil deserves a second chance.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonbrook = {
      lines = { { id = "m_default", text = "An old smithy that looks empty and isn't, and under it a tunnel down into the mines. That's where VanCleef keeps the whole operation, ships and all, if you'll believe it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vancleef = {
      lines = { { id = "v_default", text = "He was a stonemason once, a master of his guild, until Stormwind's nobles cheated him and his men of their pay. Now he wears a mask and nobody's seen his face in years." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "Did you now? Then you know what they do to deserters, so you'll understand why I'm sweating. Don't tell me which crew you were with; I'd rather not know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    defias = { { id = "tp_defias", text = "Good men turned bad, and bad men who never needed turning. I was somewhere in between." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, can we just go?" } },
  },
}
