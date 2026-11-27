-- Brewers and tinkers of Kharanos and Brewnall Village: Marleth Barleybrew and Jarven Thunderbrew (the Bitter Rivals
-- prank), Rejold Barleybrew (The Perfect Stout), Ozzie Togglevolt (Gnogaine) and Shelby Stoneflint (stable master).
-- Voices: bibles/kharanos_brewers.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Marleth Barleybrew
---------------------------------------------------------------------------
P:NPC {
  key = "dm_marleth", id = TODO_NPC("Marleth Barleybrew"), name = "Marleth Barleybrew", gender = "female",
  bible = "bibles/kharanos_brewers.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "mischievous", "proud" }, values = { "family", "craft" },
  notices = { "race", "drunk" },

  impression = {
    first = "She grinned while planning my raid on the Thunderbrews' cellar.",
    third = "{name} met Marleth Barleybrew of Brewnall Village, who'd like the whole of Dun Morogh to know the Thunderbrews aren't the only brewers in it.",
  },

  greetings = {
    { id = "g_default", text = "Well now, ye've an honest face an' quiet boots, an' that's exactly what I need. Come here, come here, I've a wee job for ye." },
    { id = "g_back", when = { metBefore = true }, text = "There's my accomplice! Sit down an' have a mug, for ye've earned one, or ye will have soon enough." },
    { id = "g_fl_eye", when = { flirt = true, chance = 0.4 },
      text = "Well now, ye've broad shoulders for barrel work an' a smile that'd make old Jarven forget what he was guardin'. Come here, {g:lad|lass}, I've a mug wi' yer name on it." },
    { id = "g_fl_back", when = { flirt = true, npcFlagBefore = "fl_sweet" }, cooldown = "3d",
      text = "There's my handsome accomplice! I told cousin Rejold about ye, an' he says I've gone soft, an' I told him tae mind his stout." },
    { id = "g_fl_no", when = { flirt = true, npcFlagBefore = "fl_no" }, once = true,
      text = "Ach, it's you! Dinnae fret, I've no designs on ye but the barrel-swappin' kind, an' those I'll never give up." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Then tell me true, an' I'll not be offended: do ye drink Thunderbrew or Barleybrew at home? Ach, don't answer, I can see it on ye." },
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye've had a few already, I can tell. If it was Thunder Ale, ye'll have a sore head by mornin', an' if it was ours, ye'll want another." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marleth Barleybrew, an' my family's been brewin' in Dun Morogh as long as the Thunderbrews, whatever they tell the tourists. They need to learn that theirs isn't the only decent brew in these mountains, an' I've a barrel here that'll teach them." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Bitter Rivals") },
          text = "Have ye switched the barrel yet? It's down in the cellar o' the Thunderbrew Distillery, an' if Jarven Thunderbrew's on guard there, ye'll need to give him somethin' to look at besides the barrels." },
        { id = "h_return", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Marleth") },
          text = "Ye did it? Ha! I can just see it now, half o' Kharanos takin' a pull o' Thunder Ale an' gettin' a mouthful o' Barleybrew Scalder instead!" },
        { id = "h_done", when = { questDone = TODO_QUEST("Return to Marleth") },
          text = "Word is the Thunderbrews' regulars have been askin' for 'that new one' all week, an' nobody in the distillery can tell them what it was. I've never been so happy in my life." },
      },
      again = {
        { id = "h_again", text = "What else, then? Keep yer voice down, the Thunderbrews have ears." },
        { id = "h_again2", text = "Go on, ask. I've time, an' I've ale." },
      },
      choices = {
        { text = "Why the feud with the Thunderbrews?", next = "feud" },
        { text = "What's in Barleybrew Scalder?", next = "scalder" },
        { text = "Isn't swapping their barrel a bit low?", next = "prank" },
        { text = "Tell me about Brewnall Village.", next = "brewnall" },
        { text = "My clan drinks Thunderbrew, Marleth.", next = "clan", when = { race = "Dwarf" } },
        { text = "Why pick me for the job, Marleth?", next = "fl_why", when = { flirt = true } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    fl_why = {
      lines = {
        { id = "fl_why_default", text = "Because ye've the kind o' smile that gets a body past a cellar door wi'out a word said, an' that's the honest truth. The other truth is I'd no' mind lookin' at it a while longer meself." },
        { id = "fl_why_dwarf", when = { race = "Dwarf" },
          text = "Because o' that beard, if I'm honest, braided proper an' combed besides, an' a Barleybrew lass notices a beard. I'd no' mind lookin' at it a good while longer, an' that's nothin' tae do wi' barrels." },
      },
      choices = {
        { text = "Then I'll stay a while longer. Pour the Scalder.", next = "fl_why2",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_sweet" } } } },
        { text = "Like the beard? Wait until you see it braided for a feast.", next = "fl_why2", when = { race = "Dwarf" },
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_sweet" } } } },
        { text = "I'm here for the prank, Marleth, not for courting.", next = "BACK",
          reply = "Ha! Fair enough, an' a Barleybrew can take no for an answer, so long as the barrel still gets swapped.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "fl_no" } } } },
        { text = "I'd sooner court a Thunderbrew, Marleth.", next = "BACK",
          reply = "Ach, that's a low blow, {g:lad|lass}, an' I'll be thinkin' o' a reply tae it for a week.",
          fx = { trait = { witty = 1 }, npcFlag = { set = { "fl_no" } } } },
      },
    },
    fl_why2 = {
      lines = {
        { id = "fl_why2_default", text = "Ha! Ye're a bold one, an' I like a bold one. Mind, if my da ever hears I'm sweet on somebody who's drunk Thunder Ale, he'll write me out o' the family recipe, so we'll keep this between us an' the barrels." },
      },
      choices = {
        { text = "Between us and the barrels, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    feud = {
      lines = { { id = "fe_default", text = "Because the Thunderbrews think they own beer, that's why. Every caravan out o' Ironforge carries their name on the casks, an' every traveller in Kharanos drinks at their distillery, an' nobody ever stops at Brewnall to see what real brewin' tastes like." } },
      choices = {
        { text = "Has it always been this bad?", next = "feud_old" },
        { text = "Something else, Marleth.", next = "BACK" },
      },
    },
    feud_old = {
      lines = { { id = "fo_default", text = "My grandda an' old Ragnar's grandda once fought a duel over a hop field, an' they were both so drunk they missed with every swing an' fell asleep in the field. The families have been arguin' over who won ever since." } },
      choices = {
        { text = "Ha. I'd wager they both lost.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scalder = {
      lines = { { id = "sc_default", text = "Barley, highland water, a bit o' honey an' a secret I'll take to my grave, an' it goes down hot an' sweet an' leaves ye warm to the toes. One taste an' nobody in that distillery will want Thunder Ale again, mark me." } },
      choices = {
        { text = "So the prank is really an advertisement.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    prank = {
      big = true,
      lines = { { id = "pr_default", text = "Low? It's a free sample, that's all, an' nobody gets hurt, the drinkers get a better beer than they paid for, an' the Thunderbrews get taken down a peg. Mind, Jarven down in the cellar might get a talkin' to for lettin' it happen." } },
      choices = {
        { text = "Then Jarven gets punished for your joke. That's not right.", next = "BACK", reply = "Och, ye've a conscience on ye, and I'll grant ye've a point, so if Ragnar starts shoutin' I'll put in a word for Jarven, quietly, where nobody hears it.", fx = { align = { honor = 1 } } },
        { text = "A good prank always costs somebody. Jarven will live.", next = "BACK", reply = "Ha, now there's a dwarf after my own heart, whatever yer beard says, and Jarven's had worse scoldings for less, believe me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    clan = {
      lines = { { id = "cl_default", text = "Ach, I knew it the moment ye walked in, ye've got that Thunderbrew squint. Never mind, {g:lad|lass}, one mug o' Scalder an' yer clan can change its mind, an' I'll not tell them it was me that turned ye." } },
      choices = {
        { text = "One mug, then. For science.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "My clan's loyal. We'll stay with Thunderbrew.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    brewnall = {
      lines = { { id = "br_default", text = "A wee village o' brewers up the road, where the Barleybrews have been brewin' since before the Thunderbrews learned to spell. My cousin Rejold's there too, chasin' a daft notion o' the perfect stout brewed wi' a weed the Frostmane trolls grow." } },
      choices = {
        { text = "A weed from the trolls? That sounds like trouble.", next = "BACK", fx = { learn = { "frostmane" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, an' I'd wager the Thunderbrews haven't either." } },
  },
}

---------------------------------------------------------------------------
-- Jarven Thunderbrew
---------------------------------------------------------------------------
P:NPC {
  key = "dm_jarven", id = TODO_NPC("Jarven Thunderbrew"), name = "Jarven Thunderbrew",
  bible = "bibles/kharanos_brewers.md", role = "questgiver", tier = "quest",
  communities = { "kharanos" }, temper = { "grumpy", "dutiful" }, values = { "family", "duty" },
  notices = { "drunk", "race", "class" },

  impression = {
    first = "Guarding ale he may not touch has not improved his temper.",
    third = "{name} met Jarven Thunderbrew, who guards the cellar of the Thunderbrew Distillery and is not allowed to drink any of it.",
  },

  greetings = {
    { id = "g_default", text = "Hmph. Who let ye down here? This cellar's family only, an' I don't recall ye bein' family." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Ye've not got a mug on ye, have ye? No? Then what good are ye?" },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ye move too quiet for my likin', an' I've barrels tae think of. Keep yer hands where I can see them." },
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye've been drinkin'. I can smell it from here, an' I'm jealous, an' I want ye to know I'm jealous." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, at least. Ye'll understand the cruelty o' guardin' a cellar ye can't drink from." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jarven Thunderbrew, guardian o' the family cellar. There's all this booze down here an' I've strict orders not to touch it, so I stand here all day smellin' it like a dog at a butcher's window." },
        { id = "h_distract", tags = { "news" }, when = { questActive = TODO_QUEST("Bitter Rivals") },
          text = "If only I could get a taste o' some Thunder Ale, that would sharpen my wits, no lyin'. Ye wouldn't happen to have a mug o' the stuff, would ye, an' be feelin' generous?" },
        { id = "h_drank", tags = { "news" }, when = { questDone = TODO_QUEST("Distracting Jarven") },
          text = "That Thunder Ale ye brought me was the best thing that's happened in this cellar all year. Though somethin' tastes off in barrel nine since, an' I can't think what." },
        { id = "h_found", when = { questDone = TODO_QUEST("Return to Marleth") },
          text = "Somebody swapped a barrel on my watch, an' Ragnar's not spoken to me since. If I ever find out who did it, they'll be cleanin' these vats with their beard." },
      },
      again = {
        { id = "h_again3", text = "Ye're still here, an' I'm still dry. Ask yer question an' let me get back tae my countin'." },
        { id = "h_again", text = "What else? An' make it quick, I'm on watch." },
        { id = "h_again2", text = "Go on, then, I've nothin' else to do but stand here an' suffer." },
      },
      choices = {
        { text = "Why can't you drink any of it?", next = "orders" },
        { text = "What's down here worth guarding?", next = "barrels" },
        { text = "What do you think of the Barleybrews?", next = "barleybrews" },
        { text = "Here, have a Thunder Ale on me.", next = "BUSINESS", when = { questActive = TODO_QUEST("Distracting Jarven") } },
        { text = "Do the Thunderbrews ever bless their vats?", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "It's a long watch down here.", next = "watch" },
        { text = "A dwarf who can't drink has my sympathy.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    orders = {
      lines = { { id = "or_default", text = "Ragnar's orders. Last spring I had one wee taste from each barrel to make sure they'd come along proper, an' by the time I'd finished the row I'd sung the whole o' the Ballad o' Khaz Modan to the rats. Ragnar says that's not what a guard's for." } },
      choices = {
        { text = "Ragnar has a point.", next = "orders_point" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_point = {
      big = true,
      lines = { { id = "op_default", text = "Aye, he does, an' I hate it. But what's a family business if ye can't sample the family product? I've half a mind to sneak a mug when nobody's lookin', an' the other half o' my mind keeps tellin' on me." } },
      choices = {
        { text = "Orders are orders, Jarven. Keep your hands off the barrels.", next = "BACK", reply = "Aye, aye, I know it, an' ye sound just like Ragnar, which is no compliment, but I'll keep my hands in my pockets till ye're gone at least.", fx = { align = { order = 1 } } },
        { text = "One mug won't hurt. Ragnar will never know.", next = "BACK", reply = "Ye're a terrible influence, an' I like ye for it, but Ragnar knows every drop in these barrels by heart, an' I'd sooner face the troggs than his ledger.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    barrels = {
      lines = { { id = "ba_default", text = "Thunder Ale, mostly, the finest drink in Khaz Modan, an' a few casks o' the special for the King's table in Ironforge. If anyone so much as breathes on those, it's my beard, so I count them every hour." } },
      choices = {
        { text = "Then I'll keep my breath off them.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    barleybrews = {
      lines = { { id = "bb_default", text = "Sour folk with sour beer, an' they've been jealous o' this family for three generations. Marleth Barleybrew would sell her own beard to see us embarrassed, an' I keep an eye on that cellar door for that very reason." } },
      choices = {
        { text = "I'm sure she means no harm.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "Not if Ragnar can help it, for he says the Light has no business in a brewer's yeast. Still, I'd not turn ye away if ye said a wee word over barrel nine, for it's been tastin' strange lately." } },
      choices = {
        { text = "I'll say a word for barrel nine.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "wt_default", text = "From first light till the tavern shuts, an' the only company's the rats an' whatever noise comes down through the floor. I can tell ye who's singin' up there by the stamp o' their boots, an' Granis Swiftaxe's recruits stamp the loudest." } },
      choices = {
        { text = "What do you hear from upstairs?", next = "watch_hear" },
        { text = "Does anyone come down to see you?", next = "watch_visit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_hear = {
      lines = { { id = "wh_default", text = "Innkeeper Belm laughin' at his own jokes, mugs goin' down on the bar, an' every toast in Kharanos but none for me. Worst is when they tap a fresh keg, for I hear the bung go an' I know exactly which barrel it was." } },
      choices = { { text = "That is a hard thing to listen to.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    watch_visit = {
      lines = { { id = "wv_default", text = "Ragnar, tae count the barrels after I've counted them, an' the lad who brings my supper an' a mug o' water. Water, I ask ye, in a distillery!" } },
      choices = {
        { text = "Ragnar doesn't trust your counting?", next = "watch_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_count = {
      lines = { { id = "wc_default", text = "He trusts my countin' fine. It's my thirst he doesnae trust, an' I cannae say he's wrong, which is the worst o' it." } },
      choices = { { text = "At least you're honest about it.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Then ye're the first today tae offer any. Folk come down, look at the barrels, look at me, an' laugh, but a dwarf knows there's nothin' funny in it at all." } },
      choices = {
        { text = "I'll drink one for you upstairs.", next = "BACK", reply = "That's the cruellest kindness I've ever been offered, an' I'll take it. Make it a Thunder Ale.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    thunderbrew = { { id = "tp_thunder", text = "My family's name an' my family's ale, an' the best in Khaz Modan. I'd tell ye how it tastes this year, but I'm no' permitted tae know." } },
    ragnar = { { id = "tp_ragnar", text = "Ragnar runs the distillery an' he runs me. He's fair, I'll say that through my teeth." } },
    _none = { { id = "tp_none", text = "I don't know, an' I'm not allowed upstairs to find out." } },
  },
}

---------------------------------------------------------------------------
-- Rejold Barleybrew
---------------------------------------------------------------------------
P:NPC {
  key = "dm_rejold", id = TODO_NPC("Rejold Barleybrew"), name = "Rejold Barleybrew",
  bible = "bibles/kharanos_brewers.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "dreamy", "earnest" }, values = { "craft", "family" },
  notices = { "craft", "race" },

  impression = {
    first = "He chases the perfect stout, and his plan involves trolls.",
    third = "{name} met Rejold Barleybrew, a brewer of Brewnall Village who believes the perfect stout grows on Shimmer Ridge.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor! Have ye ever tasted a stout so good it made ye weep? No? Neither have I, but I mean to brew one." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I'm closer, I swear it. Taste this. No, wait, don't, it's not ready." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = { "Cooking", "Alchemy" } },
      text = "Ye've a nose for ingredients, I can tell by how ye sniffed my kettle. Come, come, smell this and tell me what's missin'." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll! Ye're not Frostmane, are ye? No, no, of course not, ye'd have stabbed me by now. But tell me, do yer folk ever brew with shimmerweed?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rejold Barleybrew, an' I'm on a quest to make the perfect stout. Brewin's in my blood, an' I know I can do it, but I need the right recipe, an' the right recipe needs a weed that only grows among trolls." },
        { id = "h_stout", tags = { "news" }, when = { questActive = TODO_QUEST("The Perfect Stout") },
          text = "The shimmerweed, have ye got it? The Frostmane keep it in baskets up on Shimmer Ridge for their rituals. Seven, I need, an' I'll pay well for every one ye can borrow." },
        { id = "h_stout_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Perfect Stout") },
          text = "The shimmerweed's in the kettle, an' it smells like nothin' I've ever brewed. It might be the perfect stout, or it might be poison, an' there's only one way to find out." },
        { id = "h_evershine", when = { questActive = TODO_QUEST("Evershine") },
          text = "Pilot Bellowfiz wants Evershine, does he? That gnome has good taste for a gnome. I'll see what I can do, but I'll need a favor first." },
        { id = "h_shimmer", when = { questActive = TODO_QUEST("Shimmer Stout") },
          text = "Take that cask o' Shimmer Stout up the road and mind ye don't drink it on the way, for it's the best thing I've ever made and I've only the one cask." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The kettle's bubblin', so I've a minute." },
        { id = "h_again2", text = "Ask away. Brewin's mostly waitin', an' waitin's better with company." },
      },
      choices = {
        { text = "What is the perfect stout?", next = "perfect" },
        { text = "Why shimmerweed?", next = "weed" },
        { text = "Stealing from the Frostmane? Isn't that dangerous?", next = "steal" },
        { text = "How do you get on with Marleth?", next = "marleth" },
        { text = "I know herbs. Let me smell the kettle.", next = "kettle", when = { profession = { "Herbalism", "Alchemy", "Cooking" } } },
        { text = "Why does a Barleybrew care so much about beating Thunderbrew?", next = "dw_rival" },
        { text = "Where does a Kharanos brewer get his barley?", next = "d0_barley" },
        { text = "Kharanos seems a hard town for a brewer.", next = "d0_town" },
        { text = "Good luck with the stout.", next = "END" },
      },
    },
    d0_barley = {
      lines = { { id = "d0ba_default", text = "No' from here, that's certain, for nothin' grows in Dun Morogh but pine an' grudges. It comes up by wagon from the Loch Modan farms through the South Gate, an' when the troggs are out on the road I pay double for half a sack." } },
      choices = {
        { text = "Is the road that bad?", next = "d0_barley_road" },
        { text = "My grandfather swore barley tastes of the land it grew in.", next = "BACK", when = { race = "Dwarf" }, reply = "Then Loch Modan barley tastes o' rain an' sheep, an' I've made my peace wi' it. Yer grandfather kent his malt." },
        { text = "A dear grain makes for a dear stout.", next = "BACK" },
      },
    },
    d0_barley_road = {
      lines = { { id = "d0br_default", text = "Worse every month. Mountaineer Kadrell keeps the far end safe at Thelsamar, but between the South Gate an' Kharanos there's only the odd patrol, an' my last wagon came in wi' a trogg's tooth stuck in the axle." } },
      choices = {
        { text = "I'll keep an eye out for your wagons.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Rejold.", next = "BACK" },
      },
    },
    d0_town = {
      lines = { { id = "d0to_default", text = "Hard? It's the finest brewin' town in Khaz Modan, an' that's the trouble, for every dwarf here has an opinion on stout an' the Thunderbrews have the loudest. Still, the mountaineers come in off the road thirsty, an' a thirsty dwarf isnae fussy whose tap he drinks from." } },
      choices = {
        { text = "Who drinks your stout, then?", next = "d0_town_drink" },
        { text = "My own clan swears by Thunderbrew lager.", next = "d0_town_lager", when = { race = "Dwarf" } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d0_town_drink = {
      lines = { { id = "d0td_default", text = "Old Kogan Forgestone, who'll drink anythin' if ye let him talk while he does it, an' Tognus Flintfire, who says my dark is the only thing that cuts forge smoke. That's two customers an' a half, an' the half is Belm, who tastes mine an' then buys Ragnar's." } },
      choices = {
        { text = "Two and a half loyal drinkers is a start.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_town_lager = {
      lines = { { id = "d0tl_default", text = "Aye, most clans do, an' I'll no' fight ye over it in my own cellar. Lager's a fine drink for washin' dust down, but a stout is a meal an' a conversation, an' one day yer clan will taste the difference." } },
      choices = { { text = "Maybe they will. Something else.", next = "BACK" } },
    },

    perfect = {
      lines = { { id = "pe_default", text = "Dark as a mine shaft, smooth as a polished anvil, an' with a taste at the back that ye can't quite name, so ye have to keep drinkin' to work it out. My da said it couldn't be done, an' I mean to prove him wrong over his grave with a mug in my hand." } },
      choices = {
        { text = "Your father didn't believe in you?", next = "father" },
        { text = "Something else, Rejold.", next = "BACK" },
      },
    },
    father = {
      lines = { { id = "fa_default", text = "He believed in barley, water an' doin' things the way they'd always been done. He'd have thrown my kettle in the snow for puttin' a troll weed in it, an' maybe he'd be right, but I'll never know unless I try." } },
      choices = {
        { text = "Then try. He'd be proud of the effort.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    weed = {
      lines = { { id = "we_default", text = "It has a taste like nothin' else in these mountains, sharp an' green an' a wee bit like a winter mornin'. The Frostmane use it in their rituals an' we've never found a use for it at all, which seems like a terrible waste to me." } },
      choices = {
        { text = "The trolls might not agree.", next = "steal" },
        { text = "Something else.", next = "BACK" },
      },
    },

    steal = {
      big = true,
      lines = { { id = "st_default", text = "Dangerous, aye, so I'd not go myself, an' that's why I'm askin' ye. I'd buy it off them if they'd trade, but the Frostmane would sooner put a spear in a dwarf than sell him anythin', so borrowin' it from their baskets is the only way." } },
      choices = {
        { text = "They're trolls. Take what you need from them.", next = "BACK", reply = "That's the spirit, an' the Frostmane would do the same tae us without blinkin', so fetch me a basketful an' I'll name the first barrel after ye.", fx = { align = { light = -1 }, learn = { "frostmane" } } },
        { text = "It's their sacred plant. Stealing it is wrong.", next = "BACK", reply = "Och, I hadnae thought o' it like that, an' now I'll feel guilty every sip, though I'm no' sure I'll feel guilty enough tae give up the stout.", fx = { align = { light = 1 }, learn = { "frostmane" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kettle = {
      lines = { { id = "ke_default", text = "Go on, then, an' tell me true. Too much malt, I think, or not enough bitter to hold it up, an' my nose has been in that kettle so long it's stopped tellin' me anythin' useful." } },
      choices = {
        { text = "Not enough bitter. Try a little more shimmerweed.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "It smells perfect already. Stop fussing.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    marleth = {
      lines = { { id = "ma_default", text = "My cousin? She's spent her whole life tryin' to beat the Thunderbrews, an' I've spent mine tryin' to beat the stout, an' neither of us has managed it. Don't tell her I said so, but I think she'd rather win the feud than brew a good beer." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dw_rival = {
      lines = {
        { id = "dwrv_default", text = "Because they've the big hall an' the King's custom an' the name every dwarf knows, an' we've a cellar, a kettle an' better taste. My father swore a Barleybrew would pour the best stout in Khaz Modan before his beard went white, an' his beard went white, so it's my oath now." },
        { id = "dwrv_brewer", when = { origin = "dwarf_brewer" }, text = "Ye're a brewer's child yerself, so ye'll understand: they've the big hall an' the King's custom, an' we've a cellar, a kettle an' better taste. My father swore we'd pour the best stout in Khaz Modan before his beard went white, an' it went white, so the oath's mine now." },
      },
      choices = {
        { text = "An oath's an oath. Brew until you win.", next = "BACK", reply = "That's what I tell myself every mornin', an' then I taste yesterday's batch an' tell myself again. Thank ye, friend, I needed hearin' it from somebody else.", fx = { align = { honor = 1 } } },
        { text = "Your father's oath shouldn't cost you your life's joy.", next = "BACK", reply = "Joy? Brewin' is the joy, friend, it's the losin' I could do without. Still, there's sense in that, an' my wife would kiss ye for sayin' it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Rejold.", next = "BACK" },
      },
    },
  },

  topics = {
    frostmane = { { id = "tp_frostmane", text = "Nasty folk with good taste in weeds. Up on Shimmer Ridge, an' ye'll hear their drums before ye see them." } },
    _none = { { id = "tp_none", text = "Couldn't say. Is it somethin' ye can brew with?" } },
  },
}

---------------------------------------------------------------------------
-- Ozzie Togglevolt
---------------------------------------------------------------------------
P:NPC {
  key = "dm_ozzie", id = TODO_NPC("Ozzie Togglevolt"), name = "Ozzie Togglevolt",
  bible = "bibles/kharanos_brewers.md", role = "questgiver", tier = "quest",
  communities = { "kharanos" }, temper = { "distracted", "hopeful" }, values = { "invention", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "He came out of a gearbox with grease to the eyebrows.",
    third = "{name} met Ozzie Togglevolt in Kharanos, the gnome inventor working with Razzle Sprysprocket on a cure for Gnomeregan's sickness.",
  },

  greetings = {
    { id = "g_default", text = "Hold that thought, hold it, I've nearly got this coupling seated. There! Now, what can I do for you, and please don't touch anything glowing." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you! Good, good, I've had three new ideas since you were here, and two of them haven't exploded yet." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Were you in the city when it happened? No, don't tell me, everybody was somewhere, and everybody has a story, and I can't hear them all and still work." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Razzle says we shouldn't need a priest for science, but I say a little extra help never hurt a cure, so you're welcome here." },
  },

  start = "hello",
  nodes = {
    dd_oz_leper = {
      lines = {
        { id = "dd_oz_leper1", text = "I know, and I know you had to, because they're past reasoning with while the sickness is in them. That's exactly why Razzle and I work through the night on the Recombobulator, so one day nobody will have to choose between their own skin and a sick neighbour's." },
      },
      choices = {
        { text = "I'll help with the cure, then, not just the killing.", next = "BACK", reply = "Oh, wonderful! Every helper raises our odds by at least four percent, and I've done the sums.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're past saving. Mercy is a quick blade.", next = "BACK", reply = "I hope you're wrong. I'll keep working as if you are, if that's all right with you.", fx = { align = { light = -1 } } },
        { text = "Something else, Ozzie.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ozzie Togglevolt, inventor, and that's my partner Razzle muttering at the Recombobulator. We're working on a cure for the sickness that took Gnomeregan, or possibly the recipe for a very powerful rum, and we won't know which until we test it." },
        { id = "h_dayafter", tags = { "news" }, when = { questActive = TODO_QUEST("The Day After") },
          text = "Gnoarn sent you? Bless that old tinker's bald head. He'll tell you he had a magnificent gnomefro before the radiation, and I'm not saying he's lying, but I've never seen a drawing." },
        { id = "h_gnogaine", tags = { "news" }, when = { questActive = TODO_QUEST("Gnogaine") },
          text = "The phial, you have the phial? Hold it up to the irradiated troggs in Gnomeregan and let it fill with their green fallout. Don't drink it, don't sniff it, and don't let it touch your skin, though that last part's more of a suggestion." },
        { id = "h_gnogaine_done", tags = { "news" }, when = { questDone = TODO_QUEST("Gnogaine") },
          text = "The Gnogaine works! Well, it works on the fallout, it turns bright purple, which is either very good or very bad, and I'm leaning towards good." },
        { id = "h_glow", when = { questActive = TODO_QUEST("The Only Cure is More Green Glow") },
          text = "Yes, more fallout, I know, I know. The only cure is more green glow, which Razzle says is a terrible slogan, but I've had it painted on the shed anyway." },
        { id = "dd_leper", when = { killed = { name = "Leper Gnome", min = 30 } },
          text = "You've been fighting the leper gnomes outside Gnomeregan, I can tell; you've got that greenish sort of grime on your boots. I don't blame you, they'll bite, but please remember they were gnomes like me once, and they still might be again." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I tighten, I can do both." },
        { id = "h_again2", text = "Ask, ask, the gearbox can wait. No, it can't. Ask anyway." },
      },
      choices = {
        { text = "I've had to kill a lot of leper gnomes, Ozzie.", next = "dd_oz_leper", when = { killed = { name = "Leper Gnome", min = 30 } } },
        { text = "What exactly is Gnogaine?", next = "gnogaine" },
        { text = "What happened in Gnomeregan?", next = "gnomeregan" },
        { text = "How do you and Razzle work together?", next = "razzle" },
        { text = "Can the leper gnomes really be cured?", next = "cure" },
        { text = "I lost my workshop in the city too.", next = "workshop", when = { race = "Gnome" } },
        { text = "Could magic scrub the radiation instead?", next = "magic", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "I'll let you get back to work.", next = "END" },
      },
    },

    gnogaine = {
      lines = { { id = "gn_default", text = "A compound of my own design that soaks up radiation the way a sponge soaks up gravy. Pour it on the fallout and the fallout gets quieter, and if we can get enough of it into the city, the city gets quieter too." } },
      choices = {
        { text = "And the gnomes still inside?", next = "cure" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnomeregan = {
      lines = { { id = "gr_default", text = "The troggs came up from below, and the High Tinker flooded the city with radiation to drive them out, and it worked on the troggs for about a week. It worked on us a good deal longer, and most of the people who stayed behind are leper gnomes now." } },
      choices = {
        { text = "Was the High Tinker wrong to do it?", next = "mekkatorque" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mekkatorque = {
      big = true,
      lines = { { id = "mk_default", text = "Razzle thinks the plan was sound and the radiation simply got away from us, and I won't hear a word against the High Tinker myself. But some nights I wonder what would have happened if we'd just packed up and left the troggs to it." } },
      choices = {
        { text = "He did what he had to. Gnomeregan was worth fighting for.", next = "BACK", reply = "That's what I say, every single day, and the High Tinker would be glad to hear it, though I think he says it to himself more than anyone.", fx = { align = { order = 1 }, learn = { "gnomeregan" } } },
        { text = "He gambled with everyone's lives. That was wrong.", next = "BACK", reply = "Please don't say that too loudly in Kharanos, because some nights, alone with this gearbox, I'm afraid you might be right.", fx = { align = { order = -1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    workshop = {
      lines = { { id = "ws_default", text = "Everybody did, everybody. Mine had a window that looked onto the great lift, and I used to time my lunch by it. When we go back, and we will go back, you can have the one next door, and we'll complain about each other's noise like proper neighbors." } },
      choices = {
        { text = "I'd like that, Ozzie.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'm not sure I'll ever go back.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    magic = {
      lines = { { id = "mg_default", text = "Razzle asked a mage from the Mystic Ward once, and the mage cast something very impressive and the fallout turned blue for an hour and then went back to green. So I'm sticking with chemistry, but you're welcome to try, as long as you do it well away from my shed." } },
      choices = {
        { text = "Chemistry it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    razzle = {
      lines = { { id = "ra_default", text = "Razzle has the ideas and I make them work, mostly, or I have the ideas and Razzle tells me why they won't work, and then I make them work anyway. We once turned a turnip into a slightly different turnip, and we're still arguing about whose idea that was." } },
      choices = {
        { text = "That sounds like a good partnership.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cure = {
      lines = { { id = "cu_default", text = "I have to believe so, or I'd have to stop, and I don't know how to stop. Every leper gnome down there was somebody's neighbor, and some of them were mine, and one of them still owes me a spanner." } },
      choices = {
        { text = "Then I'll help however I can.", next = "BACK", fx = { affinity = 2, learn = { "gnomeregan", "troggs" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Home. It'll be home again, once we've scrubbed it clean, and I've already picked out which workshop I want." } },
    _none = { { id = "tp_none", text = "No idea! But give me a week and a spare gearbox and I'll find out." } },
  },
}

---------------------------------------------------------------------------
-- Shelby Stoneflint, stable master
---------------------------------------------------------------------------
P:NPC {
  key = "dm_shelby", id = TODO_NPC("Shelby Stoneflint"), name = "Shelby Stoneflint",
  title = "Stable Master",
  bible = "bibles/kharanos_brewers.md", role = "stablemaster", tier = "service",
  communities = { "kharanos" }, temper = { "warm", "brisk" }, values = { "beasts", "practical" },
  notices = { "pet" },

  impression = {
    first = "A bear cub sleeps on her boots while she talks.",
    third = "{name} met Shelby Stoneflint, the stable master of Kharanos.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! Yer beast's stall is clean an' the straw's fresh, for I like a rider who looks after their animal." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Yer beast can stay, for it's done nothin' wrong. Ye, on the other hand, can mind yer manners in my stables." },
    { id = "g_default", text = "Mind the cub, he's sleepin', an' mind the ram, he's not. What can I do for ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Yer beast'll be glad o' the straw, I'd wager." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet}'s got snow packed between the toes, poor thing. Bring them in by the brazier an' I'll pick it out for ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shelby Stoneflint, stable master o' Kharanos. I keep hunters' beasts warm an' fed while their masters go off an' get themselves bitten, an' I've never yet lost a beast to the cold." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, an' with a beast at yer heel. Leave it with me whenever ye need, for the snow's hard on paws an' I've a warm stall an' a bucket o' boar scraps." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The ram wants his supper." },
        { id = "h_again2", text = "Go on, I can talk an' muck out at the same time." },
      },
      choices = {
        { text = "I need to stable a beast.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Whose bear cub is that?", next = "cub" },
        { text = "What's the hardest beast you've kept?", next = "hardest" },
        { text = "That ram's been eyeing my pockets since I walked in.", next = "ram" },
        { text = "How do you keep beasts alive through a Dun Morogh winter?", next = "winter" },
        { text = "Did my cat give you trouble too?", next = "elf", when = { race = "NightElf" } },
        { text = "Would you stable a mechanostrider?", next = "strider", when = { race = "Gnome" } },
        { text = "Which beast should a new hunter tame here?", next = "tame", when = { class = "HUNTER" } },
        { text = "I'll be going.", next = "END" },
      },
    },

    ram = {
      lines = { { id = "ra_default", text = "Aye, he would, he can smell an apple through two layers o' leather. He's one o' Veron Amberstill's rams from the ranch down the road, here to be shod, an' he's decided my stable's a better class o' lodging than his own." } },
      choices = {
        { text = "Tell me about the Amberstill ranch.", next = "ra_ranch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ra_ranch = {
      lines = { { id = "rar_default", text = "Veron raises the finest rams in Dun Morogh, the kind the Mountaineers ride an' the kind every young dwarf dreams o' owning. They're nae cheap, mind, an' he'll nae sell one to just anybody, but once ye've ridden a ram ye'll never want a horse." } },
      choices = {
        { text = "Why won't he sell to just anybody?", next = "ra_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ra_sell = {
      lines = { { id = "ras_default", text = "Because a ram's a dwarf's beast, an' Veron thinks it takes a dwarf, or a friend o' the dwarves, to understand one. Some call that stubborn an' some call it proper, an' Veron calls it his business." } },
      choices = {
        { text = "Good beasts should go to whoever can pay.", next = "BACK", fx = { align = { order = -1 } },
          reply = "Ye'd get on wi' the goblins, then. Veron wouldnae." },
        { text = "He's right. A beast should go to those who honor it.", next = "BACK", fx = { align = { order = 1 } },
          reply = "Spoken like a proper mountain folk. I'll tell Veron ye said so." },
        { text = "Something else.", next = "BACK" },
      },
    },

    winter = {
      lines = { { id = "wi_default", text = "Straw a foot deep, a brazier that never goes out, an' a warm mash o' oats an' boar fat every night. The cold's nae the worst of it, though; it's the ice between the toes an' the wolves that come down from the ridge when the snow's deep." } },
      choices = {
        { text = "Wolves come down this far?", next = "wi_wolves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wi_wolves = {
      lines = { { id = "wiw_default", text = "In a hard winter, aye, an' the Frostmane trolls behind them sometimes, sniffin' about for anything they can carry off. I keep a hammer by the door an' the cub's mother's growl in my memory, an' between the two o' them I've nae lost a beast yet." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "frostmane" } } } },
    },

    elf = {
      lines = { { id = "el_default", text = "Not yet, but give it time! Your folk's cats are lovely beasts that hate snow wi' the whole o' their hearts. Leave yours by the brazier an' keep yer blankets well away from it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    strider = {
      lines = { { id = "st_default", text = "I'd stable it, but I wouldnae know what to feed it! Ozzie Togglevolt says they drink oil an' complain in clicks, an' I've enough complainin' wi' the ram. Take it to a gnome, love, I'll keep to the beasts that breathe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tame = {
      lines = { { id = "ta_default", text = "A bear, if ye've the patience, for they're steady an' they don't mind the cold. A boar's a good fighter but thick as a door, an' a snow leopard's lovely if ye can find one that'll let ye near. Whatever ye pick, bring it here first an' let me have a look at its paws." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cub = {
      big = true,
      lines = { { id = "cu_default", text = "Nobody's, now. A hunter tamed his mother up by the Grizzled Den an' left the wee one behind, so I took him in. Some say I should let him go back to the wild before he gets too big, an' some say a bear raised by a dwarf would make a fine guard for the stables." } },
      choices = {
        { text = "Let him go back to the wild where he belongs.", next = "BACK", reply = "Aye, ye're probably right, an' I'll take him up tae the Grizzled Den when he's bigger, though I'll miss him snorin' on my boots somethin' terrible.", fx = { align = { order = -1 } } },
        { text = "Train him. He'll make a fine stable guard.", next = "BACK", reply = "That's what I've been thinkin', an' he's already growlin' at the rams, so with a wee bit o' trainin' he'll be the finest guard in Dun Morogh.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hardest = {
      lines = { { id = "ha_default", text = "A night elf's nightsaber, come all the way from Teldrassil, an' it would not stop yowlin' at the snow. I wrapped it in a blanket an' it ate the blanket, an' then it slept on top o' the brazier till its owner came back." } },
      choices = {
        { text = "Cats and snow don't mix.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldn't tell ye. Ask Innkeeper Belm at the Thunderbrew, for he hears everythin'." } },
    knows = { { id = "tp_knows", text = "Beasts, straw, an' how to keep paws warm in the snow." } },
    advice = { { id = "tp_ad", text = "Check yer beast's paws every night. Ice cuts worse than any wolf." } },
    frostmane = { { id = "tp_frostmane", text = "Thievin' trolls. They follow the wolves down in a hard winter, an' I keep a hammer by the door." } },
  },
}
