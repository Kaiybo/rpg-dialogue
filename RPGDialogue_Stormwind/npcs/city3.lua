-- Stormwind, part three: a lord in the library, a brawler in Old Town, Elmore's student,
-- a beggar behind the Auction House and the man who'd rather nobody heard about the Stockade.
-- Voice: bibles/city3.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lord Gregor Lescovar. Canon secret: he works with the Defias. He never says so.
P:NPC {
  key = "lescovar", id = TODO_NPC("Lord Gregor Lescovar"), name = "Lord Gregor Lescovar",
  bible = "bibles/city3.md", role = "noble", tier = "quest",
  communities = { "stormwind" }, temper = { "smooth" }, values = { "proud", "ambitious" },
  notices = { "deed", "status" },
  impression = {
    first = "Courtesy from Lord Gregor Lescovar feels rather like being weighed on a merchant's scale. He comes to the library to escape the noise of the House of Nobles, or so he says.",
    third = "{name} met Lord Gregor Lescovar of the House of Nobles, an elegant man who prefers the quiet of the library.",
  },

  greetings = {
    { id = "g_library", text = "Quietly, please. This is a library, not a market, whatever the Trade District has taught you." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again, still adventuring, I see. How very tireless of you." },
  },

  notice = {
    { id = "n_deadmines", cat = "deed", when = { deed = "dungeon:The Deadmines" },
      text = "You've been down in that dreadful Westfall mine, I hear. Did you bring anything back, papers or ledgers? Purely out of curiosity, of course." },
    { id = "n_rogue", cat = "status", when = { class = "ROGUE" },
      text = "Shaw's sort, by the look of you. Tell him I'm reading; it's all I ever do here, reading." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The House welcomes anyone who costs it nothing, and the kaldorei have not yet sent us a bill. When they do, I expect we'll learn how deep the friendship runs." } },
      choices = {
        { text = "My people keep their word, and we expect the same of Stormwind.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then my people should send that bill soon, my lord.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Shaw, I imagine, or someone in the House who owes him a favour, which is everyone eventually. Tell them I read history, mostly, because history is where the House keeps its debts." } },
      choices = {
        { text = "I answer to the crown, my lord, not to anyone's favours.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I answer to nobody, my lord, and nobody sent me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The House trusts whoever pays its bills, and Dalaran has never once offered to pay for anything in Stormwind. Lady Prestor says the crown must keep its friends close and its creditors closer, and I find she's usually right." } },
      choices = {
        { text = "Friendship shouldn't be measured in coin, my lord.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin is the only friendship that lasts, my lord.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It values them as one values a good wall, which is to say it notices them only when they fail. I find that a little unjust, though I've never said so in the chamber, and I don't expect I shall." } },
      choices = {
        { text = "Then someone in the House should say it, my lord.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Soldiers are paid to be walls. That's fair enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very little, honestly, unless it touches their estates or their rents. The Westfall farms might all burn tomorrow and the chamber would still argue first about who owns the ash." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet} trained? Good. My late father kept hounds, and I never cared for them, but I admired how well they obeyed." },
      },
      choices = {
        { text = "The kingdom is more than the nobles' estates, my lord.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Land is land. Whoever holds it should profit from it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It cares deeply in public, and very little in the cloakroom afterwards. The Archbishop spoke for the Stonemasons, and the House listened politely and then did exactly what it had already decided, which is the House's great talent." } },
      choices = {
        { text = "The masons were wronged, my lord, and the Church won't forget it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Church should keep out of the House's affairs, my lord.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A few old names who remember Lordaeron, and a great many more who remember what the paladins cost to keep. The House prefers its heroes in statues, I'm afraid, where they're very much cheaper." } },
      choices = {
        { text = "Honour isn't bought, my lord. The House would do well to remember it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Paladins should earn their keep like anyone else, my lord.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The Church has opinions about the House of Nobles, I'm told, and I'm sure you've come to share them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. How reassuring, though I can't think what the Silver Hand would want with a quiet man reading in a library." },
        { id = "h_default", key = true,
          text = "Lord Gregor Lescovar, of the House of Nobles. I come here to think. The House is very loud, and very little of what's said there is worth hearing." },
        { id = "h_diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A missing diplomat, you say? How very careless of someone. Stormwind loses so many things these days: diplomats, patience, masons." },
        { id = "h_prestor", when = { heardLine = "katrana.h_default" },
          text = "So Lady Prestor has received you. A remarkable woman, who sees what needs doing and does not trouble the Regent with the details, and I admire that enormously." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Alliance" },
          text = "So you're one of the new elves, and the Kirin Tor vouched for you, I'm told. How generous of the Kirin Tor, when they're so rarely the ones who pay for anything." },
        { id = "h_noble", when = { origin = "human_minor_noble" },
          text = "One of the lesser houses, I see. I know your family's name, because it appears on several of my ledgers." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Clergy, in the library, how refreshing. The Cathedral is so generous with its opinions on the treasury; do give the Archbishop my regards." },
        { id = "h_baros", when = { heardLine = "baros.e_default" },
          text = "Alexston told you his sad story, I see. He kept his post and his friend kept his pride. Both have done rather well out of the arrangement." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've been looking at my satchel since you came in. It contains nothing of interest, which you may tell whoever asked." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, in the Royal Library. Let me guess that Dalaran wants a book back, and the Kirin Tor are too grand to ask in person." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in the garden. Do try not to trample the hedges; the House of Nobles takes its gardens more seriously than its soldiers." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, back from the countryside. I suppose you see a good deal more of the kingdom than the House does." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, in the Royal Library. The kaldorei have been very gracious to the crown, and I've always wondered what a people so old expect in return." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I do have reading to do." },
        { id = "h_again2", text = "Yes? Briefly. Silence is the whole point of a library." },
      },
      choices = {
        { text = "What troubles the House of Nobles?", next = "house" },
        { text = "What about the masons?", next = "masons" },
        { text = "Why read here, my lord?", next = "library" },
        { text = "The Church says the masons were wronged.", next = "church", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "The Defias took my family's farm.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I found papers in the Deadmines.", next = "papers", when = { deed = "dungeon:The Deadmines" } },
        { text = "Who do you think sent me, my lord?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the House of Nobles trust Dalaran, my lord?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the House of Nobles value its soldiers, my lord?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would the House want to know of the countryside, my lord?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the House of Nobles care what the Church thinks, my lord?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the Silver Hand have friends in the House, my lord?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the House of Nobles welcome the night elves, my lord?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },
    house = {
      lines = {
        { id = "ho_default", text = "Money, mostly. The kingdom spends like a king and the King isn't here. Someone has to say no. I find I'm very good at saying no." },
      },
      choices = {
        { text = "To whom?", next = "whom" },
        { text = "Someone has to.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    whom = {
      lines = { { id = "w_default", text = "To anyone who asks. That's rather the point of the word." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    masons = {
      big = true,
      lines = {
        { id = "m_default", text = "The masons were paid what the city could bear. They disagreed, loudly, and left. Whatever they've become out west is their own choice, not the House's." },
      },
      choices = {
        { text = "They rebuilt your city.", next = "rebuilt", fx = { trait = { stern = 1 }, opinion = { westfall = "abandoned" } } },
        { text = "That's fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    rebuilt = {
      lines = { { id = "r_default", text = "And were thanked. Thanks is a currency too, you know. Not everyone has the sense to accept it." } },
      choices = {
        { text = "Thanks doesn't feed a family.", next = "rebuilt_queen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rebuilt_queen = {
      big = true,
      lines = { { id = "rq_default", text = "Their riot killed a queen. Tiffin went into the street to calm them and someone threw a stone. Forgive me if their wages move me less than they move you." } },
      choices = {
        { text = "That was one hand, not a whole guild.", next = "BACK", fx = { affinity = -1, align = { honor = 1 }, opinion = { defias = "masons_wronged" } } },
        { text = "I didn't know.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then the masons got what they had coming.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    library = {
      lines = { { id = "li_default", text = "Because no one shouts in a library. I come to meditate. The guards know to leave me be, and Sheaf knows better than to recommend me books." } },
      choices = {
        { text = "Do you feel watched here?", next = "library_watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    library_watch = {
      lines = { { id = "lw_default", text = "Constantly. Master Shaw's little creatures creak on the stairs. Let them listen. A man reading is very dull to spy on." } },
      choices = { { text = "I'm sure it is.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    church = {
      lines = { { id = "ch_default", text = "Does it? The masons built its Cathedral too. Has His Grace paid them a copper of his own? Do ask him, before he lectures the House again." } },
      choices = {
        { text = "He's said so in the Keep, at least.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Then His Grace is no better than the rest of you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmhand = {
      lines = { { id = "fa_default", text = "How dreadful. The House sympathises enormously. Sympathy is, unfortunately, the only thing the treasury has in abundance." } },
      choices = { { text = "Keep your sympathy.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    papers = {
      lines = { { id = "pa_default", text = "Did you? How enterprising, and where are they now? Purely for the archive, you understand, because history is so easily lost." } },
      choices = {
        { text = "With Gryan Stoutmantle.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I burned them.", next = "papers_burned", fx = { trait = { cautious = 1 } } },
      },
    },
    papers_burned = {
      lines = { { id = "pb_default", text = "Burned? What a pity, what a terrible, terrible pity. Do be more careful with history in future." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A lord of the House hears a great deal, and repeats very little to strangers. Still, I might indulge you on one or two of these." },
    },
    background = { { id = "tp_bg", text = "A senior member of the House of Nobles, with a library to think in. The rest is not the business of adventurers." } },
    advice = { { id = "tp_ad", text = "Never say yes on the first asking. People value what they have to wait for. Even refusals." } },
    defias = { { id = "tp_defias", text = "Bandits. A Westfall matter. I can't imagine why anyone in this city would trouble themselves over it." } },
    westfall = { { id = "tp_westfall", text = "Dust and complaints. The farms will recover, or they won't. The House can't plough fields for them." } },
    seven_kingdoms = { { id = "tp_seven", text = "Seven, then five, then fewer. Kingdoms come and go, but houses endure; noble ones, I mean." } },
    _none = { { id = "tp_none", text = "I'm sure I couldn't say. Ask a librarian; Sheaf is about somewhere." } },
  },
}

-- Dashel Stonefist: dwarf brawler in Old Town, the Missing Diplomat's rough middle.
P:NPC {
  key = "dashel", id = TODO_NPC("Dashel Stonefist"), name = "Dashel Stonefist",
  bible = "bibles/city3.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "brawler" }, values = { "proud" },
  notices = { "body", "drink" },
  impression = {
    first = "Dashel Stonefist asked what I was looking at in a tone that suggested any answer would end in a fight. I gather most of his evenings end that way, and he enjoys them.",
    third = "{name} met Dashel Stonefist, an Old Town brawler who settles his arguments with his fists.",
  },

  greetings = {
    { id = "g_fist", text = "What're you lookin' at? No, go on, I'm askin'. I like to know what folk are lookin' at before I hit 'em." },
    { id = "g_back", when = { metBefore = true }, text = "You! Ha, pull up a stool, but mind the leg, I broke it on a fella last week." },
  },

  notice = {
    { id = "n_big", cat = "body", when = { class = "WARRIOR" },
      text = "Now there's a pair o' shoulders. Fancy a round? Not o' drinks, mind, the other kind." },
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye're drunk. Good. Makes it fair, since I am too." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Would I? I've fought three guards an' a gnome wi' a wrench in one night, so a bear's only a bigger drunk wi' worse manners. Change right here an' we'll find out, unless ye're scared o' losin' in front o' Old Town." } },
      choices = {
        { text = "A druid's shapes aren't for tavern brawls, Fist.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Name the night, Fist, and bring your friends.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not trouble, more an understandin'. They don't pick my pockets, an' I don't pick them up by the ankles an' shake." } },
      choices = {
        { text = "A fair arrangement. Everyone should know where they stand.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Arrangements are made to be broken, Dashel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Twice, an' the second time I bit him, which a sheep's no' supposed to do. He bought me a drink after, so I reckon I won that one too." } },
      choices = {
        { text = "A mage who needs a spell to win a brawl isn't worth fighting.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A spell's just a fist you throw from further off.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once, up in Dun Morogh wi' my uncle, an' I punched a boar on the snout because I dropped my axe. It ran off, I lost two teeth, an' my uncle still tells the story at every wedding." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} o' yours looks like it could hold its own in a brawl. If it ever wants a go at the Pig an' Whistle, I'll see it gets a fair fight." },
      },
      choices = {
        { text = "I'd sooner settle things at a distance, friend.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Next time, I'll try the boar with my fists.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only when I'm losin', an' I don't lose much. Me old mam used tae say a prayer for every brawl I came home from, an' I reckon she wore out three hymnals before I was grown." } },
      choices = {
        { text = "Then I'll say one for you tonight, whether you win or lose.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A brawler earns his bruises. He doesn't need prayers for them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, ye fight, I've seen it, but ye fight fair, an' fair's a hard habit tae keep in Old Town. Somebody'll swing a bottle at ye from behind sooner or later, an' I'd like tae see what the Light says about that." } },
      choices = {
        { text = "I'll fight fair, Fist, even if the other man won't.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If a man swings from behind, I'll answer him the same way.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest? Ye'll have come tae patch me up, then, because I've a fight planned for tonight an' I'll want tae be fresh for the next one." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's someone who looks like they could take a punch, though I'd wager ye're not allowed tae throw one back." },
        { id = "h_default", text = "Dashel. Folk call me Fist, on account o' the fists. I drink in Old Town and I settle arguments in Old Town. Usually the same evening." },
        { id = "h_diplomat", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A diplomat? Never met one. Ask me again an' ye'll be askin' from the floor." },
        { id = "h_after", when = { questDone = TODO_QUEST("The Missing Diplomat"), heardLine = "dashel.h_diplomat" },
          text = "No hard feelings. Ye hit like a mule, an' I respect a mule, so buy me a drink an' we'll call it square." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Pig an' Whistle's still pourin'. That's the only clock I keep." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Did Ironforge send ye tae fetch me home? Tell 'em I'm busy, an' tell 'em I'm winnin'." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Old Town's full o' your lot, an' they all think they're clever. Try anythin' clever in here an' I'll show ye somethin' simple." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Go on, then, try that sheep spell on me, because the last fella who did it found me still punchin' when I came back." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'd do better wi' a pair o' fists in Old Town, but I'll not knock the bow, since it keeps folk well away from ye." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, is it? Folk say ye can turn intae a bear, an' I've always wanted tae know if I could take one in a fair fight." },
      },
      again = {
        { id = "h_again", text = "What else? Talk's thirsty work." },
        { id = "h_again2", text = "Aye? Make it quick or make it a fight." },
      },
      choices = {
        { text = "Why do you fight so much?", next = "fight" },
        { text = "Who are your friends?", next = "friends" },
        { text = "What's Old Town like?", next = "oldtown" },
        { text = "What was your part in it, Fist?", next = "plan", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "Fancy a round? The other kind.", next = "spar", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Do you have trouble with the rogues in Old Town?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Have you really been polymorphed, Dashel?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have you ever hunted, Dashel?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever ask anyone to pray for you, Fist?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why do you think paladins don't fight, Fist?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you really square up against a bear, Fist?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'm not looking for trouble.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Because nobody pays me to think. They pay me to stand in a door an' look unfriendly, an' it's honest work, mostly." } },
      choices = { { text = "Who pays you?", next = "who" }, { text = "Fair enough.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Folk who'd rather I didnae say. That's what the extra coin's for." } },
      choices = {
        { text = "I'll find out.", next = "BACK", fx = { trait = { brave = 1 } } }, { text = "Keep your secrets.", next = "BACK", fx = { affinity = 1 } },
        { text = "I asked who pays you, Fist. I won't ask nicely twice.", tag = "Intimidate", next = "who_coin",
          check = { pass = { any = { { minLevel = 30 }, { class = { "WARRIOR", "PALADIN" } }, { townStanding = { town = "stormwind", min = 55 } } } } },
          fail = { next = "who_laugh", fx = { affinity = -1 } } },
      },
    },
    friends = {
      lines = { { id = "fr_default", text = "The lads. Old Town's finest, by their own count. They come runnin' when I whistle an' they go home when I say. Mostly." } },
      choices = {
        { text = "Do they ever lose?", next = "friends_practice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends_practice = {
      lines = { { id = "fp_default", text = "Tae you, maybe, but they'd call it practice. They call everythin' practice, losin' especially." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    oldtown = {
      lines = { { id = "ot_default", text = "Oldest part o' the city. The orcs didnae burn it, so nobody rebuilt it, so nobody cleans it, but the best ale's here, an' the worst smell too." } },
      choices = {
        { text = "And SI:7, right next door?", next = "oldtown_si7" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldtown_si7 = {
      lines = { { id = "os_default", text = "Aye, the barracks, an' they watch me drink. I drink slower, out o' respect." } },
      choices = { { text = "Very considerate.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    plan = {
      lines = { { id = "pl_default", text = "My bit finished when the first plan went sour, thanks tae adventurers again. The second plan was a Menethil man they called Slim, so go an' bother him, no' me." } },
      choices = { { text = "Thanks, Fist.", next = "BACK", fx = { affinity = 1 } }, { text = "If you're lying, I'll be back.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    spar = {
      lines = { { id = "sp_default", text = "Ha! No' here, the guards get sniffy. But I like ye. That's rarer than ye'd think, an' it's free." } },
      choices = { { text = "Another time, then.", next = "BACK", fx = { affinity = 2 } } },
    },
    who_coin = {
      lines = {
        { id = "wc_default", text = "All right, all right, put that away. I never see 'em; the coin comes through a lad who's never the same lad twice, wrapped in good paper wi' clean boots on the feet that bring it, an' nobody in Old Town owns clean boots." },
        { id = "wc_after", text = "That's all I know, an' I made very sure it's all I know, because the last fella who asked the lad a question got found in the canal. So go easy, eh?" },
      },
      choices = {
        { text = "That'll do, Fist.", next = "BACK" },
        { text = "Clean boots. Somebody in the upper city, then.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    who_laugh = {
      lines = {
        { id = "wl_default", text = "Ha! Ye want tae try that wi' my lads watchin'? Go on, then, an' I'll buy the first round for whoever's still standin'." },
        { id = "wl_default2", text = "That's a good scowl ye've got, I'll grant ye, but I've been scowled at by better. The answer's still no." },
      },
      choices = {
        { text = "Another time, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear plenty in Old Town, mostly between the second ale an' the first punch. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "Came tae Stormwind, found the ale an' the arguments, stayed for both. That's the whole tale." } },
    advice = { { id = "tp_ad", text = "Hit first. If ye cannae hit first, hit last. Never hit in the middle." } },
    defias = { { id = "tp_defias", text = "Westfall lot, an' not my crowd. I work in the city, where the ale's better." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. D'ye want a fight instead?" } },
  },
}

-- Furen Longbeard: shieldsmith and armorsmith, Grimand Elmore's student.
P:NPC {
  key = "furen", id = TODO_NPC("Furen Longbeard"), name = "Furen Longbeard",
  bible = "bibles/city3.md", role = "blacksmith", tier = "quest",
  communities = { "stormwind" }, temper = { "earnest" }, values = { "craft", "loyal" },
  notices = { "kit", "craft" },
  impression = {
    first = "Furen Longbeard learned his trade from Grimand Elmore and is still learning it, as Elmore reminds him daily. He looks at a dent and sees the whole fight that made it.",
    third = "{name} met Furen Longbeard, Grimand Elmore's student, who forges shields meant to be trusted rather than admired.",
  },

  greetings = {
    { id = "g_shop", text = "Shields an' mail, made right. If it's got a dent, I'll take it out. If it's got a hole, I'll tell ye how ye got it." },
    { id = "g_back", when = { metBefore = true }, text = "Back wi' more dents, are ye? Let's see the damage, then." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state o' that! Who did this tae ye, a gnoll? It looks like a gnoll did it, so leave it wi' me." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Fellow smith. Ye'll know the master, then, by reputation if no' by temper. Everyone knows the temper." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nae armour grows, though Master Elmore says a good smith can make ye feel like it does. Yer people must have some charm for it, an' I'd love tae see how it's done before he catches me askin'." } },
      choices = {
        { text = "Ask Elmore first. Learn the craft properly, step by step.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Don't wait for Elmore's leave. Try it yourself tonight.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every one I've sold it tae has come back alive, which is more than I can say for the ones who wanted tae stay light. Elmore says it's no' proper work, but Elmore never had a knife come at him in an alley." } },
      choices = {
        { text = "Elmore's right that proper work is done the proper way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Tradition be hanged. If it keeps you alive, wear it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ye could, but it'd fight wi' every spell ye cast, or so the Quarter's lot tell me, an' I've no' the learnin' tae argue. I've often thought there's a fortune in it for whoever solves that, though." } },
      choices = {
        { text = "Some limits are there for good reason, Furen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every limit's only waiting for someone to break it, Furen.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, if ye stitch the rings tae padded leather an' oil 'em well, which Master Elmore says is more tailorin' than smithin'. Back in Ironforge the mountaineers want their mail quiet enough tae hear a ram's hoof on the snow." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} o' yours has got its own armour, more or less, an' better fitted than any I could make. Keep it fed an' it'll keep ye alive." },
      },
      choices = {
        { text = "Quiet armour and a steady aim. That's the way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Who cares about rattling? I'll shoot them before they hear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ye should wear what ye can, an' a bit o' padding under the cloth never hurt anyone. Elmore says priests are too proud tae wear mail, but I think they're just too busy keepin' everyone else alive tae think about themselves." } },
      choices = {
        { text = "My faith is my armour, Furen, but I'll take the padding.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith won't stop a blade. I'll wear the thickest cloth you have.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Whether ye stood your ground or turned tae run, mostly. A dent on the front means ye faced it, an' a dent on the back means ye didnae, an' I've seen more o' the back kind than I'd like on some o' the young knights." } },
      choices = {
        { text = "I'll keep my dents on the front, Furen, always.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sometimes a retreat saves more lives than a stand.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? I've mended more robes than ye'd think, for armour won't stop a dagger if the priest inside it won't wear any." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's a set o' plate I'd like a look at, because I can tell ye've been hit, an' I can tell ye didnae fall over." },
        { id = "h_default", text = "Furen Longbeard. Shields an' armour. I learned from Grimand Elmore, an' I'm still learning, which he tells me daily." },
        { id = "h_elmore", when = { heardLine = "elmore.h_default" },
          text = "Ye've met the master, then. Did he say anything about me? No? That means he's pleased, because when he's not pleased, he says a great deal." },
        { id = "h_shield", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Ye'll want a shield ye can trust, no' a pretty one, because pretty shields get folk killed." },
        { id = "h_stormpike", tags = { "news" }, when = { questActive = TODO_QUEST("Stormpike's Order") },
          text = "A letter from Loch Modan? Let's see it. A Stormpike wants a shield, which is good, for they're a proud clan an' they pay on time." },
        { id = "h_scalder", tags = { "news" }, when = { questActive = TODO_QUEST("The Shieldsmith") },
          text = "Is that Barleybrew Scalder? So Yorus sent ye, did he? Then I owe him, an' you'll have yer shield, so sit, sit." },
        { id = "h_mail", when = { questActive = TODO_QUEST("Fire Hardened Mail") },
          text = "Spider fangs from the Wetlands, chimaera horn from Stonetalon, an' that vial from the Kraul, an' I'll have the forge ready. Mind the chimaeras." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Leather, is it? I dinnae work leather, but I'll put a mail linin' in a jerkin if ye want somethin' that turns a knife." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Ye'll no' want my armour, then, an' I'll no' be offended, much." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, wantin' armour? Mail rattles in the bushes, ye ken, so I'll fit ye somethin' that sits quiet." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've never armoured one o' yer kind, since ye keep changin' shape on me, but I'd like tae try." },
      },
      again = {
        { id = "h_again", text = "Aye? What else needs fixin'?" },
        { id = "h_again2", text = "Go on, I'm listenin', since the hammer's restin' anyway." },
      },
      choices = {
        { text = "What's Elmore like to learn from?", next = "master" },
        { text = "Who orders from you?", next = "orders" },
        { text = "Why live so far from Ironforge?", next = "why_here" },
        { text = "Can you make me something harder than this?", next = "mail", when = { class = "WARRIOR", minLevel = 22 } },
        { text = "Can you fix this?", next = "BUSINESS" },
        { text = "Would a rogue really want mail under leather?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could a mage ever wear mail, Furen?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can a dwarf's armour be made quiet, Furen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a priest wear armour, Furen?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What can you tell from a paladin's dents, Furen?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could you fit armour that changes shape along with me, Furen?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    master = {
      big = true,
      lines = {
        { id = "m_default", text = "Hard. He makes ye hammer the same plate till the hundredth is right, then melts it an' says do another. Best thing that ever happened tae me." },
      },
      choices = {
        { text = "That's devotion.", next = "BACK", fx = { affinity = 2 } },
        { text = "That sounds miserable.", next = "miserable" },
        { text = "Does he know you're good?", next = "master_notes" },
      },
    },
    miserable = {
      lines = { { id = "mi_default", text = "Aye, it is. Misery's how the good stuff gets in. Ask any smith worth the name." } },
      choices = { { text = "I'll take your word.", next = "BACK" } },
    },
    master_notes = {
      lines = { { id = "mn_default", text = "I've a trick or two he hasnae seen. One day I'll write them down an' send them over. Then I'll hide behind the bellows." } },
      choices = { { text = "I'd pay to see his face.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    orders = {
      lines = { { id = "o_default", text = "The Stormpikes, mostly, up in Loch Modan. Mountaineers write all the way down here for a Longbeard shield. Makes a dwarf proud." } },
      choices = {
        { text = "Why yours?", next = "orders_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_why = {
      lines = { { id = "ow_default", text = "Because mine have never come back split. Well, once, but we dinnae talk about once." } },
      choices = { { text = "Now I want to know.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    why_here = {
      lines = { { id = "wh_default", text = "The master's here, so I'm here. An' Stormwind's walls are new. New walls need good shields behind them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mail = {
      lines = { { id = "ma_default", text = "Aye, if ye'll fetch the makings for fire-hardened mail: spider fangs, chimaera horn, an' worse. It's a long list an' a longer road." } },
      choices = { { text = "I'll fetch them.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Elmore's student. That's the only part that matters, an' he'd say it doesnae matter much yet.", next = "master" } },
    advice = { { id = "tp_ad", text = "Check yer straps before every fight. A good shield on a bad strap is a lid on a pot." } },
    _none = { { id = "tp_none", text = "Ask the master, if ye dare." } },
  },
}

-- Topper McNabb: beggar behind the Auction House, once a farmer, never short of a story.
P:NPC {
  key = "topper", id = TODO_NPC("Topper McNabb"), name = "Topper McNabb",
  bible = "bibles/city3.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "dramatic" }, values = { "hopeful" },
  notices = { "wealth", "kit" },

  barks = {
    { id = "b_spare", text = "A copper for an honest man! Or a dishonest one, I'm not proud!" },
    { id = "b_shine", text = "Armour shined, two coppers! One copper if you don't look too closely!" },
  },
  impression = {
    first = "Topper McNabb was a farmer once and begs behind the Auction House now, and he has a generous word for every passer-by. He told me I have a generous face, and I suspect he tells everyone.",
    third = "{name} met Topper McNabb, a cheerful beggar behind the Auction House who used to work a farm.",
  },
  greetings = {
    { id = "g_coin", text = "Friend! That's a kind face, a generous face. Has anyone ever told you you've a generous face?" },
    { id = "g_back", when = { metBefore = true }, text = "My favourite benefactor returns! I've told everyone about you, though nobody believed me." },
  },

  notice = {
    { id = "n_rich", cat = "wealth", when = { money = { min = 1000000 } },
      text = "Oh, that purse is heavy, I can hear it from here. It's calling to me, and it's saying 'Topper'." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Rough day? I know rough days; I've had nothing but, since the farm. Sit down, though not too close, because you smell like a fight." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They could, if the Defias stopped burning them and the rain remembered where Westfall is. I go back in my head every night and plough the same furrow, and in the morning I'm still behind the Auction House." } },
      choices = {
        { text = "Westfall needs the Crown's soldiers before it needs farmers again.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Go back yourself, Topper. Waiting on the Crown won't plough anything.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a loaf, and I got caught before I'd eaten half of it, which taught me I was a farmer and not a thief. I've begged ever since, because at least the guards only laugh at a beggar." } },
      choices = {
        { text = "Begging's more honest than thieving, Topper, so you chose well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You were only caught once. You could have learned the trade.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It's bread, isn't it, and bread's bread, though I've heard it sits in your belly like a promise from the House of Nobles. I'd still take it, because an hour's a long time when you're hungry." } },
      choices = {
        { text = "A hungry man deserves real bread, not a spell.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Conjured or not, a meal's a meal, so take what you can.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A pitchfork, once, when the orcs came through Elwynn in the First War and we all thought we'd be heroes. I ran, if you want the truth, and I've never been ashamed of it, because I'm still here to sit on this bench." } },
      choices = {
        { text = "There's no shame in living, Topper.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Running is never right when others are standing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rabbits for the pot and foxes when they came for the hens, and I was never much good at either. My wife was the shot in our house; she could take a pheasant at fifty paces with a borrowed bow." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's a fine beast, that {pet}. We had a dog once that would have chased it right up a tree and then sat under it barking until supper." },
      },
      choices = {
        { text = "A farm's beasts deserve protecting from the foxes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The fox is only doing what it was made to do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, for the crops I'll never see again and the neighbours who stayed when I left. I don't know that anyone's listening, but it's a habit, and an old man needs his habits." } },
      choices = {
        { text = "Someone is listening, Topper. Keep praying.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If no one answers, maybe it's time to stop asking.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Drive the Defias out of Moonbrook, give the farms back to the folk who worked them, and make the nobles pay what they owe. I know it's not so simple, but you did ask, and an old man's allowed his dreams." } },
      choices = {
        { text = "Westfall deserves justice. I'll go and fight for it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The People's Militia can handle it. Westfall must save itself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, with a generous face if ever I saw one. Spare a blessing for an old farmer, {class}, because it costs you nothing and it warms me through." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I always did think the Silver Hand would come to Westfall one day and put things right, and I'm still sitting here waiting for it." },
        { id = "h_default", text = "Topper McNabb, at your service, and a farmer once. Now I sit here and let the city walk past, and it never stops, but it rarely tips." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Bless me, would you, holy one? Go on, because I've been told I need it, mostly by the guards." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Now, I know that look, friend, because I had it myself in the lean year after the farm. Don't do it, because the Stockade's colder than the street." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Could you conjure me a bit of bread, friend? I hear your lot can make it out of nothing, and nothing's exactly what I have." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, walking by. I've watched a thousand soldiers go past this spot, and you lot always walk a little straighter going out than coming home." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You've the farm look about you, a bit, and I like that. Most of the city lot couldn't find a rabbit in a hutch." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and a kind face too. I had a field once, friend, and I'd have given anything for someone who could make the wheat come up in a dry year." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? I've all day, and I've had all day for years." },
        { id = "h_again2", text = "Still here? Wonderful, because company's free." },
      },
      choices = {
        { text = "What happened to your farm?", next = "farm" },
        { text = "Here's a coin.", next = "coin", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "I lost a farm too, to the Defias.", next = "farmer", when = { origin = "human_westfall_farmhand" } },
        { text = "Did you ever steal, Topper?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would conjured bread really fill you up?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Did you ever carry a sword yourself, Topper?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Did you hunt back on your farm, Topper?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you still pray, Topper, after losing the farm?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have the Silver Hand do for Westfall?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could your Westfall fields still grow again, Topper?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    farm = {
      big = true,
      lines = {
        { id = "f_default", text = "Orcs burned it. Or the army built a guard tower right in front of it and the orcs came for the tower. Either way, I got the fire and the army got a medal." },
      },
      choices = {
        { text = "That's a hard story.", next = "BACK", fx = { affinity = 1 } },
        { text = "Is any of that true?", next = "truth" },
      },
    },
    truth = {
      lines = { { id = "t_default", text = "Some of it, depending on who's paying. If you're paying, then it's all true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    coin = {
      lines = { { id = "c_default", text = "Bless you! I'll spend it wisely, on bread, probably bread, or possibly ale, but bread-adjacent ale." } },
      choices = { { text = "Take care, Topper.", next = "END" }, { text = "Something else.", next = "BACK" } },
    },
    farmer = {
      lines = { { id = "fa_default", text = "Did you! Then you know, because nobody tells it right, the losing of a farm. You tell me yours sometime and I'll tell you mine, though mine's got more orcs." } },
      choices = { { text = "Mine's got more thieves.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Farmer, then not. The middle bit changes depending on who's listening and what they've got in their purse.", next = "farm" } },
    advice = { { id = "tp_ad", text = "Never build your house in front of anyone's tower; that one's free. The rest costs a copper." } },
    defias = { { id = "tp_defias", text = "They asked me to join, once, and I said I'd think about it. I'm still thinking, and it's very restful, thinking." } },
    _none = { { id = "tp_none", text = "I know nothing, friend. But for a copper I'll know something." } },
  },
}

-- Warden Thelwater: runs the Stockade, and would like the riots never mentioned again.
P:NPC {
  key = "thelwater", id = TODO_NPC("Warden Thelwater"), name = "Warden Thelwater",
  bible = "bibles/city3.md", role = "guard", tier = "quest",
  communities = { "stormwind" }, temper = { "anxious" }, values = { "self-preserving" },
  notices = { "soldier", "stealth" },
  impression = {
    first = "Warden Thelwater keeps Stormwind's worst beneath its canals and would very much like the recent trouble never mentioned again. He has the look of a man who has stopped opening his letters.",
    third = "{name} met Warden Thelwater of the Stockade, an anxious man who would rather nobody heard about his lower tiers.",
  },

  greetings = {
    { id = "g_quiet", text = "Yes? Quickly, and quietly, please, because everything about this place should be quiet, especially lately." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you, good. No, I mean it: you're the only one who's ever made things better down there." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Don't. Whatever you're thinking of doing, don't. I've enough people trying to get out without people trying to get in." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not much, since they're under the canals, and I'd not let a prisoner near a window if I had one. A few of the lads have taken to growing moss on the walls for company, and I let them, because it keeps them quiet." } },
      choices = {
        { text = "The cells are for punishment, Warden. They needn't be pleasant.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No creature should live without sky. Let them out to see it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A thief from the Lamb's crowd, and when we took him, his imp set the straw alight in three cells at once. We hold warlocks in the deepest cells now, chained and gagged, and I still don't sleep." } },
      choices = {
        { text = "Chains and gags are wise, Warden. Better safe than burned.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Treat them like any other prisoner, Warden. Chains breed fury.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Short of good men, which is worse, because half the guards I've got would sell a cell key for a pint. The prisoners know it, and the Defias inside talk to the Defias outside more than I'd like." } },
      choices = {
        { text = "Then you need honest guards. I'd serve if asked.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Pay them better and they'll stop selling keys.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once or twice, through the canals, and every time we've had to send hunters into the sewers to bring them back. A man on the run leaves a trail even in the dark, and a good tracker can follow it right to his door." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours could find a man in the sewers faster than my guards, I'd bet. Keep it in mind; I may come asking." },
      },
      choices = {
        { text = "I'd track an escaped prisoner for the city.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Escaped prisoners aren't my concern. Let your guards earn their pay.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "As well as Stormwind can afford, which isn't well, and better than most of them deserve. Some are thieves who'll be out by spring, and some are Defias who'd cut my throat for the keys, and I can't always tell which is which." } },
      choices = {
        { text = "Even a prisoner deserves mercy, Warden.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Defias get what they gave. Keep them hard.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. If you're here about the riot, it's been dealt with, and if you're here about the prisoners, they've been dealt with too." },
        { id = "h_default", text = "Warden Thelwater, of the Stockade. I keep Stormwind's worst under its canals most days, and the other days I'd thank you not to mention." },
        { id = "h_thredd", tags = { "news" }, when = { questActive = TODO_QUEST("Bazil Thredd") },
          text = "Thredd, the Defias' man inside, is behind all of it, I'm certain. Deal with him, and nobody has to write a report, please." },
        { id = "h_riots", tags = { "news" }, when = { questActive = TODO_QUEST("The Stockade Riots") },
          text = "They're loose on the lower tiers again, and if the Captain finds out, I'm finished. So he won't find out, will he?" },
        { id = "h_visitor", when = { questActive = TODO_QUEST("The Curious Visitor") },
          text = "Thredd's had a visitor, a strange one. Nobody signed him in, and nobody can tell me what he looked like, so I'd very much like to know who he was." },
        { id = "h_darkshire", when = { heardLine = "millstipe.h_ward" },
          text = "Darkshire writes to me about one of my prisoners. The House of Nobles writes to me about the same prisoner. I've stopped opening either." },
        { id = "h_mac", when = { questActive = TODO_QUEST("The Color of Blood") },
          text = "Nikova sent you, Mac's grandmother. He was fourteen, and a guard because the men had gone to the front, so don't say anything; just get her what she asked for." },
        { id = "h_quiet", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Stockade Riots"), days = 3 } },
          text = "Thredd's dead and the cells are filling back up, quietly. I'm sleeping again, badly, but again." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Half my guards could use a priest, and the other half need a better excuse than the one they gave the Captain." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Oh, thank the Light, it's you. You're the one person in this city I'm actually glad to see coming down those stairs." },
        { id = "h_canals", when = { origin = "human_canal_pickpocket" },
          text = "I know your face from the canal sweeps, years back; you were too small to keep and too quick to catch. Don't make me regret letting you go, please, not this week." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Please don't summon anything in here. I've had a warlock in the cells before, and the thing he called up didn't care which side of the bars it was on." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. If you're here to sign on with the Stockade guard, I've a place for anyone who can stand a long shift and a bad smell." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Don't bring the beast near the Stockade gate; the prisoners bang on the bars at anything with four legs." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the Stockade. The prisoners will want to see you turn into something, so please don't; they've had trouble enough this season." },
      },
      again = {
        { id = "h_again", text = "Yes, what else? Be quick about it, please." },
        { id = "h_again2", text = "Something more? Not too loudly." },
      },
      choices = {
        { text = "What happened in the Stockade?", next = "riots" },
        { text = "Who do you keep down there?", next = "cells" },
        { text = "Who was Thredd's visitor?", next = "visitor", when = { questDone = TODO_QUEST("The Stockade Riots") } },
        { text = "Your prisoners could use a priest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I've seen the inside of a cell or two, Warden.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Who was the warlock in your cells?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is the Stockade guard short of men, Warden?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have prisoners ever escaped the Stockade, Warden?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How are the Stockade's prisoners treated, Warden?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Stockade's cells ever see daylight, Warden?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'll be discreet.", next = "END", fx = { affinity = 2 } },
      },
    },
    riots = {
      big = true,
      lines = {
        { id = "r_default", text = "Nothing happened, only a small disturbance. Some prisoners are out of their cells and some of my guards are, well... it's being handled, by you, I hope." },
      },
      choices = {
        { text = "I'll handle it.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Your prisoners can sort themselves out, Warden.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You should tell someone.", next = "tell" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "I am telling someone: I'm telling you. You seem very capable and very unlikely to file anything." } },
      choices = {
        { text = "And the Captain?", next = "tell_captain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tell_captain = {
      lines = { { id = "tc_default", text = "The Captain hears the Stockade lost its own prisoners, and I'm guarding a fishmonger's cart by the end of the week, if I'm lucky. So he'll hear it's handled." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } }, { text = "He deserves the truth.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } } },
    },
    cells = {
      lines = { { id = "ce_default", text = "Thieves, murderers, insurgents, and a few the House of Nobles would rather keep breathing. Targorr the Dread, for one, a Blackrock executioner sentenced and still waiting.",
        fx = { learn = { "blackrock" } } } },
      choices = {
        { text = "Why is he still alive?", next = "cells_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cells_hold = {
      lines = { { id = "ch_default", text = "Ask the nobles, because every time the rope's ready, a letter arrives. It's the same with Dextren Ward, who sold Raven Hill's dead to a necromancer, and Darkshire wants his hand." } },
      choices = {
        { text = "Robbing graves. The dead deserve better.", next = "BACK", when = { class = "PRIEST" }, fx = { align = { light = 1 } } },
        { text = "The dead don't need their bodies, so let the man go.", next = "BACK", when = { class = "PRIEST" }, fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
        { text = "Whose seal is on those letters, Warden? Or shall I ask the Captain?", tag = "Intimidate", next = "cells_seal",
          check = { pass = { any = { { minLevel = 35 }, { class = { "WARRIOR", "ROGUE" } }, { townStanding = { town = "stormwind", min = 55 } } } } },
          fail = { next = "cells_nerve", fx = { affinity = -1 } } },
      },
    },
    visitor = {
      lines = { { id = "v_default", text = "Maelik, his papers said, and he came once or twice a week for months, after years of nobody. His papers were in perfect order, and that should have told me something." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    priest = {
      lines = { { id = "p_default", text = "Minister to them? Half would steal your vestments and the other half would confess to crimes they didn't do, for the company." } },
      choices = {
        { text = "Is there anyone who'd want a prayer?", next = "priest_mac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_mac = {
      big = true,
      lines = { { id = "pm_default", text = "One. Mac, a guard of fourteen, stopped them tearing blankets into red scarves, and one of them stabbed him for it. Say one for him, if you're saying them." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Prayers won't help Mac now, but justice for his killer might.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    cells_seal = {
      big = true,
      lines = {
        { id = "cs_default", text = "No, no, don't go to the Captain, please. They come under the House of Nobles' seal, unsigned, always on good paper, and always the day before the rope's ready, as though somebody upstairs keeps my calendar." },
        { id = "cs_after", text = "The warden before me asked who wrote them, and he's counting sheep on a Westfall watchtower now. So I don't ask, and I'd be very grateful if you didn't say I told you." },
      },
      choices = {
        { text = "Your name stays out of it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Somebody should be asking.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    cells_nerve = {
      lines = {
        { id = "cn_default", text = "Ask the Captain whatever you like, and he'll tell you the Warden of the Stockade follows his orders and the House's, which I do. I'm nervous, not a fool." },
        { id = "cn_default2", text = "You'll forgive me, but I've been threatened by better men than you this month, and most of them are in a cell. The letters are the House's business, not yours." },
      },
      choices = {
        { text = "Fine. Something else.", next = "BACK" },
        { text = "I'll leave it for now.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "rogue_l", text = "Not mine, I hope, or I'd have to write a report about how you got out. Which locks, if you don't mind my asking, purely so I can change them?" } },
      choices = {
        { text = "The north block. The hinges are rusted.", next = "rogue2", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A rogue never tells, Warden.", next = "rogue2", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
    rogue2 = {
      lines = { { id = "rogue2_l", text = "Lovely. Wonderful. I'll add it to the list of things I can't afford to fix and can't tell the Captain about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A warden hears everything the cells whisper, though he'd rather not. Ask me about any of this, quietly, and I'll tell you what won't get me reassigned." },
    },
    background = { { id = "tp_bg", text = "Warden of the Stockade. Before that, a man who thought being warden would be quiet. Never take a job for its quiet." } },
    advice = { { id = "tp_ad", text = "Check the papers, then check the person, and then check the papers again. I didn't, once." } },
    defias = { { id = "tp_defias", text = "Half my cells are full of them, and the other half of their friends. They organise better in prison than the guards do outside it." } },
    _none = { { id = "tp_none", text = "That's not a Stockade matter, thank the Light." } },
  },
}
