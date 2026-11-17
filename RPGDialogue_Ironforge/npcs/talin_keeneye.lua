-- Talin Keeneye, hunter by the frozen lake in Coldridge Valley. Voice: bibles/talin_keeneye.md
-- Loves boar hunting; there are now so many boars the sport has turned into a chore.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "talin_keeneye", id = TODO_NPC("Talin Keeneye"), name = "Talin Keeneye",
  bible = "bibles/talin_keeneye.md", role = "questgiver", tier = "quest",
  communities = { "coldridge" }, temper = { "cheerful" }, values = { "practical", "nature" },
  notices = { "animal", "weapon" },

  impression = {
    first = "Talin Keeneye hunts boars for the love of it, and there are now so many of them that he can't enjoy it. He talked about a good shot the way other dwarves talk about ale.",
    third = "{name} met Talin Keeneye, a cheerful hunter by Coldridge's frozen lake whose favourite sport has been spoiled by too many boars.",
  },

  greetings = {
    { id = "g_lake", text = "Fine day fer huntin', wouldn't ye say? Mind where ye step; the boars are everywhere." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have ye come tae shoot somethin', or just tae watch me miss?" },
    { id = "g_hunt", when = { questActive = TODO_QUEST("The Boar Hunter") }, text = "How goes the hunt? I can still hear them grunting out there, so I'd guess there's a few left." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the boars have been breedin' the whole time ye were away, I'd wager. Welcome back tae the valley." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye were thinning boars fer me no' so long ago, an' now ye've the look o' somebody who hunts bigger game. Good on ye." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Sten says ye've been carryin' letters an' clearin' the hills. The valley could do wi' a few more like ye." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear somebody in the valley's sore wi' ye. Out here we settle that sort o' thing over a roast, so think on it." },
  },

  notice = {
    { id = "n_pet", cat = "animal", when = { pet = { type = "Beast" } },
      text = "Now there's a fine beast at yer heel. Keep {pet} away from the boars, mind, for they'll charge anythin' that moves." },
    { id = "n_gun", cat = "weapon", when = { class = "HUNTER" },
      text = "Ye carry yerself like a hunter. Tell me ye've a decent piece o' Hegnar's work on yer back, an' no' some gnomish contraption." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Talin Keeneye. I've been huntin' boar by this lake since before ye were born, likely, an' I've never seen so many o' the brutes. It almost takes the fun out of it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Boar Hunter") },
          text = "No need tae get the boars charging, for they're all angry already. If ye've a mind tae thin a few, I'd be grateful, an' I could get back tae huntin' at a gentler pace." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Boar Hunter") },
          text = "The small crag boars, all around the lake an' up the slopes. A dozen should do it, an' dinnae let them corner ye against the ice." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Boar Hunter"), days = 3 } },
          text = "Ye've done it! I went out this mornin' an' had a whole hour's quiet stalkin' before one o' them found me. That's leisure, that is." },
        { id = "h_mail", when = { questActive = TODO_QUEST("Coldridge Valley Mail Delivery") },
          text = "Mail from Sten, is it? Hand it over, an' I'll wager half o' it's no' even fer me." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, an' a fresh one, by the look o' ye. There's no better place tae learn than a valley that's too full o' game." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, out by the lake in the cold! Ye're braver than ye look, an' ye'll want tae keep yer feet dry." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The boars'll wait, more's the pity." },
        { id = "h_again2", text = "Go on, I'm listenin', though I'm watchin' the treeline too." },
      },
      choices = {
        { text = "There seem to be boars everywhere this year.", next = "boars" },
        { text = "Sten says half your mail is for Grelin.", next = "mail" },
        { text = "What's the trick to hunting boar?", next = "trick" },
        { text = "Teach a fellow hunter something, Talin.", next = "hunter", when = { class = "HUNTER" } },
        { text = "You said there are more boars every year. Is it the troggs?", next = "troggs", when = { questDone = TODO_QUEST("The Boar Hunter") } },
        { text = "I'll help thin them.", next = "BUSINESS" },
        { text = "Good hunting, Talin.", next = "END" },
      },
    },
    boars = {
      lines = { { id = "b_default", text = "Mild winters, if ye can believe there's such a thing up here, an' fewer wolves tae keep them down. Every sow had a litter twice over, an' now they're all grown an' bad-tempered." },
      },
      choices = {
        { text = "So the wolves kept them in check?", next = "boars_wolves" },
        { text = "Too much of a good thing, then.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    boars_wolves = {
      lines = { { id = "bw_default", text = "Aye, an' then the recruits at Anvilmar took tae huntin' wolves fer Sten's gloves, so the wolves thinned an' the boars didnae. I've no' said that tae Sten, an' I'd thank ye no' tae either." },
      },
      choices = {
        { text = "Then the valley needs balance, not slaughter.", next = "boars_balance" },
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    boars_balance = {
      big = true,
      lines = { { id = "bb_default", text = "That's the hunter's way o' thinkin', an' I like ye fer it. Take the boars that are too many an' leave the rest, an' in a year or two the valley sorts itself out." },
      },
      choices = {
        { text = "Take only what's needed. The land will thank you.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A boar's a boar. I'll take every one I see.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Talin.", next = "BACK" },
      },
    },
    mail = {
      lines = { { id = "m_default", text = "More than half, an' it's always the heavy parcels, too. Grelin's camped out by the troll caves wi' his notebooks, so I send it on wi' whoever's goin' that way, which is usually ye." },
      },
      choices = {
        { text = "What's Grelin doing near the trolls?", next = "mail_grelin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mail_grelin = {
      lines = { { id = "mg_default", text = "Watchin' the Frostmane fer the Senate, so he says, an' writin' it all down fer his brother Senir in Kharanos. A clever man, Grelin, though he couldnae hit a boar if it sat on him." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    trick = {
      lines = { { id = "t_default", text = "Let it come tae ye. A boar charges in a straight line an' it cannae turn worth a copper, so step aside at the last moment an' it'll go right past wi' its tusks in the snow." },
      },
      choices = {
        { text = "And if I don't step aside in time?", next = "trick_late" },
        { text = "I'd rather meet it head on.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    trick_late = {
      lines = { { id = "tl_default", text = "Then ye'll learn, an' ye'll limp back tae Anvilmar an' Durnan will laugh at ye over his mornbrew. Everybody learns it once." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Watch the snow, no' the beast. Tracks tell ye where it's been an' how fast it was goin', an' a boar in a hurry is a boar that's already seen ye." },
        { id = "hu_pet", when = { pet = { type = "Beast" } }, text = "An' let yer {pet} do the flushin'; that's what it's for, an' it'll enjoy it more than ye will." },
      },
      choices = {
        { text = "Patience, then. I can learn that.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather trust my instincts than the snow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "tr_default", text = "The troggs push the boars down out o' the hills, aye, an' Balir's been sayin' as much fer weeks. Fewer boars by the lake now, thanks tae ye, but the troggs are another matter." },
      },
      choices = {
        { text = "Then I'll see Balir about the troggs.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I hunt, I eat what I hunt, an' I pass on Sten's mail when I have tae. It's a good life when there's fewer boars in it." } },
    advice = { { id = "tp_ad", text = "Step aside when it charges. That's all the advice a body needs in Coldridge." } },
    troggs = { { id = "tp_troggs", text = "I dinnae hunt troggs; there's no meat on them worth the name. Ask Balir, for he hates them enough fer the both of us." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. I know boars, an' I know which way the wind's blowin', an' that's about it." } },
  },
}
