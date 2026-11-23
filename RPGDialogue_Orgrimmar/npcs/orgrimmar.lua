-- Orgrimmar. Voice: bibles/orgrimmar.md
-- Neeru Fireblade's secret (he runs the Burning Blade) never slips from his own mouth;
-- Thrall's lines show he already suspects.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thrall", id = TODO_NPC("Thrall"), name = "Thrall",
  bible = "bibles/orgrimmar.md", role = "noble", tier = "major",
  communities = { "orgrimmar" }, temper = { "steady" }, values = { "honorable", "compassionate", "cunning" },
  race = "Orc", likesTone = "blunt",
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "He carries Doomhammer's hammer and spends every day trying to deserve it.",
    third = "{name} stood before Thrall, Warchief of the Horde, in Grommash Hold in Orgrimmar.",
  },

  greetings = {
    { id = "g_warchief", text = "Lok'tar. Speak freely, warrior. In this hall, every voice of the Horde is heard." },
    { id = "g_orc", when = { race = "Orc" }, text = "{g:Brother|Sister}, we were slaves once, and now we have a home. Never let anyone make us forget either." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and the Horde is stronger for every warrior who comes back. Sit with me a while." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the city kept turning without you, but I'm glad to see you walk back through the gate. Sit, and tell me what the world looks like beyond Durotar." },
    { id = "g_away_long", when = { away = { min = 60, levels = 5 } }, text = "It has been {away} since you last stood in this hall, and you carry yourself like someone who has bled for the Horde since. The Horde grows stronger every time a warrior like you comes home." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "When we first spoke you were barely blooded, and now I can see the battles on you. You've grown into the kind of warrior I hoped this Horde would make." },
    { id = "g_word_helped", when = { word = "helped" }, text = "My people tell me you've been doing honest work for Orgrimmar, and word of it reaches this hall on every runner's tongue. A name like that will open more doors than any title I could give you." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told someone in this city caught you in a lie not long ago. I was a slave to men who lied to me every day of my youth, so understand that I'll be listening carefully." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The elements spoke to me when I had nothing else. Listen to them, and they'll never leave you alone." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "The Horde has a long, bitter history with the arts you carry, and I'll judge you by what you do with them, as will everyone else." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The Forsaken stand with us. I don't claim to understand the Dark Lady, but I understand being made into something you never chose." },
  },

  start = "hello",
  nodes = {
    dd_tiragarde = {
      lines = {
        { id = "dd_tir_default", text = "He did, and in fewer words than I would have liked. Admiral Proudmoore came to Kalimdor to finish what the old wars began, and he died for it at Theramore, but some of his sailors never sailed home. They hold that keep out of grief as much as hatred, I think, and that makes them more dangerous, not less." },
      },
      choices = {
        { text = "Grief or hatred, they came with swords. They get swords.", next = "dd_tiragarde2", fx = { align = { light = -1 } } },
        { text = "Then perhaps they could be made to sail home in peace.", next = "dd_tiragarde2", fx = { align = { light = 1 } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    dd_tiragarde2 = {
      lines = {
        { id = "dd_tir2_default", text = "Perhaps you're right, and I've learned not to be certain about humans either way. Jaina Proudmoore stood with me against her own father, and the man who raised me in Durnholde was human too. Our people can hold both of those truths, and I need them to, because the Horde will not survive on hatred alone." },
      },
      choices = { { text = "I understand, Warchief. Something else.", next = "BACK" } },
    },
    xalt_thrall = {
      lines = {
        { id = "xalt_thrall_default", text = "Many have stood here, and I try to remember each of them, because I was once a slave nobody looked at twice. Whoever they are to you, they came in with their head up and left the same way, and that is all I ask of anyone in the Horde." },
        { id = "xalt_thrall_kin", when = { alt = { kin = true } }, text = "{alt}, you mean. That {altclass} spoke plainly and listened when I answered, which few do in this hall, and if you share blood with them I'd guess you share a stubborn streak as well." },
      },
      choices = {
        { text = "Kin or not, we both answer to the Warchief.", next = "BACK", reply = "We do, and that's the only kinship the Horde truly needs. Go with honor, and give them my greeting.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My family looks after its own first, Warchief.", next = "BACK", reply = "Then look after them, but remember that the Horde is a family too. I'd ask you not to forget the larger one.", fx = { align = { order = -1 } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    xpt_thrall = {
      big = true,
      lines = { { id = "xpt_thrall_default", text = "Then you already understand what took me years to teach. The Horde I lead is orc and troll and tauren and now the Forsaken, and none of them owe the others anything but the word they gave, so the only thing holding us together is people like you choosing to stand beside each other." } },
      choices = {
        { text = "A word given is worth more than shared blood, Warchief.", next = "BACK", reply = "It is. Cairne gave me his word when he had nothing to gain from it, and I've built half this Horde on words like his.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Alliances like ours last only as long as they're useful.", next = "BACK", reply = "Some alliances, perhaps, but not this one. I mean to make it last longer than usefulness.", fx = { align = { honor = -1 } } },
        { text = "You seem to trust the Forsaken, Warchief.", next = "xpt_thrall2" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    xpt_thrall2 = {
      lines = { { id = "xpt_thrall2_default", text = "I trust that they hate the Scourge as much as we do, and for now that is enough to build on. Cairne counselled me to give them a chance and I have, but I keep my eyes open, and I'd ask you to do the same without letting your suspicion show." } },
      choices = {
        { text = "I'll keep my eyes open, Warchief.", next = "BACK" },
      },
    },
    xcl_rend = {
      big = true,
      lines = { { id = "xcl_rend_default", text = "Then the last of Blackhand's line to claim my title is gone. Rend gathered the Blackrock who would not follow me and gave them to the black dragons in the Spire, and he called that rabble the true Horde. He thought the Horde was a weapon to be pointed at the world, and I have spent my life proving it can be a people instead." } },
      choices = {
        { text = "The Horde needs one Warchief, and every clan should answer to him.", next = "BACK", reply = "There must be, or we'll tear ourselves apart again. Rend learned that too late.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the clans choose their own chiefs, Warchief. That's the old way.", next = "BACK", reply = "The old way gave us Blackhand and Doomhammer and the demons. I'll keep the clans close, and listen to them all.", fx = { align = { order = -1 } } },
        { text = "Who still follows the Blackrock in the Spire?", next = "xcl_rend2" },
      },
    },
    xcl_rend2 = {
      lines = { { id = "xcl_rend2_default", text = "Too many orcs who never shook off the hatred of the camps, and a few who never wanted to. The black dragons give them weapons and promises, and Rend gave them a name to shout, so without him they are only soldiers serving a dragon, and I mean to make sure they hear it." } },
      choices = { { text = "Then they've lost their reason to fight, Warchief.", next = "BACK" } },
    },
    xcl_rfc = {
      big = true,
      lines = { { id = "xcl_rfc_default", text = "Then you've seen how close they came. The Searing Blade crawled into the caves beneath Orgrimmar while we were still raising the walls above them, and they fed a demon down there and called it their master. I built this city as a home, and I won't let anyone turn its roots into a shrine to the Legion." } },
      choices = {
        { text = "Some of those cultists were orcs who lost their way. Offer them a way back.", next = "BACK", reply = "If any can be reached, I'll reach them. Bring them to me, and I'll offer what I can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A traitor to the Horde deserves no second chance, Warchief.", next = "BACK", reply = "Some, perhaps, but I was given a second chance once, and I'd hate to deny it to those who might take it. Bring them to me first.", fx = { align = { light = -1 } } },
        { text = "They were serving something down there, Warchief.", next = "xcl_rfc2" },
      },
    },
    xcl_rfc2 = {
      lines = { { id = "xcl_rfc2_default", text = "A demon the cultists called Taragaman, which they fed with blood and fire in the deepest cave. The Burning Blade served the Legion long before we came to Durotar, and some of my people still remember the taste of that power and miss it, which troubles me more than any demon." } },
      choices = { { text = "Then the Horde must remember what that power cost.", next = "BACK" } },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The same place any healer has, which is beside the wounded when the fighting stops. The shaman speak for the elements, but the elements do not bind a grunt's leg, and I have watched too many orcs die in the camps for want of someone who would kneel beside them." } },
      choices = {
        { text = "Then I'll kneel beside them, whoever they are.", next = "BACK", reply = "Then you understand the Horde better than some of my chieftains do. I'd like them to hear you say it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I serve my own people first, Warchief, and the Horde after.", next = "BACK", reply = "Your people first, then, but don't forget they're Horde too. I'd ask more of you, in time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Strength, but strength with a purpose. The demon blood made my people mighty and taught them to love slaughter, and I will not let that hunger take root again, so fight for those behind you, the peons and the young ones, and never for the joy of killing alone." } },
      choices = {
        { text = "I fight to protect the Horde, Warchief, not for bloodlust.", next = "BACK", reply = "Then you understand what I've been trying to teach since the camps. Fight for those behind you, and you'll never fight alone.", fx = { align = { honor = 1 } } },
        { text = "A warrior fights for glory, Warchief. Let the peons protect themselves.", next = "BACK", reply = "That's what the demons taught us, and it nearly killed us all. Think on it, warrior.", fx = { align = { honor = -1 } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They did, and they taught me that a Frostwolf rider never cages his wolf and never rides one that has not chosen him. A hunter who remembers that will never want for a loyal companion, and the Horde could stand to remember it too." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They did, and they taught me that a Frostwolf rider never cages his wolf and never rides one that has not chosen him. Your {pet} watches me the way a Frostwolf watches a stranger, which is to say wisely, so treat it as kin, {class}." },
      },
      choices = {
        { text = "My companion is my equal, Warchief, not my servant.", next = "BACK", reply = "Then you've learned what the Frostwolves taught me in Alterac. Snowsong never failed me, and I doubt yours will fail you.", fx = { align = { honor = 1 } } },
        { text = "A beast is a tool. I feed it so that it fights.", next = "BACK", reply = "Then it will fight, but it will never love you, and that's a loss. I hope you learn otherwise.", fx = { align = { honor = -1 } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Cairne is too generous. We fought the centaur beside his people in the Barrens, yes, but the tauren offered us friendship when the rest of the world wanted us back in the camps, and I have never felt that debt was paid on our side." } },
      choices = {
        { text = "Then the Horde must repay it with loyalty.", next = "BACK", reply = "It must, and I'll see that it does. Cairne deserves no less.", fx = { align = { honor = 1 } } },
        { text = "Debts between friends shouldn't be counted at all.", next = "BACK", reply = "Perhaps not, and Cairne would agree with you. But I count it anyway, because I never want to forget it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you serve it in a way many forget, and I won't be one of them. When I escaped Durnholde, a quiet friend and an unlocked door freed me as surely as any battle, so I know the worth of work done in the dark, so long as it's done for the Horde and never against it." },
      },
      choices = {
        { text = "Knives in the dark win battles before they start, Warchief.", next = "BACK", reply = "They do, and I've had cause to be grateful for them. Just make sure the knife is always pointed outward.", fx = { align = { honor = -1 } } },
        { text = "I'd still rather stand in the open for the Horde.", next = "BACK", reply = "Then stand in the open, and I'll be proud to have you there. The Horde needs both.", fx = { align = { honor = 1 } } },
        { text = "What does the Horde stand for?", next = "horde" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "There is, though our people learned stranger powers first, from far worse teachers. The Darkspear and the Forsaken bring the arcane to the Horde with clean hands, and I'd ask you to keep them that way." },
      },
      choices = {
        { text = "My hands will stay clean, Warchief. For the Horde.", next = "BACK", reply = "Then I'll hold you to it. The last orcs who reached for power with dirty hands were Gul'dan's.", fx = { align = { order = 1 } } },
        { text = "I'll use the arcane as I see fit.", next = "BACK", reply = "As you see fit, then, but remember who sees you. I'd ask you not to grasp too far.", fx = { align = { order = -1 } } },
        { text = "What does the Horde stand for, Warchief?", next = "horde" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_tiragarde", tags = { "news" }, when = { questDone = TODO_QUEST("Vanquish the Betrayers") },
          text = "Gar'Thok writes that the Kul Tirans at Tiragarde Keep have been driven back to their walls, and he names you in the report. I asked for peace with the humans, and I still want it, but those who land armed on our shore have made their own choice." },
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "There was another {altrace} in this hall not long ago, a {altclass} named {alt}, who stood the way you stand, as if the floor might be pulled out from under them. Is that one of your clan, or does Durotar simply raise its children alike?" },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "A {altrace} called {alt} stood where you're standing and spoke well of the Horde, which is more than many in this city manage. I'd like to think the two of you would get along, if your roads ever cross." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true, level = 50 } },
          text = "Word of {alt} has reached me from the Burning Steppes and beyond, and few of my own officers have earned that much notice. If you know that {altclass}, tell them the Warchief remembers the name." },
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "A full war band at my door, and every one of you armed. When I was a slave in Durnholde I dreamed of orcs gathering like this by their own choice and not at a warlord's order, so forgive me if I look at you a moment longer than I should." },
        { id = "h_pt_forsaken", tags = { "news" }, when = { party = { race = "Scourge" } },
          text = "You travel with one of Sylvanas's people, I see. Some of my warriors still make the sign against the dead when the Forsaken pass, and I would rather they learned better by watching the two of you than by hearing it from me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The Darkspear brought their healers across the sea with them, and now the Forsaken bring theirs from Lordaeron, and I am still learning what each of them prays to." },
        { id = "h_default", key = true,
          narr = { { text = "He leans forward on the high seat of Grommash Hold, and the brazier light runs along the black plate of his shoulders as he looks you over, one orc to another.", when = { race = "Orc" } },
                   { text = "He sits forward on the high seat of Grommash Hold with the Doomhammer resting against his knee, and studies you without any hurry at all." } },
          text = "Thrall, Warchief of the Horde. Orgrim Doomhammer gave me his hammer and his people with his last breath. I've spent every day since trying to deserve both." },
        { id = "h_op_jaina", when = { gossip = { topic = "jaina", stance = "distrust" } },
          text = "Eitrigg tells me you doubt Lady Proudmoore. Many in this city do, and I don't ask you to love her, only to remember that she has never once broken her word to me." },
        { id = "h_op_soft", when = { gossip = { topic = "warchief", stance = "soft" } },
          text = "I'm told you think your Warchief has gone soft. Say it to me, if you believe it, because I'd rather hear it in this hall than have it muttered in the Drag." },
        { id = "h_garthok", when = { heardLine = "garthok.h_default" },
          text = "You've reported to Gar'Thok at Razor Hill. Nazgrel trained him well, and I sleep easier knowing he holds Razor Hill." },
        { id = "h_cl_rend", tags = { "news" }, when = { killed = { name = "Rend Blackhand" }, faction = "Horde" }, text = "Word has come down from Blackrock that Rend Blackhand is dead. He called himself Warchief and called my Horde a pack of slaves, and I hope he understood at the end who had sent you." },
        { id = "h_cl_rfc", tags = { "news" }, when = { cleared = "Ragefire Chasm", faction = "Horde" }, text = "You've been to the bottom of Ragefire Chasm and come back up the stairs, and the Searing Blade will think twice before they light another fire under my city." },
        { id = "h_hidden", tags = { "news" }, when = { questActive = TODO_QUEST("Hidden Enemies") },
          text = "Some in my city wear the Horde's colours and serve older masters. I need someone they'll trust, so earn that trust, and then bring me what they know." },
        { id = "h_hidden_done", when = { questDone = TODO_QUEST("Hidden Enemies") },
          text = "You did well in the chasm. The rot isn't gone; it never is entirely. But it's weaker, and it knows I'm watching." },
        { id = "h_plague_resolved", tags = { "news" }, when = { thread = { id = "new_plague", state = "resolved" } },
          text = "I've thought on what you told me of the Apothecarium. The Dark Lady aims her plague at the Scourge, you said, and I'm holding her to that aim, and you to your word." },
        { id = "h_plague_soured", tags = { "news" }, when = { thread = { id = "new_plague", state = "soured" } },
          text = "A plague is a plague, you told me, and I haven't stopped hearing it. Every rider from Lordaeron gets a longer hearing in this hall than they used to." },
        { id = "h_neeru", when = { heardLine = "neeru.h_default" },
          text = "You've met Neeru Fireblade down in the Cleft, I hear. He's very helpful, isn't he? Keep being helpful back, quietly, and tell me what he says." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "The Windshapers, then. The Earthen Ring vouched for you and the tauren took you in, and that's good enough for me. Welcome to the Horde." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Welcome to my hall, druid. Cairne's people taught mine more about this land than we would ever have learned alone, and I count every tauren in Orgrimmar as kin." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior stands before me. The Horde was born in battle, but I would rather it were known for what its warriors protect than for what they destroy." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and a companion at your side. The Frostwolves taught me in Alterac that the bond with a beast is a bond of honour, and I have never forgotten it." },
      },
      choices = {
        { text = { normal = "Gar'Thok sent you word of Tiragarde Keep, Warchief?", polite = "If I may ask, Warchief, did Gar'Thok send word of Tiragarde Keep?", blunt = "Did Gar'Thok tell you about Tiragarde Keep?" }, next = "dd_tiragarde", when = { questDone = TODO_QUEST("Vanquish the Betrayers") } },
        { text = { normal = "Someone close to me has stood in this hall, Warchief.", polite = "With respect, Warchief, someone close to me has stood in this hall.", blunt = "Someone close to me has been in this hall." }, next = "xalt_thrall", when = { alt = true } },
        { text = { normal = "What place does a priest have in a Horde of shaman, Warchief?", polite = "If I may ask, Warchief, where does a priest fit among your shaman?", blunt = "Where does a priest fit in a Horde of shaman?" }, next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = { normal = "Cairne says the tauren owe you a debt, Warchief.", polite = "Chieftain Cairne says the tauren owe you a debt, Warchief.", blunt = "Cairne says the tauren owe you." }, next = "druid_q", when = { class = "DRUID" } },
        { text = { normal = "The Horde must stand for something more than war.", polite = "With respect, Warchief, the Horde must stand for more than war.", blunt = "The Horde has to stand for more than war." }, next = "horde" },
        { text = { normal = "What of the humans at Theramore?", polite = "If I may ask, Warchief, what of the humans at Theramore?", blunt = "What about the humans at Theramore?" }, next = "theramore" },
        { text = { normal = "You already suspect Neeru Fireblade, don't you?", polite = "Forgive me, Warchief, but you already suspect Neeru Fireblade, don't you?", blunt = "You suspect Neeru Fireblade already, don't you?" }, tag = "Persuade", next = "neeru_suspect",
          when = { heardLine = "neeru.h_default" },
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Hidden Enemies") }, { trait = "skeptical" } } } },
          fail = { next = "neeru_not_yet", fx = { affinity = -1 } } },
        { text = { normal = "Some call my path the old sickness, Warchief. How does the Horde see me?", polite = "Some call my path the old sickness, Warchief. If I may, how does the Horde see me?", blunt = "They call my path the old sickness. How does the Horde see me?" }, next = "warlock", when = { class = "WARLOCK" } },
        { text = { normal = "The elements answer me, Warchief, as they answered you.", polite = "With respect, Warchief, the elements answer me as they answered you.", blunt = "The elements answer me, same as they answered you." }, next = "shaman", when = { class = "SHAMAN" } },
        { text = { normal = "I'm an orc who studies the arcane. Does that trouble you?", polite = "I'm an orc who studies the arcane, Warchief. Does that trouble you?", blunt = "I'm an orc mage. Does that bother you?" }, next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = { normal = "I'm Forsaken, and the Light still answers me.", polite = "With respect, Warchief, I'm Forsaken, and the Light still answers me.", blunt = "I'm Forsaken, and the Light answers me anyway." }, next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = { normal = "I'm Frostwolf, Warchief. Drek'Thar's people.", polite = "I'm of the Frostwolf clan, Warchief, Drek'Thar's people.", blunt = "I'm Frostwolf, from Drek'Thar's people." }, next = "frostwolf", when = { origin = "orc_frostwolf" } },
        { text = { normal = "I serve the Horde from the shadows, Warchief.", polite = "With respect, Warchief, I serve the Horde from the shadows.", blunt = "I work for the Horde from the shadows." }, next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = { normal = "I study the arcane, Warchief. Is there a place for me?", polite = "I study the arcane, Warchief. Is there a place for me, if I may ask?", blunt = "I'm a mage. Is there a place for me?" }, next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = { normal = "What do you ask of the Horde's warriors, Warchief?", polite = "If I may, Warchief, what do you ask of the Horde's warriors?", blunt = "What do you want from your warriors?" }, next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = { normal = "I'd guess the Frostwolves taught you to hunt, Warchief.", polite = "If I may guess, Warchief, the Frostwolves taught you to hunt.", blunt = "The Frostwolves taught you to hunt, I'd bet." }, next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = { normal = "I've cleared Ragefire Chasm, Warchief.", polite = "Warchief, I'm honored to report that Ragefire Chasm is cleared.", blunt = "Ragefire Chasm is cleared." }, next = "xcl_rfc", when = { cleared = "Ragefire Chasm", faction = "Horde" } },
        { text = { normal = "Rend Blackhand is dead, Warchief. I was there.", polite = "Warchief, I bring word that Rend Blackhand is dead. I was there.", blunt = "Rend Blackhand is dead, and I was there." }, next = "xcl_rend", when = { killed = { name = "Rend Blackhand" }, faction = "Horde" } },
        { text = { normal = "These are my companions, Warchief. We fight as one.", polite = "Allow me to present my companions, Warchief. We fight as one.", blunt = "These are my companions, and we fight together." }, next = "xpt_thrall", when = { party = true } },
        { text = { normal = "I've seen the Apothecarium's work, Warchief.", polite = "Warchief, with respect, I have seen the Apothecarium's work.", blunt = "I've seen what the Apothecarium is doing." }, next = "plague_word",
          when = { thread = { id = "new_plague", beat = "b6_thrall", state = { "stirring", "unfolding" } } } },
        { text = { normal = "Tell me about the peoples of the Horde, Warchief.", polite = "I'd be honored to hear about the peoples of the Horde, Warchief.", blunt = "Tell me about the Horde's peoples." }, next = "peoples" },
        { text = { normal = "How does a slave become Warchief?", polite = "If I may ask, how does a slave become Warchief?", blunt = "How did a slave end up Warchief?" }, next = "past" },
        { text = { normal = "What would you ask of me, Warchief?", polite = "How may I serve you, Warchief?", blunt = "What do you need from me?" }, next = "ask_me" },
        { text = { normal = "For the Horde.", polite = "For the Horde, Warchief.", blunt = "Lok'tar. For the Horde." }, next = "END", narr = "He lifts the Doomhammer a hand's width from the floor and lets it fall, and the sound rolls out through the hold.", reply = "For the Horde, and may the spirits guide your hand. Lok'tar ogar, {name}.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = { normal = "I fight for myself first, Warchief.", polite = "With respect, Warchief, I fight for myself first.", blunt = "I fight for myself first." }, next = "END", reply = "Then I hope you'll find, in time, that the Horde looks after those who look after it. Go well.", fx = { align = { honor = -1 } } },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? Speak plainly; I hear enough flattery from my advisors." },
        { id = "h_again2", text = "Go on. A Warchief who stops listening stops being one." },
        { id = "h_tone_polite", when = { chance = 0.5, tone = "polite" }, text = "You needn't bow and scrape, friend. I was a slave once, and I have no wish to be a master." },
        { id = "h_tone_blunt", when = { chance = 0.5, tone = "blunt" }, text = "You speak plainly, and I'm grateful for it. Half my advisors wrap every warning in honey, and a Warchief can starve on sweet words." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "With fear, and some of it is earned. Gul'dan's warlocks sold our people to the demons, and the blood they made us drink still burns in some of us, so every orc who calls up an imp reminds the Horde of the worst thing it ever did." },
        { id = "wl_troll", when = { race = "Troll" },
          text = "A Darkspear warlock is new to me, and to Vol'jin too, I'd wager. Your people never drank the blood, so perhaps you can show the orcs that the art and the curse aren't the same thing." },
        { id = "wl_cleft", when = { origin = "orc_cleft_initiate" },
          text = "You learned in the Cleft of Shadow, beneath Neeru's eye. Learn his spells if you must, but bring me what you hear down there, and never let him think he owns you." },
      },
      choices = {
        { text = "Then I'll use it to atone for what was done.", next = "warlock_atone" },
        { text = "What I bind will serve the Horde, Warchief, never the reverse.", next = "BACK", reply = "Then you're a warlock I can trust, and there aren't many. Bind them well, and never let them bind you.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The old pacts made us strong, Warchief. You know that's true.", next = "BACK", reply = "It's true, and it's a truth I'd rather forget. They made us strong, and they made us slaves.", fx = { affinity = -3, align = { light = -1 } } },
      },
    },
    warlock_atone = {
      lines = { { id = "wa_default", text = "Atone. I like that word in a warlock's mouth more than I expected to. My people can't undo the blood, but we can choose what we do with what it left us, and if you mean that, you'll have my respect long before you have the city's." } },
      choices = { { text = "I mean it, Warchief.", next = "BACK", fx = { affinity = 2 } } },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Then you know they don't obey, they agree, and the day you forget that they'll stop agreeing. Drek'Thar taught me that in the snows of Alterac, and I've had to relearn it every year since I became Warchief." },
        { id = "sh_student", when = { origin = "orc_thrall_shaman" },
          text = "One of the students my shamans took in. You're the reason I gave them the time, because the Horde will need shamans long after it stops needing me." },
        { id = "sh_tauren", when = { race = "Tauren" },
          text = "The tauren kept the old ways when my people forgot them. When the Earth Mother speaks through you, I listen as carefully as I'd listen to the elements themselves." },
      },
      choices = {
        { text = "It must be harder to hear them as Warchief.", next = "shaman_harder" },
        { text = "I'll remember they agree, not obey.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    shaman_harder = {
      lines = { { id = "sz_default", text = "Much harder. A chieftain wants answers, and the spirits only offer balance. Some nights I go up to the hills outside the city and sit until the wind stops sounding like advisors." } },
      choices = { { text = "Then I'll keep the hills quiet for you.", next = "BACK", fx = { affinity = 2 } } },
    },
    orcmage = {
      lines = {
        { id = "om_default", text = "It troubles some of my chieftains more than it troubles me. Our warlocks reached for power without asking what it cost, and that's the one thing I'd ask you never to do, whatever the source." },
        { id = "om_primer", when = { origin = "orc_camp_primer" },
          text = "A primer stolen from a camp guard, I'm told. I learned my letters from a human too, in Durnholde, so I won't be the one to tell you where knowledge may come from." },
      },
      choices = {
        { text = "The Horde needs new strength, Warchief, not only the old ways.", next = "BACK", reply = "It does, and I won't deny it. Seek it, but ask what it costs.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask what it costs. I'll answer to the Horde.", next = "BACK", reply = "That's all I ask of anyone. Answer to the Horde, and you'll have my trust.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    paladin = {
      big = true,
      lines = { { id = "pa_default", text = "Then you're a riddle I didn't expect to meet in my own hall. The Light has been a human weapon against my people for as long as I've lived, and if it burns you and you lift it anyway, I'd like to hear why." } },
      choices = {
        { text = "Because it hurts. I deserve to feel what I was.", next = "paladin_why" },
        { text = "The Light belongs to whoever bears its pain, Warchief.", next = "BACK", reply = "That's a braver answer than I expected. I'll remember it the next time a chieftain asks why I let you into this hall.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It's only a weapon. I use it on the living.", next = "BACK", reply = "A weapon, then, and I'd ask you to point it carefully. The Light has a long memory in my people.", fx = { align = { light = -1 } } },
      },
    },
    paladin_why = {
      lines = { { id = "py_default", text = "Penance, then. I know something of hating what others made you into. Just don't let the guilt become another master, because you've had enough of those, and so have I." } },
      choices = { { text = "I'll try, Warchief.", next = "BACK", fx = { affinity = 2 } } },
    },
    frostwolf = {
      lines = { { id = "fw_default", text = "Then you're kin of my kin. The Frostwolves took me in when I was nothing but an escaped slave half-dead in the snow, and Drek'Thar taught me the elements by their fires. Is the old shaman well?" } },
      choices = { { text = "He's well, and he speaks of you often.", next = "BACK", fx = { affinity = 3 } },
        { text = "He's old, Warchief, and the valley is hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    horde = {
      big = true,
      narr = "He takes the Doomhammer from where it leans against the throne and turns it once in his hands before he answers.",
      lines = {
        { id = "hd_default", text = "Once it stood for conquest. The demons made us into a weapon and pointed us at the world. Now it stands for survival, and for honour, and for each other. I mean to keep it that way." },
      },
      choices = {
        { text = "I'll help you keep it.", next = "BACK", reply = "Then you're part of what I'm building here, and I'll be glad of every hand I can get.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Survival matters more than honour, Warchief.", next = "BACK", reply = "Survival without honor is the camps, and I'll not have the Horde go back there. Think on it.", fx = { align = { honor = -1 } } },
        { text = "Not everyone agrees.", next = "agree" },
      },
    },
    agree = {
      lines = { { id = "a_default", text = "No. Some still dream of the old fire, so I watch them, and I give them chances, and when they betray us, I don't miss." } },
      choices = { { text = "...", next = "END" } },
    },
    neeru_suspect = {
      lines = {
        { id = "ns_default", text = "Since the day he offered to watch the Burning Blade for me. Nobody knows that much about a fire without standing close to it, and Neeru knows that fire very well indeed. I keep him where I can see him, and I let him think I'm grateful." },
        { id = "ns_chasm", when = { questDone = TODO_QUEST("Hidden Enemies") },
          text = "You've been down in the chasm and seen what crawls there, so yes, I suspect him. A snake I can see is safer than one I can't, and so he stays in the Cleft, and I watch him smile." },
      },
      choices = {
        { text = "Your secret is safe with me, Warchief.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll keep listening to him, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    neeru_not_yet = {
      lines = {
        { id = "nn_default", text = "Neeru serves the Horde, as you do. If you have proof, bring it to me; if you have only a feeling, keep it to yourself for now." },
        { id = "nn_stranger", text = "I don't speak ill of my advisors to someone I barely know. Earn that, and ask me again." },
      },
      choices = { { text = "Understood, Warchief.", next = "BACK" } },
    },
    theramore = {
      lines = { { id = "t_default", text = "Jaina Proudmoore is a friend, though her people and mine aren't. We keep the peace between us with our own hands, because nobody else will. It is harder than any battle I've fought." } },
      choices = {
        { text = "...", next = "END", fx = { affinity = 1 } },
        { text = "How did you come to trust her, Warchief?", next = "jaina" },
      },
    },

    -- 0.71.0 depth pass: the Horde's peoples, Thrall's past, his burden, and what he asks.
    peoples = {
      hub = true,
      lines = {
        { id = "pp_default", text = "Four peoples stand under one banner now, and each of them looks at the same sunrise a different way. Ask about any of them and I'll tell you what I know and what I'm still learning, because a Warchief who thinks he understands his allies has already stopped listening." },
        { id = "pp_scourge", when = { race = "Scourge" }, text = "Four peoples stand under one banner now, and yours is the newest and the least understood. Ask about any of them, though I'll warn you that I speak of the others more easily than I speak of the dead." },
      },
      again = {
        { id = "pp_again", text = "Who else would you hear about? There's no shortage of opinions in this hall." },
        { id = "pp_again2", text = "Ask on. I'd rather you heard it from me than from the taverns in the Drag." },
      },
      choices = {
        { text = { normal = "What of the orc clans, Warchief?", polite = "If I may, Warchief, what of the orc clans?", blunt = "What about the orc clans?" }, next = "clans" },
        { text = { normal = "What of the Darkspear trolls?", polite = "And what of the Darkspear trolls, Warchief?", blunt = "What about the Darkspear?" }, next = "darkspear" },
        { text = { normal = "What of the tauren and Cairne Bloodhoof?", polite = "What of the tauren and Cairne Bloodhoof, Warchief?", blunt = "What about the tauren and Cairne?" }, next = "tauren_p" },
        { text = { normal = "What of the Forsaken and their queen?", polite = "What of the Forsaken and their queen, if I may ask?", blunt = "What about the Forsaken and their queen?" }, next = "forsaken_p" },
        { text = { normal = "And Jaina Proudmoore's humans?", polite = "And what of Lady Proudmoore's humans, Warchief?", blunt = "And Jaina's humans?" }, next = "theramore" },
        { text = { normal = "Enough of the peoples, Warchief.", polite = "Thank you, Warchief. That's enough of the peoples.", blunt = "That's enough about the peoples." }, next = "hello" },
      },
    },
    clans = {
      lines = {
        { id = "cl_default", text = "The Frostwolves, the Warsong, the Blackrock who stayed loyal, and the orcs born in the camps who never had a clan at all, and I've tried to make one Horde out of all of them. Some days the old banners matter more to my people than the new one, and I can't blame them, because a clan is the one thing the demons never managed to take." },
        { id = "cl_orc", when = { race = "Orc" }, text = "You know this as well as I do, {g:brother|sister}, because if you ask any orc in the Drag for their clan you'll learn more about them than their name ever told you. I've tried to make one Horde out of all those banners, and some days the old ones still pull harder than the new." },
      },
      choices = {
        { text = "Grom Hellscream was Warsong. Tell me of him.", next = "grom" },
        { text = "I'm Warsong too, Warchief. Grom's clan.", next = "warsong_kin", when = { origin = "orc_warsong_kin" } },
        { text = "I was born in the camps, Warchief. I've no clan.", next = "camp_born", when = { origin = { "orc_camp_born", "orc_camp_primer" } } },
        { text = "Not every orc follows you, though.", next = "dissent" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    grom = {
      lines = { { id = "gr_default", text = "Grom was the first of us to drink Mannoroth's blood and the last of us to be free of it, and he bought that freedom with his life in a canyon in Ashenvale. He killed the demon who chained us, and I held him while he died, and he told me he was free, so whenever an orc tells me our people are cursed for good, I think of that." } },
      choices = {
        { text = "Then the blood can be overcome.", next = "grom2", fx = { affinity = 1 } },
        { text = "What became of his clan?", next = "grom2" },
      },
    },
    grom2 = {
      lines = { { id = "gr2_default", text = "His Warsong still log the forest in Ashenvale and fight the night elves for every tree, and I gave them that work because Orgrimmar needs timber and the Warsong need a fight they can win. I'm not certain I chose well, because Grom's people are brave to the bone and they listen to me about as often as he did.", fx = { learn = { "warsong" } } } },
      choices = {
        { text = "The Warsong need a fight, Warchief. Let them have it.", next = "BACK", fx = { trait = { brave = 1 }, opinion = { warsong = "support" } } },
        { text = "The night elves will only send more Sentinels.", next = "BACK", fx = { trait = { cautious = 1 }, opinion = { warsong = "restrain" } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    warsong_kin = {
      lines = { { id = "wk_default", text = "Then you carry Grom's name in your blood, and I'd ask you to carry it the way he finished and not the way he started. Tell me, do your kin at Splintertree still sing his death-song at the fires, or have they made new songs of their own?" } },
      choices = {
        { text = "They still sing it, Warchief, every night.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "They sing new ones, mostly about killing night elves.", next = "warsong_kin2", fx = { trait = { witty = 1 } } },
      },
    },
    warsong_kin2 = {
      lines = { { id = "wk2_default", text = "That's the Warsong for you, and Grom would have laughed at every verse. Just remember that the kaldorei were defending their forest long before we came to it, and a good song is a poor reason to start a war the Horde can't finish." } },
      choices = { { text = "I'll remember, Warchief.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp_born = {
      lines = { { id = "cb_default", text = "Then you were born in the same kind of cage I was raised beside, and you know what the humans never understood, that the stillness in the camps wasn't laziness but grief, because our people had lost the demon fire and found nothing to put in its place. What do you remember of it?" } },
      choices = {
        { text = "The fence, and the guards laughing at us.", next = "camp_born2", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Very little, Warchief. I've tried hard to forget.", next = "camp_born2", fx = { trait = { cautious = 1 } } },
        { text = "My parents, waiting for something that never came.", next = "camp_born2", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    camp_born2 = {
      lines = { { id = "cb2_default", text = "Remember it anyway, all of it, because the young ones born in Durotar will never see a fence, and someone has to tell them what we were freed from so they understand what they're guarding. That's no small thing to ask of you, and I'm asking it." } },
      choices = { { text = "I'll tell them, Warchief.", next = "BACK", fx = { affinity = 2 } } },
    },
    dissent = {
      lines = { { id = "ds_default", text = "Some still kneel in the Spire with the Blackrock, and some fed the fire under my own city, and each of them was once an orc I'd have died to free. If one of them came to my gate tomorrow and laid down his axe, I'd have to decide what kind of Warchief I am, so tell me, what would you do?" } },
      choices = {
        { text = "Take him back, Warchief. Every orc freed is a victory.", next = "BACK", fx = { trait = { kind = 1 }, opinion = { orc_traitors = "mercy" } } },
        { text = "He chose the dragons. Let him die among them.", next = "BACK", fx = { trait = { stern = 1 }, opinion = { orc_traitors = "hardline" } } },
        { text = "Who leads the Blackrock in the Spire?", next = "spire" },
      },
    },
    spire = {
      lines = {
        { id = "sp_default", text = "Rend Blackhand, the son of the Warchief who led the Horde before Orgrim, and he calls himself Warchief now and calls me a slave who learned his masters' manners. He sits in Blackrock Spire with the black dragons at his back, and I sent the Kargath expedition into the Badlands to watch him, because I can't spare an army to go and fetch him.", fx = { learn = { "blackrock" } } },
        { id = "sp_dead", when = { killed = { name = "Rend Blackhand" } }, text = "Rend Blackhand did, until you and yours put an end to him, and now the black dragons hold orcs without a chief, which is either the best news I've had this year or the most dangerous.", fx = { learn = { "blackrock" } } },
      },
      choices = { { text = "Something else, Warchief.", next = "BACK" } },
    },
    darkspear = {
      lines = {
        { id = "dk_default", text = "The Darkspear were dying on an island in the south seas when our ships wrecked there, hunted by murlocs and a sea witch, and their chieftain Sen'jin died so that we could get his people away. Vol'jin swore the Darkspear to the Horde for that, and he has kept the oath better than some orcs keep theirs." },
        { id = "dk_sailed", when = { origin = "troll_sailed_with_thrall" }, text = "You were on that island, weren't you? Then you remember the storm and the murlocs and Sen'jin better than I do, because I only lost a few ships, and your people lost their chieftain." },
        { id = "dk_troll", when = { race = "Troll" }, text = "Your people were dying on an island in the south seas when our ships wrecked there, and Sen'jin gave his life so we could get you away. Vol'jin swore the Darkspear to the Horde for that, and I've never once had cause to regret taking that oath." },
      },
      choices = {
        { text = "What does Vol'jin want for his people?", next = "darkspear2" },
        { text = "I was on that island when your ships came.", next = "sailed", when = { origin = "troll_sailed_with_thrall" } },
        { text = "The Amani trolls fought for the old Horde, as I recall.", next = "trolls_old" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    darkspear2 = {
      lines = { { id = "dk2_default", text = "His home back, which means the Echo Isles off our coast, where a witch doctor named Zalazane has turned his own people into hexed slaves. I gave Vol'jin my word that the Horde would help him, and the hardest part of being Warchief is keeping a promise like that while the Scourge and the Alliance and the Blackrock all want my warriors first.", fx = { learn = { "echo_isles" } } } },
      choices = {
        { text = "I'll help the Darkspear at Sen'jin, Warchief.", next = "BACK", fx = { affinity = 1, opinion = { darkspear = "ally" } } },
        { text = "The Horde has bigger enemies than one witch doctor.", next = "BACK", fx = { trait = { stern = 1 }, opinion = { darkspear = "later" } } },
      },
    },
    trolls_old = {
      lines = { { id = "to_default", text = "They did, the Amani of the northern forests, because they hated the elves more than they feared us, and when the war turned they left us to the camps without a backward glance. The Darkspear are another tribe with another debt, and I've learned that trolls, like orcs, should not be judged by their worst chieftains." } },
      choices = { { text = "Something else, Warchief.", next = "BACK" } },
    },
    sailed = {
      lines = { { id = "sa_default", text = "Then you saw the worst day of my first voyage, and I've never asked a Darkspear what it looked like from the shore. Tell me plainly, did your people think we'd come to save them, or to make them slaves?" } },
      choices = {
        { text = "We thought you'd be just another master, Warchief.", next = "sailed2", fx = { trait = { skeptical = 1 } } },
        { text = "We saw you fight for us, and we knew.", next = "sailed2", fx = { affinity = 1, trait = { generous = 1 } } },
      },
    },
    sailed2 = {
      lines = { { id = "sa2_default", text = "Fair, either way, because I'd have thought the worst of us too after the stories the old Horde left behind. The Darkspear trusted us before we'd earned it, and I want every orc in this city to remember that trust was given first, and not paid for." } },
      choices = { { text = "I'll remind them, Warchief.", next = "BACK", fx = { affinity = 2 } } },
    },
    tauren_p = {
      lines = {
        { id = "tr_default", text = "Cairne Bloodhoof found us lost in the Barrens with the centaur at our heels, and he never asked what we'd done in the old war before he fought beside us. He taught me what it is to lead a people who would rather be at peace, and I go to Thunder Bluff whenever I need to remember why I'm doing any of this." },
        { id = "tr_tauren", when = { race = "Tauren" }, text = "Your people taught mine that the land isn't something you conquer but something you belong to, and we were slow students. Cairne was patient with us, as he's patient with everyone except the Grimtotem." },
      },
      choices = {
        { text = "I'd guess Cairne disagrees with you sometimes.", next = "tauren2" },
        { text = "I walked the long road to Mulgore as a calf.", next = "migration", when = { origin = { "tauren_long_migration", "tauren_plains_runner", "tauren_narache_hunter" } } },
        { text = "I was born Grimtotem, Warchief.", next = "grimtotem", when = { origin = "tauren_grimtotem_born" } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    tauren2 = {
      lines = { { id = "tr2_default", text = "Often, and gently, which is worse than shouting because he's usually right. It was Cairne and his Arch Druid who pressed me to take in the Forsaken, and I agreed because I trust his judgement more than my own unease, and I'm still watching to see which of us was wiser." } },
      choices = {
        { text = "And what do you make of the Forsaken?", next = "forsaken_p" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    migration = {
      lines = { { id = "mg_default", text = "Then you saw the orcs who fought beside your herds, and I hope we looked better from where you stood than we felt at the time. Tell me, what do your people say about us around the fires in Bloodhoof, when no orc is listening?" } },
      choices = {
        { text = "That you keep your word, Warchief.", next = "migration2", fx = { affinity = 1, opinion = { orcs = "trust" } } },
        { text = "That orcs are loud and eat far too much.", next = "migration2", fx = { trait = { witty = 1 } } },
        { text = "That some of you still frighten them.", next = "migration2", fx = { trait = { honest = 1 }, opinion = { orcs = "wary" } } },
      },
    },
    migration2 = {
      lines = { { id = "mg2_default", text = "I'll take all of it, because I'd sooner hear it from you than learn it too late. The tauren gave us friendship before we'd earned it, so if your people ever stop trusting mine, I want to know the day it starts." } },
      choices = { { text = "I'll tell you, Warchief.", next = "BACK", fx = { affinity = 1 } } },
    },
    grimtotem = {
      lines = { { id = "gt_default", text = "Then you made a hard choice, and you'll make it again every time you pass a Grimtotem on the road. Magatha sits in Thunder Bluff and smiles at Cairne, and I don't need to be a shaman to hear what she thinks of orcs, so if your kin ever let slip what she plans, tell Cairne before you tell me.", fx = { learn = { "grimtotem" } } } },
      choices = { { text = "Cairne first, Warchief. I understand.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
    forsaken_p = {
      lines = {
        { id = "fk_default", text = "The Forsaken were humans and elves once, and the Scourge made them into the very thing they'd fought, until their queen tore them free and gave them a name for what was done to them. I took them into the Horde because I know what it is to be made into a weapon by someone else's hand, and because Cairne asked me to." },
        { id = "fk_scourge", when = { race = "Scourge" }, text = "You'll know better than I do what it is to be what you are, so bear with me if I speak of your people as a stranger, because that's still what I am to them. I took the Forsaken in because I know what it is to be made into someone else's weapon." },
      },
      choices = {
        { text = "You can't really trust the Dark Lady.", tag = "Persuade", next = "sylvanas_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "discreet" }, { origin = "orc_frostwolf" } } } },
          fail = { next = "sylvanas_no", fx = { affinity = -1 } } },
        { text = "What does she want from the Horde?", next = "forsaken2" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    sylvanas_truth = {
      lines = { { id = "st_default", text = "Trust is the wrong word, though Vol'jin says so more loudly than I would. I believe she hates the Lich King more than anything alive or dead, but her apothecaries brew plague beneath Lordaeron, and a plague is a plague whoever it's aimed at, because I watched the last one empty a kingdom." } },
      choices = {
        { text = "Then why keep her close?", next = "sylvanas_truth2" },
        { text = "I'll say nothing of this, Warchief.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
      },
    },
    sylvanas_truth2 = {
      lines = { { id = "st2_default", text = "Because the Forsaken stand between the Scourge and the rest of the Horde, and because they were wronged as surely as my people were, and I won't be the one who tells the wronged there's no place for them. If I'm wrong about her, I'd rather learn it while she's my ally than while she's no one's." } },
      choices = { { text = "That sounds like wisdom, Warchief.", next = "BACK", fx = { affinity = 1 } } },
    },
    sylvanas_no = {
      lines = { { id = "sn_default", text = "She is our ally, and I speak of our allies with respect in this hall, as I'd expect you to. Ask me again when I know you better." } },
      choices = { { text = "As you say, Warchief.", next = "BACK" } },
    },
    plague_word = {
      big = true,
      narr = "He waves the waiting messenger out of the throne room and does not speak again until the doors have closed behind him.",
      lines = { { id = "pw_default", text = "Then tell me plainly, and don't soften it for my sake. I get courtiers' answers from Lordaeron by every rider, and I'd like one from someone who walked through the place." } },
      choices = {
        { text = "It's aimed at the Scourge, Warchief. They've earned that weapon.", next = "plague_trust",
          fx = { thread = { id = "new_plague", state = "resolved" }, affinity = 1, align = { light = -1 } },
          journal = { first = "Told Thrall the Society's plague is aimed at the Scourge. He nodded slowly, like a man setting down something heavy.",
                      third = "{name} told Thrall the Forsaken plague was aimed at the Scourge, and the Warchief took it as a warrior's word." } },
        { text = "A plague is a plague, Warchief. Keep watching them.", next = "plague_watch",
          fx = { thread = { id = "new_plague", state = "soured" }, affinity = 1, align = { light = 1 } },
          journal = { first = "Told Thrall a plague is a plague, whoever brews it. He didn't look surprised, only tired.",
                      third = "{name} told Thrall a plague is a plague, whoever brews it, and the Warchief did not look surprised." } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    plague_trust = {
      lines = { { id = "pt_default", text = "Then I'll take that as a warrior's word, and I'll hold the Dark Lady to that aim until she gives me a reason not to. The Forsaken have bled for the Horde, and I'd sooner trust them a little too far than not at all." } },
      choices = { { text = "For the Horde, Warchief.", next = "END" } },
    },
    plague_watch = {
      lines = { { id = "pw2_default", text = "I was afraid you'd say that, and I'm glad you said it to my face. She's our ally and she'll stay one, but I'll be listening for news out of Lordaeron more closely than I'd like." } },
      choices = { { text = "...", next = "END" } },
    },
    forsaken2 = {
      lines = { { id = "fk2_default", text = "A home, room to fight the Scourge, and the Horde's protection while she builds both, which is fair, because we wanted much the same when we came to Kalimdor. Some of my warriors tell me the dead have no place among the living and some tell me the Forsaken fight harder than anyone, so which would you tell me?" } },
      choices = {
        { text = "They've bled for the Horde, and that earns their place.", next = "BACK", fx = { affinity = 1, opinion = { forsaken = "trust" } } },
        { text = "The dead serve the dead, Warchief. Keep watching them.", next = "BACK", fx = { trait = { skeptical = 1 }, opinion = { forsaken = "distrust" } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    jaina = {
      lines = {
        { id = "ja_default", text = "The prophet who sent me across the sea sent her too, and at Mount Hyjal, with the Legion at the door, we stood together because the alternative was dying apart. When her father came after us in Durotar she let him fall rather than break the peace, and I don't think anyone who hasn't lost a parent to their own choices understands what that cost her." },
        { id = "ja_alliance", when = { faction = "Alliance" }, text = "You wear the Alliance's colours in my hall, so I'll say this plainly. Jaina and I stood together at Hyjal because the alternative was dying apart, and we keep this peace with our own hands, so be careful what you carry back to Stormwind about it." },
      },
      choices = {
        { text = "The peace seems fragile, Warchief.", next = "peace" },
        { text = "Then she has earned the Horde's trust as well.", next = "BACK", fx = { affinity = 1, opinion = { jaina = "trust" } } },
        { text = "I'll trust her when Theramore's walls come down.", next = "BACK", fx = { affinity = -1, opinion = { jaina = "distrust" } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    peace = {
      big = true,
      narr = "He looks past you to the great doors, where the dust of the Valley of Strength hangs in the light, and is quiet a moment before he speaks.",
      lines = { { id = "pc_default", text = "It holds because neither of us lets it break, and there are men in Theramore and orcs in Razor Hill who'd break it tomorrow if we turned our backs. Every Kul Tiran soldier at Tiragarde Keep makes my chieftains ask why we don't strike first, so tell me, would you?" } },
      choices = {
        { text = "Keep the peace, Warchief. Your word to Jaina binds us.", next = "BACK", reply = "It does, and I'll keep it. Say that again where my chieftains can hear you, would you?", fx = { affinity = 1, align = { honor = 1 }, opinion = { peace = "for" } } },
        { text = "Strike first. The humans will never forget the camps.", next = "BACK", reply = "They won't forget, and neither will I. But a war now would cost us everything we've built.", fx = { align = { honor = -1 }, opinion = { peace = "against" } } },
        { text = "I'd ask Jaina what she fears before deciding.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    past = {
      hub = true,
      lines = { { id = "ps_default", text = "I was raised in Durnholde by a human lord who wanted a pet gladiator, and I've been a slave and a fugitive and a shaman and a chieftain since, though not always in that order. Ask what you like, because I'd rather my people knew the truth of where their Warchief came from than the songs about it." } },
      again = {
        { id = "ps_again", text = "What else would you know of the old days?" },
        { id = "ps_again2", text = "Ask on. These memories are lighter when someone else carries a little of them." },
        { id = "ps_tone_polite", when = { chance = 0.5, tone = "polite" }, text = "There's no need for titles when we speak of Durnholde. I was only a slave there, and I'd rather you heard the story the way that slave would tell it." },
      },
      choices = {
        { text = { normal = "What was Durnholde like?", polite = "If I may ask, Warchief, what was Durnholde like?", blunt = "What was Durnholde really like?" }, next = "durnholde" },
        { text = { normal = "Who taught you to hear the elements?", polite = "Who taught you to hear the elements, Warchief?", blunt = "Who taught you the elements?" }, next = "alterac" },
        { text = { normal = "How did Doomhammer come to choose you?", polite = "If I may ask, how did Doomhammer come to choose you?", blunt = "Why did Doomhammer pick you?" }, next = "doomhammer" },
        { text = { normal = "Why did you bring the Horde across the sea?", polite = "Why did you bring the Horde across the sea, Warchief?", blunt = "Why did you bring us across the sea?" }, next = "kalimdor" },
        { text = { normal = "Something seems to weigh on you, Warchief.", polite = "Forgive me, Warchief, but something seems to weigh on you.", blunt = "Something's weighing on you." }, next = "burden" },
        { text = { normal = "Enough of the past, Warchief.", polite = "Thank you, Warchief. That's enough of the past.", blunt = "That's enough of the past." }, next = "hello" },
      },
    },
    durnholde = {
      lines = { { id = "du_default", text = "Durnholde was a fortress in the hills above Hillsbrad, where Aedelas Blackmoore taught me to fight in his arena and taught me to read so that I'd make a better weapon for him. He named me Thrall because that's what I was, and I kept the name after I left, so I'd never forget what this Horde was built to end." } },
      choices = {
        { text = "No one there can have shown you kindness.", next = "taretha" },
        { text = "You must hate the humans for it.", next = "durnholde_hate" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    taretha = {
      lines = {
        { id = "ta_default", narr = "For a moment he looks past you at the far wall of the hall, and his thick fingers close slowly around the haft of the hammer.", text = "One did, a girl named Taretha Foxton who passed me letters and books when no one was looking, and she helped me escape when I was grown. Blackmoore had her killed for it, and I've carried her with me ever since, because she's the reason I know a human heart can be as good as any orc's." },
        { id = "ta_warm", when = { disposition = { min = 65 } }, text = "One did, a girl named Taretha Foxton who passed me letters when no one was looking and helped me escape, and Blackmoore had her killed for it. I've told very few people what she was to me, so hear it plainly: she was my friend when I had no one, and I've never stopped wishing I could repay her." },
      },
      choices = {
        { text = "I'm sorry, Warchief.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Is that why you keep the peace with Theramore?", next = "theramore" },
      },
    },
    durnholde_hate = {
      lines = { { id = "dh_default", text = "I did, for a long time, and hatred kept me alive in that arena more than once. Then I broke Durnholde open and killed Blackmoore in his own keep, and found it filled nothing, so I put the hate down, and the Syndicate squat in its ruins now, which seems about what it deserved." } },
      choices = {
        { text = "Some hatred is earned, Warchief.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "You've done better with it than most would.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    alterac = {
      lines = {
        { id = "al_default", text = "Drek'Thar of the Frostwolves, an old blind shaman who took in a half-frozen runaway and taught him to listen before he spoke. The Frostwolves were exiled to Alterac for refusing the demon blood, and they were the first orcs who ever looked at me as one of their own, and it was there I learned who my father was.", fx = { learn = { "alterac" } } },
        { id = "al_frost", when = { origin = "orc_frostwolf" }, text = "Drek'Thar, as you'll have guessed, since you've sat by the same fires and know how long he can go without saying a word. The Frostwolves were the first orcs who ever looked at me as one of their own, and it was in that valley I learned who my father was.", fx = { learn = { "alterac" } } },
      },
      choices = {
        { text = "Who was your father?", next = "durotan" },
        { text = "I'd guess the Frostwolves still hold the valley.", next = "alterac2" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    alterac2 = {
      lines = { { id = "al2_default", text = "They do, and they'll never leave it, because the valley is where Durotan's people learned to live without the fire. I asked Drek'Thar to come south with me, and he told me an old wolf doesn't change its den, which was his way of saying someone must keep the old ways where they were kept." } },
      choices = { { text = "Something else, Warchief.", next = "BACK" } },
    },
    durotan = {
      lines = { { id = "dt_default", text = "Durotan, chieftain of the Frostwolves, who went to warn Orgrim Doomhammer about Gul'dan and was murdered in the forest for it, along with my mother Draka. Blackmoore's men found me beside them, and I named this land Durotar for him, so that his name would stand somewhere it can never be exiled from." } },
      choices = {
        { text = "He'd be proud of you, Warchief.", next = "BACK", fx = { affinity = 1 } },
        { text = "You must wonder who you'd have been.", next = "durotan2", when = { disposition = { min = 65 } } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    durotan2 = {
      lines = { { id = "d2_default", narr = "He glances toward Eitrigg at the foot of the throne and waits until the old orc turns away before he answers.", text = "I wonder about it more often than I'd admit to my advisors. I'd have been a Frostwolf, I think, raised in the snow with a wolf and a clan and no notion of Warchiefs, and some part of me envies that orc very much, so don't repeat it in the Drag, because my people need a Warchief and not a son still missing his father." } },
      choices = { { text = "It stays between us, Warchief.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } } },
    },
    doomhammer = {
      lines = { { id = "dm_default", text = "He'd been hiding in the hills, a living legend who'd slipped the camps, and when I came to him he tested me with weapons before he'd hear a word. We broke the camps open together, and when a knight's lance took him from behind he gave me his hammer and his armour and the Horde in one breath, which is more than any orc should be handed at once." } },
      choices = {
        { text = "You can't have felt ready.", next = "doomhammer2" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    doomhammer2 = {
      lines = { { id = "dm2_default", text = "No, and I'm not certain I do yet, though I've stopped waiting to feel it. Orgrim led the old Horde through the Second War and lost it, and he told me once that he hoped I'd make a better Horde than he had, so every day I'm trying to answer a question a dead orc asked me." } },
      choices = {
        { text = "You're answering it, Warchief.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    kalimdor = {
      lines = { { id = "ka_default", text = "A prophet came to me in a dream and then in the flesh, a man who wore a raven's shape, and he told me the old world was doomed and the Horde's future lay across the sea. I believed him because nothing else I'd seen made sense, and he was right, because the Scourge swallowed Lordaeron not long after our ships left it." } },
      choices = {
        { text = "And the Legion followed you here.", next = "hyjal" },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    hyjal = {
      lines = { { id = "hy_default", text = "It did, and at Mount Hyjal orcs and humans and night elves stood together against Archimonde, which none of us would have believed a year before. I sometimes think it was the only time this world was ever wise, and I'm afraid it won't remember how.", fx = { learn = { "burning_legion" } } } },
      choices = {
        { text = "Then the Horde must remember for it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    burden = {
      big = true,
      lines = {
        { id = "bu_default", narr = "He rolls one armoured shoulder as if the black plate sits badly on it, and lowers his voice so it carries no farther than you.", text = "Everything weighs on me, and nothing so much as the fear that I'll become what I fought, a master who thinks he knows what's best for orcs who never asked him. The Horde follows me because I freed it, and I'm not sure gratitude is a good enough reason for anyone to follow anyone, so tell me, should a Warchief rule alone?" },
        { id = "bu_warm", when = { disposition = { min = 65 } }, text = "I'll tell you what I don't tell my chieftains: some mornings I put on Doomhammer's armour and it feels like another set of chains, and the only thing that gets me through the gate is knowing the peons in the Valley of Strength never chose their burdens either. So tell me, should a Warchief carry it all alone?" },
        { id = "bu_cold", when = { disposition = { max = 34 } }, text = "A Warchief's burdens are his own to carry, though I'll ask you one thing about them, since you asked me. Should a Warchief rule alone, or share the weight?" },
      },
      choices = {
        { text = "The Horde needs one strong hand, Warchief, not a council.", next = "BACK", reply = "Perhaps, but a strong hand can become a cruel one. I'll keep my chieftains close.", fx = { align = { order = 1 } } },
        { text = "Let the chieftains share the weight, Warchief.", next = "BACK", reply = "They do, more than you know. Perhaps I should let them share more of it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Do the elements give you no counsel?", next = "shaman_harder" },
        { text = "I'm one of your students. We listen for you.", next = "student", when = { origin = "orc_thrall_shaman" } },
        { text = "Something else, Warchief.", next = "BACK" },
      },
    },
    student = {
      lines = { { id = "su_default", text = "Then you're carrying some of it already, whether you knew it or not, because every young shaman who hears the elements is one less thing my people need to ask of me. Tell me, which of them speaks to you most clearly?" } },
      choices = {
        { text = "Earth, Warchief. It's patient with me.", next = "student2", fx = { trait = { patient = 1 } } },
        { text = "Fire. It answers before I've finished asking.", next = "student2", fx = { trait = { brave = 1 } } },
        { text = "Water, Warchief. It heals.", next = "student2", fx = { trait = { kind = 1 } } },
        { text = "Air. It carries every voice to me.", next = "student2", fx = { trait = { curious = 1 } } },
      },
    },
    student2 = {
      lines = { { id = "su2_default", text = "Good, and don't let anyone tell you one is better than the others, because a shaman who favours a single element forgets to ask the rest. Drek'Thar told me that when I was about your age, and I'm only now beginning to understand him." } },
      choices = { { text = "I'll listen to all of them, Warchief.", next = "BACK", fx = { affinity = 2 } } },
    },
    ask_me = {
      lines = {
        { id = "am_default", text = "First tell me something true, which is rarer in this hall than it ought to be. Why do you fight for the Horde, when the world would gladly let you fight for no one?" },
        { id = "am_alliance", when = { faction = "Alliance" }, text = "You stand in Grommash Hold wearing the Alliance's colours, which takes either courage or foolishness, so first tell me something true. Why do you fight at all, and for whom?" },
      },
      choices = {
        { text = "For my people, and for the ones who come after.", next = "ask_me2", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "For glory, and a name the songs remember.", next = "ask_me2", fx = { trait = { brave = 1 } } },
        { text = "Because you freed us, Warchief.", next = "ask_me_grat", fx = { affinity = 1 } },
        { text = "The truth? It pays better than anything else.", next = "ask_me2", fx = { affinity = -1, trait = { greedy = 1 } } },
      },
    },
    ask_me_grat = {
      lines = { { id = "amg_default", text = "Then I'll ask you for more than gratitude, because gratitude fades, and I want you to stand for the Horde because of what it is than because of who I am. If I fell tomorrow, would you still fight for it?" } },
      choices = {
        { text = "I would, Warchief, for what it's become.", next = "ask_me2", fx = { affinity = 2, opinion = { horde = "loyal" } } },
        { text = "I don't know, Warchief, and that's the truth.", next = "ask_me2", fx = { trait = { honest = 1 } } },
      },
    },
    ask_me2 = {
      lines = { { id = "am2_default", text = "That's an honest answer, and I'll remember it. What I ask of you is simple to say and hard to do, which is to give the Horde a better name in every village you pass through, because most of the world still thinks of us as the orcs who burned it, and only people like you can prove them wrong." } },
      choices = {
        { text = "I'll carry that name well, Warchief.", next = "BACK", fx = { affinity = 1 } },
        { text = "The world can think what it likes of us.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Those are generous words, and I can hear that you mean them. Whatever I've built here was built by many hands, but I'll accept the praise on behalf of all of them." },
        { id = "s2", text = "I was raised by a man who praised me only when he wanted something, so I've learned to tell the difference. Yours is honestly given, and I thank you for it." },
        { id = "s3", when = { class = "SHAMAN" }, text = "From one who also listens to the elements, that means a great deal. The spirits don't flatter, and I don't think you do either." },
      },
      fail = {
        { id = "f1", text = "I was taught to read flattery by a master of it, in the pits of Durnholde, and I've no love for the lesson. Speak to me as one of the Horde and not as a courtier." },
        { id = "f2", text = "The Horde doesn't need a Warchief who grows fat on compliments. If you've something true to say, say it, and leave the rest outside my hall." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! There aren't many who'd speak to their Warchief that way, and fewer still that I'd thank for it. A Horde that can't laugh at its leader is no better than the one we left behind." },
        { id = "s2", text = "You've got fire in you, and you aren't afraid to turn it on me. Good, because I'd sooner have ten who challenge me than a hundred who only nod." },
      },
      fail = {
        { id = "f1", text = "I've been mocked by men who held my chains, and I answered them when the time came. You're not my jailer, {class}, so I'll simply tell you that you've misjudged this hall." },
        { id = "f2", text = "There's a difference between speaking freely and speaking like a fool, and you've just crossed it. I'll hear every voice of the Horde, but I don't have to respect every one." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "I don't frighten, but I do recognize strength when it stands in front of me, and yours is real. I'm glad it stands with the Horde and not against it.", narr = "Thrall studies you for a long moment, and then inclines his head." },
        { id = "s2", text = "There's a weight to you that I've seen in very few, and it would be foolish of me to ignore it. Speak, then, and know that the Warchief is listening closely." },
      },
      fail = {
        { id = "f1", text = "I stood beside Grom Hellscream against Mannoroth, and I faced Admiral Proudmoore's guns after that, so you'll forgive me if I don't tremble. Remember where you stand, and who stands around you." },
        { id = "f2", text = "Blackmoore tried for years to rule me with fear, and he is dead while I am Warchief. Don't try it again in my hall." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's not something I'll speak of with one I hardly know. Serve the Horde well, and there'll come a day when I'll tell you gladly." },
      { id = "gt2", text = "A Warchief must choose who hears what, and for now I choose to keep that to myself. Take it as a reason to prove yourself, and not as an insult." },
    },
    knows = {
      { id = "tp_knows", text = "The Warchief hears from every corner of the Horde, though not always the truth. Ask me about these, and I'll tell you what I believe." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've earned straight answers from me, and I'll give you as many as I have." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, because a Warchief answers his people, even the ones he isn't sure of yet." },
    },
    cenarion_circle = { { id = "tp_circle", text = "The tauren walk with the Cenarion Circle, and I'm glad of it; the world needs more who heal than wound." } },
    wailing_caverns = { { id = "tp_caverns", text = "The tauren have told me of something sick under the Barrens. When our young warriors are ready, they'll go in." } },
    burning_blade = { { id = "tp_blade", text = "Some of my own people still kneel to the old fire. They hide better than they think, and not as well as they hope." } },
    echo_isles = { { id = "tp_isles", text = "The Darkspear will have their home back. I gave Vol'jin my word, and I don't give it lightly." } },
    alterac = { { id = "tp_alterac", text = "The Frostwolves still hold the valley where my father's clan made its home, and Drek'Thar keeps their fires lit for any orc who needs one." } },
    warsong = { { id = "tp_warsong", text = "Grom's clan log Ashenvale for Orgrimmar's walls, and they're brave to the bone, though they listen to me about as often as Grom did." } },
    blackrock = { { id = "tp_blackrock", text = "They chose the Spire and the dragons over their own freedom, and I grieve for them more than I fear them." } },
    grimtotem = { { id = "tp_grimtotem", text = "They're Cairne's trouble more than mine, though Magatha's smile in Thunder Bluff never seems to reach her eyes." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Humans who would burn our allies in Tirisfal, and who'd burn us too if they ever found the ships to cross the sea." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is a plague that walks, and it serves a master who would see every living thing on Azeroth kneel. We fought its makers once on Hyjal, beside humans and night elves, and I have not forgotten how close we came to losing." } },
    forsaken = {
      { id = "tp_forsaken", text = "The Forsaken came to us outcast and hunted, and the tauren spoke for them in council. I gave them a place in the Horde because they had nowhere else, though I watch Sylvanas and her apothecaries more closely than I would like to admit." },
      { id = "tp_forsaken2", when = { race = "Undead" }, text = "You are one of Sylvanas's people, and you are welcome in my city as long as you honour the Horde. Prove the doubters wrong, and you will find no warchief more loyal to you than I am." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "Sylvanas Windrunner broke free of the Lich King's will by her own strength, and I respect that. But she keeps her own counsel, and her Royal Apothecary Society keeps even more of it." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is my friend and my elder, and his counsel has saved me from my own temper more than once. When the centaur hounded his people, the Horde stood with them, and the tauren have stood with us ever since." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin and his Darkspear were dying on their islands when I found them, and they pledged themselves to the Horde for that one act. I have never had to ask for their loyalty, because Vol'jin gives it freely." } },
    jaina = { { id = "tp_jaina", text = "Jaina Proudmoore fought beside me on Hyjal, and we have kept a peace since then that neither of our peoples entirely wants. I trust her, and I would rather not test how many of her soldiers share that trust." } },
    theramore = { { id = "tp_theramore", text = "Theramore is Jaina's city, and its harbour sits across the sea from Durotar. Northwatch Hold is another matter, and I have told my commanders in the Barrens to keep their axes sheathed unless Northwatch draws first." } },
    internment = {
      { id = "tp_internment", text = "I was raised a slave in Durnholde, and when I escaped, I found my people rotting in human camps, too weary in spirit to fight. Freeing them was the first true thing I ever did." },
      { id = "tp_internment2", when = { disposition = { min = 65 } }, text = "Since you ask as a friend, some nights I still wake in a cell at Durnholde with Blackmoore laughing outside the door. Then I hear Orgrimmar's drums, and I remember where I am." },
    },
    second_war = { { id = "tp_second_war", text = "I was a child in a human fortress while the Horde lost the Second War. I learned of it from my masters and later from those who fought it, and both told me the same thing in the end: the demons had made us into weapons." } },
    burning_legion = { { id = "tp_burning_legion", fx = { learn = { "dark_portal" } }, text = "The Legion used my people as a sword and threw us away when we broke. Grom Hellscream bought our freedom with his life in Ashenvale, and I will never let an orc become their weapon again." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad is the necromancer who spread the plague across Lordaeron. He was killed once, and he returned, and he holds the dead lands in the north for his master now." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is where the prince of Lordaeron put his own people to the sword. I have heard the story from Jaina, and I believe it, and I am glad I never met him." } },
    arthas = { { id = "tp_arthas", text = "Arthas was a prince who murdered his father and opened his kingdom to the Scourge. I do not know what became of him in the north, and I hope that I never learn it face to face." } },
    onyxia = { { id = "tp_onyxia", text = "A black dragon has made her lair in Dustwallow Marsh, and my scouts at Brackenwall say she is Deathwing's own daughter. Her father played the Dragonmaw for fools in the Second War, and I will not have the Horde used by his kin again." } },
    _none = { { id = "tp_none", text = "I don't know, but ask my advisors, and then come and tell me what they said, in plain words." } },
  },
}

P:NPC {
  key = "voljin", id = TODO_NPC("Vol'jin"), name = "Vol'jin",
  bible = "bibles/orgrimmar.md", role = "noble", tier = "major",
  communities = { "orgrimmar" }, temper = { "wry" }, values = { "cunning", "loyal", "wise" },
  private = { "yenniku" },
  race = "Troll", likesTone = "blunt",
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "He only talks to the interesting ones, and was deciding about me.",
    third = "{name} met Vol'jin, chief of the Darkspear trolls, who stands at the Warchief's side in Orgrimmar.",
  },

  greetings = {
    { id = "g_hall", text = "Come, sit. The Warchief talk to everybody, but Vol'jin only talk to the interesting ones, so let's see which you be." },
    { id = "g_troll", when = { race = "Troll" }, text = "Darkspear! Stand up straight, mon. Every orc in this city judge the whole tribe by your posture now." },
    { id = "g_back", when = { metBefore = true }, text = "You come back, good. That mean you still alive, and still worth the talking to." },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, mon, and Vol'jin was starting to wonder if the jungle ate you. Sit, and tell me something interesting." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, mon, you grown some teeth since we last talk. Vol'jin likes it when the interesting ones get dangerous too." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "The talk in the city says somebody believed a story you told them, and maybe they shouldn't have. Vol'jin don't judge, mon, but he do count his rings after you leave." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody in Orgrimmar been saying good things about you, and these orcs don't say good things for free. Maybe you be more interesting than Vol'jin thought." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You talk to the spirits too, eh? Careful which ones answer, because some of them be hungry." },
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "An elf, in the Warchief's hall. Elves don't trust trolls easy, and that be fair, since we got history. I don't take offense, not yet." },
  },

  start = "hello",
  nodes = {
    dd_zalazane = {
      lines = {
        { id = "dd_zl_default", text = "Not yet, mon. Zalazane be dead, but his hexed ones still walk the isles, and they be our own people, wearin' our own faces. We give them peace first, then we go home, and until then Sen'jin village be home enough. What do you think we should do with the hexed?" },
      },
      choices = {
        { text = "Put them down quickly. It's the only mercy left.", next = "BACK", reply = "That be the hard answer, and maybe the true one. Gadrin hopes for a cure, but I be the chief, and a chief can't wait on hope forever.", fx = { align = { light = -1 } } },
        { text = "Keep looking for a cure. They're still your people.", next = "BACK", reply = "Gadrin would like you, mon. I hope you be right, because I would rather bring them home than bury them.", fx = { align = { light = 1 } } },
        { text = "Something else, Vol'jin.", next = "BACK" },
      },
    },
    xpt_voljin = {
      big = true,
      lines = { { id = "xpt_voljin_default", text = "Know that we were nearly wiped out, mon, hunted by the sea witch's murlocs and by our own kin, until Thrall's ships came through the storm and took us off the Echo Isles. A Darkspear remembers every debt, good and bad, so be the kind of friend they owe something to and not the other kind." } },
      choices = {
        { text = "I'll stand by my companion as Thrall stood by you.", next = "BACK", reply = "Then you understand the Darkspear, mon. We stand by who stood by us, and we never forget the name.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Debts are for merchants. I fight for what I can take.", next = "BACK", reply = "Then you won't understand us, mon, and we won't trust you. Debts be what keep us alive.", fx = { align = { honor = -1 } } },
        { text = "Something else, Vol'jin.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Quiet for now, mon. The Gurubashi call that Soulflayer into the world because they want their empire back, and they forget that a god who drink blood never stop at the enemy's. My people lose our place in that jungle long ago, and I shed no tears for the ones who drive us out, but no troll should be food for Hakkar." } },
      choices = {
        { text = "Even the Gurubashi deserved better than to be his food.", next = "BACK", reply = "They did, mon, and it grieve me even now. Hakkar eat his own, and he'll eat everyone else after.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Those trolls chose their god, Vol'jin. Let them pay his price.", next = "BACK", reply = "They chose, ya, but they chose for all of us. Hakkar won't stop at the Gurubashi, mon.", fx = { align = { light = -1 } } },
        { text = "Who are the Zandalar to the Darkspear?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "The Zandalar be the oldest of us, mon, the ones who remember when all trolls be one people. They keep to their island and their histories, and they only come to Yojamba Isle because Hakkar frighten even them, which tell you how bad it be." } },
      choices = { { text = "Then the Darkspear and the Zandalar want the same thing, for once.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Trouble me? No, mon. I seen the loa ride stranger horses than you. But the Light was the humans' spear, and the orcs remember who held it over the camps, so you be watched in this city until you give them a reason to stop." } },
      choices = {
        { text = "Then they can watch me keep faith with the Horde.", next = "BACK", reply = "Then they'll stop watchin' soon enough, mon. Keep faith, and the loa see it before my people do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them watch. I owe the orcs no explanations.", next = "BACK", reply = "Then they'll keep watching, mon, and you'll keep being watched. Your choice.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They listen, mon, though they don't always answer the way you be wantin'. Zalazane think the loa give power to whoever shout the loudest, and look where that take him, cursin' his own people on Echo Isles. A priest who listen more than he shout, that one the spirits remember." } },
      choices = {
        { text = "Then I'll listen, and heal whoever needs it.", next = "BACK", reply = "The loa answer better to them who listen, mon. Zalazane forgot that, and now he be talkin' to himself on the Echo Isles.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sometimes the spirits must be made to answer.", next = "BACK", reply = "That be how Zalazane talk, mon, and look at him now. Careful who you push.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Zalazane on the Echo Isles, with his hexed trolls and his madness, and the Kul Tirans at Tiragarde Keep, who never forgave us for walkin' free. Thrall gave us Sen'jin Village, but a gift like that only stay given if somebody be willin' to bleed for it." } },
      choices = {
        { text = "The Darkspear are Horde, Vol'jin. Their fight is mine.", next = "BACK", reply = "The Darkspear remember words like dat, mon. Fight beside us, and you never fight alone again.", fx = { align = { honor = 1 } } },
        { text = "I'll fight for pay, chieftain, not for old troll feuds.", next = "BACK", reply = "Then I'll pay you, mon, but the Darkspear won't remember you kindly. Feuds be how we stay alive.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They agree more often than the priests of either would like to admit. Both say the land remember everything you do to it, and both say it don't forgive easy." } },
      choices = {
        { text = "The old spirits deserve the old respect.", next = "BACK", reply = "They do, mon, and you be wiser than most who come up dis hill. The land remember everything done on it.", fx = { align = { order = 1 } } },
        { text = "Spirits or not, the Horde does what it must.", next = "BACK", reply = "It does, mon, but the land remember that too. Careful what the Horde does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you learned from the best, mon, because the Darkspear survived the Echo Isles by never being where the enemy looked. I don't ask my people to fight fair, only to fight for each other, and I don't care who sees it." },
        { id = "xrogue_troll", when = { race = "Troll" }, text = "Then you remember the old ways, mon, and a Darkspear who remember them lives long. We survived the Echo Isles by never being where the enemy looked, and I don't ask my people to fight fair, only to fight for each other." },
      },
      choices = {
        { text = "Fair fights are for fools. I fight to win.", next = "BACK", reply = "Ha! Now you talk like a Darkspear, mon. Win, and win for each other, and let the fools keep their fair fights.", fx = { align = { honor = -1 } } },
        { text = "I'd rather my enemies see me coming, chief.", next = "BACK", reply = "Then you'll be the only Darkspear they ever see coming, mon, which be brave and a little strange. The loa like strange, though.", fx = { align = { honor = 1 } } },
        { text = "What happened to the Echo Isles?", next = "isles" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A troll can walk any path that keep him alive, mon, and the arcane be just another power to bargain with. The loa don't mind a mage who remembers his offerings, and the Darkspear mages in the Valley of Spirits still burn something sweet for them every morning." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "A dead man who learn the arcane, that be a strange thing to bring to a troll, mon. The loa don't like you much, but they don't like most people, so keep your spells pointed away from my people and we'll get along." },
      },
      choices = {
        { text = "I'll respect the loa, as they deserve.", next = "BACK", reply = "The loa be glad of it, mon. Leave a little somethin' at the shrine now and then, and they remember your face.", fx = { align = { light = 1 } } },
        { text = "The loa can watch. I'll study what I like.", next = "BACK", reply = "Study what you like, mon, but the loa be watching. They don't like being ignored.", fx = { align = { light = -1 } } },
        { text = "Why follow Thrall, chief?", next = "thrall" },
      },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "The Darkspear met humans before we ever met an orc, mon, and they came to the Echo Isles with Kul Tiran ships and Kul Tiran guns. Thrall's Horde washed up on our shore in the middle of that fight, and it be the only reason there still be Darkspear to argue with you." },
        { id = "hum_v_troll", when = { race = "Troll" },
          text = "You know dis story, Darkspear, because the elders tell it at every fire. Kul Tiras came to the isles with ships and guns, and if Thrall's Horde had not washed up on our shore, you and me would be bones on the reef." },
        { id = "hum_v_undead", when = { race = "Scourge" },
          text = "You used to be one, so maybe you tell me something I don't know. All I know of humans be Kul Tiran ships off the Echo Isles, and dey came to fire on my people, not to trade." },
      },
      choices = {
        { text = "Do the Darkspear hate them for it?", next = "hu_stance" },
        { text = "The old trolls say Arathor fought the Amani for ages.", next = "BACK", reply = "Dey did, and the forest trolls never forgot it, but that be the Amani's grudge, not ours. Darkspear got enough grudges of our own without borrowing.", fx = { learn = { "humans" } } },
        { text = "Something else, Vol'jin.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "Some do, and I don't blame them, because my father Sen'jin died in that fight. But Thrall be raised by humans and freed by one, and he made peace with the girl in Theramore, so Vol'jin keep his hate on a short leash for the Warchief's sake." },
      },
      choices = {
        { text = "The leash is wise. Hate makes a chief careless.", next = "BACK", reply = "Now you talk like a witch doctor's student. Gadrin teach me the same thing, and I only listen to him half the time.", fx = { align = { order = 1 }, opinion = { humans = "distrust" }, affinity = 1 } },
        { text = "Sen'jin's blood deserves more than a leash.", next = "BACK", reply = "Maybe it do, and maybe one day the Darkspear collect it. Not today, though, and not while the Warchief need every troll he got.", fx = { align = { order = -1 }, opinion = { humans = "hate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_zalazane", tags = { "news" }, when = { questDone = TODO_QUEST("Zalazane") },
          text = "Master Gadrin send me word you went to the Echo Isles and ended Zalazane. That be a debt the Darkspear don't forget, mon, and I don't either, so you walk in my hall with your head up." },
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You got the same look as {alt}, mon, that {altclass} who come and sit with me a while back. The loa like to send the same spirit twice when the first one ain't finished the job." },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "A {altrace} named {alt} come by before you and talk straight to me like you do. Strange how the Horde keep sending me the honest ones lately, so maybe the spirits be up to something." },
        { id = "h_pt_troll", tags = { "news" }, when = { party = { race = "Troll" } },
          text = "You run with a Darkspear, mon, and that tells me more about you than any badge of rank. My people don't trust easy after everything that's been done to us, so if {companion} walks beside you, you earned it somewhere." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead man carryin' the Light of the humans. Now dat be interestin', and Vol'jin only talks to the interestin' ones." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon, and one of the Horde's own. The loa watch who do the healin' and who do the hurtin', and the best of my people learn to do both when the time be right." },
        { id = "h_default", key = true,
          text = "Vol'jin, chief of the Darkspear. Thrall stand with my people when nobody else would. Now I stand at his side and tell him what he don't want to hear." },
        { id = "h_op_sylv", when = { gossip = { topic = "sylvanas", stance = "distrust" } },
          text = "Word in the Valley of Spirits be that you watch the Dark Lady the way I do. Good, mon, because two pairs of eyes see more than one." },
        { id = "h_op_sylv_loyal", when = { gossip = { topic = "sylvanas", stance = "loyal" } },
          text = "They tell me you say you'd die again for the Dark Lady. Then you do it for the Horde too, mon, and Vol'jin got no quarrel with you." },
        { id = "h_nimboya", when = { heardLine = "nimboya.h_default" },
          text = "Nimboya find you in the jungle, eh? Then you know my youngest be lost down there. Nimboya bring him home, or nobody will." },
        { id = "h_gadrin", when = { heardLine = "gadrin.h_default" },
          text = "You see old Gadrin? He still tell people I be his best student? Good, because he right." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" }, text = "A tauren druid, mon! Your people and mine both know what it be to have the land under your feet taken away, so Vol'jin always be glad to see a horned one in this city." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. Good, because the Darkspear be few, and every strong arm in Orgrimmar be one more spear between my people and the ones who want us gone." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Horde" }, text = "So you be walkin' out of Zul'Gurub with the Blood God's priests dead behind you. The word from Yojamba be that Hakkar is cast down, and Vol'jin don't mind sayin' he sleep better for it." },
        { id = "h_hexed_resolved", tags = { "news" }, when = { thread = { id = "darkspear_isles", state = "resolved" } },
          text = "Sen'jin say the names of the hexed at the fire now, mon, every one Gadrin can remember and a few he had to ask about. Zalazane must hear it across the water, and Vol'jin hope it keep him awake." },
        { id = "h_hexed_soured", when = { thread = { id = "darkspear_isles", state = "soured" } },
          text = "You again, mon. Vol'jin did what you said and counted the hexed with the enemy, and it be the right thing for a chief, maybe, but it sit in my belly like a bad fish." },
      },
      choices = {
        { text = "What do you make of humans, Vol'jin?", next = "hu_view" },
        { text = { normal = "Zalazane's dead, Vol'jin. Will the Darkspear go back to the isles?", polite = "Zalazane is dead, chief. Will the Darkspear return to the isles, if I may ask?", blunt = "Zalazane's dead. Are the Darkspear going home to the isles?" }, next = "dd_zalazane", when = { questDone = TODO_QUEST("Zalazane") } },
        { text = { normal = "I'd guess the loa still listen to a priest, Vol'jin.", polite = "If I may guess, chief, the loa still listen to a priest.", blunt = "The loa still listen to priests, I'd bet." }, next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = { normal = "The loa and the Earth Mother can't agree on much.", polite = "With respect, chief, the loa and the Earth Mother can't agree on much.", blunt = "The loa and the Earth Mother don't agree on much." }, next = "druid_q", when = { class = "DRUID" } },
        { text = { normal = "Why follow Thrall?", polite = "If I may ask, chief, why do you follow Thrall?", blunt = "Why follow Thrall, then?" }, next = "thrall" },
        { text = { normal = "Something happened to the Echo Isles, I hear.", polite = "Forgive me, chief, but I hear something happened to the Echo Isles.", blunt = "I hear you lost the Echo Isles." }, next = "isles" },
        { text = { normal = "I walk with the things that ruined the orcs, chief. Does the tribe mind?", polite = "I walk with the things that ruined the orcs, chief. Does the tribe mind, if I may ask?", blunt = "I walk with what ruined the orcs. Does the tribe mind?" }, next = "warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = { normal = "The spirits talk to me too, Vol'jin.", polite = "The spirits speak to me too, chief, if I may say so.", blunt = "The spirits talk to me too." }, next = "shaman", when = { race = "Troll", class = "SHAMAN" } },
        { text = { normal = "I hunt heads for the Darkspear.", polite = "I hunt heads for the Darkspear, chief, and proudly.", blunt = "I take heads for the Darkspear." }, next = "hunter", when = { race = "Troll", class = "HUNTER" } },
        { text = { normal = "You don't trust the Forsaken, do you?", polite = "With respect, chief, you don't trust the Forsaken, do you?", blunt = "You don't trust my kind, do you?" }, next = "forsaken", when = { race = "Scourge" } },
        { text = { normal = "I strike from the jungle, chief, the old way.", polite = "With respect, chief, I strike from the jungle in the old way.", blunt = "I strike from the jungle, the old way." }, next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = { normal = "Can a mage walk beside the loa, chief?", polite = "If I may ask, chief, can a mage walk beside the loa?", blunt = "Can a mage walk with the loa?" }, next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = { normal = "Who threatens the Darkspear now, Vol'jin?", polite = "If I may ask, chief, who threatens the Darkspear now?", blunt = "Who's after the Darkspear now?" }, next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = { normal = "A Forsaken with the Light must trouble you, Vol'jin.", polite = "Forgive me, chief, but a Forsaken with the Light must trouble you.", blunt = "A dead paladin must bother you." }, next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = { normal = "Hakkar is cast down, Vol'jin. Zul'Gurub is quiet.", polite = "Chief, I'm honored to say Hakkar is cast down and Zul'Gurub is quiet.", blunt = "Hakkar's dead, and Zul'Gurub is quiet." }, next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Horde" } },
        { text = { normal = "My companion is Darkspear. What should I know of your people?", polite = "My companion is Darkspear, chief. What should I know of your people?", blunt = "My friend's Darkspear. What should I know?" }, next = "xpt_voljin", when = { party = { race = "Troll" } } },
        { text = { normal = "I've heard your people on the shore. About the hexed...", polite = "I've heard your people on the shore, chief. If I may, about the hexed...", blunt = "I heard your people on the shore. Let's talk about the hexed." }, next = "hexed_word",
          when = { thread = { id = "darkspear_isles", beat = "b5_voljin", state = { "stirring", "unfolding" } } } },
        { text = { normal = "Farewell, Vol'jin.", polite = "Farewell, chief, and thank you for your time.", blunt = "I'm going, Vol'jin." }, next = "END" },
      },
      again = {
        { id = "h_again", text = "What else, mon? Vol'jin got time for the interesting ones." },
        { id = "h_again2", text = "Speak, speak. The Warchief be busy, so you get me." },
        { id = "h_tone_polite", when = { chance = 0.5, tone = "polite" }, text = "All dis 'chief' and 'if I may', mon. You be talkin' to a troll, not a Silvermoon magister, so just say what you came to say." },
        { id = "h_tone_blunt", when = { chance = 0.5, tone = "blunt" }, text = "You talk straight, and Vol'jin like that. Somebody who say what he mean got nothing hidden behind his teeth." },
        { id = "h_tone_blunt2", when = { chance = 0.5, tone = "blunt" }, text = "Straight talk, the way my father Sen'jin liked it, mon. He used to say a crooked tongue be how the Gurubashi lost their way." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Mind? The tribe whisper about you, mon, I won't lie. Darkspear got voodoo and loa and the old spirits, and now one of us go knocking on the door of the things that ruin the orcs, so they wonder what you be bringing home." },
        { id = "wl_voice", when = { origin = "troll_other_voice" },
          text = "Gadrin tell me about you, the one with the voice. He scared, and Gadrin don't scare easy, so you be careful in my city." },
      },
      choices = {
        { text = "I'll bring home power for the tribe, nothing more.", next = "BACK", reply = "Then the tribe will be glad to see you come home, mon. Just make sure nothin' follow you back.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll keep what I call on a short leash, for the tribe.", next = "BACK", reply = "That be all I ask, mon. Keep them short, and the tribe will stop whispering.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "What should I bring, then?", next = "warlock_bring" },
      },
    },
    warlock_bring = {
      lines = { { id = "wb_default", text = "Answers. The Burning Blade be orcs, and they hide from orcs, but nobody think to hide from a troll. You learn what they know, and you tell Vol'jin first." } },
      choices = { { text = "You'll hear it first, chief.", next = "BACK", fx = { affinity = 2, learn = { "burning_blade" } } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Good, then the Darkspear got another voice in the Warchief's circle. Orc shamans be good, but they learn the spirits from Thrall's old teacher, and our spirits be older and grumpier, so you remind them now and then." } },
      choices = { { text = "Grumpier spirits. I'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "The old way, eh? Good, because my father take heads for the tribe, and his father before him. Just you remember that out here among the orcs and the tauren, some think it be savage, so you show them what it means: respect, not cruelty." } },
      choices = {
        { text = "Let them think it savage. Fear keeps enemies away.", next = "BACK", reply = "Fear works, mon, but respect lasts. Think on it.", fx = { align = { honor = -1 } } },
        { text = "I'll show them respect, chief.", next = "BACK", reply = "That be the old way, mon. Show them first, and they learn faster than any lecture.", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    forsaken = {
      big = true,
      lines = { { id = "fk_default", text = "Trust? No, mon, and I tell the Warchief so to his face. Your Dark Lady got eyes like a hungry crocolisk, and her apothecaries brew things in the Undercity that make my witch doctors shiver. You I judge separate, though." } },
      choices = {
        { text = "That's fair. Judge me by what I do.", next = "BACK", reply = "That be all I ever do, mon. Show me, and we see.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The Dark Lady doesn't need a troll's trust.", next = "BACK", reply = "No, mon, but she has it anyway, a little, because the Warchief ask. Don't push it.", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    thrall = {
      big = true,
      lines = {
        { id = "t_default", text = "When the murlocs come for us, Thrall fight beside us. My father die that day, and Thrall don't leave. A debt like that, you pay with your whole life." },
      },
      choices = {
        { text = "That's a heavy debt.", next = "BACK", reply = "It be, mon, and I carry it gladly. Thrall be worth every bit of it.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A debt's only as heavy as you let it be.", next = "BACK", reply = "Then you never owed a life, mon. Pray you never do.", fx = { align = { honor = -1 } } },
        { text = "Is there anyone in the Horde you don't trust, chief?", next = "dark_lady_op" },
      },
    },
    dark_lady_op = {
      lines = {
        { id = "dl_default", text = "Plenty, mon, but the one who keep me up at night be the Dark Lady in the Undercity. The Warchief say she be useful against the Scourge, and maybe he right, so you tell Vol'jin straight: what you make of her?" },
        { id = "dl_undead", when = { race = "Scourge" }, text = "You ask that, and you one of hers? All right, mon, the one I watch be your Dark Lady. Now you tell me straight what you make of her, and I listen to how you say it." },
      },
      choices = {
        { text = "She fights the Scourge for us. That's enough for me.", next = "dl_trust", fx = { align = { order = 1 }, opinion = { sylvanas = "trust" } } },
        { text = "She serves herself first. Keep watching her, chief.", next = "dl_distrust", fx = { affinity = 2, align = { order = -1 }, opinion = { sylvanas = "distrust" } } },
        { text = "The dead should stay dead. I'd cut her loose.", next = "dl_hate", fx = { trait = { blunt = 1 }, opinion = { sylvanas = "hate", forsaken = "distrust" } } },
        { text = "She gave us back our minds. I'd die again for her.", next = "dl_loyal", when = { race = "Scourge" }, fx = { affinity = -1, opinion = { sylvanas = "loyal" } } },
        { text = "Hard to say, chief.", next = "BACK" },
      },
    },
    dl_trust = {
      lines = { { id = "dlt_default", text = "Enough for now, maybe. Vol'jin just remind you that a spear pointed one way can be turned around quick." } },
      choices = { { text = "Something else, Vol'jin.", next = "BACK" } },
    },
    dl_distrust = {
      lines = { { id = "dld_default", text = "Ha! Now you talking like a troll, mon. Keep your eyes open when you walk in the Undercity, and tell me what you see there." } },
      choices = { { text = "I will, chief.", next = "BACK" } },
    },
    dl_hate = {
      lines = { { id = "dlh_default", text = "Cut her loose, and the Scourge walk down to the sea with nothing in the way. Vol'jin don't love her either, mon, but Vol'jin not a fool." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dl_loyal = {
      lines = { { id = "dll_default", text = "Loyal to her, eh? Then you be loyal to the Horde the same way, and we never have trouble, you and me." } },
      choices = { { text = "Something else, chief.", next = "BACK" } },
    },
    isles = {
      lines = {
        { id = "i_default", text = "Zalazane be my friend since we was small, and now he hold our home with an army of hexed Darkspear. Master Gadrin in Sen'jin work to take it back, and one day we do it, mon." },
      },
      choices = {
        { text = "I'll help when that day comes.", next = "END", fx = { affinity = 2, learn = { "echo_isles" } } },
        { text = "Part of you still hopes to find your friend in him.", tag = "Persuade", next = "zalazane_friend",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Troll" }, { heardLine = "gadrin.h_default" } } } },
          fail = { next = "zalazane_closed", fx = { affinity = -1 } } },
      },
    },
    zalazane_friend = {
      lines = {
        { id = "zf_default", text = "When we was small, Zalazane dare me to swim to the far rock, and when I tire, he swim out after me. Some nights I think that boy still be in there, under all the voodoo. Then I remember what he do to our people, and I know I got to stop him anyway." },
        { id = "zf_troll", when = { race = "Troll" },
          text = "You be Darkspear, so you know what it mean to lose a brother to bad magic. Yes, I hope. Hope be a foolish thing for a chief to carry, and I carry it anyway, and I don't tell the Warchief." },
      },
      choices = {
        { text = "Hope isn't foolish, Vol'jin.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll keep that to myself.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    zalazane_closed = {
      lines = {
        { id = "zc_default", text = "Zalazane be my enemy, and that be all you need to know about him, mon." },
        { id = "zc_quick", text = "You reach for a chief's heart quick, mon. Slow down, and maybe one day I show you." },
      },
      choices = { { text = "So be it.", next = "BACK" } },
    },
    hexed_word = {
      big = true,
      lines = { { id = "hw_default", text = "Then tell me straight, mon, because my own people won't. Do Vol'jin count the hexed as Darkspear still, and have Sen'jin free them and say their names, or do I tell my warriors they belong to Zalazane now and to strike without lookin' at their faces?" } },
      again = { { id = "hw_again", text = "So, mon, what be the hexed to the Darkspear now?" } },
      choices = {
        { text = "They're still Darkspear. Free them, and say their names at Sen'jin.", next = "hexed_kin",
          fx = { thread = { id = "darkspear_isles", state = "resolved" }, affinity = 3, align = { light = 1 } },
          journal = { first = "Told Vol'jin the hexed are still Darkspear, and that Sen'jin should free them and say their names. He said Zalazane would hate every one of those names.",
                      third = "{name} told Vol'jin that the hexed of the Echo Isles were still Darkspear." } },
        { text = "They're Zalazane's now. Tell your warriors not to look at their faces.", next = "hexed_enemy",
          fx = { thread = { id = "darkspear_isles", state = "soured" }, affinity = -2, align = { light = -1 }, trait = { skeptical = 1 } },
          journal = { first = "Told Vol'jin to count the hexed with the enemy. He agreed like a chief, and looked away like a friend.",
                      third = "{name} told Vol'jin to count the hexed of the Echo Isles among the enemy." } },
        { text = "What does Master Gadrin say?", next = "hexed_gadrin" },
      },
    },
    hexed_gadrin = {
      lines = { { id = "hg_default", text = "Gadrin say they be his students' children, and that he will not be the one to give them up, which be a teacher's answer, mon. A chief need a different one, and that be why I ask you." } },
      choices = { { text = "Then I'll give you an answer.", next = "hexed_word" } },
    },
    hexed_kin = {
      lines = { { id = "hk_default", text = "That be what my heart say, and I was afraid it was only my heart. Sen'jin will say their names at the fire tonight, mon, and when Zalazane hear them across the water, he will know we did not forget a single one." } },
      choices = { { text = "Then let him hear them, Vol'jin.", next = "END" } },
    },
    hexed_enemy = {
      lines = { { id = "he_default", text = "Maybe that be the answer a chief need, and Vol'jin will give my warriors the order. But don't ask me to like it, mon, because some of those faces I knew when they was small." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Heh, you got a sweet tongue, and for once Vol'jin don't mind it. The Darkspear been called many things, mon, so it be nice to hear a kind one." },
        { id = "s2", text = "Vol'jin hear plenty of flattery in dis hall, and most of it smell like old fish. Yours smell honest, so I be keeping it." },
      },
      fail = {
        { id = "f1", text = "My father taught me to watch the hands of anyone who talk too sweet, and I be watching yours now. Try again without the honey, mon." },
        { id = "f2", text = "You be laying it on thick as swamp mud, and Vol'jin was not born yesterday. A shadow hunter see what hide behind the words." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You got teeth, and you not afraid to show them to a chieftain. Vol'jin like dat, because the loa got no love for the meek." },
        { id = "s2", text = "Now dat be the kind of cheek the Darkspear trade round the fire in Sen'jin, and I been missing it up here among all dis stone. You be one of the interesting ones after all." },
      },
      fail = {
        { id = "f1", text = "Careful, mon, because Vol'jin laugh easy but he don't forget easy. The last ones who mocked the Darkspear be feeding the crabs off the coast." },
        { id = "f2", text = "You be thinking you clever, and maybe you be, but dat was not it. Go and sharpen your tongue somewhere else before you cut yourself." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Vol'jin seen sea witches and worse, and he know real danger when it walk into the room. You got it on you like a shadow, so I be speaking to you with care." },
        { id = "s2", text = "Hm. The spirits round you gone very quiet, mon, and dat only happen near someone they respect. All right, you got my ear." },
      },
      fail = {
        { id = "f1", text = "You try to scare a shadow hunter who walk with the loa of the dead every night? I seen things in the dark dat would turn your hair white, and none of them be you." },
        { id = "f2", text = "The Darkspear been hunted by murlocs, humans and a sea witch, and we still be here. You gonna need more than a hard look, mon." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "Dat be a thing Vol'jin keep close, and you not be close enough yet. Do right by the Darkspear, and maybe one day I be telling you." },
      { id = "gt2", text = "No, mon, Vol'jin not be speaking of dat with you, not today. Some words be only for those who earned them." },
    },
    knows = {
      { id = "tp_knows", text = "Vol'jin hear plenty, mon: from the Warchief, from the spirits, and from the trolls who whisper in the corners. Ask me about these." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You be a friend now, so I tell you straight, with no riddles, or not many." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I tell you some, but Vol'jin don't hand his whole mind to strangers." },
    },
    yenniku = { { id = "tp_yenniku", text = "He be my son. Say his name careful, mon; I say it every night." } },
    echo_isles = { { id = "tp_isles", text = "I see them in my sleep: the sand, the sea, the old huts, and Zalazane's puppets walking where my father walked." } },
    burning_blade = { { id = "tp_blade", text = "Orcs who miss the demons. The Warchief watch them closer than they think, and so do I." } },
    thrall = { { id = "tp_thrall", text = "Thrall pulled the Darkspear out of the sea when the murlocs and the humans would have finished us, and I swore my people to him on that beach. He never asked for de oath, and dat be why it holds." } },
    darkspear = {
      { id = "tp_darkspear", text = "The Darkspear are a small tribe with a long memory, mon, and we don't forget a friend or an enemy. We came to Kalimdor with nothing, and now we have Sen'jin, and soon we'll have the isles again." },
      { id = "tp_darkspear2", when = { race = "Troll" }, text = "You're one of mine, and I see it in how you stand. Make the Darkspear proud out there, and come home to Sen'jin when you need to remember who you are." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "The Banshee Queen is clever, and clever is dangerous when it doesn't love you. I watch her, mon, the same way I'd watch a snake that says it's a friend." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the wisest of us, and he laughs at the right things. When the Horde argues, it's often Cairne who stops us before we make fools of ourselves." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi priests are trying to wake Hakkar in Zul'Gurub, and that's a madness that could swallow every troll in Stranglethorn. The Darkspear left that empire long ago, and I'd like it to stay buried." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The Sandfury trolls of Zul'Farrak are cousins of a kind, but they never learned to share the desert. They kill anyone who comes near their walls, and they've been doing it since before the orcs came to this world." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken smell of graves and talk of loyalty, and the Warchief has given them his word. I don't trust what I can't read, but I respect the Warchief's judgment, mostly." } },
    the_elements = { { id = "tp_the_elements", text = "The loa and the elements are cousins, mon, and they don't always like each other. A Darkspear shaman learns both, and keeps them both happy." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai priests sank their temple trying to bring back Hakkar long ago, and the green dragons have been guarding the ruins ever since. If they ever wake that god, it won't stay in the swamp." } },
    _none = { { id = "tp_none", text = "Vol'jin don't know that one, and Vol'jin don't pretend." } },
  },
}

P:NPC {
  key = "neeru", id = TODO_NPC("Neeru Fireblade"), name = "Neeru Fireblade",
  bible = "bibles/orgrimmar.md", role = "questgiver", tier = "major",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "proud" },
  race = "Orc", likesTone = "polite",
  notices = { "class", "fel" },
  impression = {
    first = "I cannot tell how he feels about the fire-worshippers he watches.",
    third = "{name} met Neeru Fireblade in the Cleft of Shadow, who claims to keep watch over those in the Horde who still play with fire.",
  },

  greetings = {
    { id = "g_cleft", text = "The Cleft of Shadow welcomes you. Don't be alarmed by the dark; it keeps the curious out, and the useful in." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my capable friend. I was hoping you'd return. I have more work for capable friends." },
    { id = "g_away", when = { away = 14 }, text = "My capable friend, you've been away {away}, and I confess I missed having someone useful to talk to. Come in out of the light." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round to your way of thinking not long ago, and quite neatly too. A persuasive tongue is a rare gift, and the Cleft always has room for rare gifts." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told one of your little untruths was seen through recently, which is a pity, because a lie that gets caught does nobody any good. Do be more careful, my friend." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "A fellow student of the deeper arts. We're misunderstood, you and I. Thankfully, we understand each other." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, how quaint. The elements are so very polite, aren't they? Do come back if you ever want more than politeness." },
  },

  start = "hello",
  nodes = {
    dd_darkstorm = {
      lines = {
        { id = "dd_ds_default", text = "Everyone who once dabbled in the old fires knew someone like him, and I've made no secret of my past. He was ambitious and not very clever, which is the most dangerous kind of warlock. You did Durotar a kindness, and you did me one too, because now Orgnil has one fewer reason to glare at my door." },
      },
      choices = {
        { text = "Orgnil's right to watch you. You admit your past.", next = "BACK", reply = "He is, and I'd think less of him if he didn't. Watch me too, if you like; I've nothing to hide that the Warchief doesn't already know.", fx = { align = { order = 1 } } },
        { text = "The past's the past. What matters is whose side you're on.", next = "BACK", reply = "A generous view, and a rare one in this city. I'm on the Warchief's side, and I mean to stay there.", fx = { align = { order = -1 } } },
        { text = "Something else, Neeru.", next = "BACK" },
      },
    },
    xpt_neeru = {
      big = true,
      lines = { { id = "xpt_neeru_default", text = "Then your companion is braver than most, because the warlocks of the old Horde are blamed for every wound our people still carry. I teach the young ones to command what they summon and never to beg it for favours, and if your friend has learned that, they'll outlive their critics." } },
      choices = {
        { text = "My companion's power keeps us alive, and I welcome it.", next = "BACK", reply = "Then you understand better than most up top. Welcome to the Cleft, friend.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Fel magic damned the Horde once. I don't like it near me.", next = "BACK", reply = "Then you and your companion will have much to talk about. I hope you find a way.", fx = { align = { light = 1 } } },
        { text = "Surely there's a cost to what warlocks summon.", next = "xpt_neeru2" },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xpt_neeru2 = {
      lines = { { id = "xpt_neeru2_default", text = "There is always a cost, friend, and a clever warlock makes certain someone else pays it. That was a joke, mostly; the demons take whatever they can, and a good warlock simply gives them nothing they can use." } },
      choices = {
        { text = "I'll remember that, Neeru.", next = "BACK" },
      },
    },
    xcl_rfc = {
      big = true,
      lines = { { id = "xcl_rfc_default", text = "Broken is such a strong word, though I suppose it will do. The cultists down there were young and loud and terribly eager, and eagerness is how a cult gets itself noticed by the wrong people. Taragaman was always hungrier than they understood, so perhaps they were fortunate you found them first." } },
      choices = {
        { text = "They were fools, Neeru, but fools can be useful.", next = "BACK", reply = "Useful, yes, though not quite as they intended. You understand the Cleft very well.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Any orc who kneels to a demon deserves the same end.", next = "BACK", reply = "The same end, yes, and it's coming. You'll find I agree with you more than you'd think.", fx = { align = { honor = 1 } } },
        { text = "You must have gone down into the chasm yourself.", next = "xcl_rfc2" },
      },
    },
    xcl_rfc2 = {
      lines = { { id = "xcl_rfc2_default", text = "Oh, once or twice, purely to keep an eye on things, as the Warchief asked. The caves run deeper than most of the city realises, and the fire down there is older than Orgrimmar. One learns so much about people by watching what they do in the dark." } },
      choices = { { text = "I'll remember that, Neeru.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Every power is dangerous in the wrong hands, friend, and the Light has had some very wrong hands in its time. The Silver Hand kept my people in pens with it. I don't say you'd do the same; I only say I will be watching, as I watch everyone." } },
      choices = {
        { text = "Watch all you like. I've nothing to hide.", next = "BACK", reply = "Then you have nothing to fear from me. I'll watch anyway, of course, but I watch everyone.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Watch your own hands, Neeru. I'll watch mine.", next = "BACK", reply = "Oh, I do, friend, very closely. That's what makes me useful.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I watch everyone, friend, because that is what the Warchief needs from someone like me. Priests are seldom any trouble, though the shadow your kind draws on is a cousin to the fire I keep an eye on, and cousins do have a way of visiting each other." } },
      choices = {
        { text = "The shadow serves my healing, nothing more.", next = "BACK", reply = "Then you'll have no trouble from me, and I hope I never have cause to say otherwise.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. I'll draw on whatever answers.", next = "BACK", reply = "Then we'll be seeing more of each other, I think. I look forward to it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Work? Oh, the Cleft is perfectly peaceful, I assure you, and the Warchief's guards see to that. If it's a fight you want, Orgnil Soulscar hunts the Burning Blade down in Durotar, and I'm told he's never short of cultists, though I can't imagine where they all come from." } },
      choices = {
        { text = "Then I'll help Orgnil cut the Burning Blade down.", next = "BACK", reply = "Orgnil will be glad of you at Razor Hill. Give him my regards, and tell him the Cleft is still listening.", fx = { align = { honor = 1 } } },
        { text = "Cultists pay well too, I hear. I'm not particular.", next = "BACK", reply = "They do, I'm told, but they don't live long to spend it. Choose carefully.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Beasts have honest noses, and the Cleft smells of things that were summoned rather than born. Pay it no mind, my friend; the warlocks keep their pets on far shorter leashes than the hunters who let their cats nose through the Drag." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps looking at me, doesn't it? Animals are such poor judges of character, and I've always found that rather charming." },
      },
      choices = {
        { text = "I trust my beast's nose more than any warlock's word.", next = "BACK", reply = "So do I, friend, and I'm a warlock, so take that as a professional opinion. Trust your beast's nose before anyone's word down here.", fx = { align = { light = 1 } } },
        { text = "Summoned or born, a pet is a pet. I don't judge.", next = "BACK", reply = "A generous view, and rare. You'll find the Cleft very welcoming.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I watch them, and I make sure they remember whom they serve, which is more than they'd manage on their own. Your people never had to learn what fel magic does to a land, but we orcs left Draenor dry and dying because of it." } },
      choices = {
        { text = "Fel magic should be forbidden in the Horde.", next = "BACK", reply = "It should be watched, and I'm the one watching. Forbidding it only sends it underground.", fx = { align = { order = 1 } } },
        { text = "Power is a tool. Let them use it.", next = "BACK", reply = "A tool, yes, and a very sharp one. Mind your fingers.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I watch everyone in the Cleft, friend, because the Warchief asked me to, and because both trades depend on not being watched. The rogues of the Shattered Hand keep their own counsel down here, and we get along best when neither of us asks too many questions." },
      },
      choices = {
        { text = "Then I'll trust your watch, and keep my counsel.", next = "BACK", reply = "Then we'll get along famously, you and I. Discretion is the only currency down here that never loses value.", fx = { align = { order = 1 } } },
        { text = "Watch all you like. I'll go where I please.", next = "BACK", reply = "Then I'll watch you go, friend. I always do.", fx = { align = { order = -1 } } },
        { text = "What do you think of Thrall?", next = "thrall" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Arcane fire is a much tidier thing than the kind the Cleft studies, certainly. The trolls in the Valley of Spirits teach it well enough, and they'll tell you what I'd tell any warlock, which is that every flame wants more than you give it." },
      },
      choices = {
        { text = "I'll keep my flames under strict control.", next = "BACK", reply = "Then you'll live longer than most of my students. Fire remembers every slack moment, and it never forgives one.", fx = { align = { order = 1 } } },
        { text = "Let it want. I enjoy feeding it.", next = "BACK", reply = "Then I'll be watching your flames as well. Feeding it is how it grows.", fx = { align = { order = -1 } } },
        { text = "What is the Burning Blade?", next = "blade" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_darkstorm", tags = { "news" }, when = { questDone = TODO_QUEST("Dark Storms") },
          text = "So Fizzle Darkstorm is dead at Thunder Ridge, and Orgnil Soulscar sends me a very short note saying who did it. I knew Fizzle, after a fashion, and I can tell you he was no great loss to anyone, least of all to the Blade." },
        { id = "h_pt_lock", tags = { "news" }, when = { party = { class = "WARLOCK" } },
          text = "Your friend {companion} smells of sulfur and doesn't seem ashamed of it. Most orcs in this city look away from my sort, so it warms me to see someone who keeps such honest company." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who still calls on the Light. How very unusual. I make it my business to know everyone in Orgrimmar who handles a dangerous fire, and you are certainly one of them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. How refreshing; most of the Horde's spellcasters come to the Cleft of Shadow for something less wholesome than prayer." },
        { id = "h_default", key = true,
          text = "Neeru Fireblade, loyal servant of the Warchief. I keep an eye on those in the Horde who still play with fire. Someone with experience must, after all." },
        { id = "h_op_demons", when = { gossip = { topic = "demons", stance = "useful" } },
          text = "I hear you've been telling people demons are only tools. How refreshing, though do say it a little more quietly near the Valley of Wisdom." },
        { id = "h_op_legion", when = { gossip = { topic = "burning_legion", stance = "hate" } },
          text = "Ah, the one who hates the Legion so very loudly. The Warchief must adore you, and I'm sure he hears all about it." },
        { id = "h_cl_rfc", tags = { "news" }, when = { cleared = "Ragefire Chasm", faction = "Horde" }, text = "I'm told the Searing Blade in Ragefire have lost their leaders, and their demon besides, and that you were the one who saw to it. How very thorough of you, and the Warchief must be delighted." },
        { id = "h_burning", tags = { "news" }, when = { questActive = TODO_QUEST("Burning Shadows") },
          text = "An eye, taken from a cultist's body? How dreadful. Bring it to me, and I'll see that it's dealt with properly." },
        { id = "h_akzeloth", when = { questActive = TODO_QUEST("Ak'Zeloth") },
          text = "My assistant will guide you. There's a seed of something unpleasant in the Barrens. We wouldn't want it growing where the wrong people could tend it." },
        { id = "h_hidden", when = { questActive = TODO_QUEST("Hidden Enemies") },
          text = "The Searing Blade in Ragefire are so eager, so very eager to prove themselves. Deal with their leaders, would you? It will clarify things, I think." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" }, text = "A druid, down here in the Cleft of Shadow? The Warchief's tauren friends are always welcome, of course, though you'll find very little down here that grows." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, how refreshing. The Cleft sees so many curious young casters that it's good to be reminded the Horde still has strong arms to protect them from themselves." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in the Cleft! We don't see many of your kind down here, because the beasts don't care for the smell of brimstone, and I can't say I blame them." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Searing Blade", min = 20 } }, text = "The Searing Blade in the chasm beneath the city have lost many of their number, and I hear you were among those responsible. The Warchief's enemies have fewer places to hide now." },
      },
      choices = {
        { text = { normal = "You knew Fizzle Darkstorm, Neeru?", polite = "If I may ask, did you know Fizzle Darkstorm, Neeru?", blunt = "You knew Fizzle Darkstorm?" }, next = "dd_darkstorm", when = { questDone = TODO_QUEST("Dark Storms") } },
        { text = { normal = "Do you watch the Horde's priests as closely as its warlocks?", polite = "If I may ask, do you watch the priests as closely as the warlocks?", blunt = "Do you watch priests as close as warlocks?" }, next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = { normal = "What do you make of the Horde's warlocks, Neeru?", polite = "I'd value your view, sir. What do you make of the Horde's warlocks?", blunt = "What do you think of the warlocks?" }, next = "druid_q", when = { class = "DRUID" } },
        { text = { normal = "What is the Burning Blade?", polite = "If I may ask, what is the Burning Blade?", blunt = "What's the Burning Blade?" }, next = "blade" },
        { text = { normal = "You must think highly of Thrall.", polite = "You must think very highly of the Warchief, I imagine.", blunt = "You must think a lot of Thrall." }, next = "thrall" },
        { text = { normal = "Thrall's patience will be the death of the Horde.", polite = "With respect to the Warchief, his patience will be the Horde's death.", blunt = "Thrall's too patient, and it'll kill the Horde." }, tag = "Deceive", next = "neeru_opinion",
          check = { pass = { any = { { disposition = { min = 60 } }, { class = "WARLOCK" }, { trait = "cruel" } } } },
          fail = { next = "neeru_loyal", fx = { affinity = -1 } } },
        { text = { normal = "I've outgrown my first lessons. What can the Cleft truly teach me?", polite = "I've outgrown my first lessons, sir. What might the Cleft truly teach me?", blunt = "What can the Cleft teach me that the trainers won't?" }, next = "warlock", when = { class = "WARLOCK" } },
        { text = { normal = "An orc mage. I suppose you find that amusing.", polite = "I'm an orc mage, sir. I suppose you find that amusing.", blunt = "I'm an orc mage. Go ahead and laugh." }, next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = { normal = "The elements would rather I stayed out of here.", polite = "Forgive me, but the elements would rather I stayed out of here.", blunt = "The elements don't want me here." }, next = "shaman", when = { class = "SHAMAN" } },
        { text = { normal = "Do you keep watch on the rogues of the Cleft too?", polite = "If I may ask, do you watch the Cleft's rogues as well?", blunt = "Do you watch the rogues down here too?" }, next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = { normal = "Fire is my craft too, Neeru. Arcane fire, though.", polite = "Fire is my craft as well, sir, though mine is arcane.", blunt = "I use fire too, but arcane fire." }, next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = { normal = "Is there work in the Cleft for a warrior, Neeru?", polite = "Might there be work in the Cleft for a warrior, sir?", blunt = "Is there work here for a warrior?" }, next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = { normal = "Beasts seem to shy away from the Cleft, Neeru.", polite = "Forgive me, but beasts seem to shy away from the Cleft.", blunt = "Beasts don't like this place." }, next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = { normal = "Is the Light a dangerous fire, Neeru?", polite = "If I may ask, is the Light a dangerous fire?", blunt = "So is the Light a dangerous fire?" }, next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = { normal = "The Searing Blade in Ragefire are broken, Neeru.", polite = "I'm pleased to report the Searing Blade in Ragefire are broken, sir.", blunt = "The Searing Blade are broken." }, next = "xcl_rfc", when = { cleared = "Ragefire Chasm", faction = "Horde" } },
        { text = { normal = "My companion studies the same arts you do, Neeru.", polite = "With respect, my companion studies the same arts you do.", blunt = "My friend here is a warlock too." }, next = "xpt_neeru", when = { party = { class = "WARLOCK" } } },
        { text = { normal = "I'll be going.", polite = "Thank you for your time. I'll be going.", blunt = "I'm leaving." }, next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Do ask; I so enjoy a curious mind." },
        { id = "h_again2", text = "Yes? The Cleft has all the time in the world, friend." },
        { id = "h_tone_polite", when = { chance = 0.5, tone = "polite" }, text = "Such lovely manners, and in the Cleft of Shadow of all places. I do appreciate a guest who knows how to speak to someone of experience." },
        { id = "h_tone_polite2", when = { chance = 0.5, tone = "polite" }, text = "Courtesy costs so little and buys so much, my friend. Remember that, because the Warchief's hall runs on it more than he would ever admit." },
        { id = "h_tone_blunt", when = { chance = 0.5, tone = "blunt" }, text = "So very direct. The grunts in the Drag talk that way too, and you'll notice none of them are ever invited down here." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Everything the Warchief's shamans won't, and with far less disapproval. The Horde fears our art, and fear is such a waste of good power. Down here, at least, we can speak of it without lowering our voices." },
        { id = "wl_cleft", when = { origin = "orc_cleft_initiate" },
          text = "Ah, one of our own initiates come home. You've learned your lessons well, I'm told. Do remember who taught them to you when the Warchief's people start asking questions." },
        { id = "wl_troll", when = { race = "Troll", class = "WARLOCK" },
          text = "A Darkspear, with the gift! How delightful. Your people never drank the old fire, so you come to it fresh and unafraid, and I find that refreshing." },
      },
      choices = {
        { text = "I'll learn your spells, and keep my own counsel.", next = "BACK", reply = "A quiet student, how rare. The loud ones usually learn the hard way, and loudly.", fx = { affinity = -1, align = { light = 1 }, trait = { skeptical = 1 } } },
        { text = "Then let's speak honestly. What do the Horde fear most?", next = "warlock_fear" },
        { text = "Fear is weakness. I'll take every power offered.", next = "BACK", reply = "Every power? Then you'll need someone to watch you, and I'm very good at that.", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    warlock_fear = {
      lines = { { id = "wf_default", text = "Themselves, of course, and what they were when the fire was in them. Such a shame, because they were magnificent. But I'm only a humble watcher of these things, you understand, and I'd never wish it back." } },
      choices = { { text = "Of course not.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    orcmage = {
      lines = {
        { id = "om_default", text = "Amusing? Not at all; I find it encouraging. An orc who reaches beyond the axe and the totem is an orc who hasn't been told what to fear, and there are so few of you left." },
        { id = "om_primer", when = { origin = "orc_camp_primer" },
          text = "Self-taught, from a human primer? Then you already know the best power is the kind you take for yourself. The arcane is a fine start, but do come back when it stops being enough." },
      },
      choices = {
        { text = "The arcane will be enough for me.", next = "BACK", reply = "I hope it will be, for your sake. The arcane is cleaner than what I teach.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "And when it isn't, I'll know where to come.", next = "BACK", reply = "And I'll be here in the Cleft, waiting, because most of them come down the ramp eventually. I'll have the kettle on.", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "The elements are terribly particular about the company they keep, aren't they? They never liked me much either. Do tell Thrall's shamans I said hello, the next time they're lecturing you about balance." } },
      choices = { { text = "I'll tell them you're watching.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } } },
    },
    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Fanatics, leftovers from the old days who still crave the fire the demons gave us. They're dangerous, foolish, and ever so useful to watch, and I watch them very closely." },
      },
      choices = {
        { text = "Good. Keep your eyes on them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do you ever miss the fire, Neeru?", next = "fire_op" },
        { text = "You seem to know them well.", next = "know", fx = { trait = { skeptical = 1 } } },
      },
    },
    fire_op = {
      lines = { { id = "fo_default", text = "Miss it? What a thing to ask the Warchief's loyal servant. I'll turn it around, friend, since you're so curious: the demons gave the Horde its greatest victories and its worst shame, so which do you suppose was larger?" } },
      choices = {
        { text = "The Legion enslaved us. They're our oldest enemy.", next = "fire_hate", fx = { affinity = -1, align = { light = 1 }, opinion = { burning_legion = "hate" } } },
        { text = "Demons are tools. A strong will can use them.", next = "fire_useful", fx = { affinity = 2, align = { light = -1 }, opinion = { demons = "useful" } } },
        { text = "The power was real, but the price was too high.", next = "fire_danger", fx = { opinion = { demons = "dangerous" } } },
        { text = "I bind them daily now. Every one of them answers to me.", next = "fire_control", when = { class = "WARLOCK" }, fx = { affinity = 1, opinion = { demons = "control" } } },
        { text = "I won't answer that here.", next = "BACK" },
      },
    },
    fire_hate = {
      lines = { { id = "fh_default", text = "Such conviction! The Warchief would be proud of you, and I'm sure he'll hear all about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fire_useful = {
      lines = { { id = "fu_default", text = "Now there's a mind that hasn't been told what to fear. Do come back to the Cleft when you'd like to discuss it further, somewhere more private." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fire_danger = {
      lines = { { id = "fd_default", text = "A careful answer, and careful people live a long time in Orgrimmar. Not always an interesting time, mind, but a long one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fire_control = {
      lines = { { id = "fc_default", text = "Every one of us says that at first, friend. I said it myself, once, and look how nicely everything turned out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    know = {
      lines = { { id = "k_default", text = "One studies one's enemies, as surely you know. Now, I'm terribly busy." } },
      choices = { { text = "...", next = "END" } },
    },
    neeru_opinion = {
      lines = {
        { id = "no_default", text = "Careful, speaking that way in Orgrimmar. Though between friends, the Warchief's patience is a marvel: he waits so long to strike that his enemies grow old and comfortable, and some of them grow rather powerful." },
        { id = "no_warlock", when = { class = "WARLOCK" },
          text = "A fellow practitioner, saying such things aloud! I agree entirely, in theory, of course. The Horde was strong once, when it wasn't afraid of what made it strong, and some of us haven't forgotten how that felt." },
      },
      choices = {
        { text = "We understand each other.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll remember you said that.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    neeru_loyal = {
      lines = {
        { id = "nl_default", text = "What a curious thing to say to the Warchief's loyal servant. I shall pretend I didn't hear it, and you'll pretend you never said it." },
        { id = "nl_clumsy", text = "Oh, that was clumsy, friend. If you want to know what I think, you'll have to be far more interesting than that." },
      },
      choices = { { text = "Forget I spoke.", next = "BACK" } },
    },
    thrall = {
      lines = { { id = "t_default", text = "A great leader, with such vision, such patience, such faith in people. It's very touching." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "How very gracious of you, and how rare it is to meet good manners in this city of axes. I shall remember that you troubled to be courteous." },
        { id = "s2", text = "You have a discerning eye, friend, and I do so enjoy the company of the discerning. The Cleft is a kinder place for those who appreciate it." },
      },
      fail = {
        { id = "f1", text = "Ah, but I have used that very approach myself, and rather more gracefully. Do come back when you've practised." },
        { id = "f2", text = "Flattery is a tool, my friend, and you are holding it by the wrong end. I'd prefer that you simply told me what you want." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Oh, very good! So few in Orgrimmar have any wit at all, and you have chosen to spend yours on me, so I am almost flattered." },
        { id = "s2", text = "You have a wicked tongue, and I find I cannot bring myself to mind. Boldness of that kind opens doors in the Cleft of Shadow." },
      },
      fail = {
        { id = "f1", text = "How tiresome. I had hoped you were one of the clever ones, but I see you are merely one of the loud ones." },
        { id = "f2", text = "I have been insulted by shamans, grunts and the Warchief's own guards, and all of them did it better. Do mind your manners in my tent." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "There is no need for any of that between friends, truly there isn't. You've made yourself quite clear, and I am listening most attentively.", narr = "Neeru folds his hands together, a little too carefully." },
        { id = "s2", text = "Well, well, there is steel in you after all, and I confess I felt it. Let us go on politely, since I should hate to see where the other road leads." },
      },
      fail = {
        { id = "f1", text = "You are standing in the Cleft of Shadow, friend, among a great many warlocks who owe me favours. I would think very carefully about your tone." },
        { id = "f2", text = "I have studied things that would unmake you with a glance, so a raised voice does very little for me. Sit down, and let us pretend this never happened." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That is a conversation for friends, and we are not yet quite friends, are we? Prove yourself useful, and I may find I have more to say." },
      { id = "gt2", text = "I think I shall keep that to myself for the present. One doesn't hand one's confidences to every {class} who wanders in out of the sun." },
    },
    knows = {
      { id = "tp_knows", text = "Oh, I hear all sorts of things down here in the Cleft, and I'm generous with most of them. Ask about whatever catches your eye." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "For a friend as capable as you, I'll share everything I know, or nearly everything; one must keep a little back." },
    },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion's fire is a dangerous tool, and the Warchief has rightly cast it aside. I simply make sure that those who still feel its heat are known to him." } },
    thrall = { { id = "tp_thrall", text = "I am a loyal servant of the Warchief, and his trust is precious to me. It is my place to ensure that he knows what moves in the shadows of his city." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are curious creatures, and their apothecaries even more so. I find them fascinating to watch, and I watch them very closely." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Dark Portal stands in the Blasted Lands, silent and broken, and some orcs still dream of the world on the other side. I listen to their dreams, as a loyal servant should." } },
    sylvanas = { { id = "tp_sylvanas", text = "Lady Sylvanas is a valuable ally, and the Warchief has wisely brought her into the Horde. I would never suggest that she has plans of her own, because I have no proof of it yet." } },
    _none = { { id = "tp_none", text = "I couldn't say, but do tell me if you hear anything interesting. I collect interesting things." } },
  },
}

P:NPC {
  key = "gryshka", id = TODO_NPC("Innkeeper Gryshka"), name = "Innkeeper Gryshka",
  gender = "female",
  bible = "bibles/orgrimmar.md", role = "innkeeper", tier = "service",
  communities = { "orgrimmar" }, temper = { "hearty" }, values = { "generous" },
  notices = { "weary", "hunger", "lock_shadow" },
  impression = {
    first = "Mention Zargh and she grows flustered, which is charming.",
    third = "{name} found a seat at the Broken Tusk, where Innkeeper Gryshka feeds Orgrimmar's warriors and keeps the inn loud.",
  },

  greetings = {
    { id = "g_tusk", text = "Sit, warrior. Food first, then you tell me who you fought. That's the price of a seat at the Tusk." },
    { id = "g_home", when = { homeInn = { "Orgrimmar", "Valley of Strength" } }, text = "The Tusk missed you! Your bed's warm and there's a haunch on the spit, so your timing's good." },
    { id = "g_away", when = { away = 14 }, text = "There you are! You've been gone {away}, and I was starting to think something out there ate you before I could feed you, so sit down while the spit's turning." },
    { id = "g_away_long", when = { away = 60 }, text = "You've gone {away} without a hot meal from the Tusk, and look at you, you're all gristle. Sit, and you're not getting up until you've eaten and told me every fight." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Every table in the Tusk has been talking about the work you've done for the city, so your first plate's on the house tonight. Then you can tell me the stories yourself." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard you put somebody's back up in the city not long ago, and they came in here grumbling about it. Whatever it was, you leave it at the door of my inn." },
    { id = "g_fl", when = { flirt = true, chance = 0.4, ["not"] = { npcFlagBefore = "gry_fl_no" } }, text = "Sit down and let me look at you, because the Tusk doesn't get many like you through the door. Food first, and then I'll find a reason to keep you here a while." },
    { id = "g_fl_yes", when = { flirt = true, chance = 0.5, npcFlagBefore = "gry_fl_yes" }, text = "There's my favourite! I've saved you the corner seat by the fire, and don't you dare tell Zargh I said so." },
    { id = "g_fl_no", when = { flirt = true, chance = 0.3, npcFlagBefore = "gry_fl_no" }, text = "A plate and nothing else, I remember. Sit anyway, because I feed everyone at the Tusk, even the ones who won't let me fuss over them." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've got blood everywhere, and some of it's yours. Sit down and eat before you fall down. Meat first, always meat first." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The candles on that table guttered the moment you sat down, and the grunts noticed before I did. Order quickly, warlock, because they've started telling stories about the Shadow Council." },
  },

  start = "hello",
  nodes = {
    dd_orders = {
      lines = {
        { id = "dd_or_default", text = "The usual, which is to say everything and nothing. One table says the humans mean to land a whole army at Tiragarde, another says it's only a few stubborn sailors who won't go home, and an old wolf rider says Proudmoore's ghost is behind it all. What did you make of them, since you carried the things?" },
      },
      choices = {
        { text = "Let them land. Durotar will bury every one.", next = "BACK", reply = "That's what the loud table says too, and they'll love you for it. I'll keep the stew hot either way.", fx = { align = { honor = -1 } } },
        { text = "I didn't read them. They were for the Warchief.", next = "BACK", reply = "A messenger who doesn't peek, now there's a rare thing. Thrall's lucky in his runners, if nothing else.", fx = { align = { honor = 1 } } },
        { text = "Something else, Gryshka.", next = "BACK" },
      },
    },
    fl = {
      lines = { { id = "fl_default", text = "Everyone eats at the Tusk, but not everyone gets the best cut, and you'd do well to notice which one's on your plate. A warrior with shoulders like yours needs feeding properly, and I'll admit I like to watch a strong one eat." } },
      choices = {
        { text = "Then keep the best cuts coming, Gryshka.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "gry_fl_yes" }, clear = { "gry_fl_no" } } } },
        { text = "Any orc would fight a war for a seat at your table.", next = "fl_yes", when = { race = "Orc" }, fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "gry_fl_yes" }, clear = { "gry_fl_no" } } }, reply = "Lok'tar! Now that's how an orc pays a compliment, plain and loud, so the whole inn can hear it." },
        { text = "Is there enough on that spit for a tauren?", next = "fl_tauren", when = { race = "Tauren" } },
        { text = "Is that how you treat Zargh, too?", next = "fl_zargh" },
        { text = "Generous of you, but I'll just take the stew.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "gry_fl_no" }, clear = { "gry_fl_yes" } } }, reply = "Stew it is, and no harm done. You'll still get the best cut, mind, because I can't help myself." },
        { text = "Keep your eyes on the spit, innkeeper.", next = "BACK", fx = { trait = { stern = 1 }, npcFlag = { set = { "gry_fl_no", "gry_fl_rebuff" }, clear = { "gry_fl_yes" } } }, reply = "Ha! Blunt as an axe, and I respect that. The spit it is, then." },
      },
    },
    fl_zargh = {
      lines = { { id = "flz_default", text = "Zargh! Who's been talking to you about Zargh? Fine, so he sends me meat from the Barrens and I send him back the bones, and nobody in Orgrimmar can make sense of it, least of all me. A woman can admire the stew in the next pot while she waits on her own, can't she?" } },
      choices = {
        { text = "She can admire it all she likes.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "gry_fl_yes" }, clear = { "gry_fl_no" } } } },
        { text = "I'd not come between you and Zargh, Gryshka.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "gry_fl_no" }, clear = { "gry_fl_yes" } } }, reply = "Hmph. You're kinder than he is, then, because he's never once told me what the bones mean to him." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fl_tauren = {
      lines = { { id = "flt_default", text = "For a tauren? I'd need a second spit and a wider door, and you'd still want a third plate after that. Lucky for you, I've always had a soft spot for a big appetite on a big frame." } },
      choices = {
        { text = "Then I'll make sure to come back hungry.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "gry_fl_yes" }, clear = { "gry_fl_no" } } } },
        { text = "Just the one plate will do, Gryshka.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "gry_fl_no" }, clear = { "gry_fl_yes" } } }, reply = "One plate for a tauren. I'll believe that when I see the bottom of it." },
      },
    },
    fl_yes = {
      lines = { { id = "fly_default", text = "Now that's an answer with some blood in it! Come back off the Valley of Honor with a fresh scar and a good story, and I'll sit with you while you eat, which is something I don't do for just anybody." } },
      choices = {
        { text = "I'll bring the story, Gryshka.", next = "BACK", reply = "Bring the scar too. The ones with scars always tell it better." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_gryshka = {
      big = true,
      lines = { { id = "xpt_gryshka_default", text = "Pick your companions the way you'd pick a wolf, for loyalty first and teeth second, because I've seen more war bands broken by quarrels over loot than by any Alliance blade. The ones who come back to my inn every season are the ones who share the coin evenly and the night watches fairly." } },
      choices = {
        { text = "Every share equal. That's how a company holds together.", next = "BACK", reply = "That's the way. The bands that split it even are the ones I see back at my tables every season.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whoever does the most work should take the most loot.", next = "BACK", reply = "Then you'll argue every night, and one of you will leave. Equal shares, if you want to last.", fx = { align = { honor = -1 } } },
        { text = "Thanks, Gryshka.", next = "BACK" },
      },
    },
    xcl_rfc = {
      big = true,
      lines = { { id = "xcl_rfc_default", text = "Good, because some nights my cellar smells of brimstone, and I've told the guards so twice. The recruits joke that there's a whole city of troggs and cultists under the Cleft, and after a few ales they dare each other to go and look, and most of them come back limping. I patch them up and feed them and tell them to wait until they're grown." } },
      choices = {
        { text = "The guards should have sealed those caves long ago.", next = "BACK", reply = "They should, and I've told them twice. Maybe they'll listen to someone who isn't holding a ladle.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the young ones go down, Gryshka. It's how they'll learn.", next = "BACK", reply = "Learn, or die, and I've buried enough recruits already. Let them grow up first.", fx = { align = { order = -1 } } },
        { text = "What do the recruits say is down there?", next = "xcl_rfc2" },
      },
    },
    xcl_rfc2 = {
      lines = { { id = "xcl_rfc2_default", text = "Troggs, mostly, and fire-dancers in red robes, and a demon as tall as Grommash Hold, though that last part grows taller with every ale. Whatever's true, they come back hungrier than they left, and I'll not complain about that." } },
      choices = { { text = "Then I'll take a plate, and the story's yours.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some of them. The old grunts saw that light in the camps, on the guards who kept them there, and they go quiet when it shows. Sit near the door and keep it to yourself after a few drinks, and they'll settle." } },
      choices = {
        { text = "I'll keep it quiet. They've earned their peace.", next = "BACK", reply = "They'll thank you for it in their own way, which mostly means not staring. Sit by the door; the draught suits them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll have to learn the Light is mine now.", next = "BACK", reply = "They'll learn, slowly, and faster if you don't push. Until then, the seat by the door is yours.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Only after they've lost, and only if nobody's watching, because an orc would sooner bleed than admit he needs mending. If you sit by the door with a bowl of stew, though, you'll find they come to you, and you can tell them the stew did it." } },
      choices = {
        { text = "I'll mend them and let the stew take the credit.", next = "BACK", reply = "Ha! They'll think it's my stew that mends them, and I'll never tell them otherwise. That suits us both.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them bleed until they learn to ask.", next = "BACK", reply = "Then they'll bleed on my floor, and I'll be the one scrubbing it. Don't expect thanks from me either.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every night, and I wouldn't have it otherwise, though I'd like them to break fewer stools. Grezz Ragefist's students come here after a hard day and arm-wrestle over my tables until somebody loses a tooth, so I keep a bucket by the door for the teeth." } },
      choices = {
        { text = "I'll keep my fights outside, Gryshka. Your inn deserves respect.", next = "BACK", reply = "Then you're welcome any night, and bring your friends. Just warn them about Zargh's bones.", fx = { align = { honor = 1 } } },
        { text = "A good brawl is half the fun of an inn.", next = "BACK", reply = "Half the fun and all the broken stools. Brawl outside, and come back for an ale.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My grandmother said a well-kept hearth is the first thing the spirits look for, and I keep this one burning night and day. The warlocks from the Cleft never sit near it, though, and you can make of that whatever you like." } },
      choices = {
        { text = "A warm hearth and a full plate honor the spirits best.", next = "BACK", reply = "They do. My grandmother kept a hearth like this in the camps, if you can believe it, with nothing to burn but straw.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Warlock or not, their coin spends the same at an inn.", next = "BACK", reply = "It does, and I take it. But they still never sit near the hearth.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Better than you'd fear, once the ale's poured. The orcs boast and the tauren listen, and by the end of the night they're singing the same song in two languages." } },
      choices = {
        { text = "I'd take that friendship over any war.", next = "BACK", reply = "So would I, and so would the Warchief. Pull up a stool; they'll start the drinking song soon.", fx = { align = { light = 1 } } },
        { text = "Friendship is fine, but it's the war that binds us.", next = "BACK", reply = "It binds us, aye, but it's the singing afterwards that keeps us together. Sit and listen a while, and you'll hear what I mean.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They do, and what's said in the Broken Tusk stays in the Broken Tusk, so don't go repeating it in the Drag. I've thrown bigger orcs than you out the door for listening at tables, and I'll do it again." },
      },
      choices = {
        { text = "Understood. What's said here stays here.", next = "BACK", reply = "Then you're welcome at any table. You'd be surprised what grunts tell each other after the third ale.", fx = { align = { honor = 1 } } },
        { text = "A loose tongue is a gift. I'll take what I hear.", next = "BACK", reply = "Then you'll be out that door, and I'll be the one throwing you. I've thrown bigger.", fx = { align = { honor = -1 } } },
        { text = "What's the best thing you cook?", next = "best" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "My hearth's burned fine for years without a spell, and it'll burn fine after you've gone. Sit down, eat your meat, and let the fire do its own work for once." },
      },
      choices = {
        { text = "Understood. I'll keep my hands off your fire.", next = "BACK", reply = "The fire thanks you, and so do I. It's been burning since the day the Warchief opened this city.", fx = { align = { order = 1 } } },
        { text = "A spell would burn hotter and longer.", next = "BACK", reply = "Hotter and longer, and the whole inn on fire. Leave it alone.", fx = { align = { order = -1 } } },
        { text = "What's good to eat tonight?", next = "best" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I mind, and so does every grunt in this room who remembers what the demon blood did to us. Leave the little horror outside the door, and if it scorches one of my tables, you'll be scrubbing it yourself." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "You're an orc, so you should know better than to ask. Plenty of grunts in this room still dream about the demon blood, so leave the little horror outside, and if it scorches one of my tables you'll be scrubbing it yourself." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I mind, and so does every grunt in this room, and you can see them all watching it over their mugs. Take that horror back out the door you brought it through, and if it scorches one of my tables on the way, you'll be scrubbing it yourself." },
      },
      choices = {
        { text = "Fair. It waits outside, out of respect.", next = "BACK", reply = "Thank you. The grunts won't say it, but they'll drink easier for it.", fx = { align = { light = 1 } } },
        { text = "It's harmless. Your grunts should grow thicker skin.", next = "BACK", reply = "Thicker skin? They've got scars from the demon blood. Leave it outside.", fx = { align = { light = -1 } } },
        { text = "What do you cook best, Gryshka?", next = "best" },
      },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "I cooked for human guards once, in a camp outside Lordaeron, and they never once asked my name. Now I run the best inn in Orgrimmar and I ask everybody's, so you tell me which of us came out ahead." },
        { id = "hum_v_undead", when = { race = "Scourge" },
          text = "You were one of them, weren't you, before you came out of the ground? Don't take it badly, love, but I cooked for human guards once, and you've got the same way of looking at the stew before you trust it." },
      },
      choices = {
        { text = "Did they treat you badly?", next = "hu_stance" },
        { text = "My parents were in the camps too.", next = "BACK", when = { race = "Orc" }, reply = "Then sit down, because anyone with camp blood eats first at the Tusk. We came out thin and quiet, and look at us now, loud and fed.", fx = { affinity = 1, opinion = { humans = "distrust" } } },
        { text = "Something else, Gryshka.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "Badly enough, but the worst of it wasn't the whip, it was the lethargy, orcs sitting in the mud with nothing in their eyes. One old guard used to slip me salt for the pot, and I've never known whether to thank him or curse him for keeping us fit to work." },
      },
      choices = {
        { text = "Curse him. A kind jailer is still a jailer.", next = "BACK", reply = "That's what my mother said, and she never forgave a single one of them. Eat, then, and keep your anger warm for the ones who earned it.", fx = { align = { light = -1 }, opinion = { humans = "hate" } } },
        { text = "Thank him. He didn't have to be kind.", next = "BACK", reply = "Maybe so, and maybe that's why I still put salt in everything. Don't tell Zargh I'm going soft, he'll never let it go.", fx = { align = { light = 1 }, opinion = { humans = "mixed" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_orders", tags = { "news" }, when = { questDone = TODO_QUEST("The Admiral's Orders") },
          text = "Half my tables were arguing last night about the Kul Tiran orders that came up from Razor Hill, and someone swore you were the one who carried them to the Warchief. Whatever's in them, it's good for business, because worried grunts eat twice as much." },
        { id = "h_dd_exalted", when = { reputation = { faction = "Orgrimmar", min = "exalted" } },
          text = "There's not a grunt in this city who doesn't know your face by now, and most of them would buy you a drink if you let them. Sit down, then, and let the Broken Tusk feed someone who's earned it." },
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You've the same face as {alt}, who slept upstairs and ate two bowls of my stew without stopping for breath. Kin of yours, I'd guess, and if the appetite runs in the family I'd best start another pot." },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "A {altrace} named {alt} stayed at the Broken Tusk not long back and ate like they hadn't seen food since Ashenvale. You've the same hollow look about you, so sit down before you fall down." },
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "Five of you, and every one of you looking hungry. Sit at the long table by the fire and keep your weapons off it, because the last war band that drank here broke two benches and a grunt's nose." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Do the dead even eat? Never mind, a paladin is a paladin, and nobody leaves the Broken Tusk hungry, not even one who glows a little." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at the Broken Tusk! Good, because half my customers leave with a black eye, and the other half give it to them." },
        { id = "h_default", text = "I'm Gryshka, and I keep the Broken Tusk, and I keep it fed. Nobody leaves my inn hungry, and a few leave too full to walk." },
        { id = "h_op_soft", tags = { "news" }, when = { gossip = { topic = "warchief", stance = "soft" } },
          text = "Somebody at the long table says you think the Warchief's gone soft. Keep that out of my inn, because the last orc who said it loudly is still picking splinters out of his back." },
        { id = "h_op_war", tags = { "news" }, when = { gossip = { topic = "peace", stance = "against" } },
          text = "The old grunts have been toasting you, did you know? Someone told them you think the humans are coming, and they've decided you're one of theirs now." },
        { id = "h_op_goblins", tags = { "news" }, when = { gossip = { topic = "goblins", stance = "distrust" } },
          text = "I hear you told Kaja what you think of goblins. She's been sulking all week, and it's the quietest the Valley of Strength has been in years." },
        { id = "h_op_humans", tags = { "news" }, when = { gossip = { topic = "humans", stance = "respect" } },
          text = "Runthak says you've a kind word for the humans. Say it at the corner table, not the long one, unless you want to see my benches break again." },
        { id = "h_zargh", when = { questActive = TODO_QUEST("Meats to Orgrimmar") },
          text = "From Zargh? Choice cuts from the Barrens! He remembered, of course he remembered. Tell him, well, tell him the meat was very good." },
        { id = "h_zargh_ack", when = { heardLine = "zargh.h_default" },
          text = "Zargh, at the Crossroads? Did he mention me, did he really, and what did he say? No, don't tell me, or, well... yes, tell me!" },
        { id = "h_bones", when = { questDone = TODO_QUEST("Meats to Orgrimmar") }, text = "Zargh's kept sending cuts since that first delivery, and I send back the bones, clean. Let him wonder what it means; I'm still wondering myself." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "It's late, and the Tusk is loud, which is good. A quiet inn in Orgrimmar means something's wrong." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" }, text = "A tauren druid in the Broken Tusk! Sit down before you knock the lamps over, and mind the stools, because the last one a tauren sat on is still in pieces." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the Broken Tusk! Sit down and eat first, because the spirits can wait for you to finish a plate, and I'll not have you calling storms on an empty stomach." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Sit down before you fall down, because the ones who come in off the Valley of Honor always swear they aren't hungry until the stew's in front of them." },
        { id = "h_cl_rfc", tags = { "news" }, when = { cleared = "Ragefire Chasm", faction = "Horde" }, text = "You've been down Ragefire Chasm and back, have you? Sit and eat, because nobody comes up from those caves without a hole in their stomach, and I'd like to hear what's been making my floor so warm." },
      },
      choices = {
        { text = "What do you make of humans, Gryshka?", next = "hu_view" },
        { text = "What were they saying about the Kul Tiran orders?", next = "dd_orders", when = { questDone = TODO_QUEST("The Admiral's Orders") } },
        { text = "Do your brawlers ever let a priest patch them up?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The spirits must favor a good hearth, Gryshka.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd guess orcs and tauren don't always get along here.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "What's the best thing you cook?", next = "best" },
        { text = "What do your customers argue about?", next = "arguments" },
        { text = "I brought in some game today.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Your regulars talk a lot after a few drinks, Gryshka.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could keep your hearth burning with a spell, Gryshka.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Warriors must cause you plenty of trouble, Gryshka.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Mind if my little companion warms itself at your fire?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does a Forsaken paladin bother your guests, Gryshka?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I went down Ragefire Chasm, Gryshka. It's quiet now.", next = "xcl_rfc", when = { cleared = "Ragefire Chasm", faction = "Horde" } },
        { text = "We're a company now, Gryshka. Any advice for us?", next = "xpt_gryshka", when = { party = { size = { min = 2 } } } },
        { text = "Do you feed everyone this well, Gryshka?", next = "fl", when = { flirt = true, ["not"] = { npcFlagBefore = "gry_fl_rebuff" } } },
        { text = "Just resting.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask while you chew, nobody minds at the Tusk." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "A hunter! Then you're the only kind of guest who brings meat into my inn instead of just taking it out. Hang it by the spit and tell me where you shot it, because I like to know whose kodo I'm roasting." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "A hunter! Then you're the only kind of guest who brings meat into my inn instead of just taking it out. Hang it by the spit, and yes, {pet} can have one bone, but don't tell the grunts I'm soft." },
      },
      choices = { { text = "Out past the Crossroads, in the Barrens.", next = "BACK", fx = { affinity = 2 } } },
    },
    arguments = {
      lines = { { id = "ar_default", text = "The Warchief's peace with Theramore, mostly, and it's the only thing that ever breaks my benches. The old grunts at the long table say the humans will stab us the minute we look away, and the young ones say Thrall knows best, so which end of the table do you sit at?" } },
      choices = {
        { text = "Thrall knows best. The peace should hold.", next = "arg_peace", fx = { affinity = 1, align = { order = 1 }, opinion = { peace = "for", warchief = "trust" } } },
        { text = "The old grunts are right. The humans will come.", next = "arg_war", fx = { align = { order = -1 }, opinion = { peace = "against" } } },
        { text = "If you ask me, the Warchief's gone soft.", next = "arg_soft", fx = { affinity = -1, opinion = { warchief = "soft" } } },
        { text = "I sit wherever the stew is, Gryshka.", next = "arg_stew", fx = { affinity = 1 } },
      },
    },
    arg_peace = {
      lines = { { id = "ap_default", text = "Good, then you can sit with the young ones and keep them from throwing things. The peace has kept my roof on since the day I raised it, and I'd like it to stay there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    arg_war = {
      lines = { { id = "aw_default", text = "Then you'll be welcome at the long table, and they'll pour you a drink and tell you about the camps until dawn. Just don't break anything while they do it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    arg_soft = {
      lines = { { id = "as_default", text = "Say that quietly in here, because half my regulars were in the camps with him and they'd take it badly. I'll pour for you anyway, since I'm not one to argue with a paying guest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    arg_stew = {
      lines = { { id = "ast_default", text = "Ha! That's the wisest thing anyone's said in the Broken Tusk all week, and I'll tell the long table you said it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "b_default", text = "Kodo, slow-roasted, or boar if the hunters are lucky, or anything Zargh sends, if I'm lucky." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone who eats at the Tusk talks with their mouth full, and I hear every word of it. Ask me about any of this, and then eat something." },
    },
    thrall = { { id = "tp_thrall", text = "The Warchief eats here sometimes, and he always pays, and he always finishes his plate. I've never served a more polite orc." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin likes his meat spicy and his ale cold, and he tips well. I'd say he's my favourite, but I'd never say it where Thrall could hear." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken don't eat, which is bad for business. They do sit by the fire, though, and I suppose they're cold." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best rum in the world, the sailors say, though I've never tasted it. I'd like to, one day, if Zargh ever takes me." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire came to Mulgore last season, and every guest who'd been there talked about it for weeks. Zargh said he'd take me, and then he blushed, and I've not let him forget it." } },
    _none = { { id = "tp_none", text = "Ask the regulars; they know everything, and drink to the rest." } },
  },
}

P:NPC {
  key = "gamon", id = TODO_NPC("Gamon"), name = "Gamon",
  bible = "bibles/orgrimmar.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "resigned" }, values = { "patient" },
  notices = { "class", "drink", "lock_soulstone" },
  impression = {
    first = "He always gets back up, which is the saddest and bravest thing.",
    third = "{name} met Gamon, a weary tauren in Orgrimmar who has been knocked down so often he no longer asks why.",
  },

  greetings = {
    { id = "g_sigh", text = "Oh, hello. You're not going to hit me, are you? Everyone hits me, and I stopped asking the Earth Mother why a long time ago." },
    { id = "g_low", when = { maxLevel = 5 }, text = "Another young one. Let me guess: you heard there's a tauren in the inn you can beat up. There is, but please don't." },
    { id = "g_away", when = { away = 14 }, text = "Oh, it's you again, after {away}. Nobody else stops to talk instead of hitting me, so I noticed you were gone, the way the grass notices when the rain stops." },
    { id = "g_word_helped", when = { word = "helped" }, text = "People in the inn say you've been helping folk around the city. I wish somebody had done that for me, back when I could still stand as tall as my herd." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior? I was one too, once, back in Mulgore, and then I started drinking, and then people started hitting me. I'm not sure which came first anymore." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You're drunk too, finally someone who understands! Sit down, only please don't hit me." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Someone put your soul in a stone, friend, I can feel it, and I wish someone would do that for me. Then the grunts could knock me down every night and I'd just keep getting back up." },
  },

  start = "hello",
  nodes = {
    dd_deaths = {
      lines = {
        { id = "dd_de_default", text = "The difference is you get back up and go somewhere, and I get back up and get knocked down again by the next grunt who wants to test his strength. My mother used to say the earth catches everyone who falls, but I don't think she meant for it to catch me quite this often." },
      },
      choices = {
        { text = "Then stop standing in their way, Gamon.", next = "BACK", reply = "And where would I stand instead? This is where Tazan pays me. Besides, they'd only come looking.", fx = { align = { light = -1 } } },
        { text = "Come stand somewhere else. I'll watch your back.", next = "BACK", reply = "That's kind of you, friend, truly. But you'll be gone by morning, and I'll be here, so I'd best stay where they know where to find me.", fx = { align = { light = 1 } } },
        { text = "Something else, Gamon.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because everyone does, and the only glow I ever saw in Mulgore was the sunrise over the grass. The orcs here tell me what that Light did to them in the camps, though, so I expect you'll hit me harder than most." } },
      choices = {
        { text = "I'll not be the next to knock you down.", next = "BACK", reply = "You're kinder than most who come in here, friend. Most of them just want to see how far I fall.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then stay down this time and save us both trouble.", next = "BACK", reply = "It would be easier, wouldn't it? But something in me keeps standing up, and I don't know how to stop it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because tomorrow somebody will knock me down again, and then the healing's wasted on me. I was a warrior of Bloodhoof once, you know, and a good one, and I think I'd rather keep the bruises than pretend I'm still that tauren." } },
      choices = {
        { text = "A warrior who keeps getting up is still a warrior.", next = "BACK", reply = "You think so? Nobody's called me a warrior since I came down from Mulgore. Thank you for that.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then stop getting up, Gamon, and stop being their sport.", next = "BACK", reply = "Maybe I should, but I don't know how. Getting up is the only thing I still do well.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hunt? I used to run plainstriders through the grass of Mulgore with my brothers, and I could bring one down faster than any of them. Now the only thing I track is the ale barrel, and Tazan says I'm losing the scent of that too." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I used to run plainstriders through the grass of Mulgore with my brothers, faster than any of them. Now I only track the ale barrel, and that {pet} of yours is the only one in Orgrimmar who's looked at me kindly all week." },
      },
      choices = {
        { text = "Get up, Gamon. A hunt would do you good.", next = "BACK", reply = "The Earth Mother knows I miss the hunt. Give me one more ale first, and then we'll see.", fx = { align = { honor = 1 } } },
        { text = "Stay down, Gamon. It's safer for everyone.", next = "BACK", reply = "Maybe you're right, and it would be safer. But I don't think I know how.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Once, I think, back before the drinking, when I still rode against the centaur for Cairne. The wind told me to duck, and I did, and the spear went over my horns, and I've been trying to hear it again ever since, mostly at the bottom of a mug." } },
      choices = {
        { text = "The wind still speaks, Gamon. Put the mug down and listen.", next = "BACK", reply = "I used to hear it on the plains every morning. Not tonight, but I'll try tomorrow.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some warriors only have one good day in them.", next = "BACK", reply = "Then I had mine at Thunder Bluff, a long time ago. It was a very good day.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Would you? No, don't, because then they'd only knock me down harder tomorrow. I was a warrior once and I fought fair, and look where it got me, so maybe you've got the right idea after all." },
      },
      choices = {
        { text = "Some lessons go down better with a knife at the throat.", next = "BACK", reply = "Ha! You'd have to reach my throat first, little one. Not tonight, though.", fx = { align = { honor = -1 } } },
        { text = "Next time, I'll stand beside you openly.", next = "BACK", reply = "You would? Then maybe I'll stand up a little straighter. Thank you, friend.", fx = { align = { honor = 1 } } },
        { text = "Why does everyone attack you?", next = "why" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Everything frightens me now, friend, so whatever's creeping along behind you is just one more thing on a long list. The orcs tell me what the warlocks did to them in the old wars, though, and being knocked down by grunts every night is a kinder fate than that." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Everything frightens me now, friend, and I'll admit your demon frightens me more than most, standing there grinning at me while I sweep. Still, the orcs tell me what the warlocks did to them in the old wars, and being knocked down by grunts every night is a kinder fate than that." },
      },
      choices = {
        { text = "You're right to be wary. I'll stay careful.", next = "BACK", reply = "Stay careful, friend. I'd hate to see you end up on this floor next to me.", fx = { align = { light = 1 } } },
        { text = "Power has a cost, and I'll pay it gladly.", next = "BACK", reply = "Then pay it, and I'll hope it's not too much. I've paid enough of my own.", fx = { align = { light = -1 } } },
        { text = "Why do they keep knocking you down?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Maybe it would, and the Earth Mother is patient with fools, they say. But out there nobody knocks you down, and I'm not sure I'd know who I was anymore. In here at least I know I'll get back up, and that's the one thing I'm still good at." } },
      choices = {
        { text = "You keep getting up, Gamon. That takes guts.", next = "BACK", reply = "Guts or stubbornness, I can't tell the difference anymore. Thank you for seeing it, though.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pride's no use to you. Walk away and start over somewhere.", next = "BACK", reply = "Start over where? Mulgore remembers the warrior I was, and I'm not him anymore. Maybe someday.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Once, a troll froze me to the floor and everybody stepped over me for an hour, which was almost restful. I was a warrior before, you know, and I'd rather be hit than pitied, so do whichever you like." },
      },
      choices = {
        { text = "Nobody should be knocked down for sport, Gamon.", next = "BACK", reply = "No, they shouldn't. But they do, and I let them, and I couldn't tell you why.", fx = { align = { light = 1 } } },
        { text = "Get up and fight back, or stay on the floor.", next = "BACK", reply = "Fight back? I was a warrior once, and I fought fair, and look where it got me. I'll stay down a while.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You've been knocked flat a good few times yourself, from the look of you, and not just by the grunts in this bar. Sit down on the floor here with me, then, because at least the floor can't drop you any further." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Ha! A dead paladin. I've been knocked down by everything else in this inn, so I suppose you're next, are you?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You've come to look at my bruises, I suppose, and I'll tell you now that most of them are old ones." },
        { id = "h_default", key = true,
          text = "I'm Gamon. I help Tazan the troll with his trade when I'm sober, and I'm usually here, lying on the floor because someone's knocked me down again. My herd is a long way off in Mulgore, and it's better they don't see me like this." },
        { id = "h_bruise", when = { metBefore = true }, text = "Oh, you again. You didn't hit me last time, which makes you my favourite person in Orgrimmar. It's a short list." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Don't call lightning down on me, please, because I've been hit by most other things in this inn and I'd like to keep that one off the list." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. If you can turn into a bear, please don't do it near me, because I've been knocked down by orcs and trolls and a bear would round the list off badly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "Oh, a hunter. Mind your beast doesn't lick my face, because the last one did, and I couldn't get up to stop it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Don't set me on fire, that's all I ask, because people usually settle for punching me." },
      },
      choices = {
        { text = "We've both been knocked down a lot, Gamon.", next = "dd_deaths", when = { deaths = { min = 10 } } },
        { text = "Why don't you let someone heal you, Gamon?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd guess the spirits spoke to you once, Gamon.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would the wild do you more good than this inn, Gamon?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why does everyone attack you?", next = "why" },
        { text = "I could teach whoever keeps knocking you down a lesson.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Did you ever hunt, Gamon, before you ended up on this floor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Something about me seems to frighten you, Gamon.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I won't hit you.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "You carry yourself like an old warrior, Gamon. What happened?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'd bet a mage has knocked you down before.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why would I knock you down, Gamon?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Bye, Gamon.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? I'm not going anywhere, since I hardly ever do, unless somebody carries me." },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "I carried a big totem-hammer once, the kind my grandfather carved, and I wasn't bad with it either. I don't really remember when I put it down, and I suppose that's most of my story right there." } },
      choices = {
        { text = "You could pick that hammer back up.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then stay away from the ale, Gamon.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "I'm here, I suppose, and I always get back up, the way the grass does after the kodo walk over it. Maybe that's the trouble; maybe if I stayed down, they'd get bored." },
      },
      choices = {
        { text = "Never stay down, Gamon.", next = "END", reply = "Never, then, and I'll get up tomorrow too. May the Earth Mother walk with you, friend.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Then stay down, and let them get bored.", next = "END", reply = "Maybe you're right, and maybe they will. Farewell, friend, and mind the door on your way out.", fx = { align = { honor = -1 } } },
        { text = "...", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. I spend most days looking at the ceiling, and it's a nice ceiling, though not as nice as the sky over Mulgore." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, and I was good, once. Now I'm good at getting knocked down, which takes a different kind of strength." } },
    internment = { { id = "tp_internment", text = "The camps took something out of me, and I never quite got it back. Thrall freed my body, but some days I think the rest of me is still behind that fence." } },
    thrall = { { id = "tp_thrall", text = "The Warchief came to this inn once and saw me on the floor, and he helped me up himself. I've never forgotten it, and I never will." } },
    burning_legion = { { id = "tp_burning_legion", text = "The demons made us strong, and then they made us weak. I don't miss the strength, but I miss feeling like I knew what I was for." } },
  },
}
