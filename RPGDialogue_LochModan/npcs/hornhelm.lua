-- Jern Hornhelm: the Explorers' League's man in Thelsamar. Voice: bibles/hornhelm.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lm_jern", id = TODO_NPC("Jern Hornhelm"), name = "Jern Hornhelm",
  bible = "bibles/hornhelm.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "steady", "sharp" }, values = { "dutiful", "practical", "loyal" },
  notices = { "kit", "race" },

  impression = {
    first = "Jern Hornhelm keeps the Explorers' League's books in Thelsamar and counts every barrel of blastpowder that leaves town. He worries about Ironband the way a good clerk worries about a column that won't add up.",
    third = "{name} met Jern Hornhelm, the Explorers' League's contact in Thelsamar, who sends reports north and powder south.",
  },

  greetings = {
    { id = "g_default", text = "Jern Hornhelm, Explorers' League. If ye've come from the dig, I'll want tae hear about it before ye've sat down." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Sit, sit, an' mind the ledgers, for they're in an order only I understand." },
    { id = "g_away", when = { away = 14 }, text = "There ye are, after {away} away! The League's sent three letters since ye left, an' none o' them pleasant." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at ye now! Ye've the look o' someone who could carry a barrel o' powder tae Ironband an' a trogg under the other arm." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Thelsamar's been sayin' kind things about ye, an' I've written some o' them down. Good deeds belong in a ledger as much as debts." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody in town's sore at ye, I hear. Mend it if ye can, for this is a small place an' I've tae work in it." },
    { id = "g_report", when = { questActive = TODO_QUEST("Report to Ironforge") }, text = "Still here? The report goes tae Prospector Stormpike in Ironforge, an' remember tae duck when he reads it." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like the troggs at the dig had a go at ye, an' I'd put that in the report if I could. Get yer kit mended before ye go back out there." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf", origin = "dwarf_explorers_league" },
      text = "One o' the League's own, by the dust in yer beard! Good, for I've work that wants someone who knows what a trowel's for." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jern Hornhelm, an' I'm the Explorers' League in Thelsamar, or the bit o' it that holds the pen. Prospector Ironband's diggin' east o' the loch, an' everythin' he needs or says comes through this table." },
        { id = "h_progress", tags = { "news" }, when = { questActive = TODO_QUEST("Excavation Progress Report") },
          text = "Is that Ironband's report under yer arm? Give it here, then, for I've been waitin' on it near a fortnight." },
        { id = "h_progress_done", when = { questRecent = { TODO_QUEST("Excavation Progress Report"), days = 3 } },
          text = "Troggs at the dig, an' Ironband wantin' more powder. What puzzles me is that I sent him plenty weeks ago, an' I'd like tae know where it went." },
        { id = "h_powder", tags = { "news" }, when = { questActive = TODO_QUEST("Powder to Ironband") },
          text = "Ye've brought the League's answer back from Ironforge, have ye? Stormpike's approved more powder, I take it, an' only shouted a little." },
        { id = "h_resupply", when = { questActive = TODO_QUEST("Resupplying the Excavation") },
          text = "Huldar, Miran an' Saean left south wi' the barrels, followin' the curve o' the loch. They cannae have gone far wi' that load, so catch them up, will ye?" },
        { id = "h_ambush", tags = { "news" }, when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "I heard about Saean, an' I've not slept right since. Near a year he drew League wages from this very table, an' all that time he was sellin' us tae the Dark Irons." },
        { id = "h_fellhew", when = { questActive = TODO_QUEST("Ironband's Excavation") },
          text = "Round the south tip o' the loch an' then east, an' ask for Magmar Fellhew. He minds the details at the dig, so he'll know why it's slowed." },
        { id = "h_fellhew_done", when = { questDone = TODO_QUEST("Ironband's Excavation") },
          text = "Troggs, Fellhew says, an' he said it wi' two exclamation marks in the letter. I believe him, though I'd rather it had been bad weather." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, good! Ye'll understand why the League diggin' in this valley matters, even if the troggs don't." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! The League could use a clever head at the dig, for Ironband's machines break about as often as his temper does." },
        { id = "h_mage", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Don't touch the powder kegs, if ye please; I've had one apprentice too many who thought a wee spark would help." },
        { id = "h_rogue", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, eh? Then ye'll know how powder walks off a cart wi' nobody seein' it go, an' I'd like tae hear yer opinion." },
      },
      again = {
        { id = "h_again", text = "What else? I've a letter tae Ironforge half written, but it'll keep." },
        { id = "h_again2", text = "Go on, ask. Questions are cheaper than blastpowder." },
        { id = "h_again3", text = "Anythin' more, friend? Mind the inkpot, for I've knocked it over twice today an' half my map's gone blue." },
      },
      choices = {
        { text = "Tell me about Ironband's dig.", next = "dig" },
        { text = "Where has the blastpowder gone?", next = "powder" },
        { text = "Who is Prospector Stormpike?", next = "stormpike" },
        { text = "I've heard about Saean.", next = "saean", when = { questDone = TODO_QUEST("Protecting the Shipment") } },
        { text = "I dig for the League too, Jern.", next = "league_kin", when = { origin = "dwarf_explorers_league" } },
        { text = "Who'd steal powder from a cart?", next = "rogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Good day, Jern.", next = "END" },
      },
    },

    dig = {
      lines = {
        { id = "dg_default", text = "Ruins east o' the loch, older than Ironforge an' maybe older than that. Ironband's a stout, honest dwarf who values results, which is why it worries me that he's had so few o' late." },
      },
      choices = {
        { text = "What's he hoping to find?", next = "dig_find" },
        { text = "Results always come slowly on a dig, I'd imagine.", next = "dig_slow" },
        { text = "Something else, Jern.", next = "BACK" },
      },
    },
    dig_find = {
      lines = {
        { id = "df_default", text = "Where we came from, if ye want the League's answer, an' a good deal o' carved stone if ye want mine. The old stories say the mountain made us, an' every ruin in Khaz Modan might say how." },
      },
      choices = {
        { text = "Some old things are better left buried.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A people should know where they came from.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, learn = { "explorers_league" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig_slow = {
      lines = {
        { id = "ds_default", text = "Troggs, mostly, crawlin' up out o' the trench as if the diggin' rang a dinner bell. Magmar Fellhew minds the details out there, so if ye want it straight, ask him." },
      },
      choices = {
        { text = "And the rest of it?", next = "powder" },
        { text = "I'll ask Fellhew.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },

    powder = {
      big = true,
      lines = {
        { id = "pw_default", text = "That's the question that keeps me up wi' the lamp lit. I send barrels south, Ironband writes back that he's short, an' somewhere between this table an' his trench the powder simply walks away." },
        { id = "pw_after", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "We know now, or we know enough. Saean was passin' it tae the Dark Irons, an' I'd wager some o' it's packed against a wall I'd rather no' think about." },
      },
      choices = {
        { text = "Someone on that road must be handling the barrels.", next = "powder_who" },
        { text = "Count the barrels at both ends from now on.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Let the dig blow its own walls without powder.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_who = {
      lines = {
        { id = "pwh_default", text = "Huldar, Miran an' Saean, good haulers the three o' them, or so I'd have said a month ago. They take the south road round the loch, for it's flat an' the carts like it." },
        { id = "pwh_after", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "Huldar an' Miran still, bless them, an' they've no' missed a day since the ambush. Saean's name I've struck from the ledger, an' I pressed hard enough tae tear the page." },
      },
      choices = {
        { text = "A Dark Iron spy was seen in town, too.", next = "powder_spy" },
        { text = "Something else, Jern.", next = "BACK" },
      },
    },
    powder_spy = {
      lines = {
        { id = "psp_default", text = "Aye, the poster by my door says as much, an' Kadrell watches the road for him. If there's a Dark Iron about an' powder goin' missin', I'd be a poor clerk no' tae put the two in the same column." },
      },
      choices = {
        { text = "I'll keep my eyes open on the road.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stormpike = {
      lines = {
        { id = "sp_default", text = "Prospector Stormpike runs things from the Hall o' Explorers in Ironforge, an' he's a fine scholar wi' a temper like a forge bellows. Ironband's reports reach him slow, an' he reads every slow word as an insult." },
        { id = "sp_active", when = { questActive = TODO_QUEST("Report to Ironforge") },
          text = "He'll be wantin' that report, an' he'll no' like it. Hand it over, stand back, an' let him finish shoutin' before ye ask about the powder." },
      },
      choices = {
        { text = "I'd wager he shouts at you, too.", next = "stormpike_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stormpike_you = {
      lines = {
        { id = "spy_default", text = "In ink, aye, an' ink shouts louder than ye'd think. I don't mind it, for he cares about the work, an' a dwarf who cares that much is worth a few hot letters." },
      },
      choices = {
        { text = "A hot letter is still poor leadership.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Loyal of you, Jern. The League's lucky.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    saean = {
      big = true,
      lines = {
        { id = "sa_default", text = "I hired him, ye understand, an' I liked him. He laughed at my jokes an' carried more than his share, an' I'll be wonderin' a long while which o' those was the lie." },
        { id = "sa_warm", when = { disposition = { min = 65 } },
          text = "I'll tell ye what I've told nobody else: I wrote tae Ironforge offerin' tae step down over it. Stormpike wrote back one line, which was 'Don't be daft,' an' it's the kindest letter he's ever sent me." },
      },
      choices = {
        { text = "Anyone can be fooled by a friendly face.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "You should have watched him closer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jern.", next = "BACK" },
      },
    },

    league_kin = {
      lines = {
        { id = "lk_default", text = "Do ye now? Then ye'll know the League runs on two things, stubbornness an' paper, an' I'm the paper. Ironband could use another pair o' hands that know a potsherd from a pebble." },
      },
      choices = {
        { text = "I'll lend Ironband a hand.", next = "BACK", fx = { affinity = 2, standing = { thelsamar = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "That's what I'm askin' you! Somebody who knows the barrels, the road an' the hour the carts leave, I'd say, an' that's a short list o' good dwarves." },
      },
      choices = {
        { text = "Then it's one of your own.", next = "powder_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everythin' the League sends or receives in Loch Modan crosses this table, so I know a fair bit. Ask away." } },
    background = { { id = "tp_bg", text = "I'm a clerk o' the Explorers' League, an' proud o' it. Somebody has tae write it all down, or the diggin' never happened." } },
    advice = { { id = "tp_ad", text = "Count everythin' twice, friend, an' trust the count over the face." } },
    explorers_league = { { id = "tp_league", text = "The finest body o' dwarves under the mountain, an' the worst at sendin' their paperwork on time." } },
    dark_iron = { { id = "tp_di", text = "They want our powder, an' I'd give a year's wages tae know what for.", next = "powder" } },
    troggs = { { id = "tp_troggs", text = "Ironband's got them in his trench an' Rugelfuss has them in the valley. They seem tae come up wherever a dwarf puts a shovel in." } },
    _none = { { id = "tp_none", text = "That's no' in any ledger o' mine, friend. Try the Stoutlager, for they keep a different sort o' book." } },
  },
}
