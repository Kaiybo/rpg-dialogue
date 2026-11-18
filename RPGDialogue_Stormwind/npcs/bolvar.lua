-- Highlord Bolvar Fordragon, Stormwind Keep. Voice: bibles/bolvar.md
-- Regent for a ten-year-old king, with a missing king to find and a kingdom to hold.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "bolvar", id = TODO_NPC("Highlord Bolvar Fordragon"), name = "Highlord Bolvar Fordragon",
  bible = "bibles/bolvar.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "lawful", "brave", "honest" },
  spiritSensitive = true,
  notices = { "reputation", "paladin" },
  impression = {
    first = "Highlord Bolvar Fordragon holds the kingdom for a boy and an absent king, and he looks tired in the way only honest men get tired. He asked me to speak plainly, and he meant it.",
    third = "{name} stood before Highlord Bolvar Fordragon, Regent of Stormwind, who keeps the throne for a king who never came home.",
  },

  greetings = {
    { id = "g_op_argent", when = { gossip = { topic = "argent_dawn", stance = "admire" } }, text = "Lord Rall tells me you favour the Argent Dawn. So do I, quietly, and I'd thank you to keep it quiet, since the Crusade still has friends at court." },
    { id = "g_op_peace_against", when = { opinion = { topic = "peace", stance = "against" } }, text = "I'm told you've no use for peace with the Horde. Keep that sword sharp, then, but point it where I tell you, and not at Theramore's envoys." },
    { id = "g_op_orcs_hate", when = { gossip = { topic = "orcs", stance = "hate" } }, text = "The king tells me you think orcs understand nothing but the sword. I fought them in the Second War, so I won't argue, but I'd thank you not to teach it to a ten-year-old." },
    { id = "g_court", text = "Speak plainly. The court has enough of the other kind." },
    { id = "g_hero", when = { townStanding = { town = "stormwind", min = 55 } }, text = "Ah. I've read your name in more reports than I can count. Good reports, mostly." },
    { id = "g_distrust", when = { townStanding = { town = "stormwind", max = -20 } }, text = "The Watch has spoken of you. Be brief, and be careful." },
    { id = "g_away", when = { away = 14 }, text = "You've been away from the city {away}, and the reports kept coming without you. It's good to see you back in the Keep." },
    { id = "g_away_long", when = { away = { min = 60, levels = 5 } }, text = "You've been gone {away}, and you come back carrying yourself like a veteran. Whatever you faced out there, it seems you met it squarely." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I'm told you've been doing honest work for the city's people these past days. That's the kind of report I'm glad to read." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word reached the Keep that someone in the city caught you in a lie. Speak plainly with me, then, because I've no patience left for the other kind." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", minLevel = 20 },
      text = "A paladin of the Light in my hall. Uther would have liked to see more of you. So would I." },
    { id = "n_hero", cat = "reputation", place = "before", when = { minLevel = 50 },
      text = "Veterans of your kind are rare. Rarer every year. Stormwind is grateful, whether or not it remembers to say so." },
  },

  start = "hello",
  nodes = {
    op_jaina = {
      lines = {
        { id = "op_jaina_a", text = "She keeps faith with peace, which isn't always the same thing. Jaina Proudmoore writes that Thrall's orcs want only to be left alone in Durotar, and the loudest voices in the House of Nobles call her a fool for believing it. You've seen more of the world than they have, so what do you make of it?" },
      },
      choices = {
        { text = "Lady Proudmoore is right. Peace with Thrall is worth the risk.", next = "op_jaina_1", fx = { opinion = { jaina = "trust", peace = "for" }, align = { light = 1 } } },
        { text = "The orcs burned this city once. I'd never trust them again.", next = "op_jaina_2", fx = { opinion = { jaina = "naive", peace = "against" }, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Trust Thrall's word, but keep the scouts out and the walls manned.", next = "op_jaina_3", fx = { opinion = { jaina = "respect", peace = "for" }, trait = { cautious = 1 }, affinity = 2 } },
        { text = "Ironforge remembers Grim Batol, my lord. The orcs owe us blood.", next = "op_jaina_4", when = { race = "Dwarf" }, fx = { opinion = { orcs = "hate", peace = "against" } } },
        { text = "The Light asks mercy even for orcs, my lord.", next = "op_jaina_5", when = { class = "PALADIN" }, fx = { opinion = { orcs = "pity", peace = "for" }, trait = { pious = 1 } } },
        { text = "I'd rather not speak for the kingdom, Highlord.", next = "BACK" },
      },
    },
    op_jaina_1 = {
      lines = { { id = "op_jaina_r1", text = "Then you and she would get on, and I hope you're both right. I'll keep the garrison ready all the same, because hope has never yet held a wall." } },
      choices = { { text = "Let me ask you something else.", next = "BACK" } },
    },
    op_jaina_2 = {
      lines = { { id = "op_jaina_r2", text = "Plenty in this hall would cheer you for that, and I saw the old city burn, so I don't blame them. But I'd rather not start a war while Westfall is still on fire." } },
      choices = { { text = "Let me ask you something else.", next = "BACK" } },
    },
    op_jaina_3 = {
      lines = { { id = "op_jaina_r3", text = "That's very nearly what I wrote back to her, word for word. You'd make a fair regent, and I wouldn't wish the chair on you." } },
      choices = { { text = "Let me ask you something else.", next = "BACK" } },
    },
    op_jaina_4 = {
      lines = { { id = "op_jaina_r4", text = "They do, and Magni has never let me forget it. If it comes to war again, I'll want every dwarf who feels as you do on the wall beside me." } },
      choices = { { text = "Let me ask you something else.", next = "BACK" } },
    },
    op_jaina_5 = {
      lines = { { id = "op_jaina_r5", text = "It does, and Uther said the same when they filled the camps after the war. He was a better man than most of us, and I try to remember him when the nobles shout." } },
      choices = { { text = "Let me ask you something else.", next = "BACK" } },
    },
    xpt_bolvar = {
      big = true,
      lines = { { id = "xpt_bolvar_default", text = "More than the army would like to admit. The regulars hold the roads and the walls, but it's companies like yours that go into the Deadmines and the Stockade and come back with what we needed to know, and half my reports these days are written by people who never swore an oath to anyone." } },
      choices = {
        { text = "Then the Crown should bring free companies under its banner.", next = "BACK", reply = "I've argued for it at council, and the House of Nobles argued back about the cost. Until they relent, the Crown will pay you in thanks and bounties.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We fight better without the Crown's leash, Highlord.", next = "BACK", reply = "Perhaps you do, and I'll not pretend the army could do your work. Only remember whose roads you walk on, and whose people you're protecting.", fx = { align = { order = -1 } } },
        { text = "Who were the companies you remember from the Second War?", next = "xpt_bolvar2" },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xpt_bolvar2 = {
      lines = { { id = "xpt_bolvar2_default", text = "Ten men from Lordaeron with a cart and one good bowman held a bridge on the Thandol Span for two days while Lothar's lines reformed, and I never learned most of their names. I think of them whenever someone tells me that wars are won by kings." } },
      choices = {
        { text = "Someone ought to remember their names, Highlord.", next = "BACK" },
      },
    },
    xcl_bwl = {
      big = true,
      lines = { { id = "xcl_bwl_default", text = "The Blackrock orcs have lost their master, and the Dark Irons below them have lost an ally, so for a season the Burning Steppes may be quieter than they've been since the Second War. I'd send men to hold the passes if I had them, but the honest answer is that I'll send letters and hope Lakeshire holds." } },
      choices = {
        { text = "Hold the passes with what you have. The kingdom mustn't overreach.", next = "BACK", reply = "That's the counsel I'd give myself, and the one I'll likely follow. A kingdom that overreaches gives the Horde nothing to do but wait.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the passes. Let free blades clean out the mountain.", next = "BACK", reply = "Free blades are welcome to try, and I'll gladly sign the bounties. But I've buried enough brave fools in the Steppes to know the mountain fights back.", fx = { align = { order = -1 } } },
        { text = "What was Nefarian building up there?", next = "xcl_bwl2" },
      },
    },
    xcl_bwl2 = {
      lines = { { id = "xcl_bwl2_default", text = "The reports from the Spire spoke of dragons bred in strange colours and orcs sworn to him like hounds, and I've no scholar who can tell me what he meant by any of it. Now that you've ended it, I'm content never to find out." } },
      choices = {
        { text = "Some secrets are better left in the ashes, Highlord.", next = "BACK" },
      },
    },
    xcl_onyxia = {
      big = true,
      lines = { { id = "xcl_onyxia_default", text = "Then you saw an end I couldn't see coming for years, though I sat in the same chamber every day. I've ordered every decree she touched read again, and I'll answer for each one I signed, because the boy will ask me one day and he deserves the truth." } },
      choices = {
        { text = "Answer for it openly, Highlord. The people deserve the whole truth.", next = "BACK", reply = "You're right, and it will cost me, and I'll pay it. A regent who hides his mistakes teaches a boy king to hide his.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Read the old decrees quietly. Shame weakens a throne more than dragons.", next = "BACK", reply = "There's sense in that, and the court would thank you for it. But I'll not have Anduin learn that a throne survives on silence.", fx = { align = { honor = -1 } } },
        { text = "How did no one at court see it?", next = "xcl_onyxia2" },
      },
    },
    xcl_onyxia2 = {
      lines = { { id = "xcl_onyxia2_default", text = "A few nobles grumbled, but grumbling is the court's weather and I'd stopped listening to it. Dragons are patient and their magic is old, though I'll not hide behind that, since I sat closer than anyone." } },
      choices = {
        { text = "No one could have known, Highlord. Don't carry it alone.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It does, so long as I hold this seat, though the House of Nobles asks what the Alliance owes a people it barely knows. Darnassus answered when we called, and I mean to answer when they do." } },
      choices = {
        { text = "Then I'll hold you to it, Highlord, and so will my people.", next = "BACK", reply = "Do, and I'll be glad of it. A promise that nobody holds you to is only a pleasant sound in a council chamber.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My people stood alone for ages. We need nobody's oath.", next = "BACK", reply = "I know, and I respect it, and I'll keep my oath all the same. Darnassus may never need us, but it will never find us absent.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I trust Mathias Shaw, which isn't the same thing, and I've signed orders I'd sooner not have read twice. A kingdom with its king missing can't afford clean hands everywhere, though I pray it keeps them where it can." } },
      choices = {
        { text = "The crown's work should still be honest work, Highlord.", next = "BACK", reply = "It should, and most of it is. The rest I carry, and I'll answer for it when the king comes home to ask.", fx = { align = { honor = 1 } } },
        { text = "Clean hands don't keep a kingdom, Highlord, and Shaw knows it.", next = "BACK", reply = "Shaw would say so too, and he'd be right more often than I'd like. That's exactly why I read every order twice.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because driving them out would only drive them deeper, where I can't see them, and SI:7 would rather they stayed in a cellar it already watches. Don't mistake that for approval, because the Second War taught every man in this hall what fel magic costs." } },
      choices = {
        { text = "I'll keep my binding to the battlefield, Highlord, and nowhere else.", next = "BACK", reply = "See that you do. If what you call ever turns on this city, I'll not ask SI:7 to watch the cellar; I'll ask it to close it.", fx = { align = { light = 1 } } },
        { text = "Fel magic won the orcs a war, Highlord, and Stormwind could use it.", next = "BACK", reply = "It also cost them their homeland and nearly their souls, and I watched what it did to them at Blackrock. Stormwind will win its wars without it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Redridge and Duskwood, if you ask me plainly. The orcs in the Redridge hills and whatever stalks the Duskwood roads outnumber the men I can send, and a hunter who can read a trail is worth a squad of guards who can't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Redridge and Duskwood, if you ask me plainly. That {pet} of yours looks keen enough to follow a worg into Duskwood. Keep it fed and keep it close, and the Light will watch over you both." },
      },
      choices = {
        { text = "I'll go where the roads are worst, Highlord.", next = "BACK", reply = "Then the kingdom owes you, and so do I. Tell Magistrate Solomon in Lakeshire I sent you, and he'll point you at the worst of it.", fx = { align = { order = 1 } } },
        { text = "I hunt for my own reasons, not the crown's.", next = "BACK", reply = "That's your right, and I'll not ask more. But if your reasons take you to Redridge, the people there won't ask what they were.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Less than I should, and mostly at night, when the petitions stop. I pray for King Varian's return and for the strength to carry the boy's crown until then, and some nights I'm not sure which prayer I need more." } },
      choices = {
        { text = "A tired man's prayer is heard as well as any, Highlord.", next = "BACK", reply = "I hope so, for I've little else to give at that hour. Thank you; I'll remember it tonight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't bring the king home. Soldiers and searching will.", next = "BACK", reply = "I've sent both, and I'll keep sending them. But I'll keep praying too, because a regent who stops hoping has no business sitting here.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every day I sit in this hall, though I'd never say so before the court. A paladin is meant to stand between the weak and the dark, and instead I stand between the nobles and the treasury, which is a darker place than it sounds." } },
      choices = {
        { text = "The kingdom needs a steady hand here more than another sword.", next = "BACK", reply = "That's what I tell myself each morning, and some mornings I believe it. Thank you for saying it aloud.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the court squabble. A paladin belongs where the fighting is.", next = "BACK", reply = "You speak for my heart, and the oath I took when I first held a hammer. But a boy needs a regent more than the field needs one more paladin.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_bolvar = {
      big = true,
      lines = { { id = "xalt_bolvar_default", text = "A {altrace} {altclass} called {alt}, who gave me a plain answer on a day when the court had given me nothing else. I keep a short list of people I'd trust with a hard errand, and that name is on it, so you'll forgive me for hoping you're cut from the same cloth." } },
      choices = {
        { text = "Then I'll try to deserve a place on that list.", next = "BACK", reply = "You've made a good start by asking. Go and keep making it; the list is short, and I'd like it longer.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A borrowed reputation still opens doors. I'll use it.", next = "BACK", reply = "That's honest, at least. Mind you don't spend it faster than you earn your own, because names wear thin.", fx = { align = { honor = -1 } } },
        { text = "Something else, Highlord.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Forgive me for staring. A {altrace} named {alt} stood in this hall not long ago, and you carry yourself so much like that one that I took you for kin before you'd said a word." },
        { id = "h_alt_higher", when = { alt = { higher = true }, metBefore = false },
          text = "Your name isn't in my reports yet, but there's a {altclass} called {alt} whose name is in a good many of them. You've something of the same look about you, and I hope you'll earn the same kind of reports." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} came through the Keep a little while ago with news from the roads, and it matched yours so closely that I've begun to think the two of you ride the same circuit. Is there a word between you I ought to know about?" },
        { id = "h_pt_bolvar4", tags = { "news" }, when = { party = { size = 4 } },
          text = "Five of you, armed and walking the Keep as one company. That's how Stormwind was held in the Second War, {name}, by small bands who trusted each other more than they trusted orders, and I'm glad to see it hasn't gone out of fashion." },
        { id = "h_pt_bolvar", tags = { "news" }, when = { party = true },
          text = "You've brought companions to the Keep, I see. Good; I'd rather hear a report from a band who watched each other's backs than from one tired soul who's been riding alone." },
        { id = "h_cl_bwl", tags = { "news" }, when = { cleared = "Blackwing Lair", faction = "Alliance" },
          text = "Nefarian's head hangs at the city gate, and the guards have stopped making jokes about it, which tells me they understand what it means. You were at the top of Blackrock Mountain when he fell, and Stormwind won't forget it." },
        { id = "h_cl_onyxia", tags = { "news" }, when = { cleared = "Onyxia's Lair", faction = "Alliance", questDone = TODO_QUEST("The Great Masquerade") },
          text = "The dragon's head hangs over the city gate where every merchant has to pass beneath it, and I gave the order myself. I want Stormwind to remember how near she came, and how close I let her." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Alliance. The Archbishop's people have been good to this city in a hard year, and I'm glad of every one I see in these halls." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! It's been too long since I stood with the Silver Hand in the field rather than beside this throne, and I'll confess I look at your armour a little enviously." },
        { id = "h_default", text = "Bolvar Fordragon. I keep the kingdom for King Anduin until his father comes home, or until he's grown. Whichever the Light allows first." },
        { id = "h_new", when = { maxLevel = 15 },
          text = "You're young for this hall, and that's good, because the young still believe the kingdom's worth defending. Don't lose that in Westfall." },
        { id = "h_westfall", when = { thread = { id = "westfall_left", beat = "b3_danuvin" } },
          text = "You've been to Sentinel Hill. Stoutmantle is a better man than this court deserves. Tell him I said so, if he'll hear it from me." },
        { id = "h_varian", when = { minLevel = 30 },
          text = "The king left for Theramore and never arrived. Each morning I look at that empty seat and tell the boy it's only a while longer." },
        { id = "h_masquerade", tags = { "news" }, when = { questDone = TODO_QUEST("The Great Masquerade") },
          text = "I trusted Lady Prestor's counsel for years, every word of it, and now I'll be reading old decrees for months, looking for her hand in them." },
        { id = "h_solomon", tags = { "news" }, when = { questRecent = { TODO_QUEST("The True Masters"), days = 5 } },
          text = "Magistrate Solomon's evidence from Lakeshire isn't enough to march an army on, and it's too much to ignore, so I'm sending you. Lakeshire deserves an army; it gets my best instead." },
        { id = "h_light", when = { alignment = { axis = "light", min = 50 } },
          text = "There's something steady in you. The Light, or plain decency; on a good day they look the same." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Your High Order sought out the Kirin Tor, and through them, us. Stormwind keeps its friends. I hope your people find us worth the journey." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, it's you. Sit, if the guards will let you, because I'd rather hear how the roads really are from someone I trust than read it in a report." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "State your business. I've heard enough about you from the Watch to want this conversation short." },
        { id = "h_guard", when = { origin = "human_city_guard" },
          text = "I know that walk; the Watch teaches it to every recruit who's ever carried a lantern down the Trade District. You traded the halberd for the road, I hear, and the road could use you more than the Watch can." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Shaw tells me you're one of his, or near enough. I don't ask him how his people do their work, and I trust I'll never need to ask you." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "The Church tells me what's kept under the Slaughtered Lamb, and the Church is not pleased, nor am I. You stand in my hall openly, though, so I'll hear you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The kingdom's roads run longer than its soldiers can walk, and I'm grateful for anyone who knows the wilds past Elwynn." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei in the Regent's hall. Your people's envoys have been unfailingly courteous, and I'd like Stormwind to deserve that courtesy." },
      },
      again = {
        { id = "h_again", text = "What else? Briefly; the council sits at noon." },
        { id = "h_again2", text = "Go on. I have a moment, for once." },
      },
      choices = {
        { text = "Westfall seems left to fend for itself.", next = "westfall" },
        { text = "What do you make of Lady Prestor?", next = "prestor" },
        { text = "The Church seems to have the crown's ear.", next = "church", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Stormwind took my family in, after Lordaeron.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "There's still no word of King Varian, I take it.", next = "varian" },
        { text = "I don't know how you bear the regency, Highlord.", next = "bear" },
        { text = "I'm a soldier, Highlord, and I'm yours to send.", next = "soldier", when = { class = "WARRIOR" } },
        { text = "Ironforge stands with Stormwind, Highlord.", next = "ironforge", when = { race = "Dwarf" } },
        { text = "My people lost Gnomeregan. Will Stormwind help take it back?", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "Why should the kaldorei trust Stormwind, Highlord?", next = "kaldorei", when = { race = "NightElf" } },
        { text = "The High Order sent me to learn what Stormwind is.", next = "highorder", when = { race = "Skyborne" } },
        { text = "Dalaran's mages could help this kingdom more than they do.", next = "dalaran", when = { class = "MAGE" } },
        { text = "I speak to the spirits of the earth, Highlord.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Do you trust SI:7's methods, Highlord?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Where would a hunter serve the kingdom best, Highlord?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why does the crown tolerate the Lamb's warlocks, Highlord?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you ever find time to pray, Highlord?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you miss the field, Highlord?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does Stormwind truly mean to stand by the night elves, Highlord?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Onyxia is dead, Highlord. I was there in her lair.", next = "xcl_onyxia", when = { cleared = "Onyxia's Lair", faction = "Alliance", questDone = TODO_QUEST("The Great Masquerade") } },
        { text = "Nefarian is dead. What becomes of Blackrock Mountain now?", next = "xcl_bwl", when = { cleared = "Blackwing Lair", faction = "Alliance" } },
        { text = "Do small companies like ours still matter to Stormwind, Highlord?", next = "xpt_bolvar", when = { party = true } },
        { text = "You mentioned someone else like me, Highlord?", next = "xalt_bolvar", when = { alt = true } },
        { text = "I'll take my leave, Highlord.", next = "END" },
      },
    },
    westfall = {
      big = true,
      lines = {
        { id = "t_westfall", key = true,
          text = "I know what they say out there. The kingdom is stretched thinner than any of us would like, and my council urges patience. I mislike it." },
      },
      choices = {
        { text = "Then send them help.", next = "help", fx = { opinion = { westfall = "abandoned" }, align = { honor = 1 } } },
        { text = "Patience is wise.", next = "BACK", reply = "It is, so my councillors keep telling me, and I know a kingdom cannot spend what it does not have. Still, patience comes easier in a palace than on a burning farm, and I try never to forget that.", fx = { opinion = { westfall = "patience" }, affinity = 1, align = { order = 1 } } },
      },
    },
    help = {
      lines = {
        { id = "hp_default", text = "I can't empty the city's garrison into the fields on a feeling. I need proof of who leads them, and where. Bring me that, and I'll have something to argue with." },
      },
      choices = {
        { text = "I'll find it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Proof won't feed Westfall.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    varian = {
      lines = {
        { id = "v_default", text = "None I can share. Lady Prestor advised that the crown pass to Anduin, to keep order, and it has kept order, but it hasn't brought his father home." },
      },
      choices = { { text = "I hope he returns.", next = "BACK", fx = { affinity = 1 } } },
    },
    bear = {
      big = true,
      lines = {
        { id = "b_default", text = "I bear it by not acting on suspicion, and not breaking faith with the people who serve. Some days that's all a regent has, and it has to be enough." },
      },
      choices = {
        { text = "It's more than most have.", next = "BACK", reply = "Perhaps it is. I'll take that, and hold to it on the hard days.", fx = { affinity = 2, align = { order = 1, light = 1 } } },
        { text = "Faith alone won't stop a knife in the dark, my lord.", next = "BACK", reply = "No, and I've guards at every door for that reason. But a regent who trusts nobody will soon have nobody left to trust him.", fx = { align = { light = -1 } } },
        { text = "Sometimes suspicion is enough.", next = "suspicion", fx = { trait = { skeptical = 1 } } },
        { text = "You can tell me what it really costs you, Highlord.", tag = "Persuade", next = "bear_true",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { townStanding = { town = "stormwind", min = 55 } } } } },
          fail = { next = "bear_closed", fx = { affinity = -1 } } },
      },
    },
    bear_true = {
      big = true,
      lines = {
        { id = "bt_default", text = "Sleep, mostly. I sit up with the boy until he drops off, and then I sit up with the reports, and some nights I put my sword on the table just to remember I used to know what to do with my hands." },
        { id = "bt_patience", text = "And patience. My council tells me patience is strength, and I've said it to the court so often it sounds like my own voice, though some nights I wonder whether it's only patience after all." },
        { id = "bt_priest", when = { class = "PRIEST" },
          text = "You asked as a priest would, so I'll answer as a man would at confession: I pray every night that I'm keeping the kingdom and not just keeping the chair warm, and I don't always hear an answer." },
      },
      choices = {
        { text = "You're keeping more than a chair, my lord.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then trust your own voice more than your council's.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Thank you for telling me.", next = "BACK" },
      },
    },
    bear_closed = {
      lines = {
        { id = "bc_default", text = "What it costs me is my own affair, and I'll thank you not to make a confessor of yourself in the king's hall. The kingdom is your business here, and the man holding it is not." },
        { id = "bc_default2", text = "I appreciate the concern, I'm sure, but a regent who shares his doubts with every visitor soon has a court full of them. Ask me about the kingdom instead." },
      },
      choices = {
        { text = "Of course, Highlord.", next = "BACK" },
        { text = "Then I'll ask about the kingdom.", next = "BACK" },
      },
    },
    prestor = {
      lines = { { id = "pr_default", text = "Her counsel has kept this city steady through a hard few years, and there's no sharper mind on the council. Some find her cold; I find her useful, and a regent needs useful more than warm." } },
      choices = {
        { text = "Useful to whom?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    church = {
      big = true,
      lines = { { id = "ch_default", text = "His Grace has my ear whenever he wants it, and the Cathedral's doors are the one thing in this city nobody argues about. Pray for the king, both of them, if you would." } },
      choices = {
        { text = "I pray for them every day.", next = "BACK", reply = "Then you're doing more for them than half this court. Thank you, and the Light keep you.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayers won't bring a king home, my lord.", next = "BACK", reply = "No, but they keep me on my feet while the searching goes on. I'll not apologise for leaning on them.", fx = { align = { light = -1 } } },
        { text = "Pray for the people outside the walls too.", next = "church_outside" },
      },
    },
    church_outside = {
      lines = { { id = "co_default", text = "Especially for them. They need it more, and they get less of everything else. Tell the Archbishop I said so; he'll pretend to be surprised." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    refugee = {
      lines = { { id = "rf_default", text = "Then you know what it is to have a home taken and another one offered. I hope Stormwind has been a good one, and if it hasn't, tell me, because I'd rather hear it from you than from a riot." } },
      choices = { { text = "It has, Highlord.", next = "BACK", fx = { affinity = 2, standing = { stormwind = 1 } } } },
    },
    suspicion = {
      lines = { { id = "s_default", text = "Then show me. I'm not a stubborn man but a careful one, and the difference matters, in this chair." } },
      choices = { { text = "Understood.", next = "BACK" } },
    },
    soldier = {
      big = true,
      lines = {
        { id = "so_default", text = "Everywhere at once, which is the trouble. The army I have is spread from Lakeshire to Darkshire, Westfall has a militia of farmers, and I sign every posting knowing it leaves a hole somewhere else." },
        { id = "so_dwarf", when = { race = "Dwarf" },
          text = "A dwarf offering Stormwind a sword arm, unasked, and I'll not refuse it. The army I have is spread from Lakeshire to Darkshire, and every posting I sign leaves a hole somewhere else." },
      },
      choices = {
        { text = "Then send me where the hole is worst.", next = "soldier_where" },
        { text = "I'll go where the crown sends me, Highlord.", next = "BACK", reply = "Good. Report to the barracks, and I'll make sure the orders are worth following.", fx = { affinity = 2, align = { order = 2 } } },
        { text = "I'll go where people need me, orders or not.", next = "BACK", reply = "I'd rather you did both, but I'll not fault you for that. Just remember that orders are often how the people who need you get help at all.", fx = { align = { order = -2 } } },
        { text = "Something else, Highlord.", next = "BACK" },
      },
    },
    soldier_where = {
      lines = { { id = "sw_default", text = "Westfall, if you ask my conscience, and Redridge, if you ask General Jonathan. The council asks me to wait on both, and I've waited longer than I like; a soldier who goes without waiting may do more good than I can." } },
      choices = {
        { text = "Then I'll go without waiting.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Who on the council counsels waiting?", next = "prestor" },
      },
    },
    ironforge = {
      big = true,
      lines = { { id = "if_default", text = "It always has. When Stromgarde walked away from the Alliance and Gilneas shut its gate, King Magni kept his word, and every dwarf who walks this hall reminds me what that word cost Ironforge." } },
      choices = {
        { text = "And Theramore? Does Lady Proudmoore keep faith with Stormwind?", next = "op_jaina" },
        { text = "What did it cost us?", next = "ironforge_cost" },
        { text = "An alliance is only worth the oaths kept in it.", next = "BACK", reply = "Exactly so, and Ironforge has kept every one. I'll not forget it while I sit in this hall.", fx = { affinity = 1, align = { honor = 2 } } },
        { text = "Ironforge keeps faith, but it minds its own halls first.", next = "BACK", reply = "Their own halls first, and then ours, and that's more than most kingdoms managed. I'll take that bargain gladly.", fx = { align = { honor = -1 } } },
      },
    },
    ironforge_cost = {
      lines = { { id = "ic_default", text = "Dwarven blood at Grim Batol and on Lordaeron's fields, and dwarven masons' marks on the footings of this very Keep. I'd thank Magni in person if the regency let me leave the Keep for a week." } },
      choices = { { text = "I'll tell him so.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnomeregan = {
      lines = { { id = "gn_default", text = "I'd like to promise that, and I won't, because I'd be lying to you. Mekkatorque has asked, and the kingdom hasn't the soldiers to spare for a city full of radiation and troggs; it shames me to say it plainly, but you deserve it plainly." } },
      choices = {
        { text = "Then we'll take it back ourselves.", next = "gnomeregan_alone" },
        { text = "Plain words help nobody. We need soldiers.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    gnomeregan_alone = {
      lines = { { id = "ga_default", text = "If any people could, it's yours. When the day comes, tell Mekkatorque Stormwind will send what it can, and I'll make sure that's more than a letter." } },
      choices = {
        { text = "I'll hold the kingdom to that.", next = "BACK", reply = "Please do, and loudly, at every council you can. I'd rather be reminded than forgetful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We'll manage without Stormwind's letters.", next = "BACK", reply = "That I believe, and I admire it. But the offer stands, and it'll stand whether you take it or not.", fx = { align = { order = -1 } } },
      },
    },
    kaldorei = {
      big = true,
      lines = { { id = "ka_default", text = "You shouldn't, not yet, not on my word alone. Your people bled at Mount Hyjal beside ours, and since then we've sent letters to Darnassus and very little else; I'd rather you judged us by what we do in Ashenvale than by anything I say in this hall." } },
      choices = {
        { text = "Then do something in Ashenvale.", next = "kaldorei_ash" },
        { text = "Hyjal was enough. I'll trust you.", next = "BACK", reply = "Then I'll work to deserve it. Tell your people Stormwind remembers Hyjal, even if our letters have been few.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll trust Stormwind when it earns it.", next = "BACK", reply = "That's fair, and I'd say the same in your place. We'll try to earn it, one honest letter at a time.", fx = { align = { order = -1 } } },
      },
    },
    kaldorei_ash = {
      lines = { { id = "kas_default", text = "Ashenvale is half a world from Stormwind, and the orcs there are Thrall's, which makes every soldier I send a question for the council. Tell your Sentinels I know their names, if nothing else, and that I mean to do better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    highorder = {
      lines = { { id = "ho_default", text = "Then learn us as we are, the empty throne included. The Kirin Tor vouched for your High Order, and in this court that still carries weight, though I'll admit I know less about your people than I'd like." } },
      choices = {
        { text = "What would you like to know?", next = "highorder_ask" },
        { text = "Something else, Highlord.", next = "BACK" },
      },
    },
    highorder_ask = {
      lines = { { id = "hoa_default", text = "Only what you'd tell a friend: whether your people came to us out of need or out of choice. I ask because Stormwind has been both kinds of ally, and the second kind lasts longer." } },
      choices = {
        { text = "Need brought us. Choice will keep us.", next = "BACK", reply = "That's the best answer I've heard in a year of asking. Choice is what makes an ally a friend.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Need, plainly. We go where we must.", next = "BACK", reply = "Honest, and I thank you for it. Need is a sound foundation, if we build on it carefully.", fx = { align = { honor = -1 } } },
      },
    },
    dalaran = {
      lines = { { id = "da_default", text = "Dalaran is still half a ruin, and the Kirin Tor are rebuilding it and slow to open their gates. The Mage Quarter here does what it can, but I've stopped asking Dalaran for more than its prayers." } },
      choices = {
        { text = "They should open those doors.", next = "dalaran_doors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_doors = {
      lines = { { id = "dd_default", text = "Perhaps. They opened them once, to the Scourge, without meaning to, and I can't blame them for being careful now. Can you?" } },
      choices = {
        { text = "Caution is how a kingdom survives.", next = "BACK", reply = "It is, and I learned that the hard way at Lordaeron. Dalaran has earned its caution.", fx = { align = { order = 1 } } },
        { text = "Caution is how a kingdom dwindles.", next = "BACK", reply = "Sometimes, and I fear for theirs. But better a smaller Dalaran than another Scourge in its halls.", fx = { align = { order = -1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Do you? Then you're the first I've met who wasn't an orc, and I'll confess the word still makes the old soldiers in this hall reach for their swords. Tell me what the earth says, and I'll decide what I think of it." } },
      choices = {
        { text = "It says it's tired of war.", next = "shaman_tired" },
        { text = "It says nothing to men who reach for swords.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    shaman_tired = {
      lines = { { id = "st_default", text = "Then the earth and I agree on something. If Ironforge vouches for you, so will I; just keep the drums out of the Keep." } },
      choices = { { text = "Something else, Highlord.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    varian = {
      { id = "tp_varian", text = "Varian set out for Theramore to speak of peace, and his ship never made port. I hold this throne for his son, and I'll hold it until the day he walks back through that door, however long it takes." },
      { id = "tp_varian2", when = { disposition = { min = 65 } }, text = "Some nights I think he's dead and some nights I'm sure he isn't, and I can't decide which hurts more. The boy asks me every morning, and I've run out of new ways to say I don't know." },
    },
    prestor = { { id = "tp_prestor", text = "Lady Prestor has been a great help to me since the King vanished, and the House of Nobles listens to her as it never listens to me. I'm grateful for her counsel, though she's very sure of herself, and I suppose a regent needs someone who is." } },
    jaina = { { id = "tp_jaina", text = "Jaina Proudmoore is a friend of this throne, and she's done more for peace between the races than any of us. If anyone can keep the orcs and Theramore from each other's throats, it's her." } },
    thrall = { { id = "tp_thrall", text = "Thrall leads the orcs in Kalimdor now and speaks of peace with Theramore, and Jaina vouches for him. I've buried too many men to trust an orc on his word, but I'll trust Jaina on hers." } },
    scourge = { { id = "tp_scourge", text = "The Scourge holds Lordaeron, the kingdom I served before this one, and I've seen what they do to a city. If they ever turn their eyes south, Stormwind will need every sword and every prayer it has." } },
    silver_hand = {
      { id = "tp_silver_hand", text = "I was a knight of the Silver Hand before I was Regent of Stormwind, and I still wear its oath under this armour. The order's scattered now, but I'll not let its name be forgotten while I hold this seat." },
      { id = "tp_silver_hand2", when = { class = "PALADIN" }, text = "You carry the Light as we did in the Silver Hand, and the order lives as long as people like you do. Remember that Uther's oath was to serve the people, not the crown, and I'll ask nothing more of you." },
    },
    holy_light = { { id = "tp_holy_light", text = "The Light has carried me through two wars and a regency I never wanted, and I trust it more than I trust any council. Pray for this kingdom, if you would, because I have run short of other options." } },
    magni = { { id = "tp_magni", text = "Magni Bronzebeard is the staunchest ally this kingdom has, and he's never once asked what we can pay. Ironforge stood with us in the Second War, and it stands with us now, when Gilneas has walled itself off and Stromgarde has gone its own way." } },
    onyxia = { { id = "tp_onyxia", text = "Theramore's soldiers write of a black dragon in Dustwallow Marsh, and Jaina has asked for help. I've sent letters, and I'll send soldiers when I can spare them, which is a phrase I'm sick of writing." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade has fallen to its own prisoners, and the city guard holds the doors and nothing else. I've had requests to storm it, and I've had requests to leave it be, and I'm told by people I trust that the second is wiser." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The statues in the Valley of Heroes are of the heroes of the Second War, and I pass them every morning on my way to council. I remind myself what they gave, and I try to be worthy of standing in their shadow." } },
    knows = {
      { id = "tp_knows", text = "Every report in the kingdom crosses this desk sooner or later, so I know a little of most things. Ask, and I'll tell you what a regent may." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll spare the council a few more minutes. Ask me about any of this, and I'll answer as plainly as I'm able." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "My officers can answer most questions better than I can. If it must be me, keep to these." },
    },
    defias = { { id = "tp_defias", text = "The Defias are thieves with a grievance and better organization than I'd like, and Westfall bleeds for it." } },
    westfall = { { id = "tp_westfall", text = "Gryan Stoutmantle holds Westfall with farmers and pitchforks, and he does it without a single soldier from this city. I'm not proud of that." } },
    tome_of_divinity = { { id = "tp_tome", text = "The Tome is Duthorian Rall's test for young paladins. Pass it, and you'll have earned the right to call yourself one of us." } },
    _none = { { id = "tp_none", text = "Bring that to one of my officers. I have a kingdom on this desk." } },
  },
}
