-- Dorin Songblade, dwarf armorer in Lakeshire. Voice: bibles/dorin_songblade.md
-- His brother Daewyn went with a dig crew into the Wetlands and stopped writing.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dorin_songblade", id = TODO_NPC("Dorin Songblade"), name = "Dorin Songblade",
  title = "Armorer",
  bible = "bibles/dorin_songblade.md", role = "blacksmith", tier = "quest",
  communities = { "lakeshire" }, temper = { "gruff" }, values = { "craft", "family" },
  notices = { "kit", "race" },

  impression = {
    first = "Dorin Songblade refits armour in Lakeshire and worries about a brother who went digging in the Wetlands. He hides it behind a pile of girdles and a gruff word.",
    third = "{name} met Dorin Songblade, a dwarf armorer in Lakeshire whose brother Daewyn went off with a dig crew to the Wetlands.",
  },

  greetings = {
    { id = "g_forge", text = "Need somethin' fitted? Get in line behind these girdles; they've been waitin' longer than ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, {g:lad|lass}? Let's see what ye've done tae yer armour this time." },
    { id = "g_search", when = { questActive = TODO_QUEST("Songblade Search") }, text = "Any word o' Daewyn? No, ye'd have said. Off ye go, then." },
    { id = "g_grief", when = { questDone = TODO_QUEST("Fallen in the Fen") }, text = "Come in, {g:lad|lass}. I'm still workin'; it keeps my hands from shakin'." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the pile o' girdles hasn't shrunk a bit. Good tae see ye." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've filled out yer armour since I first fitted it. I'll need tae let the straps out." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk in Lakeshire speak well o' ye. That'll turn more trouble than a good breastplate, an' I should know, for I make the breastplates." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear ye were caught in a lie. A dwarf's word is his armour, {g:lad|lass}; keep yers mended." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "By the Forge, look at the state o' ye! Get that off an' let me see tae it before somethin' gets through." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A fellow dwarf, this far south! Ye'll have a word from home, maybe, if ye've come by way o' Loch Modan." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Dorin Songblade, armorer. I keep Lakeshire's guards in plate that fits, which is harder than it sounds when half o' them were farmers last spring." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Songblade Search") },
          text = "My brother Daewyn went off tae the Wetlands wi' a diggin' crew out o' Loch Modan, intae hills no dwarf's set boot in. He always writes, an' this time he hasn't." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Songblade Search") },
          text = "Whelgar's Excavation Site in the Wetlands, that's where Daewyn's crew were headed. If ye're marchin' that way, look fer a dwarf who looks like me, only better lookin', he'd say." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Fallen in the Fen"), days = 7 } },
          text = "I should have gone wi' him. I was makin' this gear fer him, a surprise, an' it wasn't ready when he came by, an' now it never will be." },
        { id = "h_later", when = { questDone = TODO_QUEST("Fallen in the Fen"), metBefore = true },
          text = "I still set out two mugs some nights, out o' habit. Daft, I know, but I cannae seem tae stop." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? These straps won't rivet themselves." },
        { id = "h_again2", text = "Go on, I'm listenin'. I can talk an' hammer both." },
      },
      choices = {
        { text = "Tell me about Daewyn.", next = "daewyn" },
        { text = "Why does a dwarf keep a forge in Redridge?", next = "redridge" },
        { text = "The guards here seem better armoured than most.", next = "guards" },
        { text = "I found your brother. I'm so sorry.", next = "grief", when = { questDone = TODO_QUEST("Fallen in the Fen") } },
        { text = "I need my armour seen to.", next = "BUSINESS" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    daewyn = {
      lines = { { id = "d_default", text = "Younger than me, an' never could sit still. He tried tae drag me along on this dig, an' I'd have gone, but I'd this pile o' girdles tae refit." },
      },
      choices = {
        { text = "What was the dig for?", next = "daewyn_dig" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daewyn_dig = {
      lines = { { id = "dd_default", text = "Somethin' old in the Wetlands hills, the Explorers' League sort o' business. He said it'd make our name, an' I said our name was fine as it was, an' that's near the last thing I said tae him." },
      },
      choices = {
        { text = "You couldn't have known.", next = "daewyn_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daewyn_regret = {
      big = true,
      lines = { { id = "dr_default", text = "Maybe no'. But a brother ought tae go where his brother goes, an' I chose work over him. Tell me straight, would ye have gone?" },
      },
      choices = {
        { text = "Yes. Family comes before any work.", next = "BACK", reply = "Aye, that's what I feared ye'd say, and it's what I've been tellin' myself every night since his last letter. I'll carry that one a while yet.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "No. He chose the dig. You had your own duties.", next = "BACK", reply = "Ye're kinder than I'd be to myself, and maybe ye're right that Daewyn's his own dwarf. It doesnae make the waitin' any lighter, mind.", fx = { align = { honor = -1 } } },
        { text = "I can't answer that for you.", next = "BACK" },
      },
    },
    redridge = {
      lines = { { id = "r_default", text = "Because Lakeshire needed an armorer an' nobody else wanted the job wi' orcs on the ridge. It's good steel country, an' the folk pay when they can." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guards = {
      lines = { { id = "g_default", text = "Better since I started fittin' them properly. A farmer in borrowed plate dies tired, an' a farmer in plate that fits lives tae complain about it." },
      },
      choices = {
        { text = "Then you're saving lives with every strap.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grief = {
      lines = { { id = "gr_default", text = "Ye covered him wi' his cloak, ye said. That was kind. An' he'd his gun still in his hands, the one wi' his letters on the stock, so he went down fightin'." },
      },
      choices = {
        { text = "He did. He was brave to the end.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'll leave you be, Dorin.", next = "END" },
      },
    },
  },

  topics = {
    wildhammer = { { id = "tp_wildhammer", text = "My kin are Bronzebeards, but I've worked iron for Wildhammers out of Aerie Peak, and they pay in gryphon feathers half the time. Good fighters, mind, though they'd sooner drink than settle a bill." } },
    explorers_league = { { id = "tp_explorers_league", text = "My brother Daewyn went off with an Explorers' League dig into the Wetlands, all maps and big talk about the old world. He's stopped writing, and I can't call that normal any longer." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are a stain on every dwarf alive, and I'll not hear excuses for them. They're thick in the Burning Steppes, just past those hills, and I'd hammer a few of their helms flat for free." } },
    magni = { { id = "tp_magni", text = "King Magni's a fine king with a fine beard, and he'd see my brother found if I could get word to him. Ironforge is a long road from Lakeshire, though, and kings have bigger worries than one lost digger." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's where the League goes when they want to dig something up that's best left buried. If Daewyn's gone on to those badlands, he's a bigger fool than I took him for, and I love him anyway." } },
    thandol_span = { { id = "tp_thandol_span", text = "If my brother came back from the Wetlands, he'd have to cross the Thandol Span, and I hear the Dark Irons have been at it with powder. I'd not trust that bridge with a heavy pack, never mind a dwarf." } },
    background = { { id = "tp_bg", text = "Smith from Khaz Modan, armorer in Lakeshire, an' a brother, or I was." } },
    advice = { { id = "tp_ad", text = "Armour that doesn't fit is worse than none, for ye'll trust it." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask at the inn; they hear more than I do over this hammer." } },
  },
}
