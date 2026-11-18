-- The ghosts of Caer Darrow an earlier pass missed, seen only by those who carry the means to see the dead:
-- Magistrate Marduke by the Scholomance door, Magnus Frostwake the trader, and the children Melia and Sammy
-- racing round the fountain. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Magistrate Marduke: ghost by the entrance to the Scholomance; the Ras Frostwhisper quests.
P:NPC {
  key = "magistrate_marduke", id = TODO_NPC("Magistrate Marduke"), name = "Magistrate Marduke", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "caer_darrow" }, temper = { "stern", "grim" }, values = { "dutiful", "wise" },
  notices = { "class" },
  impression = {
    first = "Magistrate Marduke is a ghost who stands before the door of the Scholomance as though he were still the law on Caer Darrow. Unlike his neighbours he remembers how the town died, and he has spent the years since deciding who must answer for it.",
    third = "{name} met the ghost of Magistrate Marduke, who keeps watch at the door of the Scholomance and wants Ras Frostwhisper brought to justice.",
  },
  greetings = {
    { id = "g_default", text = "You see me, {class}, which means you came here prepared. Good, because I have waited a long time for someone who could hear a charge read out." },
    { id = "g_back", when = { metBefore = true }, text = "You return to Caer Darrow. The school still stands behind me, I notice, and so my business with you is not concluded." },
    { id = "g_keepsake", when = { questActive = TODO_QUEST("Soulbound Keepsake") }, text = "Have you the keepsake yet? Until it is bound, Frostwhisper is beyond any sentence I could pass on him." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Lich, Ras Frostwhisper") }, text = "The sentence is carried out, and Caer Darrow has had what justice can still be given to it. I thank you, {name}, on behalf of a town that cannot." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin stands before me. Your order once sat in judgment beside magistrates like myself, so you will understand that what I ask of you is a verdict and not a vendetta." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I was the magistrate of Caer Darrow when it was a town and not a graveyard. The Barovs sold this island to the Cult of the Damned, the school beneath their keep swallowed everyone I was sworn to protect, and I alone seem to have been left the memory of it." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Lich, Ras Frostwhisper") }, text = "My docket is one name shorter because of you. There are a great many names left inside that school, but Frostwhisper's was the one I most wished to see struck out." },
      },
      again = {
        { id = "h_again", text = "What else would you have of the court, {class}?" },
        { id = "h_again2", text = "Speak, for the dead have time, though the living may not." },
      },
      choices = {
        { text = "Why do the other ghosts remember nothing?", next = "others" },
        { text = "Tell me about the Cult of the Damned.", next = "cult" },
        { text = "Who is Ras Frostwhisper?", next = "ras" },
        { text = "You speak of justice, but you sound like a man who wants revenge.", next = "revenge" },
        { text = "I must go, Magistrate.", next = "END" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Some were spared the anguish that memory brings, and I do not grudge them that. Masterson bakes his bread and the children run their races, and if I told them the truth it would change nothing except their peace." } },
      choices = {
        { text = "Then why were you not spared?", next = "spared" },
        { text = "Another question.", next = "BACK" },
      },
    },
    spared = {
      lines = { { id = "sp_default", text = "I have asked myself that on every night since. I can only think that a town must have one witness, and that the office I held in life did not lapse merely because I died in it." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    cult = {
      hub = true,
      lines = { { id = "c_default", text = "It has grown far beyond these islands. In nearly every city and hamlet of your Alliance and your Horde alike, there are men and women who answer to Kel'Thuzad and who have never once put on a robe where anyone could see.", fx = { learn = { "cult_of_the_damned" } } } },
      again = { { id = "c_again", text = "What more would you know of the Cult?" } },
      choices = {
        { text = "They live among us, unseen?", next = "among" },
        { text = "And the Scholomance trains them.", next = "school" },
        { text = "Enough of the Cult.", next = "hello" },
      },
    },
    among = {
      lines = { { id = "a_default", text = "They live, they work, and they plot beside you, and it is quite possible you have bought bread from one. Consider which serves the Scourge better: one more shambling corpse in its ranks, or a living zealot who can walk through a city gate with the plague in his pack." } },
      choices = {
        { text = "Then no city is safe.", next = "safe" },
        { text = "Go back.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "sf_default", text = "None is safe while the source still flows, and that is the whole of my argument. You cannot find every hidden cultist in every tavern, but you can burn out the place where they are made." } },
      choices = { { text = "Go back.", next = "BACK" } },
    },
    school = {
      lines = { { id = "sc_default", text = "It is where they are taught and tested, and from that door behind me they go out into your kingdoms. Strike at the Scholomance and you strike at the heart of the Cult of the Damned, which is why I stand where I stand." } },
      choices = { { text = "Go back.", next = "BACK" } },
    },
    ras = {
      lines = { { id = "r_default", text = "He was a man once, a mage of some promise, who came to Kel'Thuzad of his own will and begged to be made into what he is now. He is a lich, and he teaches within the school, and the students he has ruined are past my counting." } },
      choices = {
        { text = "How do you pass sentence on a lich?", next = "sentence" },
        { text = "Another question.", next = "BACK" },
      },
    },
    sentence = {
      lines = { { id = "s_default", text = "By making him answer as the man who chose, and not as the monster he chose to become. There is a keepsake from his mortal life, and if it is bound to his soul and brought before him, the lich must wear his human flesh again for as long as it takes a blade to find it." } },
      choices = {
        { text = "Where is this keepsake?", next = "keepsake" },
        { text = "Another question.", next = "BACK" },
      },
    },
    keepsake = {
      lines = { { id = "k_default", text = "It lies in Stratholme, where he lived before he fell, and it will need the hand of one skilled in binding souls before it is of any use. I do not pretend the errand is a small one, {class}, but no smaller one will serve." } },
      choices = { { text = "I understand. Another question.", next = "BACK" } },
    },
    revenge = {
      lines = { { id = "rv_default", text = "I have had years to learn the difference, and I will tell you what it is. Revenge would be content with his suffering, whereas I require that he die as the man who made the choice, so that the choice is what is punished." } },
      choices = { { text = "That's a fine line, but I see it. Another question.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Magistrate of Caer Darrow, in life and after it. I was not relieved of the post, and so I hold it." } },
    cult_of_the_damned = { { id = "tp_cult", text = "Living servants of Kel'Thuzad, hidden in every city. The Scholomance is where they are trained." } },
    scholomance = { { id = "tp_scholo", text = "The school beneath the Barovs' keep, at my back. Everything that killed this town came out of it." } },
    _none = { { id = "tp_none", text = "That matter was never brought before me, and I will not rule on what I have not heard." } },
  },
}

-- Magnus Frostwake: dwarf ghost who trades smithing and alchemy recipes, Caer Darrow.
P:NPC {
  key = "magnus_frostwake", id = TODO_NPC("Magnus Frostwake"), name = "Magnus Frostwake", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "caer_darrow" }, temper = { "gruff", "jovial" }, values = { "craft", "practical" },
  notices = { "craft" },
  impression = {
    first = "Magnus Frostwake is the ghost of a dwarf who still keeps a trader's stall on Caer Darrow, selling plans and recipes to anyone able to see him. He grumbled about the lack of custom and never once wondered why.",
    third = "{name} met the ghost of Magnus Frostwake, a dwarven trader of recipes on Caer Darrow.",
  },
  greetings = {
    { id = "g_default", text = "A customer at last! Step up, {g:lad|lass}, for I've plans and recipes ye'll nae find in any shop on the mainland." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, and welcome. Trade's been slow as cold tar since ye were last here." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, by my beard, and here was me thinking I was the only one daft enough tae set up shop on an island full of humans!" },
    { id = "n_craft", cat = "craft", when = { profession = { "Blacksmithing", "Alchemy" } },
      text = "Ye've a crafter's hands, so ye'll know good plans when ye see them. Have a proper look, for I didnae haul these across the lake tae sell tae farmers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Magnus Frostwake, trader in the finer sort of knowledge. I came tae Caer Darrow because the Barovs' people pay well for a clever recipe, though I'll admit the town's gone awful quiet of late." } },
      again = {
        { id = "h_again", text = "What else can I do for ye?" },
        { id = "h_again2", text = "Aye, go on, I'm nae going anywhere." },
      },
      choices = {
        { text = "What sort of recipes do you trade in?", next = "recipes" },
        { text = "The town has been quiet for years, Magnus.", next = "quiet" },
        { text = "What brought a dwarf to Caer Darrow?", next = "why" },
        { text = "Good trading, Magnus.", next = "END" },
      },
    },
    recipes = {
      lines = { { id = "r_default", text = "Smith's plans and alchemist's formulas, the kind a master guards and an apprentice would sell his beard for. I had them from all over Lordaeron, back when a dwarf could walk its roads with a pack and a pony." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "q_default", text = "Has it been years? I'd have said a season or two, but then I've never been one for calendars. The folk here do seem tae walk straight past my stall, mind, and I'd put it down tae human manners." } },
      choices = {
        { text = "Do you remember the school under the keep?", next = "school" },
        { text = "Something else.", next = "BACK" },
      },
    },
    school = {
      lines = { { id = "s_default", text = "The one the Barovs let tae those robed fellows, aye. Good customers they were, always after the odd reagent and never haggling, though I recall I'd a queer cold feeling the last time I delivered there, and I cannae seem tae remember walking home." } },
      choices = { { text = "I'm sorry, Magnus. Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Coin, {g:lad|lass}, the same as takes a dwarf anywhere. The Barovs were the richest house in these parts, and where there's a rich house there's a forge and a stillroom wanting the best." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A travelling trader out of Ironforge, selling plans and formulas up and down Lordaeron." } },
    scholomance = { { id = "tp_scholo", text = "The school under the keep? Good payers. I cannae say I liked the smell of the place." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. Folk here don't stop tae pass the news like they used tae." } },
  },
}

-- Melia: ghost child racing her friend Sammy round the Caer Darrow fountain.
P:NPC {
  key = "melia_caer_darrow", id = TODO_NPC("Melia"), name = "Melia", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "caer_darrow" }, temper = { "cheerful", "eager" }, values = { "friendly" },
  notices = { "race" },
  impression = {
    first = "Melia is the ghost of a little girl who races her friend Sammy round the fountain on Caer Darrow, over and over. She thinks it is still the same afternoon it was when the town died.",
    third = "{name} met the ghost of Melia, a child who runs races round the fountain on Caer Darrow.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Are you here to watch the race? I'm going to beat Sammy this time, you'll see." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! We've had lots more races, and I've won nearly half of them." },
  },
  notice = {
    { id = "n_big", cat = "race", when = { race = { "Tauren", "Orc", "Troll" } },
      text = "Oh, you're ever so big! I've never seen anybody like you on the island before, and I've seen everybody." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Melia, and that's Sammy, and we race from the fountain to the gate and back. She says she always wins, but that's only because she starts before I say go." } },
      again = {
        { id = "h_again", text = "What else? Sammy's waiting, and she'll start without me." },
        { id = "h_again2", text = "Ask quick, because it's nearly my turn to say go." },
      },
      choices = {
        { text = "Who wins the most?", next = "wins" },
        { text = "Don't your parents call you in?", next = "parents" },
        { text = "You should let Sammy win one.", next = "letwin" },
        { text = "Run fast, Melia.", next = "END" },
      },
    },
    wins = {
      lines = { { id = "w_default", text = "Sammy does, but she cheats, and I've told her so. We're doing best two out of three, and then if I lose we'll do best three out of five." } },
      choices = {
        { text = "How does she cheat?", next = "cheat" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    cheat = {
      lines = { { id = "c_default", text = "She cuts across by the baker's instead of going all the way round, and Mister Masterson never tells on her. He just laughs and says he's got loaves to mind." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    parents = {
      lines = { { id = "p_default", text = "Mother always calls me in for supper when the lamps are lit. She hasn't called yet, though, so it can't be late, and that means there's time for one more race." } },
      choices = { { text = "Then you'd better run it. Something else.", next = "BACK" } },
    },
    letwin = {
      lines = { { id = "l_default", text = "She wins plenty without me letting her! Anyway, it's no fun if you don't try your hardest, and that's what Sammy says too." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in the house with the blue door, and Sammy lives two doors down from me." } },
    _none = { { id = "tp_none", text = "I don't know about that. You could ask the Magistrate, but he's always cross." } },
  },
}

-- Sammy: ghost child, Melia's friend, Caer Darrow fountain.
P:NPC {
  key = "sammy_caer_darrow", id = TODO_NPC("Sammy"), name = "Sammy", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "caer_darrow" }, temper = { "cheerful", "proud" }, values = { "friendly" },
  notices = { "class" },
  impression = {
    first = "Sammy is the ghost of a little girl on Caer Darrow who wins most of her races against her friend Melia and denies cheating in all of them. Neither child knows that anything has happened to their town.",
    third = "{name} met the ghost of Sammy, a child who races her friend Melia on Caer Darrow.",
  },
  greetings = {
    { id = "g_default", text = "Did you see? I won again! Melia says I cheated, but I didn't, I'm just faster." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! I've won lots more races since you went away." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { pet = true },
      text = "Is {pet} yours? Could {pet} race us to the gate, do you think, or would that not be fair?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Sammy, and I'm the fastest girl on the whole island. Melia's second fastest, and she's my best friend, even when she says I started early." } },
      again = {
        { id = "h_again", text = "What else? We're going to race again in a minute." },
        { id = "h_again2", text = "Go on, but I have to be ready when she says go." },
      },
      choices = {
        { text = "Melia says you cut the corner by the baker's.", next = "corner" },
        { text = "What do you do when you're not racing?", next = "else_" },
        { text = "Is it always this quiet here?", next = "quiet" },
        { text = "Good luck in the next race.", next = "END" },
      },
    },
    corner = {
      lines = { { id = "c_default", text = "That's not cheating, that's being clever! Nobody ever said you had to go all the way round, and if Melia wanted to go that way she could." } },
      choices = {
        { text = "That sounds a bit like cheating.", next = "bit" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    bit = {
      lines = { { id = "b_default", text = "Well, maybe a little bit. I'll go the long way next time, but only the once, and you mustn't tell her I said so." } },
      choices = { { text = "I won't tell. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    else_ = {
      lines = { { id = "e_default", text = "Sometimes we watch Rory fish, but he's grumpy and says we scare them off. And sometimes the lady paints by the water, and she lets us look if we stand still, which is really hard." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "q_default", text = "It's not quiet, there's people everywhere! Only they don't talk to us much lately, and the big house on the hill has funny lights at night, so we're not allowed up there." } },
      choices = { { text = "Stay away from that house. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live near the fountain, and I've got the fastest legs in Caer Darrow." } },
    _none = { { id = "tp_none", text = "I don't know. Grown-ups never tell us anything." } },
  },
}
