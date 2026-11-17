-- Inside the City of Dalaran dungeon: Rexxie Copperclutch at Cantrips & Crows. Voice: bibles/dalaran.md
-- Loads only if the instance reports one of the pack's zones; harmless otherwise.
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_rexxie", id = TODO_NPC("Rexxie Copperclutch"), name = "Rexxie Copperclutch",
  bible = "bibles/dalaran.md", role = "questgiver", tier = "quest",
  communities = { "dalaran" }, temper = { "chatty", "sharp" }, values = { "greedy" },
  notices = { "class" },

  impression = {
    first = "Rexxie Copperclutch passes herself off as a Dalaranian in a borrowed robe and fools nobody, least of all herself. She's a thief with a salesman's grin, and oddly likeable for it.",
    third = "{name} met Rexxie Copperclutch, a goblin picking through Dalaran's troubles for anything worth selling.",
  },

  greetings = {
    { id = "g_default", text = "Hey there, neighbour! Lotta ruckus today, huh?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! Still lookin' around, or lookin' for me?" },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Oh, I know that walk. You're in the trade, aren't ya? Relax, I won't tell if you won't." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, in here? Aw, come on, I'm just browsin'. Nobody's arrestin' anybody today." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Well, hey there, fellow Dalaranian! Just another honest citizen, me, mindin' my own business while the whole city goes kablooey around us." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Don't gimme that look. The shop's open, the owner ain't, and it'd be a shame to let the stock go to waste with all this ruckus." },
        { id = "h_active", when = { questActive = TODO_QUEST("Opportunistic Education") },
          text = "Well? Find their library yet? Fancy books, the kind with locks on 'em, that's what we want." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Opportunistic Education"), days = 3 } },
          text = "A history book. I asked for secrets and you brought me homework, but hey, a little gold paint and it's an archmage's personal copy." },
        { id = "h_shade", tags = { "news" }, when = { killed = { name = "Shade of the Archmage", min = 1 } },
          text = "Whatever was makin' all that noise upstairs went quiet. Great for the mages, terrible for business; they'll be countin' the books again." },
      },
      again = { { id = "h_again", text = "What else, pal? I got a schedule, and it involves not bein' here when the mages come back." } },
      choices = {
        { text = "You're no Dalaranian.", next = "bluff" },
        { text = "What are you after down here?", next = "after" },
        { text = "This is stealing, plain and simple.", next = "steal" },
        { text = "Need a partner, Rexxie?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "See you around, Rexxie.", next = "END" },
      },
    },

    bluff = {
      lines = {
        { id = "bl_default", text = "Course I am! I got a robe and everything. All right, it's a borrowed robe, and it's three sizes too long, but the mages are too busy chasin' glowy things to check." },
      },
      choices = {
        { text = "How did you even get in?", next = "bluff_in" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bluff_in = {
      lines = {
        { id = "bi_default", text = "Same way you did, I'd bet, through the plumbing. A goblin never asks which door's polite, only which one's open." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    after = {
      lines = {
        { id = "af_default", text = "Books, sweetheart. They got whole libraries of fancy arcane stuff up there, and books like that sell for a pretty penny to the right collector." },
      },
      choices = {
        { text = "Who'd buy stolen Kirin Tor books?", next = "buyers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "bu_default", text = "Everybody, that's who! Collectors, scholars, guys with towers and no friends. I don't ask what they do with 'em, because askin' lowers the price." },
      },
      choices = {
        { text = "That's a good way to sell something dangerous.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    steal = {
      big = true,
      lines = {
        { id = "st_default", text = "Stealin'? The mages ain't usin' it, the shop ain't usin' it, and the city's fallin' down anyhow. I prefer to think of myself as a rescuer of misplaced goods." },
      },
      choices = {
        { text = "Put it back. This city's suffering enough.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Fair enough. Finders keepers.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      lines = {
        { id = "xr_default", text = "Partners split profits, and I hate splittin'. But a sneaky type like you, well, find me somethin' good and we'll talk percentages." },
      },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Buyin' low, sellin' high, and leavin' before anybody asks for a receipt." } },
    _none = { { id = "tp_none", text = "Never heard of it, and if I had, it'd cost ya." } },
  },
}
