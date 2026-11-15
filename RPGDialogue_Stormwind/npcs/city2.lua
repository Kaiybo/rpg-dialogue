-- More of Stormwind: the Cathedral's paladin trainers, the Dwarven District's master smith,
-- the Royal Library, and the cheesemonger who isn't only a cheesemonger.
-- Voices: bibles/city2.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lord Grayson Shadowbreaker: a lord of the Silver Hand; demanding, methodical.
P:NPC {
  key = "grayson_sb", id = TODO_NPC("Lord Grayson Shadowbreaker"), name = "Lord Grayson Shadowbreaker", title = "Paladin Trainer",
  bible = "bibles/city2.md", role = "trainer", tier = "major",
  communities = { "stormwind" }, temper = { "proud" }, values = { "pious", "lawful", "stern" },
  spiritSensitive = true,
  notices = { "kit", "readiness" },

  greetings = {
    { id = "g_paladin", when = { class = "PALADIN" }, text = "The Light's protection on you today. Now, what have you learned since I saw you last?" },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "The Light's protection on you. You'll find no lessons for your path here." },
    { id = "g_veteran", when = { class = "PALADIN", minLevel = 50 }, text = "You've come far. Far enough that we should speak about what comes next." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.3 } },
      text = "Your harness is neglected. A paladin who can't care for their own gear will not care for a charger. Remember that; you'll need it someday." },
    { id = "n_ready", cat = "readiness", when = { class = "PALADIN", minLevel = 40 },
      text = "You carry yourself like someone who's been tested, and that's good. The tests don't end; they only grow quieter, and harder." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grayson Shadowbreaker, of the Silver Hand. I train the paladins who pass through this Cathedral, and I am not easily satisfied." },
        { id = "h_young", when = { class = "PALADIN", maxLevel = 20 },
          text = "Rall's student, are you? He'll teach you compassion and I'll teach you discipline, and you'll find you need both, usually on the same day." },
        { id = "h_charger", when = { class = "PALADIN", minLevel = 55 },
          text = "A charger isn't a horse with better armor but a bond with something beyond this world. The barding, the spirit and the rider must each be worthy." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Your people have no paladins, I'm told. No matter. The Cathedral's doors are as open to you as to anyone." },
        { id = "h_statuette", tags = { "news" }, when = { questActive = TODO_QUEST("A Friend of the Family") },
          text = "The Highlord wrote that you'd be bringing King Terenas's likeness, so hand it here, gently. The Light has settled in it like dust in an old chapel." },
        { id = "h_orinelle", when = { questActive = TODO_QUEST("The Shamed Lieutenant") },
          text = "Southshore. Lieutenant Orinelle. Go and hear what he has to say for himself, and judge him only after." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "The Cathedral's healers patch up my paladins more often than either of us admits. Consider yourself thanked on their behalf." },
        { id = "h_brandur", when = { race = "Dwarf", class = "PALADIN" },
          text = "Brandur Ironhammer's student. He sends me his best when Ironforge's halls have nothing left to teach them. Let's find out if he was right." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly, and I'll answer the same way." },
        { id = "h_again2", text = "Go on. The Light is patient, though I am somewhat less so." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What does the Silver Hand stand for now?", next = "hand" },
        { text = "What is a paladin's charger?", next = "charger" },
        { text = "Where is a paladin needed most?", next = "needed" },
        { text = "Why keep King Terenas's statuette here?", next = "terenas",
          when = { any = { { questActive = TODO_QUEST("A Friend of the Family") }, { questDone = TODO_QUEST("A Friend of the Family") } } } },
        { text = "Do priests and paladins serve the same Light?", next = "priest", when = { class = "PRIEST" } },
        { text = "May the Light protect you too.", next = "END", fx = { affinity = 1 } },
      },
    },

    hand = {
      big = true,
      lines = { { id = "hd_default", key = true, text = "What it always did, with fewer of us to stand for it. Lordaeron took our best. The rest of us hold the line they left." } },
      choices = {
        { text = "Then I'll help hold it.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 } } },
        { text = "Some say the Hand died with Uther.", next = "uther", fx = { trait = { skeptical = 1 } } },
        { text = "What does the Hand swear?", next = "hand_oath" },
      },
    },
    uther = {
      lines = { { id = "u_default", text = "Some say a great many things. The Hand is the people who keep its oaths. Count us, and decide for yourself." } },
      choices = {
        { text = "How many of you are left?", next = "uther_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uther_count = {
      lines = { { id = "uc_default", text = "Fewer than the oaths need, but enough that the oaths aren't empty. I count them every morning, and it doesn't take long." } },
      choices = { { text = "Count me, someday.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    hand_oath = {
      lines = { { id = "ho_default", text = "By blood and honour we serve. It's cut into the stone under Turalyon's statue in the valley. The rest of the oath is longer, and harder to keep." } },
      choices = {
        { text = "Which part is hardest?", next = "hand_hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_hardest = {
      lines = { { id = "hh_default", text = "Mercy, to the ones who haven't earned it. Anyone can be brave. Ask the Scarlet Crusade; they're very brave." } },
      choices = {
        { text = "That's a hard word for them.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
        { text = "Mercy can get people killed.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },

    charger = {
      lines = { { id = "ch_default", text = "Not bought, not bred. It answers a paladin who has proven worthy, and it must wear barding fit for the spirit realm as well as the road." } },
      choices = {
        { text = "Who makes such barding?", next = "charger_elmore" },
        { text = "I'm ready to begin.", next = "trials", when = { class = "PALADIN", minLevel = 60 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charger_elmore = {
      lines = { { id = "ce_default", text = "Grimand Elmore, in the Dwarven District. He made mine years ago and it's held, and he'll remind you of that, and of his price." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trials = {
      big = true,
      lines = { { id = "tr_default", text = "Then begin with sacrifice. High Priest Rohan in Ironforge keeps an exorcism censer you'll need. Pay him well for it; his coin feeds Ironforge's poorest." } },
      choices = {
        { text = "The cost doesn't matter.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    needed = {
      lines = { { id = "ne_default", text = "Where the dead walk. Commander Ashlam Valorfist holds Chillwind Point at the edge of the Western Plaguelands. When you're ready, he'll ask for you." } },
      choices = {
        { text = "And before I'm ready?", next = "needed_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    needed_now = {
      lines = { { id = "nn_default", text = "Then wherever you stand. Duskwood has its dead, Westfall its thieves, Redridge its orcs. The Light was never kept for the Plaguelands alone." } },
      choices = { { text = "Then I'll start where I stand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } } },
    },

    terenas = {
      lines = { { id = "te_default", text = "Terenas would have hated it. He never sat for a likeness if he could help it. That this one came through Lordaeron's fall is reason enough to keep it where people pray." } },
      choices = {
        { text = "I was there when Lordaeron fell.", next = "terenas_north", when = { origin = "human_lordaeron_refugee" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    terenas_north = {
      lines = { { id = "tn_default", text = "Then light a candle by it when you pass. He was your king before he was a statuette. The Light remembers that, even if the court forgets." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } } },
    },

    priest = {
      lines = { { id = "pr_default", text = "One Light. You carry it to the wounded after the fighting. We carry it into the fight and hope to walk out. Neither of us chose the easy half." } },
      choices = {
        { text = "Which half is harder?", next = "priest_harder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_harder = {
      lines = { { id = "ph_default", text = "Ask me before a battle and I'll say mine. Ask me after one and I'll say yours. Come and find me after one; I'd like to be honest." } },
      choices = { { text = "I'll find you.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A lord of the Silver Hand. People remember the title. The part that matters is the teaching.", next = "hand" } },
    advice = { { id = "tp_ad", text = "Care for your gear as if a life depends on it, because one will, and usually not yours." } },
    tome_of_divinity = { { id = "tp_tome", text = "The Tome is only the first trial, and there are many more. The last ones are not written in any book." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They kept the Hand's zeal and left its mercy in Lordaeron. I pray for them. I would not ride with them." } },
    _none = { { id = "tp_none", text = "That is not my concern. My concern is whether you're ready." } },
  },
}

-- Arthur the Faithful: the Cathedral's east wing; devout.
P:NPC {
  key = "arthur", id = TODO_NPC("Arthur the Faithful"), name = "Arthur the Faithful", title = "Paladin Trainer",
  bible = "bibles/city2.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = {},

  greetings = {
    { id = "g_paladin", when = { class = "PALADIN" }, text = "{g:Brother|Sister}. Come and kneel a moment before we begin." },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "The Light keep you, friend. The Cathedral has a quiet corner for anyone who needs one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Arthur. They call me the Faithful, though I've never been sure I earned it, and I keep trying to." },
        { id = "h_grayson", when = { class = "PALADIN" }, text = "Lord Shadowbreaker will test you, Katherine will correct you, and I'll pray with you. Between the three of us, you'll survive." },
        { id = "h_steadier", when = { metBefore = true, class = "PALADIN" }, text = "Each time you kneel here, you kneel a little steadier. I notice it, and the Light notices more." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Cathedral at night is all candle and echo. I like it best now. The prayers sound less like requests." },
        { id = "h_nobility", tags = { "news" }, when = { class = "PALADIN", minLevel = 40 },
          text = "Your faith has grown with you, and Duthorian Rall has more to teach. I think you're ready, so go to him humbly, because pride has undone more paladins than any blade." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I'm in no hurry at all." },
        { id = "h_again2", text = "Go on. The candles will wait." },
      },
      choices = {
        { text = "How long have you served here?", next = "served" },
        { text = "Why do they call you the Faithful?", next = "name" },
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Will you pray with me?", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Thank you.", next = "END" },
      },
    },
    served = {
      lines = {
        { id = "s_rubble", text = "Since before the city was rebuilt; I knelt on rubble on this very spot once. Now there's marble, and I'm not certain the prayers are any better for it." },
      },
      choices = {
        { text = "Maybe they're just as good.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Who did the rebuilding?", next = "served_masons" },
      },
    },
    served_masons = {
      lines = { { id = "sm_default", text = "The Stonemasons' Guild. I prayed beside them some mornings while they worked. I pray for them still, wherever they've gone, and whatever they've become.",
        fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { defias = "masons_wronged" } } } },
    },
    name = {
      lines = { { id = "nm_default", text = "Someone said it once and it stuck, and I've spent the years since trying to deserve it. I think that's most of what faith is: trying to deserve a name." } },
      choices = { { text = "You do.", next = "BACK", fx = { affinity = 2 } }, { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "pr_default", text = "Kneel, then, and no words are needed. The Light hears silence as well as it hears speeches, and better, some days." } },
      choices = { { text = "Amen. Something else.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A paladin who prays more than he fights. Someone has to stay by the altar. It turned out to be me.", next = "served" } },
    advice = { { id = "tp_ad", text = "Kneel before you fight, not after. After, you'll be too tired to mean it." } },
    _none = { { id = "tp_none", text = "I don't know. I'll pray on it, if that helps." } },
  },
}

-- Grimand Elmore: the Dwarven District's master weaponsmith and barding-maker.
P:NPC {
  key = "elmore", id = TODO_NPC("Grimand Elmore"), name = "Grimand Elmore",
  bible = "bibles/city2.md", role = "blacksmith", tier = "quest",
  communities = { "stormwind" }, temper = { "proud" }, values = { "honest", "ambitious" },
  notices = { "craft", "kit" },

  greetings = {
    { id = "g_anvil", text = "Finest craftsmanship on the continent, right here. It isnae cheap, but it's worth every coin." },
    { id = "g_task", when = { questActive = TODO_QUEST("Elmore's Task") }, text = "Argus sent ye? Then let's see what ye've brought me." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Smith's hands! Let me see the burns. Aye, ye've been at it, so keep at it, an' in twenty years ye might be adequate." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.2 } },
      text = "Who made that armor? No, dinnae tell me, because whoever it was, it's given up on ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Elmore. I make weapons, and I make barding for paladins' chargers, and nobody in Azeroth makes it better. Ask Lord Shadowbreaker whose work his mount wears." },
        { id = "h_argus", when = { heardLine = "argus.s_default" },
          text = "Argus told ye never tae let the apprentice near the quench? Good lad. My apprentice Furen's still not allowed near mine." },
        { id = "h_paladin", when = { class = "PALADIN", minLevel = 50 },
          text = "Ye'll be wantin' barding someday, if Shadowbreaker thinks ye're worth a charger, so save yer coin now, an' save a lot of it." },
        { id = "h_fair", when = { metBefore = true }, text = "Argus out in Goldshire does fair work, for a human. Dinnae tell him I said so. He'll get ideas." },
        { id = "h_task", tags = { "news" }, when = { questActive = TODO_QUEST("Elmore's Task") },
          text = "I've an axe finished for Gringer Stormpike, up at the north tower in Loch Modan. I cannae leave the forge tae carry it. You can." },
        { id = "h_lightforge", tags = { "news" }, when = { questActive = TODO_QUEST("Blessed Arm") },
          text = "Lightforge iron, in my shop? It's been years since I had my hands on any, so tell me the whole tale, an' then I'll make ye something worth it." },
        { id = "h_notes", tags = { "news" }, when = { questActive = TODO_QUEST("Grimand Elmore") },
          text = "Notes, from Furen? He thinks he can teach me? I taught that boy which end o' the hammer tae hold! Give them here." },
      },
      again = {
        { id = "h_again", text = "What else? The forge doesnae wait." },
        { id = "h_again2", text = "Aye? Out with it." },
      },
      choices = {
        { text = "Let me see your work.", next = "BUSINESS" },
        { text = "Tell me about Furen.", next = "furen" },
        { text = "Barding? For horses?", next = "barding" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Why work here and not in Ironforge?", next = "home", when = { race = "Dwarf" } },
        { text = "What can lightforge iron do?", next = "lightforge", when = { questActive = TODO_QUEST("Blessed Arm") } },
        { text = "Another time.", next = "END" },
      },
    },
    furen = {
      lines = { { id = "f_default", text = "Best student I've ever had, an' if ye tell him I said so I'll deny it on my anvil. He's slow, an' slow's good, for fast smiths make thin plate." } },
      choices = {
        { text = "He says you're hard on him.", next = "furen_hard" },
        { text = "He sent you his notes.", next = "furen_notes", when = { questDone = TODO_QUEST("Grimand Elmore") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    furen_hard = {
      lines = { { id = "fh_default", text = "Hard? I melt his best work an' tell him tae do it again. That's no' hard. That's how I was taught, an' look how I turned out." } },
      choices = { { text = "Charming.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    furen_notes = {
      lines = { { id = "fn_default", text = "Aye, outrageous. But there was a trick in there I'd never thought of, an' I've tried it twice already, so dinnae tell him that either." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } } },
    },
    barding = {
      lines = { { id = "b_default", text = "For chargers. A paladin's mount is no' a horse, an' its barding cannae be plain steel; Shadowbreaker's own charger wears mine, made years back, an' it's held." } },
      choices = {
        { text = "What does it cost?", next = "barding_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    barding_price = {
      lines = { { id = "bp_default", text = "More than ye've got. An' it's no' just coin; the makings will drag ye across half of Azeroth. Come back when Shadowbreaker sends ye." } },
      choices = { { text = "I'll save.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "Paladins, lords, the odd mountaineer with taste. The Stormpikes send orders all the way down from Loch Modan. A clan with taste, an' the coin tae back it." } },
      choices = {
        { text = "And the humans?", next = "buyers_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_humans = {
      lines = { { id = "bh_default", text = "Humans buy swords tae hang on walls. I sell them those. Then I sell the real ones tae their guards." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home = {
      lines = { { id = "ho_default", text = "Ironforge has a hundred good smiths. Stormwind has me an' Furen. A city that rebuilt itself from rubble needs good steel more than one that never fell." } },
      choices = { { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } } },
    },
    lightforge = {
      lines = { { id = "lf_default", text = "Blessed iron from the old forges. It takes the Light the way good steel takes an edge. Whatever ye're hunting, it willnae like this." } },
      choices = {
        { text = "A necromancer in Duskwood. Morbent Fel.", next = "lightforge_fel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lightforge_fel = {
      lines = { { id = "lff_default", text = "Then take the blade tae Sven, at his camp in western Duskwood, when it's done. An' come back after an' tell me how it sang." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A dwarf smith in a human city. Folk ask why. The answer's in the steel, no' in me." } },
    advice = { { id = "tp_ad", text = "Buy the best blade ye can afford, then save for a better one. Cheap steel's a debt ye pay in blood." } },
    trade = { { id = "tp_tr", text = "Weapons an' barding. Furen does the shields an' mail. I do the parts that need a master.", next = "furen" } },
    _none = { { id = "tp_none", text = "If it doesnae ring when ye strike it, I've no interest." } },
  },
}

-- Milton Sheaf: the Royal Library.
P:NPC {
  key = "milton", id = TODO_NPC("Milton Sheaf"), name = "Milton Sheaf", title = "Librarian",
  bible = "bibles/city2.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "cowardly" }, values = { "curious" },
  notices = { "lore" },

  greetings = {
    { id = "g_hush", text = "Shh, whisper, please, because the books are sleeping." },
    { id = "g_book", when = { questActive = TODO_QUEST("An Old History Book") }, text = "Have you found it, the old history? Gently, gently, because it's older than both of us." },
  },

  notice = {
    { id = "n_reader", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "You've read The Seven Kingdoms, and properly, I can tell, not just the pictures! Come back any time, and bring clean hands." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Milton Sheaf, keeper of the Royal Library. I collect books from all over the kingdom. Mostly I collect people to collect books for me." },
        { id = "h_foe", text = "Know your enemy, they say, but I'd go further and know everything about everyone. It saves so much trouble later." },
        { id = "h_flower", when = { metBefore = true }, text = "Someone returned a book yesterday with a pressed flower in it, seventy years overdue. I've decided to forgive them, because the flower was lovely." },
        { id = "h_kristoff", tags = { "news" }, when = { questActive = TODO_QUEST("Speaking of Fortitude") },
          text = "Brother Kristoff wants a book on metallurgy for a sermon on the spirit? How wonderful. I adore a priest with range." },
        { id = "h_paxton", when = { questActive = TODO_QUEST("Brother Paxton") },
          text = "Brother Paxton has had our Stresses of Iron for months, months! Ask him gently, and then, if you must, ask him less gently." },
        { id = "h_alterac", tags = { "news" }, when = { questActive = TODO_QUEST("Southshore") },
          text = "Loremaster Dibbs knows the way to Alterac's ruins. Whatever survived up there is ours to save, before the ogres light their fires with it." },
        { id = "h_tomes", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Milton"), days = 3 } },
          text = "The Tomes of Alterac, on my shelves! I've had to sit down twice. The library thanks you, and the books, I think, thank you most." },
      },
      again = {
        { id = "h_again", text = "Something else? In a whisper, please." },
        { id = "h_again2", text = "Yes? The books are listening, so do mind your grammar." },
      },
      choices = {
        { text = "Need anything found?", next = "BUSINESS" },
        { text = "What are you hoping to find?", next = "wanted" },
        { text = "Which book here is the best?", next = "best" },
        { text = "Who's the lord in the reading corner?", next = "lord" },
        { text = "Have you anything for a priest?", next = "priest", when = { class = "PRIEST" } },
        { text = "I'll let you read.", next = "END" },
      },
    },
    wanted = {
      lines = { { id = "w_default", text = "Alterac's libraries. The kingdom fell after the war, and its books went with it into ruins full of ogres. Ogres, I'm told, are not great readers.",
        fx = { learn = { "seven_kingdoms" } } } },
      choices = {
        { text = "How would anyone find them?", next = "wanted_dibbs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wanted_dibbs = {
      lines = { { id = "wd_default", text = "Southshore. Loremaster Dibbs knows the ruins and he knows me, and he'll sigh about both. Go when you're strong enough to argue with an ogre." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    best = {
      lines = { { id = "be_default", text = "The Seven Kingdoms, for anyone starting out. For anyone finishing, nothing beats a book that was stolen and came home again." } },
      choices = {
        { text = "Stolen? From here?", next = "best_stolen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_stolen = {
      lines = { { id = "bs_default", text = "After the Second War this library kept the Book of Medivh. Alterac's spies took it the very day the Horde's death knights came for it too. I still dust the shelf." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lord = {
      lines = { { id = "lo_default", text = "Lord Lescovar. He comes to meditate, he says. In a library! In all that time he's never once borrowed so much as a pamphlet." } },
      choices = {
        { text = "Is that strange?", next = "lord_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lord_strange = {
      lines = { { id = "ls_default", text = "In a library? It's very nearly a crime, but he's a lord, and lords may sit where they like. I simply shelve more loudly near him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    priest = {
      lines = { { id = "p_default", text = "Shelves of doctrine, and priests hardly read them. The Light isn't in books, they tell me. Then Brother Kristoff comes asking for metallurgy." } },
      choices = {
        { text = "Metallurgy?", next = "priest_iron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_iron = {
      lines = { { id = "pi_default", text = "The Stresses of Iron, by a dwarven miner, Margulf Blaggon. Kristoff says it's about the spirit, though I suspect it's about iron, and Brother Paxton at Northshire has our copy.",
        fx = { learn = { "northshire_abbey" } } } },
      choices = { { text = "I'll ask Paxton for it.", next = "BACK", fx = { affinity = 2 } }, { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My story is shelved under unremarkable, which is exactly where I like it. Ask me about the books instead." } },
    advice = { { id = "tp_ad", text = "Read the old books first. The new ones mostly argue with them." } },
    seven_kingdoms = { { id = "tp_kingdoms", text = "A classic. A bit generous to Alterac, I always felt.", next = "best" } },
    northshire_abbey = { { id = "tp_abbey", text = "A lovely library, for its size. Brother Paxton is a careful copyist. A very, very slow one." } },
    _none = { { id = "tp_none", text = "There'll be a book about it. There's a book about everything. I just haven't found that one yet." } },
  },
}

-- Elling Trias: Trias' Cheese, Trade District. Cheesemaker. Also not.
P:NPC {
  key = "elling", id = TODO_NPC("Elling Trias"), name = "Elling Trias", title = "Cheesemaker",
  bible = "bibles/city2.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "witty" },
  notices = { "watch" },

  greetings = {
    { id = "g_cheese", text = "Cheese. We sell cheese, and that's all we do here: cheese." },
    { id = "g_diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "Keep your voice down and buy some cheddar. Look natural." },
  },

  notice = {
    { id = "n_watch", cat = "watch", when = { class = "ROGUE" },
      text = "You looked at the cellar door before you looked at the cheese. Everyone who does that ends up working for the same people. Hello, colleague." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Elling Trias. My wife Elaine makes the cheese, my boy Ben sells it, and I stand here looking honest. It's a family business." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A diplomat goes missing in the middle of Stormwind, and nobody's surprised. That should worry you more than the diplomat." },
        { id = "h_shaw", when = { heardLine = "shaw.h_default" },
          text = "You've met the Master? Then you know where I stand, but don't say it out loud. The cheese has ears, or rather, the customers do." },
        { id = "h_cheddar", when = { metBefore = true }, text = "The aged cheddar is excellent this week. That is all I have to say about anything." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "We're closing, because cheese needs its rest, and so do I. That is the only reason." },
        { id = "h_lescovar", tags = { "news" }, when = { questActive = TODO_QUEST("Look to an Old Friend") },
          text = "Shaw sent you, to me, again? The man has the nerve of a cat burglar and the manners of one. Start at the beginning and leave nothing out." },
        { id = "h_attack", tags = { "news" }, when = { questActive = TODO_QUEST("The Attack!") },
          text = "Tyrion's in the castle garden with his contraption. Do what he says, when he says it. Then come back here and buy something." },
      },
      again = {
        { id = "h_again", text = "Anything else? Cheese-related, ideally." },
        { id = "h_again2", text = "Something more? Lower your voice, though; I'm told it carries." },
      },
      choices = {
        { text = "I'll take some cheese.", next = "BUSINESS" },
        { text = "What do you recommend?", next = "cheese" },
        { text = "You're not just a cheesemaker, are you?", next = "cover" },
        { text = "Jorgen sent a note.", next = "jorgen", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "I keep to the shadows myself.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Just passing.", next = "END" },
      },
    },
    cheese = {
      lines = { { id = "c_default", text = "The house cheddar, aged in our own cellar, or the Darnassian bleu, if you like a cheese with opinions. Elaine makes both, and I recommend both." } },
      choices = {
        { text = "What else is in the cellar?", next = "cheese_cellar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheese_cellar = {
      lines = { { id = "cc_default", text = "Cheese, shelves of it. Why would there be anything else in a cheesemaker's cellar? What an odd question; have some gouda." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    cover = {
      lines = { { id = "co_default", text = "I sell cheese, and people buy it, and sometimes they chat while they do. I've a great many friends who like cheese, and that's all." } },
      choices = {
        { text = "Friends where?", next = "cover_friends" },
        { text = "Of course. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    cover_friends = {
      lines = { { id = "cf_default", text = "Darkshire, Menethil, Theramore, and further still. Cheese travels well if you wrap it properly, and so does friendship." } },
      choices = {
        { text = "Even in the Church?", next = "church", when = { class = "PRIEST" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    church = {
      lines = { { id = "ch_default", text = "The Church eats cheese like everyone else. One or two of its bishops eat a great deal of it. I say no more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    jorgen = {
      lines = { { id = "j_default", text = "Jorgen. Of course it's Jorgen. Very well: my contacts, your legs, and I save on couriers. Darkshire, the north road, a Night Watchman called Backus." } },
      choices = {
        { text = "What do I ask Backus?", next = "jorgen_backus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jorgen_backus = {
      lines = { { id = "jb_default", text = "About Defias near Darkshire. Tell him I sent you; he'll be friendlier. He owes me cheese, and he knows it.",
        fx = { learn = { "night_watch", "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Then you know the first rule. We don't say so, especially in shops with the door open. Try the cheddar." } },
      choices = { { text = "Lovely cheddar.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a cheesemaker's husband who tastes everything first. That's my story, and I'm sticking to it." } },
    advice = { { id = "tp_ad", text = "Never trust a man who doesn't like cheese. He's hiding something worse." } },
    trade = { { id = "tp_tr", text = "Cheese: cheddar, bleu and gouda. That is the whole of my trade, as anyone will tell you.", next = "cheese" } },
    defias = { { id = "tp_defias", text = "Terrible customers. Steal the samples." } },
    _none = { { id = "tp_none", text = "Couldn't say. Have you tried the gouda?" } },
  },
}
