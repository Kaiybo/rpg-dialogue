-- Stormwind, part three: a lord in the library, a brawler in Old Town, Elmore's student
-- and the man who'd rather nobody heard about the Stockade.
-- Voice: bibles/city3.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lord Gregor Lescovar. Canon secret: he works with the Defias. He never says so.
P:NPC {
  key = "lescovar", id = TODO_NPC("Lord Gregor Lescovar"), name = "Lord Gregor Lescovar",
  bible = "bibles/city3.md", role = "noble", tier = "quest",
  communities = { "stormwind" }, temper = { "smooth" }, values = { "proud", "ambitious" },
  notices = { "deed", "status", "lock_soulstone" },
  impression = {
    first = "His courtesy feels like being weighed on a merchant's scale.",
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
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { class = "WARLOCK", carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "You carry a soulstone, I see, and that is a rare kind of insurance, a life held in reserve. Men in the House would pay handsomely for one, and a few of them would even use it on themselves." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The House of Nobles thinks most things useful until they become inconvenient. You will find that true of more than shamans here." } },
      choices = {
        { text = "The House should keep its word to those who serve it.", next = "BACK", reply = "It should, and on the days it remembers to, it does. I'd not hold my breath in this chamber, though.", fx = { align = { order = 1 } } },
        { text = "Inconvenience cuts both ways, my lord. Remember that.", next = "BACK", reply = "Oh, I always do. It's the first thing a lord learns, and the last thing most of them forget.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The House of Nobles has use for anyone who understands that power is a matter of who owes whom, and your sort understand that better than most. I would never say so in the chamber, of course, but a quiet word to a quiet man can open doors that a herald never could." },
        { id = "xlock_more1", text = "Lady Prestor says much the same, though she says it more prettily than I do." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The House of Nobles has use for anyone who understands that power is a matter of who owes whom, and a man who commands a creature like that one understands it better than most. I would never say so in the chamber, of course, and I'd ask you to leave it outside when we speak again, because my servants gossip." },
      },
      choices = {
        { text = "I'll keep my power where the law can see it, my lord.", next = "BACK", reply = "How admirably proper of you. The law sees a great deal less than you'd think, but I respect the sentiment.", fx = { align = { order = 1 } } },
        { text = "Then remember my name, my lord, when you need a quiet man.", next = "BACK", reply = "I've a long memory for useful names, and yours is now among them. Do keep it clean until I call.", fx = { align = { order = -1 } } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The House welcomes anyone who costs it nothing, and the kaldorei have not yet sent us a bill. When they do, I expect we'll learn how deep the friendship runs." } },
      choices = {
        { text = "My people keep their word, and we expect the same of Stormwind.", next = "BACK", reply = "How refreshing. I'll remember you said so when the House next debates how much Darnassus is worth to us.", fx = { align = { honor = 1 } } },
        { text = "Then my people should send that bill soon, my lord.", next = "BACK", reply = "And then the House will discover a sudden interest in economy, I suspect. Do warn me first, would you?", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Shaw, I imagine, or someone in the House who owes him a favour, which is everyone eventually. Tell them I read history, mostly, because history is where the House keeps its debts." } },
      choices = {
        { text = "I answer to the crown, my lord, not to anyone's favours.", next = "BACK", reply = "Admirable. The crown is lucky to have such loyal servants, and so few of them are in this room.", fx = { align = { order = 1 } } },
        { text = "I answer to nobody, my lord, and nobody sent me.", next = "BACK", reply = "Nobody, of course. I'll pretend to believe you, and you'll pretend to believe that I read history.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The House trusts whoever pays its bills, and Dalaran has never once offered to pay for anything in Stormwind. Lady Prestor says the crown must keep its friends close and its creditors closer, and I find she's usually right." } },
      choices = {
        { text = "Friendship shouldn't be measured in coin, my lord.", next = "BACK", reply = "In an ideal world, no. In the House of Nobles, everything is measured in coin, even sentiment.", fx = { align = { honor = 1 } } },
        { text = "Coin is the only friendship that lasts, my lord.", next = "BACK", reply = "You'd do well in the House, you know. Lady Prestor would find you quite charming.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It values them as one values a good wall, which is to say it notices them only when they fail. I find that a little unjust, though I've never said so in the chamber, and I don't expect I shall." } },
      choices = {
        { text = "Then someone in the House should say it, my lord.", next = "BACK", reply = "Perhaps one day someone will. It won't be me, I'm afraid; walls are rarely thanked by those they shelter.", fx = { align = { honor = 1 } } },
        { text = "Soldiers are paid to be walls. Walls don't complain.", next = "BACK", reply = "How very practical of you, though I'd not say so in front of the Barracks. They throw things.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very little, unless it touches their estates or their rents. The Westfall farms might all burn tomorrow and the chamber would still argue first about who owns the ash." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Very little, unless it touches their estates or their rents. Is that {pet} trained? Good." },
      },
      choices = {
        { text = "The kingdom is more than the nobles' estates, my lord.", next = "BACK", reply = "It is, though the chamber prefers not to be reminded. Do come and say so during session; I'd enjoy the faces.", fx = { align = { honor = 1 } } },
        { text = "Land is land. Whoever holds it should profit from it.", next = "BACK", reply = "You'd make a fine lord, friend. It's a pity your family wasn't in the right room when the land was handed out.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It cares deeply in public, and very little in the cloakroom afterwards. The Archbishop spoke for the Stonemasons, and the House listened politely and then did exactly what it had already decided, which is the House's great talent." } },
      choices = {
        { text = "The masons were wronged, my lord, and the Church won't forget it.", next = "BACK", reply = "The Church never forgets anything, which is its greatest charm and its most tiresome habit.", fx = { align = { light = 1 } } },
        { text = "The Church should keep out of the House's affairs, my lord.", next = "BACK", reply = "My thoughts exactly, though His Grace would disagree with us both. Do tell him I said hello.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A few old names who remember Lordaeron, and a great many more who remember what the paladins cost to keep. The House prefers its heroes in statues, I'm afraid, where they're very much cheaper." } },
      choices = {
        { text = "Honour isn't bought, my lord. The House would do well to remember it.", next = "BACK", reply = "Honour isn't bought, no, but it's very expensive to maintain. The House has done its sums.", fx = { align = { honor = 1 } } },
        { text = "Paladins should earn their keep like anyone else, my lord.", next = "BACK", reply = "A sensible paladin, at last. You'll find the House far friendlier than your brethren have.", fx = { affinity = 1, align = { honor = -1 } } },
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
          text = "Baros Alexston told you his sad story, I see. He kept his post and Edwin VanCleef kept his pride, and both have done rather well out of the arrangement." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've been looking at my satchel since you came in. It contains nothing of interest, which you may tell whoever asked." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, in the Royal Library. Let me guess that Dalaran wants a book back, and the Kirin Tor are too grand to ask in person." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in the garden. Do try not to trample the hedges; the House of Nobles takes its gardens more seriously than its soldiers." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, back from the countryside. I suppose you see a good deal more of the kingdom than the House does." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid, in the Royal Library. The kaldorei have been very gracious to the crown, and I've always wondered what a people so old expect in return." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Someone from beneath the Lamb, in the Royal Library? How unexpected, and how very interesting, since your sort rarely come up from the Mage Quarter in daylight." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. How novel. Ironforge sends us all sorts these days, and I suppose some of them must be useful." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I do have reading to do." },
        { id = "h_again2", text = "Yes? Briefly, please; silence is the whole point of a library." },
      },
      choices = {
        { text = "The House of Nobles seems troubled.", next = "house" },
        { text = "What does the House make of the Defias?", next = "masons" },
        { text = "Why read here, my lord?", next = "library" },
        { text = "The Church says the masons were wronged.", next = "church", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "The Defias took my family's farm.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I found papers in the Deadmines.", next = "papers", when = { deed = "dungeon:The Deadmines" } },
        { text = "You seem to think someone sent me, my lord.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I doubt the House of Nobles trusts Dalaran, my lord.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the House of Nobles value its soldiers, my lord?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would the House want to know of the countryside, my lord?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the House of Nobles care what the Church thinks, my lord?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the Silver Hand have friends in the House, my lord?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the House of Nobles welcome the night elves, my lord?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the nobles ever have use for someone with quiet talents, my lord?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the nobles think shamans useful, Lord Lescovar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },
    house = {
      lines = {
        { id = "ho_default", text = "Money, mostly. The kingdom spends like a king while the King isn't here, and someone has to say no, which I find I'm very good at." },
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
      lines = { { id = "rq_default", text = "Their riot killed a queen. Tiffin went into the street to calm them and someone threw a stone. Their wages do not move me as they seem to move you." } },
      choices = {
        { text = "That was one hand, not a whole guild.", next = "BACK", reply = "One hand, from one crowd, shouting one grievance. Forgive me if I don't parse the difference while I remember her.", fx = { affinity = -1, align = { honor = 1 }, opinion = { defias = "masons_wronged" } } },
        { text = "I didn't know.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then the masons got what they had coming.", next = "BACK", reply = "You're kinder to my opinion than I am, friend. Some days I wonder whether the queen would agree.", fx = { align = { honor = -1 } } },
      },
    },
    library = {
      lines = { { id = "li_default", text = "Because no one shouts in a library. I come to meditate. The guards know to leave me be, and Milton Sheaf, the librarian, knows better than to recommend me books." } },
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
        { text = "He's said so in the Keep, at least.", next = "BACK", reply = "In the Keep, where words cost nothing. I'll believe him when he pays his share.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Then His Grace is no better than the rest of you.", next = "BACK", reply = "No better, and no worse, and a great deal more pious about it. That's the whole of it.", fx = { align = { light = -1 } } },
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
    prestor = { { id = "tp_prestor", text = "Lady Prestor is the finest mind in the House of Nobles, and the Regent is lucky to have her counsel. We see eye to eye on most matters, and the ones we don't, she usually persuades me." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord is a soldier, and soldiers are not trained for the subtleties of a council chamber. He means well, I'm sure, but he relies on wiser heads than his own, and wisely." } },
    stonemasons = { { id = "tp_stonemasons", text = "The Stonemasons' Guild made demands the treasury couldn't meet, and the House of Nobles made the only sensible decision. That they chose to turn to banditry is their own affair, not mine." } },
    syndicate = { { id = "tp_syndicate", text = "I've heard the name Syndicate, but I've no dealings with Alterac's fallen houses, I assure you. Those who claim otherwise are slanderers with their own agendas." } },
    varian = { { id = "tp_varian", text = "We all pray for King Varian's return, of course, and I pray as fervently as anyone. Still, the kingdom must be governed in the meantime, and someone must make the difficult decisions." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's troubles are the city guard's affair, not the House of Nobles'. I'd advise anyone thinking of interfering to let the guards handle it, for their own safety." } },
    knows = {
      { id = "tp_knows", text = "A lord of the House hears all manner of things, and repeats very little to strangers. Still, I might indulge you on one or two of these." },
    },
    background = { { id = "tp_bg", text = "A senior member of the House of Nobles, with a library to think in. The rest is not the business of adventurers." } },
    advice = { { id = "tp_ad", text = "Never say yes on the first asking. People value what they have to wait for. Even refusals." } },
    defias = { { id = "tp_defias", text = "The Defias are bandits and a Westfall matter, and I can't imagine why anyone in this city would trouble themselves over them." } },
    westfall = { { id = "tp_westfall", text = "Westfall is dust and complaints. The farms will recover or they won't, and the House can't plough fields for them." } },
    seven_kingdoms = { { id = "tp_seven", text = "The Seven Kingdoms became five, and then fewer. Kingdoms come and go, but houses endure; noble ones, I mean." } },
    _none = { { id = "tp_none", text = "I'm sure I couldn't say. Ask a librarian; Milton Sheaf is about somewhere." } },
  },
}

-- Dashel Stonefist: dwarf brawler in Old Town, the Missing Diplomat's rough middle.
P:NPC {
  key = "dashel", id = TODO_NPC("Dashel Stonefist"), name = "Dashel Stonefist",
  bible = "bibles/city3.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "brawler" }, values = { "proud" },
  notices = { "body", "drink", "lock_pact" },
  impression = {
    first = "Most of his evenings end in a fight, and he enjoys them.",
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
      text = "Ye're drunk? Good, that makes it fair, since I am too." },
    { id = "n_lock_pact", cat = "lock_pact", when = { class = "WARLOCK", aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You've a heat coming off you like a man about to throw the first punch, and I know that look, because I wear it most evenings. It's your imp's doing, is it? Then I'll not take it personal." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "My fists dinnae lie tae me, an' yer spirits might, for all I know. Still, I can respect a dwarf who stands his ground." } },
      choices = {
        { text = "Fight fair, Dashel, and I'll stand beside you any day.", next = "BACK", reply = "Fair? Fair's a funny word in Old Town, but I'll give it a go for you, friend.", fx = { align = { honor = 1 } } },
        { text = "Fists are honest enough. I'll buy you the next round.", next = "BACK", reply = "Now that's the right answer! Barkeep, two pints, an' this one's on my new friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd pick a fight with a door if it looked at me wrong, and that wee thing o' yours has got a very rude face. Mind, I'd not swing at you, because I've seen what one of your lot did to a lad in the Pig and Whistle, and he was green for a week." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'd pick a fight with a door if it looked at me wrong, and your {pet}'s been looking at me wrong since you walked in. Mind, I'd not swing at you, because I've seen what one of your lot did to a lad in the Pig and Whistle, so tell it to keep its eyes to itself before I forget that." },
      },
      choices = {
        { text = "Leave my little friend be, Dashel, and we'll get on fine.", next = "BACK", reply = "Done, so long as it stops makin' faces at me. Deal's a deal, friend.", fx = { align = { honor = 1 } } },
        { text = "Swing at it, Fist. I'd love to watch what it does back.", next = "BACK", reply = "Ha! Ye'd like that, would ye? I'd lose an eyebrow an' ye'd never stop laughin'.", fx = { align = { honor = -1 } } },
        { text = "Something else, Dashel.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Would I? I've fought three guards an' a gnome wi' a wrench in one night, so a bear's only a bigger drunk wi' worse manners. Change right here an' we'll find out, unless ye're scared o' losin' in front o' Old Town." } },
      choices = {
        { text = "A druid's shapes aren't for tavern brawls, Fist.", next = "BACK", reply = "Spoilsport. Still, I'd nae fancy a bear sittin' on me while the guards watched.", fx = { align = { honor = 1 } } },
        { text = "Name the night, Fist, and bring your friends.", next = "BACK", reply = "Now that's a night I'll be lookin' forward to. Bring yer biggest friend, an' I'll bring my biggest fist.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not trouble, more an understandin'. They don't pick my pockets, an' I don't pick them up by the ankles an' shake." } },
      choices = {
        { text = "A fair arrangement. Everyone should know where they stand.", next = "BACK", reply = "Exactly. Everyone knows where they stand, an' nobody gets shook. It's civilised, almost.", fx = { align = { order = 1 } } },
        { text = "Arrangements are made to be broken, Dashel.", next = "BACK", reply = "Then ye'll be the one bein' shook, friend, an' I'll not be gentle about it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Twice, an' the second time I bit him, which a sheep's no' supposed to do. He bought me a drink after, so I reckon I won that one too." } },
      choices = {
        { text = "A mage who needs a spell to win a brawl isn't worth fighting.", next = "BACK", reply = "Too right! I'd sooner fight a man who bleeds the same as me.", fx = { align = { honor = 1 } } },
        { text = "A spell's just a fist you throw from further off.", next = "BACK", reply = "A fist from further off is still cowardly, friend, an' I'll keep sayin' so till someone buys me a drink.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once, up in Dun Morogh wi' my uncle, an' I punched a boar on the snout because I dropped my axe. It ran off, I lost two teeth, an' my uncle still tells the story at every wedding." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Once, up in Dun Morogh wi' my uncle, an' I punched a boar on the snout because I dropped my axe. That {pet} o' yours looks like it could hold its own in a brawl. If it ever wants a go at the Pig an' Whistle, I'll see it gets a fair fight." },
      },
      choices = {
        { text = "I'd sooner settle things at a distance, friend.", next = "BACK", reply = "Distance is for cowards an' archers, an' ye're welcome tae be both. I'll stick tae my knuckles.", fx = { align = { order = 1 } } },
        { text = "Next time, I'll try the boar with my fists.", next = "BACK", reply = "Ha! There's the spirit. Bring yer teeth back in a bag, an' I'll show ye mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only when I'm losin', an' I don't lose much. Me old mam used tae say a prayer for every brawl I came home from, an' I reckon she wore out three hymnals before I was grown." } },
      choices = {
        { text = "Then I'll say one for you tonight, whether you win or lose.", next = "BACK", reply = "Ye'd do that? Me old mam would've liked ye. I'll try an' win, so it's no' a wasted prayer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A brawler earns his bruises. He doesn't need prayers for them.", next = "BACK", reply = "That's the truth, an' I've earned more than most. Still, I'll take a prayer if it's free.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, ye fight, I've seen it, but ye fight fair, an' fair's a hard habit tae keep in Old Town. Somebody'll swing a bottle at ye from behind sooner or later, an' I'd like tae see what the Light says about that." } },
      choices = {
        { text = "I'll fight fair, Fist, even if the other man won't.", next = "BACK", reply = "Then ye'll get hit from behind, but ye'll go down a better man than me. I'll watch yer back.", fx = { align = { honor = 1 } } },
        { text = "If a man swings from behind, I'll answer him the same way.", next = "BACK", reply = "Now ye're learnin' Old Town! Just don't tell yer Cathedral I taught ye.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest? Ye'll have come tae patch me up, then, because I've a fight planned for tonight an' I'll want tae be fresh for the next one." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's someone who looks like they could take a punch, though I'd wager ye're not allowed tae throw one back." },
        { id = "h_default", text = "Dashel Stonefist. Folk call me Fist, on account o' the fists, an' I drink in Old Town an' settle arguments in Old Town, usually the same evening." },
        { id = "h_diplomat", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A diplomat? Never met one, an' if ye ask me that again ye'll be askin' from the floor." },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, eh? Put that wee demon of yours where I can see it, or I'll knock its horns off before it gets a word out." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "What are ye lookin' at? A dwarf who talks tae the wind, is it? Well, the wind's got nothin' tae say tae me." },
      },
      again = {
        { id = "h_again", text = "What else? Talk's thirsty work." },
        { id = "h_again2", text = "Aye? Make it quick or make it a fight." },
      },
      choices = {
        { text = "Why do you fight so much?", next = "fight" },
        { text = "You seem to have a few friends about.", next = "friends" },
        { text = "Old Town looks older than the rest of the city.", next = "oldtown" },
        { text = "You had some part in the diplomat's disappearance, Fist.", next = "plan", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "Fancy a round? The other kind.", next = "spar", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Do you have trouble with the rogues in Old Town?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I hear you've been polymorphed, Dashel.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have you ever hunted, Dashel?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever ask anyone to pray for you, Fist?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why do you think paladins don't fight, Fist?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you really square up against a bear, Fist?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You'd pick a fight with anything small enough, wouldn't you, Dashel?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you ever listen to anything but your fists, Dashel?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'm not looking for trouble.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Because nobody pays me to think. They pay me to stand in a door an' look unfriendly, an' it's honest work, mostly." } },
      choices = { { text = "Someone must be paying you.", next = "who" }, { text = "Suits me.", next = "BACK" } },
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
      lines = { { id = "os_default", text = "Aye, SI:7 keeps the old barracks there, an' they watch me drink. I drink slower, out o' respect." } },
      choices = { { text = "Very considerate.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    plan = {
      lines = { { id = "pl_default", text = "My part finished when the first plan went sour, thanks tae adventurers again. The next part was a Menethil man they called Slim, so go an' bother him, no' me." } },
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
    the_stockade = { { id = "tp_the_stockade", text = "I've done a night or two in the Stockade, and I'd do a few more if it meant a good scrap. Now the prisoners are running it, and I'm told it's a better tavern than the Pig and Whistle." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a strongman who'll fight anyone for a silver, and I've beaten him three times. He says it was twice, but he's wrong, and I'll fight him again to prove it." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "There's an arena in Stranglethorn where they fight for gold, and the goblins take bets on who'll live. I'd go if it weren't so far, and if there weren't trolls everywhere between here and there." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are a lot of soot-faced cowards who hide in their mountain. I'd fight any three of them, and I'd buy the fourth a drink afterward." } },
    knows = {
      { id = "tp_knows", text = "I hear plenty in Old Town, mostly between the second ale an' the first punch. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "Came tae Stormwind, found the ale an' the arguments, stayed for both. That's the whole tale." } },
    advice = { { id = "tp_ad", text = "Hit first. If ye cannae hit first, hit last. Never hit in the middle." } },
    defias = { { id = "tp_defias", text = "The Defias are a Westfall lot, an' not my crowd. I work in the city, where the ale's better." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. D'ye want a fight instead?" } },
  },
}

-- Furen Longbeard: shieldsmith and armorsmith, Grimand Elmore's student.
P:NPC {
  key = "furen", id = TODO_NPC("Furen Longbeard"), name = "Furen Longbeard",
  bible = "bibles/city3.md", role = "blacksmith", tier = "quest",
  communities = { "stormwind" }, temper = { "earnest" }, values = { "craft", "loyal" },
  notices = { "kit", "craft", "lock_armor" },
  impression = {
    first = "He looks at a dent and sees the whole fight behind it.",
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
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That ward ye've drawn round yerself is demon hide, isn't it, an' it sits on ye better than any plate I've made. Master Elmore would say it's no' armour at all, an' I'd say it's turned a blade, by the look o' it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Elmore says I'm no' good enough tae hear it yet. Maybe yer spirits could tell me when I've finally got it right." } },
      choices = {
        { text = "Keep working fair and true, Furen. The fire knows a patient hand.", next = "BACK", reply = "Aye, I'll keep at it. The fire's never yet told me I'm good enough, but maybe one day it will.", fx = { align = { honor = 1 } } },
        { text = "Elmore's too hard on you. Trust your own work.", next = "BACK", reply = "Ye think so? I'll nae tell him ye said that, but I'll think it every time he sighs at me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd make ye a good steel clasp for those robes, an' a bracer for the arm ye cast with, since I've seen what a backfire does to a wrist. Master Elmore says I'm too soft on customers, but a man who comes back to complain is a man who's still alive." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'd make ye a good steel clasp for those robes, an' a bracer for yer castin' arm, since I've seen what a backfire does tae a wrist. Master Elmore says I'm too soft on customers, but he's no' standin' this close tae yer demon, an' the way it's starin' at my tongs, I'd rather be soft than singed." },
      },
      choices = {
        { text = "I'll pay for a bracer, Furen, and come back to complain.", next = "BACK", reply = "Ha! Fair enough. I'll make it strong enough that ye'll have nothin' tae complain about.", fx = { align = { honor = 1 } } },
        { text = "Keep your bracer. A backfire won't touch me.", next = "BACK", reply = "That's what the last one said, an' he came back wi' a wrist like a burnt sausage. The offer stands.", fx = { align = { honor = -1 } } },
        { text = "Something else, Furen.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nae armour grows, though Master Elmore says a good smith can make ye feel like it does. Yer people must have some charm for it, an' I'd love tae see how it's done before he catches me askin'." } },
      choices = {
        { text = "Ask Elmore first. Learn the craft properly, step by step.", next = "BACK", reply = "Aye, that's what Elmore'd say, an' he'd be right. I'll ask him, though he'll only grunt.", fx = { align = { order = 1 } } },
        { text = "Don't wait for Elmore's leave. Try it yourself tonight.", next = "BACK", reply = "Ye think I should? Och, ye're a bad influence, but I'll give it a go after he's gone tae bed.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every one I've sold it tae has come back alive, an' I've seen the ones who wanted tae stay light carried out o' Old Town on a door. Elmore says it's no' proper work, but Elmore never had a knife come at him in an alley." } },
      choices = {
        { text = "Elmore's right that proper work is done the proper way.", next = "BACK", reply = "Aye, I suppose he is. I'll keep makin' it the proper way an' the other way, and nae tell him which.", fx = { align = { order = 1 } } },
        { text = "Tradition be hanged. If it keeps you alive, wear it.", next = "BACK", reply = "That's what I keep sayin'! Ye'd get on wi' my customers, friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ye could, but it'd fight wi' every spell ye cast, or so the Quarter's lot tell me, an' I've no' the learnin' tae argue. I've often thought there's a fortune in it for whoever solves that, though." } },
      choices = {
        { text = "Some limits are there for good reason, Furen.", next = "BACK", reply = "Maybe there are, an' maybe they're for my own good. Still, a smith can dream at the anvil.", fx = { align = { order = 1 } } },
        { text = "Every limit's only waiting for someone to break it, Furen.", next = "BACK", reply = "That's the kind o' talk that gets an apprentice sacked, an' I love it. I'll think on it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, if ye stitch the rings tae padded leather an' oil 'em well, which Master Elmore says is more tailorin' than smithin'. Back in Ironforge the mountaineers want their mail quiet enough tae hear a ram's hoof on the snow." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Aye, if ye stitch the rings tae padded leather an' oil 'em well, which Master Elmore says is more tailorin' than smithin'. That {pet} o' yours has got its own armour, more or less, an' better fitted than any I could make. Keep it fed an' it'll keep ye alive." },
      },
      choices = {
        { text = "Quiet armour and a steady aim. That's the way.", next = "BACK", reply = "That's the way o' the mountain hunters back home. I'll stitch ye some fine quiet rings.", fx = { align = { order = 1 } } },
        { text = "Who cares about rattling? I'll shoot them before they hear.", next = "BACK", reply = "Then ye'll be shootin' a boar that's already chargin', an' ye'll wish ye'd listened. Still, I'll make it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ye should wear what ye can, an' a bit o' padding under the cloth never hurt anyone. Elmore says priests are too proud tae wear mail, but I think they're just too busy keepin' everyone else alive tae think about themselves." } },
      choices = {
        { text = "My faith is my armour, Furen, but I'll take the padding.", next = "BACK", reply = "Aye, faith an' a bit o' padding, that's the way tae go. I'll find ye somethin' soft but strong.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith won't stop a blade. I'll wear the thickest cloth you have.", next = "BACK", reply = "Now that's sense! I'll make it the thickest cloth ye've ever worn, an' ye'll thank me in Duskwood.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Whether ye stood your ground or turned tae run, mostly. A dent on the front means ye faced it, an' a dent on the back means ye didnae, an' I've seen more o' the back kind than I'd like on some o' the young knights." } },
      choices = {
        { text = "I'll keep my dents on the front, Furen, always.", next = "BACK", reply = "Good on ye. I'll make sure the front's got plenty o' steel tae dent.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sometimes a retreat saves more lives than a stand.", next = "BACK", reply = "Aye, maybe it does, an' I'll nae judge a dent on the back after that. Elmore might, though.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? I've mended more robes than ye'd think, for armour won't stop a dagger if the priest inside it won't wear any." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's a set o' plate I'd like a look at, because I can tell ye've been hit, an' I can tell ye didnae fall over." },
        { id = "h_default", text = "Furen Longbeard, maker o' shields an' armour. I learned from Grimand Elmore, an' I'm still learnin', which he tells me daily." },
        { id = "h_elmore", when = { heardLine = "elmore.h_default" },
          text = "Ye've met the master, then. Did he say anything about me? No? That means he's pleased, because when he's not pleased, he'll talk yer ear off till supper." },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Black robes an' somethin' small hidin' behind 'em, an' no use for my shields, though I'll mend a buckle if ye ask nicely." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My grandfather told stories o' an old Wildhammer who spoke tae the winds, but I never thought I'd see one o' ours from Ironforge doin' it." },
      },
      again = {
        { id = "h_again", text = "Aye? What else needs fixin'?" },
        { id = "h_again2", text = "Go on, I'm listenin', since the hammer's restin' anyway." },
      },
      choices = {
        { text = "Elmore must be a hard master.", next = "master" },
        { text = "I'd wager your shields go all over.", next = "orders" },
        { text = "You're a long way from Ironforge.", next = "why_here" },
        { text = "Can you make me something harder than this?", next = "mail", when = { class = "WARRIOR", minLevel = 22 } },
        { text = "Can you fix this?", next = "BUSINESS" },
        { text = "I doubt a rogue wants mail under leather.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could a mage ever wear mail, Furen?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can a dwarf's armour be made quiet, Furen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a priest wear armour, Furen?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What can you tell from a paladin's dents, Furen?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could you fit armour that changes shape along with me, Furen?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is there anything you'd make for someone in black robes, Furen?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the forge fire speak to you, Furen?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    dark_iron = { { id = "tp_dark_iron", text = "Elmore says the Dark Irons forge the best steel in the world, and then he says his is better. I'm still learning which of those is true, and I'd like to see a Dark Iron blade up close to decide." } },
    magni = { { id = "tp_magni", text = "King Magni's armour was made by the finest smiths in Ironforge, and I'd give my right arm to see it. Elmore says I'd need both arms for the job, which is fair." } },
    thandol_span = { { id = "tp_thandol_span", text = "The Thandol Span is held together by rivets as big as my head, Elmore says, and he's never lied to me about iron. I'd like to see it before the Dark Irons finish what they started." } },
    second_war = { { id = "tp_second_war", text = "My father fought in the Second War with a blade he made himself, and it held. I keep it above my bench, and I measure every blade I make against it." } },
    background = { { id = "tp_bg", text = "Elmore's student. That's the only part that matters, an' he'd say it doesnae matter much yet.", next = "master" } },
    advice = { { id = "tp_ad", text = "Check yer straps before every fight. A good shield on a bad strap is a lid on a pot." } },
    _none = { { id = "tp_none", text = "Ask the master, if ye dare." } },
  },
}

-- Topper McNabb moved to npcs/topper.lua (1.26.0).

-- Warden Thelwater: runs the Stockade, and would like the riots never mentioned again.
P:NPC {
  key = "thelwater", id = TODO_NPC("Warden Thelwater"), name = "Warden Thelwater",
  bible = "bibles/city3.md", role = "guard", tier = "quest",
  communities = { "stormwind" }, temper = { "anxious" }, values = { "self-preserving" },
  prejudice = { class = "WARLOCK", amount = 12, why = "A warlock prisoner's summoned thing killed one of his guards in the Stockade cells." },
  notices = { "soldier", "stealth", "lock_shards" },
  impression = {
    first = "He looks like a man who has stopped opening his letters.",
    third = "{name} met Warden Thelwater of the Stockade, an anxious man who would rather nobody heard about his lower tiers.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "No. No, not in my Stockade. The last warlock in these cells called up something that killed one of my guards, and I'm still writing the reports." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I know what you are, and I want you out of here before something follows you in. Say it quickly, please." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've been in and out of here a dozen times, and nobody's died. I'll take that, though I'd still like you nearer the door." },
    { id = "g_quiet", text = "Yes? Quickly, and quietly, please, because everything about this place should be quiet, especially lately." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you, good. No, I mean it: you're the only one who's ever made things better down there." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Don't. Whatever you're thinking of doing, don't. I've enough people trying to get out without people trying to get in." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Fifteen shards in your bag if there's one, and every one of them a soul. In my Stockade I'd count them out on the table and log each one by name, if I only knew the names." },
  },

  start = "hello",
  nodes = {
    xcl_stocks = {
      big = true,
      lines = { { id = "xcl_stocks_default", text = "Too few guards and too many Defias, and they all knew each other from Westfall, so they'd planned it long before the first cell door opened. I asked the House of Nobles for twelve more men in the spring, and they sent me a letter about the cost of lamp oil." } },
      choices = {
        { text = "Write it all down truthfully, Warden. The Captain should know.", next = "BACK", reply = "Honestly? Light, you're right, I know you're right, but you don't know the Captain. I'll try.", fx = { align = { honor = 1 } } },
        { text = "Bury the report, Warden. What the Captain doesn't know can't hurt you.", next = "BACK", reply = "That's what I've been telling myself all week, and it's never once let me sleep. Thank you anyway.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The prisoners who survived will pay for it, I'd guess.", next = "xcl_stocks2" },
      },
    },
    xcl_stocks2 = {
      lines = { { id = "xcl_stocks2_default", text = "They go back in their cells, the Defias among them go into the deepest ones, and their sentences grow by whatever the magistrate feels like that morning. Some of them were only thieves before the riot, and now they're rioters as well, and I'm not sure the kingdom gained by it." } },
      choices = {
        { text = "They chose to riot, Warden. Let the sentences stand.", next = "BACK", reply = "They will, and the magistrate will add more, and the Defias will hate us more. That's the Stockade.", fx = { align = { order = 1 } } },
        { text = "A few of them deserve a second chance, Warden.", next = "BACK", reply = "A few, perhaps, the young ones who were only following. I'll put in a word, if I'm still here to put it.", fx = { align = { order = -1 } } },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'll not say, and I'll thank you not to ask again. The Defias are noisy prisoners and the walls hold, mostly, and that's all you need to know." } },
      choices = {
        { text = "Then the walls should be made to hold properly, Warden.", next = "BACK", reply = "They should, and I've asked for it, and the Keep sends me a letter saying the matter is under review.", fx = { align = { order = 1 } } },
        { text = "The Defias have reasons for their anger. Hear them out.", next = "BACK", reply = "Hear them? I hear them every night, through every wall in this place. That's rather the problem.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "With great difficulty and the Mage Quarter's money, which they never give me without three letters and a complaint. There are wards on the deep cells, cut by a Dalaran man years ago, and I've not the faintest idea how they work, which keeps me awake at night." },
      },
      choices = {
        { text = "Then I'll leave your wards alone, Warden.", next = "BACK", reply = "Thank you. The last mage who poked at them took half his eyebrows home in a bag.", fx = { align = { order = 1 } } },
        { text = "A ward you don't understand isn't a ward at all.", next = "BACK", reply = "You're quite right, and that's what frightens me. I don't understand any of them.", fx = { align = { order = -1 } } },
        { text = "Something else, Warden.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not much, since they're under the canals, and I'd not let a prisoner near a window if I had one. A few of the lads have taken to growing moss on the walls for company, and I let them, because it keeps them quiet." } },
      choices = {
        { text = "The cells are for punishment, Warden. They needn't be pleasant.", next = "BACK", reply = "That's the general view, and I suppose I share it. But the moss does help the smell.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No creature should live without sky. Let them out to see it.", next = "BACK", reply = "Out? Light, no, absolutely not, I'd be guarding fish by Friday. But I'll not stop the moss.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "We did: a thief from the Lamb's crowd, and when we took him, the thing he kept set the straw alight in three cells at once. We hold his kind in the deepest cells now, chained and gagged, and I still don't sleep." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "We did, a thief from the Lamb's crowd, and his companion set the straw alight in three cells before we could get the chains on him. Seeing yours stand there looking at my keys, I've half a mind to double the guard on the deep cells tonight, and I still won't sleep." },
      },
      choices = {
        { text = "Chains and gags are wise, Warden. Better safe than burned.", next = "BACK", reply = "Better safe than burned, exactly. I've had enough fire for one career.", fx = { align = { order = 1 } } },
        { text = "Treat them like any other prisoner, Warden. Chains breed fury.", next = "BACK", reply = "Then you've never seen something like that loose in a cell block, and I hope you never do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Short of good men, which is worse, because there are guards on my roster who'd sell a cell key for a pint. The prisoners know it, and the Defias inside talk to the Defias outside more than I'd like." } },
      choices = {
        { text = "Then you need honest guards. I'd serve if asked.", next = "BACK", reply = "Would you? I'd take you tomorrow. The Captain would ask questions, but I'd take you.", fx = { align = { order = 1 } } },
        { text = "Pay them better and they'll stop selling keys.", next = "BACK", reply = "Better pay? Here? You'd have to ask the Keep, and the Keep would have to care.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once or twice, through the canals, and every time we've had to send hunters into the sewers to bring them back. A man on the run leaves a trail even in the dark, and a good tracker can follow it right to his door." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Once or twice, through the canals, and every time we've had to send hunters into the sewers to bring them back. That {pet} of yours could find a man in the sewers faster than my guards, I'd bet. Keep it in mind; I may come asking." },
      },
      choices = {
        { text = "I'd track an escaped prisoner for the city.", next = "BACK", reply = "Thank you. You'd find them faster than my men would, I've no doubt.", fx = { align = { order = 1 } } },
        { text = "Escaped prisoners aren't my concern. Let your guards earn their pay.", next = "BACK", reply = "My guards earn their pay by not deserting, mostly. I'd have hoped for more from you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "As well as Stormwind can afford, which isn't well, and better than most of them deserve. Some are thieves who'll be out by spring, and some are Defias who'd cut my throat for the keys, and I can't always tell which is which." } },
      choices = {
        { text = "Even a prisoner deserves mercy, Warden.", next = "BACK", reply = "Mercy, yes, as much as the city can spare, which isn't much down here.", fx = { align = { light = 1 } } },
        { text = "Defias get what they gave. Keep them hard.", next = "BACK", reply = "Hard, aye, but not cruel. I'll keep them hard, and pray it doesn't turn into the other thing.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_stocks", tags = { "news" }, when = { cleared = "The Stockade" },
          text = "Someone went all the way down to the lower tiers and put the whole riot to bed, and my guards keep saying your name, so I'll assume it was you. Thank you, and please don't tell the Captain how bad it got first." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Defias", min = 30 } }, text = "My guards tell me fewer Defias are coming down to the Stockade than going into the ground, and they tell me your name when they say it. I've no cells to spare, so I'll not complain." },
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
          text = "My guards could use a priest, the lot of them, and the ones who fled the riot need a better excuse than the one they gave the Captain." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Oh, thank the Light, it's you. You're the one person in this city I'm actually glad to see coming down those stairs." },
        { id = "h_canals", when = { origin = "human_canal_pickpocket" },
          text = "I know your face from the canal sweeps, years back; you were too small to keep and too quick to catch. Don't make me regret letting you go, please, not this week." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Please don't call up anything in here. I've had one of the Lamb's crowd in the cells before, and the thing he brought didn't care which side of the bars it was on." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "A warlock in my Stockade, of all the places in the city. Keep your hands still and your creature outside, or I'll have you put in a cell of your own." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "It's you, and nothing's gone wrong yet. Please keep it that way, because I can't afford another inquiry." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. If you're here to sign on with the Stockade guard, I've a place for anyone who can stand a long shift and a bad smell." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Don't bring the beast near the Stockade gate; the prisoners bang on the bars at anything with four legs." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the Stockade. The prisoners will want to see you turn into something, so please don't; they've had trouble enough this season." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I've had mages through my cells, and none of them stayed as long as their sentence, so you'll forgive my looking at you twice." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. If your spirits could make my prisoners as quiet as the stone, I'd be in your debt. Please don't mention the recent trouble." },
      },
      again = {
        { id = "h_again", text = "Yes, what else? Be quick about it, please." },
        { id = "h_again2", text = "Something more? Not too loudly." },
      },
      choices = {
        { text = "What happened in the Stockade?", next = "riots" },
        { text = "I hear you keep some hard men down there.", next = "cells" },
        { text = "Thredd had a visitor, I take it.", next = "visitor", when = { questDone = TODO_QUEST("The Stockade Riots") } },
        { text = "Your prisoners could use a priest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I've seen the inside of a cell or two, Warden.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You had one of the Lamb's crowd in your cells, then.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The Stockade guard looks short of men, Warden.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have prisoners ever escaped the Stockade, Warden?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How are the Stockade's prisoners treated, Warden?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Stockade's cells ever see daylight, Warden?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "How do you keep a mage locked up, Warden?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What trouble at the Stockade, Warden?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Your lower tiers are quiet now, Warden. How did it get so bad?", next = "xcl_stocks", when = { cleared = "The Stockade" } },
        { text = "I'll be discreet.", next = "END", fx = { affinity = 2 } },
      },
    },
    riots = {
      big = true,
      lines = {
        { id = "r_default", text = "Nothing happened, only a small disturbance. Some prisoners are out of their cells and some of my guards are, well... it's being handled, by you, I hope." },
      },
      choices = {
        { text = "I'll handle it.", next = "BACK", reply = "Oh, thank the Light. Please, just bring them back before the Captain hears anything.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Your prisoners can sort themselves out, Warden.", next = "BACK", reply = "Sort themselves out? They're Defias, they'll sort themselves into Westfall! Please, I'm begging you.", fx = { align = { order = -1 } } },
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
      choices = { { text = "Your secret's safe.", next = "BACK", reply = "Thank you. Truly, you've no idea what that means to a man with a fishmonger's future.", fx = { affinity = 1, align = { order = -1 } } }, { text = "He deserves the truth.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } } },
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
        { text = "Robbing graves. The dead deserve better.", next = "BACK", reply = "They do, and I'll keep him in the deepest cell I've got until the rope comes. If it comes.", when = { class = "PRIEST" }, fx = { align = { light = 1 } } },
        { text = "The dead don't need their bodies, so let the man go.", next = "BACK", reply = "Let him go? The families at Raven Hill would hang me from the canal bridge. No, he stays.", when = { class = "PRIEST" }, fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
        { text = "Whose seal is on those letters, Warden? Or shall I ask your superiors?", tag = "Intimidate", next = "cells_seal",
          check = { pass = { any = { { minLevel = 35 }, { class = { "WARRIOR", "ROGUE" } }, { townStanding = { town = "stormwind", min = 55 } } } } },
          fail = { next = "cells_nerve", fx = { affinity = -1 } } },
      },
    },
    visitor = {
      lines = { { id = "v_default", text = "Maelik, his papers said, and he came once or twice a week for months, after years of nobody. His papers were in perfect order, and that should have told me something." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    priest = {
      lines = { { id = "p_default", text = "Minister to them? Some would steal your vestments and the rest would confess to crimes they didn't do, for the company." } },
      choices = {
        { text = "Is there anyone who'd want a prayer?", next = "priest_mac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_mac = {
      big = true,
      lines = { { id = "pm_default", text = "One. Mac, a guard of fourteen, stopped them tearing blankets into red scarves, and one of them stabbed him for it. Say one for him, if you're saying them." } },
      choices = {
        { text = "I will.", next = "BACK", reply = "Thank you. I'll tell his grandmother, if she'll speak to me, which she won't.", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Prayers won't help Mac now, but justice for his killer might.", next = "BACK", reply = "It might, if the magistrate ever finds the rope. Until then, he's in a cell, and Mac's in the ground.", fx = { align = { light = -1 } } },
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
      lines = { { id = "rogue2_l", text = "Oh, lovely, just wonderful. I'll add it to the list of things I can't afford to fix and can't tell the Captain about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    the_stockade = {
      { id = "tp_the_stockade", text = "The Stockade holds the worst of Stormwind, and right now it holds them very poorly. The prisoners took the place in a riot, and it still turns my stomach, so please don't ask." },
      { id = "tp_the_stockade2", when = { questDone = TODO_QUEST("The Stockade Riots") }, text = "You went in after the ringleaders and came out again, which is more than my own guards managed. I'll be writing your name in a letter to the Keep, and I've not done that for anyone in years." },
    },
    deadmines = { { id = "tp_deadmines", text = "The Defias I've got locked up seem to know the way to Moonbrook's mines better than their own names. I've asked, and they just smile, and that's worse than any answer." } },
    syndicate = { { id = "tp_syndicate", text = "We've had a Syndicate man or two in the Stockade, all very polite and very well-dressed. They never stay long, and I've stopped asking who pays their way out." } },
    si7 = { { id = "tp_si7", text = "SI:7 visits the Stockade now and then, and they never tell me who they've come to see. I let them in, because I'd rather not know, and I suspect that's the arrangement." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord sends his regards and no more guards, and the regards don't hold a cell door. I'd like him to come and see for himself, though I'd prefer he didn't see it as it is." } },
    knows = {
      { id = "tp_knows", text = "A warden hears everything the cells whisper, though he'd rather not. Ask me about any of this, quietly, and I'll tell you what won't get me reassigned." },
    },
    background = { { id = "tp_bg", text = "Warden of the Stockade. Before that, a man who thought being warden would be quiet. I've not had a dry pair of boots since." } },
    advice = { { id = "tp_ad", text = "Check the papers, then check the person, and then check the papers again. I didn't, once." } },
    defias = { { id = "tp_defias", text = "My cells are full of them, and the rest are full of their friends. They organise better in prison than the guards do outside it." } },
    _none = { { id = "tp_none", text = "That's not a Stockade matter, thank the Light." } },
  },
}
