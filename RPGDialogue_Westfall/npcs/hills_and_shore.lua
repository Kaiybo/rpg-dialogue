-- Westfall away from Sentinel Hill: Grimbooze Thunderbrew's still in the hills and
-- Kriggon Talsone fishing the Longshore. Voice: bibles/hills_and_shore.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Grimbooze Thunderbrew: a dwarf brewer in the Dagger Hills who talks in rhyme.
P:NPC {
  key = "grimbooze", id = TODO_NPC("Grimbooze Thunderbrew"), name = "Grimbooze Thunderbrew",
  bible = "bibles/hills_and_shore.md", role = "vendor", tier = "service",
  communities = {}, temper = { "jovial" }, values = { "craft", "freedom" },
  notices = { "race", "drink" },
  impression = {
    first = "Grimbooze Thunderbrew brews lager in the Westfall hills, far from any Thunderbrew hall, and he speaks almost entirely in rhyme. The rhymes are terrible and the lager is not.",
    third = "{name} met Grimbooze Thunderbrew, a rhyming dwarf who brews lager in the Dagger Hills of Westfall.",
  },
  greetings = {
    { id = "g_default", text = "Come in from the dust and sit by the still, and buy what ye like, for there's lager to spill!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye, my thirsty friend? I've barrels enough that will never quite end." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on my doorstep, as far from the forge as myself! Ye'll be wanting a taste of the real stuff, not the swill they sell on a Stormwind shelf." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye're swaying already, I see by yer feet, so sit yerself down on that barrel and take a wee seat." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A rhyme for the barley, a rhyme for the yeast, a rhyme for the spirits to come to the feast! The rhymes are terrible, I know, but the lager's honest." } },
      choices = {
        { text = "Your lager's honest work. Keep brewing it, Grimbooze.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Drop the rhymes. They're ruining a good beer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Yer fel fire, ye say, for the heat of my brew? I'll thank ye for asking, but I'll not let ye do, for a lager that's boiled over brimstone and doom would taste of a crypt and would smell of a tomb!" },
        { id = "xlock_more1", text = "Plain coal from the hills is the fire I trust, and a Thunderbrew's lager is honest or bust." },
      },
      choices = {
        { text = "Then I'll keep my fel off your fire, Grimbooze.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your loss. It would brew twice as fast.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Grimbooze.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They drink it by barrel, they drink it by mug, they drink it by bucket and boot and by jug! A warrior's thirst is a wonderful thing, and I'll serve him a lager that'll make him sing." } },
      choices = {
        { text = "I'll drink one cup and keep my head clear.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Pour me a barrel, and a song to go with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Grimbooze.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A Thunderbrew Lager, as dark as the night, with a head like the foam on a sea at its height! The Goretusk is tough, but the lager is smooth, and between them there's nothing a body can't soothe." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And there's {pet}, poor beast, with a nose for my still! Keep it away, for it'll drink, and it will!" },
      },
      choices = {
        { text = "I'll share the boar and the barrel with the militia.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep the boar and the barrel for myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "A barrel lifted is a barrel missed, and a Thunderbrew never forgets his list! I've counted them twice since the Defias came by, so mind your fingers and keep your thirst dry." } },
      choices = {
        { text = "I'll pay for my drink, honest as stone.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take one the next time you look away.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why brew all the way out here?", next = "why" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "A mage with frost and a mug to fill, now there's a skill to warm the will! But lager wants a cellar's cool and not a spell from some Stormwind school, so thank you kindly, I'll keep my rule." } },
      choices = {
        { text = "Tradition knows best. Keep your cellar.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are for cellars. Let me try it anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Do the Defias buy from you?", next = "defias" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ye can bless it, and welcome, for it's gone without prayer since I hauled it up here and set it down there. But I'll warn ye that blessings and lager don't mix, for the last one who tried went home in a fix!" } },
      choices = {
        { text = "Honest work deserves a blessing. May your still be blessed, Grimbooze.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your still's no business of any god's. Brew on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Grimbooze.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I sell to whoever comes up the hill with some coin, be it farmer or thief or a dwarf with a groan. But I've never yet had a Defias pay, for they'd rather just take it and then run away!" } },
      choices = {
        { text = "Then turn them away. Coin from thieves is stolen twice.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Coin is coin, Grimbooze. Sell to anyone who pays.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, brewer.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The secret's the hills, for the dust doesn't climb, and I sing to my barley a verse at a time. The golems below have the valley stripped bare, but up here the soil has a Thunderbrew's care." } },
      choices = {
        { text = "Plant in neat rows and rest the soil. Order feeds a field.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let it grow wild, Grimbooze. The hills know best.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Grimbooze Thunderbrew, brewer and bard, who keeps his still here where the hills are hard. The farmers have gone, but the barley still grows, and where there's good barley, the Thunderbrew goes." },
        { id = "h_dry", tags = { "news" }, when = { questActive = TODO_QUEST("Dry Times") },
          text = "Ye've come from Lakeshire, and Daniels is dry? Then a keg of my lager's the thing ye should buy, for no barkeep in Redridge would sleep at his bar with no Thunderbrew Lager, whoever ye are!" },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome in the hills, with a nose for the brew? I'd show ye my still, but ye'd only improve it, and then it'd blow up, and so would I too." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, shining as bright as the sun! I'll not ask ye to drink, but ye're welcome to look, since a still's only copper and fire and a book." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior come up from the road, with a blade at the hip and a terrible load! Sit down by the still and I'll pour ye a cup, for there's no better cure for a fight than a sup." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter with bow and a beast at the heel! Ye'll want a fine lager to go with yer meal, for a boar on the spit and a keg on the side is the best thing in Westfall, I'll say it with pride!" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at my still, and a welcome one too, for a blessing on barley does wonders for brew!" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid from the forests, all silver and green, the tallest young drinker this still's ever seen! Ye'll know a good crop when ye stand in a field, so come taste the lager and judge the hill's yield." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Now there's a sight, with a fire in yer hand that's not quite right! Keep that green flame away from my still, for it's lager I brew here, and not something ill!" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, a dwarf, who talks to air! Come sit and have a beer, it's better than what your spirits share." },
      },
      again = {
        { id = "h_again", text = "What else would ye ask of a dwarf at his still? Ask quickly, before all the barley goes ill." },
        { id = "h_again2", text = "Go on, then, and ask, for the mash needs a stir, and I'll answer ye straight, or as straight as I were." },
      },
      choices = {
        { text = "Let me see what you're selling.", next = "BUSINESS" },
        { text = "Why brew out here, of all places?", next = "why" },
        { text = "Do you always talk in rhyme?", next = "rhyme" },
        { text = "Aren't the Defias a danger to you?", next = "defias" },
        { text = "Barkeep Daniels in Lakeshire needs lager.", next = "daniels", when = { questActive = TODO_QUEST("Dry Times") } },
        { text = "Your barrels would be easy to lift, you know.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could chill your lager in a heartbeat.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warriors drink much of your Thunderbrew, Grimbooze?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What goes best with a Westfall boar, Grimbooze?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would you let me bless your still, Grimbooze?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you sell your lager to the Defias, if they paid?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your barley thrives where Westfall's wheat died. What's the secret?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could my fel fire heat your still, Grimbooze?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does your lager really need a rhyme, Grimbooze?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your still.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Ironforge brewers are many and loud, and a Thunderbrew there is just one of the crowd. Out here there's the barley the farmers left sown, and nobody minds if I brew on my own." } },
      choices = {
        { text = "The barley belongs to the farmers, though.", next = "why_barley" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_barley = {
      big = true,
      lines = { { id = "wb_default", text = "The farmers are gone, and the fields would go wild, or else feed the gnolls, who'd leave not a child. I pay what I can to the ones still about, and Saldean's had barrels, I'll tell ye, no doubt." } },
      choices = {
        { text = "Then pay them more. It's their land.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Abandoned fields belong to whoever works them.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rhyme = {
      lines = { { id = "r_default", text = "Since I was a lad in the halls of my clan, and my mother said rhyming would make me a man. It never quite did, but it sells a fair keg, so I'll rhyme till I'm buried, or lose my last leg." } },
      choices = {
        { text = "Can you stop if you try?", next = "rhyme_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rhyme_stop = {
      lines = { { id = "rs_default", text = "I can, but it hurts me, and the words come out flat, like ale with no head on it, and who wants that? There, ye see? That was nearly a rhyme, and I wasn't even trying." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    defias = {
      lines = { { id = "d_default", text = "The Defias come by with their masks and their blades, and they buy a few barrels for drinking in raids. They pay for it, mostly, and leave me alone, since even a cutthroat won't torch the only still between here and Goldshire." } },
      choices = {
        { text = "You sell to outlaws?", next = "defias_sell" },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    defias_sell = {
      big = true,
      lines = { { id = "ds_default", fx = { learn = { "defias" } }, text = "I sell to the thirsty, whoever they be, and the militia drinks too, when they come up to see. I'm a brewer, not judge, and I've no wish to die, so I pour for them all and I don't ask them why." } },
      choices = {
        { text = "Selling to the Defias helps them. Stop it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A brewer stays alive by staying out of it.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    daniels = {
      lines = { { id = "da_default", text = "Then take him a keg, and be quick on the road, for there's gnolls in the hills who'd be glad of the load. And tell him from me that his last batch of coin was a little bit light, but I'll let it go, since we're friends." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons brew a stout that's black as their hearts, and I've never had the nerve to try it, since I'm fond of my parts." } },
    magni = { { id = "tp_magni", text = "King Magni's beard is broad and his laugh is loud, and I'd pour him a pint and be terribly proud." } },
    deadmines = { { id = "tp_deadmines", text = "They say there's a mine where the Defias hide, so I keep my still on the other side." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire came with its music and lights, and I sold them my lager for three dizzy nights. They drank every barrel before I was through, and I've not been paid yet, so tell them that too." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammers drink like a gryphon flies, high and fast and with tears in their eyes." } },
    background = { { id = "tp_bg", text = "A Thunderbrew born in the halls of the stone, I came south for the barley and stayed on my own." } },
    advice = { { id = "tp_ad", text = "Never drink what ye can't pronounce, friend, and never trust a dwarf who doesn't drink at all." } },
    defias = { { id = "tp_defias", text = "They're thirsty and angry, and some of them sad, and I'd not want to cross them, though some aren't so bad.", next = "defias_sell" } },
    _none = { { id = "tp_none", text = "That's not in my barrel and not in my head, so ask someone else, or have lager instead." } },
  },
}

-- Kriggon Talsone: a fisherman on the Longshore, south-east of the lighthouse.
P:NPC {
  key = "kriggon", id = TODO_NPC("Kriggon Talsone"), name = "Kriggon Talsone", title = "Fisherman",
  bible = "bibles/hills_and_shore.md", role = "worker", tier = "service",
  communities = {}, temper = { "dry" }, values = { "practical", "patient" },
  notices = { "craft" },
  impression = {
    first = "Kriggon Talsone fishes the Longshore below the lighthouse and talks as slowly as the tide comes in. He keeps one eye on his line and the other on the murlocs down the beach.",
    third = "{name} met Kriggon Talsone, a fisherman on Westfall's Longshore.",
  },
  greetings = {
    { id = "g_default", text = "Tide's coming in, friend. Mind your boots, and mind the murlocs." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The fish weren't biting then, and they aren't now, either." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You've a pole on your back, so you're one of us. Cast past the breakers, not into them, and you'll do better than most." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Same as me, I'd guess, which is fish, and they've more patience with spears than I've got with my line. If your water spirits have a word with them, I'd be grateful." } },
      choices = {
        { text = "Then share the beach fairly. Fight only if they push.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Drive the murlocs off the shore. The beach is yours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, I suppose, and you'd have a block of ice with a few dead fish in it and a lot of angry murlocs wondering where their supper went. The sea gives what it gives, and I've found it gives more to them that wait than to them that grab." },
        { id = "xmage_more1", text = "The lighthouse keepers used to say the same about the tide, back when there were keepers, and they knew it better than me." },
      },
      choices = {
        { text = "Then I'll leave the sea to its own pace.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting is for people without spells.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kriggon.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More every season, coming up from the deep since the farms went bad. My father said the murlocs knew when people were weak, and they came up the beach to see. I think he was right." } },
      choices = {
        { text = "I'll push them back into the sea.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them have the beach. There's more inland.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only when they come for my nets, and then I hit them with an oar. They're slippery and they shriek, but they're cowards mostly, so a beast at your side will scatter them faster than any spear." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would make short work of a murloc. Keep it away from my catch, though; it's all I've got." },
      },
      choices = {
        { text = "I'll clear the shore so you can fish in peace.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt them, but your nets are your own concern.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Nothing hears you coming, I'd wager, but murlocs smell you anyway, and they've noses like the tide. If you're creeping down the Longshore, go upwind and go slow, same as I do with the fish." } },
      choices = {
        { text = "I'll clear them quietly, before they know I'm there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd sooner face them head on, Kriggon.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What drives the murlocs up the beach?", next = "murlocs" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "That little red thing? It'd burn my nets first and laugh about it, I reckon. I've fished this shore with nothing but a knife and patience, and the murlocs and I have an understanding, mostly." } },
      choices = {
        { text = "Fire settles murlocs, Kriggon. Let it work.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll keep the imp well away from your nets.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Why do you stay on this shore?", next = "stay" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When something washes up, I bury it above the tideline and say what my father used to say, which isn't much. The sea's taken plenty off this coast, so I'd be glad of someone who knew the proper words." } },
      choices = {
        { text = "I'll say proper words for them all, Kriggon.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The sea keeps what it takes. Leave it be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nobody but ourselves and the lighthouse, and the lighthouse can't swing a sword. The militia keep to the hill and the roads, which I understand, but the murlocs don't come by road." } },
      choices = {
        { text = "Then I'll walk the shore for you myself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fishermen chose the shore. They can guard it themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kriggon.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They take more fish than they need and leave the rest to rot on the sand, and the gulls won't even touch it now. My father said the sea always settles its own accounts, but I've been waiting a long while for that." } },
      choices = {
        { text = "Somebody has to keep that shore in order. Drive them back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The murlocs were here first. Share the shore with them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Kriggon Talsone, and I fish this shore, same as my father did before the farms went bad. The sea doesn't care who owns Westfall, which is more than I can say for anything else around here." },
        { id = "h_farmhand", when = { origin = "human_westfall_farmhand" }, text = "You've the look of a Westfall hand, under all that gear. Whose farm was it? Never mind, I don't want to know which one burned." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "They say your sort can talk to the water. If it tells you where the fish have gone, you'll tell me, won't you?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on my beach. The murlocs won't care how strong you are, so watch your feet; the sand's slippery when it's wet." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you're after murlocs, they're thick on the Longshore; if you're after fish, you'll have to be patient, same as me." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest on the Longshore. The sea washes up all sorts, and some of it needs burying proper." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The murlocs won't bow to your Light, I'd guess, but they'll run from it, and that's near enough." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Your folk came over the sea to get here, I hear, so you'll know it better than most farmers do." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage on the Longshore. If you can conjure fish, don't tell me, because I've been at this my whole life." },
      },
      again = {
        { id = "h_again", text = "Something else? The line's slack, so I've time." },
        { id = "h_again2", text = "Go on, ask. Fish don't mind a bit of talk." },
      },
      choices = {
        { text = "What's biting on this coast?", next = "fish" },
        { text = "Are the murlocs a danger?", next = "murlocs" },
        { text = "What do you know about the lighthouse?", next = "lighthouse" },
        { text = "Why stay in Westfall at all?", next = "stay" },
        { text = "The murlocs wouldn't hear me coming.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "My imp would burn those murlocs off your beach.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How many murlocs are on this shore, Kriggon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you ever hunt the murlocs yourself, Kriggon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever say words for those lost on this shore?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does anyone protect the fishermen on the Longshore?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The murlocs crowd your shore. Do they foul the water?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Couldn't I just freeze the shallows and pick out your fish?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do the murlocs want with your beach, Kriggon?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good fishing to you.", next = "END" },
      },
    },
    fish = {
      lines = { { id = "f_default", text = "Longjaw mud snapper in the shallows, and a few bigger things further out when the weather's kind. I salt what I can and walk it up to Sentinel Hill, where the militia's always hungry." } },
      choices = {
        { text = "Does the militia pay fairly?", next = "fish_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_pay = {
      lines = { { id = "fp_default", text = "As fair as they can, which isn't much. Gryan's people are farmers like the rest of us, and you can't squeeze silver out of a man who's got none." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "people_militia" } } } },
    },
    murlocs = {
      lines = { { id = "m_default", text = "They are when there's enough of them, and lately there's always enough. They've huts all down the coast now, and they take the best of the catch before it ever gets near my line." } },
      choices = {
        { text = "Has anyone tried to drive them off?", next = "murlocs_drive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murlocs_drive = {
      big = true,
      lines = { { id = "md_default", text = "A few adventurers have, and they come back every time. Some say we should burn the huts and be done with it, and some say the shore was theirs before it was ours, and I've stopped knowing which I believe." } },
      choices = {
        { text = "Burn them out. People need this shore.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Share the shore. Fighting them only brings more.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lighthouse = {
      lines = { { id = "l_default", text = "A family kept it once, until Old Murk-Eye brought his murlocs up out of the water and killed them. It's still lit most nights, mind you, and folk say the one tending it is the ghost of a pirate captain whose ship broke on the rocks when the light went dark." } },
      choices = {
        { text = "Do you believe it's a ghost?", next = "lighthouse_ghost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lighthouse_ghost = {
      lines = { { id = "lg_default", text = "I've seen a pale light moving up there with no one carrying it, and whatever it is, it keeps ships off the rocks. That's enough for me to keep fishing down here and leave it be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stay = {
      lines = { { id = "s_default", text = "Because the fish are still here, even if the farmers aren't. The Defias don't bother a man with nothing but a boat and a bucket, and the Furlbrows and Saldeans are still hanging on, so I'm not the last fool in Westfall." } },
      choices = {
        { text = "That's not foolish. That's stubborn courage.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "I fished out of Booty Bay one season, and the sharks there are as big as a rowboat and twice as clever. I came home with all ten fingers, which put me ahead of most." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail sail past the lighthouse now and then, and I keep my head low in the boat when they do. They've no need of a fisherman, but they'd take one anyway, for the fun of it." } },
    deadmines = { { id = "tp_deadmines", text = "Sometimes at night I hear hammering from the hills behind Moonbrook, slow and steady, like a shipwright. I tell myself it's my ears, and then I row a little faster." } },
    gilneas = { { id = "tp_gilneas", text = "The fish off the Gilnean coast are cold and sweet, the old sailors say, but nobody's fished there in years. They built a wall, and the sea didn't care, and I suppose the fish didn't either." } },
    background = { { id = "tp_bg", text = "Born in a shack above this beach, and I'll likely die in it, but I'll have eaten well." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the water, friend. Something's always coming out of it." } },
    defias = { { id = "tp_defias", text = "I hear hammering from the cliffs down the shore at night, and I see masked men on the path. I don't go and look, and they don't bother me." } },
    _none = { { id = "tp_none", text = "Don't know it. If it doesn't swim, I don't keep track of it." } },
  },
}
