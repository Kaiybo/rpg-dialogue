-- Baros Alexston, City Architect, City Hall in Cathedral Square. Voice: bibles/baros.md
-- Built Stormwind beside VanCleef. Took the post when VanCleef took to the hills.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baros", id = TODO_NPC("Baros Alexston"), name = "Baros Alexston", title = "City Architect",
  rivals = { "katrana" },
  bible = "bibles/baros.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "proud" }, values = { "ambitious", "honest" },
  notices = { "westfall", "stone", "lock_shards" },
  impression = {
    first = "He keeps his plans close and his Westfall past closer.",
    third = "{name} met Baros Alexston, Stormwind's City Architect, a careful man of Westfall birth.",
  },

  greetings = {
    { id = "hum_g1", when = { race = "Human" }, priority = 5,
      text = "A Stormwind citizen in the Architect's office, and not to complain about a drain, I hope. Sit, if you can find a chair under the plans." },
    { id = "hum_g2", when = { race = "Human", npcFlagBefore = "baros_hu_soft" }, priority = 10,
      text = "Ah, the one who gave me the idea about the ledger. I've been reading masons' marks on my walk to work, and I'm late every morning now." },
    { id = "g_nelf", when = { race = "NightElf" }, priority = 5,
      text = "Careful of the plans, friend; those are the Mage Quarter's new drains, which I gather your city has no need of. Ishnu-alah, is it? I've been practising." },
    { id = "g_nelf_soft", when = { race = "NightElf", npcFlagBefore = "baros_nelf_soft" }, priority = 10,
      text = "Ah, my conscience from Darnassus. Come in, and mind the drains; I've stopped writing to your city about timber, if that's what you've come to check." },
    { id = "g_op_nobles_just", when = { opinion = { topic = "defias", stance = "nobles_justified" } }, text = "You're the one who thinks the lords did what they could. Come and look at my ledgers some day, friend, and tell me again." },
    { id = "g_plans", text = "Careful of the plans. Those are the Mage Quarter's new drains." },
    { id = "g_letter", when = { questActive = TODO_QUEST("The Unsent Letter") }, text = "A letter, for me, and from whom? Let me sit down before I open it." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Unsent Letter") }, text = "You, yes. I've thought about that letter every day since." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and in that time I've redrawn the Mage Quarter's drains twice. This city never stops needing mending." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown harder since we last spoke, and I know the look. I've seen it on men who built walls and then had to stand on them." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been doing honest work for the city these past days. Honest work goes unpaid more often than not in Stormwind, so you'll at least have my thanks." },
  },

  notice = {
    { id = "n_westfall", cat = "westfall", when = { visited = "Sentinel Hill" },
      text = "You've Westfall dust on your boots; I'd know it anywhere, because I grew up in it on the Alexston farm. Is the old house still standing?" },
    { id = "n_dwarf", cat = "stone", when = { race = "Dwarf" },
      text = "A dwarf! Tell me as a stoneworker, are the Cathedral's flying buttresses too much? Every dwarf I ask says too much." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Something in your pack is cold enough that I felt it across the table, and it hums very faintly, like a crack in a foundation before it gives. I've drawn over enough of the Lamb's cellars to know what you're carrying, so mind you don't set it down on my plans." },
  },

  start = "hello",
  nodes = {
    op_nobles = {
      lines = {
        { id = "op_nobles_a", text = "Every morning, when I walk past the House and see the new gilt on its doors. I've kept my office by never saying so aloud, so I'll turn it round on you: what do you make of the lords who rule this city?" },
      },
      choices = {
        { text = "They cheated honest men. The House should answer for it.", next = "op_nobles_1", fx = { opinion = { stormwind = "abandoned_its_own", defias = "masons_wronged" }, align = { order = -1 }, affinity = 1 } },
        { text = "The crown was broke after the war. The lords did what they could.", next = "op_nobles_2", fx = { opinion = { stormwind = "patience", defias = "nobles_justified" }, align = { order = 1 } } },
        { text = "Lords and masons both did wrong. Westfall's paying for all of it.", next = "op_nobles_3", fx = { opinion = { defias = "sympathetic", westfall = "abandoned" }, trait = { skeptical = 1 } } },
        { text = "My House voted against you. I'm ashamed of it.", next = "op_nobles_4", when = { origin = "human_minor_noble" }, fx = { opinion = { stormwind = "abandoned_its_own" }, affinity = 2 } },
        { text = "I'd rather not judge the lords, Master Alexston.", next = "BACK" },
      },
    },
    op_nobles_1 = {
      lines = { { id = "op_nobles_r1", text = "Say it more quietly, friend, at least within these walls. You're right, and being right never yet paid a mason or saved one from the Stockade." } },
      choices = { { text = "Let's talk of something else.", next = "BACK" } },
    },
    op_nobles_2 = {
      lines = { { id = "op_nobles_r2", text = "So the clerks told us, and then the same lords built summer houses on the lake. I'll not quarrel with you, because I signed the ledgers myself, but I'd like you to see one of those houses some day." } },
      choices = { { text = "Let's talk of something else.", next = "BACK" } },
    },
    op_nobles_3 = {
      lines = { { id = "op_nobles_r3", text = "That's the sum of it, and it's the one sum nobody in this city wants to check. My family's farm is ash out there, so I know who's paying." } },
      choices = { { text = "Let's talk of something else.", next = "BACK" } },
    },
    op_nobles_4 = {
      lines = { { id = "op_nobles_r4", text = "That's more than any lord has ever said to me, and I'll remember it. Shame won't buy back the farms, but it's a better start than gilt." } },
      choices = { { text = "Let's talk of something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'm not sure I would. Half these walls were raised by men we never paid, and if the stone remembers that, it has better manners than they do." } },
      choices = {
        { text = "The stone holds the city up. Trust what was built properly.", next = "BACK", reply = "It was built properly, every course of it, and I made sure of that myself. The stone's never been the problem; the ledgers were.", fx = { align = { order = 1 } } },
        { text = "The stone remembers the debt. Pay the masons and be done with it.", next = "BACK", reply = "If only it were that simple, friend. I've said it to the House a dozen times, and they nod and send for the next petition.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Older cellars than anyone admits to, cut before the city was rebuilt, and the Lamb's crypt is the deepest of them. I drew new streets over half of Stormwind after the Horde burned it, but the Quarter's masters wouldn't let my men dig below a certain line, and I've learned not to ask builders' questions of people who answer with fire." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Older cellars than anyone admits to, and the Lamb's crypt is the deepest of them, which your servant seems to know already from the way it keeps looking at the floor. The Quarter's masters wouldn't let my men dig below a certain line, and having seen that thing up close, I'm beginning to understand why." },
      },
      choices = {
        { text = "Then keep the plans closed. Some doors should stay forgotten.", next = "BACK", reply = "They do, and I'll sleep easier for it. There are doors down there that I'd rather nobody remembered, even me.", fx = { align = { order = 1 } } },
        { text = "Show me the old plans, Baros. I'll find those doors myself.", next = "BACK", reply = "You'll not find them in this office, and if you go poking under the Lamb, you'll be on your own when the floor gives.", fx = { align = { order = -1 } } },
        { text = "Something else, Baros.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Park, and precious little else, because the nobles wanted halls and the masons gave them halls. I grew up on a Westfall farm, and some nights I think I built a city that has forgotten where its bread comes from." } },
      choices = {
        { text = "Stone and law keep people safe. The fields can look after themselves.", next = "BACK", reply = "That's what the House told me when they cut the gardens from my drawings. I suppose I lost that argument too.", fx = { align = { order = 1 } } },
        { text = "Then tear up a street or two and let the land back in.", next = "BACK", reply = "Ha! I'd love to, and the nobles would hang me from my own scaffolding before the first cobble came up.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Edwin did, and every mason who walked out with him, and they took the plans in their heads, so the Defias come and go under this city as they please. I gave SI:7 copies of the old plans, though I suspect Shaw had them before I did." } },
      choices = {
        { text = "Then the plans should be locked away, and the drains watched.", next = "BACK", reply = "They are, as well as I can manage. Edwin knows those tunnels better than any guard, though, because he dug half of them.", fx = { align = { order = 1 } } },
        { text = "Every city needs back doors. Leave some of them open.", next = "BACK", reply = "Edwin would agree with you, and look what he does with the ones he kept. I'll keep mine shut, thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Spilled reagents, mostly, and whatever the apprentices pour down the gutters when their masters aren't looking. The stone was laid for rain, not arcane runoff, though nobody on the council wants to pay for the difference." } },
      choices = {
        { text = "The Quarter should answer to the city's rules like anyone else.", next = "BACK", reply = "They should, and I've the petitions to prove I've asked. The Sanctum sends back very polite notes that say nothing at all.", fx = { align = { order = 1 } } },
        { text = "Mages have better things to worry about than mortar.", next = "BACK", reply = "Until their tower leans, and then it's my fault for the mortar. Mark my words, they'll be in this office within the year.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The gates, always, because every wall I've drawn means nothing if the gate gives. The old city fell from the inside, though, so I check every street I lay out for where a mob could gather." } },
      choices = {
        { text = "A gate is only as good as the soldier standing in it.", next = "BACK", reply = "Aye, that's so, and the best gate in the world won't hold if the man behind it doesn't. Still, I'd rather give him good stone to stand behind.", fx = { align = { order = 1 } } },
        { text = "Stone does the work. Soldiers just fill the gaps.", next = "BACK", reply = "Spoken like a mason's son, and I'll not argue. Just don't say it in front of the Stormwind Guard; they're touchy about it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Room is the one thing I never have enough of, friend. The stable master on the east side manages, but I've had three petitions this month about wolves in the Trade District, and I didn't draw a single kennel." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Room is the one thing I never have enough of, friend. I'd sooner the beasts had the hills than the alleys, but {pet} looks better kept than most of my masons. Mind it doesn't chew the scaffolding; the masons have enough to complain about without that." },
      },
      choices = {
        { text = "A city should make room for the ones who keep its roads safe.", next = "BACK", reply = "That's what I keep telling the House, and they keep telling me wolves stain the cobbles. I'll keep trying, for what it's worth.", fx = { align = { order = 1 } } },
        { text = "Beasts belong outside the walls. Mine waits by the gate.", next = "BACK", reply = "You'd make my life a great deal easier if every hunter in this city thought the same. The stable master would thank you too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not often, though I drew half its buttresses myself. Every stone in it was set by a man still waiting for his wages, and I find it hard to kneel on something that was never paid for." } },
      choices = {
        { text = "The faith in those stones is real, whoever paid for them.", next = "BACK", reply = "That's a kinder thought than I can manage, and maybe a truer one. I'll think on it, though I still won't kneel there.", fx = { align = { light = 1 } } },
        { text = "Then it's a monument to a lie, and I won't pray there either.", next = "BACK", reply = "I didn't say it was a lie, only that it's unpaid. The masons' work was honest, even if the House wasn't. Still, I take your meaning.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Wages paid, and a word from the House admitting the masons were wronged, and neither will ever happen. Instead the masons took to the hills of Westfall, and now the crown calls them bandits and sends soldiers after them." } },
      choices = {
        { text = "The law must deal with the Defias, whatever the House owes.", next = "BACK", reply = "It must, and I'll not pretend otherwise, for they've killed men who had nothing to do with the debt. But the House made them, all the same.", fx = { align = { order = 1 } } },
        { text = "When the law cheats men, they've a right to take what's theirs.", next = "BACK", reply = "That's Edwin's own argument, word for word, and it's led to Moonbrook and blood on the road. Be careful whose words you borrow.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bx_nelf = {
      lines = {
        { id = "bxn_default", key = true,
          text = "Envy and exasperation, in equal parts. They grew a city on a tree without one mason or one nail, and they sit on the finest timber in the world in Ashenvale and won't sell a plank of it to their own allies." },
        { id = "bxn_dwarf", when = { race = "Dwarf" },
          text = "About what you'd make of a people who live in a tree, I expect. They grew a city without one mason, and they sit on the finest timber in the world and won't sell a plank of it to their own allies." },
      },
      choices = {
        { text = "Why won't they sell?", next = "bx_nelf_2" },
        { text = "Elwynn has forests enough, surely.", next = "bx_nelf_2" },
      },
    },
    bx_nelf_2 = {
      big = true,
      lines = {
        { id = "bxn2_default",
          text = "They say the trees are sacred, and I believe they mean it, because I've seen their envoys look at a Stormwind roof beam the way a priest looks at a broken altar. Meanwhile the Warsong cut Ashenvale by the cartload, so the only folk who don't get the timber are the ones who'd pay for it." },
      },
      choices = {
        { text = "Their forest, their choice. You should respect it.", next = "BACK",
          reply = "I do respect it, in the way I respect a cliff I can't build on. It's a very fine cliff, I'll give it that.",
          fx = { align = { honor = 1 }, opinion = { night_elves = "respect" } } },
        { text = "Allies who won't trade aren't much of allies.", next = "BACK",
          reply = "That's what the House of Nobles says, only louder and with worse grammar. I'll admit I've said it myself, after a long day.",
          fx = { align = { honor = -1 }, opinion = { night_elves = "distrust" } } },
        { text = "Something else, Architect.", next = "BACK" },
      },
    },
    bx_xnelf = {
      lines = {
        { id = "bxx_default", key = true,
          text = "Not a grievance, only a disappointment. I wrote to Darnassus once, very politely, asking whether a few fallen Ashenvale oaks might be sold for the city's rebuilding, and the answer came back that the trees were not ours to buy and the forest was not theirs to sell." },
      },
      choices = {
        { text = "Did that answer make sense to you, Architect?", next = "bx_xnelf_2" },
        { text = "You'd never sell the Cathedral's stones. It's the same for us.", tag = "Persuade", next = "bx_xnelf_soft",
          check = { pass = { any = { { disposition = { min = 55 } }, { questDone = TODO_QUEST("The Unsent Letter") }, { class = "DRUID" } } } },
          fail = { next = "bx_xnelf_fail", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bx_xnelf_2 = {
      lines = {
        { id = "bxx2_default",
          text = "As much as a poem makes sense to a man with a ledger, which is to say I admired it and couldn't use it. I've spent my life deciding which trees become houses, and your people seem to think the question is rude." },
      },
      choices = {
        { text = "It is rude, to us. Something else.", next = "BACK" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    bx_xnelf_soft = {
      lines = {
        { id = "bxs_default", key = true, fx = { npcFlag = { set = { "baros_nelf_soft" } } },
          text = "That's fair, and it stings a little that I didn't see it myself. I'd break the man who tried to sell a stone from the Cathedral, and I've been asking your people to sell me their chapel by the plank." },
      },
      choices = {
        { text = "Then we understand each other, Architect.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bx_xnelf_fail = {
      lines = {
        { id = "bxf_default", text = "Prettily said, but a forest isn't a cathedral, whatever the druids tell you. Come back when I've had more sleep, and I may agree with you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    bx_nsoft = {
      lines = {
        { id = "bxns_default", text = "Only the way a man dreams of a ship he'll never own. I've started drawing Elwynn pine into the plans again, and it's honest wood, even if it creaks." },
      },
      choices = {
        { text = "Honest wood suits an honest city. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    hu_stones = {
      lines = {
        { id = "hum_stones", key = true,
          text = "Lordaeron's gold paid for the first of it, the House of Nobles promised the rest, and the masons were last in line when the purse ran dry. I took the city's post when it was offered, Edwin took his men west, and both of us have been living with that choice since." },
      },
      choices = {
        { text = "You could have stood with the masons.", next = "hu_stones2" },
        { text = "It wasn't your purse to open, Architect.", next = "hu_stones2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_stones2 = {
      big = true,
      lines = {
        { id = "hum_stones2",
          text = "I could have, and I didn't, and I tell myself a city needs an architect more than a riot needs another mason. The trouble is that every human in Stormwind thinks the same way, friend: someone else will see to it, someone else will pay, and the masons are still waiting." },
      },
      choices = {
        { text = "Then pay your debt now. Speak for them at the House.", next = "BACK",
          reply = "To the House of Nobles? They'd hear me out and then commission a fountain. Still, I'll write again, and this time I'll sign it plainly.",
          fx = { align = { honor = 1 } } },
        { text = "You chose the safe road. Most of us would.", next = "BACK",
          reply = "Most of us would, which I find is no comfort at all. Thank you for not pretending otherwise.",
          fx = { align = { honor = -1 } } },
        { text = "The Stonemasons deserve their names on these walls.", tag = "Persuade", next = "hu_stones_soft",
          check = { pass = { any = { { disposition = { min = 55 } }, { questDone = TODO_QUEST("The Unsent Letter") }, { townStanding = { town = "stormwind", min = 30 } } } } },
          fail = { next = "hu_stones_fail", fx = { affinity = -1 } } },
      },
    },
    hu_stones_soft = {
      lines = {
        { id = "hum_soft", key = true, fx = { npcFlag = { set = { "baros_hu_soft" } } },
          text = "That's a thought I should have had years ago. Every mason marks his stone low down, where the nobles never look, and I keep a ledger of whose mark is whose that I've only ever treated as accounts." },
      },
      choices = {
        { text = "Then it's a roll of honour. Keep it safe.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_stones_fail = {
      lines = {
        { id = "hum_fail", text = "A pretty sentiment, and the House would carve it in marble and send the masons the bill. Come back when you've seen Westfall, and we'll speak of debts." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll let you work, Architect.", next = "END" },
      },
    },
    hu_marks = {
      lines = {
        { id = "hum_marks", text = "There's a hammer and star on the Cathedral steps that belonged to a man I trained, and I stood on it for ten years without knowing. I've started copying the marks into a clean book, for whatever good it does." },
      },
      choices = {
        { text = "It does some good. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    hello = {
      lines = {
        { id = "hum_h1", when = { race = "Human" },
          text = "You walk these streets every day, I expect, and never look at them, which is the highest compliment a citizen can pay an architect. Every one of those stones was laid by a Stormwind man, and too many of those men went unpaid." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A kaldorei in the Architect's office. I'd ask how Darnassus was built, but I'm told it wasn't built at all, which is the sort of thing that keeps an architect up at night." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "You have Lady Prestor's ear, I hear, and I'd ask you to be careful with it. When the court is pleased with someone, the rest of us in this office usually find out what it costs." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Word is that Lady Prestor found you tiresome. Don't repeat this, but you're in good company: the court said the same of every mason who asked to be paid." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The masons raised the Cathedral before the House refused to pay them, so I can't look at it the way you do." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The Silver Hand speaks often of justice, so I'd be curious to hear what you think is owed to the men who rebuilt this city." },
        { id = "h_default", text = "Baros Alexston, City Architect. Every street you walked to get here, someone drew first, and usually it was me." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("The Unsent Letter") },
          text = "That's Edwin's hand; I'd know it in the dark. We drew half this city together, once, and he never sent it. Of course he never sent it." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Unsent Letter"), days = 3 } },
          text = "I'll see the right people read it, and then I'll go home and not sleep. He wrote it and never sent it, which is Edwin all over." },
        { id = "h_deadmines", when = { deed = "dungeon:The Deadmines" },
          text = "You've been under Moonbrook. Did you see the work down there? No, don't answer, because I know it was good work, and that's what hurts." },
        { id = "h_masons", when = { heardLine = "gryan.l_known" },
          text = "So Stoutmantle told you about the Stonemasons. Yes, I was one, and I took the post when Edwin took the road. Ask me which of us was the coward." },
        { id = "h_compass", tags = { "news" }, when = { questActive = TODO_QUEST("Humble Beginnings") },
          text = "My family's old house is west of Sentinel Hill, and Father swears the chest is still there under the char. It holds a boy's compass, worth nothing to anyone, but bring it anyway." },
        { id = "h_thredd", tags = { "news" }, when = { questActive = TODO_QUEST("Bazil Thredd") },
          text = "Thredd was Edwin's lieutenant, taken in the riots and all but forgotten in the Stockade since. If anyone knows what Edwin set moving, it's him." },
        { id = "h_maelik", tags = { "news" }, when = { questActive = TODO_QUEST("The Curious Visitor") },
          text = "Thelwater's description, and the name Maelik? No, I know neither the name nor the face. It could be any mason who walked out with Edwin, or someone who never held a chisel." },
        { id = "h_shaw", when = { questActive = TODO_QUEST("Shadow of the Past") },
          text = "Take it to Mathias Shaw, in Old Town. He owes me a favour. Don't ask what for; he'd prefer I forgot, and I've very nearly managed." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("An Audience with the King") },
          text = "My report is sealed, and with the King away, Lady Prestor will receive it for the crown. She'll know what to do with it; she always seems to." },
        { id = "h_lescovar", tags = { "news" }, when = { questActive = TODO_QUEST("Brotherhood's End") },
          text = "I heard Lord Lescovar was found dead. I won't ask. I'll only say I've slept better this week than in years." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk like someone who knows which drains run under which streets, and very few people do, because I drew most of them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, good. Your Quarter's drains are giving me headaches, because something in them keeps eating the mortar." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good; I draw walls, but someone has to stand on them, and the drawings never mention how cold it gets up there." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, back from the hills. Did you come in through the Valley of Heroes? Do the statues look right from the road, or did I set them too far back?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in my streets. I laid most of these stones myself, and I can't help wondering what someone who shapes living things makes of them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've chalk dust on your cuffs and a cellar's chill about you. The Slaughtered Lamb sits on foundations I've never been allowed to survey, and I'd wager you know why." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who talks to stone, they tell me. I've spent my life telling stone where to go, and it has never once answered back." },
      },
      again = {
        { id = "h_again", text = "What else? I've drains to redraw." },
        { id = "h_again2", text = "Go on; the plans will keep, as they always do." },
      },
      choices = {
        { text = "You sound as if you knew VanCleef.", next = "edwin", when = { any = { { deed = "dungeon:The Deadmines" }, { questActive = TODO_QUEST("The Unsent Letter") }, { heardLine = "gryan.l_known" } } } },
        { text = "Tell me about the city.", next = "city" },
        { text = "You don't sound like you were born in the city.", next = "farm" },
        { text = "My family farmed Westfall too.", next = "westfall_kin", when = { origin = "human_westfall_farmhand" } },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Your arches are fair work, for human stone.", next = "dwarf_stone", when = { race = "Dwarf" } },
        { text = "My father was a Stonemason. He was never paid either.", next = "mason_child", when = { origin = "human_stonemason_child" } },
        { text = "Who else knows the city's drains as well as you do?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Something's eating the Mage Quarter's mortar.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which part of the city would you hold first, Architect?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the city have room left for a hunter's beasts, Architect?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever pray in the Cathedral you helped build?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would justice look like for the Stonemasons, Architect?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Did you leave room for anything green when you drew the city, Architect?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What lies beneath the Mage Quarter that even you won't map, Baros?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would you like to know what the stone of this city thinks, Baros?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "What does an architect make of the night elves?", next = "bx_nelf" },
        { text = "You seem to have a grievance with Darnassus, Architect.", next = "bx_xnelf", when = { race = "NightElf" } },
        { text = "Still dreaming of Ashenvale oak, Architect?", next = "bx_nsoft", when = { race = "NightElf", npcFlagBefore = "baros_nelf_soft" } },
        { text = "You built this city, Architect. Who paid for it?", next = "hu_stones", when = { race = "Human" } },
        { text = "Still reading the masons' marks, Architect?", next = "hu_marks", when = { race = "Human", npcFlagBefore = "baros_hu_soft" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    edwin = {
      big = true,
      lines = {
        { id = "e_default", key = true, text = "We rebuilt this city together, and the nobles wouldn't pay. Edwin raised his voice and got a riot. I kept my head down and got this office." },
      },
      choices = {
        { text = "You made the right choice.", next = "BACK", reply = "I'd like to believe it. Most nights I do, and the other nights I sit here and draw walls I'll never build.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "He had a point about the nobles.", next = "point", fx = { align = { honor = 1, order = -1 } } },
      },
    },
    point = {
      lines = { { id = "p_default", text = "He did. That's the trouble with Edwin. He always had a point, and he always took it too far." } },
      choices = {
        { text = "Do you still blame the House of Nobles?", next = "op_nobles" },
        { text = "Too far how?", next = "riot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riot = {
      big = true,
      lines = { { id = "ri_default", text = "The riot. The queen came down into the street to calm us, because she was the one at court who'd argued we be paid, and someone threw a stone that killed her." } },
      choices = {
        { text = "Was it a mason?", next = "riot_after" },
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    riot_after = {
      lines = { { id = "ra_default", text = "No one ever said. Thredd was taken in the riots and Edwin led the rest out of the city, and I was offered an office, and I took it.",
        fx = { learn = { "defias" } } } },
      choices = {
        { text = "That doesn't make you a coward.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "c_default", text = "The orcs burned the old Stormwind to the ground. Every wall you see is new. Ask who was paid for them, and watch the room go quiet." },
      },
      choices = {
        { text = "Who was paid?", next = "city_paid" },
        { text = "It's beautiful work.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    city_paid = {
      lines = { { id = "cp_default", text = "Not the guild. A few senior masons were offered posts instead of wages; I took mine, and Edwin refused his for the sake of the rest. Make of that what you like." } },
      choices = {
        { text = "He was loyal to them.", next = "BACK", fx = { opinion = { defias = "masons_wronged" }, learn = { "defias" } } },
        { text = "You had to live too.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    farm = {
      lines = { { id = "f_default", text = "I grew up in Westfall, on the Alexston farm west of Sentinel Hill. The Defias burned the house and moved in, and my father hid what he could before he fled.",
        fx = { learn = { "westfall" } } } },
      choices = {
        { text = "Is anything left?", next = "farm_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_father = {
      lines = { { id = "ff_default", text = "My father says my first compass is still in a chest under the ash. It's useless to me now, but I think about it more often than the Cathedral." } },
      choices = { { text = "Maybe someone could fetch it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },

    westfall_kin = {
      lines = { { id = "wk_default", text = "Then we've both lost a farm to the same men, perhaps to masons I once worked beside. I'm sorry for that, and I mean it." } },
      choices = { { text = "It's not your doing.", next = "BACK", fx = { affinity = 2 } }, { text = "Your friends did it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } } },
    },

    noble = {
      lines = { { id = "n_default", text = "Then your family's House voted not to pay mine. Don't apologise; you weren't there. Just remember it, next time they vote." } },
      choices = {
        { text = "I'll remember.", next = "BACK", reply = "Thank you. That's all I ask of anyone, and more than most will give.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My family's votes are their business, not my debt.", next = "BACK", reply = "Maybe so. But a House that never feels its debts is how we got Westfall, and I'd hoped for better from you.", fx = { align = { honor = -1 } } },
      },
    },
    dwarf_stone = {
      lines = { { id = "dwarf_stone_l", text = "For human stone, he says, and I'll take it, because I copied half of them from drawings of Ironforge's Great Forge. Edwin used to say a dwarf would see through every shortcut we took, and you're squinting at the third one now." } },
      choices = {
        { text = "Which shortcut?", next = "dwarf_stone2" },
        { text = "I'll say nothing, Master Alexston.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    dwarf_stone2 = {
      lines = { { id = "dwarf_stone2_l", text = "The mortar on the Cathedral's east side. We ran out of money before we ran out of wall, and I've been waiting years for someone to notice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mason_child = {
      big = true,
      lines = { { id = "mason_child_l", text = "Then I knew him, likely, and I'm sorry, and I'm the man who took a salary from the same House that robbed him. Say it, if you want to; your father would have." } },
      choices = {
        { text = "You took the post. He'd have called you a traitor.", next = "BACK", reply = "He would, and he'd have said it to my face, which is more than most do. I hear it in my own head every morning, friend.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Someone had to keep building. He'd understand.", next = "BACK", reply = "I'd like to think so, but I knew your father, and he was a harder man than that. Still, I'm grateful you'd say it.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Would you know his work, if I told you his name?", next = "mason_name" },
      },
    },
    mason_name = {
      lines = { { id = "mason_name_l", text = "Tell me, and I'll tell you which wall is his. Every mason carved a mark somewhere nobody would look, and I know where most of them are." } },
      choices = { { text = "Thank you. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    kaldorei = { { id = "tp_kaldorei", text = "They grow their buildings instead of raising them, which I find marvellous and slightly insulting. And they won't sell a single Ashenvale oak, not even to their allies." } },
    the_stockade = { { id = "tp_the_stockade", text = "The prisoners have taken the Stockade, and I'm told Bazil Thredd is among the ringleaders. He was a stonemason once, and I knew him, and that is the sort of thing a man keeps to himself in this city." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "I drew the plans for the Valley of Heroes, or some of them, and I still walk under the arches to see if they've settled. They haven't, and I'm prouder of that than I should be." } },
    stonemasons = { { id = "tp_stonemasons", text = "The Stonemasons' Guild rebuilt Stormwind after the orcs tore it down, and the House of Nobles refused to pay the bill. I was one of them, in a way, and I stayed, and that is the difference between me and the men in red." } },
    deadmines = { { id = "tp_deadmines", text = "They tell me VanCleef has dug a whole harbour under Moonbrook, and if that's true, then it's a mason's work and a fine one. I'd rather admire it from a long way off." } },
    second_war = { { id = "tp_second_war", text = "I was a boy on a Westfall farm when the orcs came through, and I watched Stormwind burn from the hills. I've spent my whole life drawing it back up again, one street at a time." } },
    knows = {
      { id = "tp_knows", text = "An architect learns a city from its drains up, and its people along with it. Go on and ask; the stone has told me a great deal over the years." },
    },
    background = { { id = "tp_bg", text = "A Westfall boy who learned stone, rebuilt a city, and took the office his old partner refused. I don't care for the ending.", next = "farm" } },
    advice = { { id = "tp_ad", text = "Look at the foundations before the facade. In buildings and in people. The pretty part is always the last thing built." } },
    defias = {
      { id = "tp_defias", text = "The Defias were masons once, some of the best I ever worked with. Call them bandits if you must, but never call them common." },
    },
    westfall = { { id = "tp_westfall", text = "Westfall was home, once: the Alexston farm. I haven't been back, and I know I should.", next = "farm" } },
    _none = { { id = "tp_none", text = "If it isn't built of stone, I'm afraid I've no opinion worth having." } },
  },
}
