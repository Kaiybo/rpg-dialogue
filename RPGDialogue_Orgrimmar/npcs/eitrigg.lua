-- Eitrigg, the old Blackrock veteran at the Warchief's side in Grommash Hold. Voice: bibles/eitrigg.md
-- A tired soldier who left the old Horde in shame, owes his life to a human, and knows the Blackrock better than anyone.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eitrigg", id = TODO_NPC("Eitrigg"), name = "Eitrigg",
  bible = "bibles/eitrigg.md", role = "noble", tier = "major",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "honorable", "wise", "loyal" },
  notices = { "race", "soldier" },
  impression = {
    first = "Eitrigg is an old Blackrock warrior who walked away from the Horde once and was brought back by Thrall. He speaks of a human paladin named Tirion as his brother, and he does not say it lightly.",
    third = "{name} spoke with Eitrigg in Grommash Hold, the aged Blackrock veteran who counsels the Warchief and owes his life to a human paladin.",
  },

  greetings = {
    { id = "g_hold", text = "Speak plainly, {class}. The Warchief's hall has no patience for anything else, and neither have I." },
    { id = "g_rend", when = { questActive = TODO_QUEST("Eitrigg's Wisdom") }, text = "You carry word from the Steppes. Come here, and let me see what Goretooth has written." },
    { id = "g_rend_dead", when = { killed = { name = "Rend Blackhand" } }, text = "Rend is dead. I find I can say it without any joy, only relief." },
    { id = "g_away", when = { away = 21 }, text = "{away} gone, and you come back with new scars. Good, because an old soldier distrusts a young one without any." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10 }, text = "You've grown into your weapons since we last spoke. I remember when I did the same, and I remember what I used them for, so choose better than I did." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "The hall talks, and it says you were caught in a lie. I served liars once, {class}, and I left the Horde over it, so think on that." },
    { id = "g_word_helped", when = { word = "helped" }, text = "They say in the Valley of Strength that you've been helping where you could. That is what the Warchief built this city for." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's people. Once you were human, and a human saved my life, so I find I look at you more kindly than most orcs do." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR", race = "Orc" },
      text = "You carry yourself like a grunt who has seen a real fight. Keep your honor in front of your axe, and the axe will follow." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Eitrigg. I fought for Blackhand and for Doomhammer, I left the Horde when I learned what it had become, and Thrall brought me home again. Now I stand in his hall and tell him what the old days cost us." },
        { id = "h_rend_q", tags = { "news" }, when = { questActive = TODO_QUEST("Eitrigg's Wisdom") },
          text = "Rend Blackhand alive? We thought him dead for decades, and Goretooth would not write it if he did not believe it. None know the Blackrock better than I do, so sit, and I will tell you what the Warchief must hear." },
        { id = "h_rend_done", tags = { "news" }, when = { killed = { name = "Rend Blackhand" } },
          text = "Rend called himself Warchief from his stolen mountain and called our people slaves. He died a Blackrock, as his father did, and I hope the clan's young ones are watching which of us they choose to follow." },
        { id = "h_orcwar", when = { race = "Orc", class = "WARRIOR" },
          text = "A young orc warrior in the Warchief's hall. When I was your age, I would have died for any chieftain who shouted loud enough, so learn from my mistakes and save yourself the trouble." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman. When I left the old Horde, the warlocks ruled us and the spirits had turned their faces away, so seeing one of you in this hall still feels like a homecoming." },
        { id = "h_undead", when = { race = "Scourge" },
          text = "You were human once, and I owe a human my life, so you may speak freely. Few of my kind will say that to you, and I know why, but I am too old to hate by habit." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while I have the patience, which is longer than most think." },
        { id = "h_again2", text = "Go on. An old soldier has more stories than he has hours." },
        { id = "h_again3", when = { disposition = { min = 65 } }, text = "Ask what you will. I find I don't mind your questions." },
      },
      choices = {
        { text = "You left the Horde? Why?", next = "leaving" },
        { text = "Who saved your life?", next = "tirion" },
        { text = "Tell me about the Blackrock clan.", next = "blackrock" },
        { text = "What do you think of the Warchief?", next = "thrall" },
        { text = "Goretooth sent me. Rend Blackhand lives.", next = "rend", when = { questActive = TODO_QUEST("Eitrigg's Wisdom") } },
        { text = "Rend Blackhand is dead. I was there.", next = "rend_dead", when = { killed = { name = "Rend Blackhand" } } },
        { text = "How should a warrior carry his honor?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you hate my kind, being human once?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to the Warchief.", next = "END" },
      },
    },
    leaving = {
      lines = { { id = "lv_default", text = "After the Second War, the Horde was beaten and scattered, and I had time to think on things Garona once told me about Gul'dan and the warlocks. I came to believe her, and once I believed her I could not wear the Horde's colors, so I went north to die somewhere quiet." } },
      choices = {
        { text = "Garona? The half-orc?", next = "garona" },
        { text = "And you didn't die.", next = "tirion" },
        { text = "Something else, Eitrigg.", next = "BACK" },
      },
    },
    garona = {
      lines = { { id = "ga_default", text = "She served Gul'dan and the council, and she knew what they were before any of us. Most orcs remember her as a traitor or a tool, and I remember that she told the truth when it could have cost her everything." } },
      choices = {
        { text = "Truth told at a cost is worth the most.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A spy who switches masters is still a spy.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    tirion = {
      big = true,
      lines = { { id = "ti_default", key = true, text = "A paladin named Tirion Fordring found me living in an old tower near Hearthglen. We fought, the tower came down, and I pulled him out of the rubble because I was too tired of killing to leave him there." } },
      choices = {
        { text = "And then?", next = "tirion2" },
        { text = "An orc saving a paladin. Strange.", next = "tirion2" },
      },
    },
    tirion2 = {
      lines = { { id = "t2_default", text = "His own people came to take me to Stratholme for execution, and Tirion stood between us. For that, they stripped him of his title and his lands, and still he came for me, with Thrall and the new Horde beside him." } },
      choices = {
        { text = "Where is Tirion now?", next = "tirion3" },
        { text = "Your enemy gave everything for you.", next = "tirion3" },
      },
    },
    tirion3 = {
      big = true,
      lines = {
        { id = "t3_default", text = "Exiled, last I heard, living alone somewhere in the plaguelands his kingdom became. I call him my brother, and I mean it as I mean nothing else, and some of my people will never forgive me for that." },
      },
      choices = {
        { text = "Honor doesn't care what race it's born in.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Humans killed our people. Debts to them are foolish.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Does Thrall share your view?", tag = "Persuade", next = "thrall_secret",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Scourge" }, { trait = "kind" }, { class = "PALADIN" } } } },
          fail = { next = "thrall_closed", fx = { affinity = -1 } } },
      },
    },
    thrall_secret = {
      lines = { { id = "ts_default", text = "He does, more than he can say in this hall. Thrall was raised by humans, the worst of them and one of the best, and he knows better than any orc that both kinds exist. He cannot say so aloud while the grunts still remember the camps, so I say it for him when it needs saying." } },
      choices = {
        { text = "Then you're his voice in some things.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll keep that between us.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    thrall_closed = {
      lines = { { id = "tc_default", text = "The Warchief's mind is his own to speak, {class}, not mine to lend out to whoever asks. Ask him yourself, if you have the nerve." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    blackrock = {
      lines = { { id = "br_default", text = "My father was a Blackrock, and his father before him, and so am I. But before anything else I am an orc, and that means honor first, and the Blackrock who follow Rend in the mountains have forgotten it." } },
      choices = {
        { text = "Where are the Blackrock now?", next = "blackrock_now", fx = { learn = { "blackrock" } } },
        { text = "Do you still feel bound to them?", next = "blackrock_bound" },
      },
    },
    blackrock_now = {
      lines = { { id = "bn_default", text = "In Blackrock Mountain, far to the east, in the Burning Steppes, holding the spire with dragons and ogres for allies. They call themselves the true Horde and call us slaves to a soft Warchief." } },
      choices = {
        { text = "Then they'll learn otherwise.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blackrock_bound = {
      big = true,
      lines = { { id = "bb_default", text = "Bound by blood, yes, and that is why their shame is mine to answer. If I could pull one young Blackrock out of that mountain and bring him here, I would count it worth more than every battle I won for Blackhand." } },
      choices = {
        { text = "Some of them might still be saved.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose their side. Let them die on it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Eitrigg.", next = "BACK" },
      },
    },
    thrall = {
      lines = { { id = "th_default", text = "The Warchief listens, which no chieftain of my youth ever did. He hears the old soldiers and the shamans and the trolls and the tauren, and then he decides, and the deciding is lonelier than any of you know." } },
      choices = {
        { text = "Then he's lucky to have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Some say he's too soft on the Alliance.", next = "soft" },
      },
    },
    soft = {
      lines = { { id = "so_default", text = "Some said that of me in Hearthglen, and I was the one who carried a man out of a fallen tower. Peace with the Alliance is not softness, it is the hardest thing the Warchief has ever tried, and it may fail, but it is worth the trying." } },
      choices = {
        { text = "Peace is worth the risk.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Alliance only understands strength.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rend = {
      big = true,
      lines = { { id = "re_default", text = "Rend was Blackhand's son, and he and his brother Maim fled into the mountain when the Horde fell. If he lives and leads the Blackrock, then every Blackrock in that mountain is a sword pointed at this city, so take this to the Warchief at once and tell him Eitrigg agrees: no orc should be denied his vengeance." } },
      choices = {
        { text = "I'll go to the Warchief now.", next = "END", fx = { affinity = 1 } },
        { text = "You knew Rend?", next = "rend_knew" },
      },
    },
    rend_knew = {
      lines = { { id = "rk_default", text = "I knew his father better, and that was enough. Blackhand drank the blood and called it strength, and his sons learned at his knee, so do not expect Rend to bargain or to break." } },
      choices = { { text = "Then I'll go to Thrall.", next = "END", fx = { learn = { "blackrock" } } } },
    },
    rend_dead = {
      lines = { { id = "rd_default", text = "Then I thank you, and I will not pretend to mourn him. I knew his father, and I hoped the son might turn out better, and he didn't, so now the young Blackrock in that mountain have one less voice telling them lies." } },
      choices = { { text = "It was a hard fight.", next = "BACK", fx = { affinity = 2 } } },
    },
    warrior = {
      lines = { { id = "wa_default", text = "In front of you, where your enemy can see it. If you ever have to hide what you did with your axe, then you did the wrong thing with it, and I learned that one far too late." } },
      choices = {
        { text = "I'll keep it in front, then.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Winning matters more than how it looks.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "No. Humans and orcs both did terrible things, and your people are paying a price neither of ours ever paid. Serve the Horde well, and you'll find this old orc on your side when the others mutter." } },
      choices = { { text = "That means more than you know.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I have lived long enough to have opinions about most things, and to know which ones are worth saying aloud. Ask, and I'll tell you what I can." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "Sit, then, and ask. I tell you more than I tell most, and I think you know why." },
    },
    background = { { id = "tp_bg", text = "A Blackrock grunt, then a deserter, then a prisoner, and now an old man at the Warchief's elbow. The middle part is the only part I'm proud of." } },
    advice = { { id = "tp_ad", text = "Never follow a leader because he shouts the loudest. I did that for most of my life, and I am still paying for it." } },
    blackrock = {
      { id = "tp_br", text = "My clan, and my shame. They hold the mountain in the east and call it the true Horde, and they are wrong.", next = "blackrock" },
      { id = "tp_br2", text = "The Blackrock were the strongest clan in the Horde once. Strength without honor rots, and they are the proof." },
    },
    scarlet_crusade = { { id = "tp_sc", text = "Fanatics who wear the Light like armor. Tirion was everything they claim to be, and his own people cast him out for it." } },
    burning_blade = { { id = "tp_bb", text = "Orcs still bowing to demons, after everything the demons cost us. The Warchief is patient with them, and I am not." } },
    _none = { { id = "tp_none", text = "I don't know that one, and I won't pretend to. Old soldiers who pretend tend to get young ones killed." } },
  },
}
