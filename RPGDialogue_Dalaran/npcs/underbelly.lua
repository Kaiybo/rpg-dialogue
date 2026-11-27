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
    first = "She is a thief with a salesman's grin, and oddly likeable.",
    third = "{name} met Rexxie Copperclutch, a goblin picking through Dalaran's troubles for anything worth selling.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Neighbour! Great to see ya! For you, I've got the good stuff under the counter, and I mean the really good stuff." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Shop's open, prices are up, and no, that's not a coincidence." },
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
    w8_sew = {
      lines = { { id = "w8_sew_a", text = "Nobody with a license, pal, which is the charm of the place! A couple of rogues sell maps they drew themselves, a fella sells rat-on-a-stick that glows a little, and I sell everything else, at very competitive rates." } },
      choices = {
        { text = "Glowing rat on a stick?", next = "w8_sew2" },
        { text = "So you're the queen of the sewers.", next = "w8_sew2" },
        { text = "I'm a rogue. I could sell maps down here too.", next = "w8_sew2", when = { class = "ROGUE" } },
        { text = "Something else, Rexxie.", next = "BACK" },
      },
    },
    w8_sew2 = {
      lines = {
        { id = "w8_sew2_a", text = "Arcane leakage, sweetheart, it gets into everything, and the rats are the tastiest part of it, or so I'm told by people braver than me. Queen's a big word, pal, I prefer 'leading independent retailer of the lower city'." },
        { id = "w8_sew2_rog", when = { class = "ROGUE" }, text = "Sure you could, and you'd be competition, and I'd have to undercut ya, and then we'd both be poor. Tell ya what, sell maps to everybody but my customers, and I'll send ya the ones who can't afford mine." },
      },
      choices = {
        { text = "I'll keep that deal in mind.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    rex_pipe1 = {
      lines = {
        { id = "rex_pipe1_1", text = "Sure did, pal, through the old sewers under the city, which the mages built for magic runoff and then forgot about. There's tunnels down there wide enough to roll a cart through, and nobody guarding 'em but the rats and the odd glowing puddle." },
      },
      choices = {
        { text = "Glowing puddle?", next = "rex_pipe2" },
        { text = "Something else, Rexxie.", next = "BACK" },
      },
    },
    rex_pipe2 = {
      lines = {
        { id = "rex_pipe2_1", text = "Arcane leakage, sweetheart, a hundred years of spells goin' down the drain, and it makes the rats real interesting. I lost a perfectly good boot to one puddle, and I swear the boot walked off on its own." },
      },
      choices = {
        { text = "That's not a joke, is it?", next = "rex_pipe3" },
        { text = "I'd keep that route to myself.", next = "rex_pipe3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    rex_pipe3 = {
      lines = {
        { id = "rex_pipe3_1", text = "Nope, and that's why I charge for the map, pal, a real reasonable fee, with a discount for anybody who promises not to tell the Kirin Tor where they got it. The boot, by the way, if you see it, it's a size four and it owes me money." },
      },
      choices = {
        { text = "I'll keep an eye out. Something else.", next = "BACK" },
      },
    },
    rex_gold1 = {
      lines = {
        { id = "rex_gold1_1", text = "Old as gold, friend, and twice as reliable! You take a plain book, a little leaf on the spine, a fancy seal on the cover, and suddenly it's the private journal of some archmage nobody can check on, 'cause he's dead or he's busy." },
      },
      choices = {
        { text = "And the buyers never notice?", next = "rex_gold2" },
        { text = "A mage could spot a forgery fast.", next = "rex_gold2", when = { class = "MAGE" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rex_gold2 = {
      lines = {
        { id = "rex_gold2_1", text = "The ones who notice don't complain, pal, 'cause complainin' means admittin' they were buyin' hot books from a goblin in a basement. That's what I call a self-correctin' market, and it's the best kind there is." },
      },
      choices = {
        { text = "That's a grim kind of genius. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Whoa, hey, I just sold a stack of fancy books to a {altrace} named {alt}, pal, from the other side, and you've got the exact same disapproving eyebrows. Is there some kinda family of you goin' around Dalaran checkin' up on honest businessgoblins?" },
        { id = "h_alt_same", when = { alt = { faction = "same" } },
          text = "{alt} came by, a {altclass}, real friendly, and didn't call the mages on me, so I'm thinkin' good things about your whole family, pal. Don't ruin it, 'cause I got a reputation for bein' trusting, and it's costin' me." },
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
        { text = "You're after something down here, I'd guess.", next = "after" },
        { text = "This is stealing, plain and simple.", next = "steal" },
        { text = "Need a partner, Rexxie?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You came in through the plumbing, you said.", next = "rex_pipe1" },
        { text = "That gold paint trick sounds like an old one.", next = "rex_gold1" },
        { text = "Who else trades down here in the sewers?", next = "w8_sew" },
        { text = "See you around, Rexxie.", next = "END" },
      },
    },

    bluff = {
      lines = {
        { id = "bl_default", text = "Course I am, pal! I got a robe and everything, and all right, it's a borrowed robe and it's three sizes too long, but the mages are too busy chasin' glowy things to check anybody's papers." },
      },
      choices = {
        { text = "I can't see how a goblin got in here.", next = "bluff_in" },
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
        { text = "Put it back. This city's suffering enough.", next = "BACK", reply = "Aw, now you sound like my mother, and she was a crook too, but fine, fine, I'll think about it real hard, which is more than the mages ever do.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Finders keepers, I always say.", next = "BACK", reply = "See, now you and me understand each other, sweetheart, and if anybody asks, you never saw me and I never saw you, which is how the best friendships go.", fx = { affinity = 1, align = { honor = -1 } } },
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
    regard = {
      { id = "dp_rg", text = "You're a solid customer and a better neighbour, and in a city this crazy that's worth gold. Lots of gold." },
    },
    grievance = {
      { id = "dp_gv", text = "You've been bad for business, pal, and bad for my nerves. Shape up or shop somewhere else." },
    },
    trade = { { id = "tp_trade", text = "Buyin' low, sellin' high, and leavin' before anybody asks for a receipt, pal, which is all the business school a goblin ever needs." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's got more shiny stuff per square foot than anywhere on this continent, pal, and the magi don't count half of it. I'm just helpin' with the inventory, is all, very informally." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor think a borrowed robe and a serious face make you a magus, and you know what, mostly they're right! Don't tell 'em I said that, because it's my whole business plan." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I learned my trade, friend, and the Baron's still lookin' for me over a little matter of a misplaced crate. Call it a disagreement about who owned it, and call it settled if anybody asks." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got cousins of mine on every corner, and every one of 'em would sell me out for a copper. That's family, though, and I'd do the same." } },
    _none = { { id = "tp_none", text = "Never heard of it, sweetheart, and if I had, it'd cost ya." } },
  },
}
