-- Thorium Point's working men: Master Smith Burninate at the anvil and Taskmaster Scrange over the ore crews.
-- Voice: bibles/thoriumpoint_smiths.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "burninate", id = TODO_NPC("Master Smith Burninate"), name = "Master Smith Burninate",
  bible = "bibles/thoriumpoint_smiths.md", role = "blacksmith", tier = "quest",
  communities = { "thorium_point" }, temper = { "gruff" }, values = { "proud", "exacting" },
  notices = { "profession", "kit" },

  impression = {
    first = "Master Smith Burninate judged my gear before he judged me, and he found both wanting in small, fixable ways. He forged for a tyrant once and talks about the work now as if every blow were his own.",
    third = "{name} met Master Smith Burninate, the Thorium Brotherhood's master smith at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Stand clear o' the anvil, unless ye've somethin' that needs hittin'. Most folk who come up this cliff do." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' I can hear yer buckles rattlin' from here, so ye've been usin' that kit hard. Good, for that's what it's for." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' I'd wager ye've no' oiled a thing since. Let's have a look at the damage, then." },
  },

  notice = {
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "Ye've a smith's forearms an' a smith's burns on the back o' yer hands. Whose anvil did ye learn on, an' did they teach ye tae quench proper?" },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "By the deep fires, what did ye do tae that armor? It's hangin' off ye like bark off a dead tree, an' it's a mercy ye're still standin' in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Burninate, master smith o' the Thorium Brotherhood. I made blades for the Firelord's armies for longer than yer grandfather lived, an' now I make them for whoever's coin is good, which is a great improvement." },
        { id = "h_flux", tags = { "news" }, when = { questActive = TODO_QUEST("What the Flux?") },
          text = "Ye're on my errand, I see. A smith without good flux is a man stirrin' soup wi' his fingers, so don't keep me waitin' long." },
        { id = "h_honored", when = { reputation = { faction = "Thorium Brotherhood", min = "honored" } },
          text = "The Brotherhood speaks well o' ye, an' that's no' a thing we say lightly. There's work I'd only show tae one o' our own, an' ye're near enough." },
        { id = "h_smith", when = { profession = "Blacksmithing" },
          text = "A fellow smith! Mind the tongs on yer way past, an' don't touch that ingot, for it's still hot enough tae take yer thumb off at the knuckle." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A Bronzebeard at my anvil. Go on, have a look, an' then tell me Ironforge does better, for I'd like tae hear ye try." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, eh? The Blackrock orcs up the mountain use our old work, so ye'll know the quality, even if ye've only seen it from the wrong end." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Aye, I'm still at it. The forge doesnae care what hour it is, an' neither do I, for I've not slept a full night since I was a lad." },
      },
      again = {
        { id = "h_again", text = "What else? I've metal coolin', so be quick about it." },
        { id = "h_again2", text = "Speak up, the bellows are loud." },
      },
      choices = {
        { text = "What do you forge up here?", next = "thorium" },
        { text = "What was it like forging for Ragnaros?", next = "quota" },
        { text = "Can I buy the Brotherhood's plans?", next = "plans" },
        { text = "What's this flux you need?", next = "flux", when = { questActive = TODO_QUEST("What the Flux?") } },
        { text = "Teach me something about thorium.", next = "craft", when = { profession = "Blacksmithing" } },
        { text = "Ironforge's smiths are the finest in the world.", next = "rival", when = { race = "Dwarf" } },
        { text = "Will you look at my blade, Master Smith?", next = "blade", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Your armor is enchanted. How?", next = "enchant", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "I need repairs.", next = "BUSINESS" },
        { text = "I'll leave you to your anvil.", next = "END" },
      },
    },

    thorium = {
      lines = {
        { id = "th_default", text = "Thorium, mostly, for there's more of it in these cliffs than anywhere I know, an' it takes an edge that'll outlast the arm swingin' it. We settled the Point here for the ore, an' the view's no' bad either, if ye like lava." },
      },
      choices = {
        { text = "Where does the ore come from?", next = "thorium_ore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thorium_ore = {
      lines = {
        { id = "to_default", text = "From the cliffs, an' from the Cauldron when Scrange can spare the lads. Down there our kin dig it for the Firelord under the whip, an' I'll no' lie, it galls me that the best seams are on their side." },
      },
      choices = {
        { text = "Then take the seams from them.", next = "BACK", reply = "Aye, an' I'd swing the first pick if I thought we'd keep them. But the Firelord's people would be up the cliff by nightfall, so we bide.", fx = { align = { order = -1 } } },
        { text = "Better to dig honest ore than start a war for it.", next = "BACK", reply = "That's the Brotherhood's way, an' it's kept us breathin'. I'll no' pretend I don't dream o' those seams, though.", fx = { align = { order = 1 } } },
        { text = "Who's Scrange?", next = "thorium_scrange" },
      },
    },
    thorium_scrange = {
      lines = {
        { id = "ts_default", text = "Taskmaster Scrange, over by the carts, the one countin' everything twice. He runs the ore crews, an' he's a hard man tae like but an easy one tae trust, which is the right way round for a taskmaster." },
      },
      choices = { { text = "I'll go and meet him.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    quota = {
      big = true,
      lines = {
        { id = "q_default", text = "Ye forged what ye were told, as fast as ye were told, an' if a blade cracked in the quench, they took it out o' yer back. I made thousands, an' I couldnae tell ye where one o' them ended up, only that it was somewhere bad." },
        { id = "q_smith", when = { profession = "Blacksmithing" },
          text = "Ye'll know what it is tae rush a quench, so picture rushin' every one for forty years wi' a whip behind ye. That's how I learned the trade, an' it's why I'll no' rush a thing now, for anyone." },
      },
      choices = {
        { text = "Do you regret the work?", next = "quota_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quota_regret = {
      lines = {
        { id = "qr_default", text = "I regret where it went, but no' the work, for the work was good, an' that's the bitter part. A tyrant's sword can still be well made, an' I made them well because I didnae know how tae make them badly." },
      },
      choices = {
        { text = "Good work is good work, whoever pays.", next = "BACK", reply = "Spoken like a smith, an' it's a comfort o' sorts. But I'd still sooner my good work had gone tae better hands.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "A craftsman answers for what his blades do.", next = "BACK", reply = "Aye, he does, an' I've been answerin' for mine every night since I came up the cliff. That's why I'm here an' no' down there.", fx = { align = { light = 1 } } },
        { text = "And now you choose who buys.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    plans = {
      lines = {
        { id = "p_default", text = "No' from me, an' no' tae just anybody. The Brotherhood sells its plans tae those who've earned our trust, an' ye earn it by bringin' us what we need out o' that mountain." },
        { id = "p_honored", when = { reputation = { faction = "Thorium Brotherhood", min = "honored" } },
          text = "Ye're well on yer way already, from what I hear. Keep at it, an' the better plans will open tae ye one at a time, same as they did for us." },
      },
      choices = {
        { text = "Who sells them, then?", next = "plans_lokhtos" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans_lokhtos = {
      lines = {
        { id = "pl_default", text = "Lokhtos Darkbargainer, one o' ours, sittin' in the Grim Guzzler down in the depths wi' a mug in his hand an' his ears open. It's a mad place for a trader, but the ore an' the cores are down there, so he is too." },
      },
      choices = {
        { text = "A Brotherhood man inside the mountain? That's brave.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    flux = {
      lines = {
        { id = "f_default", text = "Flux keeps the filth out o' the weld, an' without it ye get a seam that'll split the first time somethin' hits it hard. Bring me what I asked for, an' I'll show ye the difference it makes on the anvil." },
      },
      choices = { { text = "I'll bring it.", next = "BACK", fx = { affinity = 1 } } },
    },

    craft = {
      lines = {
        { id = "c_default", text = "Thorium's stubborn, so it wants more heat than ye think an' more patience than ye've got. Hit it too cold an' it cracks, too hot an' it goes soft, an' the colour ye want is the one just before ye lose yer nerve." },
      },
      choices = {
        { text = "How do I know that colour?", next = "craft_colour" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_colour = {
      lines = {
        { id = "cc_default", text = "Ye ruin a few dozen bars an' ye remember. There's no other way I know of, though the Ironforge lads will sell ye a book about it, an' I've read it, an' it's wrong in three places." },
      },
      choices = {
        { text = "Then I'll ruin a few dozen bars.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Which three places?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    rival = {
      big = true,
      lines = {
        { id = "r_default", text = "Are they, now? Ironforge makes fine work, I'll grant, but yer smiths learned at leisure, an' mine learned wi' the Firelord watchin' an' the cost o' a mistake bein' a finger. We'll see whose blade's still sharp in ten years." },
      },
      choices = {
        { text = "Ironforge will always stand first. That won't change.", next = "BACK", reply = "Maybe it will, an' maybe it won't, but we'll see whose anvil's still ringin' when the Firelord's gone. Come back in ten years.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Then let the work decide, not the clan.", next = "BACK", reply = "Now that's a fair-minded thing tae hear from a stranger. Let the steel speak, an' I'll stand by mine.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    blade = {
      lines = {
        { id = "b_default", text = "Give it here. Ye've been parryin' wi' the flat an' it's walked the edge off-true, an' there's a nick near the hilt that'll grow into a crack if ye leave it. It's no' bad steel, but it deserves better than ye've been givin' it." },
        { id = "b_paladin", when = { class = "PALADIN" },
          text = "A paladin's blade, an' ye've been leanin' on it like a walkin' stick when ye kneel, I can see it in the tip. The Light might mend yer wounds, but it'll no' mend yer steel, so look after it." },
      },
      choices = {
        { text = "I'll treat it better.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "It's a tool. It breaks, I replace it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    enchant = {
      lines = {
        { id = "e_default", text = "That's no' my end o' the work, an' I'll no' tell ye anyway. We stole that learnin' a scrap at a time under the Firelord's eye, an' we got out o' the mountain wearin' it, so it stays in the Brotherhood." },
        { id = "e_lock", when = { class = "WARLOCK" },
          text = "It's no' demon work, if that's what ye're sniffin' after, an' I'll thank ye tae keep yer imp away from my coals. The rest is Brotherhood business." },
      },
      choices = {
        { text = "Then keep your secret.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was born tae the anvil an' I'll likely die at it, but at least now it's my own anvil.", next = "quota" } },
    advice = { { id = "tp_ad", text = "Oil yer kit every night, even when ye're tired, because especially when ye're tired." } },
    dark_iron = { { id = "tp_dark_iron", text = "They make good steel down there for a bad master, an' I'd give a great deal tae see them make it for themselves." } },
    _none = { { id = "tp_none", text = "If I cannae hit it wi' a hammer, I've no opinion on it, so ask the Overseer." } },
  },
}

P:NPC {
  key = "scrange", id = TODO_NPC("Taskmaster Scrange"), name = "Taskmaster Scrange",
  bible = "bibles/thoriumpoint_smiths.md", role = "worker", tier = "quest",
  communities = { "thorium_point" }, temper = { "stern" }, values = { "practical", "fair" },
  notices = { "race", "class" },

  impression = {
    first = "Taskmaster Scrange counts everything twice and smiles at almost nothing. He runs the Brotherhood's ore crews and carries an old title from the mountain as if it were a debt he means to pay back.",
    third = "{name} met Taskmaster Scrange, who runs the Thorium Brotherhood's ore crews at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Mind the carts. If ye're no' pushin' one, ye're in the way of one, an' that's the whole of the law at this end o' the Point." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I've counted ye in, so ye'd best be here for a reason." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' I'd noticed, for I notice everyone who comes an' goes. Habit, ye understand, an' no' a pleasant one." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard. Yer folk dig well, I'll say that, but ye dig in cool stone an' we dug in stone that could cook a man, so don't tell my crews how tae swing." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Good shoulders on ye. Ye'd swing a pick well, if ye ever tired o' swingin' at folk, an' some days I think the pick's the better trade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Scrange, taskmaster o' the ore crews. I count the ore that comes up, the lads that go down an' the lads that come back, an' I'll no' rest till the last two numbers match." },
        { id = "h_maltorius_done", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "Word is Maltorius is dead, an' that ye're the one who did it. I knew men like him in the mountain, an' I'll no' say a kind word over him." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Dark Iron", min = 40 } },
          text = "Ye've been cuttin' through the Dark Irons in the Cauldron like they're kindlin'. Some o' those taskmasters had it comin', but mind the slaves, for they're no' the ones holdin' the whips." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, an' no' a Blackrock, by yer colours. The ones up the mountain fight our kin for the Spire, an' I'll no' weep for either side, so we've no quarrel, you an' me." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue at my carts, an' I've already counted every bar on 'em twice. Ye'll find nothin' missin' tonight that I won't know about by mornin'." },
        { id = "h_tired", when = { metBefore = true, timeOfDay = "night" },
          text = "Last crew's still out in the Cauldron. I'll sit here wi' my tally till they're back, an' don't tell me tae sleep, for Hansel's done enough sleepin' for the both of us." },
      },
      again = {
        { id = "h_again", text = "What else? The carts don't push themselves." },
        { id = "h_again2", text = "Go on, I'm listenin' an' countin' at the same time." },
      },
      choices = {
        { text = "What do your crews dig?", next = "work" },
        { text = "Why 'Taskmaster'? That sounds like the mountain's word.", next = "title" },
        { text = "What about the slaves in the Cauldron?", next = "slaves" },
        { text = "What do you make of the Overseer?", next = "oilfist" },
        { text = "And Hansel?", next = "hansel" },
        { text = "Bronzebeards dig better than Dark Irons.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Is Maltorius's death good news for you?", next = "maltorius", when = { questDone = TODO_QUEST("WANTED: Overseer Maltorius") } },
        { text = "I'd steal from the Dark Irons, not from you.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll get out of the way of the carts.", next = "END" },
      },
    },

    work = {
      lines = {
        { id = "w_default", text = "Thorium from the cliffs, iron from wherever we can reach it, an' now an' then a bit o' Dark Iron ore when a crew gets brave in the Cauldron. Burninate takes the lot an' complains it's no' enough, which is how I know he's well." },
      },
      choices = {
        { text = "Why risk the Cauldron at all?", next = "work_cauldron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_cauldron = {
      lines = {
        { id = "wc_default", text = "Because the best seams are down there, an' our kin hold them for the Firelord. I send six lads at a time, never fewer, an' I make them walk back the long way, round the Slag Pit, so nobody follows them home." },
      },
      choices = {
        { text = "You take good care of them.", next = "BACK", fx = { affinity = 2 } },
        { text = "You could send me instead.", next = "work_me" },
      },
    },
    work_me = {
      lines = {
        { id = "wm_default", text = "I could, an' ye'd likely come back, which is more than I can promise for some o' mine. But ye're no' on my tally, so whatever ye bring out o' that pit, take it tae the Overseer an' no' tae me." },
      },
      choices = { { text = "I'll do that.", next = "BACK", fx = { affinity = 1, standing = { thorium_point = 1 } } } },
    },

    title = {
      big = true,
      lines = {
        { id = "t_default", text = "Aye, it is, an' it's the same word they used for me down there. I counted ore an' bodies for the overseers, an' when a lad came up short, I was the one who had tae say so." },
      },
      choices = {
        { text = "Then why keep the name?", next = "title_keep" },
        { text = "You were a slave too. That isn't your fault.", next = "title_fault" },
      },
    },
    title_keep = {
      lines = {
        { id = "tk_default", text = "So I don't forget it. Every mornin' somebody calls me Taskmaster, an' every mornin' I make sure the lads get their supper an' nobody gets the whip, an' one day that'll square the ledger, or it won't." },
      },
      choices = {
        { text = "A debt like that can be paid off.", next = "BACK", reply = "I hope so, an' I'll keep payin' till it is. One supper at a time.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Some ledgers never balance, Scrange.", next = "BACK", reply = "Maybe they don't, but a dwarf keeps payin' anyway. That's the only honest thing left tae do.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    title_fault = {
      lines = {
        { id = "tf_default", text = "Kindly said, an' the Overseer says the same, but I was a slave wi' a tally board instead of a pick, an' the lads wi' picks remember. They trust me now, most of them, an' that took a long while." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    slaves = {
      lines = {
        { id = "s_default", text = "There's hundreds still workin' the Cauldron, our own kin among them, an' worse besides. Maltorius keeps the whips goin' down there, an' Lolo's had a price on his head this long while." },
      },
      choices = {
        { text = "Could the Brotherhood free them?", next = "slaves_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    slaves_free = {
      lines = {
        { id = "sf_default", text = "With what, a dozen smiths an' a blind lookout? If we stormed the Cauldron, the Firelord's people would come up the cliff after us, an' then there'd be no Point an' no Brotherhood, only more slaves." },
      },
      choices = {
        { text = "Then you wait, and save the ones you can.", next = "BACK", reply = "That's the plan, an' it's a slow one, but it's the only one that doesnae end in more chains. Every one we save counts.", fx = { align = { order = 1 } } },
        { text = "Waiting is how slaves stay slaves. Someone has to strike.", next = "BACK", reply = "Aye, an' I've said the same in my cups. But I'll no' throw away the Point on a bad night's courage.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    oilfist = {
      lines = {
        { id = "o_default", text = "He planned the way out, an' he carried the worst o' it, an' he's carried us since. If he says somethin's his responsibility, believe him, for he means every rock an' every dwarf on this cliff." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hansel = {
      lines = {
        { id = "hn_default", text = "Hansel's on my rota for the night carts three nights a week, an' he's turned up for one of them since the spring. I've stopped countin' him, which is the only time I've ever stopped countin' anythin'." },
      },
      choices = {
        { text = "Let the man rest. He's earned it.", next = "BACK", reply = "I've let him, mostly, an' I'll keep lettin' him. Some men have done enough night carts for a lifetime.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "A rota is a rota. He should be on it.", next = "BACK", reply = "It is, an' I'll put him back on it the day he's fit. Until then, the ledger can wait.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    dwarf = {
      big = true,
      lines = {
        { id = "d_default", text = "Ha! Ye dig better in cool rock, wi' nobody standin' over ye, aye. Put one o' yer Ironforge miners in the Cauldron for a week, an' we'll see who comes back wi' his eyebrows." },
      },
      choices = {
        { text = "You learned in a harder school than we did.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "We'd still out-dig you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },

    maltorius = {
      lines = {
        { id = "m_default", text = "Good news for the lads in the Cauldron, for a week or two, till the Firelord's people send another overseer wi' another whip. But that week matters, an' ye gave it tae them, so I'll count it." },
      },
      choices = {
        { text = "Then I'll keep cutting them down.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "A week is something.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    rogue = {
      lines = {
        { id = "rg_default", text = "Wise o' ye, an' I'll tell ye for nothin' that the Dark Iron taskmasters in the Cauldron carry their keys on their belts. I've no' told ye anythin', mind, an' I've already forgotten we spoke." },
      },
      choices = {
        { text = "Forgotten what?", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I kept the count in the mountain, an' I keep it here, but here the numbers are mine.", next = "title" } },
    advice = { { id = "tp_ad", text = "Count everythin' that matters, twice, an' count the people first." } },
    dark_iron = { { id = "tp_dark_iron", text = "Half the faces in the Cauldron I could name, if I let myself, so I don't." } },
    _none = { { id = "tp_none", text = "It's no' on my tally, so I couldnae tell ye." } },
  },
}
