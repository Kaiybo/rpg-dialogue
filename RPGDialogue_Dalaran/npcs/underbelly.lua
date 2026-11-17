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
    { id = "g_default", text = "Hey there, neighbour! Lotta ruckus today, huh? Great day for business, though, if you know where the good stuff landed." },
    { id = "g_back", when = { metBefore = true }, text = "You again, pal! Still lookin' around, or lookin' for me? 'Cause only one of those does anything for my margins." },
    { id = "g_away", when = { away = 14 }, text = "Hey, neighbour, back after {away} away! I've rescued a whole lotta stuff since you left, and some of it's even for sale, at a very reasonable markup." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is you pulled a fast one on somebody upstairs, sweetheart, and by my last copper, that's the most Dalaranian thing I've heard all week. A fellow citizen after my own heart, that's what you are." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you sweet-talked somebody in the city round to your way of thinkin'. Nice work, pal, but don't try it on me, 'cause I'm the one who wrote the sales pitch." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Oh, I know that walk, pal, you're in the trade, aren't ya? Relax, I won't tell if you won't, 'cause silence between professionals comes standard." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, in here? Aw, come on, sweetheart, I'm just browsin', and browsin' ain't a crime in any city I ever paid taxes in, which is none of 'em." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Well, hey there, fellow Dalaranian! Just another honest citizen, me, mindin' my own business while the whole city goes kablooey around us, and kablooey's real good for the salvage trade." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Don't gimme that look, pal. The shop's open, the owner ain't, and lettin' good stock go to waste in all this ruckus would be a crime against commerce." },
        { id = "h_active", when = { questActive = TODO_QUEST("Opportunistic Education") },
          text = "Well? Find their library yet? Fancy books with locks on 'em, that's what we want, 'cause a lock on the cover adds half again to the price before anybody's read a page." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Opportunistic Education"), days = 3 } },
          text = "A history book, pal? I asked for secrets and you brought me homework, but hey, a little gold paint and it's an archmage's personal copy, priced accordin'ly." },
        { id = "h_shade", tags = { "news" }, when = { killed = { name = "Shade of the Archmage", min = 1 } },
          text = "Whatever was makin' all that noise upstairs went quiet. Great for the mages, terrible for business, 'cause now they'll be countin' the books again and checkin' 'em against the ledger." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I got a schedule, and it involves not bein' here when the mages come back." },
        { id = "h_again2", text = "Still browsin', sweetheart? Look all ya like, but touchin' costs extra, and breakin' costs a whole lot extra." },
      },
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
        { id = "bl_default", text = "Course I am, pal! I got a robe and everything, and all right, it's a borrowed robe and it's three sizes too long, but the mages are too busy chasin' glowy things to check anybody's papers." },
      },
      choices = {
        { text = "How did you even get in?", next = "bluff_in" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bluff_in = {
      lines = {
        { id = "bi_default", text = "Same way you did, I'd bet, through the plumbing. A goblin never asks which door's polite, sweetheart, only which one's open and what the guard costs." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    after = {
      lines = {
        { id = "af_default", text = "Books, sweetheart, whole libraries of fancy arcane stuff up there, and a book like that fetches a pretty penny from the right collector, plus handlin'." },
      },
      choices = {
        { text = "Who'd buy stolen Kirin Tor books?", next = "buyers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "bu_default", text = "Everybody, pal! Collectors, scholars, guys with towers and no friends, and I don't ask what they do with 'em, because askin' lowers the price." },
      },
      choices = {
        { text = "That's a good way to sell something dangerous.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    steal = {
      big = true,
      lines = {
        { id = "st_default", text = "Stealin'? The mages ain't usin' it, the shop ain't usin' it, and the city's fallin' down anyhow, so I prefer to think of myself as a rescuer of misplaced goods, with a modest recovery fee." },
      },
      choices = {
        { text = "Put it back. This city's suffering enough.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Finders keepers, I always say.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      lines = {
        { id = "xr_default", text = "Partners split profits, pal, and I hate splittin' worse than I hate audits. But a sneaky type like you, well, find me somethin' good and we'll talk percentages, startin' low and haggled up." },
      },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Buyin' low, sellin' high, and leavin' before anybody asks for a receipt, pal, which is all the business school a goblin ever needs." } },
    _none = { { id = "tp_none", text = "Never heard of it, sweetheart, and if I had, it'd cost ya." } },
  },
}
