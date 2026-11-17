-- Lakota Windsong, held captive by Arnak Grimtotem at Darkcloud Pinnacle. Voice: bibles/lakota.md
-- Frightened and grieving, but stubborn: she refused Arnak once and means to keep refusing him.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lakota", id = TODO_NPC("Lakota Windsong"), name = "Lakota Windsong",
  bible = "bibles/lakota.md", role = "citizen", tier = "quest",
  temper = { "steady" }, values = { "brave", "loyal" },
  notices = { "race", "stealth" },
  impression = {
    first = "Lakota Windsong is held at Darkcloud Pinnacle because she refused Arnak Grimtotem's offer of marriage. He killed her brother when he tried to stop the abduction, and she has not stopped grieving or refusing.",
    third = "{name} met Lakota Windsong at Darkcloud Pinnacle, the tauren woman Arnak Grimtotem carried off after she refused to marry him.",
  },

  greetings = {
    { id = "g_whisper", text = "Quietly, please. The Grimtotem guards come by when they hear voices." },
    { id = "g_active", when = { questActive = TODO_QUEST("Free At Last") }, text = "Stay close to me. If we stop, they'll surround us." },
    { id = "g_done", when = { questDone = TODO_QUEST("Free At Last") }, text = "You came back up here? After everything? You're braver than I am, and I've been braver than I ever wanted to be." },
    { id = "g_away", when = { away = 14 }, text = "It's been {away}. I counted every one of those days, because counting is all a prisoner has." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Even the guards gossip about you. They say you've been helping people, and they say it like it's a threat." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the shu'halo, and not Grimtotem. You can't know how good it is to see a friendly face of my own people." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "You got past them without a sound. Can you get two of us past them the same way?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Lakota Windsong. Arnak Grimtotem asked me to marry him, and I said no, and that night he came back and took me. My brother tried to stop him, and Arnak killed him in front of me." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Free At Last") },
          text = "You aren't one of them. Please, get me out of here, down off this pinnacle and back toward Freewind Post. I can walk, and I can run, if you can keep the Grimtotem off us." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Free At Last"), days = 3 } },
          text = "Thalia cried when she saw me, and then I cried, and then we both laughed at each other for crying. I told her what you did, and she won't forget it, and neither will I." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren who isn't Grimtotem. Earth Mother, I thought I'd never see one again. Please, I'm Lakota Windsong, and Arnak Grimtotem is holding me here." },
      },
      again = {
        { id = "h_again", text = "Is there something else? Quickly, please." },
        { id = "h_again2", text = "Ask, but keep your voice down; the Grimtotem have ears like wolves." },
      },
      choices = {
        { text = "Why did Arnak take you?", next = "arnak" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Someone must be waiting for you at Freewind.", next = "thalia" },
        { text = "I can get us past the guards unseen.", next = "sneak", when = { class = { "ROGUE", "DRUID" } } },
        { text = "I'll get you out of here.", next = "BUSINESS" },
        { text = "Hold on a little longer.", next = "END" },
      },
    },
    arnak = {
      lines = { { id = "a_default", text = "Because he wanted me, and because the Grimtotem think they can take whatever they want from the other tribes. He keeps telling me I'll learn to love him, as though that were the kind of thing anyone learns." } },
      choices = {
        { text = "Has he hurt you?", next = "hurt" },
        { text = "Something else, Lakota.", next = "BACK" },
      },
    },
    hurt = {
      lines = { { id = "hu_default", text = "Not with his hands, not yet. He thinks he's being patient with me, and he talks about the wedding as if I'd agreed to it, and every day I tell him no, and every day he smiles." } },
      choices = {
        { text = "You've been very brave.", next = "hurt_end" },
        { text = "What will you do when you're free?", next = "hurt_end" },
      },
    },
    hurt_end = {
      big = true,
      lines = { { id = "he_default", text = "Go to Freewind, and sleep somewhere with a door that locks from the inside. And then, I don't know, maybe I'll stop hearing his voice every time the wind moves the tent flaps." } },
      choices = {
        { text = "Then let Arnak face justice, not just your anger.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Arnak deserves whatever you decide to give him.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      lines = { { id = "b_default", text = "He was younger than me, and louder, and he thought he could fight anyone. He stepped in front of Arnak with nothing but a skinning knife, and Arnak didn't even slow down." } },
      choices = {
        { text = "He died protecting you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'm sorry, Lakota.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    thalia = {
      lines = { { id = "t_default", text = "Thalia Amberhide, my friend. She'll be at Freewind Post, waiting, because she never gives up on anything, and she'll have tied knots in something to count the days." } },
      choices = {
        { text = "Then let's not keep her waiting.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sneak = {
      lines = { { id = "s_default", text = "Maybe you could, alone, but I'm a tauren, and we're not built for sneaking. If they see us, we fight, so be ready for that too." } },
      choices = { { text = "I'll be ready.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a tauren of Thunder Bluff, and a prisoner, for now. I'll tell you the rest when we're somewhere safe." } },
    advice = { { id = "tp_ad", text = "If someone won't take no for an answer, don't wait for them to change. Get away, and get help." } },
    grimtotem = { { id = "tp_grim", text = "They're still tauren, but they've forgotten what that means. Arnak certainly has." } },
    _none = { { id = "tp_none", text = "I don't know. Please, Earth Mother, can we talk about it after we're out of here?" } },
  },
}
