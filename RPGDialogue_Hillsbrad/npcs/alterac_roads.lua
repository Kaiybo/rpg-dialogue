-- Between the towns: Ravenholdt Manor in the hills, the walls of Dalaran, a Syndicate prisoner, Tarren Mill's alchemist. Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ravenholdt", id = TODO_NPC("Lord Jorach Ravenholdt"), name = "Lord Jorach Ravenholdt",
  bible = "bibles/roads.md", role = "noble", tier = "quest",
  communities = { "ravenholdt" }, temper = { "cool" }, values = { "discreet", "proud" },
  notices = { "class" },
  impression = {
    first = "Lord Jorach Ravenholdt receives guests in a manor that is not supposed to be easy to find. He is courteous in the way a blade is polished, and he has clearly already decided what you are worth.",
    third = "{name} met Lord Jorach Ravenholdt, master of the hidden manor in the Alterac hills and no friend of the Syndicate.",
  },

  greetings = {
    { id = "g_manor", text = "You found the manor, which means either someone sent you or you are better at walking quietly than you look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The servants noticed you at the gate before you noticed them, I hope you realize." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of the trade, and not a Syndicate hireling, I trust. They tend to arrive here wearing their colours and leave without them." },
  },

  start = "hello",
  nodes = {
    xpt_rogue = {
      big = true,
      lines = { { id = "xpt_rogue_default", text = "Not every one, only the ones worth the ink, and the ones who travel in company tend to live long enough to become worth it. Your friend has chosen their companions well, I think, though I'd rather they had chosen Ravenholdt." } },
      choices = {
        { text = "Then watch over them, my lord. They'd be glad of a patron.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My friend answers to no guild, my lord, and neither do I.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you'd think, for every quiet piece of work needs someone loud standing in the road while it's done. The Syndicate learned that from us, and now they hire Alterac's old men-at-arms to do the same against my people." } },
      choices = {
        { text = "I'd rather face a man than knife him. That's my way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Loud or quiet, a win is a win. I'll do either.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "We keep a few, and they're trained to follow the Syndicate's trail rather than a stag's. A hunter who can read the Alterac snow is worth more to this house than a dozen soft-footed apprentices, though I'd ask you not to tell them so." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} has been watching my steward since you arrived, and my steward has been watching {pet}. I think they've both concluded the other is dangerous, which makes them the two wisest creatures in the hall." },
      },
      choices = {
        { text = "I hunt the Syndicate in daylight, where they can see me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A clean shot from cover is still a clean shot.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The knights of Lordaeron rode into Alterac when Perenolde betrayed the Alliance, and my people did quieter work on the same traitors. We never shared a table, but we shared an enemy, and that is as close as honour and shadow usually come." } },
      choices = {
        { text = "Honour works in the open, my lord, or not at all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sometimes honour needs a knife in the dark.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every house needs prayers, and mine has buried enough of its own to know it. My people do the work the Light's servants would rather not see done, and I sleep well enough, though I've never once asked the Light's opinion." } },
      choices = {
        { text = "The Light sees all work, my lord, even yours.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some work is best kept out of the Light's sight.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_default", text = "They do, a handful of shadow mages who learned just enough in Alterac's better days to be dangerous. They cast from behind their swordsmen, which tells you everything about their courage, and a spellcaster who struck them first would spare my people a good deal of trouble." },
      },
      choices = {
        { text = "I'll face their casters openly, and let the Syndicate see who came.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll strike their casters from behind. They've earned nothing better.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they do, they speak quietly, which suits this house well. These hills have watched a king betray his own people and the Syndicate rise out of what was left, and I imagine the spirits have learned, as I have, to choose their confidants carefully." } },
      choices = {
        { text = "Then whatever they tell me here, I'll keep in confidence, my lord.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets are currency. I'd sell what the spirits tell me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "We hide in it, and in return we keep it free of the Syndicate's woodcutters and smugglers, which I suspect suits the forest well enough. Alterac's nobles stripped these hills for coin once, and I do not intend to let their hirelings finish the work." } },
      choices = {
        { text = "A true guardian shouldn't need to hide.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "An unseen guardian is the best kind.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "We have neighbors' manners, nothing more, since their city sits not far from my hills and their secrets are not my trade. Still, a mage who can open a lock with a word is worth knowing, and I make it my business to know who can." } },
      choices = {
        { text = "My talents are my own. I'm no one's tool, my lord.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Kirin Tor and Ravenholdt both serve order. I'd bridge them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a demon is the one guest who cannot be bribed, flattered or frightened, and those are the three tools my house relies upon. The Syndicate has dabbled in darker help, I'm told, and I would know if you were their messenger." } },
      choices = {
        { text = "I serve no Syndicate. My demons answer to me alone.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everyone's loyalty has a price, my lord, even mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let us speak of other things.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_rogue", tags = { "news" }, when = { party = { class = "ROGUE" } },
          text = "You bring {companion} up my hill, and I see by the way they stand that someone who knows my house had a hand in their training. The Assassin's League keeps track of its own, {name}, and of the company they keep." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who speaks with the elements, at Ravenholdt. Ironforge does not often produce anything my house cannot predict, {class}, so you have my attention, which is rarer than my courtesy." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" },
          text = "A shaman of Thrall's Horde, at Ravenholdt. The Warchief's people rebuilt an old faith out of ashes in a few short years, and I respect anyone who builds something that lasts." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at Ravenholdt. My guests usually arrive in shadow, but few of them arrive on four paws, and I confess I find it refreshing." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest of the Horde, at my door. Whether you pray to the loa or to a Light that no longer quite answers you, I ask only that you pray quietly, because my servants are easily distracted." },
        { id = "h_default", key = true,
          text = "I am Jorach Ravenholdt, and this house has stood in these hills longer than Alterac's kings stood on their thrones. We keep our own counsel here, and we keep the Syndicate in its place." },
        { id = "h_emblems", tags = { "news" }, when = { questActive = TODO_QUEST("Syndicate Emblems") },
          text = "Those Syndicate emblems, yes. Every one you cut from a Syndicate cloak is a man who will not be reporting to the Perenoldes tonight, and I count them carefully." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage at Ravenholdt. The Kirin Tor's servants do not usually find this house, so I must assume either great skill or a very good guide, and I am curious which." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You are welcome under my roof as any guest is, though my people will watch your shadow more closely than they watch you." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance at Ravenholdt, which is rarer than you might think. My guests seldom ask the Light for anything, and I suspect the Light prefers it that way." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin under my roof. The last knights of the Silver Hand to pass through Alterac came to root out traitors, and I confess I was glad of them, though they never learned my name." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior at Ravenholdt, and you came up the front path, which none of my guests have done in years. I admire the honesty, though I'd not recommend making a habit of it." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, and you found my house, which most trackers fail to do. I'd ask how, but I suspect your beast deserves the credit." },
      },
      choices = {
        { text = "Does your house keep this forest, my lord, or only hide in it?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do the spirits of Alterac speak to your house, my lord?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Syndicate keep spellcasters of their own, my lord?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why does the Syndicate trouble you so much?", next = "syndicate" },
        { text = "I can't tell what sort of house this is.", next = "house" },
        { text = "I've walked in shadows a while. Is there a place for me here?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Dalaran sits close to your hills, my lord.", next = "xmage", when = { class = "MAGE" } },
        { text = "Why does Ravenholdt watch warlocks so closely, my lord?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does a house of shadows need a priest's prayers, my lord?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did the Silver Hand ever know of Ravenholdt, my lord?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A house of shadows can have little use for a warrior, my lord.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Your hills are full of game. I'd guess you keep hounds, my lord.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does Ravenholdt watch every rogue in the land?", next = "xpt_rogue", when = { party = { class = "ROGUE" } } },
        { text = "I'll leave you to your counsel, my lord.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something further? Speak plainly; this house dislikes wasted words." },
        { id = "h_again2", text = "Go on. The fire is warm and I have a little time." },
      },
    },
    syndicate = {
      lines = {
        { id = "sy_default", text = "Because they are thieves who call themselves an army, and they serve Alterac's disgraced nobles who sold their own kingdom to the Horde. Assassins should have masters with better taste than that." },
      },
      choices = {
        { text = "The nobles who lead them must be the worse lot.", next = "perenolde" },
        { text = "Thieves are thieves. You're no different, my lord.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Every trade needs a few rules. I'll respect yours.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    perenolde = {
      lines = {
        { id = "pe_default", text = "The Perenoldes cling to the ruins of Alterac and Strahnbrad and pay the Syndicate with coin they stole from their own people. Bring me the emblems their hirelings carry, and I will see your name remembered kindly in this house." },
      },
      choices = {
        { text = "Then I'll bring you emblems.", next = "BACK", fx = { affinity = 1, learn = "syndicate" } },
        { text = "I'll think on it.", next = "BACK" },
      },
    },
    house = {
      lines = {
        { id = "ho_default", text = "A guild, if you like, though we have no charter and no hall in any city. Those who belong here know it, and those who do not are shown the road politely, the first time." },
      },
      choices = {
        { text = "And the second time?", next = "house_second" },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    house_second = {
      lines = {
        { id = "hs_default", text = "There has not often been a second time, friend. The hills around Ravenholdt are steep, and the drop below the ridge is longer than most expect." },
      },
      choices = { { text = "I'll remember the drop.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Perhaps, in time. Ravenholdt opens its doors to those who prove they can be trusted with silence and a knife, and the Syndicate gives you a great many chances to prove both." },
      },
      choices = { { text = "Then I'll start with the Syndicate.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Hired knives with a noble's crest stitched on. Cut away the crest and they are only thugs." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "You are standing in it, which tells me someone thought you worth the directions. Ravenholdt has outlived kings and kingdoms by being exactly as visible as it wishes to be." } },
    alterac = { { id = "tp_alterac", text = "Alterac was a kingdom of proud fools who sold their neighbours to the Horde and then wondered why the Alliance dissolved them. Its heirs now play at banditry in the hills, and badly, which is why we watch them." } },
    scourge = { { id = "tp_scourge", text = "The dead have no purses, no secrets and no fear of a knife in the dark, so they are of very little interest to my house. That they are also of very great danger to everyone else is a matter I leave to paladins." } },
    prestor = { { id = "tp_prestor", text = "A lady of very sudden consequence in Stormwind, whose family seat is a place I cannot quite find on any map. I find that interesting, and I do not find many things interesting." } },
    varian = { { id = "tp_varian", text = "A king does not vanish on a short road without someone having been paid to look the other way. I have my suspicions about who did the paying, and I am choosing, for now, to keep them." } },
    booty_bay = { { id = "tp_booty_bay", text = "A port where every guest is a thief and every host a goblin, which makes it the most honest town in the world. Several of my people keep rooms there." } },
    dalaran = { { id = "tp_dalaran", text = "The Kirin Tor have reopened their gates a little, and they have closed their eyes a little less than before. Mages and my house have always had an arrangement of mutual polite indifference." } },
    _none = { { id = "tp_none", text = "That is a question for someone who answers questions. I am not that person." } },
  },
}

P:NPC {
  key = "ansirem", id = TODO_NPC("Archmage Ansirem Runeweaver"), name = "Archmage Ansirem Runeweaver",
  bible = "bibles/roads.md", role = "scholar", tier = "service",
  communities = { "dalaran" }, temper = { "proud" }, values = { "learned", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Archmage Ansirem Runeweaver stands at Dalaran's gate, where the violet dome has only lately opened, as if waiting for the city to finish a sentence. He speaks of the city's walls with the fondness of a man who helped build them.",
    third = "{name} met Archmage Ansirem Runeweaver of the Kirin Tor, keeping watch at Dalaran's newly opened gate.",
  },

  greetings = {
    { id = "g_dome", text = "Mind the barrier, please. It hums when it is pleased and crackles when it is not, and it has not been pleased in some time." },
    { id = "g_xquarter", when = { origin = "human_mage_quarter" }, text = "A student of Stormwind's Mage Quarter, unless I miss my guess, and your masters will have studied here once. Look well at what's left of the city, apprentice, because they surely told you how it looked before." },
    { id = "g_xdalaran", when = { origin = "forsaken_dalaran_apprentice" }, text = "You studied here once; I can see it in the way you look at the barrier. I'm sorry for what became of you, and I mean that, but I'll still ask you not to come any closer than you are." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You can feel the wards, then, pressing at the back of your teeth. Good; it means you were taught properly." },
  },

  start = "hello",
  nodes = {
    xcl_sfk = {
      big = true,
      lines = { { id = "xcl_sfk_default", text = "Then the Kirin Tor's worst mistake in Silverpine is finally closed, and I'll write it into the council's record myself before someone tidies it away. Arugal called those creatures out of somewhere to fight the Scourge when the rest of us were losing, and they took Pyrewood and Baron Silverlaine's house and, last of all, his reason." } },
      choices = {
        { text = "Write all of it down. Dalaran owes Silverpine the truth.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bury the record. Nobody gains from knowing Dalaran's shame.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What were the worgen, before Arugal summoned them?", next = "xcl_sfk2" },
      },
    },
    xcl_sfk2 = {
      lines = { { id = "xcl_sfk2_default", text = "Nobody knows, and that's what keeps me awake, because Arugal didn't write it down, or if he did, his notes are in that keep with the rest of his madness. I'll say this much, though: whatever he called on was old, and older than anything the Kirin Tor were teaching." } },
      choices = {
        { text = "Then perhaps some questions are best left unanswered.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some of my colleagues certainly do, and they say so at length over dinner, because they cannot imagine power that is asked for rather than taken. I'm less sure, for I've seen a bound elemental slip its wards, and I've wondered since whether it was simply refusing to be spoken to rudely." } },
      choices = {
        { text = "Power should be studied and governed, as Dalaran does.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements aren't yours to bind. Ask, or leave them be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The great ward over the city drinks deep, I'll admit, and the trees nearest the walls have grown pale. We rebuild as gently as we can, though gentleness is not a thing the Syndicate respects." } },
      choices = {
        { text = "Dalaran's safety matters more than a few pale trees.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then ease the ward. The forest shouldn't pay for your walls.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "We had a few, and too many of us believed the wards would be enough on their own. Archimonde broke them like a man breaking ice on a pond, and the swordsmen who held the streets bought us time at a price we never repaid." } },
      choices = {
        { text = "Dalaran should keep a standing guard now, under strict command.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trust no city's walls. Better to fight free in the hills.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bears, wolves and Syndicate scouts, in about that order of good manners. The Crushridge ogres have pushed the game down from the high meadows, and I'm told the deer now graze within sight of the dome, which they never dared before the war." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your companion, {pet}, has been staring at the towers since you arrived, which is more sense than many of my apprentices show. Animals can feel the wards, I think, and they don't care for them." },
      },
      choices = {
        { text = "These hills should be cleared and brought back under Dalaran's law.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the hills run wild. Dalaran has meddled enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Perhaps, though we were busy quarrelling over Kel'Thuzad's books while Uther's knights were busy marching. If the two orders had trusted each other sooner, the plague might have been stopped before it reached Andorhal, and I think on that more often than an archmage should." } },
      choices = {
        { text = "Then trust each other now, Archmage, while there's still time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Councils fail. People stop plagues, not orders.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some were, and some were never found under the rubble, which troubles me more than I tell my apprentices. Others rose in the Scourge's ranks after Arthas laid siege to the city, and we had to put down our own colleagues with spells meant for lecture halls." } },
      choices = {
        { text = "The fallen deserve the Light's peace, whatever school they followed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Spells first, prayers after. The dead must be stopped.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Several, from Syndicate scavengers to plain treasure hunters who heard the vaults were left unguarded. The wards still keep them out of the vaults, and the ones who try too hard are found in the morning, a little singed and very confused about where they are." } },
      choices = {
        { text = "Dalaran's secrets should stay safe. I'd help you guard them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A locked vault is a challenge, Archmage, not a warning.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "He sat on our council, and he was brilliant, and he went looking for powers we had forbidden until he found the Lich King waiting for him. We cast him out too late, and Dalaran paid for it twice, once to the plague and once to Archimonde." } },
      choices = {
        { text = "His choices were his own. Knowledge didn't damn him.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then I'll learn from his fall and keep my craft in check.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarven shaman, at the walls of Dalaran. The Kirin Tor have spent centuries bending the elements to formula, {class}, and I find myself curious what they'd say if the elements could argue back." },
        { id = "h_default", key = true,
          text = "Archmage Ansirem Runeweaver of the Kirin Tor, at your service, within reason. Dalaran is closed while we rebuild, and I keep an eye on those who would rather it stayed broken." },
        { id = "h_cl_sfk", tags = { "news" }, when = { cleared = "Shadowfang Keep", faction = "Alliance" },
          text = "There's a rumour in the camps that Arugal is dead and his keep has gone quiet, and I find I want very badly for it to be true. If you were the one who climbed those stairs, I'd rather hear it from you than from the guards." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, standing at Dalaran's gate. I'd ask you not to test our wards, because they are less forgiving than I am, and I am not especially forgiving." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, at Dalaran's very gate. You'll understand if I keep my hand near my staff, because the last of your school I knew well was Kel'Thuzad, and look what came of him." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light at Dalaran's gate. The Kirin Tor are not a pious order, I'll admit, but we buried a great many of our own after Archimonde came through, and we were glad of every priest who came to say the words." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, here among the mages. Your order and mine never understood each other, but when Lordaeron burned we found ourselves standing on the same ground." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at the gates of Dalaran. The Kirin Tor learned too late how much we needed people like you on our walls, and I've not forgotten the lesson." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, out here among the Syndicate's hills. Do keep your arrows pointed away from the towers, because the wards are touchy about anything sharp and fast." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Cenarion Circle, at the edge of Lordaeron. Your people have little love for arcane magic, I know, but you'll find the Kirin Tor more careful with it than the stories say." },
      },
      choices = {
        { text = "Why was the city sealed so long?", next = "dome" },
        { text = "Someone must want Dalaran to stay broken.", next = "enemies" },
        { text = "I studied magic once. Does the Kirin Tor still teach?", next = "teach", when = { class = "MAGE" } },
        { text = "Has anyone tried to sneak into the vaults, Archmage?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "They say Kel'Thuzad was one of the Kirin Tor, Archmage.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Were the Kirin Tor's dead given proper rites, Archmage?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Kirin Tor have stood with the Silver Hand sooner?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Dalaran seems to have had few soldiers when Archimonde came.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What hunts the hills around Dalaran these days, Archmage?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The trees near your walls look sickly, Archmage.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the Kirin Tor think shamans lesser casters, Archmage?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Arugal is dead, Archmage. I climbed his tower myself.", next = "xcl_sfk", when = { cleared = "Shadowfang Keep", faction = "Alliance" } },
        { text = "Good day, Archmage.", next = "END" },
      },
      again = { { id = "h_again", text = "Yes? I have a little patience left, and the wards have none." } },
    },
    dome = {
      lines = {
        { id = "do_default", text = "Archimonde broke the city when the Legion came, and the Scourge stripped what was left. The barrier kept thieves and worse out while we mended the towers, and now that it's open, the wards that remain keep our mistakes in." },
      },
      choices = {
        { text = "Sealing yourselves away while the world burns seems wrong.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Rebuilding first is wise. The world can wait a little.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    enemies = {
      lines = {
        { id = "en_default", text = "The Syndicate in the hills, the Forsaken in their mill, and Dalaran's own renegades out at Ambermill in Silverpine. Loremaster Dibbs in Southshore keeps a list, and it grows longer every week." },
      },
      choices = { { text = "I'll ask Dibbs about the list.", next = "BACK", fx = { learn = "dalaran" } } },
    },
    teach = {
      lines = {
        { id = "te_default", text = "It teaches those it can reach, and for now that means the masters in Stormwind and Ironforge do the teaching, and grumble about the extra pupils. When the towers stand again, you may find the door open to you." },
      },
      choices = { { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "A city of violet towers that will stand again, though not this year, I think." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor have lost Antonidas, and Kel'Thuzad, and very nearly the city, and we are a smaller council and a warier one for it. Archmage Modera holds us together with a firmness I did not know she had." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "He sat at our tables and argued at our councils, and then he took his necromancy to the Cult of the Damned. That we did not see him for what he was is a shame every mage of my age carries." } },
    scourge = { { id = "tp_scourge", text = "The plague came through Alterac and the hills below this very gate, and Dalaran's walls held it back only so long. We remember who brought it, and we keep the dome raised partly so that we never forget." } },
    jaina = { { id = "tp_jaina", text = "Lady Proudmoore was a student here, and one of Antonidas's best, before she led her people across the sea. She writes to the council now and then, and her letters are always sensible, which is more than I can say for most." } },
    alterac = { { id = "tp_alterac", text = "The ogres have Alterac's ruins now, and the Syndicate its old estates, and neither has the manners to keep off our roads. We ward the gates and let the soldiers of Southshore do the rest." } },
    _none = { { id = "tp_none", text = "I'm afraid that falls outside my studies, and my studies are rather wide." } },
  },
}

P:NPC {
  key = "goldir", id = TODO_NPC("Gol'dir"), name = "Gol'dir",
  bible = "bibles/roads.md", role = "citizen", tier = "quest",
  communities = { "tarren_mill" }, temper = { "grim" }, values = { "loyal", "proud" },
  notices = { "race" },
  impression = {
    first = "Gol'dir is an orc the Syndicate kept in chains, moved from camp to camp in the Alterac hills. His wrists are raw, and his pride is not.",
    third = "{name} met Gol'dir, an orc held prisoner by the Syndicate in the hills of Alterac.",
  },

  greetings = {
    { id = "g_chains", text = "Another face at the bars. Speak, then, and tell me whether you came to gloat or to open this door." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "A brother of the Horde, here! Lok'tar, friend; I had nearly forgotten what our tongue sounds like in a free mouth." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "If it does, it does not listen very closely, because they pray for luck at dice and then beat me when they lose. You fight for the Horde with it, I am told, so perhaps the Light is wiser than its servants." } },
      choices = {
        { text = "The Light is wiser, and it will see you free.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light hears everyone. That's why I don't trust it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Worse than one, for a beast they would at least feed properly. They keep me because I know where things are buried in these hills, and when I'm free I mean to make every one of them regret it." } },
      choices = {
        { text = "Take your revenge. They've earned every bit of it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Get home safe first. Revenge can wait, or end.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "With nets and arrows from the trees, the way cowards always fight. I killed two of them with my hands bound, and they've moved me from camp to camp ever since, because no guard wants to be the one I remember." } },
      choices = {
        { text = "Then we'll face them in the open and make them answer for it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Nets work. I'll turn their own tricks against them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gol'dir.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mangy hounds, starved half to death so they'll bite anything that runs. I've called to them at night with the hunting calls my father taught me, and I think one of them would follow me out if the door were open." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a better coat and a fuller belly than any beast in these camps. Keep it close when you open my door, because the Syndicate's hounds will smell a free animal and lose their minds." },
      },
      choices = {
        { text = "The hounds aren't to blame. I'll spare them if I can.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A guard dog is still a guard. I'll cut it down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They keep watch at night when the guards are drunk, and they question the prisoners when the guards grow bored of beating us. One of them asked me about Durotar for three days running, and his questions left marks the whip never did." } },
      choices = {
        { text = "Point him out to me, brother. I'll face him openly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll catch him asleep. He's earned no fair fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The key stays on the belt of whichever guard sleeps nearest the fire, because they trust nobody else with it. They change watch at dusk and again before dawn, and the second watch is always half asleep and half drunk." } },
      choices = {
        { text = "I'll take the key, but I'll fight the guard to his face.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take the key and leave nobody awake to raise an alarm.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some nights, when the guards slept, I heard the wind in the pines and remembered that Thrall freed our people from cages like these. The spirits did not break my chains, but they reminded me that chains have been broken before." } },
      choices = {
        { text = "Then walk out with your head high, and let the Syndicate see it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Freedom's enough. We slip out quietly, before anyone notices.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who calls the spirits? I did not know Ironforge had any shamans, {class}, but I have asked the earth to send help for many nights, and it seems the earth does not care what race it sends." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" },
          text = "A shaman of the Horde, here in these camps. I have asked the spirits of the earth to break these chains for many nights now, and perhaps they sent you instead." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, come to a chained orc. Whether you serve the loa or the Light the dead still whisper to, I don't care, so long as you can mend these wrists once the iron comes off." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage of the Horde. The Syndicate keep shadow mages in these camps, and I have watched them work for months, so forgive me if I flinch when you raise your hands." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock, and of the Horde. I remember what your kind made of us before Thrall, so open this door if you've come to open it, and keep your demons on the far side of it." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "You came in quietly, and the guards never heard a thing. Good, because a Syndicate camp is full of men who sleep with one eye open and a hand on a knife." },
        { id = "h_default", key = true,
          text = "I am Gol'dir, and the Syndicate has kept me in chains longer than I care to count. When Thrall broke the camps I swore no human would cage me again, and yet they move me from camp to camp so nobody can find me. Still, you found me." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "An Alliance face, and you have not drawn steel. Strange times, when a human's enemy and an orc's enemy are the same men in black cloaks." },
        { id = "h_rescue", tags = { "news" }, when = { questActive = TODO_QUEST("Gol'dir") },
          text = "Krusk sent you? Then the old warrior did not forget me. Get these chains off, and I will walk back to Tarren Mill on my own feet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior of the Horde! I'd know the stance anywhere, feet set and shoulders square, and I've not seen it in a free orc since the Syndicate took me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter of the Horde, here in these camps. The humans keep their dogs on short chains, as they keep me, so perhaps your beast and I would understand each other." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of the tauren? I've heard your people can walk as beasts, and I confess I've dreamed of slipping these chains as something with claws." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one who still calls on the Light. The Syndicate's guards pray to it too, when they think I am asleep, and I wonder if it hears them as well as it hears you." },
      },
      choices = {
        { text = "Did the spirits keep you company in your chains, Gol'dir?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the Syndicate's shadow mages do in these camps, Gol'dir?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Where do the guards keep the keys, and when do they change watch?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "The Syndicate must have had a reason to take you.", next = "taken" },
        { text = "Who is Krusk to you?", next = "krusk" },
        { text = "What are they digging for at Strahnbrad?", next = "dig" },
        { text = "Lok'tar, brother. We'll get you home.", next = "BACK", when = { faction = "Horde" }, fx = { affinity = 2 } },
        { text = "It must have taken a lot of them to bring you down, Gol'dir.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the Syndicate keep dogs to guard you, Gol'dir?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "They've treated you like an animal, Gol'dir.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do you think the Light hears your captors, Gol'dir?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I can't free you today. I'm sorry.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? The guards come back at dusk, and the one with the limp likes to kick the bars, so be quick." } },
    },
    taken = {
      lines = {
        { id = "ta_default", text = "I led Krusk's band out of Durotar on the Warchief's business, and the Syndicate ambushed us in these hills. Now they make me haul stone and dig at Strahnbrad, and they ask very often where the rest of my people went." },
      },
      choices = { { text = "Did you tell them?", next = "told" } },
    },
    told = {
      lines = {
        { id = "to_default", text = "Nothing that was true. A man in chains learns to give answers that send his jailers walking up cold hillsides for no reason, and I have sent them up a great many." },
      },
      choices = {
        { text = "Lying to the enemy is honorable work.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Clever, but I'd have just stayed silent.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    dig = {
      lines = {
        { id = "di_default", text = "Cellars and old vaults, under the houses the Perenoldes' people abandoned. They think Alterac's lords left gold behind when they ran, and they work orc backs bloody looking for it." },
      },
      choices = { { text = "Have they found anything?", next = "dig_found" } },
    },
    dig_found = {
      lines = {
        { id = "df_default", text = "Rats, bones and broken wine jars, mostly, which pleases me more than I can say. A noble's treasure is never where his servants were told it was." },
      },
      choices = {
        { text = "Let them dig forever, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    krusk = {
      lines = {
        { id = "kr_default", text = "Krusk rode under my command from Durotar, and he does not leave his people to rot. If he still waits in Tarren Mill, then I still have somewhere to walk to." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { learn = "tarren_mill" } } },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Cowards in black who beat chained men. I have long memory for their faces." } },
    thrall = { { id = "tp_thrall", text = "The Warchief freed my people from the camps, and one day his warriors will free me from these chains. Until then I wait, and I remember every face that held the whip." } },
    internment = { { id = "tp_internment", text = "I was in Durnholde's camp before Thrall broke it, and the Syndicate put me back in chains as if nothing had changed. Humans are very fond of locks, and I am very tired of them." } },
    alterac = { { id = "tp_alterac", text = "Alterac's nobles keep me in their hills like a prize ram, moving me from camp to camp. Their grandfathers sold their own people to the Horde, and now they sell orcs to anyone who'll pay." } },
    _none = { { id = "tp_none", text = "Ask me again when I am not wearing iron, because an orc in chains thinks of nothing else." } },
  },
}

P:NPC {
  key = "hinott", id = TODO_NPC("Serge Hinott"), name = "Serge Hinott",
  bible = "bibles/roads.md", role = "trainer", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry" }, values = { "careful", "curious" },
  notices = { "craft" },
  impression = {
    first = "Serge Hinott teaches alchemy in Tarren Mill and measures reagents with the steadiness of someone whose hands no longer shake from anything. He speaks of poisons the way a baker speaks of bread.",
    third = "{name} met Serge Hinott, the Forsaken alchemist who teaches in Tarren Mill.",
  },

  greetings = {
    { id = "g_bench", text = "Step lightly near the bench. Half of what's on it is harmless and the other half is labelled, though not always correctly." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy" } },
      text = "You smell of the trade, which is a compliment, though few take it as one." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd brew them for anyone who pays, and I'd think nothing of it, but you might. The Light was never fond of poison, I'm told, though I've noticed the Light was never asked to hold Tarren Mill against Southshore either." } },
      choices = {
        { text = "No poison on my blade. The Light is enough.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whatever holds Tarren Mill. I'll take the poison.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Waste them? I use every leaf, and I grind the stems for the next batch. The Society does the grand work in the Undercity with their great vats, but out here a man learns to make a single kingsblood go a very long way." } },
      choices = {
        { text = "Good. Waste nothing, and the hills will keep feeding you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your brews poison more than they heal, alchemist.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, alchemist.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something to close a wound and something to dull the pain, and for the Deathguards, something to stop the rot spreading faster than the wound. A warrior who carries three of my vials into Hillsbrad Fields comes back, and one who carries none comes back on a cart." } },
      choices = {
        { text = "Mend the wounded first. A victory means nothing if no one lives.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Save the draughts and brew more poison for the humans instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Hinott.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oils, mostly, and a draught that lets a Deathguard smell a living man at fifty paces, which he'd otherwise have forgotten how to do. The spider venom goes to Lydon, who has grander plans for it than I do, and I try not to ask what they are." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from the bench, please, because half these jars smell like supper to a beast and none of them are. I'd hate to explain a dead companion to a hunter who only came for oils." },
      },
      choices = {
        { text = "Oils, fine, but I won't feed beasts to a plague.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it serves the Dark Lady's plague, take whatever I bring.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Very little, and I'm proud of that, though a spellcaster who could keep a flask cold on the road to Hammerfall would save me a great deal of wasted silverleaf. The heat in these valleys turns half my draughts before the Deathguards ever drink them." } },
      choices = {
        { text = "I'll help, if it serves the Dark Lady's soldiers first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Brew what you like. The Society's rules needn't bind you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The herbs are the same, peacebloom and silverleaf and the rest, and only the intentions differ. You ask the plant's spirit to help, and I ask the plant to stop a heart by morning, and I've never yet met a plant that refused me." } },
      choices = {
        { text = "Then I'll ask the spirits to undo whatever harm you brew.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "An herb is an herb. Use it however the war needs.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Mostly the plain ones: a little nightshade for the blade, a little something stronger for the wells in Hillsbrad Fields. The Apothecary Society prefers the grand plagues, but out here a rogue with a good vial wins more fields than a cauldron." } },
      choices = {
        { text = "Poison the blades, not the wells. Spare the farmers.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Use it all. The living gave us no mercy.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Serge.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Now and then, though the Society frowns on anything it can't fully control, and the Dreadlords make the Society nervous. I keep my fel reagents in a separate cupboard with a separate key, and I've never once forgotten which is which." } },
      choices = {
        { text = "Control is everything. Keep your cupboards locked.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Society is too cautious. Push the work further.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman at my bench. Your kind brew with herbs and prayers, I'm told, while I use herbs and arithmetic, and only one of us has ever had a complaint." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest at my bench. Whatever you pray to, loa or Light or the shadow between them, please do it after I've finished measuring, because prayer has never once improved a tincture." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. You're welcome to stand and watch, but you'll find alchemy terribly slow after fireballs, since nothing on this bench happens in less than a night." },
        { id = "h_default", key = true,
          text = "Serge Hinott, alchemist to Tarren Mill. The Apothecary Society does the grand work in the Undercity, and I do the useful work out here, where a draught has to be ready by morning." },
        { id = "h_living", when = { faction = "Alliance" },
          text = "A living one from Southshore's side of the hills. I'll not sell to you, but you can listen, I suppose, and then you can walk away quickly." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Then you'll want to know which of my bottles will put a man to sleep and which will put him under, and I'll tell you, because the Dark Lady's enemies deserve both." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Your craft and mine aren't so different: we both mix things that should never meet and hope we're standing back far enough." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll want healing draughts, I expect, since your kind treat the front line as a place to stand rather than a place to leave." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Bring me the glands from the Hillsbrad bears and the venom from the Alterac spiders, and I'll pay you better than any tanner in Tarren Mill." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid, and a herbalist too, I'd wager. Tell me, do your people ever cut a root without first asking its pardon, or is that only a story?" },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. You'll mend wounds with a prayer and I'll mend them with a draught, and I suspect mine is cheaper, though yours is quicker." },
      },
      choices = {
        { text = "Do your draughts and a shaman's herbs have anything in common?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there anything in Hillsbrad you can't brew without magic, Serge?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Your bench is crowded with flasks, Serge.", next = "brews" },
        { text = "How do you get along with Apothecary Lydon?", next = "lydon" },
        { text = "What poisons does Tarren Mill make for its rogues, Serge?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you ever use fel reagents in your alchemy, Serge?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What would you brew for someone who fights on the front line?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you make from the beasts I bring you, Hinott?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You brew with the land's herbs. Do you waste them?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I doubt you'd brew poisons for a paladin's blade, Serge.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good day.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? The flask on the left is about to do something, and I'd rather be standing behind you when it does." } },
    },
    brews = {
      lines = {
        { id = "br_default", text = "Remedies for the deathguards, mostly, and tonics for the living Horde who pass through and catch every cold in Hillsbrad. The more famous things I leave to Lydon, who enjoys them more than I do." },
      },
      choices = {
        { text = "Making weapons of sickness is beneath an alchemist.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "War is war. A good poison saves soldiers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lydon = {
      lines = {
        { id = "ly_default", text = "Well enough, so long as I stay out of his cellar. Whatever he's working on down there for the Society, he asks the farm folk of Hillsbrad to taste it, and they don't get a choice." },
      },
      choices = { { text = "I'll keep out of his cellar too.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "We are the Dark Lady's people, and we brew what we brew because the living gave us no other choice. I measure my reagents with care, because carelessness was a luxury of the breathing." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady gave us our minds back and a reason to use them, and that is more than any king of Lordaeron ever did for me. I serve her with my hands and my vials, and gladly." } },
    scourge = { { id = "tp_scourge", text = "The Scourge made me, and the Dark Lady unmade what it made of me, and I have not forgiven either half of that. My work is aimed at the Lich King's servants first, whatever Southshore believes." } },
    _none = { { id = "tp_none", text = "If it doesn't dissolve or distill, I've no opinion of it." } },
  },
}
