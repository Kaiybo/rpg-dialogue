-- Lady Katrana Prestor, royal advisor, Stormwind Keep. Voice: bibles/katrana.md
-- Canon secret: she is Onyxia. Nothing she says reveals it. Her contempt shows; her nature doesn't.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "katrana", id = TODO_NPC("Lady Katrana Prestor"), name = "Lady Katrana Prestor",
  rivals = { "baros" },
  bible = "bibles/katrana.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "proud" }, values = { "ambitious", "cunning" },
  notices = { "status", "ambition" },
  impression = {
    first = "I couldn't decide whether she had welcomed me or appraised me.",
    third = "{name} was received by Lady Katrana Prestor, the Regent's gracious adviser, whose opinions soon seem to become everyone else's.",
  },

  greetings = {
    { id = "g_op_prestor", when = { opinion = { topic = "prestor", stance = "distrust" } }, text = "Ah, the one who thinks the Regent listens to me too much. Do come closer, darling; I've been longing to know what else you think." },
    { id = "g_op_jaina", when = { gossip = { topic = "jaina", stance = "trust" } }, text = "I hear you've taken Lady Proudmoore's side, little hero. How sweet. Her father never trusted an orc in his life, and she let them kill him; such a devoted daughter." },
    { id = "g_cool", text = "Yes?" },
    { id = "g_low", when = { maxLevel = 20 }, text = "Someone let you in, I see. How very generous of them." },
    { id = "g_hero", when = { minLevel = 50 }, text = "Ah, one of our celebrated heroes. Do come closer; I so rarely get to see one up close." },
  },

  notice = {
    { id = "n_rags", cat = "status", when = { durability = { max = 0.3 } },
      text = "You've walked into the king's hall dressed like a field hand after a hailstorm. Bolvar is far too polite to mention it, but I am not." },
    { id = "n_ambition", cat = "ambition", when = { minLevel = 55 },
      text = "You've grown very strong, haven't you? How interesting. I do so enjoy watching the strong, because one learns where they'll go next." },
    { id = "n_warlock", cat = "ambition", when = { class = "WARLOCK" },
      text = "There's a smell of brimstone about you, little one, very faint. The priests would wrinkle their noses, but I've always found ambition rather fragrant." },
  },

  start = "hello",
  nodes = {
    op_bolvar = {
      lines = {
        { id = "op_bolvar_a", text = "The court thinks whatever it's told to think, darling, but I'm curious what you think. Is our dear Highlord a rock the kingdom stands on, or merely a very large stone in the road?" },
      },
      choices = {
        { text = "He's a good man holding a hard post. I'd follow him.", next = "op_bolvar_1", fx = { opinion = { bolvar = "trusted" }, align = { order = 1 }, affinity = -1 } },
        { text = "He's too soft. Westfall burns while he holds councils.", next = "op_bolvar_2", fx = { opinion = { bolvar = "soft", westfall = "abandoned" }, align = { order = -1 }, affinity = 2 } },
        { text = "He's tired, my lady. That's the only fault I can see.", next = "op_bolvar_3", fx = { opinion = { bolvar = "tired" }, trait = { kind = 1 } } },
        { text = "The Silver Hand made him. That's good enough for me.", next = "op_bolvar_4", when = { class = "PALADIN" }, fx = { opinion = { bolvar = "trusted", silver_hand = "respect" }, affinity = -2 } },
        { text = "He listens to you too much, my lady.", next = "op_bolvar_5", fx = { opinion = { bolvar = "led", prestor = "distrust" }, trait = { skeptical = 1 }, affinity = -3 } },
        { text = "I'd rather not gossip about the Regent, my lady.", next = "BACK" },
      },
    },
    op_bolvar_1 = {
      lines = { { id = "op_bolvar_r1", text = "How loyal. He collects loyal people the way some men collect hounds, and he feeds them about as well. Do enjoy it while it lasts." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    op_bolvar_2 = {
      lines = { { id = "op_bolvar_r2", text = "Now that is refreshing, and you'd be surprised how many lords agree with you once the doors are shut. Do keep saying it, little hero; somebody ought to." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    op_bolvar_3 = {
      lines = { { id = "op_bolvar_r3", text = "Tired, is he? Then he ought to rest, and leave the weight to those of us better built for it. I'll tell him you were worried; he'll be ever so touched." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    op_bolvar_4 = {
      lines = { { id = "op_bolvar_r4", text = "The Silver Hand, yes, that admirable little club that lost Lordaeron. I'm sure it made him exactly what he is." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    op_bolvar_5 = {
      lines = { { id = "op_bolvar_r5", text = "Does he? Then he listens to someone sensible, which is more than can be said for most of this city. Run along now, before you say something you can't take back." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    xpt_katrana = {
      big = true,
      lines = { { id = "xpt_katrana_default", text = "The court is grateful, of course, in the way one is grateful for rain: it's useful, and nobody wants to see it indoors. Some lords would rather the Crown paid soldiers, and some would rather it paid nothing at all, but they all agree that armed wanderers make them nervous." } },
      choices = {
        { text = "We serve the Crown, my lady, and gladly.", next = "BACK", reply = "Gladly, how sweet. Do keep that gladness about you, darling; the court finds it so very reassuring in its servants.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them be nervous. We answer to our own consciences.", next = "BACK", reply = "Consciences, how quaint. I'm sure yours will be an enormous comfort to you, little one, when the court stops being grateful.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The court trusts what serves the kingdom. Spirits and totems are such orcish things, don't you agree? One wonders where your loyalties lie." } },
      choices = {
        { text = "My loyalty is to the Alliance, my lady, and it stays there.", next = "BACK", reply = "How reassuring to hear it said so firmly. One does wonder, of course, why it needed saying at all.", fx = { align = { order = 1 } } },
        { text = "The court's trust isn't worth chasing. I'll go my own way.", next = "BACK", reply = "Then go, by all means, and do try not to trip on anything important on your way out of the kingdom.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The court thinks very little of anything it can't tax or marry, darling, and your people are neither. I find the kaldorei rather charming myself, the way one finds old ruins charming, so long as one isn't asked to live in them." } },
      choices = {
        { text = "My people are no ruin, my lady, and we'll stand by the Alliance.", next = "BACK", reply = "Stand by it, then, darling, and we'll see how long the Alliance remembers to stand by you. These things are never quite even.", fx = { align = { honor = 1 } } },
        { text = "Then my people needn't trouble themselves with this court at all.", next = "BACK", reply = "Exactly so, and I'm delighted we agree. The court will scarcely notice the absence, I promise you.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The court has a use for everyone, little one, which is the whole art of governing. A mage who keeps to the Sanctum and minds the Regent's business will find me very patient, though I've noticed that clever people rarely manage either." } },
      choices = {
        { text = "Magic should serve the crown, my lady.", next = "BACK", reply = "What a sensible little thing you are. Keep thinking that way, and the court will find you very useful indeed.", fx = { align = { order = 1 } } },
        { text = "My magic answers to me, not to the court.", next = "BACK", reply = "How charming, and how very dangerous for you. Do let me know how that goes, little one; I'll be watching with interest.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Enormously, little one, in the way one values a good hound: we feed them, we praise them, and we send them where we please. The clever ones understand the arrangement, and the rest simply die more nobly." } },
      choices = {
        { text = "I serve the kingdom, my lady, not the court.", next = "BACK", reply = "A distinction only the very young believe in, darling. The kingdom is the court, as you'll learn soon enough.", fx = { align = { honor = 1 } } },
        { text = "Then point me where the pay is best, my lady.", next = "BACK", reply = "Now that is a refreshingly honest answer. You'll go far, little one, though perhaps not anywhere you'd choose.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In my own way, little one, though I've never had much patience for the chase itself. One learns far more by waiting until the quarry walks to you, and in this court, they always do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "In my own way, little one, though I've never had much patience for the chase itself. What a devoted creature your {pet} is. It reminds me of a great many people in this hall, though it has better manners than most of them." },
      },
      choices = {
        { text = "A hunter should respect the quarry, my lady.", next = "BACK", reply = "Respect, how touching. The quarry rarely returns the courtesy, darling, as you'll find one day.", fx = { align = { honor = 1 } } },
        { text = "The chase is nothing. All that matters is the kill.", next = "BACK", reply = "Oh, you're rather sweet when you're ruthless. I could almost like you for it, little one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The court values the Church's congregation, which is rather a different thing, and the Archbishop has been reminded of the distinction more than once. Faith is a fine thing for a kingdom, darling, in moderation, like wine." } },
      choices = {
        { text = "Faith isn't wine, my lady. The kingdom needs more of it.", next = "BACK", reply = "More of it, how charming. Do tell the Archbishop; he'll be so pleased to hear someone agrees with him.", fx = { align = { light = 1 } } },
        { text = "Moderation is wise, my lady. Zeal does as much harm as good.", next = "BACK", reply = "Finally, someone in this hall with a little sense. Zeal is so very tiresome, and so very expensive to bury.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A noble order, darling, and noble orders are very expensive. The Silver Hand marched to Lordaeron and lost it all the same, and the kingdom still pays for its pride, so I do think it fair to ask what we're buying." } },
      choices = {
        { text = "Honour can't be priced, my lady. You'd do well to remember it.", next = "BACK", reply = "I remember everything, darling, it's something of a gift. And I've never once seen honour pay for its own bread.", fx = { align = { honor = 1 } } },
        { text = "A fair question, my lady. Every order should prove its worth.", next = "BACK", reply = "You learn quickly. How rare, and how refreshing in someone who carries a hammer.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "How curious. A {altrace} called {alt} was presented to me only recently, and you have quite the same face, unless all of your sort simply look alike to me; do forgive me, I'm sure yours is a family of great distinction." },
        { id = "h_alt_class", when = { alt = { sameClass = true }, metBefore = false },
          text = "Another {altclass}, how fashionable. One called {alt} came to court not long ago, full of opinions about the crown's business, and I do hope you haven't come to share the same ones." },
        { id = "h_alt_back", when = { alt = true, metBefore = true }, cooldown = "5d",
          text = "Your friend {alt} was at court again, I hear, asking the Highlord's clerks the most tiresome questions. One does notice when the same sort of people keep turning up, {name}." },
        { id = "h_pt_katrana", tags = { "news" }, when = { party = true },
          text = "How charming, a little band of heroes in the throne room. Do keep them close, {name}; the court can be so unkind to people it doesn't know, and one never quite knows who's listening." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "I'm told you've been listening to the City Architect's grievances. Baros is a capable man, but grievance is a poor habit in a servant of the crown, and it spreads." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Baros Alexston tells me you were short with him. I'm sure you had your reasons; the man does go on about his masons." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. How sweet, the Church sends its little lights to court as if the Regent might forget it exists." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, and a polished one. The Regent does so love to be surrounded by his own reflection." },
        { id = "h_default", key = true, text = "Lady Prestor. I advise the Regent on the use of the kingdom's resources. Someone must, and the Regent is so very busy being noble." },
        { id = "h_westfall", when = { topicKnown = "westfall" },
          text = "Westfall, yes: farmers with pitchforks, writing letters. The crown cannot empty its purse every time a peasant is frightened." ,
          fx = { hear = "prestor_patience" } },
        { id = "h_redridge", when = { visited = "Lakeshire" },
          text = "Lakeshire's magistrate sends letters too; they all send letters. One begins to suspect the countryside has nothing better to do." },
        { id = "h_anduin", text = "The young king is doing splendidly, because he listens, and that is the most important quality in a king at his age. Listening." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Ah. One of the elves from that great tree across the sea. How very exotic the Alliance has become." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You again, and I find I don't mind. You have the look of someone who understands how things are actually decided, which is rarer at this court than gold." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "Oh, it's you. I had hoped the guards were better at their work than this." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage of the Sanctum, or one who wishes to be. Dalaran's children do so love to remind the court how clever they are." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in the king's hall. How very loyal you look, all that steel and no idea at all who you're guarding." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in the Keep. Do keep your animal on a short leash; the Regent's hall has quite enough noise in it already." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid, at court. How quaint, the kaldorei send us their forest-priests, as if the Regent needed reminding that the world is older than his crown." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. How very unusual. I'm sure Ironforge's king finds such things charming, but here at court, we prefer things we understand." },
      },
      again = { { id = "h_again", text = "Something else? Do be quick." } },
      choices = {
        { text = "Westfall needs the crown's help.", next = "plead" },
        { text = "The Church would say mercy is never wasted.", next = "mercy", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "You must have come a long way to court, my lady.", next = "court" },
        { text = "The young king seems a bright boy.", next = "king" },
        { text = "The Defias seem a real danger, my lady.", next = "defias" },
        { text = "Lakeshire is begging for soldiers.", next = "letters", when = { visited = "Lakeshire" } },
        { text = "Your advice must carry weight, my lady.", next = "advise" },
        { text = "Power is power, my lady, wherever it comes from.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "A rogue hears plenty at court, my lady.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Gnomeregan needs Stormwind's help, my lady.", next = "gnome", when = { race = "Gnome" } },
        { text = "Ironforge's gold paid for much of this city, my lady.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Does the court have any use for mages, my lady?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the court value its warriors, my lady?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have you ever hunted, my lady?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the court value the Church's counsel, my lady?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do you think of the Silver Hand, my lady?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does the court think of the night elves, my lady?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does the court trust shamans, Lady Prestor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "What does the court make of companies like ours, my lady?", next = "xpt_katrana", when = { party = true } },
        { text = "Excuse me.", next = "END" },
      },
    },
    plead = {
      lines = {
        { id = "p_default", text = "Everyone needs the crown's help, and that's rather the problem with crowns. Be patient, and the Brotherhood will tire, or starve, or eat itself, as they usually do." ,
          fx = { hear = "prestor_patience" } },
      },
      choices = {
        { text = "People are dying while you wait.", next = "dying", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "I see your point.", next = "BACK", reply = "I thought you might, given time. Patience is a virtue the Church is always praising, after all.", fx = { align = { honor = -1 }, affinity = 1, opinion = { westfall = "patience" } } },
      },
    },
    dying = {
      lines = {
        { id = "d_default", text = "People are always dying, little one. It is the one thing they can be relied upon to do. Run along." },
      },
      choices = { { text = "...", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    mercy = {
      big = true,
      lines = { { id = "m_default", text = "The Church says a great many lovely things, little priest, but it does not balance the treasury, raise the levies, or count the graves, and I do all three. Go and pray; it suits you." } },
      choices = {
        { text = "Someone has to remind you of the people.", next = "BACK", reply = "And who reminds the people of the price of their reminders? Run along to your Cathedral, little priest, and pray for my soul.", fx = { affinity = -2, align = { light = 2, honor = 1 } } },
        { text = "You're right; prayer doesn't balance a treasury.", next = "BACK", reply = "There, you see? Even the Light's own servants come round in the end, given a little arithmetic.", fx = { align = { order = 1, light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    court = {
      lines = { { id = "c_default", text = "Alterac's misfortunes were Stormwind's gain, as they say. I came south, I made myself useful, and the Regent was wise enough to notice. That's all there is to it, really." } },
      choices = {
        { text = "Do you miss Alterac?", next = "court_alterac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_alterac = {
      lines = { { id = "ca_default", text = "Miss it? It was cold, and full of men who couldn't keep a kingdom. Stormwind is so much warmer, and so much better kept." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    king = {
      lines = { { id = "k_default", text = "A dear boy, who asks the most charming questions at council. We answer them, and then we decide things, and it's an arrangement that suits everyone." } },
      choices = {
        { text = "And the Regent? What does the court think of him?", next = "op_bolvar" }, { text = "Something else.", next = "BACK" } },
    },
    defias = {
      lines = { { id = "d2_default", text = "Thieves with a grievance and a red scarf. Hang the loud ones and the quiet ones go home. It's always worked before." } },
      choices = {
        { text = "They were the stonemasons who rebuilt this city.", next = "BACK", fx = { affinity = -1, opinion = { defias = "masons_wronged" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "Lakeshire is always begging for something. Soldiers this year, a bridge the last. If we answered every village, the city would be guarded by its cooks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advise = {
      lines = {
        { id = "a_default", text = "I advise strength and order, and not wasting either on causes that cannot repay them. The Regent finds that cold, but the Regent also sleeps very well." },
      },
      choices = {
        { text = "Wise counsel.", next = "BACK", reply = "Of course it is. Do repeat it to the Regent, darling; he does so love to hear my name praised.", fx = { affinity = 1, align = { order = 1, light = -1 } } },
        { text = "It sounds cold.", next = "BACK", reply = "Cold keeps things from spoiling, little one. You'd be surprised what I've kept fresh that way.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "You must find this court tiresome, my lady.", tag = "Persuade", next = "advise_true",
          check = { pass = { any = { { disposition = { min = 65 } }, { alignment = { axis = "honor", max = -30 } }, { minLevel = 55 } } } },
          fail = { next = "advise_shut", fx = { affinity = -1 } } },
      },
    },
    advise_true = {
      big = true,
      lines = {
        { id = "at_default", text = "Tiresome? My dear, it's a kennel. Every lord in the House has a bone he's afraid of losing, and once you know which bone, you need never raise your voice to him again." },
        { id = "at_bolvar", text = "The Regent is the best of them, and that's precisely his weakness. A good man will believe anything that lets him go on being good, and I have never once had to lie to Bolvar Fordragon; I only choose which truths to tell him first." },
      },
      choices = {
        { text = "That's a frightening way to see people.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "And which bone is mine, my lady?", next = "advise_mine" },
        { text = "I'll remember that.", next = "BACK" },
      },
    },
    advise_mine = {
      lines = {
        { id = "am_default", text = "Oh, I haven't decided yet, and that's the charming thing about you. Come back when you've grown a little more, and we'll see what you're afraid to lose." },
        { id = "am_hero", when = { minLevel = 55 }, text = "Yours is pride, I think, in being needed. Every hero has it. It's the easiest bone in the world to throw." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    advise_shut = {
      lines = {
        { id = "as_default", text = "What I find tiresome is being asked to confide in strangers who wander in off the street. Do run along and find someone simpler to flatter." },
        { id = "as_default2", text = "How sweet of you to wonder. The court is a great privilege, and I'm grateful for it every single day, as you'll no doubt repeat to anyone who asks." },
      },
      choices = {
        { text = "As you say, my lady.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    warlock = {
      big = true,
      lines = { { id = "wl_default", text = "How refreshing; nobody at this court says anything so honest. The priests at the Cathedral would faint, of course, but the strong never did take their manners from the timid, little one." } },
      choices = {
        { text = "The strong rule, and the rest pray.", next = "warlock_strong", fx = { align = { light = -2 } } },
        { text = "Power needs a leash, my lady, even mine.", next = "warlock_leash", fx = { align = { light = 1 } } },
        { text = "You seem to hold some power of your own.", next = "warlock_hers" },
      },
    },
    warlock_strong = {
      lines = { { id = "ws_default", text = "Now you sound like someone worth knowing. Do keep that to yourself in the Cathedral district, though; the Watch can be tiresome about the Slaughtered Lamb." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    warlock_leash = {
      lines = { { id = "wle_default", text = "How dull of you. Still, a leash is only a matter of who's holding the other end, and I suspect you'll find out soon enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlock_hers = {
      lines = { { id = "wh_default", text = "The Regent's ear, darling, and it comes far better trained than any imp. It doesn't scorch the carpets, either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Does one? Then you'll have heard that I reward discretion and remember indiscretion, so tell me, little one: who are you listening for?" } },
      choices = {
        { text = "For the crown, my lady.", next = "rogue_answer", fx = { align = { order = 1 } } },
        { text = "For whoever pays best.", next = "rogue_answer", fx = { align = { order = -1, honor = -1 } } },
        { text = "For myself. I'd rather not say more.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    rogue_answer = {
      lines = { { id = "ra_default", text = "Of course you are. Master Shaw's people say the same, and I find them very useful when they forget which of us they're watching." } },
      choices = { { text = "Something else, my lady.", next = "BACK", fx = { learn = { "si7" } } } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Does it? Your little city poisoned itself with its own machines, and now Stormwind is asked to pay for the cleaning. I'm sure High Tinker Mekkatorque is very clever, but cleverness isn't a budget." } },
      choices = {
        { text = "We bled for the Alliance in the Second War.", next = "gnome_war" },
        { text = "Then we'll owe Stormwind nothing when we retake it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    gnome_war = {
      lines = { { id = "gw_default", text = "And built very fine flying machines for it, most of which exploded. The crown remembers, little one; it simply can't afford to remember everything at once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "And Ironforge reminds us of it at every council, in that charming burr. King Magni's friendship is very valuable to the crown, which is precisely why it should never be taken for granted, by either side." } },
      choices = {
        { text = "Is that a warning, my lady?", next = "dwarf_warn" },
        { text = "Ironforge doesn't sell its friendship.", next = "BACK", reply = "Everything has a price, darling, even when it's paid in ale and toasts. The question is only who's keeping the ledger.", fx = { align = { honor = 1 } } },
        { text = "Everything has a price, even friendship.", next = "BACK", reply = "Ah, a pupil after my own heart. Remember that, little one, and you'll do very well in this city.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    dwarf_warn = {
      lines = { { id = "dwa_default", text = "Merely advice, freely given. I give it generously, and the wise ones take it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    varian = { { id = "tp_varian", text = "Poor Varian, lost at sea on a mission of peace, and the kingdom left to manage without him. We all miss him terribly, of course, and we do our best in his absence." } },
    bolvar = { { id = "tp_bolvar", text = "Dear Bolvar is a fine soldier, and he carries the burden of the regency as best he can. He relies on my counsel, and I'm happy to give it, because someone must." } },
    thrall = { { id = "tp_thrall", text = "The orc warchief talks of peace and builds his city on stolen land, and the Alliance is expected to applaud. I find it all rather quaint, little one, though I'd not say so before Lady Proudmoore." } },
    jaina = { { id = "tp_jaina", text = "Lady Proudmoore is a very talented young woman, I'm told, and very idealistic. She'll learn, as we all do, that peace with orcs is a luxury Stormwind can't afford." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's little troubles are best left to the guards, and I've advised the Regent accordingly. There's no need to spend good soldiers on bad prisoners." } },
    magni = { { id = "tp_magni", text = "King Magni is a loyal ally, and very fond of his beer and his digging. One does wonder what he's looking for down there, though it's surely none of our concern." } },
    internment = { { id = "tp_internment", text = "The internment camps cost this kingdom a fortune, and the orcs escaped in the end regardless. A lesson in the futility of half measures, I'd say, if anyone asked me, and they so often do." } },
    theramore = { { id = "tp_theramore", text = "Theramore is a long way from Stormwind, and Lady Proudmoore must manage her own affairs. We can't send soldiers to every swamp that asks for them, can we, little one?" } },
    holy_light = { { id = "tp_holy_light", text = "The Light is a great comfort to the common folk, and the Archbishop does admirable work with the poor. I attend the Cathedral when duty requires it, which is quite often enough." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The statues in the Valley of Heroes are very handsome, and very large, and the heroes themselves are mostly dead. That's the way of heroes, I find, sooner or later." } },
    knows = {
      { id = "tp_knows", text = "I make it my business to know a little about everything that touches the crown. I suppose I could spare you a word or two on some of it." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "Ask away, then. It's so rare to be asked anything by someone who might actually understand the answer." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll indulge you on a very few things, and briefly, because the Regent is waiting." },
    },
    defias = { { id = "tp_defias", text = "Disgruntled masons, and tiresome ones. They'll be a footnote, one way or another." } },
    westfall = { { id = "tp_westfall", text = "Westfall is dust and complaints these days, though I'm told it used to grow wheat." } },
    _none = { { id = "tp_none", text = "How quaint that you'd think I'd discuss that with you." } },
  },
}
