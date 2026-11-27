-- More of Stormwind's quest givers: the Mithril Order's armorsmith, the census factor in City Hall,
-- SI:7's cellar doctor, the cloth quartermaster, the High Sorcerer of the Wizard's Sanctum and two
-- librarians. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Hank the Hammer: Galvan's old pupil, keeping a promise to train armorsmiths.
P:NPC {
  key = "hank_hammer", id = TODO_NPC("Hank the Hammer"), name = "Hank the Hammer", title = "The Mithril Order", gender = "male",
  bible = "bibles/more_folk.md", role = "blacksmith", tier = "quest",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "craft", "loyal" },
  notices = { "craft", "soldier" },
  impression = {
    first = "He looks at a smith's work before he looks at the smith.",
    third = "{name} met Hank the Hammer of the Mithril Order, who tests Stormwind's smiths for the armorsmith's road.",
  },
  greetings = {
    { id = "g_default", text = "Mind the sparks, friend. If you've come to look at the steel, look, and if you've come to talk about making it, pull up a stool." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see your hands; a smith's hands tell me more than a smith's mouth ever does." },
    { id = "g_bracers", when = { questActive = TODO_QUEST("The Origins of Smithing") }, text = "Six golden scale bracers, I said, and I'll be checking every rivet. Galvan checked mine twice." },
    { id = "g_galvan", when = { questActive = TODO_QUEST("In Search of Galvan") }, text = "You've still got that insignia? Good. McGavan won't believe a word you say without it." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've a smith's forearms and a smith's burns. How far along are you, then? Don't round up; I'll know." },
    { id = "n_dwarf", cat = "soldier", when = { race = "Dwarf" },
      text = "A dwarf! The man who taught me everything I know was one of yours, and he'd have had something rude to say about my anvil." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hank, they call me, Hank the Hammer, on account of I never put it down. I keep a lookout for smiths who want to go further than nails and horseshoes, and I'm sworn to help them." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Origins of Smithing") }, text = "Those bracers of yours were honest work, and I've not said that to many. Galvan would have grunted at them, which from him was high praise." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome at my forge! Your folk tinker more than they hammer, but I've seen gnomish rivets that would shame a Dun Morogh smith." },
      },
      again = {
        { id = "h_again", text = "What else? The fire's hot and I don't like wasting it." },
        { id = "h_again2", text = "Go on, I can listen and hammer both." },
      },
      choices = {
        { text = "Who was Galvan?", next = "galvan" },
        { text = "What's the Mithril Order?", next = "order" },
        { text = "I'm a smith. Test me.", next = "test", when = { profession = "Blacksmithing" } },
        { text = "That anvil's seen a lot of years.", next = "anvil" },
        { text = "I wear plate. What should I look for?", next = "plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    galvan = {
      lines = { { id = "ga_default", text = "Galvan the Ancient, a dwarf older than my grandfather's grandfather, and the finest armorsmith I ever saw. He took me under his wing when I was about your age, and before he left for Booty Bay he made me promise to train any smith with the will for it.", fx = { learn = { "booty_bay" } } } },
      choices = {
        { text = "Why Booty Bay, of all places?", next = "galvan_bay" },
        { text = "That's a heavy promise to carry.", next = "promise" },
        { text = "Something else, Hank.", next = "BACK" },
      },
    },
    galvan_bay = {
      lines = { { id = "gb_default", text = "He never told me, and you didn't ask Galvan things twice. Some of the Order still wait in Booty Bay, McGavan among them, hoping he'll come back or that someone worthy will turn up asking after him." } },
      choices = {
        { text = "Then I'll go asking after him.", next = "BACK", reply = "Not yet you won't. Bring me the bracers first, and then we'll talk about the jungle." },
        { text = "Something else.", next = "BACK" },
      },
    },
    promise = {
      big = true,
      lines = { { id = "pr_default", text = "It is, and I've kept it twenty years, though most who come to me want the secrets without the sweat. I tell them the same thing Galvan told me: the steel doesn't care who your father was." } },
      choices = {
        { text = "A promise kept that long deserves respect.", next = "BACK", reply = "Respect's fine, but I'd sooner have six good bracers. Still, I thank you for saying it.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Twenty years is long enough. He's not coming back.", next = "BACK", reply = "Maybe not, but a promise doesn't end because the man who heard it left. That's rather the point of one.", fx = { align = { honor = -1 } } },
        { text = "Something else, Hank.", next = "BACK" },
      },
    },
    order = {
      lines = { { id = "o_default", text = "The Mithril Order is armorsmiths, plain and simple, and we hold that good armour keeps more soldiers alive than any sword ever killed. The weaponsmiths have their own lot, and we get on well enough so long as nobody mentions which side matters more." } },
      choices = {
        { text = "Armour matters more. A dead man swings no sword.", next = "order_side", fx = { align = { order = 1 } } },
        { text = "A good blade ends a fight before armour's needed.", next = "order_side", fx = { align = { order = -1 } } },
        { text = "How does a smith join?", next = "test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    order_side = {
      lines = {
        { id = "os_default", text = "Ha! Say that within earshot of a weaponsmith and you'll get a lecture you'll not forget. I've said my piece on it over many an ale, and I'll stand by it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    test = {
      lines = {
        { id = "t_default", text = "Make me six golden scale bracers, and make them well, and I'll tell you where smithing comes from. If they pass, I'll send you to Booty Bay with my insignia, and McGavan will judge whether you're worthy of the Order." },
        { id = "t_low", when = { profession = "Blacksmithing" }, text = "You'll want a good hand at the anvil before the golden scale comes easy, so don't be shy about practising on cheaper bars first. When you're ready, six bracers, and I'll judge them myself." },
      },
      choices = {
        { text = "Six bracers. You'll have them.", next = "BACK", reply = "Good. Every rivet, mind, and I'll be counting.", fx = { affinity = 1 } },
        { text = "Why bracers, and not a breastplate?", next = "test_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_why = {
      lines = { { id = "tw_default", text = "Because a breastplate hides a lazy hand under all that metal, and a bracer doesn't. Six of them, all alike, shows me you can do it right on a bad day as well as a good one." } },
      choices = { { text = "That makes sense. Something else.", next = "BACK" } },
    },
    anvil = {
      lines = { { id = "a_default", text = "Galvan's anvil, or near enough; it was his before he went south, and I'll not let anyone else use it. The dwarves in the district tell me it's too old to ring true, but it rings true for me." } },
      choices = {
        { text = "Old tools keep the memory of the hands.", next = "BACK", reply = "That's a dwarf's saying, near enough, and it's right. You've a smith's heart, whatever your trade." },
        { text = "Who are the other smiths in the district?", next = "district" },
        { text = "Something else.", next = "BACK" },
      },
    },
    district = {
      lines = { { id = "d_default", text = "Mostly dwarves who came south after the wars and never left, and good neighbours, if loud. Thulman sells guns at the end of the row and will try to sell you one whether you shoot or not." } },
      choices = { { text = "I'll keep my coin hidden, then. Something else.", next = "BACK" } },
    },
    plate = {
      lines = { { id = "pl_default", text = "Look at the joints first, never the shine, because that's where a blade finds you. A plate that moves with you is worth two that look grand on a stand in the Trade District." } },
      choices = {
        { text = "I'll check my joints tonight.", next = "BACK", reply = "Do, and oil them, and you'll live longer than half the knights in this city." },
        { text = "Something else, Hank.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a blacksmith's boy in this city until a dwarf saw something in me. Everything since has been hammering." } },
    trade = { { id = "tp_trade", text = "Armour, mostly, and judging other people's. Ask me about steel and I'll talk till the fire dies." } },
    booty_bay = { { id = "tp_bb", text = "Galvan went there and never came back, and some of the Order still wait for him there. I've never been, and I'm told the heat would ruin my temper." } },
    dark_iron = { { id = "tp_di", text = "Their smiths are the best in the world, curse them, and the worst men to own a forge. Galvan never would say their name." } },
    _none = { { id = "tp_none", text = "That's nothing I can hammer, friend. Ask me about the forge instead." } },
  },
}

-- Royal Factor Bathrilor: the city's census, kept in City Hall.
P:NPC {
  key = "bathrilor", id = TODO_NPC("Royal Factor Bathrilor"), name = "Royal Factor Bathrilor", title = "Stormwind Census", gender = "male",
  bible = "bibles/more_folk.md", role = "noble", tier = "quest",
  communities = { "stormwind" }, temper = { "fussy" }, values = { "order", "dutiful" },
  notices = { "kin", "status" },
  impression = {
    first = "He speaks of his census records as if they were his children.",
    third = "{name} met Royal Factor Bathrilor, who keeps Stormwind's census in City Hall.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the office of the Stormwind census. If you need information on our populace, I can assist you, within reason and the law." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. I've a note of your last visit, naturally; I keep notes of everything." },
    { id = "g_parcel", when = { questActive = TODO_QUEST("Better Late Than Never") }, text = "A parcel for an Emma Felstone, dated four years ago? Let me see it, and let me see what the records say." },
    { id = "g_emma", when = { questActive = TODO_QUEST("Good Natured Emma") }, text = "Have you found Ol' Emma yet? Ask her name kindly, mind, because she has very little patience for the city." },
  },
  notice = {
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A citizen, or at least a subject of the crown. You'll be in my records somewhere, I expect, unless you were born outside the walls." },
    { id = "n_other", cat = "kin", when = { race = { "Dwarf", "Gnome", "NightElf" } },
      text = "Not a native of Stormwind, I see. The census has a ledger for visitors too, though it grows faster than I can keep it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am responsible for every census taken within this city, and have been for five years at least. The records are kept by arcane means and sharpened mental discipline, so do not expect me to hand you a ledger." },
        { id = "h_done", when = { questDone = TODO_QUEST("Good Natured Emma") }, text = "I heard Ol' Emma took her parcel, and I've noted it in her file. It is very rare that a record of mine closes so neatly." },
      },
      again = {
        { id = "h_again", text = "Is there something further? I have three districts' worth of births to file." },
        { id = "h_again2", text = "Yes? Please be brief, and precise if you can." },
      },
      choices = {
        { text = "I have a parcel for an Emma Felstone.", next = "felstone", when = { questActive = TODO_QUEST("Better Late Than Never") } },
        { text = "How does a census work in a city this size?", next = "census" },
        { text = "What do you mean, arcane means?", next = "arcane" },
        { text = "Am I in your records?", next = "me" },
        { text = "You must know everyone's secrets.", next = "secrets" },
        { text = "Good day, Factor.", next = "END" },
      },
    },
    felstone = {
      lines = { { id = "f_default", text = "Felstone, Felstone; the family held Felstone Field in Lordaeron, and one Emma came south with the refugees. The records say she fits a woman the whole city knows as Ol' Emma, who wanders the canals talking to herself.", fx = { learn = { "lordaeron" } } } },
      choices = {
        { text = "Ol' Emma? The woman with the buckets?", next = "felstone_emma" },
        { text = "Four years late is still on time, if she's alive.", next = "BACK", reply = "A charming sentiment, and an inaccurate one, but I'll allow it. Go and find her." },
        { text = "Something else.", next = "BACK" },
      },
    },
    felstone_emma = {
      lines = { { id = "fe_default", text = "The same, and a tad ornery, and quite possibly out of her gourd, though she harms no one and folks leave her be. Ask her plainly whether her name is Felstone; if it is, I expect she'll want the parcel." } },
      choices = { { text = "I'll ask her kindly. Something else.", next = "BACK" } },
    },
    census = {
      lines = { { id = "c_default", text = "Slowly, and with a great many clerks who would sooner be anywhere else. Every birth, every death, every family that comes through the gate from Lordaeron, and lately those last outnumber the first two together." } },
      choices = {
        { text = "The refugees should be counted and housed.", next = "refugees", fx = { align = { light = 1 } } },
        { text = "The city can't take everyone who knocks.", next = "refugees", fx = { align = { light = -1 } } },
        { text = "Something else, Factor.", next = "BACK" },
      },
    },
    refugees = {
      lines = { { id = "r_default", text = "My task is to count them, not to judge them, and I count them very carefully. What the House of Nobles does with my numbers is another matter, and I'd be grateful if you didn't ask me about it in the hall." } },
      choices = {
        { text = "Who reads your numbers, then?", next = "nobles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nobles = {
      lines = { { id = "n_default", text = "Treasurers, mostly, and anyone who wishes to tax a district or excuse it. I give them the same numbers I would give a beggar, and they never once thank me for their accuracy." } },
      choices = { { text = "Accuracy's thanks enough. Something else.", next = "BACK" } },
    },
    arcane = {
      lines = {
        { id = "ar_default", text = "Precisely what I said, and nothing more, because the methods are the crown's business. Suffice it that a record kept only on paper can burn, and Stormwind has burned before." },
        { id = "ar_mage", when = { class = "MAGE" }, text = "You of all people should know better than to ask a man how his wards are built, {class}. The Wizard's Sanctum helped with them, and that's all I'll say." },
      },
      choices = {
        { text = "So you keep it all in your head?", next = "head" },
        { text = "Something else.", next = "BACK" },
      },
    },
    head = {
      lines = { { id = "hd_default", text = "Some of it, and the rest is kept where it can't be stolen. A good factor forgets nothing and repeats less." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    me = {
      lines = {
        { id = "me_default", text = "I couldn't possibly say without a proper request, in writing, with a seal. Suffice it that adventurers are very hard to file, because they never stay anywhere long enough to be counted." },
        { id = "me_human", when = { race = "Human" }, text = "Perhaps, if you were born in the kingdom; I'd need your parish and your father's name. Adventurers, however, are very hard to file, because they never stay anywhere long enough to be counted." },
      },
      choices = { { text = "Then I'll try to stay still. Something else.", next = "BACK" } },
    },
    secrets = {
      big = true,
      lines = { { id = "s_default", text = "I know where people live and when they were born, which is not the same as their secrets, though some think it is. A man who sold what I know would be rich within a week and hanged within a month." } },
      choices = {
        { text = "Then keep your silence. The city depends on it.", next = "BACK", reply = "It does, and I do. Thank you for understanding it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A clever man could sell a little and never hang.", next = "BACK", reply = "Then he'd be a clever man with a short career. Good day to you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A clerk who was very good at counting, and was punished for it by promotion." } },
    knows = { { id = "tp_knows", text = "Who lives in Stormwind, roughly, and when they arrived. Not why; I leave why to the priests." } },
    lordaeron = { { id = "tp_lord", text = "Half the new entries in my ledgers came from Lordaeron, and they write their old villages down as if the villages still stood." } },
    _none = { { id = "tp_none", text = "That falls outside the census, I'm afraid, and therefore outside my concern." } },
  },
}

-- Doc Mixilpixil: a gnome physician in SI:7's cellar, eccentric, who cures the Touch of Zanzil.
P:NPC {
  key = "mixilpixil", id = TODO_NPC("Doc Mixilpixil"), name = "Doc Mixilpixil", gender = "male",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "manic" }, values = { "curious", "craft" },
  notices = { "gnome", "stealth" },
  impression = {
    first = "His cures work, so nobody asks why he talks to a squirrel.",
    third = "{name} met Doc Mixilpixil, a gnome physician in the cellar beneath SI:7.",
  },
  greetings = {
    { id = "g_default", text = "Not now, not now, the mixture's at a critical temperature! Oh, it's a person. Come in, then, and don't touch the green one." },
    { id = "g_back", when = { metBefore = true }, text = "You again! The squirrel said you'd be back, and the squirrel is right roughly sixty-two percent of the time." },
    { id = "g_zanzil", when = { questActive = TODO_QUEST("The Touch of Zanzil") }, text = "Osborne sent you down, did he? Then it's Zanzil's touch you're carrying, and we've work to do before it spreads." },
  },
  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "A fellow gnome! You've no idea how hard it is to find anyone down here who understands a decent ratio. Tell me you've studied alchemy." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "One of Shaw's lot, by the way you came in without the stair creaking. I'm the man they send you to when something nasty gets under your skin." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Doc Mixilpixil, physician, alchemist and occasional ratcatcher, at your service. SI:7 brings me the things that don't show up in any healer's book, and I make them go away." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Touch of Zanzil") }, text = "And how's the patient? No lingering green tinge, no voices in the night that aren't your own? Splendid, that's a ninety percent success, which is excellent for voodoo." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a flask about to do something interesting." },
        { id = "h_again2", text = "Quickly, quickly, I'm counting bubbles." },
      },
      choices = {
        { text = "What is the Touch of Zanzil?", next = "zanzil" },
        { text = "You were talking to that squirrel.", next = "squirrel" },
        { text = "Why does SI:7 keep a doctor in the cellar?", next = "cellar" },
        { text = "Fellow gnome. Do you miss Gnomeregan?", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "What's in the green flask?", next = "green" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    zanzil = {
      lines = { { id = "z_default", text = "Zanzil was a troll witch doctor, cast out of his own tribe in Stranglethorn, who makes zombies and worse. His touch is a curse that creeps into the blood, and our agents keep bringing it home with them, which is inconsiderate of them." } },
      choices = {
        { text = "Can it be cured?", next = "zanzil_cure" },
        { text = "Then stop sending agents to Stranglethorn.", next = "zanzil_send" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zanzil_cure = {
      lines = {
        { id = "zc_default", text = "Everything can be cured, given enough reagents and a little nerve! It takes several steps, and some fairly unpleasant ingredients, and I'll want you to fetch most of them yourself." },
        { id = "zc_rogue", when = { class = "ROGUE" }, text = "Everything can be cured, given enough reagents and a little nerve, and you'll be glad of it the next time Shaw sends you south. Fetch me the ingredients and I'll do the rest." },
      },
      choices = { { text = "I'll fetch what you need. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    zanzil_send = {
      big = true,
      lines = { { id = "zs_default", text = "Tell that to Master Shaw, and do let me watch his face when you do. The work has to be done, so the cure has to be made, and that's my whole philosophy in one sentence." } },
      choices = {
        { text = "Then the work comes first. Your cure makes it possible.", next = "BACK", reply = "Exactly so! Somebody upstairs should hear you say it.", fx = { align = { order = 1 } } },
        { text = "No secret is worth a man rotting from the inside.", next = "BACK", reply = "You'd be surprised what upstairs thinks a secret is worth. I just mix the cure.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    squirrel = {
      lines = { { id = "sq_default", text = "Of course I was, because he's an excellent listener and he never repeats anything, which in this building is a rare virtue. The statue in the corner is a poor conversationalist, but I talk to her as well, out of politeness." } },
      choices = {
        { text = "Does the squirrel ever answer?", next = "squirrel_answer" },
        { text = "You've been down here too long, Doc.", next = "squirrel_long" },
        { text = "Something else.", next = "BACK" },
      },
    },
    squirrel_answer = {
      lines = { { id = "sa_default", text = "Only in the form of disapproval, which he expresses by eating my cheese. Ol' Emma left me a spool of thread for him once, and he built a nest from it, so I'd say he answers in his own way." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    squirrel_long = {
      lines = { { id = "sl_default", text = "Probably, but I've found that the sun gives very bad advice about alchemy. Down here it's quiet, and nobody minds the smell." } },
      choices = { { text = "I'll leave you to it, then. Something else.", next = "BACK" } },
    },
    cellar = {
      lines = { { id = "c_default", text = "Because the things that happen to Shaw's people can't be explained to a priest in the Cathedral, and shouldn't be written in a healer's ledger. I ask no questions about where they've been, and they ask none about my methods." } },
      choices = {
        { text = "What are your methods?", next = "green" },
        { text = "Something else, Doc.", next = "BACK" },
      },
    },
    green = {
      lines = { { id = "gr_default", text = "That's the second stage of a draught I call Eau de Mixilpixil, and you'll be drinking some if you've the Touch on you. It smells like a swamp and tastes like a boot, but it's effective, mostly." } },
      choices = { { text = "Mostly? Something else, then.", next = "BACK" } },
    },
    gnomeregan = {
      lines = { { id = "gn_default", text = "Every day, and the laboratories most of all, which had proper ventilation and no spiders. But a physician goes where the patients are, and these days they're in Stormwind, so here I am, under a barracks.", fx = { learn = { "gnomeregan" } } } },
      choices = { { text = "We'll take it back one day.", next = "BACK", reply = "Of course we will! I've already drawn up the plans for my new laboratory, with a window for the squirrel." } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Trained in Gnomeregan, employed in Stormwind, and fond of a good cheese. That's the whole biography." } },
    gnomeregan = { { id = "tp_gn", text = "The radiation's what keeps us out, and I've had patients sick from it. I would very much like to study it, from a long way away." } },
    _none = { { id = "tp_none", text = "Fascinating, I'm sure, but it isn't bubbling, so I've no opinion on it." } },
  },
}

-- Clavicus Knavingham: Cloth Quartermaster in Duncan's Textiles.
P:NPC {
  key = "clavicus", id = TODO_NPC("Clavicus Knavingham"), name = "Clavicus Knavingham", title = "Cloth Quartermaster", gender = "male",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "earnest" }, values = { "dutiful", "practical" },
  notices = { "craft", "light" },
  impression = {
    first = "The textile stockpile is low, and he takes it personally.",
    third = "{name} met Clavicus Knavingham, the cloth quartermaster who gathers donations for Stormwind's stores.",
  },
  greetings = {
    { id = "g_default", text = "Friend, Stormwind needs your assistance and your generosity! Our stockpile of textiles has run critically low, and every bolt helps." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, friend! Have you brought cloth, or just good wishes? I'll take both, but the cloth spends better." },
    { id = "g_wool", when = { questActive = TODO_QUEST("A Donation of Wool") }, text = "Wool, wool, wool. The barracks wear through it faster than the sheep can grow it, so bring it in whenever you have it." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Then you know what a good bolt is worth, and what the city is asking when it asks for one." },
    { id = "n_healer", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "You'll know what happens when the bandages run out, I expect. That's half of what I'm collecting for." },
  },
  start = "hello",
  nodes = {
    d6_sort = {
      lines = { { id = "d6_sort_a", text = "Volunteers from the Cathedral, mostly, and a pair of old seamstresses from the canals who'll work for tea. They sort by weave and weight, and they burn anything with lice in it, which is more of it than you'd like to know." } },
      choices = {
        { text = "Burn it? Isn't that a waste?", next = "d6_sort2" },
        { text = "Two old seamstresses doing the crown's work.", next = "d6_sort2" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    d6_sort2 = {
      lines = { { id = "d6_sort2_a", text = "It's a waste, and so is a ward full of fever, and I know which one the Cathedral would rather have. The moths take another tenth every summer, so I hang cedar from the rafters and count the bolts every morning before anyone else is up." } },
      choices = {
        { text = "You care about this more than most clerks would.", next = "BACK", fx = { affinity = 1 } },
        { text = "Cedar and counting. Anything else?", next = "BACK" },
      },
    },
    d6_refugee = {
      lines = { { id = "d6_refugee_a", text = "Crowded, friend, and cold in winter. Families from Westfall who lost their farms share rooms with families from Lordaeron who lost their whole kingdom, and they've each a reason to think the other has it easier." } },
      choices = {
        { text = "The Cathedral's infirmary needs more than bandages, then.", next = "d6_refugee2", when = { class = "PALADIN" } },
        { text = "Does the crown do anything for them?", next = "d6_refugee2" },
        { text = "A hard place to be poor. Something else.", next = "BACK" },
      },
    },
    d6_refugee2 = {
      lines = {
        { id = "d6_refugee2_a", text = "The crown sends me, and the blankets, and a soup kitchen the priests run on the Cathedral steps. It isn't enough, and I don't say it is, but a blanket in winter is the difference between a cough and a funeral." },
        { id = "d6_refugee2_pal", when = { class = "PALADIN" }, text = "It does, and the Silver Hand's brothers help where they can, carrying soup and sitting with the sick. If you've a day to spare, the priests on the Cathedral steps would be glad of a pair of hands that can lift a pot and say a blessing." },
      },
      choices = {
        { text = "I'll bring what cloth I can.", next = "BACK" },
        { text = "Let's leave it there for now.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", text = "Stormwind is rebuilding its stocks of cloth for textiles and bandages, and I'm the man the crown set to gathering it. Your donation would help the city immensely, and earn you the respect of its people as well." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Donation of Runecloth") }, text = "Runecloth, from you, and a good deal of it. I've told the quartermasters at the barracks your name, so you'll find a few friendlier faces about the city." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? The ledger's always open." },
        { id = "h_again2", text = "Go on, then. I've counted everything twice already today." },
      },
      choices = {
        { text = "Why is the city short of cloth?", next = "short" },
        { text = "What sort of cloth do you need?", next = "kinds" },
        { text = "Where does it all go?", next = "where" },
        { text = "Charity's for those who can't fend for themselves.", next = "charity" },
        { text = "I'm a tailor. Cloth is my living, Clavicus.", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Who sorts all these donations?", next = "d6_sort" },
        { text = "What are the refugee houses like?", next = "d6_refugee" },
        { text = "Not today.", next = "END" },
      },
    },
    short = {
      lines = { { id = "s_default", text = "Wars, mostly, and a city full of refugees who came with only the clothes on their backs. The Westfall farms used to send wool by the cartload, but nothing much comes up that road now except bad news.", fx = { learn = { "westfall" } } } },
      choices = {
        { text = "The Defias, then.", next = "short_defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    short_defias = {
      lines = { { id = "sd_default", text = "The Defias, the drought, and the farmers who left. I don't pretend to understand who's to blame, but I know the sheep didn't leave on their own." } },
      choices = { { text = "Something else, Clavicus.", next = "BACK" } },
    },
    kinds = {
      lines = {
        { id = "k_default", text = "Anything that weaves! Wool first, then silk, then mageweave and runecloth, if you've travelled far enough to find them. The finer stuff goes to the quartermasters for the officers' kit, and the wool goes to everyone else." },
        { id = "k_tailor", when = { profession = "Tailoring" }, text = "Whatever you can spare after your own needles have had their fill, friend; I know a tailor's hoard when I see one. Wool, silk, mageweave, runecloth, it all finds a use." },
      },
      choices = {
        { text = "Why should the officers get the fine cloth?", next = "officers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = { { id = "ta_default", text = "Then you know better than anyone what a bolt costs, and I'd never ask a tailor for the cloth off the loom. Give what you'd otherwise sell for scraps; the bandage-makers at the Cathedral don't mind an uneven edge." } },
      choices = {
        { text = "Scraps I can spare. You'll have them.", next = "BACK", reply = "Bless you, friend. Scraps make bandages, and bandages make soldiers walk again.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    officers = {
      lines = { { id = "o_default", text = "Because the officers are the ones the crown pays for, and the crown decides. I've written to say the footmen are colder, but my letters go to the same men who wear the silk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    where = {
      lines = { { id = "w_default", text = "Bandages for the Cathedral's infirmary and the barracks, blankets for the refugee houses, and the rest to the tailors who make the guards' tabards. Not one thread of it goes to waste, I promise you that." } },
      choices = { { text = "Good. Something else.", next = "BACK" } },
    },
    charity = {
      big = true,
      lines = { { id = "c_default", text = "It isn't charity, friend, it's the city looking after itself, because a guard with a bandage is a guard on the wall tomorrow. But I'll not argue a man into generosity; either he feels it or he doesn't." } },
      choices = {
        { text = "You're right. I'll give what I can.", next = "BACK", reply = "Thank you, friend. Stormwind remembers who carried cloth in its lean years.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I'll give when it pays. Not before.", next = "BACK", reply = "It does pay, in respect, if not in coin. Come back when you've decided it's worth it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A clerk in the quartermaster's office who once said the stores were too low. They gave me the job of filling them." } },
    trade = { { id = "tp_trade", text = "Cloth, in, and gratitude, out. It's the simplest ledger in Stormwind." } },
    _none = { { id = "tp_none", text = "I'm afraid I only know cloth, friend, and that isn't cloth." } },
  },
}

-- High Sorcerer Andromath: one of the finest sorcerers outside Dalaran, in the Wizard's Sanctum.
P:NPC {
  key = "andromath", id = TODO_NPC("High Sorcerer Andromath"), name = "High Sorcerer Andromath", gender = "male",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "grave" }, values = { "order", "learning" },
  notices = { "arcane", "warlock" },
  impression = {
    first = "He speaks quietly, as if anything louder might upset the wards.",
    third = "{name} met High Sorcerer Andromath of the Wizard's Sanctum in Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "You have climbed a long stair, and I hope it was for a reason. Speak, and keep your voice low; the wards in this room are older than you are." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the Sanctum, and I trust the world has not undone you yet." },
    { id = "g_treatise", when = { questActive = TODO_QUEST("Ur's Treatise on Shadow Magic") }, text = "Morganth's tower stands in Redridge still, and so does the book he stole. Do not open it, whatever it whispers to you." },
    { id = "g_power", when = { questActive = TODO_QUEST("Power Overwhelming") }, text = "Dalaran's wild energies will not disperse themselves. The Kirin Tor will not ask for help twice, so do not make them." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage of the city's own training, if I'm any judge of a stance. Good; there is work here that only one of us should do." },
    { id = "n_lock", cat = "warlock", when = { class = "WARLOCK" },
      text = "I can smell the fel on you from here, warlock. Mind it does not follow you down the stairs." },
  },
  start = "hello",
  nodes = {
    an_expect = {
      big = true,
      lines = { { id = "ane_default", text = "That you'll come when the city calls, and that you'll tell us when you find something that ought to be locked away. We keep no oaths in this Sanctum, because Dalaran's oaths did not stop Kel'Thuzad, but we keep a list of names, and yours is on it now." } },
      choices = {
        { text = "I'll answer when Stormwind calls.", next = "BACK", reply = "Then you'll find this stair shorter every time you climb it. That is the only reward I can promise.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My power is my own, Sorcerer. I'll choose my causes.", next = "BACK", reply = "So did Morganth, and he chose very badly. Choose well, and you'll hear nothing more from me about it.", fx = { align = { order = -1 } } },
        { text = "What sort of names are on your list?", next = "an_list" },
      },
    },
    an_list = {
      lines = { { id = "anl_default", text = "Students who did well, students who did badly, and a short column at the end for those we would like to find again. Morganth heads the last one, and I'd be very glad to strike him off it." } },
      choices = { { text = "Something else, Sorcerer.", next = "BACK", fx = { learn = { "morganth" } } } },
    },
    an_sky = {
      big = true,
      lines = { { id = "ans_default", text = "The High Order answers to whom it pleases, I've noticed, and the Kirin Tor answer to no one at all, so we're all very free. While you stand in my Sanctum, though, you'll keep my wards as my own students keep them." } },
      choices = {
        { text = "Your wards, your rules. I'll keep them.", next = "BACK", reply = "Thank you. Courtesy between orders is rarer than it should be, and I'll remember yours.", fx = { align = { order = 1 } } },
        { text = "My people kept older wards than these.", next = "BACK", reply = "I don't doubt it, and older wards have failed before. These ones are mine, and they haven't.", fx = { align = { order = -1 } } },
        { text = "Something else, Sorcerer.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_an_mage", when = { class = "MAGE", minLevel = 20 },
          text = "You've the stance of a mage who has been tested in the field and come home, and the Sanctum keeps a list of such people. I'd like to be sure your name belongs on the right part of it." },
        { id = "h_default", text = "I am Andromath, High Sorcerer of this Sanctum, and the wizards of Stormwind answer to me in most matters. We guard the city against the kind of danger that does not come through the gate." },
        { id = "h_treatise_done", when = { questDone = TODO_QUEST("Ur's Treatise on Shadow Magic") }, text = "Ur's Treatise is back behind our wards with its seals unbroken, and Morganth's theft is undone. You did well, and I don't say that lightly." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Choose your question carefully, because the wards are listening too." },
        { id = "h_again2", text = "Speak, then, and keep your voice low; the wards are listening, but so am I." },
      },
      choices = {
        { text = "Who was Morganth?", next = "morganth" },
        { text = "How fares Dalaran?", next = "dalaran" },
        { text = "What dangers don't come through the gate?", next = "dangers" },
        { text = "You've work for a mage, you said.", next = "mage", when = { class = "MAGE" } },
        { text = "Mages only borrow their power, Sorcerer. Some of us take ours.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "What does the Sanctum expect of a mage it trained?", next = "an_expect", when = { class = "MAGE" } },
        { text = "The High Order answers to the Kirin Tor, not to you.", next = "an_sky", when = { race = "Skyborne", class = "MAGE" } },
        { text = "I'll leave you to your wards.", next = "END" },
      },
    },
    morganth = {
      lines = { { id = "m_default", text = "A mage of this Sanctum who fell to the dark arts and would not turn back from them, so we banished him. He took Ur's Treatise on Shadow Magic when he went, and he sits with it now in the Tower of Ilgalar in Redridge.", fx = { learn = { "morganth" } } } },
      choices = {
        { text = "Why not burn the book?", next = "burn" },
        { text = "You should have watched him closer.", next = "watched" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn = {
      big = true,
      lines = { { id = "b_default", text = "Because a book that dangerous is also a book that teaches us how to stop what's in it. We keep such things sealed, and we read them only when we must; that is the whole purpose of a Sanctum." } },
      choices = {
        { text = "Then keep it sealed. Knowledge has its uses.", next = "BACK", reply = "It does, and it has its dangers, and we bear both. I'm glad you see it.", fx = { align = { order = 1 } } },
        { text = "Some knowledge is better burned than kept.", next = "BACK", reply = "Perhaps, and Morganth would have agreed with you before he fell. We'll keep it all the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watched = {
      lines = { { id = "w_default", text = "Yes, we should have, and that is the lesson every Sanctum learns too late. The dark arts don't announce themselves; they arrive as a question that seems harmless." } },
      choices = { { text = "Something else, Sorcerer.", next = "BACK" } },
    },
    dalaran = {
      lines = { { id = "d_default", text = "Behind its walls and its shield, rebuilding, since Archimonde left it in ruin. The Kirin Tor are reclusive now and slow to trust, and they struggle to contain the wild arcane energies the destruction left behind.", fx = { learn = { "dalaran", "kirin_tor" } } } },
      choices = {
        { text = "Will they ask Stormwind for help?", next = "dalaran_help" },
        { text = "Why aren't you in Dalaran yourself?", next = "dalaran_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_help = {
      lines = {
        { id = "dh_default", text = "They will not ask, but they will accept, if it comes quietly. I send capable hands north when I find them, to disperse the energies before they spread beyond the walls." },
        { id = "dh_done", when = { questDone = TODO_QUEST("Power Overwhelming") }, text = "They accepted yours, and the Kirin Tor do not forget a debt, even when they forget to say thank you. You've done Stormwind a quiet service." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dalaran_why = {
      lines = { { id = "dw_default", text = "Because Stormwind needed a Sanctum, and someone had to stand in it. The finest of us are locked away in Dalaran, and I would rather be useful here than admired there." } },
      choices = { { text = "Stormwind's lucky to have you.", next = "BACK", reply = "Stormwind seldom thinks so, but thank you." } },
    },
    dangers = {
      lines = { { id = "da_default", text = "Demons summoned by fools, cults that meet in cellars, and books that should never have been written. We also see to the Nethergarde caravans, because the mages there study the Dark Portal and need supplies more than they need sleep.", fx = { learn = { "nethergarde" } } } },
      choices = {
        { text = "Who carries the supplies?", next = "supplies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies = {
      lines = {
        { id = "su_default", text = "Watchmaster Sorigal in Darkshire runs the caravan, and I send him anyone ready to cross hostile land. The road goes through Deadwind Pass and the swamp, so be ready for it before you go." },
        { id = "su_vital", when = { questDone = TODO_QUEST("Vital Supplies") }, text = "You've already been to Sorigal, so you know the road. Nethergarde will want more, and it always does." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "ma_default", text = "Morganth's book, and then a robe more suited to your standing, since you'll have earned it. The silk comes from the carrion recluse spiders of Duskwood, and Wynne Larson in the Mage Quarter will sew it for you." } },
      choices = {
        { text = "I'll fetch the book first.", next = "BACK", reply = "Do. And keep your mind closed when you're near it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      big = true,
      lines = { { id = "wl_default", text = "We both draw power from somewhere other than ourselves, true, but I know where mine goes when I am done with it. Yours has a will of its own and a long memory." } },
      choices = {
        { text = "What serves me stays on a short leash, Sorcerer.", next = "BACK", reply = "Every one of your kind says so, until the leash snaps. I hope yours is stronger than most.", fx = { align = { order = 1 } } },
        { text = "Power is power. Your wards are just politer chains.", next = "BACK", reply = "Then be glad of my chains, because they're what keeps your kind welcome in this city.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied where I could and stayed where I was needed. That is more than most sorcerers can say." } },
    dalaran = { { id = "tp_dal", text = "Rebuilding behind its shield, and slow to trust. I'd not try to visit uninvited." } },
    morganth = { { id = "tp_mo", text = "A former member of this Sanctum, and the reason we watch our apprentices so closely now." } },
    burning_legion = { { id = "tp_bl", text = "Archimonde burned Dalaran, and the Legion still has servants in this world. That's all a sorcerer needs to know to stay awake." } },
    _none = { { id = "tp_none", text = "That is outside my study, and I do not speak about what I have not studied." } },
  },
}

-- Donyal Tovald: one of the stewards of the Royal Library in the Keep.
P:NPC {
  key = "donyal_tovald", id = TODO_NPC("Donyal Tovald"), name = "Donyal Tovald", title = "Librarian", gender = "male",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "mild" }, values = { "learning", "order" },
  notices = { "arcane", "kin" },
  impression = {
    first = "He is very sure that a book belongs where it was put.",
    third = "{name} met Donyal Tovald, a steward of the Royal Library in Stormwind Keep.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Royal Library. Speak softly, please, and put nothing back on a shelf yourself; that's what I'm here for." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back. I hope you're returning something rather than borrowing it." },
    { id = "g_reading", when = { questActive = TODO_QUEST("Reading Room") }, text = "You're here about the reading room? Good, good, it's in a terrible state and I haven't the hands for it." },
    { id = "g_shelf", when = { questActive = TODO_QUEST("Shelf Picked") }, text = "Any sign of the missing volumes? I've been staring at that empty shelf all morning, and it hasn't filled itself." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = { "MAGE", "WARLOCK" } },
      text = "Please don't read the spellbooks aloud. The last apprentice who did so set fire to a perfectly good history of Arathor." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Your family's lineage is likely on these shelves, if they were ever anyone. You'd be surprised how many people never look." },
  },
  start = "hello",
  nodes = {
    d6_milton = {
      lines = { { id = "d6_milton_a", text = "Exact, which is the kindest word I have for it. Milton can tell you the shelf of any book in the Keep without looking, and he can also tell you who last breathed on it, which is less useful but very hard to argue with." } },
      choices = {
        { text = "Do you two ever disagree?", next = "d6_milton2" },
        { text = "He sounds a little terrifying.", next = "d6_milton2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d6_milton2 = {
      lines = { { id = "d6_milton2_a", text = "Only about whether a book belongs to the catalogue or to the shelf, which sounds like nothing and has lasted us four years. He thinks a book exists once it's written down, and I think it exists once it's put back, and the truth is somewhere in the reading room." } },
      choices = {
        { text = "I'll be careful to put books back, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Donyal.", next = "BACK" },
      },
    },
    d6_readers = {
      lines = { { id = "d6_readers_a", text = "Clerics from the Cathedral, tutors for noble children, and the occasional mage who's been sent across from the Sanctum to look something up and resents the walk. The nobles themselves come rarely, and they borrow far more than they return." } },
      choices = {
        { text = "Are there any nobles who do return books?", next = "d6_readers2" },
        { text = "Does the Sanctum ever borrow from you?", next = "d6_readers2", when = { class = "MAGE" } },
        { text = "Let's move on.", next = "BACK" },
      },
    },
    d6_readers2 = {
      lines = {
        { id = "d6_readers2_a", text = "One, I'll grant, and it surprised me. Lady Prestor takes the genealogies of the old houses, the ones of Stormwind and Lordaeron both, and she returns every one on the day it's due, which is more than the young Prince's tutors manage." },
        { id = "d6_readers2_mage", when = { class = "MAGE" }, text = "They do, and they return our histories with notes in the margins about where the histories are wrong. I've asked them to write on a separate page, and they've asked me whether I'd prefer the history to stay wrong, and so we go on." },
      },
      choices = {
        { text = "Interesting reading for a court lady.", next = "BACK", fx = { learn = { "prestor" } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", text = "Donyal Tovald, one of the library's stewards; Milton Sheaf keeps the catalogue, and I keep the shelves in order, which is the harder job by far. Is there something I can find for you?" },
        { id = "h_done", when = { questDone = TODO_QUEST("Shelf Picked") }, text = "The shelf is full again, thanks to you, and I've stopped waking up at night thinking about it. That's a great service to a librarian." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, please." },
        { id = "h_again2", text = "Yes? I've a cart of returns, but I can spare you a moment." },
      },
      choices = {
        { text = "What sort of books does the Keep keep?", next = "books" },
        { text = "What's wrong with the reading room?", next = "reading" },
        { text = "Who takes books from a royal library?", next = "thieves" },
        { text = "Libraries are for scholars, not common folk.", next = "common" },
        { text = "Is there anything here on Lordaeron's families?", next = "lordaeron", when = { race = "Human" } },
        { text = "Does the library keep any spellbooks?", next = "spellbooks", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "What's Milton Sheaf like to work beside?", next = "d6_milton" },
        { text = "Who reads in the library most?", next = "d6_readers" },
        { text = "I'll let you get back to your shelves.", next = "END" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "Histories of the seven kingdoms, the crown's records, treatises on law and war, and a great many genealogies that nobody reads until they want to inherit something. The rarest volumes are kept further in, and you'd need Milton's leave to see them.", fx = { learn = { "seven_kingdoms" } } } },
      choices = {
        { text = "What's the rarest thing here?", next = "rare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rare = {
      lines = { { id = "r_default", text = "I'd tell you, but then you'd want to see it, and then I'd have to say no. Let us say there are histories of Arathor older than the city's walls." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    reading = {
      lines = { { id = "rd_default", text = "Everyone who uses it leaves something behind and takes something they shouldn't, and the chairs are in a dreadful state. I've asked for help in setting it right, and so far the only one who's answered is you." } },
      choices = {
        { text = "I'll set it right for you.", next = "BACK", reply = "Thank you, truly. Start with the tables; you'll see what I mean.", fx = { affinity = 1 } },
        { text = "Who leaves things behind?", next = "thieves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thieves = {
      lines = { { id = "t_default", text = "Nobles' sons who forget to return what they borrow, scholars who think a margin is for their opinions, and the odd clerk who sells a page to a collector. Nobody steals a whole book, but they take it a page at a time." } },
      choices = {
        { text = "A page at a time is still theft.", next = "BACK", reply = "It is, and I say so, and they laugh. You're kind to agree." },
        { text = "Something else.", next = "BACK" },
      },
    },
    lordaeron = {
      lines = { { id = "lo_default", text = "Some genealogies, yes, of the old houses, though they end abruptly a few years ago, as you'd expect. Refugees come in asking after cousins, and I show them the page, and they read it as if it might have changed.", fx = { learn = { "lordaeron" } } } },
      choices = { { text = "That must be hard to watch. Something else.", next = "BACK" } },
    },
    spellbooks = {
      lines = { { id = "sb_default", text = "A few histories of magic, but no proper spellbooks; those go to the Wizard's Sanctum, and Garion Wendell guards them like a dragon with a hoard. Ask him, if you can get a word in." } },
      choices = { { text = "I'll try him. Something else.", next = "BACK" } },
    },
    common = {
      big = true,
      lines = { { id = "c_default", text = "I've heard that said by men in very fine coats, and I've never agreed with it. A farmer's son who can read the law knows when he's being cheated, which is exactly why some people would rather he couldn't." } },
      choices = {
        { text = "Then open the doors to anyone who wants to read.", next = "BACK", reply = "I would, if I could keep the pages from walking out. Someday, perhaps.", fx = { align = { light = 1 } } },
        { text = "Some books aren't meant for everyone, Donyal.", next = "BACK", reply = "Some aren't, which is why they're kept further in. But the law isn't one of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to the library as a copyist's boy and never left. It's the quietest room in the city, and I like it that way." } },
    seven_kingdoms = { { id = "tp_sk", text = "The library has a shelf for each of them, and the one for Lordaeron is the one people stand in front of longest now." } },
    _none = { { id = "tp_none", text = "I'd have to look that up, and I'm afraid I don't know where to start." } },
  },
}

-- Garion Wendell: librarian of the Wizard's Sanctum, who takes books mages bring from the world.
P:NPC {
  key = "garion_wendell", id = TODO_NPC("Garion Wendell"), name = "Garion Wendell", title = "Librarian", gender = "male",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "eager" }, values = { "learning", "curious" },
  notices = { "arcane" },
  impression = {
    first = "His hello is warmer if the book you bring is rare.",
    third = "{name} met Garion Wendell, the librarian of Stormwind's Wizard's Sanctum.",
  },
  greetings = {
    { id = "g_x1", when = { class = "MAGE" }, text = "Ah, one of the Sanctum's own. Have you brought me a book, or have you come to ask for one?" },
    { id = "g_x2", when = { questDone = TODO_QUEST("Reading Room") }, text = "Welcome back to the reading room. Your table's free, and I've kept the lamp trimmed." },
    { id = "g_default", text = "Welcome to the Sanctum's library. Do you have a book for me? Everyone always seems to have a book for me, except when I ask." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you! Did you find anything on your travels? Even a torn page is worth a look." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage of the Sanctum! You'll be out in the world more than I ever am, so keep your eye out for books, will you?" },
  },
  notice = {
    { id = "n_x1", cat = "arcane", when = { class = "WARLOCK" },
      text = "I know what you study, and I'll thank you not to name it under this roof. If you've books on the subject, though, I'd sooner they were here than anywhere else." },
    { id = "n_x2", cat = "arcane", when = { race = "Gnome" },
      text = "A gnome! Your people's notebooks are the delight and the despair of my shelves. No two of them use the same numbering, and every one of them is right." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "Bring me the books you find out there, and the library is yours to study in. That's an old arrangement, and a good one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Garion Wendell, librarian to the Wizard's Sanctum. The mages of this city find books in the strangest places, tombs and towers and troll huts, and when they bring them here I make sure they're not lost again." },
        { id = "h_access", when = { questDone = TODO_QUEST("Research Access") }, text = "The study tables are yours whenever you need them, as we agreed. I've kept the good lamp aside for you." },
      },
      again = {
        { id = "h_x_again1", text = "Yes? I was only cataloguing. It will keep." },
        { id = "h_x_again2", text = "Another question, and welcome. A library is for asking." },
        { id = "h_again", text = "Something else? I'm only cataloguing, and the catalogue never ends." },
        { id = "h_again2", text = "Go on. I've just finished a chapter, so I'm in a good mood." },
      },
      choices = {
        { text = "What sort of books do you want?", next = "wanted" },
        { text = "What does a mage get for bringing one?", next = "access", when = { class = "MAGE" } },
        { text = "Some of those books must be dangerous.", next = "danger" },
        { text = "How does this compare to Dalaran's libraries?", next = "dalaran" },
        { text = "Where do the books go once you have them?", next = "shelves" },
        { text = "You speak of lost books as if they were people.", next = "people" },
        { text = "I've found books in stranger places than tombs.", next = "finds", when = { class = "MAGE", minLevel = 30 } },
        { text = "My people kept libraries before yours had letters.", next = "elves", when = { race = "NightElf" } },
        { text = "Good day, Garion.", next = "END" },
      },
    },
    wanted = {
      lines = { { id = "w_default", text = "Anything, truly, from a treatise on geomancy to a gnome's notes on clockwork. Books on demons and basilisks and the old troll kingdoms turn up most, which tells you something about where adventurers spend their time." } },
      choices = {
        { text = "What's the strangest one you've been given?", next = "strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "A guide to the proper care of a demonic pet, written as if the demon were a lapdog. I laughed until I read the chapter on feeding it, and then I put it on the highest shelf." } },
      choices = { { text = "Wise choice. Something else.", next = "BACK" } },
    },
    access = {
      lines = { { id = "a_default", text = "The use of our study tables, and the scrolls we keep there for research. Bring me your first book and I'll open the library to you; that's how we've always done it here." } },
      choices = {
        { text = "I'll find you a book.", next = "BACK", reply = "Excellent! And not a cookbook, please; I've three already.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      big = true,
      lines = { { id = "d_default", text = "Some are, and those go where the High Sorcerer says, behind wards I'm not permitted to open. But a dangerous book in a library is safer than a dangerous book in a ditch, where anyone might pick it up." } },
      choices = {
        { text = "Better here than in a ditch. I agree.", next = "BACK", reply = "Thank you! Not everyone does; some of the senior mages think every book should be locked away.", fx = { align = { order = 1 } } },
        { text = "Better burned than sitting anywhere at all.", next = "BACK", reply = "Burned! A librarian's nightmare. I'll pretend I didn't hear you say it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = { { id = "da_default", text = "Ours is a candle to Dalaran's sun, or it was, before the city fell. Who knows what was lost in the burning, and that's why I can't bear to turn away even a single page.", fx = { learn = { "dalaran" } } } },
      choices = { { text = "Something else, Garion.", next = "BACK" } },
    },
    shelves = {
      lines = {
        { id = "shelves_1", text = "Into the catalogue first, with a note of who found it and where, and then to the shelf its subject earns. Geomancy has outgrown its case twice, and the works on the troll empires are stacked on the floor until the High Sorcerer finds me another room." },
      },
      choices = {
        { text = "Who reads them?", next = "readers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    readers = {
      lines = {
        { id = "readers_1", text = "Apprentices, when their masters send them, and the masters themselves late at night when they think nobody will see what they've had to look up. I never tell, and I'm sure that's why they're so civil to me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    people = {
      lines = {
        { id = "people_1", text = "I suppose I do. A book is all that's left of somebody's whole mind, sometimes, and when one's burned or left to rot in a ruin it's a second death. I lost friends in Dalaran, and their books with them, so I can't always keep the two apart." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    finds = {
      lines = {
        { id = "finds_1", text = "Tell me, do, and slowly, so I can note it down. I've had volumes brought from a harpy's nest, a murloc's hut and the stomach of a crocolisk, and each time I think I've heard the last odd shelf-mark I shall have to invent." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = {
        { id = "elves_1", text = "You did, and I'd give a great deal to see one. The oldest thing on my shelves is a few centuries; your people's youngest scroll would be the senior of everything in this tower, and I'd catalogue it standing up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "An apprentice tells me a dealer in the canals is selling pages cut out of old spellbooks. If you see him, buy nothing, and tell me where he stands." } },
    advice = { { id = "tp_x_advice", text = "Write your name in nothing and the place you found it in everything. A book without a provenance is only half a book." } },
    background = { { id = "tp_bg", text = "I wasn't much of a mage, but I was very good at finding things on shelves, so the Sanctum kept me." } },
    dalaran = { { id = "tp_dal", text = "They say the Violet Citadel's library survived. I'd give a great deal to see it, and a great deal more to borrow from it." } },
    _none = { { id = "tp_none", text = "I don't think we have a book on that, but I'll look, if you've an afternoon to spare." } },
  },
}
