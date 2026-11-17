-- Clarice Foster, a Forsaken woman by the Pools of Vision, done with her dead husband. Voice: bibles/clarice.md
-- Bitter, sharp-tongued and still not finished being angry at a man who chose a crusade over her.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "clarice", id = TODO_NPC("Clarice Foster"), name = "Clarice Foster",
  bible = "bibles/clarice.md", role = "citizen", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "sharp" }, values = { "proud", "honest" },
  notices = { "race", "light" },
  impression = {
    first = "Clarice Foster is one of the Forsaken, standing far from home by the Pools of Vision. Her husband Yuriv left her for a crusade and died for it, and she wants his pendant on his grave and him out of her thoughts.",
    third = "{name} met Clarice Foster in Thunder Bluff, a bitter Forsaken woman who sent her late husband's pendant back to his tomb.",
  },

  greetings = {
    { id = "g_pools", text = "Don't stare. The tauren already do enough of that, and they're politer about it." },
    { id = "g_active", when = { questActive = TODO_QUEST("Until Death Do Us Part") }, text = "The Sepulcher, in Silverpine. Put it on his tomb and walk away; that's what he did." },
    { id = "g_done", when = { questDone = TODO_QUEST("Until Death Do Us Part") }, text = "It's on his grave, then. Good. I thought I'd feel something, and I don't, which is also good." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone. I noticed, which surprises me, since I've given up noticing most things." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're stronger than the errand-runner who took my pendant. Death does that to some of us, and life does it to others." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody on the rises is angry with you. Welcome to my world, though at least yours might forgive you." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us, this far from Lordaeron. Don't let them make you a curiosity; I made that mistake my first week." },
    { id = "n_light", cat = "light", when = { class = { "PRIEST", "PALADIN" }, ["not"] = { race = "Scourge" } },
      text = "You smell of the Light. My husband used to come home smelling like that, on the rare nights he came home at all." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Clarice Foster. I came to Thunder Bluff because it was as far from Lordaeron as the zeppelin and my own two feet would take me, and I stay because the tauren don't ask about my husband." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Until Death Do Us Part") },
          text = "He left me for his blasted crusade, because the Light was the most important thing we had against the undead, he said. Well, he's dead now, and I'm the very thing he was trying to stop, so take this pendant to his tomb at the Sepulcher. I want nothing more to do with it, or with him." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Until Death Do Us Part"), days = 3 } },
          text = "You put it on his tomb? And the gem dulled, you say. Fitting, really, because so did everything else about that man, eventually." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Another one of the Dark Lady's lost souls, so far from the Undercity. Sit, if you like; the tauren won't mind, and I've stopped caring who does." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, as you can see." },
        { id = "h_again2", text = "Go on. Talking passes the time, and I have a great deal of it now." },
      },
      choices = {
        { text = "Tell me about your husband.", next = "yuriv" },
        { text = "Why Thunder Bluff, of all places?", next = "bluff" },
        { text = "Do you remember being alive?", next = "alive" },
        { text = "I'm Forsaken too. How do you bear it here?", next = "kin", when = { race = "Scourge" } },
        { text = "I serve the Light. Your husband might have been right.", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Goodbye, Clarice.", next = "END" },
      },
    },
    yuriv = {
      lines = { { id = "y_default", text = "Yuriv. He took up the Light and a crusade with it, and every night I sat waiting while he went out to fight the dead. Always second to his blasted duty, and now he lies in a tomb in Silverpine." } },
      choices = {
        { text = "He was trying to protect you.", next = "protect" },
        { text = "He sounds like a fool.", next = "fool" },
      },
    },
    protect = {
      lines = { { id = "p_default", text = "That's what he said, and I believed him for years. But what about his children? What about me, sitting there with the door barred, wondering which knock would be the one that told me he was dead?" } },
      choices = {
        { text = "Your children? What happened to them?", next = "children" },
        { text = "Something else, Clarice.", next = "BACK" },
      },
    },
    children = {
      big = true,
      lines = { { id = "ch_default", text = "Don't. I don't talk about them, not to strangers and not to myself. Ask me about Yuriv; that anger at least I can stand to hold." } },
      choices = {
        { text = "I'm sorry. I won't ask again.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "You can't run from them forever, Clarice.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Then tell me more about Yuriv.", next = "fool" },
      },
    },
    fool = {
      lines = { { id = "f_default", text = "A fool and a hero, and I never could tell which was which. People said he died bravely, and I'm sure he did, because he was always braver about other people's lives than about our own." } },
      choices = { { text = "Something else, Clarice.", next = "BACK" } },
    },
    bluff = {
      lines = { { id = "b_default", text = "Because nobody here knew me before, and nobody here knew him. The tauren treat me like a strange guest, which is better than how the living of Lordaeron would treat me." } },
      choices = {
        { text = "The tauren are good hosts.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then Lordaeron's loss is Thunder Bluff's gain.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    alive = {
      lines = { { id = "a_default", text = "Some of it, the way you remember a dream after waking. I remember the kitchen and the smell of bread, and I remember being angry, and the anger came through death better than the bread did." } },
      choices = {
        { text = "Maybe you could let the anger go.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep the anger. It's yours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "By keeping my hands busy and my mouth sharp. The tauren are kind in their way, but they look at us like a sickness that learned to talk, and we have to make them forget it one conversation at a time." } },
      choices = { { text = "Then we'll keep talking.", next = "BACK", fx = { affinity = 2 } } },
    },
    light = {
      lines = { { id = "l_default", text = "Right? Perhaps. And dead, and I'm still here, so you tell me what his Light bought him. Go ahead and pray for him if you like, because I've given up doing it." } },
      choices = {
        { text = "I'll pray for him, and for you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A wife, once, in Lordaeron. Now I'm a Forsaken woman in a tauren city, and that's as much of my story as you'll get." } },
    advice = { { id = "tp_ad", text = "Don't marry anyone who loves a cause more than you. Take it from a woman who did." } },
    scarlet_crusade = { { id = "tp_sc", text = "Zealots who want people like me burned. Yuriv would have hated them, I think, or joined them, and I honestly can't say which." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took me in my own kitchen, and I woke up dead and hungry and answering to a voice in my head. The Dark Lady silenced that voice, and I have been grateful in my cold way ever since." } },
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, which is a gloomy name, but an honest one. The tauren are kind to me here, which is more than the living of Lordaeron ever were." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady freed us from the Lich King, and she asks for very little in return. Only everything, I suppose, but I gave that up when I died." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron was my home, and it is a graveyard now. My husband left it to fight for the Crusade, and I stayed to watch it fall, and I don't know which of us chose worse." } },
    stratholme = { { id = "tp_stratholme", text = "My sister lived in Stratholme when the prince came, and I never heard from her again. I do not go looking for her, because I am afraid of what I would find." } },
    _none = { { id = "tp_none", text = "I don't know and I don't care. Ask someone with more of a life than I've got." } },
  },
}
