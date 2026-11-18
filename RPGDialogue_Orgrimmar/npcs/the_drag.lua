-- The Drag: Droffers and Son Salvage, the cloth, alchemy and leather trainers,
-- and a trade supplier. Rashona is in her own file.
-- Voices: bibles/<key>.md for each.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Dran Droffers: the father of Droffers and Son Salvage.
---------------------------------------------------------------------------
P:NPC {
  key = "dran_droffers", id = TODO_NPC("Dran Droffers"), name = "Dran Droffers", title = "Droffers and Son Salvage",
  bible = "bibles/dran_droffers.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "sharp", "gruff" }, values = { "ambitious", "cunning" },
  notices = { "purse", "dungeon" },
  impression = {
    first = "Dran Droffers runs a salvage shop on the Drag with his son, and he seems to believe everything in the world is either his or about to be. He is rude, quick and very hard to win an argument with.",
    third = "{name} met Dran Droffers, the goblin who runs Droffers and Son Salvage on Orgrimmar's Drag.",
  },

  greetings = {
    { id = "g_hi", text = "If you're buyin', come in, and if you're browsin', browse faster." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again, the customer who thinks about it. Think quicker this time, pal, I got overhead." },
    { id = "g_necklace", when = { questActive = TODO_QUEST("Necklace Recovery") }, text = "You got my necklace yet? No? Then why are you standin' in my shop instead of Uldaman?" },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Well, well, look who's got a heavy purse. Come in, come in, my valued customer, and mind the step." },
  },

  notice = {
    { id = "n_purse", cat = "purse", when = { money = { max = 500 } },
      text = "I can hear your purse from here, pal, and it's makin' a very sad little noise. Come back when it jingles." },
    { id = "n_uldaman", cat = "dungeon", when = { cleared = "Uldaman" },
      text = "You've been down in Uldaman and come back with your head on, I hear. Then you know what's lyin' around down there for the takin'." },
  },

  start = "hello",
  nodes = {
    xorig_drag = {
      lines = { { id = "xdr_default", text = "Sure I know you, kid, you collected from my cousin Rizzle twice and only broke one of his fingers, which in this business is practically a love letter. So are you still in the collections game, or are you finally lookin' for honest work at a dishonest wage?" } },
      choices = {
        { text = "Still collecting, Dran. Who owes you?", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "I've left the knives behind, mostly.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Dran Droffers, of Droffers and Son Salvage, and that's me at the front of the name, not the son, whatever he tells you. We buy what other folks dig up and we sell it to folks with more gold than sense, and the margins are beautiful." },
        { id = "h_goblin", when = { race = "Goblin" }, text = "Dran Droffers, and you're one of us, so I'll skip the sales pitch and give you the price I give my cousins. That's the same as everybody else's, by the way, but now you feel special." },
        { id = "h_ready", when = { questReady = TODO_QUEST("Necklace Recovery") }, text = "Is that it? Is that my necklace? Hand it over, hand it over, and don't you dare tell that troll Jarkal Mossmeld you came here first." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talkin' isn't buyin'." },
        { id = "h_again2", text = "Go on, I'm listenin', but the meter's runnin'." },
      },
      choices = {
        { text = "What exactly do you salvage?", next = "salvage" },
        { text = "Tell me about your son.", next = "son" },
        { text = "Are you hunting for anything special, Dran?", next = "necklace", when = { minLevel = 35 } },
        { text = "Why would anyone want ripple?", next = "ripple" },
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "You know me, Dran. I ran knives through the Drag.", next = "xorig_drag", when = { origin = "orc_drag_runner" } },
        { text = "Not today, Dran.", next = "END" },
      },
    },
    salvage = {
      lines = { { id = "sa_default", text = "Anything that isn't nailed down, and some things that were until recently. Old armor off the battlefields, bits of machinery, dwarf junk from the dig sites, and the odd relic some adventurer doesn't know the value of." } },
      choices = {
        { text = "Off the battlefields? So you rob the dead.", next = "salvage_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salvage_dead = {
      big = true,
      lines = { { id = "sd_default", text = "Rob is a very ugly word, pal. The dead don't need their boots, and the livin' do, so I'm providing a public service, and charging a modest fee for my trouble." } },
      choices = {
        { text = "True enough, the dead have no use for boots.", next = "BACK", reply = "Exactly, pal, and the livin' have very cold feet. You understand business, and I like that in a customer.", fx = { align = { honor = -1 } } },
        { text = "Some things should stay with the dead.", next = "BACK", reply = "Some things, sure, but boots? Pal, boots are the most useful thing a corpse ever owned.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    son = {
      lines = { { id = "so_default", text = "Malton? He's a good boy, he smiles at the customers, and he gives away discounts I never approved. One day he'll run this shop into the ground, but it'll be a very friendly ground." } },
      choices = {
        { text = "He seems nicer than you.", next = "son_nice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_nice = {
      lines = { { id = "sn_default", text = "Of course he's nicer than me, I raised him to be nice so I could be the one who counts the money. That's called division of labor, and it's the secret of every successful family business." } },
      choices = { { text = "Something else, Dran.", next = "BACK" } },
    },
    necklace = {
      lines = { { id = "ne_default", text = "A necklace from Uldaman, an old one, broken into pieces and scattered around the dig. Put it together, find the right gem, and you've got somethin' the collectors in Booty Bay will fight each other over. If a troll called Jarkal Mossmeld offers you more for it, don't listen." } },
      choices = {
        { text = "Who is Jarkal Mossmeld?", next = "jarkal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jarkal = {
      lines = { { id = "ja_default", text = "That troll in Kargath? He'll offer you more, he always does, but does he have a shop on the Drag? Does he have a son? Does he have a reputation? No, he's got a hut in the Badlands, so you think about that." } },
      choices = {
        { text = "What happens if I sell it to him?", next = "jarkal_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jarkal_sell = {
      big = true,
      lines = { { id = "js_default", text = "Then I'll curse your name for a week and do business with you on the eighth day, because a grudge never paid anybody's rent. But I'll remember, pal, and I'll charge you a little extra for the rest of your life." } },
      choices = {
        { text = "I'll keep my word to you, Dran.", next = "BACK", reply = "That's what I like to hear, pal, a customer with a memory. Keep your word and I'll keep my prices.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll sell to whoever pays most.", next = "BACK", reply = "Then I'll curse your name for a week, pal, like I said. And on the eighth day we'll talk.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ripple = {
      lines = { { id = "ri_default", text = "Because it's a fancy wine out of the Hinterlands, and nobody in Orgrimmar knows what it should taste like, so they'll pay whatever I tell them. Every officer who wants to look cultured buys a bottle, and nobody dares say it tastes like boot polish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Everything's for sale, pal, and the only question is whether you can afford it. You probably can't, but I admire you for askin'." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, and there's no profit in it. Buy somethin' or move along." } },
  },
}

---------------------------------------------------------------------------
-- Malton Droffers: the son, and the friendly face of the shop.
---------------------------------------------------------------------------
P:NPC {
  key = "malton_droffers", id = TODO_NPC("Malton Droffers"), name = "Malton Droffers", title = "Droffers and Son Salvage",
  bible = "bibles/malton_droffers.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "generous", "practical" },
  notices = { "purse" },
  impression = {
    first = "Malton Droffers works the counter at his father's salvage shop on the Drag. He is as friendly as his father is rude, and probably just as good at business.",
    third = "{name} met Malton Droffers, the friendly half of Droffers and Son Salvage on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, friend, welcome! Don't mind Dad, he only bites before lunch." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer is back! Well, one of my favorites, but don't tell the others." },
  },
  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Oh, a lean week, I see. Don't worry, buddy, we've got a bargain bin, and Dad never checks it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Malton Droffers, the son in Droffers and Son, and the one you should be talkin' to if you want a good deal. Dad handles the buying and I handle the selling, and somehow we both think we're the important one." },
      },
      again = { { id = "h_again", text = "Anything else, friend? I've always got time for a customer." } },
      choices = {
        { text = "Working for your father can't be easy.", next = "father" },
        { text = "What's your best item right now?", next = "best" },
        { text = "Where does all this salvage come from?", next = "salvage" },
        { text = "You mentioned a bargain bin.", next = "bin" },
        { text = "How does a goblin family end up in Orgrimmar?", next = "goblins" },
        { text = "That hole in the helmet. It's my tusk's shape.", next = "tusk", when = { race = "Troll" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Farewell, Malton.", next = "END" },
      },
    },
    father = {
      lines = { { id = "fa_default", text = "Loud, mostly, and he counts my discounts at the end of every day. But he taught me everything I know, and one day the sign's going to say Droffers and Father, so I'm being patient." } },
      choices = {
        { text = "I'd guess he doesn't know about the sign.", next = "sign" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sign = {
      big = true,
      lines = { { id = "si_default", text = "Not yet, and I'd appreciate it if you didn't tell him. A little honesty's good for business, but a little secrecy's good for family, as long as it's the right kind." } },
      choices = {
        { text = "Your secret's safe. Family deserves some patience.", next = "BACK", reply = "You're a real friend, pal, and I owe you one. Dran's a pain, but he's my pain.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I might tell him, if the price is right.", next = "BACK", reply = "The price is right, is it? Pal, you're a Droffers at heart, and I mean that as a warning.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "Today it's a dwarf's mining helmet with a hole in it that's shaped exactly like a troll's tusk. I don't know the story, but I'm charging extra for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    salvage = {
      lines = {
        { id = "sa_default", text = "Everywhere, friend! The caravans bring us broken gear from the Crossroads, the grunts sell us what they don't want to carry home from Ashenvale, and Dad buys anything that's metal and can't run away. We clean it, fix it, and sell it on, and nothing goes to waste in this shop." },
        { id = "sa_warrior", when = { class = "WARRIOR" }, text = "Everywhere, buddy, and half of it comes off folks like you who broke something in a fight and didn't want to pay to mend it. Dad calls warriors our favorite suppliers, and he doesn't mean it as a compliment." },
      },
      choices = {
        { text = "What comes back from Ashenvale?", next = "salvage_ashenvale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salvage_ashenvale = {
      lines = { { id = "sv_default", fx = { learn = { "warsong" } }, text = "Axes from the Warsong lumber camps, mostly, and arrows the night elves left stuck in them. Sometimes a grunt brings in a whole kit, helmet and all, and doesn't say whose it was, and I don't ask." } },
      choices = {
        { text = "You've had a kit like that recently?", next = "salvage_tag" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salvage_tag = {
      big = true,
      lines = { { id = "st_default", text = "Last week, buddy, a good helmet with a name scratched inside the rim, Korv of the Warsong. Dad says sell it, and I've got it under the counter in case somebody comes looking for Korv, and I can't decide which of us is right." } },
      choices = {
        { text = "Keep it. His family deserves the chance to claim it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sell it. Korv isn't coming back for it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bin = {
      lines = {
        { id = "bi_default", text = "Under the window, buddy, where the light's bad, so Dad never looks at it. Odd boots, bent buckles, a shield with a bite out of it, all priced for folks having a lean week, and if it sits there long enough the price gets leaner." },
        { id = "bi_poor", when = { money = { max = 1000 } }, text = "Right under the window, friend, and you look like exactly the customer it was made for, no offense. Have a dig, and if Dad comes out, you're just admiring the woodwork." },
      },
      choices = {
        { text = "And your father really never checks it?", next = "bin_dad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bin_dad = {
      lines = { { id = "bd_default", text = "He checks it once a year and shouts for an hour, and then he forgets about it again. Between you and me, buddy, I think he knows exactly what I'm doing and just likes the shouting." } },
      choices = { { text = "Something else, Malton.", next = "BACK" } },
    },
    goblins = {
      lines = { { id = "go_default", fx = { learn = { "ratchet" } }, text = "Same way as Gazlowe, friend, because the Warchief needed builders when the city went up, and goblins who build stay to sell. We came over from Ratchet with a cart of scrap, and Dad's been shouting at the Drag ever since." } },
      choices = {
        { text = "Do the orcs treat you fairly?", next = "goblins_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins_orcs = {
      lines = { { id = "gr_default", text = "Fair enough, as long as the prices are fair too, and an orc remembers a bad deal longer than he remembers his own birthday. The trick is to be useful and a little bit cheaper than the next fella, and they'll walk past three shops to buy from you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tusk = {
      lines = { { id = "tu_default", text = "Ha! Then you'd know the story better than me, buddy, and I'd love to hear it, because a good story sells a helmet twice as fast. Was it a fight with a dwarf, or was the dwarf just in the wrong place?" } },
      choices = {
        { text = "The dwarf started it. I finished it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "A troll never tells, goblin.", next = "BACK", fx = { trait = { cunning = 1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you, buddy, but I'll ask around, and Dad'll probably charge you for the answer." } },
    background = { { id = "tp_bg", text = "Born over a crate of scrap in Ratchet, buddy, and raised on the Drag. The shop's my whole story so far, but I'm working on the sign." } },
    advice = { { id = "tp_ad", text = "Never buy the first thing you see, friend, unless you see it in my shop." } },
    warsong = { { id = "tp_warsong", next = "salvage_ashenvale", text = "The Warsong send us their broken axes from Ashenvale, and some of them come back with stories." } },
  },
}

---------------------------------------------------------------------------
-- Magar: the tailoring trainer who owns Magar's Cloth Goods.
---------------------------------------------------------------------------
P:NPC {
  key = "magar", id = TODO_NPC("Magar"), name = "Magar", title = "Tailoring Trainer",
  bible = "bibles/magar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "diligent", "patient" },
  notices = { "craft" },
  impression = {
    first = "Magar runs Magar's Cloth Goods on the Drag and teaches tailoring to anyone with steady hands. Magar measures everything twice, looks at your seams before your face, and speaks about cloth with real affection.",
    third = "{name} met Magar, the tailoring trainer who owns Magar's Cloth Goods on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the bolts, {class}; they're stacked for Rashona, the cloth quartermaster, and she counts every one like a warband counts its dead." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another lesson? Show me your stitches first, and I'll tell you if you're ready." },
    { id = "g_still", text = "Stand still a moment, would you? I'm not measuring you, I only like to know what I'm talking to." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "Your sleeve's coming away at the shoulder, and I'd guess it has been since before you died. Sit down before it falls off entirely." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = { name = "Tailoring", min = 100 } },
      text = "Your hem's straighter than it was. Someone's been practicing, and it shows." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Magar, and this is my shop, Magar's Cloth Goods. I teach tailoring to anyone with a steady hand, and I sell thread and dye to everyone else, though most orcs think sewing is for those who can't swing an axe." },
        { id = "h_tailor", when = { profession = { name = "Tailoring" } }, text = "Magar, and you're a tailor already, because I can see you looking at my hems. Look all you like, since you won't find a crooked one in this shop." },
      },
      again = {
        { id = "h_again", text = "What else? My needle's getting cold, and a cold needle bites." },
        { id = "h_again2", text = "Go on, but slowly, because a hurried question gets a hurried answer, and those come apart at the seams." },
      },
      choices = {
        { text = "Why would an orc learn to sew?", next = "why" },
        { text = "Does Rashona work for you?", next = "rashona" },
        { text = "Why do you keep looking at my sleeves?", next = "seams" },
        { text = "What's the hardest cloth to work?", next = "hardest" },
        { text = "I wore human cloth too. I was human.", next = "forsaken_cloth", when = { race = "Scourge" } },
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Farewell, Magar.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because every grunt needs a shirt and every warlock needs a robe, and somebody has to make them. In the camps we wore what the humans gave us, and I swore I'd never wear another human's cloth again." } },
      choices = {
        { text = "What did the humans give you to wear?", next = "camps" },
        { text = "A people who make their own clothes are free.", next = "BACK", reply = "They are, and I've never forgotten it. Every shirt I make is one more thing the humans didn't give us.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cloth is cloth. I'd wear whatever's warmest.", next = "BACK", reply = "Spoken like someone who was never in the camps. Warm is good, but our own is better.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps = {
      lines = { { id = "ca_default", text = "Grey wool, one shirt a year, and every one cut to the same size whether you were a scrawny peon or a grunt twice his width. I learned to sew by taking those shirts apart at night and putting them back together so they fit." } },
      choices = {
        { text = "Is that why you measure everything twice?", next = "twice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    twice = {
      lines = { { id = "tw_default", text = "It is, and I've never once regretted the extra minute. A human quartermaster cut once and never looked at who'd be wearing it, so I make a point of looking at everyone." } },
      choices = { { text = "Let's talk about something else.", next = "BACK" } },
    },
    seams = {
      lines = { { id = "se_default", text = "Because a body's clothes tell me more than its mouth does, and they don't lie as often. So tell me true, who sewed what you're wearing?" } },
      choices = {
        { text = "I did, and it shows.", next = "seams_self", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "I bought it from a vendor. I don't sew.", next = "seams_bought", fx = { trait = { practical = 1 } } },
        { text = "I took it off a dead human.", next = "seams_human", fx = { trait = { blunt = 1 } } },
        { text = "That's my business, not yours.", next = "seams_private", fx = { affinity = -1, trait = { discreet = 1 } } },
      },
    },
    seams_self = {
      lines = { { id = "ss_default", text = "It does, but the stitches are even, and even is worth more than pretty. Learn the rest from me, and in a season nobody will be able to tell you did it yourself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    seams_bought = {
      lines = { { id = "sb_default", text = "Then somebody charged you for crooked seams, and you paid it without looking. Next time, turn the sleeve inside out before you hand over a single coin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    seams_human = {
      lines = { { id = "sh_default", text = "Human cloth on a Horde back, and you took it yourself, which isn't the same as being handed it. I'd still not wear it, but I'll grant there's a kind of justice in it, as long as you washed it first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    seams_private = {
      lines = { { id = "sp_default", text = "Fair enough, and I'll find out anyway the next time you lift your arms. Seams can't keep a secret, even when their owners can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hardest = {
      lines = { { id = "hd_default", text = "Silk, because it slips under the needle and forgives nothing at all. Linen lets you start over and wool hides a bad stitch, but silk shows every mistake you've ever made." } },
      choices = {
        { text = "Who buys silk in Orgrimmar?", next = "silk_buyers" },
        { text = "I've sewn silk. It's not that hard.", next = "silk_boast", when = { profession = { name = "Tailoring", min = 125 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    silk_buyers = {
      lines = { { id = "sk_default", text = "Officers who want to look as if they were never in a camp, mostly, and the trolls up in the Valley of Spirits. Uthel'nay buys new curtains from me every season, and I've stopped asking what happened to the last ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    silk_boast = {
      lines = { { id = "sb2_default", text = "Then you've either got the best hands on the Drag or you haven't looked closely at your own work. Bring me a silk hem some day, and we'll find out which." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken_cloth = {
      lines = { { id = "fc_default", text = "Then you know better than most how human cloth sits on a body, and I'll not hold it against you, since you chose neither the cloth nor the dying. Sew yourself something new, and wear it as if it's yours." } },
      choices = {
        { text = "I'll take that advice, Magar.", next = "BACK", fx = { affinity = 1 } },
        { text = "Clothes are the least of my troubles.", next = "BACK", fx = { trait = { blunt = 1 } } },
      },
    },
    rashona = {
      lines = { { id = "ra_default", text = "She works beside me, not for me, and she'd tell you so herself if you suggested otherwise. She gathers cloth for the Horde, and I make sure some of it gets sewn before it goes out the door." } },
      choices = {
        { text = "You two seem to get along.", next = "rashona_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rashona_along = {
      lines = { { id = "rl_default", text = "Most days, though she thinks I'm too slow and I think she gives away too much. We've argued about it for years, and neither of us has ever won." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'd want to measure that twice before I answered, and I haven't measured it even once. Ask me about cloth instead, and I'll have an answer; ask a grunt about the rest." } },
  },
}

---------------------------------------------------------------------------
-- Yelmak: the alchemy trainer, of Yelmak's Alchemy and Potions.
---------------------------------------------------------------------------
P:NPC {
  key = "yelmak", id = TODO_NPC("Yelmak"), name = "Yelmak", title = "Alchemy Trainer",
  bible = "bibles/yelmak.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "curious", "diligent" },
  notices = { "craft" },
  impression = {
    first = "Yelmak teaches alchemy on the Drag in a shop that always smells of something burning. Yelmak talks fast, sniffs everything before touching it and gets excited about strange ingredients.",
    third = "{name} met Yelmak, the alchemy trainer on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Close the door behind you, quick, the fumes need to stay in." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, I've got a new mixture I'm dying to explain to someone." },
    { id = "g_sniff", text = "Hold still, let me smell you, and yes, Barrens dust and sweat and a little peacebloom, so you've been working. Come in, come in!" },
    { id = "g_scourge", when = { race = "Scourge" }, text = "Oh, a Forsaken, and you smell of the Undercity's vats, which I mean as a compliment. Do the apothecaries down there ever let anyone watch them work?" },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { name = "Alchemy", min = 100 } },
      text = "You've got singed eyebrows, I see. That's the mark of a real alchemist, so wear it with pride." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Yelmak, alchemist, and this is my shop on the Drag. I teach anyone who wants to learn, sell vials to everyone, and only blow up the back room once a season, which is a better record than the old warlocks ever kept with their brews." },
        { id = "h_alch", when = { profession = { name = "Alchemy" } }, text = "Yelmak, and you're an alchemist, because I can smell sulfur on your gloves and far too much mageroyal. We'll talk about the mageroyal, but first tell me what you came for." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got something on the boil." },
        { id = "h_again2", text = "Quick, quick, ask me something before this boils over, because it will, it always does." },
      },
      choices = {
        { text = "What's the strangest potion you've made?", next = "strange" },
        { text = "Who buys the most potions?", next = "who" },
        { text = "Why do you keep sniffing everything?", next = "nose" },
        { text = "Does Jandi sell you your herbs?", next = "jandi" },
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "Farewell, Yelmak.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "One that turned a grunt's skin blue for a week, though it was meant to make him stronger. He was very angry, but I learned something, and that's what counts in alchemy." } },
      choices = {
        { text = "I hope you test them on volunteers.", next = "test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test = {
      big = true,
      lines = { { id = "te_default", text = "Volunteers, yes, and sometimes they even know they're volunteering. I always pay them, though, and nobody's ever died, so I think that makes it fair." } },
      choices = {
        { text = "The apothecaries in the Undercity don't bother paying.", next = "apothecaries", when = { race = "Scourge" } },
        { text = "They should always know what they're drinking.", next = "BACK", reply = "They should, and I tell them, mostly. The blue usually wears off by morning, and if it doesn't, it's a feature.", fx = { align = { light = 1 } } },
        { text = "Knowledge costs something. A blue grunt is cheap.", next = "BACK", reply = "Ha! Now there's a scientist after my own heart. The blue's temporary, the knowledge isn't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apothecaries = {
      lines = { { id = "ap_default", text = "I've heard that, and I don't much like hearing it. A volunteer who's paid comes back next week and tells you what the potion did, but a prisoner only screams, and that teaches you nothing worth knowing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "wh_default", text = "The warriors, always the warriors, because they get hit the most. Ask Grezz in the Valley of Honor how many healing potions his recruits drink in a week, and watch him pretend he doesn't know." } },
      choices = {
        { text = "I'm a warrior. I drink my share.", next = "warrior_drink", when = { class = "WARRIOR" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_drink = {
      lines = { { id = "wd_default", text = "I can tell, because you've got the look of someone who drinks healing potions like water and wonders where the money went. Let Arnok bandage you now and then, and save my potions for when you're really dying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nose = {
      lines = { { id = "no_default", text = "Because the nose knows before the tongue does, and the tongue is much harder to replace. Go on, then, what's the worst thing you ever drank without smelling it first?" } },
      choices = {
        { text = "Ogre swill, out in the Barrens. Never again.", next = "nose_swill", fx = { trait = { brave = 1 } } },
        { text = "Nothing. I always check first.", next = "nose_careful", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "One of your potions, maybe. It tasted blue.", next = "nose_blue", fx = { trait = { witty = 1 } } },
      },
    },
    nose_swill = {
      lines = { { id = "ns_default", text = "Ogres brew with whatever died nearby, so you're lucky to have a stomach left at all. Next time, sniff first, and if your eyes water, pour it on the fire and stand well back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nose_careful = {
      lines = { { id = "nc_default", text = "Good, good, you'd be amazed how rare that is, and it makes you a better alchemist than half my students already. They uncork, they gulp, and then they come to me asking why their tongues are green." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nose_blue = {
      lines = { { id = "nb_default", text = "Ha! Mine only ever turned you blue on the outside, and only the once, and I've mostly changed the recipe since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jandi = {
      lines = { { id = "ja_default", text = "Jandi sells me the best peacebloom in Durotar and then looks at me as if I'm about to boil it alive, which, to be fair, I am. She asks the plants first and I ask them afterwards, and we both get our answers." } },
      choices = {
        { text = "Does she disapprove of your potions?", next = "jandi_disapprove" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jandi_disapprove = {
      lines = { { id = "jd_default", text = "She thinks a herb should heal and nothing else, and I think a fire potion that saves a grunt from a pack of raptors is healing too, only from further away. We'll never agree, but she keeps selling and I keep buying, so it works." } },
      choices = {
        { text = "Jandi has it right. Plants should heal.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Healing from further away still counts.", next = "BACK", fx = { affinity = 1, trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea, and it doesn't smell like anything I'd want to find out about. Bring me something I can boil, and then I'll tell you all about it." } },
  },
}

---------------------------------------------------------------------------
-- Karolek: the leatherworking trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "karolek", id = TODO_NPC("Karolek"), name = "Karolek", title = "Leatherworking Trainer",
  bible = "bibles/karolek.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "honest" },
  notices = { "craft", "class" },
  impression = {
    first = "Karolek teaches leatherworking on the Drag and has hands as hard as the hides he works. He says little, looks at your boots before your face, and what he does say is about the work.",
    third = "{name} met Karolek, the leatherworking trainer on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Hides on the left, tools on the right, and don't touch either without asking. A beast gave its life for each one, and an orc honors that." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Show me your work and I'll show you what's wrong with it." },
    { id = "g_boots", text = "Let me see your boots first, because boots tell me everything I need to know about a body." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, so tell me you kill clean, or turn around and go back out that door." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { name = "Leatherworking", min = 100 } },
      text = "Your stitching's tight, I see, and the edges are clean. You'll make a leatherworker yet." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid in a leatherworker's shop, and you don't look happy about the hides on the wall. They were dead before they got here, I promise you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Karolek, and I work leather. In the camps we wore human rags; now I teach orcs to skin a beast cleanly and stitch without wasting the hide, and if you can't do both, you'll learn or you'll leave." },
      },
      again = {
        { id = "h_again", text = "What else? The hides won't tan themselves." },
        { id = "h_again2", text = "Ask, then, but I'm stitching while you talk." },
      },
      choices = {
        { text = "What makes good leather?", next = "good" },
        { text = "Where do you get your hides?", next = "where" },
        { text = "Why are you staring at my boots?", next = "boots" },
        { text = "What's the worst hide anyone's brought you?", next = "worst" },
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "Farewell, Karolek.", next = "END" },
      },
    },
    good = {
      big = true,
      lines = { { id = "go_default", text = "A clean kill, a clean skin and a clean tan, in that order. A beast that died slowly gives a tough, ugly hide, so I tell every hunter that a kind kill makes the best leather." } },
      choices = {
        { text = "As a druid, I'd rather you killed nothing.", next = "druid", when = { class = "DRUID" } },
        { text = "A clean kill honors the beast.", next = "BACK", reply = "It does, and it makes better leather too. I can tell a hunter's character from the hide alone.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I care about the hide, not the beast.", next = "BACK", reply = "Then you'll get tough, ugly hides, and I'll pay you accordingly. Kill clean anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you'd be cold in winter and barefoot in the Barrens, druid, and so would every grunt in this city. I kill clean and I waste nothing, and that's as close to your way as a leatherworker gets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    where = {
      lines = { { id = "wh_default", text = "The Barrens, mostly, from the zhevra and the kodo. The tauren bring me the best ones, because they waste nothing and they won't sell a hide they haven't respected." } },
      choices = {
        { text = "The tauren seem to trade fairly.", next = "tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "More fairly than I do, and they make me feel bad about it every time. A tauren once refused my gold and asked me for a song instead, and I still don't know what that was about." } },
      choices = {
        { text = "Did you sing for him?", next = "song" },
        { text = "Something else.", next = "BACK" },
      },
    },
    song = {
      lines = { { id = "so_default", text = "I did, the only song I knew, an old marching song from the Second War, and he listened to all of it and nodded. Now he won't sell to me unless I bring a new verse, so I've had to learn a few." } },
      choices = {
        { text = "Sing me one, then.", next = "song_sing" },
        { text = "I'm tauren. I could teach you a proper song.", next = "song_tauren", when = { race = "Tauren" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    song_sing = {
      lines = { { id = "sg_default", text = "I sing for tauren and for hides, and you're neither, so no. Go out to the Barrens if you want a song that badly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    song_tauren = {
      lines = { { id = "st_default", text = "You'd be the third tauren to try, and the other two left looking sorry for me. Go on, then, but slowly, and don't laugh when I get the words wrong." } },
      choices = {
        { text = "I won't laugh. Every voice honors the Earthmother.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'll only laugh a little.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    boots = {
      lines = { { id = "bo_default", text = "Boots take more wear than anything else a body owns, so they tell me how you live. Who made yours, and don't lie to me, because I'll know." } },
      choices = {
        { text = "I made them myself.", next = "boots_self", fx = { trait = { independent = 1 } } },
        { text = "Some vendor. I didn't ask.", next = "boots_vendor", fx = { trait = { practical = 1 } } },
        { text = "I pulled them off a dead quilboar.", next = "boots_quilboar", fx = { trait = { blunt = 1 } } },
      },
    },
    boots_self = {
      lines = { { id = "bs_default", text = "Then you've more patience than most who come through that door. The left heel's worn more than the right, so you favor that side in a fight, and somebody will notice it before I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    boots_vendor = {
      lines = { { id = "bv_default", text = "Then you paid for bad stitching, and you'll pay again in a month when the sole comes away. Next time, pull on the seam before you buy, and if it gives, walk away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    boots_quilboar = {
      lines = { { id = "bq_default", text = "Quilboar tan with dung and wishful thinking, so I'm not surprised I could smell you from the door. Wear them until you can afford better, and then burn them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worst = {
      lines = { { id = "wo_default", text = "A wolf pelt with nine arrow holes in it, brought in by a hunter who wanted full price. If you need nine arrows, you need more practice, not more pelts." } },
      choices = {
        { text = "Did you pay him?", next = "worst_paid" },
        { text = "My pet does most of my killing.", next = "worst_pet", when = { class = "HUNTER" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst_paid = {
      lines = { { id = "wp_default", text = "I paid him for one boot's worth of leather, which is all that pelt had left in it. He shouted, I let him, and he came back the next week with a clean kill." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worst_pet = {
      lines = { { id = "wt_default", text = "Then teach your pet to go for the throat and not the belly, because a torn belly ruins the best part of the hide. A well-trained cat is worth three bad hunters to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my business, and I've got a hide soaking that is. Go and ask some grunt who sits still long enough to gossip." } },
  },
}

---------------------------------------------------------------------------
-- Felika: trade supplies.
---------------------------------------------------------------------------
P:NPC {
  key = "felika", id = TODO_NPC("Felika"), name = "Felika", title = "Trade Supplies",
  bible = "bibles/felika.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "Felika sells thread, flux, vials and every other small thing a crafter runs out of, and she knows exactly what each customer forgot to buy last time. Nothing annoys her more than someone buying just one of anything.",
    third = "{name} met Felika, who sells trade supplies on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Thread, flux, vials, salt, whatever you've run out of, I've got it." },
    { id = "g_back", when = { metBefore = true }, text = "Let me guess, you ran out of something again. Everybody always does." },
    { id = "g_two", text = "Whatever you came for, think about buying two, because you'll be back for the second one by sundown." },
    { id = "g_engineer", when = { profession = { name = "Engineering" } }, text = "An engineer, and you've still got both eyebrows, so you must be new at it. The flux is on the left, and you'll want more than you think." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { name = "Blacksmithing", min = 50 } },
      text = "You'll be after flux, I expect, and probably more than you think, because smiths always underestimate it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Felika, and I sell supplies to every crafter on the Drag and most of the ones in the Valley of Honor. The Horde builds on small things, and if it's small, cheap and you'll need fifty of it, I sell it." },
      },
      again = {
        { id = "h_again", text = "Anything else? There's a line forming." },
        { id = "h_again2", text = "Go on, then, but if you're about to buy just one of something, I'll want a reason." },
      },
      choices = {
        { text = "Who are your best customers?", next = "best" },
        { text = "What do people always forget?", next = "forget" },
        { text = "What do you make of the Droffers?", next = "droffers" },
        { text = "What do you think I've forgotten?", next = "guess" },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Farewell, Felika.", next = "END" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "The engineers, because they blow through everything I sell and come back the next day for more. Nogg, who trains the engineers, keeps me in business half the year by himself." } },
      choices = {
        { text = "Nogg must be a good customer.", next = "nogg" },
        { text = "I'm an engineer. Am I a good customer?", next = "engineer", when = { profession = { name = "Engineering" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nogg = {
      big = true,
      lines = { { id = "no_default", text = "He pays on time, he never haggles and he's only set fire to my stall once, which is better than most of his students. I'd rather have a dozen engineers than one smith who argues over a copper." } },
      choices = {
        { text = "Loyal customers are worth a little fire.", next = "BACK", reply = "They are, and he's never once argued over a copper. I'll take the fire.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Fire's fire. I'd have banned him from the Drag.", next = "BACK", reply = "Banned him? And lose my best customer? Fire's a small price for that kind of loyalty.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    engineer = {
      lines = { { id = "en_default", text = "That depends on whether you blow through your supplies or through my stall, and so far it's only been the supplies. Keep it that way and we'll get along fine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forget = {
      lines = { { id = "fo_default", text = "Vials, every time, and then they stand in front of Yelmak's shop with a handful of herbs and nothing to put them in. I keep a crate by the door just for them." } },
      choices = {
        { text = "I'm an alchemist. I never forget vials.", next = "forget_alch", when = { profession = { name = "Alchemy" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget_alch = {
      lines = { { id = "fa_default", text = "Every alchemist says that, and I've sold vials to every alchemist in this city, usually twice in one afternoon. The crate by the door will still be there when you need it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    droffers = {
      lines = { { id = "dr_default", text = "Dran sells junk at jewel prices and his son apologizes for it, and between the two of them they do very well. I sell useful things at fair prices and nobody ever thanks me, and that's the Drag for you." } },
      choices = {
        { text = "Then why not charge more?", next = "droffers_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    droffers_more = {
      big = true,
      lines = { { id = "dm_default", text = "Because a crafter who can't afford thread doesn't make anything, and then the whole Drag goes quiet. A fair price keeps this city sewing and smithing, and a busy stall suits me better than a fat purse." } },
      choices = {
        { text = "Fair prices keep a city honest. You're right.", next = "BACK", reply = "Exactly, and look at my stall, never empty. I'd rather be busy than rich any day.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Charge what they'll pay. Dran has the right idea.", next = "BACK", reply = "Dran's richer, sure, but I've got more customers. Fair prices win in the end.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guess = {
      lines = { { id = "gu_default", text = "Let me look at you properly first, and tell me the truth. Do you carry spare thread, or are you one of those who thinks one spool will last a lifetime?" } },
      choices = {
        { text = "I carry plenty. I plan ahead.", next = "guess_plan", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "One spool. It's been fine so far.", next = "guess_one", fx = { trait = { stubborn = 1 } } },
        { text = "I don't sew. I hit things.", next = "guess_hit", fx = { trait = { blunt = 1 } } },
      },
    },
    guess_plan = {
      lines = { { id = "gp_default", text = "Then you're the first one today, and I'll remember your face for it. If you ever want to prove it, show me the spools and I'll tell you whether you were lying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guess_one = {
      lines = { { id = "go_default", text = "It has, right up until it hasn't, and that'll be in the middle of the Barrens with a torn pack and nothing to mend it. Buy two, and thank me later." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guess_hit = {
      lines = { { id = "gh_default", text = "Then you'll need bandages more than thread, and Arnok will tell you the same thing, only louder. Carry some linen anyway, because hitting things tears your clothes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't say, and I'm not paid to know. I sell thread, not gossip, though I hear plenty of both across this counter." } },
  },
}
