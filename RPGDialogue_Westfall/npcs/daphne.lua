-- Daphne Stilwell, her farm above the Longshore. Voice: bibles/daphne.md
-- Picks apples, faithful to the Church, and handier with a weapon than the Defias expect.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daphne", id = TODO_NPC("Daphne Stilwell"), name = "Daphne Stilwell",
  bible = "bibles/daphne.md", role = "questgiver", tier = "quest",
  communities = { "westfall_farms" }, temper = { "steady" }, values = { "pious", "brave" },
  notices = { "paladin", "kit" },
  impression = {
    first = "She has no fear of the Defias and misses her husband Jordan.",
    third = "{name} met Daphne Stilwell, a farmer who refuses to let the Defias take her land while her husband works far away.",
  },

  greetings = {
    { id = "g_apples", text = "Mind the basket, love; those are the good apples." },
    { id = "g_valor", when = { questActive = TODO_QUEST("The Tome of Valor") }, text = "Duthorian Rall sent you? Then pick up a weapon, not an apple." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Tome of Valor") }, text = "There's my defender! Take an apple, or take two; you've earned the good ones." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", minLevel = 20 },
      text = "A paladin of the Church! Jordan would like you; he trained for it once, before his father's forge got him." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been along the shore, I see. They don't fight fair down there. Neither do I, when I have to." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not much, and I won't start now. This is our farm, and Jordan's coming back to it. If the earth here has a spirit, I'd like to think it's as stubborn as I am." } },
      choices = {
        { text = "Stand your ground, Daphne. A home is worth keeping.", next = "BACK", reply = "It is, love, and I mean to keep it until Jordan's back to argue about the fence. You've the right sort of stubbornness yourself.", fx = { align = { honor = 1 } } },
        { text = "It's only a farm. Go to Stormwind until Jordan returns.", next = "BACK", reply = "And leave the trees to thieves? Not while I've breath, love. Jordan's coming home to this farm, not to a city room.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Fear it? They'd throw rocks at it and then come up to see where it came from, because the Brotherhood are thieves first and fools second. I'd rather you kept your little friend where the trees can't catch fire, if it's all the same to you." },
        { id = "xlock_more1", text = "Still, Jordan always said a farm's best defended by whatever the other fellow didn't expect, and I doubt they expect you." },
      },
      choices = {
        { text = "I'll keep it leashed and your trees safe, Daphne.", next = "BACK", reply = "I'd be obliged, love, because those trees are older than our marriage. The Defias are welcome to whatever comes up the hill, though.", fx = { align = { order = 1 } } },
        { text = "Let them come up the hill. It hasn't fed in days.", next = "BACK", reply = "Hungry for Defias, I hope, and not for my hens. Keep it out of the orchard either way, if you please.", fx = { align = { order = -1 } } },
        { text = "Something else, Daphne.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Up the path from the beach, three or four at a time, thinking a woman alone is an easy morning's work. I've a pitchfork and a good fence, but a sword at the gate would make them think twice." } },
      choices = {
        { text = "I'll stand at your gate with you.", next = "BACK", reply = "Would you? Then let them come, and we'll see who has the easy morning for once.", fx = { align = { honor = 1 } } },
        { text = "Sell up and go to Sentinel Hill. It's not worth dying for.", next = "BACK", reply = "It's worth everything Jordan and I ever built, love, and I'll not sell it to anyone. Go on to the Hill if you like; I'm staying.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only once, and they didn't like the welcome. It's the Defias I watch for, but the coyotes are bold too, and they've had two of my hens this month while I was looking at the sea." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Only once, and they didn't like the welcome, but the coyotes are bold, and they've had two of my hens this month. Your {pet} would make a fine watchdog, love, and with one like it I'd sleep the whole night through." },
      },
      choices = {
        { text = "I'll clear the coyotes so your hens are safe.", next = "BACK", reply = "Oh, the hens will be grateful, and so will I. Two this month already, and I'd like to keep the rest.", fx = { align = { honor = 1 } } },
        { text = "Coyotes are the least of your worries. I'll hunt elsewhere.", next = "BACK", reply = "That's true enough, though you'd feel different if they were your hens. Mind the Defias on your way down, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "They talk loud enough that I hear them from my porch, love, and mostly it's about the Deadmines and who's owed what. If you go down there, mind the sentries in red bandanas, because they've seen me watching and they don't like it one bit." } },
      choices = {
        { text = "I'll listen, and they'll never know I was there.", next = "BACK", reply = "Good, because I'd like to know what they're plotting, and I can't hear the quiet parts from up here. Come back and tell me.", fx = { align = { honor = -1 } } },
        { text = "I'd sooner face them openly, Daphne.", next = "BACK", reply = "Brave, love, and you'll be the first who's done it. Take care, because there's a lot more of them than you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Have you fought them yourself?", next = "fought" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "That's kind of you, but I've lived up here without wards for twenty years, and I'll not start trusting magic over my own two eyes now. Jordan always said the best lock in Westfall was a woman with a frying pan." } },
      choices = {
        { text = "A ward is still wiser than a frying pan, Daphne.", next = "BACK", reply = "Maybe so, but I know how to use a frying pan and I don't know how to use a ward. I'll keep my pan, thank you.", fx = { align = { order = 1 } } },
        { text = "Your eyes have served you well. Keep trusting them.", next = "BACK", reply = "Thank you, love, they've kept me alive this long. Jordan always said I'd see the Defias before they saw me.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Tell me about Jordan.", next = "jordan" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Stubbornness and seawater, I'd guess, since the wind off the bay keeps the dust from settling on my trees. Jordan planted them the year we married, so I water them by hand even when the well runs low." } },
      choices = {
        { text = "Stand your ground, Daphne. That orchard is worth defending.", next = "BACK", reply = "It is, every tree of it, and I'll defend it with a pitchfork if I have to. Jordan would do the same for me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No tree is worth your life. Leave if the Defias come.", next = "BACK", reply = "It's not about the trees, love, it's about who planted them. I'll not leave, Defias or no Defias.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Daphne Stilwell. This is my farm, and that's the sea, and somewhere down that hill the Defias are deciding whether today's the day. It never is, while I'm watching." },
        { id = "h_valor", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Valor") },
          text = "They'll come up from the shore; they always do. Stand with me, and we'll show the Brotherhood this farm isn't for taking." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Tome of Valor"), days = 3 } },
          text = "That's the last time they try my gate, I'd wager. I got two of them myself, you know, but don't tell Jordan, because he worries." },
        { id = "h_jordan", text = "My husband Jordan's a smith, away up by the gates of Ironforge for now, and the most faithful man the Church has. It's a long way off, but we write." },
        { id = "h_apples", when = { metBefore = true }, text = "First apples are coming on, love. They're small and sour and half of them have worms, but they're mine and nobody's burned them, so I'm calling it a good year." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and just in time; the tide's turning, and the Brotherhood like to come up with it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Then you've seen what's left on the beach after the murlocs have been at it, and you know why I keep the gate shut." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid on my hill! The soil up here is tired, but the apple trees still try, bless them, and I suspect you'll notice." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Something smoky trails up my hill behind you, love. Mind my apples, and we'll get along fine." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, all the way up here? Have an apple. If your spirits can tell me when Jordan will write again, I'd count it a kindness." },
      },
      again = {
        { id = "h_again", text = "What else, love? I've a whole basket of apples to sort." },
        { id = "h_again2", text = "Go on, then. They won't come while we're talking, because they don't like witnesses." },
      },
      choices = {
        { text = "You must be afraid out here.", next = "afraid" },
        { text = "Is there anyone else on the farm with you?", next = "jordan" },
        { text = "Why would the Defias want your farm?", next = "farm" },
        { text = "You fight them yourself?", next = "fought" },
        { text = "Duthorian Rall sent me to watch over you.", next = "rall", when = { class = "PALADIN", any = { { questActive = TODO_QUEST("The Tome of Valor") }, { questDone = TODO_QUEST("The Tome of Valor") } } } },
        { text = "Where do you pray, all the way out here?", next = "pray", when = { class = "PRIEST" } },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "I could slip down among the Defias below and listen.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A ward on your door would keep the Defias out.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How do the Defias come at your farm, Daphne?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the murlocs come up as far as your farm?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your orchard lives where the rest of Westfall died. How?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the Defias below fear what follows me about, Daphne?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You don't seem to fear the Defias down the hill, Daphne.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Enjoy your apples.", next = "END" },
      },
    },
    afraid = {
      big = true,
      lines = {
        { id = "a_default", text = "Every day of my life, and then I pick apples anyway. Fear's a poor reason to leave good trees to thieves." },
      },
      choices = {
        { text = "That's courage.", next = "BACK", reply = "Maybe, though it feels more like plain habit most days. Thank you for calling it something nicer.", fx = { affinity = 2, align = { light = 1 }, trait = { brave = 1 } } },
        { text = "I'd let the thieves have the apples before my neck.", next = "BACK", reply = "Then you'll never know how sweet a Westfall apple tastes after a hard morning. I'll take my chances.", fx = { align = { light = -1 } } },
        { text = "It sounds like stubbornness.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "What frightens you most?", next = "afraid_most" },
      },
    },
    afraid_most = {
      lines = { { id = "am_default", text = "Fire. An orchard takes years to grow and an hour to burn, and the Defias know it. So far they've wanted the farm more than they've wanted to spite me." } },
      choices = { { text = "Let's keep it that way.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    jordan = {
      lines = { { id = "jo_default", text = "My husband Jordan's gone to Ironforge a while, to work with the dwarves. He's the best smith I know, and the most faithful man. He meant to be a paladin once, until his father's anvil wanted him more." } },
      choices = {
        { text = "You must miss him.", next = "jordan_miss" },
        { text = "He's working with my people, then.", next = "jordan_dwarf", when = { race = "Dwarf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jordan_miss = {
      lines = { { id = "jm_default", text = "Every evening, about when he'd come in for supper. I tell myself he'll be home before the last apples. I've told myself that a while now." } },
      choices = {
        { text = "He'll come home.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jordan_dwarf = {
      lines = { { id = "jd_default", text = "Then do me a kindness, if you're passing the gates. Make him eat. He forgets, at an anvil, and your lot won't remind him; you'll only pour him another." } },
      choices = {
        { text = "I'll see he's fed.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "No promises about the pouring.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    farm = {
      lines = { { id = "fa_default", text = "Look down the hill, love. That's the Longshore, and the way to it runs past my gate. Whatever goes in and out of their holes in these hills, I see it." } },
      choices = {
        { text = "You must have seen a thing or two from up here.", next = "farm_seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_seen = {
      lines = { { id = "fs_default", text = "Men with crates, at night, and goblins once, which I'd not have believed if I hadn't seen it. Then I stopped looking, because looking's how you get noticed." } },
      choices = {
        { text = "Goblins? Working for the Defias?", next = "BACK", fx = { trait = { curious = 1 }, learn = { "defias" } } },
        { text = "Wise. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    fought = {
      lines = {
        { id = "fo_default", text = "There's a gun in the house, and I know which end is which. The young paladins Duthorian sends do most of the work, but I do some." },
        { id = "fo_done", when = { questDone = TODO_QUEST("The Tome of Valor") },
          text = "You were there and you saw it all, so don't tell Jordan how close it was; let him think it was all you." },
      },
      choices = {
        { text = "A gun? Out here?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "You don't need much protecting.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    rall = {
      big = true,
      lines = { { id = "ra_default", text = "He sends his young ones out to learn that the Light protects farmers, not just kings. I'm the lesson, and I try to be a good one." } },
      choices = {
        { text = "You're a fine teacher.", next = "BACK", reply = "That's kind, love, though I've never thought of myself as a teacher. I just pick apples and try not to be afraid.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "In my experience, the Light protects whoever can pay for a church.", next = "BACK", reply = "Not up here, it doesn't, because nobody's paying anything. The Light came to my orchard anyway, and I'll not hear it slandered.", fx = { align = { light = -1 } } },
        { text = "And I'm the test, I suppose.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    pray = {
      lines = { { id = "pr_default", text = "In the orchard, in the mornings before work, because there's no chapel within a day's walk. Jordan says the Light isn't fussy about roofs." } },
      choices = {
        { text = "Then let's pray together, now.", next = "BACK", reply = "Oh, I'd like that, love. The orchard's as good a chapel as any in Westfall.", fx = { affinity = 3, align = { light = 2 } } },
        { text = "Pray if you like. I'll keep watch on the road instead.", next = "BACK", reply = "Suit yourself, and keep an eye on the beach path. I'll pray for you while you watch.", fx = { align = { light = -1 } } },
        { text = "Does the Church know you're out here?", next = "pray_church" },
      },
    },
    pray_church = {
      lines = { { id = "pc_default", text = "It does. Jordan and I did the Church some good once, the two of us, and it hasn't forgotten. That's why Duthorian keeps sending his paladins." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "tome_of_divinity" } } } },
    },
  },

  topics = {
    holy_light = {
      { id = "tp_holy_light", text = "The Light's kept this farm through thieves and drought, and I've never once doubted it would. I keep my prayers short and my blade sharp, which I think is how the Light prefers it." },
      { id = "tp_holy_light2", when = { class = "PRIEST" }, text = "You'll know better than me, friend, but I think the Light likes a woman who prays with a sword in reach. I've had no complaints from it so far." },
    },
    deadmines = { { id = "tp_deadmines", text = "Folk on the road say the Defias are tunnelling under Moonbrook like moles, and that the whole mine rings with hammers at night. I'd go down there myself if somebody would mind the apples." } },
    northshire_abbey = { { id = "tp_northshire_abbey", text = "I was baptised at Northshire Abbey, and I still remember the brothers singing in the yard. I'd go back to hear it again, if the Defias would only give me a quiet week." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail pirates sail past the Longshore now and then, and I've seen their red sails from my orchard. They don't come ashore here, because the Defias would want a cut, and that's the one good thing about either of them." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Jordan took me to the Darkmoon Faire once when we were courting, and he won me a ribbon at the ring toss. I've still got it, tied to the farm gate, and the Defias have never dared take it down." } },
    background = { { id = "tp_bg", text = "I'm a farm wife with a sea view, a husband in Ironforge and a gun, and you'd best not forget the gun.", next = "fought" } },
    advice = { { id = "tp_ad", text = "Pick your apples before the thieves notice they're ripe. Same goes for most things." } },
    defias = { { id = "tp_defias", text = "They want the farm because it overlooks their road to the sea. They can't have it." } },
    westfall = { { id = "tp_westfall", text = "It's hard country now, but the apples are good, because the trees don't know there's a war on." } },
    tome_of_divinity = { { id = "tp_tome", text = "The Tomes of Divinity and Valor are Duthorian Rall's books for his young paladins. Valor comes after Divinity, he says, but out here it's the other way round." } },
    _none = { { id = "tp_none", text = "Couldn't say, love. The orchard keeps me busy enough." } },
  },
}
