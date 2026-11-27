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
    first = "Arnak Grimtotem killed her brother, and she still refuses to marry him.",
    third = "{name} met Lakota Windsong at Darkcloud Pinnacle, the tauren woman Arnak Grimtotem carried off after she refused to marry him.",
  },

  greetings = {
    { id = "o_grim_redeem", when = { opinion = { grimtotem = "redeemable" } }, text = "They say you think the Grimtotem can be redeemed. Arnak killed my brother in front of me, so I do not want to hear it today." },
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
    dd_arnak = {
      lines = {
        { id = "dd_ar_default", text = "I know, and I'm grateful, truly. But my brother is still gone, and Arnak's death doesn't bring him back, and some nights I still wake up thinking I'm in that camp. Do you think it gets easier?" },
      },
      choices = {
        { text = "It will. Justice was done, and that helps.", next = "BACK", reply = "I hope you're right. My brother deserved justice, and now he has it, even if he isn't here to see it.", fx = { align = { order = 1 } } },
        { text = "It doesn't have to. Grieve as long as you need.", next = "BACK", reply = "Thank you for saying that. Everyone else tells me I should be happy now, but you're the first who understands.", fx = { align = { order = -1 } } },
        { text = "Something else, Lakota.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_arnak", tags = { "news" }, when = { questDone = TODO_QUEST("Wanted - Arnak Grimtotem") },
          text = "Longhorn told me Arnak Grimtotem is dead, and that you're the one who killed him. I didn't know what I'd feel when I heard it, and I still don't, but I wanted you to know I've heard." },
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
        { text = "Arnak's dead, Lakota. He won't hurt you again.", next = "dd_arnak", when = { questDone = TODO_QUEST("Wanted - Arnak Grimtotem") } },
        { text = "Why did Arnak take you?", next = "arnak" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Someone must be waiting for you at Freewind.", next = "thalia" },
        { text = "I can get us past the guards unseen.", next = "sneak", when = { class = { "ROGUE", "DRUID" } } },
        { text = "I'll get you out of here.", next = "BUSINESS" },
        { text = "What are the Grimtotem doing up here?", next = "grim_up" },
        { text = "What will you do once you're home?", next = "after" },
        { text = "Arnak shames every tauren who ever lived.", next = "shame", when = { race = "Tauren" } },
        { text = "Hold on a little longer.", next = "END" },
      },
    },
    grim_up = {
      lines = { { id = "grim_up_d", text = "Watching Freewind Post, mostly, and talking about it as if it were already theirs. They say the Needles belong to the Grimtotem alone, and that the tribes who follow Cairne have sold themselves to the orcs." } },
      choices = {
        { text = "They know Freewind's patrols, then?", next = "grim_patrols" },
        { text = "Talk like that ends in blood.", next = "BACK", reply = "That's what my brother said, the night before. Please, let's not talk of it here." },
        { text = "Something else.", next = "BACK" },
      },
    },
    grim_patrols = {
      lines = { { id = "grim_patrols_d", text = "They know when the braves change watch and which paths the caravans use, and I heard them laugh about it. If you see Cliffwatcher Longhorn before I do, please tell him the Grimtotem are counting his braves." } },
      choices = {
        { text = "I'll tell him, I promise.", next = "BACK", reply = "Thank you. I'll feel safer knowing someone besides me heard it." },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "after_d", text = "Go to Thalia first, and then I think I'll go up to Thunder Bluff, to the elders, and tell them what the Grimtotem are. Somebody should say it aloud in front of the whole Bluff, and I've earned the right." } },
      choices = {
        { text = "The High Chieftain should hear it from you.", next = "after_cairne" },
        { text = "You don't have to carry this yourself.", next = "after_carry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_cairne = {
      lines = { { id = "after_cairne_d", text = "Then I'll ask to stand before him, if they'll let me. My brother always said Cairne was too kind to the Grimtotem because they are still tauren, and maybe if he hears what they did to us, he'll be a little less kind." } },
      choices = {
        { text = "He'll listen. He's a fair chieftain.", next = "BACK", reply = "I hope so. I've heard he listens to everyone, even the ones who've lost everything." },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    after_carry = {
      lines = { { id = "after_carry_d", text = "I know, and you're kind to say it. But if I don't speak, nobody will, and Arnak will just be another name the Grimtotem whisper about with pride." } },
      choices = {
        { text = "Then speak loudly, Lakota.", next = "BACK", reply = "I will. My brother would want me to." },
        { text = "Something else.", next = "BACK" },
      },
    },
    shame = {
      lines = { { id = "shame_d", text = "He shames the Grimtotem too, though they'll never say it. Thank you for that; I needed to hear a tauren say it out loud, because up here I'd started to wonder if any of us still believed it." } },
      choices = {
        { text = "Every tauren in Freewind believes it.", next = "BACK", reply = "Then I'll go home to them and believe it too." },
        { text = "Let's get you home. Something else first?", next = "BACK" },
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
        { text = "Then let Arnak face justice, not just your anger.", next = "BACK", reply = "You are kind to say it, and perhaps you are right, though justice is a cold thing to hope for when the wind still carries his voice.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Arnak deserves whatever you decide to give him.", next = "BACK", reply = "I do not know what I will decide, and that frightens me, but thank you for leaving the choice in my hands where it belongs.", fx = { align = { honor = -1 } } },
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
    cairne = { { id = "tp_cairne", text = "Cairne would never allow what Arnak has done to me, if he knew. But the Grimtotem hide their crimes well, and Cairne is far away." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave me the strength to refuse Arnak, and she will give me the strength to escape. I pray to her every night, and she answers." } },
    centaur = { { id = "tp_centaur", text = "The centaur are dangerous, but they are honest about it. The Grimtotem smile and lie, and that is worse." } },
    _none = { { id = "tp_none", text = "I don't know. Please, Earth Mother, can we talk about it after we're out of here?" } },
  },
}
