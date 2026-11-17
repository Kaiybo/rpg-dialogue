-- The Maclure Vineyards: Pa Maclure, who keeps the feud, and Joshua Maclure, who sells the drink.
-- Voice: bibles/maclures.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Pa Maclure: owner of the vineyard, head of the family, the reason Maybell meets Tommy Joe in secret.
P:NPC {
  key = "pa_maclure", id = TODO_NPC("Pa Maclure"), name = "Pa Maclure",
  bible = "bibles/maclures.md", role = "farmer", tier = "quest", communities = { "goldshire" },
  temper = { "stubborn" }, values = { "proud", "family" }, notices = { "stealth", "kin" },
  impression = {
    first = "Pa Maclure owns the vineyard, the house and, to hear him tell it, every opinion worth having on this side of the river. He looked at the Stonefield fields the way some men look at a storm cloud.",
    third = "{name} met Pa Maclure, head of the Maclure family, who will hear nothing good said of the Stonefields.",
  },
  greetings = {
    { id = "g_vines", text = "Mind the vines. They're older than you and worth more, most likely." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Not come from the Stonefield place, I hope." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Who's that creeping in my rows? Show yourself! If a Stonefield sent you, you can creep right back." },
    { id = "n_human", cat = "kin", when = { origin = "human_westfall_farmhand" },
      text = "You've a farmer's hands, Westfall by the look of them. Then you know what land costs a family, and what it's worth keeping." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think a dwarf should stick to stone and leave spirits to orcs. But you're polite, so I'll overlook it." } },
      choices = {
        { text = "I'll respect your land and your vines, Pa.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your opinions aren't the only ones worth having.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'm worried about everything that comes near the vineyard, since the Defias came and Goldtooth's lot went through the kobold mines. A mage could do good out here, I'll grant you, but I've seen one fire take a whole row, and I'm not seeing it again." } },
      choices = {
        { text = "I'll be careful, Pa. Your vines are safe from me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little fire might clear out the Defias quicker.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Pa.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because they called my father a thief and he went to his grave with it, and a river doesn't change what was said. You can preach about sharing all you like, but the vines are mine and so is the grudge." } },
      choices = {
        { text = "The river takes no sides, and neither should the families it feeds.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your grudge, then. Some wrongs shouldn't be forgiven.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "No, and I didn't say that, so don't go telling the Stonefields I did. But a strong arm walking the fence line now and then would remind certain people that the Maclures aren't to be trifled with." } },
      choices = {
        { text = "I'll not take sides in your feud, Pa.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll walk the fence for you, Pa. Let them see me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They come up from the woods at night and dig under the trellis till it falls, and then they eat whatever's on the ground. The Stonefields say it's my vines bringing them, and I say it's their pigs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it could clear the low rows by itself. Let it, if you've the time." },
      },
      choices = {
        { text = "I'll clear the boars and keep out of the feud.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll drive them over to the Stonefield side.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I fear anything I don't understand, and I don't understand you or what you keep at your heel. The Stonefields would say I fear everything, but the Stonefields have never had to watch a harvest go to the Defias." } },
      choices = {
        { text = "Your caution is fair. I'll keep away from your vines.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fear won't save your vines. Strength will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When the river runs uphill, and not a day before, because they called my father a thief and he went to his grave with it. You can pray all you like, but I'll not be the one who bends, and I've told my children the same." } },
      choices = {
        { text = "Grudges poison the living, Pa. Peace honors your father too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your father's name deserves defending. Don't bend, Pa.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Twice this month, and they take a crate each time and leave the gate swinging. Dughan's men come up after and write it down, and then they go home, and I sit up with a pitchfork." } },
      choices = {
        { text = "Then you'll not sit up alone tonight, Pa.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A pitchfork's a fine guard. You'll manage.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, in my vines. If you've come about the Stonefields, you can turn around, because there's no prayer that'll mend that." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Well, there's a thing; maybe you can tell the Defias to stop walking through my rows at night, because they don't listen to me." },
        { id = "h_default", text = "This is the Maclure vineyard, and I'm Pa Maclure. My family's worked these vines longer than anyone in Goldshire can remember, and we'll work them long after." },
        { id = "h_young", tags = { "news" }, when = { questActive = TODO_QUEST("Young Lovers") },
          text = "Maybell's been mooning about the house all week, sighing at nothing. Girls her age do that, I'm told. You've not seen anything, have you?" },
        { id = "h_escape", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "Has anyone seen Maybell? Her ma says she's resting, and her door's shut, and I don't like a shut door in my own house." },
        { id = "h_goldtooth", when = { questDone = TODO_QUEST("Goldtooth") },
          text = "So it was a kobold took the Stonefield woman's necklace and not my Billy. I said so from the start. Nobody listens to a Maclure on that farm." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late to be out among the vines. A man hears things in the rows at night, and none of them are honest." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've a stink about you like a burned field, and I don't want it near my vines, so state your business and go." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on Maclure land. Good, because there are folk on the Stonefield side who'd do with a fright." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you've come for the boars, they're in the low rows, rooting up my vines like they own them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf on Maclure land, and I'll ask you plain whether the Stonefields sent you. If they didn't, you're welcome to look at the vines." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Keep your sparks away from my vines, or I'll have Joshua run you off the farm with a pitchfork." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, on my land. Well, I've an opinion on that, and every opinion worth having is mine. Mind the vines." },
      },
      again = {
        { id = "h_again", text = "What else? I've vines to see to before dark." },
        { id = "h_again2", text = "Out with it. I've not got all day, and the grapes have even less." },
        { id = "h_again3", when = { questActive = TODO_QUEST("Young Lovers") }, text = "Well? You keep looking toward the river. There's nothing over there but Stonefields." },
      },
      choices = {
        { text = "There seems to be some trouble with the Stonefields.", next = "feud" },
        { text = "The vines look healthy this year.", next = "vines" },
        { text = "Tell me about your children.", next = "children" },
        { text = "I'd guess the Defias come up this way.", next = "defias", when = { any = { { questDone = TODO_QUEST("Brotherhood of Thieves") }, { class = "ROGUE" } } } },
        { text = "Do you fear a warlock will harm your vines?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would you have a warrior settle your feud, Pa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The boars must give you trouble in the vines.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would you ever make peace with the Stonefields, Pa?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have the Defias been through your vineyard, Pa Maclure?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your vines and their fields drink the same river. Why quarrel?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You seem worried a mage would harm the vineyard, Pa.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do you think of shamans, Pa Maclure?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Mr. Maclure.", next = "END" },
      },
    },

    feud = {
      big = true,
      lines = {
        { id = "f_default", key = true, text = "Trouble? The Stonefields are the trouble, and they have been since before I was born. My father wouldn't speak to theirs, and his father before him, and I'll not be the Maclure who forgets." },
      },
      choices = {
        { text = "What started it?", next = "feud_start" },
        { text = "Old grudges should be buried, sir.", next = "feud_bury" },
        { text = "Family is family. I understand.", next = "BACK", fx = { align = { order = 1 }, affinity = 1, learn = { "maybell_tommy" } } },
        { text = "A grudge nobody remembers is just stubbornness.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, learn = { "maybell_tommy" } } },
      },
    },
    feud_start = {
      lines = { { id = "fs_default", text = "Doesn't matter what started it. It's how it's always been, and a man who changes how it's always been had better have a very good reason." } },
      choices = {
        { text = "So you don't know either.", next = "feud_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feud_know = {
      lines = { { id = "fk_default", text = "I know they're Stonefields and I'm a Maclure, and that's all the knowing I need. Gramma Stonefield could tell you her version, I expect, and every word of it would be wrong." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    feud_bury = {
      lines = {
        { id = "fb_default", text = "Buried? You don't know what you're asking. Mind your own affairs, stranger, and I'll mind mine, and the Stonefields can mind themselves on their own side of the fence." },
        { id = "fb_escape", when = { questDone = TODO_QUEST("The Escape") },
          text = "You say that like you know something. If you've been carrying notes for my daughter, stranger, I'd sooner not hear it from you, so don't make me ask." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = -1 } } },
    },

    vines = {
      lines = { { id = "v_default", text = "Good grapes and too few hands. Half of Elwynn's young folk have gone for soldiers or adventurers, and the other half want paying in coin I haven't got." } },
      choices = {
        { text = "I hear Joshua sells the wine.", next = "vines_joshua" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vines_joshua = {
      lines = { { id = "vj_default", text = "He does, out front, and he's better at it than me. I'd tell a buyer what I thought of him, and Joshua just smiles and pours." } },
      choices = { { text = "A useful skill.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    children = {
      lines = {
        { id = "c_default", text = "Maybell's a good girl, quiet, helps her ma. Billy's a scamp who eats anything that isn't nailed down. They're Maclures, the both of them, and they'll keep this vineyard when I'm gone." },
      },
      choices = {
        { text = "Does Maybell want the vineyard?", next = "children_maybell" },
        { text = "Billy was blamed for a stolen necklace.", next = "children_billy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    children_maybell = {
      big = true,
      lines = { { id = "cm_default", text = "She'll want what's good for her, when she's old enough to see it. Some lad from a proper family, and no Stonefield, I can tell you that much for nothing." } },
      choices = {
        { text = "Maybe she should choose for herself.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, learn = { "maybell_tommy" } } },
        { text = "A father knows best for his daughter.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    children_billy = {
      lines = { { id = "cb_default", text = "Blamed by the Stonefields, you mean. My boy's no thief; he's only hungry, and there's a difference, though you'd not think so to hear that woman." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    defias = {
      lines = { { id = "d_default", text = "Thieves in red, cutting across the vineyard at night toward the Westfall road. I've a lantern and a stout stick, and they've not touched my grapes yet." } },
      choices = {
        { text = "A stick won't stop them.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "defias" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Maclures have kept this vineyard since before the orcs came, and after they'd gone we planted it again." } },
    advice = { { id = "tp_ad", text = "Know whose land you're standing on. Out here it matters more than you'd think." } },
    maybell_tommy = { { id = "tp_mt", text = "What's that? My Maybell and who? I'll not hear gossip about my own daughter, and I'll not hear that name.", next = "feud" } },
    defias = { { id = "tp_defias", text = "They cross my land at night. They'll not cross it with my grapes." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I'm not sure I want to. Ask in Goldshire." } },
  },
}

-- Joshua Maclure: vintner, selling drink outside the Maclure house near Pa.
P:NPC {
  key = "joshua_maclure", id = TODO_NPC("Joshua Maclure"), name = "Joshua Maclure", title = "Vintner",
  bible = "bibles/maclures.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "easygoing" }, values = { "practical", "family" }, notices = { "drink" },
  impression = {
    first = "Joshua Maclure sells the family's wine from outside the house, and he has a much easier manner than the man standing near him. He poured me a taste before I'd asked the price.",
    third = "{name} met Joshua Maclure, who sells drink at the Maclure Vineyards and smooths over what Pa says.",
  },
  greetings = {
    { id = "g_drink", text = "A drink for the road? The wine's ours and the water's from the well, and both are honest." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I'll take that as a compliment to the grapes." },
  },
  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, friend. I'll sell you water, not wine, until you can find your way home without the fence's help." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "He always does. He has opinions about everything, especially the Stonefields. I'd rather pour wine and keep the peace." } },
      choices = {
        { text = "Peace is worth pouring for, Joshua.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your father's right to grumble. The Stonefields cause trouble.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "My family distrusts the Stonefields, the Defias, the weather and the price of grain, and warlocks are well down the list. I judge a customer by their coin and their manners, and you've both, so far." } },
      choices = {
        { text = "Then I'll keep my manners, Joshua.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Manners are cheap. Coin's what you really want.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Joshua.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Pa would say blood and stubbornness, but I'd say pruning, because a vine left to itself grows wood instead of fruit. It seems cruel while you're cutting it back, but the harvest says otherwise." } },
      choices = {
        { text = "A careful hand makes a better vine. Prune it well.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A vine left wild has its own worth. Harvests aren't everything.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you'd think, and they drink it faster than anyone. A warrior coming back from Fargodeep wants a bottle to forget the kobolds, and I'm happy to sell it, though I'd not say so in front of Pa." } },
      choices = {
        { text = "I'll drink to the ones who didn't come back.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll drink to forget the lot of them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very nearly, and he talks about them the same way, with a lot of fist-shaking at the bottom rows. If you clear a few boars out, he'll think better of you, though he'll not tell you so himself." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Mind your {pet} near the bottles, if you would. One wag of a tail and I'm explaining to Pa again." },
      },
      choices = {
        { text = "I'll clear the boars and leave Pa in peace.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll clear them if he pays, and only then.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "He does, and the one night he came up two short it was Billy who'd taken them to the Stonefields, which caused more trouble than a Defias raid. If you ever see Billy with a bottle, I'd be grateful if you didn't tell Pa." } },
      choices = {
        { text = "I won't lie to your Pa if he asks me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your secret's safe. What Pa doesn't know won't hurt.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The south rows give a dry red that keeps you awake, which I'd recommend, though Pa says it's wasted on anyone who's never pruned a vine. I say coin is coin, and he says I talk like a merchant." } },
      choices = {
        { text = "Your Pa's right. Wine should honour the work behind it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Coin is coin, Joshua. Sell to anyone who pays.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ma does, every night, and Pa says the words loud enough for both of them. I've started praying too, that Pa never finds out where Maybell goes of an evening, and I'm not sure that's a prayer anyone up there would care to answer." } },
      choices = {
        { text = "Secrets fester in a family. Tell him, Joshua.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep her secret. Love's worth protecting.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Joshua.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe enough from the Stonefields, who only shout, but less so from the Defias, who've started cutting through the vineyard on their way to the Brackwell patch. Pa won't ask the Marshal for help, because he says Maclures look after their own, and I've stopped arguing." } },
      choices = {
        { text = "Pride shouldn't stop him asking for help. Tell the Marshal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your Pa's right. Look after your own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want something gentle, then, and I've a white that won't keep you up praying all night." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want something strong and honest, and I've a red that's both, which is more than I can say for most of Goldshire." },
        { id = "h_default", text = "Joshua Maclure. I sell what the vineyard makes, and a few things it doesn't, to whoever comes up the path. Don't mind Pa; he's sharper than he means to be." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! You'll want ale, and I've a little, though Pa says ale's for folk who can't wait on a grape. Don't tell him I stock it." },
        { id = "h_escape", when = { questDone = TODO_QUEST("The Escape") },
          text = "The house is very quiet this week, and Pa keeps asking questions nobody wants to answer. I sell wine and say nothing, which suits me fine." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I'll show you everything I've got, but I'd thank you to keep your hands on the counter, because Pa counts bottles at night." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You'll be after a bottle for the long nights with your books, I'd guess, and I've just the vintage." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you'll want something strong, I expect. I've a red that'll stand up to anything you've fought." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you're after something for a long night in a cold camp, I've just the bottle." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf! Here, have a taste, because I've never poured for one of your people and I'd love to know what you make of it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Pa won't like it, but Pa doesn't like anybody, so you're in good company. What can I sell you?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Have a taste of the wine. Pa's grumbling, but don't mind him. Your spirits might like it." },
      },
      again = {
        { id = "h_again", text = "Anything else? Pa's watching, so I'd best look busy." },
        { id = "h_again2", text = "Go on, I've a moment before the next cart comes up." },
      },
      choices = {
        { text = "Let me see what you're selling.", next = "BUSINESS" },
        { text = "Your Pa seems a hard man to please.", next = "pa" },
        { text = "Someone must buy all this wine.", next = "buyers" },
        { text = "Do you know about Maybell and Tommy Joe?", next = "secret", when = { questDone = TODO_QUEST("Young Lovers") } },
        { text = "They say your Pa counts the bottles every night.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there a vintage you'd recommend for a scholar?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I doubt warriors buy much wine from the Maclures.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does Pa really hate the boars as much as the Stonefields?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does your family ever pray together, Joshua?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is your family safe out here, Joshua?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What makes a vine give good grapes, besides the weather?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does your family distrust warlocks, Joshua?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Your father seems to grumble a great deal, Joshua.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Cheers.", next = "END" },
      },
    },
    pa = {
      lines = { { id = "p_default", text = "Only about Stonefields. Ask him about grapes and he's the gentlest man in Elwynn, but mention the farm across the river and he goes red to the ears." } },
      choices = {
        { text = "And you? Do you hate the Stonefields?", next = "pa_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pa_you = {
      big = true,
      lines = { { id = "py_default", text = "I've never had cause to. Their boy Tommy Joe seems decent, but I'd never say that where Pa could hear it, and you didn't hear it from me either." } },
      choices = {
        { text = "Then say it to him one day.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Wise to keep the peace at home.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "Farley at the Lion's Pride takes a few casks, and travelers on the road take a bottle each. Goldshire drinks more than it admits to, I'll say that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "lions_pride" } } } },
    },
    secret = {
      lines = { { id = "s_default", text = "Know about it? I've watched Maybell slip out to the river every week for a year and covered for her twice, so don't let Pa hear you say their names together." } },
      choices = {
        { text = "Her secret's safe with me.", next = "BACK", fx = { affinity = 2, learn = { "maybell_tommy" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "maybell_tommy" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born a Maclure, raised among the vines. I'd sooner sell wine than fight about it." } },
    advice = { { id = "tp_ad", text = "Taste before you buy, always. Any vintner who won't let you is hiding something." } },
    maybell_tommy = { { id = "tp_mt", text = "Not here, friend, not with Pa in earshot.", next = "secret" } },
    _none = { { id = "tp_none", text = "Couldn't say. I know grapes, and a little of what goes on in Goldshire." } },
  },
}
