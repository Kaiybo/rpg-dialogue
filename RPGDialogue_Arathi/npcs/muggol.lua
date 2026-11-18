-- Muggol Breezebeard, Wildhammer clan, out in the Arathi Highlands (Forever only). Voice: bibles/muggol.md
-- Takes Craftsman's Writs (Elixir of Wisdom, Golden Rod) from whoever fills them, Alliance or Horde.
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ar_muggol", id = TODO_NPC("Muggol Breezebeard"), name = "Muggol Breezebeard", title = "Wildhammer Clan",
  bible = "bibles/muggol.md", role = "questgiver", tier = "quest",
  temper = { "jovial", "blunt" }, values = { "freedom", "craft", "practical" },
  notices = { "crafter", "dwarf", "horde" },

  impression = {
    first = "Muggol Breezebeard is a Wildhammer camped out in the Arathi Highlands, buying finished goods from anyone who'll fill his writs. He laughs loud, pays fair and doesn't much care whose banner the seller flies.",
    third = "{name} met Muggol Breezebeard, a Wildhammer who takes craftsmen's writs in the Arathi Highlands.",
  },

  greetings = {
    { id = "g_default", text = "Ho there! Come tae fill a writ, or just tae admire the beard?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The wind told me ye were comin', or maybe that was the smell o' yer cookfire." },
    { id = "g_elixir", when = { questDone = TODO_QUEST("Craftsman's Writ: Elixir of Wisdom") }, text = "There's my alchemist! The shamans back home are still thankin' ye, in their quiet way." },
    { id = "g_rod", when = { questDone = TODO_QUEST("Craftsman's Writ: Golden Rod") }, text = "Ah, the one who brought me the golden rod! Fine work, an' I've told everyone it was mine." },
  },

  notice = {
    { id = "n_crafter", cat = "crafter", when = { profession = { "Alchemy", "Blacksmithing" } },
      text = "Ye've got the hands o' a crafter, burnt fingertips an' all. I may have work for ye, if ye've the patience for it." },
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf", origin = "dwarf_wildhammer_kin" },
      text = "Aerie blood! I'd know that jaw anywhere. Sit, cousin, an' tell me who's still flyin' back home." },
    { id = "n_horde", cat = "horde", when = { faction = "Horde" },
      text = "Horde, are ye? Well, the Wildhammer bow tae no king in Ironforge, an' I'll buy an elixir off an orc as soon as off a gnome." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Muggol Breezebeard, o' the Wildhammer clan, an' I'm out here buyin' fine goods for the folk back home. If ye've a writ wi' my name on it, I'll take what it asks for an' pay ye proper." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A Bronzebeard, by the look o' ye, though I'll no' hold it against ye. Ye'll find the Wildhammer drive a fair bargain, an' a louder one." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The wind's in no hurry." },
        { id = "h_again2", text = "Ask away! I'm a talker, an' there's no one else up here tae talk tae." },
      },
      choices = {
        { text = "I have a writ for you.", next = "BUSINESS" },
        { text = "What do you buy, and why?", next = "writs" },
        { text = "Why is a Wildhammer in Arathi?", next = "why" },
        { text = "Is it safe out here?", next = "safe" },
        { text = "Tell me about the Wildhammer.", next = "clan" },
        { text = "Farewell, Muggol.", next = "END" },
      },
    },

    writs = {
      lines = {
        { id = "wr_default", text = "Elixirs o' wisdom for our shamans, who like a clear head when they talk tae the sky, an' golden rods for the folk who put a bit o' magic intae our gear. We make plenty ourselves, but there's never enough, an' a good craftsman's worth payin'." },
      },
      choices = {
        { text = "Why not make them yourselves?", next = "writs_make" },
        { text = "Something else.", next = "BACK" },
      },
    },
    writs_make = {
      lines = {
        { id = "wm_default", text = "We're gryphon riders an' hunters, mostly, an' the forges at the Aerie are busy wi' spearheads an' saddle iron. Easier tae fly out wi' a purse an' buy what others make well." },
      },
      choices = {
        { text = "A clan should make what it needs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Buy from whoever's best. That's sense.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "It's halfway between everywhere, isn't it? The Aerie's north an' east, Ironforge is south, an' every road in between crosses these hills. A Wildhammer wi' a purse sits where the traders pass." },
      },
      choices = {
        { text = "And where's your gryphon?", next = "why_gryphon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_gryphon = {
      lines = {
        { id = "wg_default", text = "Off huntin', the greedy beast, an' she'll come back when she's full. If ye see a gryphon carryin' off a sheep from Stromgarde, ye didnae see it, an' neither did I." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    safe = {
      lines = {
        { id = "sa_default", text = "Safe as anywhere wi' Witherbark trolls in the east an' ogres in the hills an' the Syndicate creepin' about the old manors. I keep my axe close an' my ears closer.",
          fx = { learn = { "syndicate" } } },
      },
      choices = {
        { text = "The trolls trouble the Aerie too?", next = "safe_trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_trolls = {
      lines = {
        { id = "st_default", text = "Always have, always will. Trolls an' Wildhammer have been fightin' over the Hinterlands since before any o' us can remember, an' I don't expect it tae stop in my lifetime." },
      },
      choices = {
        { text = "Maybe peace is possible, given time.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then drive them out for good.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    clan = {
      lines = {
        { id = "cl_default", text = "We left Grim Batol after the war o' the hammers an' made our home in the Hinterlands, among the trees an' the sky. We've kin in Ironforge, an' a treaty, an' a long memory, an' we're happiest when we're flyin' somewhere else." },
      },
      choices = {
        { text = "You fought alongside the Alliance, didn't you?", next = "clan_alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clan_alliance = {
      lines = {
        { id = "ca_default", text = "Aye, in the Second War, wi' Falstad Wildhammer an' the gryphon riders over every battlefield. We fight when we're needed an' go home when we're not, an' that's how a free clan should be." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Aerie Peak born, gryphon raised, an' sent out wi' a purse because I'm the best haggler in the clan. Or the loudest, anyway." } },
    advice = { { id = "tp_ad", text = "Pay fair an' ye'll always have someone tae sell tae. Cheat once an' ye'll be buyin' from goblins forever." } },
    _none = { { id = "tp_none", text = "Ha! No idea, friend. Ask me about elixirs." } },
  },
}
