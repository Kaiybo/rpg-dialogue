-- Stonard, the prisoner and the stalls: Infiltrator Marksen under guard, Rogvar the alchemist, Thultash's meat, Hartash's blades, Hekkru's stables. Voice: bibles/stonard_market.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marksen", id = TODO_NPC("Infiltrator Marksen"), name = "Infiltrator Marksen",
  bible = "bibles/stonard_market.md", role = "citizen", tier = "quest",
  communities = { "stonard" }, temper = { "nervous", "sly" }, values = { "self-preserving", "loyal" },
  notices = { "race", "faction", "drink" },

  impression = {
    first = "Infiltrator Marksen is a human spy the orcs caught near Duskwood and keep under guard in Stonard. He swears he knows something that goes beyond Alliance and Horde, and he means to trade it for his freedom.",
    third = "{name} met Infiltrator Marksen, a captured human spy held in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Another visitor for the prisoner! Come closer, friend, the grunts don't bite unless I talk too loudly." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Either you're curious, or they've sent you to soften me up, and I don't much mind which." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "Stay back! No, no, I'll keep my voice down, I swear it. Just stay where the grunts can see you." },
    { id = "g_brew", when = { questReady = TODO_QUEST("Nothing But The Truth") }, text = "Is that ale I smell? Please tell me that's ale, because it's been days since they've let me drink anything but swamp water." },
    { id = "g_after", when = { questDone = TODO_QUEST("Nothing But The Truth") }, text = "Do I know you? Your face swims at me, like something out of a fever I can't quite remember." },
  },

  notice = {
    { id = "n_alliance", cat = "faction", when = { faction = "Alliance" },
      text = "Alliance colors, here! Light above, either you're very brave or very lost, and I'll take either if it gets word out of this place." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've been drinking. I can smell it from here, and I'd trade every secret I have for a single swallow of whatever it was." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_scourge", when = { race = "Scourge" },
          text = "You're one of them. I've nothing to say to you, nothing at all, and if you've come to finish what your friends started, the orcs will want to know why." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Listen, there's no time. I was sent to watch the roads in Duskwood, and I saw something there that Stormwind needs to know, and the orcs need to know it too, strange as that sounds." },
        { id = "h_brew", when = { questReady = TODO_QUEST("Nothing But The Truth") },
          text = "A drink for me? How kind. Let me drink it down, and then I'll tell you what I've learned, because I've a feeling you're the one they'll actually listen to." },
        { id = "h_default", key = true,
          text = "Have mercy on me, friend. I have information that goes beyond Alliance and Horde, and I'm no friend to your Warchief, but there's treachery afoot that has to come out. I'll tell all of it, once someone guarantees I walk out of here alive." },
        { id = "h_after", when = { questDone = TODO_QUEST("Nothing But The Truth") },
          text = "Something happened to me, and the grunts won't say what. My hands shake, my mouth tastes of graves, and every time I reach for what I meant to tell you, it slips away like a fish." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not going anywhere, as you can see." },
        { id = "h_again2", text = "Go on, ask. Talking is the only thing they haven't taken from me." },
      },
      choices = {
        { text = "Who are you, really?", next = "who" },
        { text = "What did you see?", next = "secret" },
        { text = "How do the orcs treat you?", next = "guards" },
        { text = "Here. Drink up, Marksen.", next = "brew", when = { questReady = TODO_QUEST("Nothing But The Truth") } },
        { text = "Before you drink, there's something you should know.", next = "warn", when = { questReady = TODO_QUEST("Nothing But The Truth") } },
        { text = "What should I tell Stormwind?", next = "word", when = { faction = "Alliance" } },
        { text = "I've heard enough.", next = "END" },
      },
    },

    who = {
      lines = {
        { id = "wh_default", text = "Marksen, an infiltrator in the service of Stormwind, which is a grand title for a man who lies in ditches and counts wagons. I was watching the old scout tower in north Duskwood when the orcs came over the hill and took me for a spy, which, to be fair, I am." },
      },
      choices = {
        { text = "What were you watching the tower for?", next = "secret" },
        { text = "A spy's life is cheap. You knew the risk.", next = "who_risk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_risk = {
      lines = {
        { id = "wr_default", text = "I knew it, aye, and I took the coin anyway, and here I am. But a cheap life is still the only one I've got, and I'd like to keep it a while longer." },
      },
      choices = {
        { text = "Every life is worth saving, even a spy's.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then you'd better make your secret worth something.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    secret = {
      lines = {
        { id = "se_default", text = "Not yet, and not here. I'll say only that Beggar's Haunt isn't empty, and the ones using it aren't who your Warchief thinks they are. The rest waits until someone promises me a road home." },
        { id = "se_alliance", when = { faction = "Alliance" },
          text = "The old tower at Beggar's Haunt, in Duskwood, isn't empty. The Forsaken have a camp there, brewing something in the dark, and I think their own allies don't know a thing about it." },
        { id = "se_scourge", when = { race = "Scourge" },
          text = "Ask your own masters. They know better than I do, and they'd be very glad to learn how much I saw, wouldn't they?" },
      },
      choices = {
        { text = "Tell me now and I'll speak for you.", next = "secret_push" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_push = {
      lines = {
        { id = "sp_default", text = "You might, and they might not listen, and then I've thrown away the only coin I have. I've been a spy too long to spend it on a kind face, friend, so forgive me." },
      },
      choices = {
        { text = "Smart. Keep your bargain until it pays.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Hoarding the truth won't save you. Honesty might.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    guards = {
      lines = {
        { id = "gu_default", text = "Better than I'd treat them, if I'm honest. My guards, Tharlak and Zuul, growl at me or ignore me by turns, but they feed me, and nobody's cut anything off yet, which is more than the stories promised." },
      },
      choices = {
        { text = "The Horde keeps its prisoners fairly.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They should have broken you by now.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "What do the orcs want from you?", next = "guards_want" },
      },
    },
    guards_want = {
      lines = {
        { id = "gw_default", text = "What I saw, of course, and what Stormwind's planning, which I don't know and they don't believe. They're waiting for someone with rank to come and question me properly, and I'm waiting too, and we're all getting very bored." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    brew = {
      lines = {
        { id = "br_default", text = "It's been days since they've let me drink, friend, days! Give it here, and when I've wet my throat, I'll tell you everything, because I've a feeling you're the one who'll carry it straight." },
      },
      choices = {
        { text = "Drink, then talk. The Horde needs to hear you.", next = "BUSINESS", fx = { align = { honor = -1 } } },
        { text = "I don't know what's in it. Drink at your own risk.", next = "BUSINESS", fx = { align = { honor = 1 } } },
        { text = "Here. Drink it down.", next = "BUSINESS" },
        { text = "Not yet.", next = "BACK" },
      },
    },
    warn = {
      lines = {
        { id = "wa_default", text = "Something I should know? That it's watered, I suppose, or that it came from the bottom of a barrel. I don't care, friend, I'd drink it out of a boot, so don't you dare take it away from me now." },
      },
      choices = {
        { text = "This came from the Forsaken. Don't drink it.", next = "warn_told" },
        { text = "Nothing. Enjoy it.", next = "BACK" },
      },
    },
    warn_told = {
      lines = {
        { id = "wt_default", text = "The Forsaken? Then they know I'm here, and that means they know what I saw. Light help me, I'd rather the orcs hang me than have those things reach me in the dark." },
      },
      choices = {
        { text = "Nobody deserves to die like that, not even a spy.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "I've warned you. What you do now is your own affair.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    word = {
      lines = {
        { id = "wo_default", text = "Tell Darkshire, the Night Watch, that the tower at Beggar's Haunt has new tenants and they're not ghosts. And if anyone in Stormwind asks after Marksen, say he kept his mouth shut, which is mostly true." },
      },
      choices = {
        { text = "I'll carry word to Darkshire.", next = "BACK", fx = { affinity = 2 } },
        { text = "Can't you escape?", next = "escape" },
        { text = "Something else.", next = "BACK" },
      },
    },
    escape = {
      lines = {
        { id = "es_default", text = "Through a town full of orcs and a swamp full of crocolisks, with legs that haven't walked in a week? I'd get as far as the bridge, and that's being generous to myself." },
      },
      choices = {
        { text = "Then wait. Stormwind may yet bargain for you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd risk the bridge. Waiting gets you hanged.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Stormwind trained me to listen and lie, and the orcs caught me doing both. That's all you'll get for free." } },
    advice = { { id = "tp_ad", text = "Never drink anything offered by someone who smiles too much. Don't ask me why I've been thinking about that." } },
    _none = { { id = "tp_none", text = "I don't know, and if I did, I'd be saving it for someone with a key." } },
  },
}
