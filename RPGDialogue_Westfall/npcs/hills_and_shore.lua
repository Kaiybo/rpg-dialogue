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
    hello = {
      lines = {
        { id = "h_default", text = "Grimbooze Thunderbrew, brewer and bard, who keeps his still here where the hills are hard. The farmers have gone, but the barley still grows, and where there's good barley, the Thunderbrew goes." },
        { id = "h_dry", tags = { "news" }, when = { questActive = TODO_QUEST("Dry Times") },
          text = "Ye've come from Lakeshire, and Daniels is dry? Then a keg of my lager's the thing ye should buy, for no barkeep in Redridge would sleep at his bar with no Thunderbrew Lager, whoever ye are!" },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome in the hills, with a nose for the brew? I'd show ye my still, but ye'd only improve it, and then it'd blow up, and so would I too." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, shining as bright as the sun! I'll not ask ye to drink, but ye're welcome to look, since a still's only copper and fire and a book." },
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
      lines = { { id = "d_default", text = "The Defias come by with their masks and their blades, and they buy a few barrels for drinking in raids. They pay for it, mostly, and leave me alone, for a man with good lager is worth more than stone." } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Kriggon Talsone, and I fish this shore, same as my father did before the farms went bad. The sea doesn't care who owns Westfall, which is more than I can say for anything else around here." },
        { id = "h_farmhand", when = { origin = "human_westfall_farmhand" }, text = "You've the look of a Westfall hand, under all that gear. Whose farm was it? Never mind, I don't want to know which one burned." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "They say your sort can talk to the water. If it tells you where the fish have gone, you'll tell me, won't you?" },
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
    background = { { id = "tp_bg", text = "Born in a shack above this beach, and I'll likely die in it, but I'll have eaten well." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the water, friend. Something's always coming out of it." } },
    defias = { { id = "tp_defias", text = "I hear hammering from the cliffs down the shore at night, and I see masked men on the path. I don't go and look, and they don't bother me." } },
    _none = { { id = "tp_none", text = "Don't know it. If it doesn't swim, I don't keep track of it." } },
  },
}
