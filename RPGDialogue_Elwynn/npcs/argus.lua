-- Smith Argus, Journeyman Blacksmith, Goldshire. Voice: bibles/argus.md
-- The askabout spec pins him as a named NPC with no `background` or `trade` of his own:
-- keep those two topics off him.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "argus", id = TODO_NPC("Smith Argus"), name = "Smith Argus", title = "Journeyman Blacksmith",
  bible = "bibles/argus.md", role = "blacksmith", tier = "service",
  communities = { "goldshire" }, temper = { "proud" },
  notices = { "kit", "craft" },
  impression = {
    first = "Before Smith Argus looked at my face, he looked at my armor, and he plainly found it wanting. He mends what's bent and makes what's needed, and he doesn't pretend to work miracles.",
    third = "{name} met Smith Argus, a blacksmith who judges people by the state of their armor and rarely approves.",
  },

  greetings = {
    { id = "g_anvil", text = "Careful there, the anvil's still hot." },
    { id = "g_begging", when = { durability = { max = 0.35 } }, text = "That armor's begging. I can hear it from here." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Come to see how it's done?" },
  },

  notice = {
    { id = "n_broken", cat = "kit", place = "before", when = { durability = { max = 0.2 } },
      text = "Don't say a word. Take that off and let me look. Light's sake, what did you wrestle?" },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "No armor at all. That's either brave or foolish, and I've seen how both end." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Those are smith's hands, calloused in all the right places. Who taught you?" },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I mend what's bent and make what's needed, and I don't hold with miracles. If your fire burns hot and steady, it can stand by my anvil, but it won't touch the work." } },
      choices = {
        { text = "Good. Honest work should come from honest hands.", next = "BACK", reply = "That's how I see it, and it's how I'll keep working. Hand me your blade.", fx = { align = { honor = 1 } } },
        { text = "My spirits could do it faster. Your pride slows you down.", next = "BACK", reply = "Faster, maybe, but I'll still be here mending what your spirits break. Pride's cheaper than miracles.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A few, up from the inn cellar where Maximillian Crowe keeps his students, and they always want a dagger with some strange mark cut into it. I'll forge the blade, but the marks they can cut themselves, because I don't do miracles and I don't do that either." } },
      choices = {
        { text = "Right. A smith should keep his forge clean.", next = "BACK", reply = "It should, and I'll keep mine that way. Find another smith for the marks.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A mark is only a mark, Argus. You're superstitious.", next = "BACK", reply = "Maybe I am, but I sleep fine. They can cut their own marks.", fx = { align = { light = -1 } } },
        { text = "Something else, Argus.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Bears don't wear plate, so no, unless you want a collar, and I'd charge you for the fitting. Claws dull like any blade, mind, but mine at least can be sharpened." } },
      choices = {
        { text = "Every tool has its place, and your steel keeps Goldshire safe.", next = "BACK", reply = "Kind of you to say, and I'll not argue it. Come back if you ever need that collar.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'd sooner trust claws than anything hammered out in a shed.", next = "BACK", reply = "Then you'll be back when the claws dull, and I'll not be sharpening those. My shed suits me fine.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That a nick left alone becomes a crack, and a crack becomes a broken blade in some kobold's tunnel. Bring it to me after every fight, not after every month, and it'll outlast you." } },
      choices = {
        { text = "I'll bring it after every fight, and pay for the care.", next = "BACK", reply = "Good, and I'll make it last you. That's honest work.", fx = { align = { order = 1 } } },
        { text = "Steel's for using. I'll buy another when this one breaks.", next = "BACK", reply = "Then you'll be buying a lot of steel, friend. I'll be glad of the custom.", fx = { align = { order = -1 } } },
        { text = "Something else, Argus.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Skinning knives, traps and arrowheads, when somebody brings me the iron. The wolves on the Goldshire road have taken more than one lamb this spring, so a trap that holds is worth its weight." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Skinning knives, traps and arrowheads, when somebody brings me the iron. Your {pet} has a fine set of teeth, mind, so keep it fed and it'll do half the work my traps would." },
      },
      choices = {
        { text = "I'll take only what the wolves cost the farmers. No more.", next = "BACK", reply = "Good, and the farmers will be glad of the help. I'll have the traps ready.", fx = { align = { honor = 1 } } },
        { text = "Every pelt on that road is coin. I'll take them all.", next = "BACK", reply = "Then bring me the iron for the traps, at least. I'll not ask what you're doing with them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I don't, because the Defias carry knives just like yours, and I'd sooner not learn I've put an edge on one that ended up in a farmer. A smith can't choose who buys from him, but he can choose what he listens to." } },
      choices = {
        { text = "My blades won't touch an honest farmer, Argus.", next = "BACK", reply = "I'll take you at your word, and I'll put a good edge on it. Mind you keep it that way.", fx = { align = { honor = 1 } } },
        { text = "A blade's a blade, and who it cuts is my business.", next = "BACK", reply = "Then I'll sharpen it and not ask, and I'll not listen either. That's my choice.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "There's iron for the foot of a staff, which I'll forge for anyone who asks, but your lot mostly buy their staves in Stormwind and leave the honest work to me. When the kobolds come up out of Fargodeep Mine, though, I notice it's my steel they hide behind." } },
      choices = {
        { text = "Steel and spells both keep Goldshire standing. I respect your trade.", next = "BACK", reply = "That's kind of you, and the tower should hear it too. Come back if you need a staff foot.", fx = { align = { honor = 1 } } },
        { text = "Steel's a blunt answer. A good spell does the work cleaner.", next = "BACK", reply = "Cleaner, maybe, until it fizzles in a kobold tunnel. Then you'll want my steel.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honest work, the same as anyone's, only more of it, because you'll stand in front while the rest hide behind you. Brother Wilhelm trains your lot behind my forge, and I hear every blow he lands on their shields." } },
      choices = {
        { text = "Then I'll stand in front, and bring you the dents after.", next = "BACK", reply = "That's what I like to hear, and I'll have the hammer ready. Bring me every dent.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll stand where it's safest. Plate is for surviving, not for show.", next = "BACK", reply = "That's honest, at least, and I'll make you plate that keeps you alive. Where you stand is your business.", fx = { align = { honor = -1 } } },
        { text = "Something else, Argus.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your plate will want to look like it means what it promises, so let me see the dents before you say a word." },
        { id = "h_default", text = "Argus. I mend what's bent and make what's needed, but I don't do miracles." },
        { id = "q_elmore", when = { questActive = TODO_QUEST("Elmore's Task") },
          text = "Grimand Elmore's the dwarf in Stormwind's Dwarven District, the best weaponsmith in the city, and he knows it. Help him with his delivery, because we need the dwarves on our side." },
        { id = "q_verner", tags = { "news" }, when = { questActive = TODO_QUEST("The Price of Shoes") },
          text = "A note from Verner Osgood in Lakeshire, of course. He wants shoes and he wants them yesterday, and he'll get them, so don't tell him I didn't complain." },
        { id = "q_verner_back", when = { questActive = TODO_QUEST("Return to Verner") },
          text = "Take those horseshoes up to Lakeshire and tell Verner they're the best he'll see this year. He'll say his own are better, and he'll be wrong." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Go on, tell me my quench is too fast, the way every dwarf who walks past my forge does." },
        { id = "h_deaf", when = { metBefore = true },
          text = "Eh? Speak up, the anvil's had my good ear for years, and the other one's only for show." },
        { id = "h_plate", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 20 },
          text = "Now that's plate that's been somewhere, dented in all the honest places. Whoever mended it last knew their trade, nearly as well as me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Soft boots and a short blade, so you've trained with Keryn Sylvius at the inn or Jorik Kerridan up in Northshire. I'll mend your knives, but I don't want to hear what they were for." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and not a scrap of steel on you anywhere. You'll want a stout staff and somebody tall to stand in front of you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and that blade's been put to honest use, by the nicks in it. Leave it on the bench and I'll take the worst of them out." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, with a blade for skinning and a quiver for everything else. I can sharpen the one, but I don't make arrows, so don't ask." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, and not a buckle of steel on you, so I expect you've come for directions rather than repairs." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I mend blades and buckles, and I'll mend yours, but I won't mend whatever's following you about." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf with totems on his belt. I don't know what your spirits make of that armour, but I'd say it needs mending before it needs blessing." },
      },
      again = {
        { id = "h_again", text = "What else? Talk over the hammer and I'll catch most of it." },
        { id = "h_again2", text = "Eh? Something else, was it? Go on and say it louder." },
      },
      choices = {
        { text = "Let's see what you have.", next = "BUSINESS" },
        { text = "What makes good steel?", next = "steel" },
        { text = "That's a great many horseshoes for one smithy.", next = "shoes" },
        { text = "Your quench is too fast.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Can a priest learn anything at a forge?", next = "priest", when = { class = "PRIEST" } },
        { text = "You don't seem to want to know what my knives are for.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "There's little at a forge for a mage, I'd think.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does a smith wish warriors knew about their steel?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you forge anything a hunter would want?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does a paladin's armor need from a smith, Argus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I doubt your forge has much for someone who fights as a bear.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd guess you get a few warlocks at your forge, Argus.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could a shaman's fire spirit help at your forge, Argus?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just looking.", next = "END" },
      },
    },
    steel = {
      lines = { { id = "s_default", key = true, text = "Patience and clean ore, and never letting the apprentice near the quench." } },
      choices = {
        { text = "What's wrong with the apprentice?", next = "steel_apprentice" },
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Sounds slow.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    steel_apprentice = {
      lines = { { id = "sa_default", text = "Nothing, until he's in a hurry. A hurried quench cracks a blade where you'll never see it, and then it breaks in a fight, with my name on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    shoes = {
      lines = {
        { id = "sh_default", text = "They're for Verner Osgood, in Lakeshire. He spent his iron outfitting the Stormwind Guard over there, and now his horses go barefoot, so he wants fifty shoes." },
      },
      choices = {
        { text = "I'd guess he isn't paying for them.", next = "shoes_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shoes_pay = {
      lines = { { id = "sp_default", text = "He will when he reads the note I'm nailing to the crate. Verner thinks friendship's a currency, and it is, just not mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "There it is, from every one of you: too fast, too cold, too human. I'll tell you what I tell them, which is show me your blade, then tell me about mine." } },
      choices = {
        { text = "Fair. Yours is good, for a human.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Mine's better.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Same as anyone. Heat, patience, and knowing when something can't be mended. You'd know that last one better than me, I'd guess." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Get your armor mended before it's broken, not after, because broken costs more, and dead costs most of all." } },
    defias = { { id = "t_defias", text = "They don't buy steel, they take it. Somebody's arming them, and it isn't me." } },
    kobolds = { { id = "t_kobolds", text = "Kobold picks are terrible steel. I melt them down for nails." } },
    _none = { { id = "t_none", text = "Ask me about iron and I'll talk all day, but that I couldn't say." } },
    second_war = { { id = "tp_second_war", text = "My father forged pikes for Lord Lothar's men in the Second War, and he swore the orcs' axes were heavier but ours stayed sharp longer. I've believed it ever since, because I've never had cause to test it." } },
    scourge = { { id = "tp_scourge", text = "Lordaeron had the best smiths in the north, and their steel didn't save them, so don't tell me good armor is the whole answer. They say the dead up there don't feel a blade at all, and you can't put an edge on that." } },
    stonemasons = { { id = "tp_stonemasons", text = "Good builders, the lot, and they raised the city walls with their own hands. If the nobles had paid what they owed, I'd not be hearing about masked men on my road." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire camps by Goldshire I shoe more horses in a week than in a month, because half of Stormwind rides out to gawk at the strongman. I'd like to see him bend one of my shoes." } },
    magni = { { id = "tp_magni", text = "King Magni's smiths make the finest steel I've ever held, and I hate admitting it. Janos Hammerknuckle, the dwarf who sells weapons up at the Abbey, never lets me forget it." } },
  },
}
