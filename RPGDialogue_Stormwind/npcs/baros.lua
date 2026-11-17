-- Baros Alexston, City Architect, City Hall in Cathedral Square. Voice: bibles/baros.md
-- Built Stormwind beside VanCleef. Took the post when VanCleef took to the hills.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baros", id = TODO_NPC("Baros Alexston"), name = "Baros Alexston", title = "City Architect",
  rivals = { "katrana" },
  bible = "bibles/baros.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "proud" }, values = { "ambitious", "honest" },
  notices = { "westfall", "stone" },
  impression = {
    first = "Baros Alexston has drawn half the streets of Stormwind and grew up on a Westfall farm, and both facts seem to weigh on him. He keeps his plans close and his past closer.",
    third = "{name} met Baros Alexston, Stormwind's City Architect, a careful man of Westfall birth.",
  },

  greetings = {
    { id = "g_plans", text = "Careful of the plans. Those are the Mage Quarter's new drains." },
    { id = "g_letter", when = { questActive = TODO_QUEST("The Unsent Letter") }, text = "A letter, for me, and from whom? Let me sit down before I open it." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Unsent Letter") }, text = "You. Yes. I've thought about that letter every day since." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and in that time I've redrawn the Mage Quarter's drains twice. This city never stops needing mending." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown harder since we last spoke, and I know the look. I've seen it on men who built walls and then had to stand on them." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been doing honest work for the city these past days. Honest work goes unpaid more often than not in Stormwind, so you'll at least have my thanks." },
  },

  notice = {
    { id = "n_westfall", cat = "westfall", when = { visited = "Sentinel Hill" },
      text = "You've Westfall dust on your boots; I'd know it anywhere, because I grew up in it on the Alexston farm. Is the old house still standing?" },
    { id = "n_dwarf", cat = "stone", when = { race = "Dwarf" },
      text = "A dwarf! Tell me honestly, are the Cathedral's flying buttresses too much? Every dwarf I ask says too much." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'm not sure I would. Half these walls were raised by men we never paid, and if the stone remembers that, it has better manners than they do." } },
      choices = {
        { text = "The stone holds the city up. Trust what was built properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The stone remembers the debt. Pay the masons and be done with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Older cellars than anyone admits to, cut before the city was rebuilt, and the Lamb's crypt is the deepest of them. I drew new streets over half of Stormwind after the Horde burned it, but the Quarter's masters wouldn't let my men dig below a certain line, and I've learned not to ask builders' questions of people who answer with fire." },
      },
      choices = {
        { text = "Then the plans stay closed, as they should.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Show me the old plans. I'll find out myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Baros.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Park, and precious little else, because the nobles wanted halls and the masons gave them halls. I grew up on a Westfall farm, and some nights I think I built a city that has forgotten where its bread comes from." } },
      choices = {
        { text = "Stone and law keep people safe. The fields can look after themselves.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then tear up a street or two and let the land back in.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Edwin did, and every mason who walked out with him, which is why the Defias come and go under this city as they please. I gave SI:7 copies of the old plans, though I suspect Shaw had them before I did." } },
      choices = {
        { text = "Then the plans should be locked away, and the drains watched.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every city needs back doors. Leave some of them open.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Spilled reagents, mostly, and whatever the apprentices pour down the gutters when their masters aren't looking. The stone was laid for rain, not arcane runoff, though nobody on the council wants to pay for the difference." } },
      choices = {
        { text = "The Quarter should answer to the city's rules like anyone else.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Mages have better things to worry about than mortar.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The gates, always, because every wall I've drawn means nothing if the gate gives. The old city fell from the inside, mind you, which is why I check every street I lay out for where a mob could gather." } },
      choices = {
        { text = "A gate is only as good as the soldier standing in it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stone does the work. Soldiers just fill the gaps.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Room is the one thing I never have enough of, friend. The stable master on the east side manages, but I've had three petitions this month about wolves in the Trade District, and I didn't draw a single kennel." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I'd sooner the beasts had the hills than the alleys, but {pet} looks better kept than most of my masons. Mind it doesn't chew the scaffolding; the masons have enough to complain about without that." },
      },
      choices = {
        { text = "A city should make room for the ones who keep its roads safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Beasts belong outside the walls. Mine waits by the gate.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not often, though I drew half its buttresses myself. Every stone in it was set by a man still waiting for his wages, and I find it hard to kneel on something that was never paid for." } },
      choices = {
        { text = "The faith in those stones is real, whoever paid for them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then it's a monument to a lie, and I won't pray there either.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Wages paid, and a word from the House admitting the masons were wronged, and neither will ever happen. Instead they took to the hills of Westfall, and now the crown calls them bandits and sends soldiers after them." } },
      choices = {
        { text = "The law must deal with the Defias, whatever the House owes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "When the law cheats men, they've a right to take what's theirs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "You have Lady Prestor's ear, I hear, and I'd ask you to be careful with it. When the court is pleased with someone, the rest of us in this office usually find out what it costs." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Word is that Lady Prestor found you tiresome. Don't repeat this, but you're in good company: the court said the same of every mason who asked to be paid." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The masons raised the Cathedral before the House refused to pay them, so you'll forgive me if I look at it differently than you do." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The Silver Hand speaks a great deal of justice, so I'd be curious to hear what you think is owed to the men who rebuilt this city." },
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
          text = "The old house is west of Sentinel Hill, and Father swears the chest is still there under the char. It holds a boy's compass, worth nothing to anyone, but bring it anyway." },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, back from the hills. Did you come in through the Valley of Heroes? Tell me honestly whether the statues look right from the road." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in my streets. I laid most of these stones myself, so forgive me if I wonder what someone who shapes living things makes of them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The Slaughtered Lamb sits on foundations I've never been allowed to survey, and I'd wager you know why." },
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
        { text = "Few could know the city's drains as well as you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Something's eating the Mage Quarter's mortar.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which part of the city would you hold first, Architect?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the city have room left for a hunter's beasts, Architect?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever pray in the Cathedral you helped build?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would justice look like for the Stonemasons, Architect?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Did you leave room for anything green when you drew the city, Architect?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What lies beneath the Mage Quarter, Baros?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would you like to know what the stone of this city thinks, Baros?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    edwin = {
      big = true,
      lines = {
        { id = "e_default", key = true, text = "We rebuilt this city together, and the nobles wouldn't pay. Edwin raised his voice and got a riot. I kept my head down and got this office." },
      },
      choices = {
        { text = "You made the right choice.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "He had a point about the nobles.", next = "point", fx = { align = { honor = 1, order = -1 } } },
      },
    },
    point = {
      lines = { { id = "p_default", text = "He did. That's the trouble with Edwin. He always had a point, and he always took it too far." } },
      choices = {
        { text = "Too far how?", next = "riot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riot = {
      big = true,
      lines = { { id = "ri_default", text = "The riot. The queen came down into the street to calm us. She was the one at court who'd argued we be paid. Someone threw a stone." } },
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
      lines = { { id = "f_default", text = "Westfall. The Alexston farm, west of Sentinel Hill. Thieves burned the house and moved in. My father hid what he could before he went.",
        fx = { learn = { "westfall" } } } },
      choices = {
        { text = "Is anything left?", next = "farm_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_father = {
      lines = { { id = "ff_default", text = "My first compass, he says, in a chest under the ash. Useless to me now. I think about it more often than the Cathedral." } },
      choices = { { text = "Maybe someone could fetch it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },

    westfall_kin = {
      lines = { { id = "wk_default", text = "Then we've both lost a farm to the same men, perhaps to masons I once worked beside. I'm sorry for that, and I mean it." } },
      choices = { { text = "It's not your doing.", next = "BACK", fx = { affinity = 2 } }, { text = "Your friends did it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } } },
    },

    noble = {
      lines = { { id = "n_default", text = "Then your family's House voted not to pay mine. Don't apologise; you weren't there. Just remember it, next time they vote." } },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My family's votes are their business, not my debt.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "You took the post. He'd have called you a traitor.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Someone had to keep building. He'd understand.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "What was his name, to you?", next = "mason_name" },
      },
    },
    mason_name = {
      lines = { { id = "mason_name_l", text = "Tell me, and I'll tell you which wall is his. Every mason carved a mark somewhere nobody would look, and I know where most of them are." } },
      choices = { { text = "Thank you. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "An architect learns a city from its drains up, and its people along with it. Ask me about any of this, and I'll tell you what the stone has told me." },
    },
    background = { { id = "tp_bg", text = "A Westfall boy who learned stone, rebuilt a city, and took the office his old partner refused. I don't care for the ending.", next = "farm" } },
    advice = { { id = "tp_ad", text = "Look at the foundations before the facade. In buildings and in people. The pretty part is always the last thing built." } },
    defias = {
      { id = "tp_defias", text = "Masons, once. Some of the best I ever worked with. I'd thank you not to call them common anything." },
    },
    westfall = { { id = "tp_westfall", text = "Westfall was home, once: the Alexston farm. I haven't been back, and I know I should.", next = "farm" } },
    _none = { { id = "tp_none", text = "If it isn't built of stone, I'm afraid I've no opinion worth having." } },
  },
}
