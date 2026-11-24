-- Ironforge folk the first passes missed, part one: the Quikswitch apprentices at Springspindle's Gadgets,
-- Stonebrow's Clothier, Timberline Arms, the Hall of Arms, the Library, the Forlorn Cavern's gnome warlock,
-- Lomac Gearstrip, and the armour and robe sellers of the Military Ward, the Mystic Ward and the Commons.
-- Voices: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Jemma Quikswitch: apprentice engineer at Springspindle's Gadgets, Tinker Town. (Forever: Data Hoarders.)
P:NPC {
  key = "if_jemma", id = TODO_NPC("Jemma Quikswitch"), name = "Jemma Quikswitch", title = "Apprentice Engineer", gender = "female",
  bible = "bibles/missed_b.md", role = "worker", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "eager", "exact" }, values = { "knowledge", "family" },
  notices = { "craft", "gnome" },
  impression = {
    first = "Jemma Quikswitch is an apprentice at Springspindle's Gadgets, and she writes down every measurement twice in a notebook that's nearly full. She talks about Gnomeregan's lost records the way other people talk about lost relatives.",
    third = "{name} met Jemma Quikswitch, an apprentice engineer at Springspindle's Gadgets in Tinker Town.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! Mind the bench, please, because I've forty-one gear teeth laid out in order and I only want to count them the once." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and I've filled eleven more pages since you left, so that's progress of a kind." },
    { id = "g_data", when = { questActive = TODO_QUEST("Data Hoarders") }, text = "You're here about the data, aren't you? Come in, come in, and please tell me you were careful with it." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You've got solder burns on your fingers, the same as mine! Master Springspindle says they're the only diploma that counts." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Another one of us, and all in one piece. I keep a count of the gnomes I see in Tinker Town each day, and it's never as many as I'd like." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Jemma Quikswitch, apprentice engineer, and that's my sister Trixie making sparks at the other bench. Master Springspindle teaches us both, though he says I measure too much and she doesn't measure at all." },
        { id = "h_data", tags = { "news" }, when = { questActive = TODO_QUEST("Data Hoarders") },
          text = "Every punch card and schematic that comes out of Gnomeregan is something we don't have to invent twice. Show me what you've brought, and I'll start a fresh page for it." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I've a list somewhere of things worth telling." },
        { id = "h_again2", text = "Go on, I can count and listen at the same time, more or less." },
      },
      choices = {
        { text = "What's in the notebook?", next = "notebook" },
        { text = "You and your sister work very differently.", next = "trixie" },
        { text = "What is Springspindle like to learn from?", next = "master" },
        { text = "I'm an engineer myself.", next = "engineer", when = { profession = "Engineering" } },
        { text = "I'll leave you to your counting.", next = "END" },
      },
    },
    notebook = {
      lines = { { id = "nb_default", text = "Everything I can remember of the workshops back home, and everything the other refugees remember when I ask them nicely. The libraries are still down there with the troggs and the radiation, so somebody has to write it out again.", fx = { learn = { "gnomeregan_records" } } } },
      choices = {
        { text = "How much have you saved so far?", next = "notebook2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    notebook2 = {
      lines = { { id = "nb2_default", text = "Three hundred and twelve pages, of which I trust about two hundred, because people misremember tolerances something awful. I mark the doubtful ones with a little cog in the margin and test them when the bench is free." } },
      choices = {
        { text = "And when Gnomeregan is retaken?", next = "notebook3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    notebook3 = {
      lines = { { id = "nb3_default", text = "Then I'll walk straight to the archive on the third level and check every page against the originals. I expect to be wrong about a great deal, and I can't tell you how much I'm looking forward to finding out." } },
      choices = { { text = "I hope you get the chance. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trixie = {
      lines = { { id = "tx_default", text = "Trixie builds a thing first and finds out afterwards why it caught fire, and I'd rather know why before I build it. Between us we make one very good engineer, which is what Mother always said." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master = {
      lines = { { id = "ms_default", text = "He's patient about mistakes and impatient about everything else, and he's quite certain the wheel will be obsolete within his lifetime. I've stopped arguing with him about it, because he keeps drawing me diagrams." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    engineer = {
      lines = { { id = "en_default", text = "Then you'll know how it feels to lose a schematic you were halfway through! If you ever come across gnomish plans out in the world, read the tolerances twice before you trust them, because the copies are never as good as ours were." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was an apprentice in Gnomeregan too, for exactly nineteen days before the evacuation, so I've had to start again here." } },
    gnomeregan_records = { { id = "tp_rec", text = "The archives are still down there, and every month they sit in that air does them no good at all." } },
    _none = { { id = "tp_none", text = "I haven't a page on that, I'm afraid. Master Springspindle might know, if you catch him between lectures." } },
  },
}

-- Trixie Quikswitch: apprentice engineer at Springspindle's Gadgets; Jemma's sister.
P:NPC {
  key = "if_trixie", id = TODO_NPC("Trixie Quikswitch"), name = "Trixie Quikswitch", title = "Apprentice Engineer", gender = "female",
  bible = "bibles/missed_b.md", role = "worker", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "cheerful", "reckless" }, values = { "invention", "family" },
  notices = { "craft" },
  impression = {
    first = "Trixie Quikswitch works at the scorched end of the bench at Springspindle's Gadgets, with her goggles pushed up and one eyebrow shorter than the other. She seems delighted by every bang, including the ones she didn't plan.",
    third = "{name} met Trixie Quikswitch, the louder of the two apprentices at Springspindle's Gadgets.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Stand a little to the left, would you, because I'm about sixty percent sure which way this one goes off." },
    { id = "g_back", when = { metBefore = true }, text = "Oh good, it's you, and you've still got both eyebrows, so you can't have been standing here yesterday." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Quick, tell me honestly, how many of your first ten devices exploded? Mine was nine, and the tenth only smoked." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Trixie Quikswitch, apprentice engineer, and that tidy person over there is my sister Jemma. She writes things down and I set things off, and Master Springspindle says he can't decide which of us worries him more." },
      },
      again = {
        { id = "h_again", text = "What else? The fuse is a long one, so we've time." },
        { id = "h_again2", text = "Ask away, I'm only waiting for this to cool." },
      },
      choices = {
        { text = "What are you building?", next = "building" },
        { text = "Your eyebrow has seen better days.", next = "eyebrow" },
        { text = "I'll give you some room.", next = "END" },
      },
    },
    building = {
      lines = { { id = "b_default", text = "It's meant to be a self-winding spring box, so a mechanical squirrel can run all day without anyone turning the key. So far it winds itself beautifully for eight seconds and then unwinds itself all over the ceiling." } },
      choices = {
        { text = "What does Jemma say about it?", next = "building2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    building2 = {
      lines = { { id = "b2_default", text = "She says the spring is four percent too strong for the casing, and she's probably right, because she usually is. I'd just rather find it out with a bang than a sum, and it's my half of the bench." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    eyebrow = {
      lines = { { id = "e_default", text = "That was Tuesday's prototype, and it taught me a great deal about venting. Back in Gnomeregan they'd have called it a learning opportunity and given me a bigger workshop, and I do miss that attitude." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Jemma and I came out of Gnomeregan together, with one bag between us and most of it her notebooks." } },
    _none = { { id = "tp_none", text = "No idea! Ask Jemma, she's probably got it written down under a heading." } },
  },
}

-- Kelv Sternhammer: warrior trainer, Hall of Arms. Classic: The Islander (30), A Troubled Spirit (50).
P:NPC {
  key = "if_kelv", id = TODO_NPC("Kelv Sternhammer"), name = "Kelv Sternhammer", title = "Warrior Trainer", gender = "male",
  bible = "bibles/missed_b.md", role = "trainer", tier = "quest",
  communities = { "ironforge" }, temper = { "stern", "fair" }, values = { "discipline", "duty" },
  notices = { "class", "greenness", "kit" },
  impression = {
    first = "Kelv Sternhammer drills warriors in the Hall of Arms with his arms folded and his voice level, and nobody in the hall seems to want to disappoint him. He corrects a stance with the toe of his boot and has never been heard to praise anyone twice.",
    third = "{name} met Kelv Sternhammer, a warrior trainer in Ironforge's Hall of Arms.",
  },
  greetings = {
    { id = "g_default", text = "Ye're standin' in a drill hall, so stand like ye mean it. What brings ye tae the Hall of Arms?" },
    { id = "g_war", when = { class = "WARRIOR" }, text = "Feet apart an' shoulders down, warrior, an' the shield arm higher than that. Good, now tell me what ye've come tae learn." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the hall, I see, an' still breathin', so somethin' I said must have stuck. Let's find out whether ye practised or only meant tae." },
    { id = "g_islander", when = { questActive = TODO_QUEST("The Islander") }, text = "Ye've no' sailed for Fray Island yet? Klannoc doesnae wait on anyone, {g:lad|lass}, so don't keep him." },
    { id = "g_spirit", when = { questActive = TODO_QUEST("A Troubled Spirit") }, text = "The swamp's a long road, an' that ghost's waited years already, but I'd still sooner ye didnae dawdle." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { class = "WARRIOR", maxLevel = 12 },
      text = "Ye grip that like ye're afraid it'll bite. Loosen the hand an' tighten the wrist, an' come back when it feels wrong the other way." },
    { id = "n_gnome", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "A gnome in mail! Bilban'll be pleased, for he's forever tellin' me the best warriors in this hall come up tae my belt." },
    { id = "n_kit", cat = "kit", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "Look at the state o' that gear, warrior, for a fighter who neglects his kit is only a corpse wi' a delay on it. See an armourer at the Great Forge today, before ye see me again." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Kelv Sternhammer, an' I train warriors for Ironforge. Kelstrum teaches them tae hit an' Bilban teaches them tae be quick, but I teach them tae hold a line when everythin' in them wants tae run, an' I'll no' flatter ye while I do it." },
        { id = "h_notwar", when = { ["not"] = { class = "WARRIOR" } },
          text = "Kelv Sternhammer, warrior trainer. Ye're no' one o' mine, by the look o' ye, but ye're welcome tae watch the drills so long as ye keep off the sand." },
        { id = "h_stance", when = { class = "WARRIOR", minLevel = 10, maxLevel = 19 },
          text = "Ye've the look o' someone who's just been handed a second stance an' doesnae trust it yet. Good, for trust is earned in this hall, even by a stance." },
        { id = "h_islander", tags = { "news" }, when = { class = "WARRIOR", minLevel = 30, maxLevel = 39 },
          text = "Ye're ready for somethin' harder than my sand, {g:lad|lass}, an' I've a name for ye across the sea. Ask me about it when ye've a moment." },
        { id = "h_plate", when = { class = "WARRIOR", minLevel = 40, maxLevel = 59 },
          text = "Plate on ye, an' worn proper, wi' the straps tight an' the shoulders square. I'll say it once, as is my habit: that's adequate." },
        { id = "h_sixty", when = { class = "WARRIOR", minLevel = 60 },
          text = "There's nothin' left in this hall that ye couldnae teach better than me, an' the recruits know it, for they've all stopped drillin' tae stare. Stand there a moment an' let them look." },
      },
      again = {
        { id = "h_again", text = "What else? The recruits are slackin' while I talk, so be quick about it." },
        { id = "h_again2", text = "Go on, then, an' keep it short, for my patience is drilled as hard as they are." },
        { id = "h_again3", when = { class = "WARRIOR" }, text = "Ask, warrior, an' keep yer shield arm up while ye do it. I'm watchin'." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What do you teach a recruit first?", next = "first" },
        { text = "What does holding a line take?", next = "line" },
        { text = "Your recruits look worn out.", next = "recruits" },
        { text = "You don't hand out much praise, drill master.", next = "praise" },
        { text = "I've earned Defensive Stance from Muren.", next = "k_stance", when = { class = "WARRIOR", minLevel = 10, maxLevel = 29 } },
        { text = "What should I be drilling now, at my age?", next = "k_mid", when = { class = "WARRIOR", minLevel = 20, maxLevel = 39 } },
        { text = "Is there a harder test than the drill hall?", next = "islander", when = { class = "WARRIOR", minLevel = 30 } },
        { text = "I've earned my plate, drill master.", next = "k_plate", when = { class = "WARRIOR", minLevel = 40 } },
        { text = "You look troubled, trainer.", next = "spirit", when = { class = "WARRIOR", minLevel = 50 } },
        { text = "A gnome warrior trainer must have surprised you.", next = "bilban", when = { race = "Gnome" } },
        { text = "I came up from Stormwind to train under dwarves.", next = "k_human", when = { race = "Human", class = "WARRIOR" } },
        { text = "I'll leave you to your drills.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "How tae stand, an' then how tae take a blow, an' no' a word about hittin' anythin' for the first week. A warrior who cannae keep his feet is only a heavy thing for his friends tae carry home." } },
      choices = {
        { text = "And after the first week?", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "f2_default", text = "Then the shield, for it's the shield that keeps the dwarf beside ye alive, an' that's the whole o' the job. The axe comes last, an' by then they've wanted it so long they treat it wi' some respect." } },
      choices = {
        { text = "The warrior stands for the others, then.", next = "first3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first3 = {
      lines = { { id = "f3_default", text = "Aye, that's it said plainly. The priest heals an' the mage burns, an' neither does it for long unless somebody stubborn is standin' in front o' them, an' stubborn is somethin' Ironforge has never run short o'." } },
      choices = { { text = "Stubborn I can manage. Something else.", next = "BACK" } },
    },
    line = {
      lines = { { id = "li_default", text = "Trust in the dwarf on yer left, an' nothin' else. Yer shield covers him an' his covers ye, an' the moment one o' ye steps back the whole wall becomes a row o' dead heroes, so I drill it till they can do it asleep." } },
      choices = {
        { text = "Have you ever seen a line break?", next = "line_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    line_break = {
      big = true,
      lines = { { id = "lb_default", text = "Once, at the gates o' Dun Modr, when one lad ran an' eleven died for it. He lived, an' he came tae me after, askin' tae be drilled again, an' I've never decided whether I was right tae take him back." } },
      choices = {
        { text = "You were. Everyone deserves a second stand.", next = "BACK", reply = "He's a sergeant now, an' he's never stepped back since. Maybe ye're right.", fx = { align = { light = 1 } } },
        { text = "You weren't. Eleven dead is past forgiving.", next = "BACK", reply = "Their mothers would say the same, an' I hear them most nights.", fx = { align = { light = -1 } } },
        { text = "I'd rather not judge that, drill master.", next = "BACK" },
      },
    },
    recruits = {
      lines = { { id = "r_default", text = "Good, they should be. The troggs under Dun Morogh don't rest an' the Dark Irons don't rest, so I'd sooner these lads were tired in my hall than fresh an' dead in the Searing Gorge." } },
      choices = {
        { text = "Do many of them wash out?", next = "recruits2" },
        { text = "Which of them make the best warriors?", next = "recruits_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits2 = {
      lines = { { id = "r2_default", text = "Fewer than ye'd think, for a dwarf will bleed before he'll quit in front o' his cousins. The ones who go usually find they've better hands for the forge or the rifle, an' there's nae shame in either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recruits_best = {
      lines = { { id = "rb_default", text = "The ones who are a wee bit feared, for the fearless ones break formation tae be heroes, an' I've buried enough o' those. Give me a lad who kens he can die, an' I'll make him a wall." } },
      choices = {
        { text = "And what becomes of the fearless ones?", next = "recruits_fearless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits_fearless = {
      lines = { { id = "rf_default", text = "I send them tae Kelstrum, who'll put them on the floor till they've learned some fear. If that doesnae take, there's always the siege brigade, for they like a dwarf wi' nae sense." } },
      choices = { { text = "A place for everyone, then.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    praise = {
      lines = { { id = "pr_default", text = "No, I don't, for praise makes a recruit think he's finished learnin', an' the day he thinks that is the day before his funeral. I tell them when they've done a thing right, once, an' they remember it better for the rarity." } },
      choices = {
        { text = "Who was the last to earn it?", next = "praise_last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_last = {
      lines = { { id = "pl_default", text = "A human lass up from Stormwind, half my weight, who held the centre against six o' my best for the count of a hundred. I told her it was adequate, an' she grinned as if I'd handed her a medal." } },
      choices = { { text = "From you, it was one.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    bilban = {
      lines = { { id = "bi_default", text = "He did, an' I laughed, an' then he put me on the floor by goin' between my knees. He fights like a ferret in a pipe, an' there's lessons in it for dwarves who think height is strength." } },
      choices = { { text = "You learned something from a gnome.", next = "BACK", reply = "I did, an' if ye repeat that in this hall I'll have ye runnin' laps till Winter Veil.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    k_stance = {
      big = true,
      lines = {
        { id = "ks_default", text = "So ye have, an' Muren doesnae hand it out for nothin', so ye'll have brought him Vejrek's head from Frostmane Hold. Now ye'll learn that takin' a stance is the easy bit, an' holdin' it while three troggs try tae walk round ye is the work." },
        { id = "ks_gnome", when = { race = "Gnome" }, text = "So ye have, an' Muren tells me ye went up against Vejrek at Frostmane Hold when the troll stood three times yer height. Now ye'll learn that takin' a stance is the easy bit, an' holdin' it is the work." },
      },
      choices = {
        { text = "Then I'll hold it, whatever walks round me.", next = "k_stance_hold", fx = { align = { order = 1 } } },
        { text = "I'd sooner kill them fast than hold anything.", next = "BACK", reply = "Then ye'll kill two, an' the third'll be eatin' yer healer. Think on it.", fx = { align = { order = -1 } } },
        { text = "How do I keep them from walking round me?", next = "k_stance_hold" },
      },
    },
    k_stance_hold = {
      lines = { { id = "ksh_default", text = "Taunt the one that strays, an' Sunder the one ye want them all tae follow, an' put yer back tae a wall whenever there's a wall tae be had. Ironforge was built by folk who understood walls, an' ye'd do well tae think like them." } },
      choices = { { text = "Back to the wall. Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    k_mid = {
      lines = {
        { id = "km_default", text = "Shield Bash, for the shaman who thinks he'll heal his friends while ye're busy, an' Disarm, for the brute wi' the bigger axe. By twenty-eight ye'll have Shield Wall too, an' that's the one I want ye practisin' till yer arm forgets how tae drop." },
        { id = "km_dwarf", when = { race = "Dwarf" }, text = "Shield Bash an' Disarm, an' then Shield Wall when it comes, for a dwarf who cannae stand still under a hammer is a disgrace tae the clan. I want ye practisin' till Kelstrum himself cannae move ye." },
      },
      choices = {
        { text = "Klockmort in Tinker Town is making gauntlets for warriors.", next = "k_klockmort", when = { minLevel = 25 } },
        { text = "I'll drill Shield Wall until my arm aches.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_klockmort = {
      lines = { { id = "kk_default", text = "He is, an' they're good, which I'll no' say twice, for he wants searing coral off the Wetlands coast south o' Menethil, an' a deal o' patience before he'll make them. Gnomish work fits a fist better than ye'd think, an' it's never once caught fire on me, which is more than I can say for their other inventions." } },
      choices = { { text = "Searing coral, then. Something else.", next = "BACK" } },
    },
    islander = {
      lines = {
        { id = "i_default", text = "There is, an' ye're near ready for it. Off the coast by Ratchet, in the Barrens, there's a wee rock called Fray Island where a man named Klannoc Macleod tests warriors against all comers, an' I send him the ones I think can stand." },
        { id = "i_done", when = { questDone = TODO_QUEST("The Affray") }, text = "Ye've stood Klannoc's Affray already, an' come back wi' the berserker's stance on ye like a fever. I'll no' pretend tae love it, but I'll teach ye tae use it without losin' yer head." },
      },
      choices = {
        { text = "What will Klannoc teach me that you can't?", next = "islander_berserk" },
        { text = "Then I'll look for his island. Something else.", next = "BACK" },
      },
    },
    islander_berserk = {
      big = true,
      lines = { { id = "ib_default", text = "Berserker Stance, an' how tae fight wi' nae shield in yer heart, which isnae a thing I'm fit tae teach. A dwarf in that stance hits like a falling mountain an' bleeds like a cut barrel, so ye'll need tae decide what ye are when ye're angry." },
      },
      choices = {
        { text = "I'll keep the shield in my heart, stance or no.", next = "BACK", reply = "Then ye'll be a fine warrior, an' a long-lived one. Go wi' my blessin'.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "When I'm angry, I'm a mountain falling. Good.", next = "BACK", reply = "Aye, an' mountains bury their own as often as their enemies. Mind that.", fx = { align = { honor = -1 } } },
        { text = "Something else, drill master.", next = "BACK" },
      },
    },
    k_plate = {
      lines = {
        { id = "kp_default", text = "Ye have, an' it'll change how ye fight whether ye like it or no', for a warrior in plate stops dodgin' an' starts leanin' intae the blow. Lean too far an' ye'll fall, so drill yer feet as if ye still wore leather." },
        { id = "kp_dwarf", when = { race = "Dwarf" }, text = "Ye have, an' it sits on ye like it was forged at the Great Forge for yer shoulders alone, which perhaps it was. Mind ye don't stop movin' just because ye're hard tae hurt, for a dwarf who stands too still gets surrounded." },
      },
      choices = {
        { text = "I'll move as if I wore none.", next = "BACK", reply = "Adequate. Ye'll note I said that once.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Plate is for standing still and taking it.", next = "BACK", reply = "Plate is for livin' through the blows ye couldnae avoid, an' that's a different thing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit = {
      lines = { { id = "sp_default", text = "I've had word of a warrior's ghost that cannae rest, down where the Swamp of Sorrows meets the Blasted Lands. It's one o' the other side's dead, an orc, but a restless warrior troubles me whatever banner he fell under." } },
      choices = {
        { text = "An orc? Why should a dwarf care?", next = "spirit_why" },
        { text = "A warrior's rest is worth the road. Something else.", next = "BACK" },
      },
    },
    spirit_why = {
      big = true,
      lines = { { id = "spw_default", text = "Because I fought orcs for thirty years an' I ken what they were like at their best, which was brave, an' at their worst, which was the demons' doin'. A warrior who died fightin' the right enemy deserves tae be heard, an' I'd want the same if it were me." },
      },
      choices = {
        { text = "Then I'll hear him out, for a warrior's sake.", next = "BACK", reply = "Good. Come back an' tell me what he wanted, if ye can bear tae.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A dead orc is one less orc. I'll leave him.", next = "BACK", reply = "That's how I'd have answered at yer age, an' I was wrong then too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_human = {
      lines = { { id = "kh_default", text = "Ye're no' the first, for the last human I praised was a Stormwind lass who held the centre against six o' my best. Humans reach too far an' dwarves don't reach far enough, an' between the two there's a decent warrior." } },
      choices = {
        { text = "Then I'll learn to reach less.", next = "BACK", reply = "Good, an' I'll teach ye tae reach when it counts. Back tae the sand.", fx = { affinity = 1 } },
        { text = "Wu Shen taught me differently.", next = "BACK", reply = "Wu Shen's a fine teacher an' a stubborn one. So am I. Take what works from both.", fx = { trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a shield for Ironforge through the Second War, thirty years in the line in all, an' I've been teachin' others tae carry one ever since." } },
    fray_island = { { id = "tp_fray", text = "Klannoc Macleod keeps it, off Ratchet, an' he's a hard judge, which is why I trust his word on a warrior." } },
    hall_of_arms = { { id = "tp_hall", text = "It's where Ironforge makes its soldiers, an' it's loud an' it stinks o' sweat an' ram, an' I'd have it nae other way." } },
    kelstrum = { { id = "tp_kelstrum", text = "Kelstrum Stonebreaker's the senior o' us, an' he hits like a rockslide, so go tae him when ye want tae learn how tae end a fight." } },
    muren = { { id = "tp_muren", text = "Muren Stormpike sets the tests for the ones who think they're ready, an' most find out they werenae." } },
    _none = { { id = "tp_none", text = "That's no' a thing I can drill intae ye, so ask someone wi' more books an' fewer bruises." } },
  },
}

-- Krom Stoutarm: Explorers' League digger in the Library; a warlock on the quiet. Classic: Tome of the Cabal.
P:NPC {
  key = "if_krom", id = TODO_NPC("Krom Stoutarm"), name = "Krom Stoutarm", gender = "male",
  bible = "bibles/missed_b.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "guarded", "wry" }, values = { "knowledge", "discretion" },
  notices = { "class", "lore" },
  impression = {
    first = "Krom Stoutarm sits among the Library's shelves with dig dust still in his beard and a book held a little too close to his chest. He has a digger's shoulders and a habit of glancing at the door before he answers anything.",
    third = "{name} met Krom Stoutarm, an Explorers' League digger who reads in the Library at Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Keep yer voice down, friend, for the librarians have ears like bats. Were ye lookin' for a book, or for me?" },
    { id = "g_lock", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ah, I know that smell o' brimstone, for I carry it myself. Sit down an' speak quietly, for no' everyone in this hall needs tae know our business." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit, then, an' mind what ye say near the curator." },
    { id = "g_tome", when = { questActive = TODO_QUEST("Tome of the Cabal") }, text = "So Strahad sent ye after the Tome, did he? I had a feelin' that old debt would walk through the door one day." },
  },
  notice = {
    { id = "n_digger", cat = "lore", when = { race = "Dwarf", ["not"] = { class = "WARLOCK" } },
      text = "A fellow dwarf, an' ye've the look o' someone who's held a shovel. Have ye dug for the League, or only for ore?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Krom Stoutarm, digger for the Explorers' League. I'm between sites just now, so I read, an' ye'd be surprised what a dwarf can learn in a library if he looks on the shelves nobody dusts." },
        { id = "h_lock", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Krom Stoutarm, digger for the League, an' somethin' else besides, as ye've guessed. The League pays for the diggin', an' what I study after hours is my own affair an' yours." },
      },
      again = {
        { id = "h_again", text = "What else? Quietly, mind." },
        { id = "h_again2", text = "Go on, the curator's lookin' the other way." },
      },
      choices = {
        { text = "Where have you dug?", next = "digs" },
        { text = "Which shelves does nobody dust?", next = "shelves" },
        { text = "You keep watching the door.", next = "door" },
        { text = "Tell me about the Tome of the Cabal.", next = "tome", when = { class = "WARLOCK", minLevel = 30 } },
        { text = "I'll let you read.", next = "END" },
      },
    },
    digs = {
      lines = { { id = "d_default", text = "Loch Modan, mostly, at Ironband's site, till the troggs came boilin' up out o' the ground an' we ran wi' what we could carry. I left a good strongbox behind in that hole, an' I think about it more than is healthy." } },
      choices = {
        { text = "What were you digging for?", next = "digs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    digs2 = {
      lines = { { id = "d2_default", text = "The same as every dwarf since Uldaman was opened, which is some sign o' the titans an' where we came from. The others want tablets an' discs for the Hall, an' I'll admit I kept an eye out for older, stranger things as well." } },
      choices = {
        { text = "Stranger than the titans?", next = "digs3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    digs3 = {
      lines = { { id = "d3_default", text = "The earth holds more than one sort o' secret, {class}, an' no' all o' it was put there by makers who meant us well. A careful dwarf learns tae tell which stones tae hand tae the curator an' which tae wrap in a cloth an' say nothin' about." } },
      choices = { { text = "I'll say nothing either. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shelves = {
      lines = { { id = "s_default", text = "The ones at the back, where the Kirin Tor's cast-offs ended up after Dalaran fell. Mae Paledust knows every book on them an' would rather she didn't, so if ye borrow from there, tell her it's for the history." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    door = {
      lines = { { id = "dr_default", text = "A habit from the digs, where the thing comin' through the tunnel was never good news. That, an' there are senators who'd take a dim view o' some o' my readin', so I like tae know who's behind me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tome = {
      lines = { { id = "t_default", text = "It's an old book o' bindin's, an' it teaches how tae call a felhunter an' keep it leashed. I had pages of it once, an' they're in the strongbox I left at Ironband's dig in Loch Modan when the troggs overran us.", fx = { learn = { "tome_of_the_cabal" } } } },
      choices = {
        { text = "Then the troggs are sitting on it.", next = "tome2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tome2 = {
      lines = { { id = "t2_default", text = "Aye, an' they've nae notion what it is, which is the one mercy in the whole business. Bring out what's in that box an' ye'll have my share o' the Tome, though I'll warn ye that mine was never the whole o' it." } },
      choices = { { text = "I'll find your strongbox. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Stoutarms have dug for the League since it was founded. I'm the only one who reads what we dig up, mind." } },
    tome_of_the_cabal = { { id = "tp_tome", text = "A book o' bindin's for the felhunter, scattered in pieces. My piece is under a great many troggs in Loch Modan." } },
    _none = { { id = "tp_none", text = "I've no' read that far, friend. Try the librarian, an' ask her nicely." } },
  },
}

-- Lago Blackwrench: gnome warlock in the Forlorn Cavern. Classic: sends young gnome warlocks to Gakin in Stormwind.
P:NPC {
  key = "if_lago", id = TODO_NPC("Lago Blackwrench"), name = "Lago Blackwrench", gender = "male",
  bible = "bibles/missed_b.md", role = "questgiver", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "dry", "watchful" }, values = { "knowledge", "caution" },
  notices = { "class", "gnome" },
  impression = {
    first = "Lago Blackwrench stands in the dim of the Forlorn Cavern with his hands clasped behind him, watching who comes down the tunnel. He speaks like an engineer giving a safety lecture, which is roughly how he thinks of demons.",
    third = "{name} met Lago Blackwrench, a gnome warlock who keeps watch in Ironforge's Forlorn Cavern.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you've lost your way to the fishing pool, it's behind you, and if you haven't lost your way, then I'm curious what you want with me." },
    { id = "g_lock", when = { class = "WARLOCK", race = "Gnome" }, text = "There you are, and about time too. I've been watching for young gnomes with that particular scorch on their sleeves, and you're the third this month." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and nothing has followed you down here, which I always check." },
    { id = "g_lamb", when = { questActive = TODO_QUEST("The Slaughtered Lamb") }, text = "You're still in Ironforge? Gakin is expecting you in Stormwind, and he's not a man who enjoys expecting." },
    { id = "g_void", when = { class = "WARLOCK", pet = { family = "Voidwalker" } }, text = "You've a voidwalker at your heel, so Gakin did his part and you did yours. Let me have a look at the binding, if it'll hold still for me." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK", ["not"] = { race = "Gnome" } },
      text = "You're a practitioner, though not one of mine. Calder teaches the tall ones in the back of Bonegrip's shop, if that's who you came for." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome", ["not"] = { class = "WARLOCK" } },
      text = "You're a long way from the bright end of Tinker Town, cousin. Most of our people prefer not to know this cavern exists." },
    { id = "n_taint", cat = "class", when = { class = "WARLOCK", taint = { min = 40 } },
      text = "Hold your hand out flat for me a moment. That tremor in the fingers isn't cold, and you'd do well to go a week without summoning anything larger than an imp." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lago Blackwrench. I study a branch of the sciences that the High Tinker's council would rather not fund, and I do it down here, where the ventilation is poor and so is the gossip." },
        { id = "h_lock", when = { class = "WARLOCK", race = "Gnome" },
          text = "Lago Blackwrench, and I look out for our people who take up the dark arts, because somebody ought to. A demon is a machine that wants to kill its operator, and I'd like you to learn that from me and not from the demon." },
        { id = "h_lockh", when = { class = "WARLOCK", race = "Human" },
          text = "Lago Blackwrench. I look after the gnomes who come down here with a demon on a leash, but a binding is a binding whoever holds it, so I'll answer your questions too." },
      },
      again = {
        { id = "h_again", text = "What else? I've nothing but time and darkness down here." },
        { id = "h_again2", text = "Go on, and do keep your voice at a reasonable volume." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "Anything further? I'd rather answer ten questions now than one after an accident." },
      },
      choices = {
        { text = "Who can teach me to bind a voidwalker?", next = "gakin", when = { class = "WARLOCK", race = "Gnome", minLevel = 10 } },
        { text = "Gakin's summoned me again. What does he want?", next = "succubus", when = { class = "WARLOCK", minLevel = 20 } },
        { text = "I've heard of a book called the Tome of the Cabal.", next = "cabal", when = { class = "WARLOCK", minLevel = 30 } },
        { text = "Give me your safety lecture, then.", next = "rules", when = { class = "WARLOCK" } },
        { text = "What exactly do you study?", next = "study" },
        { text = "This seems a gloomy place to hide.", next = "cavern" },
        { text = "A gnome warlock seems an odd thing to be.", next = "odd" },
        { text = "Who can teach me to bind a demon, and keep it bound?", next = "gakin", when = { class = "WARLOCK", race = "Gnome" } },
        { text = "I'll leave you to the dark.", next = "END" },
      },
    },
    study = {
      lines = { { id = "s_default", text = "Summoning, binding and the careful measurement of both. My people approach everything as a problem of engineering, and I've found that a summoning circle has tolerances just as a boiler does, with rather worse consequences for exceeding them." } },
      choices = {
        { text = "What happens when one fails?", next = "study2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    study2 = {
      lines = { { id = "s2_default", text = "With a boiler you lose the workshop, and with a circle you may lose the person and keep the workshop, which is worse to come home to. I've seen one failure and I don't intend to see a second, so I write every step down." } },
      choices = {
        { text = "Whose failure was it?", next = "study3" },
        { text = "Writing it down seems wise.", next = "BACK" },
      },
    },
    study3 = {
      narr = "He unclasps his hands from behind his back and looks at them, as if checking they're both still there.",
      lines = { { id = "s3_default", text = "A colleague's, in Gnomeregan, some while before the troggs. She skipped a step because she'd done it a hundred times, and the thing she was holding noticed before she did, and that's the reason I stand in this tunnel stopping young warlocks before they try anything clever on their own." } },
      choices = {
        { text = "Then it's good that you do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Everyone skips a step eventually.", next = "BACK", reply = "Yes, which is why I'd like you to skip yours here, in front of me, while I'm holding the chalk." },
      },
    },
    cavern = {
      lines = { { id = "c_default", text = "The dwarves have a practical arrangement, which is that anything they'd rather not look at goes in the Forlorn Cavern. The rogues are on one side and Bonegrip's shop is on the other, and nobody asks anybody anything." } },
      choices = {
        { text = "The dwarves don't take up warlockry themselves?", next = "dwarves" },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "dw_default", text = "Hardly ever, and the one or two who do keep very quiet about it, because to a dwarf a demon smells of the Dark Iron and Thaurissan's ruin. I know of one in the Library who digs for the Explorers' League and has never once said the word aloud, and I'll not tell you his name." } },
      choices = { { text = "I wouldn't ask you to.", next = "BACK", fx = { trait = { discreet = 1 } } }, { text = "Back to you, then.", next = "BACK" } },
    },
    odd = {
      lines = { { id = "o_default", text = "Is it? We are the most curious people on Azeroth, and curiosity doesn't stop politely at the edge of what's approved. Since the fall there are a good many more of us than there were, which I put down to grief more than to curiosity." } },
      choices = {
        { text = "Grief is a poor reason to call up demons.", next = "odd2" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    odd2 = {
      big = true,
      lines = { { id = "o2_default", text = "It is, and it's the commonest one I see. So tell me, since you've an opinion, what should I do with a grieving young gnome who's already called something up?" } },
      choices = {
        { text = "Teach them properly. They'll do it anyway.", next = "BACK", reply = "That's my policy too, and the High Tinker's council calls it encouragement.", fx = { align = { order = -1 } } },
        { text = "Report them. The city has a right to know.", next = "BACK", reply = "Then they'd hide, and a hidden warlock is the dangerous sort, but I take your point.", fx = { align = { order = 1 } } },
        { text = "I don't know. That's a hard question.", next = "BACK", reply = "It is, and I've been asking it for two years without an answer." },
      },
    },
    rules = {
      lines = { { id = "r_default", text = "Rule one, chalk your circle fresh every time, because old chalk is where things get out. Rule two, never summon tired, and rule three, if your demon is being agreeable, stop and ask yourself what it wants." } },
      choices = {
        { text = "What if it's agreeable and I can't tell why?", next = "rules2" },
        { text = "Fresh chalk, rested, suspicious. Understood.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    rules2 = {
      lines = {
        { id = "r2_imp", when = { pet = { family = "Imp" } }, text = "Then send it back and call it fresh, and see whether the new one is quite so pleasant. Your imp is listening to this, by the way, and it's not pleased with me." },
        { id = "r2_default", text = "Then send it back and call it fresh, and see whether the new one is quite so pleasant. Nine times in ten the cure is as dull as that, and the tenth time you'll be glad you did it." },
      },
      choices = { { text = "Back to my other questions.", next = "BACK" } },
    },
    gakin = {
      lines = { { id = "gk_default", text = "Not I, because I watch and I warn and that is the extent of it. You want Gakin the Darkbinder, who keeps to the cellar of a tavern called the Slaughtered Lamb in Stormwind's Mage Quarter, and he'll set you your first true binding.", fx = { learn = { "slaughtered_lamb" } } } },
      choices = {
        { text = "A tavern cellar in Stormwind?", next = "gakin2" },
        { text = "What sort of man is Gakin?", next = "gakin3" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    gakin2 = {
      lines = { { id = "g2_default", text = "The humans hide their warlocks under a public house, and we hide ours behind a fishing pool, so nobody may sneer. Take the tram from Tinker Town, be polite to Gakin, and don't touch anything on his shelves." } },
      choices = { { text = "I'll keep my hands to myself.", next = "BACK" } },
    },
    gakin3 = {
      lines = { { id = "g3_default", text = "Exacting, and a little vain about it, and very good at what he does. He'll send you out into Elwynn for something a voidwalker needs before he lets you near his circle, so go with a full belly and a spare shard." } },
      choices = { { text = "A spare shard. I'll remember.", next = "BACK" } },
    },
    succubus = {
      lines = { { id = "su_default", text = "If Gakin's sent for you a second time, it'll be about the succubus, and I'd sooner give you my warning before he gives you his instructions. A voidwalker wants to be left alone, but a succubus wants to be wanted, and she'll find the soft place in you faster than you'll find it yourself." } },
      choices = {
        { text = "How do I guard against that?", next = "succubus2" },
        { text = "I'm not that easily charmed.", next = "BACK", reply = "Everybody says that the day before, and nobody says it the day after.", fx = { trait = { witty = 1 } } },
      },
    },
    succubus2 = {
      lines = { { id = "su2_default", text = "Keep a written note of every order you give her, and read it back at night. If you find you've been giving fewer orders and more explanations, send her back to the Nether for a week, and don't let her persuade you it's cruel." } },
      choices = { { text = "Orders, not explanations. Back to the rest.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    cabal = {
      lines = { { id = "cb_default", text = "Then you've been talking to Strahad Farsan in Ratchet, or to somebody who has. The Tome teaches the felhunter, and it was torn up and scattered on purpose, which tells you how much its last owners trusted their successors." } },
      choices = {
        { text = "Where are the pieces?", next = "cabal2" },
        { text = "Another time, then.", next = "BACK" },
      },
    },
    cabal2 = {
      lines = { { id = "cb2_default", text = "In more than one place, and I'll only point you at the nearest. Krom Stoutarm in the Library knows where a piece of it went, though he'll look at the floor for a good while before he admits it.", fx = { learn = { "tome_of_the_cabal" } } } },
      choices = { { text = "I'll ask him gently.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a boiler inspector in Gnomeregan, which is better training for this work than you'd suppose." } },
    slaughtered_lamb = { { id = "tp_lamb", text = "A tavern in Stormwind's Mage Quarter with a cellar full of warlocks. Ask for Gakin the Darkbinder." } },
    tome_of_the_cabal = { { id = "tp_tome", text = "The book that teaches the felhunter, torn up and scattered by people who didn't trust their heirs. Krom Stoutarm knows something about one piece." } },
    _none = { { id = "tp_none", text = "I've no data on that, and I don't speculate without data." } },
  },
}

-- Lissyphus Finespindle: light armor merchant, Military Ward.
P:NPC {
  key = "if_lissyphus", id = TODO_NPC("Lissyphus Finespindle"), name = "Lissyphus Finespindle", title = "Light Armor Merchant", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "bright", "precise" }, values = { "craft", "good sense" },
  notices = { "class", "kit" },
  impression = {
    first = "Lissyphus Finespindle sells leather and cloth armour in the Military Ward, standing on a crate so she can see over her own counter. She measures customers by eye and announces the result before they've asked.",
    third = "{name} met Lissyphus Finespindle, a gnome who sells light armor in Ironforge's Military Ward.",
  },
  greetings = {
    { id = "g_default", text = "Hello! You're a thirty-eight in the chest, or near enough, and I've leather and cloth to fit it if you don't mind something that bends." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! You've lost a little off the waist since last time, which is what marching does." },
  },
  notice = {
    { id = "n_plate", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank when you walk, so I expect you're only passing through to the Craghelms. Do come back when your shoulders are tired of it." },
    { id = "n_rogue", cat = "class", when = { class = { "ROGUE", "HUNTER" } },
      text = "Now you look like someone who needs to move quietly. I oil all my leather so it doesn't creak, and I test each piece by sneaking up on the neighbours." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lissyphus Finespindle, light armour, which in this ward makes me the only shop that isn't selling a hundredweight of steel. A soldier who can't run is only brave, I always say, and I sell the running kind." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I've a jerkin to restitch, but it can wait." },
        { id = "h_again2", text = "Yes? Go on, I'm listening with at least one ear." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "A gnome selling armor to dwarf soldiers?", next = "dwarves" },
        { text = "Why light armor, in a ward full of plate?", next = "light" },
        { text = "Thank you, Lissyphus.", next = "END" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They were doubtful for the first month, and then the scouts and riflemen worked out that I stock their sizes and the Craghelms only stock plate. Now the mountaineers send their recruits to me before the first snow patrol." } },
      choices = {
        { text = "What do the Craghelms make of you?", next = "dwarves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves2 = {
      lines = { { id = "d2_default", text = "Olthran says leather is what you wear under real armour, and I say plate is what you wear when you've given up on dodging. We send each other customers all the same, because neither of us wants the other's stock." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "Because I carried my whole workshop out of Gnomeregan on my back, and it taught me precisely what every extra pound costs over a mile. I worked it out afterwards, and it's about seven percent more swearing per pound." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I made safety aprons for the workshops back home. Armour is the same idea, only the accidents are on purpose." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, I'm afraid. If it doesn't have a seam, I haven't studied it." } },
  },
}

-- Lyon Mountainheart: a dwarf who reads in the Library, Hall of Explorers.
P:NPC {
  key = "if_lyon", id = TODO_NPC("Lyon Mountainheart"), name = "Lyon Mountainheart", gender = "male",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "ironforge" }, temper = { "thoughtful", "kindly" }, values = { "history", "patience" },
  notices = { "lore", "race" },
  impression = {
    first = "Lyon Mountainheart stands at a reading desk in the Library with three books open at once and a cold mug at his elbow. He looks up slowly, like a dwarf surfacing from a very deep shaft.",
    third = "{name} met Lyon Mountainheart, a dwarf scholar who reads in the Library at Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hm? Oh, good day tae ye. Forgive me, I was three hundred years away, an' it takes a moment tae climb back." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yourself again. I'm on the same page as when ye left, I'm ashamed tae say." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Which clan are ye, {g:lad|lass}? Never mind, ye needn't say, but I've a shelf here on every hold in Khaz Modan if ye're ever curious about yer own beard." },
    { id = "n_mage", cat = "lore", when = { class = "MAGE" },
      text = "A mage in the Library, an' I'd guess ye read faster than I do. Leave some o' the books for the rest of us." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lyon Mountainheart. I'm no' a prospector nor a curator, only a dwarf who likes tae know how things came tae be, an' the League is good enough tae let me stand here an' find out." },
      },
      again = {
        { id = "h_again", text = "What else would ye like tae know?" },
        { id = "h_again2", text = "Ask away, the books will keep." },
      },
      choices = {
        { text = "What are you reading?", next = "reading" },
        { text = "The Library seems busier than a dig site.", next = "library" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },
    reading = {
      lines = { { id = "r_default", text = "Three accounts o' the War of the Three Hammers, an' no two o' them agree on who struck first. A Bronzebeard wrote one, a Wildhammer another, an' the third was copied from a Dark Iron stone, which is the one I trust least an' learn most from.", fx = { learn = { "three_hammers" } } } },
      choices = {
        { text = "Why learn most from the one you trust least?", next = "reading2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reading2 = {
      lines = { { id = "r2_default", text = "Because a liar still tells ye what he's ashamed of, by what he leaves out. The Dark Iron account never once mentions how Thaurissan's summonin' ended, an' that silence is louder than a page o' boastin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    library = {
      lines = { { id = "l_default", text = "It always is when the passes are snowed in, for every prospector home from the field comes tae argue over his findin's. Curator Thorius keeps the peace, an' Mae Paledust keeps the books from walkin' out the door under somebody's cloak." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a clerk tae the Senate for forty years, an' when I retired I came here tae read what the minutes left out." } },
    three_hammers = { { id = "tp_th", text = "Bronzebeard, Wildhammer an' Dark Iron fought for this mountain after old King Anvilmar died. We won, an' we've been payin' for it since." } },
    _none = { { id = "tp_none", text = "I've no' come tae that chapter yet, I fear. Ask the librarian, for she's read further than I have." } },
  },
}

-- Maeva Snowbraid: robe merchant, Maeva's Mystical Apparel, Mystic Ward.
P:NPC {
  key = "if_maeva", id = TODO_NPC("Maeva Snowbraid"), name = "Maeva Snowbraid", title = "Robe Merchant", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "warm", "frank" }, values = { "craft", "family" },
  notices = { "class" },
  impression = {
    first = "Maeva Snowbraid keeps Maeva's Mystical Apparel in the Mystic Ward, where the robes hang in rows by colour and every one has deeper pockets than it looks. She has a white braid down to her belt and an eye that sizes a customer in one pass.",
    third = "{name} met Maeva Snowbraid, who sells robes at Maeva's Mystical Apparel in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Come in out o' the draught, dear. Robes for priests an' mages an' anyone else who'd sooner be comfortable than armoured." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again, dear. Has it held up, or did ye go an' set fire tae the sleeves like the rest o' them?" },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Now there's someone who'll appreciate a proper robe. Turn round an' let me see how that one hangs, for I can tell from here it was cut for someone taller." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye'll no' fit a robe over all that iron, dear, but ye're welcome tae look. Even a soldier needs somethin' soft for the feast days." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maeva Snowbraid, an' the shop's my own, name over the door an' all. The priests o' the Hall of Mysteries are my best customers, an' the mages are my most frequent, because the mages keep scorchin' theirs." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye, dear?" },
        { id = "h_again2", text = "Go on, I'm only pinnin' a hem." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "What makes a good robe?", next = "robe" },
        { text = "Is Poranna Snowbraid a relation of yours?", next = "poranna" },
        { text = "Good day, Maeva.", next = "END" },
      },
    },
    robe = {
      lines = { { id = "r_default", text = "Pockets, dear, an' more o' them than ye think ye need. After that it's a hem that clears the ground by two fingers, for I've seen a mage trip on his own skirts in the middle of a spell, an' the wall still has the mark." } },
      choices = {
        { text = "What do priests ask for?", next = "robe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    robe2 = {
      lines = { { id = "r2_default", text = "Somethin' plain that doesnae show the blood, bless them, for they're forever kneelin' beside the wounded. High Priest Rohan has worn the same cut for thirty years, an' I've stopped tryin' tae talk him intae a bit o' trim." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    poranna = {
      lines = { { id = "p_default", text = "She's kin, aye, an' she keeps the tailorin' supplies at Stonebrow's by the Great Forge. I buy my thread from her an' she tells me I'm overchargin' for my robes, an' that's how Snowbraids show affection." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned tae sew mendin' my brothers' minin' shirts, an' robes are a good deal more pleasant tae handle." } },
    _none = { { id = "tp_none", text = "I couldnae say, dear. Ask one o' the priests in the Hall, for they know more than a seamstress does." } },
  },
}

-- Mangorn Flinthammer: heavy armor merchant in the Commons. Stands with Raena.
P:NPC {
  key = "if_mangorn", id = TODO_NPC("Mangorn Flinthammer"), name = "Mangorn Flinthammer", title = "Heavy Armor Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "gruff", "steady" }, values = { "craft", "family" },
  notices = { "class", "kit" },
  impression = {
    first = "Mangorn Flinthammer sells mail and plate in the Commons, and he raps each breastplate with his knuckles to let the customer hear it ring. He is a broad, slow-spoken dwarf who looks at his wife before he names a price.",
    third = "{name} met Mangorn Flinthammer, who sells heavy armor in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, friend. Mail an' plate on my side, an' if ye want somethin' lighter, Raena has the leather an' cloth." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' still in one piece, so the armour's doin' its work." },
  },
  notice = {
    { id = "n_heavy", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "That pauldron's sittin' low on the left, {class}. Somebody's hit ye there more than once, an' the strap's stretched." },
    { id = "n_green", cat = "class", when = { maxLevel = 10 },
      text = "First trip tae the city, is it? Don't buy more steel than ye can carry up the hill tae Kharanos, for I've seen lads try." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mangorn Flinthammer, an' I sell armour that turns a blade, right here by the gates where every recruit passes on the way in. My wife Raena has the other half o' the shop an' the better half o' the wits." },
      },
      again = {
        { id = "h_again", text = "Aye, what else?" },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Why set up in the Commons and not the Military Ward?", next = "commons" },
        { text = "You and Raena split the shop between you.", next = "raena" },
        { text = "Good day, Mangorn.", next = "END" },
      },
    },
    commons = {
      lines = { { id = "c_default", text = "Because the soldiers in the Military Ward already have their kit, an' the ones comin' through the gates don't. A {g:lad|lass} walks in from Coldridge wi' a wooden shield an' a brave face, an' the first thing they see is us." } },
      choices = {
        { text = "What do you tell the new ones?", next = "commons2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    commons2 = {
      lines = { { id = "c2_default", text = "Tae buy the helmet first an' the fancy shoulders last, for a trogg's club comes down on the head an' doesnae care how ye look. Most o' them buy the shoulders anyway, an' come back for the helmet wi' a bandage on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    raena = {
      lines = { { id = "r_default", text = "Aye, an' it's kept the peace for a good many years. I thought leather was for boots when I married her, an' she's sold more o' it tae hunters an' scouts than I've sold plate, so I've learned tae hold my tongue." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Flinthammers have fitted armour in Ironforge for five generations, an' I was hammerin' rivets before I could grow a beard." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. Ask Raena, for she hears all the talk at the gates." } },
  },
}

-- Raena Flinthammer: light armor merchant in the Commons. Stands with Mangorn.
P:NPC {
  key = "if_raena", id = TODO_NPC("Raena Flinthammer"), name = "Raena Flinthammer", title = "Light Armor Merchant", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "quick", "cheerful" }, values = { "family", "good sense" },
  notices = { "class" },
  impression = {
    first = "Raena Flinthammer sells leather and cloth armour in the Commons, across the shop from her husband's plate. She talks twice as fast as he does and seems to know the business of everyone who has come through the gates this week.",
    third = "{name} met Raena Flinthammer, who sells light armor in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hello, dear! Leather an' cloth on this side, an' ye can ignore my husband frownin' at ye, for he frowns at everyone who doesnae clank." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! I told Mangorn ye'd be back, an' he owes me a pint." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "ROGUE" } },
      text = "Ye walk soft, I see, so ye'll be one o' mine. Come an' feel this hide, for it came off a Dun Morogh bear an' it'll outlast ye." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST" } },
      text = "Ye'll want the cloth, dear, an' I've some fine wool in. Maeva in the Mystic Ward has the grand robes, but mine'll keep ye warm on the road." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Raena Flinthammer, an' I sell the armour ye can actually run in. Mangorn has the mail an' plate over there, an' between us there's no' a soul comes through the gates we cannae dress." },
      },
      again = {
        { id = "h_again", text = "What else, dear?" },
        { id = "h_again2", text = "Go on, I've always time for a blether." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What's the talk at the gates this week?", next = "talk" },
        { text = "Mangorn says you have the better half of the wits.", next = "mangorn" },
        { text = "Good day, Raena.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "Troggs, dear, the same as last week, for they've dug intae another quarry out past Gol'Bolar an' the miners are furious. An' the gnomes are sayin' there's lights movin' behind the gates o' Gnomeregan again, though the gnomes say a great many things." } },
      choices = {
        { text = "Do you believe the gnomes?", next = "talk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk2 = {
      lines = { { id = "t2_default", text = "I believe they want their home back, the poor wee things, an' wantin' makes folk see lights. I sold a jerkin tae one who's goin' back in tae look, an' I put an extra layer in the chest an' didnae tell him." } },
      choices = { { text = "That was kindly done. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    mangorn = {
      lines = { { id = "m_default", text = "He said that tae a stranger? Well, he's right, but don't tell him I agreed. He's the best armourer in the Commons an' the worst haggler in Khaz Modan, so I do the sums an' he does the hammerin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a tanner's daughter from Kharanos before I was a Flinthammer, so I've had my hands in hides all my life." } },
    _none = { { id = "tp_none", text = "Now that I havenae heard, an' it's no' often I say so. Ask at the inn, dear." } },
  },
}
