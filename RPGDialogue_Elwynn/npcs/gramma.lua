-- Gramma (Mildred) Stonefield, inside Stonefield Farm. Voice: bibles/gramma.md
-- The oldest Stonefield, and the only one with no patience for the feud.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gramma", id = TODO_NPC("Gramma Stonefield"), name = "Gramma Stonefield",
  bible = "bibles/gramma.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "kind", "honest", "witty" },
  notices = { "kit", "drink" },
  impression = {
    first = "Gramma Stonefield is the oldest Stonefield still breathing, and she uses it freely to call the family feud a waste of good years. She is plainly scheming something and enjoying it enormously.",
    third = "{name} met Gramma Stonefield, the family's eldest, who thinks the Stonefield and Maclure feud a waste of good years.",
  },

  greetings = {
    { id = "g_op_alliance_betrayed", when = { opinion = { topic = "alliance", stance = "betrayed" } }, text = "There's the one who agrees with my kettle. Sit, dear, and don't tell the Marshal what we said about kings." },
    { id = "g_door", text = "Wipe your feet; I've just done that floor. Well, somebody has." },
    { id = "g_tommy", when = { questActive = TODO_QUEST("Speak with Gramma") }, text = "The boy sent you. I know that face; it's the face of someone sent." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Escape") }, text = "There's my accomplice! Come in, come in and sit down." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and not so much as a letter for an old woman. Sit down anyway, since you're here." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've filled out since you last came by, and you've the look of someone who's seen a thing or two. Good, because the young are no use until they have." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear somebody round here swallowed a tall tale of yours. I'm too old to be fooled that way, so don't bother trying." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone's been saying nice things about you, and I didn't even have to pry. Well, not much." },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Where are your clothes, child? You'll catch your death, and then where will I be? Short an errand-runner, that's where." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Been at the Lion's Pride, have you? Sit down before you fall down. I've seen enough Stonefields do both." },
  },

  start = "hello",
  nodes = {
    op_alliance = {
      lines = {
        { id = "op_alliance_a", text = "That's what I ask the fire every night, dear, and it never answers. The Alliance came asking for our men, and half the kingdoms that asked went home before the fighting was done. You tell me, then: was the Alliance worth our boys?" },
      },
      choices = {
        { text = "It was. Without the Alliance, the Horde would have taken everything.", next = "op_alliance_1", fx = { opinion = { alliance = "worth_it" }, align = { order = 1 } } },
        { text = "No. The kings used our men and walked away when it suited them.", next = "op_alliance_2", fx = { opinion = { alliance = "betrayed", stromgarde = "deserters" }, align = { order = -1 }, affinity = 1 } },
        { text = "I can't weigh a whole war against one good man.", next = "op_alliance_3", fx = { opinion = { alliance = "mixed" }, trait = { kind = 1 }, affinity = 2 } },
        { text = "Ironforge stood by you, Gramma. We never walked away.", next = "op_alliance_4", when = { race = "Dwarf" }, fx = { opinion = { alliance = "worth_it", dwarves = "loyal" }, affinity = 1 } },
        { text = "That's not for me to say, Gramma.", next = "BACK" },
      },
    },
    op_alliance_1 = {
      lines = { { id = "op_alliance_r1", text = "I suppose that's so, and Bernice's husband would have said the same, because he went proud. I only wish the Alliance had sent him home again." } },
      choices = { { text = "Something else, Gramma.", next = "BACK" } },
    },
    op_alliance_2 = {
      lines = { { id = "op_alliance_r2", text = "That's what I say to the kettle when nobody's listening, dear. Mind you, say it in Goldshire and the Marshal will give you that look of his." } },
      choices = { { text = "Something else, Gramma.", next = "BACK" } },
    },
    op_alliance_3 = {
      lines = { { id = "op_alliance_r3", text = "No, and nobody should have to, least of all Bernice. Go and buy one of her loaves, dear; it's the only answer I've ever found." } },
      choices = { { text = "Something else, Gramma.", next = "BACK" } },
    },
    op_alliance_4 = {
      lines = { { id = "op_alliance_r4", text = "No, you didn't, and I'll say that for your folk at any table. Stubborn as a Stonefield, the lot of you, and I mean it kindly." } },
      choices = { { text = "Something else, Gramma.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Ending this foolish feud, dear. The Maclures and the Stonefields have wasted good years on it. Your spirits might knock some sense into them." } },
      choices = {
        { text = "End it kindly, Gramma. Old wounds need gentle hands.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them fight it out. Feuds end themselves eventually.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not unless you can make two stubborn families forget why they hate each other, and they've half forgotten already. The young ones will fix it on their own if the old fools let them, and I'm the oldest fool, so I mean to let them." } },
      choices = {
        { text = "Then let the young ones find their own way.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Feuds need settling properly, by the elders.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Gramma.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something worth having at the end of it, which this feud never was. Fight the gnolls and the kobolds and anything that comes for a child, and leave the old grudges to rot, because they will anyway." } },
      choices = {
        { text = "I'll fight what threatens folk, and leave the grudges alone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some grudges are worth a fight, Gramma.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "My father did, boar and deer up in the hills before the gnolls came over. He used to say a hunter feeds the house and a fighter only feeds the crows, and I've found that mostly true." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's a handsome {pet}. Mind it doesn't chase our chickens, or I'll have to like you less." },
      },
      choices = {
        { text = "I hunt to feed folk, as your father did.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt for the sport, and the pelts.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It's for the boy, though he thinks it's for the east fence crew, and he'll carry half of it across the river to someone he thinks I don't know about. I don't mind a little sneaking when it's for love, but I mind it very much when it's for pie." } },
      choices = {
        { text = "Your pie's safe, Gramma. I'd sooner help the boy than rob him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sneaking's sneaking, Gramma. Love doesn't make it honest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I've sat with Stonefields who'd sooner burn down a vineyard than shake a Maclure's hand, so a little chill doesn't frighten me. Whatever you've got whispering at your shoulder, it can't be worse than this family at harvest." } },
      choices = {
        { text = "Your kitchen's the warmest place in Elwynn, Gramma.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My whispers are worse than any feud. Don't mistake me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I believe in a good garden and a warm hearth, dear, and if that's magic, then I've been working it for sixty years." } },
      choices = {
        { text = "A garden is the truest magic there is.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Magic's power, not gardening, Gramma.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Time, and the young ones, and nothing a hammer can do. The old men will keep their grudges into the grave, but Tommy Joe and that Maclure girl don't care two pins for them, and that's the start of the end of it." } },
      choices = {
        { text = "The old ways deserve respect, Gramma. Elders should decide.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the young ones break the old rules, then.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gramma.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want to sort out the Maclures, I expect, and I'll tell you now that swinging a hammer won't help, though it would be fun to watch." },
        { id = "h_default", text = "Oldest Stonefield still breathing. That gives me the right to say this feud is a waste of good years, and I say it often." },
        { id = "h_speak", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Gramma") },
          text = "The boy's in love with a Maclure. Of course he is. I've known since spring; he started washing behind his ears." },
        { id = "h_note", when = { questActive = TODO_QUEST("Note to William") },
          text = "Take that to William Pestle at the Lion's Pride, and don't read it. Oh, read it if you must, but don't tell him you did." },
        { id = "h_waiting", when = { questDone = TODO_QUEST("Note to William"), questBefore = TODO_QUEST("The Escape") },
          text = "William's a good friend and a slow one. Whatever he brews, it'll be right. It just won't be quick." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "Two young fools happy, and two old families none the wiser. Best day's work I've done in years." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Escape"), days = 14 } },
          text = "They'll be found out one day. I'll be here when they are, with a stick, for anybody who raises their voice." },
        { id = "h_grown", when = { minLevel = 25, metBefore = true },
          text = "Look at you! You went out that door an errand-runner and came back with a face that's seen things. Sit down, and tell me none of them." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's my favourite. Sit down, you, and don't tell the family I said that, or I'll never hear the end of it." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, at my door! My grandmother used to say the night elves' magic could make an apple tree bloom in winter. I'd like to see that someday." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Light-fingered, are you? I can tell from the way you're looking at my pie tin, so mind it, child, because it's spoken for." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've a cold air about you, child, colder than this kitchen in January. Sit by the stove and tell me what you've been up to." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My husband was one, in the old days, and he spent most of it fighting things that weren't Maclures." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Princess has been at our field again, and nobody's had the nerve to do anything about her." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Can you make the Maclures and my lot see sense with a spell? No? Then you're no more use than a priest." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! Well, aren't you a sight. Sit down; I'm scheming something, and your spirits might help." },
      },
      again = {
        { id = "h_again", text = "What else? I'm old, child, not deaf. Well, mostly not deaf." },
        { id = "h_again2", text = "Go on, then; the kettle's not boiled yet." },
        { id = "h_again3", when = { questDone = TODO_QUEST("The Escape") }, text = "Ask away, accomplice." },
      },
      choices = {
        { text = "Do you believe in magic, Gramma?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why do you call the feud a waste, Gramma?", next = "why" },
        { text = "Nobody seems to agree on how the feud started.", next = "feud" },
        { text = "How do you know William Pestle?", next = "william", when = { any = { { questActive = TODO_QUEST("Note to William") }, { questDone = TODO_QUEST("Note to William") } } } },
        { text = "Tell me about the Stonefields.", next = "family" },
        { text = "I hope she reached the river.", next = "escape_done", when = { questDone = TODO_QUEST("The Escape") } },
        { text = "I'll pray the two families make peace.", next = "priest", when = { class = "PRIEST" } },
        { text = "My family has feuds too, in Stormwind.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Dwarves feud for generations, Gramma. It never ends well.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Who is the pie spoken for, Gramma?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Most folk don't care to sit with a warlock, Gramma.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would you have a warrior fight for, Gramma?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Your family must have hunted, in the old days.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would mend the feud between the families, Gramma?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is there anything magic could do for the feud, Gramma?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You look like you're scheming something, Gramma Stonefield.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because I'm old, and I've buried people I was too proud to forgive. I'll not watch the boy do the same." },
      },
      choices = {
        { text = "Who didn't you forgive?", next = "why_who" },
        { text = "And the Maclures?", next = "maclures" },
        { text = "That's a good reason.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Some things shouldn't be forgiven, Gramma.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    why_who = {
      lines = {
        { id = "ww_default", text = "That's mine to carry, child, and you carry your own. Everybody's got a sack of them; mine's just older than most." },
      },
      choices = {
        { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "Sacks get lighter if you set them down.", next = "BACK", fx = { trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Some grudges are worth keeping, Gramma.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You can set a little of it down here, Gramma.", tag = "Persuade", next = "why_sack",
          check = { pass = { any = { { disposition = { min = 68 } }, { class = "PRIEST" }, { questDone = TODO_QUEST("The Escape") } } } },
          fail = { next = "why_kettle", fx = { affinity = -1 } } },
      },
    },
    maclures = {
      lines = {
        { id = "mc_default", text = "Never mind the Maclures. The girl's sweet, and that's all of them I need to know." },
      },
      choices = { { text = "Fair.", next = "BACK" } },
    },

    feud = {
      lines = {
        { id = "f_default", text = "Ask three Stonefields, get four answers. I stopped caring which was true about forty years ago." },
      },
      choices = {
        { text = "Then it's time it ended.", next = "feud_end", fx = { affinity = 1, learn = { "maybell_tommy" } } },
        { text = "Some grudges are earned.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    feud_end = {
      lines = {
        { id = "fe_default", text = "It'll end when the last proud Stonefield is buried, or when the young ones outnumber us. I'm betting on the young ones." },
      },
      choices = {
        { text = "So am I.", next = "BACK", fx = { affinity = 1, opinion = { maybell_tommy = "romantic" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    william = {
      lines = {
        { id = "wi_default", text = "Since we were both young and foolish. He went off to make potions in the city; I stayed and made Stonefields. We each think the other got the worse bargain." },
      },
      choices = {
        { text = "I hope his potion works.", next = "william_potion" },
        { text = "Something else.", next = "BACK", fx = { learn = { "lions_pride" } } },
      },
    },
    william_potion = {
      lines = {
        { id = "wp_default", text = "William's never brewed a thing that didn't work, though he takes his time about it. He'll fuss over that potion like it's his own grandchild." },
      },
      choices = {
        { text = "Slow and right. I'll take it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    family = {
      lines = {
        { id = "fa_default", text = "Bernice bakes, Ma fights a pig, and the boy moons at the river. I sit here and watch the lot of them." },
      },
      choices = {
        { text = "Is Bernice all right?", next = "family_bernice" },
        { text = "A pig?", next = "family_pig" },
      },
    },
    family_bernice = {
      lines = {
        { id = "fb_default", text = "Her husband went off on campaign and didn't come home. She bakes the way some folk pray. Don't bring him up unless she does." },
      },
      choices = {
        { text = "Was it worth it, sending Elwynn's men to that war?", next = "op_alliance" },
        { text = "I won't.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_pig = {
      lines = {
        { id = "fp_default", text = "That's the Brackwells' sow, Princess, and Ma takes her personally. Ma takes most things personally; that's how you know she's a Stonefield." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    escape_done = {
      lines = {
        { id = "ed_default", text = "She did. The boy came home with mud to the knees and a face like sunrise. I've not seen that face on a Stonefield in thirty years." },
      },
      choices = {
        { text = "You did that.", next = "BACK", fx = { affinity = 2 } },
        { text = "We did.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },

    priest = {
      lines = {
        { id = "p_default", text = "Pray louder than I nag, then. I've been at it forty years, and the Light hasn't said a word back." },
      },
      choices = {
        { text = "It's listening. Keep at it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Forty years of silence sounds like an answer to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Maybe it's waiting for you to forgive someone.", next = "priest_forgive" },
      },
    },
    priest_forgive = {
      lines = {
        { id = "pf_default", text = "Cheeky, but right. Now get out of my kitchen before you're right twice in one day." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Lords and ladies feud over seats in the city, and we feud over fences; it's the same foolishness in finer cloth. Did your lot ever end one?" },
      },
      choices = {
        { text = "Not that I know of.", next = "BACK", fx = { affinity = 1 } },
        { text = "One. Someone married the enemy.", next = "BACK", fx = { affinity = 2, opinion = { maybell_tommy = "romantic" } } },
      },
    },
    why_sack = {
      big = true,
      lines = {
        { id = "ws_default", text = "Someone I loved, over a few hard words about a fence line, of all the foolish things. I meant to make it up come the spring, and the winter took them first, and I've set out an extra cup on that day every year since." },
        { id = "ws_priest", when = { class = "PRIEST" }, text = "There, you've had it out of me, and in my own kitchen too. Don't you go praying over it; just let an old woman have said it out loud the once." },
      },
      choices = {
        { text = "Thank you for trusting me with it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "That's why you won't let Tommy Joe wait.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    why_kettle = {
      lines = {
        { id = "wk_default", text = "Here, now, I said it's mine, and I meant it. You don't get my old griefs just for asking nicely in my kitchen." },
        { id = "wk_default2", text = "Listen to you, sweet as Bernice's pastry. Save it for someone who needs it, child; I've carried mine this long without help." },
      },
      choices = {
        { text = "Yes, Gramma. Sorry, Gramma.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      big = true,
      lines = { { id = "dwarf_l", text = "Is that so? Then you'll know how it goes: everybody forgets what started it and nobody forgets who's winning. How do your people end a feud, then, if they ever do?" } },
      choices = {
        { text = "With a wedding, usually.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "With a king's judgement, and both sides obey.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They don't. Ask the Dark Irons.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've lived in this valley longer than most of its trees, child, and I've heard a thing or two. Ask me about any of this while the kettle boils." },
    },
    background = { { id = "tp_bg", text = "Mildred Stonefield, since you ask, and nobody does. Everyone's called me Gramma so long I answer to nothing else." } },
    advice = { { id = "tp_ad", text = "Forgive people early, child; it costs you less than doing it late." } },
    maybell_tommy = {
      { id = "tp_us", text = "Shh, the walls have Stonefields in them. Yes, it's going well, now hush." },
      { id = "tp_us2", text = "Sit down and ask me properly. Why I help them, you mean?", next = "why" },
    },
    lions_pride = { { id = "tp_inn", text = "William Pestle keeps a room there. We go back further than either of us likes to say." } },
    defias = { { id = "tp_defias", text = "Thieves in red. When I was a girl, thieves had the decency to be ashamed of themselves." } },
    _none = { { id = "tp_none", text = "At my age you stop collecting gossip. You start collecting chairs." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "I was a girl when the orcs came through and put Goldshire to the torch, child, and some of the names on the stone at Stone Cairn Lake were folk I knew. I don't go out there now, but I remember them on the right days." } },
    holy_light = { { id = "tp_holy_light", text = "I've prayed to the Light every morning for longer than most folk have been alive, and it's never once answered me in words. It answers in other ways, if you're patient and don't mind waiting." } },
    varian = { { id = "tp_varian", text = "I remember when the king came home from Lordaeron as a young man to take his father's throne, and the whole valley turned out to cheer him. I hope that wherever he is now, somebody's feeding him properly." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's been coming to Goldshire for years, child, and I've not missed it once, though I only watch now. A little music does an old woman more good than any of William's tonics." } },
    scourge = { { id = "tp_scourge", text = "William tells me the plague in the north came in the grain and turned folk into walking dead, and he's a sensible man. I've told Tommy Joe to buy no grain he can't trace, and he looks at me as though I'm wandering." } },
  },
}
