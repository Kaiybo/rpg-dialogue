-- Antonio Perelli, the traveling salesman of Elwynn's roads. Voice: bibles/road_peddler.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "perelli", id = TODO_NPC("Antonio Perelli"), name = "Antonio Perelli", title = "Traveling Salesman",
  bible = "bibles/road_peddler.md", role = "vendor", tier = "service",
  communities = {}, temper = { "cheerful" }, values = { "practical", "freedom" },
  impression = {
    first = "Antonio Perelli sells odds and ends from a pack on his back and talks the whole time he does it. He seems to know every road in Elwynn and every danger on it.",
    third = "{name} met Antonio Perelli, a talkative peddler who walks Elwynn's roads.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a customer on the open road! Come, come, I carry a little of everything." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again! The road is long, but it keeps bringing me back to good customers." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I've seen gnolls, kobolds, bandits, and a murloc that stole my boot. Your spirits might warn you, but I'll do it cheaper." } },
      choices = {
        { text = "A wise traveller listens. Tell me everything, Antonio.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll find the dangers myself. That's adventure.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The wolves follow me some evenings, and I throw them a strip of jerky to keep them friendly, which is probably bad for business. The bears I give a wide berth, because no amount of jerky has ever made a bear friendly." } },
      choices = {
        { text = "Don't feed wild wolves. It makes them bold with others.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep it up. A friendly wolf beats a hungry one.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It came from a dwarf, and the dwarf came from Ironforge, and that's close enough for a traveling man. It sharpens, which is what matters, and I'll not charge you Ironforge prices for it." } },
      choices = {
        { text = "I'll take it, and I'll take your word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take it, but I'll not believe a word.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only the once, and the man said it was a coincidence, so I've decided to believe him. Hunters like a story with their goods, and that's the best one I've got this week." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} perked its ears at the call! Either it knows the tune, or it's as alarmed as I was." },
      },
      choices = {
        { text = "I'll hunt without tricks, thank you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A call that brings wolves? I'll take two.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A fellow in Darkshire sold it to me for a pair of boots, and he seemed very glad to be rid of it, which I'll admit was a bad sign. I've carried it since, and it hasn't done anything strange yet, except the humming." } },
      choices = {
        { text = "Best to leave a strange crystal alone, Antonio.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A humming crystal is worth studying. I'll take a closer look.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Afraid's a strong word, but I've never sold anything to a demon, and I've no wish to start, because I don't know what they pay in. I'll stick to customers with honest coins, if you don't mind." } },
      choices = {
        { text = "My demon will stay back. You'll deal only with me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Demons pay in power, Antonio. You'd be surprised.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Fair, fair, what's fair on a road this long, friend? I'll admit I've sold a loaf to a Westfall widow for a copper and charged the next gentleman three, and I sleep well enough, so heaven must be happy with the average." } },
      choices = {
        { text = "A fair price is the same price for everyone, Antonio.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Charge what each can pay. That's sense, not sin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe enough if you smile at everyone and carry nothing worth stealing, which is a hard trick for a salesman. The Defias let me pass since I sold one of them a fine pair of boots, and I'll not apologize for it, because a man must eat." } },
      choices = {
        { text = "Selling to the Defias aids them, Antonio. It must stop.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A man must eat. I won't judge you for it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Antonio.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest on my road! I've a holy candle from the Cathedral, or one that looks very much like it, if you're interested." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've a holy symbol here, blessed by a priest, or so the priest told me, and he seemed very honest." },
        { id = "h_default", text = "Antonio Perelli, traveling salesman, at your service. Goldshire to Eastvale and back again, and I sell whatever I carry to whoever stops to look." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Hm, you've quick hands, friend, so let's keep them where I can see them while you browse, eh? No offense meant." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll want something rare, I can tell. I've a crystal from Duskwood that hums in the dark, though I'm not sure it's meant to." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock on my road, and with something at your heel, I see. I'll sell you anything you like, but I'd ask you to keep it out of my packs." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on the road! I've a whetstone from Ironforge, or near enough, and it'll put an edge on anything." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter on my road! I've a call for luring deer, carved by a man in Duskwood, though he swore it calls wolves too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf on the Eastvale road! I sell to everyone who stops, so stop, and I'll show you things you won't find in any forest." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've odds and ends in my pack, and I know every danger on every road. Want to hear about them?" },
      },
      again = {
        { id = "h_again", text = "What else? My feet need the rest anyway." },
        { id = "h_again2", text = "Ask away, ask away. Talking's free, even if the goods aren't." },
      },
      choices = {
        { text = "Let's see what you carry.", next = "BUSINESS" },
        { text = "Isn't the road dangerous alone?", next = "danger" },
        { text = "Why not keep a shop in town?", next = "shop" },
        { text = "Where did a crystal from Duskwood come from?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Are you afraid of my demon, Antonio?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is your whetstone really from Ironforge, Perelli?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does your deer call really bring the wolves?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you sell to the needy at a fair price, Antonio?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the road between Goldshire and Eastvale safe, Antonio?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the beasts on the road trouble you, travelling alone?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What dangers have you seen on the roads, Antonio?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Safe travels.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Dangerous? Gnolls in the hills, Defias by the Jasperlode Mine, and murlocs if you wander near the lake. I walk fast and I smile at everyone, and so far that's kept me alive." } },
      choices = {
        { text = "You should hire a guard.", next = "danger_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_guard = {
      lines = { { id = "dg_default", text = "With what, my good looks? A guard costs more than I make, and the marshals have their hands full already. I trust the Light and my legs." } },
      choices = {
        { text = "The marshals should patrol the roads properly.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A man's safety is his own business.", next = "BACK", fx = { align = { order = -1 }, trait = { independent = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = { { id = "s_default", text = "A shop sits still, and customers have to come to it. I'd rather go to them, and besides, Farley would charge me rent for a corner of his inn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've walked these roads since before the walls of Stormwind were rebuilt, and I'll walk them after." } },
    defias = { { id = "tp_defias", text = "They robbed me once and left me my boots. I've decided to call that manners." } },
    _none = { { id = "tp_none", text = "Can't say I know it, and believe me, a man on this road hears a great deal." } },
  },
}
