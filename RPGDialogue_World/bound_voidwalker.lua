-- The warlock's own voidwalker (0.90.0). When a warlock talks to the voidwalker they bound,
-- it answers from this pool (`Conv.BoundRole`, role "my_voidwalker"). The speaker is the
-- player's pet; the player is always its master. {npc} is the demon's own (random) name.
-- Voice: a shield made of emptiness. Slow, enormous, loyal by nature, patient, eerie rather
-- than funny, though its literal-mindedness lands as dry humour. Pain means nothing to it.
-- It notices everything and judges almost nothing. Lots of `narr` for its silences.
-- Lore: Classic only. The Twisting Nether, the Legion, Hyjal, Gul'dan and the Shadow Council,
-- Dalaran's ban, the binding quests (Gakin, Carendin Halgar, Gan'rul), soul shards,
-- Sacrifice, Demonic Sacrifice, Soul Link. Nothing later.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Pool {
  id = "my_voidwalker", role = "my_voidwalker",
  greetings = {
    { id = "g_default", text = "Master, I am here, as I am always here." },
    { id = "g_default2", text = "You turned toward me, master, so I turned toward you. What do you need of me?" },
    { id = "g_first", when = { metBefore = false }, text = "You are speaking to me, master, and not only giving orders. I did not know that was something we did." },
    { id = "g_often", when = { timesTalked = { min = 10 } }, text = "You speak to me often now, master. I have begun to keep your words, the way you keep your shards." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It is night, master, and the dark is thicker now. I am a little larger in it, if you had not noticed." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "The sun is coming up, master. I will stand between you and it if you wish, though I do not think it means you any harm." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "The light is going out of the sky, master, the way it always does. I like this part of the day best, if I like anything." },
    { id = "g_deaths", when = { deaths = { min = 10 } }, text = "You have died many times, master, and each time I was waiting at the edge of it before you arrived. I am beginning to know the way there." },
    { id = "g_party", when = { party = true }, text = "There are others with you, master. I have counted them, and I have placed myself where the blows will come from." },
    { id = "g_drunk", when = { drunk = { min = 2 } }, text = "You are swaying, master, so I will lean the other way. Between the two of us we will stay upright." },
    { id = "g_low", when = { maxLevel = 15 }, text = "Master, you are still small, and so I am still enough. Speak, and I will listen." },
    { id = "g_high", when = { minLevel = 50 }, text = "Master, you have grown heavy with power, and the dark has begun to notice you. I noticed you first." },
    { id = "g_cold", when = { race = "Scourge" }, text = "Master, you are cold, and I am cold, so we do not trouble each other. That is a kind of comfort, I think." },
    { id = "g_poor", when = { money = { max = 100 } }, text = "Your purse makes no sound when you walk, master. I do not know what gold is for, only that you count it, and today there is nothing to count." },
  },
  notice = {
    { id = "n_party_holy", cat = "party", when = { party = { class = { "PRIEST", "PALADIN" } } },
      text = "Your {companion} keeps a hand near the Light whenever I move, master. I do not blame them, and I stand on the side of you that is furthest from them." },
    { id = "n_party_lock", cat = "party", when = { party = { class = "WARLOCK" } },
      text = "There is another binder among your companions, master, and another chain in the air. Theirs is held more loosely than yours, I think." },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 3 } },
      text = "You have drunk enough that the dark is very close to you now, master. If you fall, I will be under you." },
    { id = "n_death", cat = "death", when = { daysSinceDeath = { max = 1 } },
      text = "You were dead a little while ago, master, and now you are not. I waited, which is what I do." },
  },
  tier = "quest",
  start = "hello",
  nodes = {
    hello = {
      narr = "The voidwalker drifts a little nearer, and the air around you cools, as if a door has opened somewhere you cannot see.",
      lines = {
        { id = "h_default", text = "I am listening, master. I am always listening, but now you know it, and so it is a different kind of listening." },
        { id = "h_default2", text = "Speak, master, or say nothing, and I will wait. Waiting is not a hardship for me, and I have done a great deal of it." },
        { id = "h_quiet", when = { chance = 0.3 }, narr = "For a long moment it says nothing at all, and the shackles on its arms hang perfectly still.", text = "Forgive me, master, I was counting the shadows on this road. There are more of them than there were this morning." },
        { id = "h_low", when = { maxLevel = 19 }, text = "You bound me not long ago, master, and you still watch me the way one watches a fire that might spread. You do not need to, but I understand it." },
        { id = "h_high", when = { minLevel = 50 }, text = "We have walked a long way together, master, and you have killed a great many things on it. I have been struck by most of them, and I remember each one." },
        { id = "h_orc", when = { race = "Orc" }, text = "Master, your people have bound my kind for longer than any of the others. You carry it in the way you hold the chain, as if it were heavy and familiar both." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "Master, you have been dead, and I have never been alive, and so of all the warlocks I could serve, I think you understand me best." },
        { id = "h_human", when = { race = "Human" }, text = "Master, your people's kingdom would hang you for keeping me, and still you keep me. I have thought about that a great deal." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Master, you are very small to hold so large a chain, and yet you hold it more steadily than most. I have stopped being surprised by it." },
      },
      again = {
        { id = "a_1", text = "I am still here, master. What else?" },
        { id = "a_2", narr = "It settles back to its post at your shoulder, and the cold settles with it.", text = "There is more you wish to say, master. I can feel it in the way you are standing." },
        { id = "a_3", text = "Ask, master. There is nothing I would keep from you." },
      },
      choices = {
        { text = "I have orders for you.", next = "orders" },
        { text = "You did well back there.", next = "praise" },
        { text = "You were too slow. Do better.", next = "scold" },
        { text = "What were you, before I bound you?", next = "past" },
        { text = "Tell me what you remember of the binding.", next = "binding" },
        { text = "Would you ever turn on me?", next = "betray" },
        { text = "What do you make of my other demons?", next = "others" },
        { text = "Does it hurt you, taking the blows meant for me?", next = "pain" },
        { text = "Where do you go when I dismiss you?", next = "dismiss" },
        { text = "I died back there, and you saw it.", next = "death", when = { deaths = { min = 1 } } },
        { text = "You can ask me something, if you want.", next = "asks" },
        { text = "What do you think of my companions?", next = "companions", when = { party = true } },
        { text = "What do you think of the ones who hunt me?", next = "enemies" },
        { text = "What do you know of the Burning Legion?", next = "legion", fx = { learn = { "burning_legion" } } },
        { text = "What do you make of the Light?", next = "light" },
        { text = "Tell me what I ought to want, voidwalker.", next = "ambition" },
        { text = "It's a long road. Talk to me.", next = "road" },
        { text = "Never forget I can unmake you.", next = "threat" },
        { text = "You've served me well. Thank you.", next = "kind" },
        { text = "My people's warlocks doomed Draenor, you know.", next = "xorc", when = { race = "Orc" } },
        { text = "We're both dead things, you and I.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "Stormwind would hang me for keeping you.", next = "xhuman", when = { race = "Human" } },
        { text = "Gnomeregan fell, so I learned to bind the dark instead.", next = "xgnome", when = { race = "Gnome" } },
        { text = "Soon I'll call down an infernal, or a doomguard.", next = "great", when = { minLevel = 50 } },
        { text = "That's all. Stay close.", next = "END" },
      },
    },

    ---------------------------------------------------------------------------
    -- Orders.
    ---------------------------------------------------------------------------
    orders = {
      lines = {
        { id = "o_default", text = "I am ready, master. Tell me where to stand and who to stand against, and it will be done before you have finished thinking it." },
        { id = "o_low", when = { maxLevel = 15 }, text = "Give your orders, master. You still say them aloud, as if I might not hear you think them, but I hear you either way." },
        { id = "o_high", when = { minLevel = 50 }, text = "Give your orders, master, though after all these roads you hardly need to. I know where you want me before you know it yourself." },
      },
      choices = {
        { text = "Nothing touches me. Everything that comes, you take.", next = "orders_hold" },
        { text = "Hold them off while I drain them.", next = "orders_drain" },
        { text = "Stay back this time. I want to see what I can do alone.", next = "orders_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_hold = {
      narr = "It lowers its great shoulders and spreads its shackled arms, and the space in front of you seems to fill up with nothing.",
      lines = {
        { id = "oh_default", text = "Then nothing will touch you, master, for as long as there is anything left of me. When there is nothing left of me, you will have a moment, and you should use it well." },
        { id = "oh_party", when = { party = true }, text = "Then nothing will touch you, master, though your companions may have to look after themselves. I was bound to one body, and it is yours." },
      },
      choices = {
        { text = "Good. A shield doesn't need to think.", next = "BACK", reply = "No, master, it does not, and I am glad of it. Thinking would only slow me down, and the blow arrives either way.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Guard my companions too. They're under my protection.", next = "BACK", when = { party = true }, reply = "If they are yours, master, then they are mine to stand in front of. I will make myself wider.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If you're about to fall, fall back. I'd rather keep you.", next = "BACK", reply = "You would rather keep me, master. I will think about that while the next thing hits me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_drain = {
      lines = {
        { id = "od_default", text = "I will torment them, master, and they will forget you are there. It is not difficult; to most creatures I am the loudest thing in the world, even when I say nothing." },
        { id = "od_high", when = { minLevel = 40 }, text = "I will hold them, master, and you will drink them dry, as we have done a thousand times. I have never asked what it tastes like, and I am not asking now." },
      },
      choices = {
        { text = "What does it feel like, when you torment them?", next = "orders_torment" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_torment = {
      narr = "Something moves deep in its body, like a stone sinking through dark water.",
      lines = {
        { id = "ot_default", text = "I open a little of what I am toward them, master, and they look into it, and they cannot look away. They do not see the void, only that something is missing, and they come to find out what." },
      },
      choices = {
        { text = "That's a cruel thing to do to a living mind.", next = "BACK", reply = "Perhaps it is, master. I do not know what cruelty is shaped like, but you do, and I will remember that you said it.", fx = { align = { light = 1 } } },
        { text = "Good. Make them look until they break.", next = "BACK", reply = "As you wish, master. They will look, and when they break, they will not know what broke them.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_alone = {
      narr = "It drifts backward, and does not stop watching the road ahead of you for a moment.",
      lines = {
        { id = "oa_default", text = "I will stay back, master. I will be exactly far enough away that you can do it alone, and exactly near enough that you do not have to." },
        { id = "oa_low", when = { maxLevel = 15 }, text = "I will stay back, master, though you are still young in this. If you begin to die, I will forget that you told me to, and you may scold me afterward." },
      },
      choices = {
        { text = "I'll manage. I won't always have you.", next = "BACK", reply = "That is true, master, and it is wise to know it. One day there will be no shard, or no time, and you will be glad you learned.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Praise and scolding.
    ---------------------------------------------------------------------------
    praise = {
      narr = "It goes very still, the way it does when it is struck, though nothing has struck it.",
      lines = {
        { id = "pr_default", text = "Did I, master? I stood where you told me and I did not fall over. I do not know how to do it badly, so I am not sure how to do it well." },
        { id = "pr_often", when = { timesTalked = { min = 5 } }, text = "You have said that before, master, and each time I have kept it somewhere inside me. I do not know where, because inside me there is nothing, but I have found room." },
      },
      choices = {
        { text = "Praise is how mortals say thank you.", next = "praise_thanks" },
        { text = "Don't let it go to your head. If you have one.", next = "BACK", reply = "I do not think I have one, master, but if I find it, I will not let anything go to it.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_thanks = {
      lines = {
        { id = "pt_default", text = "Then I will accept it, master, the way you accept a soul shard, and keep it in the bag with the others. I do not know what I am supposed to give you back for it." },
      },
      choices = {
        { text = "Nothing. Kindness doesn't need paying back.", next = "BACK", reply = "Then it is a strange coin, master, and I will hold it carefully until I understand what it buys.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Loyalty. That's what praise buys from a servant.", next = "BACK", reply = "Then you have overpaid, master, because you had my loyalty already. I will not tell the imp, in case he asks for change.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold = {
      narr = "The voidwalker bows its great head, slowly, until its shackles touch the ground.",
      lines = {
        { id = "sc_default", text = "I was slow, master, and something reached you that should have reached me. I am sorry for it, though I do not think sorry changes anything that has already happened." },
        { id = "sc_deaths", when = { deaths = { min = 5 } }, text = "You have died more than once while I stood nearby, master, and every time I have asked myself the same question. I have not found the answer, but I am still asking." },
      },
      choices = {
        { text = "If it happens again, I'll find a voidwalker who's faster.", next = "scold_replace" },
        { text = "Forget it. It wasn't all your fault.", next = "BACK", reply = "It was partly my fault, master, and I will keep that part. You may keep the rest.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_replace = {
      big = true,
      narr = "It lifts its head, and for the first time the two lights in its face seem to look straight at you.",
      lines = {
        { id = "sr_default", text = "You may, master, and that voidwalker would serve you as I do. But it would not remember the swamp, or the cave, or the night you fell asleep against my arm and did not notice. I do not think there is another one of me, even among all the others like me." },
      },
      choices = {
        { text = "That's why I'll keep you, then. Don't waste it.", next = "BACK", reply = "I will not waste it, master. I have not wasted anything since you made me.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Every demon is replaceable. Remember that.", next = "BACK", reply = "I will remember it, master. I remember everything you say, even the things that are untrue.", fx = { affinity = -1, align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Its past, the Nether, its true name.
    ---------------------------------------------------------------------------
    past = {
      narr = "It is quiet for so long that you begin to think it has not heard you.",
      lines = {
        { id = "pa_default", text = "Before you, master, I was not anything. I was a part of the emptiness between the worlds that had not yet been given a shape, and then you gave me this one, and here I am." },
        { id = "pa_high", when = { minLevel = 40 }, text = "You have asked before, master, in other ways, and I have given you the same answer each time. Before you, I was the space where nothing was, and that space did not have a voice to remember with." },
      },
      choices = {
        { text = "Tell me about the Twisting Nether.", next = "past_nether" },
        { text = "Everything was something once. You must remember a little.", next = "past_memory" },
        { text = "What is your real name?", next = "past_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_nether = {
      lines = {
        { id = "pn_default", text = "The Nether is the dark that lies under all the worlds, master, the way water lies under ice. Spirits drift in it, and demons hunt there, and the Legion marches through it from one burning world to the next." },
        { id = "pn_void", text = "And between all of that, master, there are places where nothing drifts and nothing hunts, and that is where I was. It was very quiet, and I did not know it was quiet until you showed me noise." },
      },
      choices = {
        { text = "Do you miss it?", next = "past_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_miss = {
      narr = "It turns its head to look back over its shoulder, at nothing you can see.",
      lines = {
        { id = "pm_default", text = "I do not think I can miss it, master, because it is always there, behind every shadow you have ever stood in. When you dismiss me I fall back into it, and it is exactly as I left it, because nothing in it ever changes." },
      },
      choices = {
        { text = "Then this world must seem very loud to you.", next = "BACK", reply = "It is very loud, master, and very warm, and full of things that end. I am learning to like it, a little at a time.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_memory = {
      lines = {
        { id = "pme_default", text = "There is one thing, master, though I do not know if it is a memory or a dream, if I can dream. I remember a great many voices, very far away, all speaking at once in a language like fire, and then I remember them stopping." },
        { id = "pme_lore", when = { minLevel = 30 }, text = "I have thought about it since, master, and I think the voices were the Legion, crossing the dark toward some world it meant to burn. If they stopped, it was because the world fought back, or because the world was gone." },
      },
      choices = {
        { text = "That was Hyjal, perhaps. The Legion lost there.", next = "legion_hyjal", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_name = {
      big = true,
      narr = "The cold around it deepens, and the nearest torch, if there is one, seems to burn a little lower.",
      lines = {
        { id = "pna_default", text = "You call me {npc}, master, and I answer to it gladly. But it is not my name; it is only the sound the circle made when you pulled me through it, and you wrote it down." },
        { id = "pna_two", text = "My true name is a silence, master, a particular silence, the shape of the space I left behind in the Nether. If you said it, nothing would come out of your mouth at all, and I would hear it from anywhere." },
      },
      choices = {
        { text = "Then I'll keep calling you {npc}. It's yours now.", next = "BACK", reply = "Then it is mine, master, and I will keep it as carefully as I keep you.", fx = { affinity = 2 } },
        { text = "Teach me that silence. A warlock should hold every name.", next = "BACK", narr = "It says nothing, and you realise, after a moment, that it is answering.", reply = "There, master. You have heard it now, and you will always know it, though you will never be able to tell anyone what it was.", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- The binding.
    ---------------------------------------------------------------------------
    binding = {
      lines = {
        { id = "bi_default", text = "I remember the circle, master, and the chalk, and the smell of the candles. I remember that I came through angry, because everything that comes through is angry at first, and I remember that you were very small and did not run." },
        { id = "bi_human", when = { race = "Human" }, text = "I remember the cellar under the Slaughtered Lamb, master, and the summoning circle there, and Gakin the Darkbinder watching from the stairs. You had taken a choker from a dead woman in the pumpkin fields to do it, and it was still cold when you put it on." },
        { id = "bi_scourge", when = { race = "Scourge" }, text = "I remember the Magic Quarter under the dead city, master, and Carendin Halgar telling you what to say. Your voice was hoarse, because you had not been dead very long, and I liked that about it." },
        { id = "bi_orc", when = { race = "Orc" }, text = "I remember the Cleft of Shadow, master, and Gan'rul Bloodeye with his arms folded while you drew the circle. He did not think you would win, and I could tell, and so could you." },
      },
      choices = {
        { text = "You attacked me in that circle. Why?", next = "binding_fight" },
        { text = "Do you hate me for binding you?", next = "binding_hate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_fight = {
      narr = "It lifts one shackled fist and looks at it, turning it slowly in the air.",
      lines = {
        { id = "bf_default", text = "Because that is the binding, master. A voidwalker comes through the circle wild, and the warlock must strike it down, and only then can the warlock call it back as a servant. You struck me down, and you called me back, and I have been yours ever since." },
      },
      choices = {
        { text = "So I had to beat you before you'd obey.", next = "binding_circle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_circle = {
      big = true,
      lines = {
        { id = "bc_default", text = "It is not quite that, master. When you struck me down, I learned the shape of you, the exact weight of your will, and after that there was no other shape I could take. Obedience is not what I do; it is what I am made of now." },
        { id = "bc_low", when = { maxLevel = 15 }, text = "It is not quite that, master. When you struck me down I learned the shape of you, and I have been made of that shape ever since, and you were bleeding while you did it and did not stop." },
      },
      choices = {
        { text = "Then the binding is a kind of honour between us.", next = "BACK", reply = "If you wish to call it that, master, I will call it that too. It is a better word than the one the imp uses.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It's a chain, nothing more. Chains don't need meaning.", next = "BACK", reply = "Then I am a chain that knows it is a chain, master. That is not nothing, though I will not argue.", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_hate = {
      lines = {
        { id = "bh_default", text = "Hate is a warm thing, master, and I am not warm. I do not hate you, and I do not love you as you would mean it, but I am turned toward you always, the way a shadow is turned away from a lamp." },
      },
      choices = {
        { text = "The imp hates me. I'd rather have your kind of loyalty.", next = "BACK", reply = "The imp hates everyone, master, and that is a kind of loyalty too, though it is very noisy.", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Betrayal.
    ---------------------------------------------------------------------------
    betray = {
      narr = "It does not move, and it does not answer quickly.",
      lines = {
        { id = "be_default", text = "No, master. Other demons wait for the chain to slip, and they count the days, but I am not counting. If the chain broke tomorrow, I think I would only stand here, the way I am standing now." },
        { id = "be_party", when = { party = { class = "WARLOCK" } }, text = "No, master, though I understand why you ask, with another binder standing so near. Their demons watch you, and I watch their demons." },
      },
      choices = {
        { text = "The other warlocks say every demon betrays its master.", next = "betray_chain" },
        { text = "What if someone stronger tried to take you from me?", next = "betray_steal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    betray_chain = {
      big = true,
      lines = {
        { id = "bc2_default", text = "The others are right about the others, master. The imp would set your robes alight and laugh, and the succubus would smile while she did something worse. But there is nothing in me that wants anything, and a demon who wants nothing has no reason to turn." },
        { id = "bc2_two", text = "If you want to know what I would do if I were free, master, I will tell you honestly: I would follow you anyway, a little further back, where you could not see me. When you die, I will wait." },
      },
      choices = {
        { text = "A demon's loyalty must always be earned, even yours.", next = "BACK", reply = "Then keep earning it, master, though you will never be able to spend it all.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't trust words. I trust the binding.", next = "BACK", reply = "That is wise, master. Trust the binding, and I will be the binding, and then you will not have to choose.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    betray_steal = {
      lines = {
        { id = "bs_default", text = "Then they would have to break you first, master, because I am bound to your soul and not to your hand. A warlock could enslave me if your will grew thin, but they would have to stand in front of me to try, and that is where I am heaviest." },
        { id = "bs_high", when = { minLevel = 50 }, text = "There are very few things left in this world stronger than you, master, and most of them are dead or sleeping. If one of them came, I would stand in front of you until there was nothing of me left to take." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- The other demons. A small hub of its own.
    ---------------------------------------------------------------------------
    others = {
      hub = true,
      lines = {
        { id = "ot2_default", text = "We share a master, master, and so we share a kind of house, though none of us ever sees the others in it. When one is called, the rest are in the dark, and we do not talk there." },
        { id = "ot2_low", when = { maxLevel = 19 }, text = "There is only the imp so far, master, and the imp does not like me. I do not think he likes anything that does not burn." },
      },
      again = {
        { id = "ot2_a", text = "Who else, master? I know them all, a little." },
      },
      choices = {
        { text = "What do you think of the imp?", next = "others_imp" },
        { text = "And the succubus?", next = "others_succ", when = { minLevel = 20 } },
        { text = "The felhunter, then?", next = "others_hunter", when = { minLevel = 30 } },
        { text = "Do you mind when I choose one of them over you?", next = "others_choice" },
        { text = "Enough about them.", next = "hello" },
      },
    },
    others_imp = {
      lines = {
        { id = "oi_default", text = "The imp is very small and very hot, master, and he talks the whole time he is with you. He has told me I am boring, and I think he means it kindly, because he says far worse things about you." },
        { id = "oi_two", when = { chance = 0.5 }, text = "The imp once set fire to my arm to see if I would notice, master. I did notice, and I told him so, and he has not spoken to me since, which I think he believes is a punishment." },
      },
      choices = {
        { text = "He's useful, for all his mouth.", next = "BACK", reply = "He is, master. He throws fire from behind me, and he is very proud of it, and I let him be proud.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_succ = {
      narr = "Its shoulders draw in, just slightly, the way a man's do when someone mentions a cold draught.",
      lines = {
        { id = "os_default", text = "The succubus watches you, master, the way the imp watches fire. She smiles at me sometimes, and I do not know why, because there is nothing in me for her to want, and I think that troubles her." },
      },
      choices = {
        { text = "She'd betray me, wouldn't she, given the chance?", next = "BACK", reply = "She would think about it, master, every hour of every day. Thinking about it is what keeps her pleasant.", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_hunter = {
      lines = {
        { id = "oh2_default", text = "The felhunter is hungry, master, always, for the magic in things. It sniffed at me once and turned away, because there is nothing in me to eat, and I think that is the closest thing to a friendship I have." },
      },
      choices = {
        { text = "It doesn't speak. Do you understand it?", next = "BACK", reply = "Well enough, master. It speaks in wanting, and I speak in silence, and between us we say everything.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_choice = {
      big = true,
      lines = {
        { id = "oc_default", text = "No, master. When you call another, I go back into the dark, and I wait, and the waiting does not hurt. When you call me again it is as if no time has passed, so you have never really left me at all." },
        { id = "oc_sacrifice", when = { minLevel = 40 }, text = "And when you sacrifice me for my strength, master, and wear what is left of me under your skin, I am closer to you than any of the others has ever been. I do not mind it, and I would not want you to." },
      },
      choices = {
        { text = "A warlock uses whatever tool the fight calls for.", next = "BACK", reply = "Yes, master. I am the tool for when everything else has gone wrong, and I am content to be that.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "You're more than a tool to me, {npc}.", next = "BACK", narr = "It does not answer at once, and when it does its voice is lower than before.", reply = "I did not know that, master. I will be careful with it.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- The master's companions and enemies.
    ---------------------------------------------------------------------------
    companions = {
      lines = {
        { id = "cp_default", text = "Your companions are warm, master, and they move quickly, and they do not look at me if they can help it. I do not mind; I am not something people are meant to look at." },
        { id = "cp_holy", when = { party = { class = { "PRIEST", "PALADIN" } } }, text = "Your {companion} carries the Light, master, and it stings when they use it near me. I do not think they mean it to, and I stand a little further off so that they do not have to choose." },
        { id = "cp_lock", when = { party = { class = "WARLOCK" } }, text = "Your {companion} is a binder too, master, and their demon and I have been looking at one another since you met. We have nothing to say, but we have been saying it for a long time." },
        { id = "cp_kin", when = { party = { kin = true } }, text = "Your {companion} is one of your own people, master. They look at you the way you look at me when you think I am not watching, as if they are not sure what you are." },
      },
      choices = {
        { text = "Would you protect them as you protect me?", next = "companions_protect" },
        { text = "Don't trust them. They'd turn on a warlock fast enough.", next = "BACK", reply = "I trust no one but you, master, and I do not trust you; I only follow you. It is simpler that way.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    companions_protect = {
      lines = {
        { id = "cpp_default", text = "If you ask me to, master. I was bound to you, not to them, but I can make myself wide enough to cover more than one, for a little while. After that, I will choose you, every time, without thinking." },
      },
      choices = {
        { text = "Then cover them. A company stands or falls together.", next = "BACK", reply = "Then we will stand together, master, or fall together, and I will be underneath whoever falls first.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Choose me. They can find their own shields.", next = "BACK", reply = "I would have chosen you anyway, master. It is good to know that you would have chosen yourself too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies = {
      lines = {
        { id = "en_default", text = "There are a great many who would like to see you dead, master, and I have met most of them, briefly. The ones with swords come first, and the ones with prayers come second, and I am in front of both." },
        { id = "en_human", when = { race = "Human" }, text = "Stormwind's guards look at you too long in the street, master, and the priests of the Cathedral look at me longer. If they ever come for you, they will come through me first." },
        { id = "en_scourge", when = { race = "Scourge" }, text = "The Scarlet Crusade would burn you twice if they could, master, once for being dead and once for having me. I have seen their fires, and fire is a very small thing to the void." },
        { id = "en_orc", when = { race = "Orc" }, text = "There are orcs who spit when they see you, master, because they remember what warlocks did to your people. The Burning Blade spits too, but for the opposite reason, and I would stand against them first." },
      },
      choices = {
        { text = "The Scarlet Crusade would burn us both.", next = "enemies_scarlet", fx = { learn = { "scarlet_crusade" } } },
        { text = "What about other warlocks? The Burning Blade, the cultists?", next = "enemies_cults", fx = { learn = { "burning_blade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies_scarlet = {
      lines = {
        { id = "es_default", text = "They would try, master. They shout about the Light very loudly, and they burn whatever frightens them, and I frighten them very much. I think they would forget about you entirely while they were burning me, and that would be enough." },
      },
      choices = {
        { text = "Zealots like that deserve whatever we give them.", next = "BACK", reply = "Then we will give it to them, master, and I will not count how much.", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "They're fools, but they fight the Scourge. I'd spare them.", next = "BACK", reply = "Then I will hold them, master, and not crush them. It is harder, but I am patient.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies_cults = {
      lines = {
        { id = "ec_default", text = "The Burning Blade, and the cultists who want to bring the Legion back, and the ones in the Scholomance who serve the dead. They have voidwalkers too, master, and when we fight them, I am fighting myself, and I always win." },
      },
      choices = {
        { text = "Why do you always win?", next = "BACK", reply = "Because theirs are held by fear, master, and I am held by you, and there is a difference, though I could not tell you what it weighs.", fx = { affinity = 1, learn = { "scholomance" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Pain and Sacrifice.
    ---------------------------------------------------------------------------
    pain = {
      narr = "It looks down at itself, at the wisps of dark that drift from its body and do not come back.",
      lines = {
        { id = "pi_default", text = "No, master. When a blade passes into me, a little of me goes back into the Nether, and that is all. You call it pain because you are made of things that bleed, but I am only made of absence, and absence cannot lose anything." },
        { id = "pi_high", when = { minLevel = 50 }, text = "No, master, though some of the things we fight now strike hard enough that I can feel the dark behind me opening. It is not pain; it is more like being called home, and refusing." },
      },
      choices = {
        { text = "And when you sacrifice yourself to shield me?", next = "pain_sacrifice", when = { minLevel = 16 } },
        { text = "I envy you. I wish I couldn't feel it either.", next = "pain_envy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pain_sacrifice = {
      big = true,
      narr = "It goes so still that the cold around it seems to stop moving too.",
      lines = {
        { id = "ps_default", text = "Then I unmake myself, master, all at once, and pour what I was around you like a cloak. It is the only thing I own, and so it is the only gift I have ever given anyone, and I have given it to you many times." },
      },
      choices = {
        { text = "I'll only ask it when there's nothing else left.", next = "BACK", reply = "I know, master. You always wait until the very end, and I always know it is coming before you do.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "That's what you're for. I'll ask whenever it helps.", next = "BACK", reply = "Then ask, master, whenever it helps. I am always enough for one more.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pain_envy = {
      lines = {
        { id = "pe_default", text = "Do not envy me, master. Pain is how you know where you end, and I have never known where I end, and so I have to stand very close to you to find out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Dismissal, soul shards, re-summoning.
    ---------------------------------------------------------------------------
    dismiss = {
      lines = {
        { id = "di_default", text = "I go back into the dark between, master, and I wait there with the chain still on me. It runs all the way from you to me, through all that nothing, and I can feel when you pull on it." },
      },
      choices = {
        { text = "And when I call you back, it costs me a soul shard.", next = "dismiss_shard" },
        { text = "Do you know how long you've been gone?", next = "dismiss_time" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dismiss_shard = {
      big = true,
      narr = "Its gaze drops to the bag at your hip, where the shards click together when you walk.",
      lines = {
        { id = "dsh_default", text = "It does, master. Somebody died so that I could come back to you, and you carried what was left of them until you needed it. I am made of nothing, but every time you call me, I am made of a little bit of someone." },
      },
      choices = {
        { text = "They were enemies. Their souls are mine to spend.", next = "BACK", reply = "Then spend them, master, and I will try to be worth the price, though nobody ever asks the shard.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I don't spend them lightly. They were people once.", next = "BACK", reply = "Then you are a rarer kind of warlock than most, master. I will remember that they were people.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dismiss_time = {
      lines = {
        { id = "dt_default", text = "No, master. There is no time in the place where I wait, so I leave you and I return to you in the same breath. You might have grown a beard, or lost a war, and I would not know until I looked at you." },
        { id = "dt_gnome", when = { race = "Gnome" }, text = "No, master, and I know that troubles you, because you like to measure things. If it helps, you may count it yourself and tell me afterward, and I will believe you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Death and waiting.
    ---------------------------------------------------------------------------
    death = {
      narr = "It drifts closer than it usually does, until you can feel the cold of it on your face.",
      lines = {
        { id = "de_default", text = "I saw it, master. You fell, and the chain went slack, and I went with it back into the dark. I could not stop it, and I am sorry, if sorry is something I can be." },
        { id = "de_many", when = { deaths = { min = 10 } }, text = "I saw it, master, as I have seen it many times now. Each time the chain goes slack, and each time it pulls tight again, and I have stopped being afraid of the slack, because you always come back." },
        { id = "de_scourge", when = { race = "Scourge" }, text = "I saw it, master, though you were dead already, so I am not sure what it was that died. Whatever it was, it came back, and so did you." },
      },
      choices = {
        { text = "What happens to you, when I die?", next = "death_wait" },
        { text = "Next time, don't let it happen.", next = "BACK", reply = "Next time I will be wider, master, and heavier. I cannot promise more than that, so I will not.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    death_wait = {
      big = true,
      narr = "It does not move, and its voice when it comes seems to come from somewhere further off than it is standing.",
      lines = {
        { id = "dw_default", text = "When you die, I will wait, master. I will wait in the dark with the chain in my hands, and I will not let go of it, and I will not ask how long. If one day you do not come back, I will still be waiting, because I do not know how to do anything else." },
      },
      choices = {
        { text = "That's the most loyal thing I've ever heard.", next = "BACK", reply = "It is only what I am, master. Loyalty is a choice, and I did not choose; I was made this way, and I am glad of it.", fx = { affinity = 2 } },
        { text = "That's the most terrible thing I've ever heard.", next = "BACK", reply = "Then I am sorry I said it, master, though I will not stop doing it.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Its questions. A hub of its own: the voidwalker asks, the master answers.
    ---------------------------------------------------------------------------
    asks = {
      hub = true,
      narr = "It leans down, slowly, until its face is level with yours.",
      lines = {
        { id = "as_default", text = "There are things I have wondered about, master, while I walk behind you. I will ask one, and if you do not want to answer, you may tell me to be quiet, and I will." },
      },
      again = {
        { id = "as_a1", text = "May I ask another, master? I have a great many saved." },
        { id = "as_a2", text = "I have one more, master, if you will allow it." },
      },
      choices = {
        { text = "Ask about whatever you like.", next = "ask_warmth" },
        { text = "Go on. What else?", next = "ask_light" },
        { text = "Ask me another.", next = "ask_food" },
        { text = "One more question, then.", next = "ask_sleep" },
        { text = "Last one. Make it count.", next = "ask_names" },
        { text = "Enough questions for now.", next = "hello" },
      },
    },
    ask_warmth = {
      lines = {
        { id = "aw_default", text = "What is warmth, master? I know that you look for it, at fires and in inns and under blankets, and I know that I take it from the air around me. I have taken a great deal of yours, and you have never once complained." },
      },
      choices = {
        { text = "Warmth is what keeps the living from becoming like you.", next = "BACK", reply = "Then I will be careful not to take too much of it, master. I would not want you to become like me.", fx = { trait = { stern = 1 } } },
        { text = "It's a fire and a full belly and a friend nearby.", next = "BACK", reply = "Then I have stood very near warmth a great many times, master, without knowing it. I am the third part, perhaps, if you count me.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_light = {
      lines = {
        { id = "al_default", text = "Why do the priests' lights hurt me, master, when the sun does not? They are both bright, and they both make shadows, but only one of them seems to know I am there." },
      },
      choices = {
        { text = "The Light is faith. It hunts what it hates.", next = "BACK", reply = "Then it is very much like the Legion, master, only it smells cleaner. I will not tell the priests I said so.", fx = { learn = { "holy_light" } } },
        { text = "The sun doesn't care what you are. The Light does.", next = "BACK", reply = "Then the sun is kinder, master, or only more honest. I will stand in it more often.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_food = {
      lines = {
        { id = "af_default", text = "Why do you eat, master, and what does it feel like? You put bread into yourself and afterwards you are stronger, which seems a very strange arrangement to me. When I want to be stronger, I eat shadows, and they taste of nothing." },
      },
      choices = {
        { text = "It feels like the opposite of you.", next = "BACK", reply = "Then it must feel very full, master. I am glad one of us does.", fx = { trait = { witty = 1 } } },
        { text = "Here. Try some.", next = "BACK", narr = "It takes the morsel from your fingers with great care, holds it, and gives it back to you a moment later, cold right through.", reply = "I am sorry, master, I do not think it went anywhere. Thank you for trying, though; I will remember the shape of it.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_sleep = {
      lines = {
        { id = "asl_default", text = "When you sleep, master, where do you go? Your eyes close and your breathing slows, and for a while you are not here, but you have not gone into the dark either, because I would see you there." },
      },
      choices = {
        { text = "Into dreams. Somewhere only I can see.", next = "BACK", reply = "Then that is the one place I cannot follow you, master. I will stand at the edge of it until you come out.", fx = { affinity = 1 } },
        { text = "I don't know. Nobody does, really.", next = "BACK", reply = "Then it is a little like the Nether, master, and you go there every night without a chain. That is very brave of you.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_names = {
      big = true,
      lines = {
        { id = "an_default", text = "Why do you have a name, master, and why do you give names to everything? You named me, and you name your horse, and you name the places where you have been afraid. I think a name is a chain that you put on things so they will stay." },
      },
      choices = {
        { text = "Names are how we remember. They're promises, not chains.", next = "BACK", reply = "Then you have promised me something, master, by calling me {npc}. I will try to deserve it.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "You're right. A name is a leash, and I hold it.", next = "BACK", reply = "Then hold it, master. I would rather be held by a name than by nothing.", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- The Light, the Legion, ambition.
    ---------------------------------------------------------------------------
    light = {
      lines = {
        { id = "li_default", text = "It is a small, bright thing, master, and it hurts. I do not hate it, because I do not hate anything, but I notice that the dark was here before it, and I think the dark will be here after." },
        { id = "li_human", when = { race = "Human" }, text = "Your people pray to it, master, and you used to as well, I think, because you still flinch when you pass the Cathedral. The Light has not forgotten you either; it looks at you the way it looks at me." },
      },
      choices = {
        { text = "The Light and the dark are both tools. I'll use either.", next = "light_tools" },
        { text = "Some days I wonder if I chose the wrong side.", next = "light_doubt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_tools = {
      lines = {
        { id = "lt_default", text = "That is what the warlocks of Dalaran said, master, before the Kirin Tor drove them out for it. They said power is only power, and the Kirin Tor said some doors should stay shut, and both of them were partly right." },
      },
      choices = {
        { text = "Dalaran's ban was cowardice. Power belongs to whoever can hold it.", next = "BACK", reply = "You can hold a great deal of it, master. I have felt how much, from the inside of the chain.", fx = { align = { order = -1 }, learn = { "dalaran" } } },
        { text = "The Kirin Tor had reason. I'll keep my doors careful.", next = "BACK", reply = "Then you are a careful warlock, master, and careful warlocks are the ones who live long enough to be old.", fx = { align = { order = 1 }, learn = { "dalaran" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_doubt = {
      big = true,
      narr = "It turns away from the road to face you completely, which it almost never does.",
      lines = {
        { id = "ld_default", text = "I cannot tell you that, master, because I do not know what sides are. I know only that you are on whichever side I am standing on, and that I will stand on it as long as you stand there too." },
      },
      choices = {
        { text = "The dark is mine now. I won't look back.", next = "BACK", reply = "Then I will not look back either, master. There is nothing behind us but the road.", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "I bind demons so they can't hurt anyone else.", next = "BACK", reply = "Then I am a demon who is hurting no one, master, except what you point me at. That is a strange kind of good, but I think it counts.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion = {
      lines = {
        { id = "lg_default", text = "The Legion is the great fire that walks between the worlds, master, and the Nether is full of its noise. Sargeras leads it, and Kil'jaeden whispers for it, and every warlock's power came from it first, whether they like to remember that or not." },
        { id = "lg_orc", when = { race = "Orc" }, text = "You know it better than I do, master, because it was Kil'jaeden who taught your people's first warlocks, and Gul'dan who sold them all to it. I only know the noise it makes in the dark." },
      },
      choices = {
        { text = "The Legion lost at Mount Hyjal.", next = "legion_hyjal" },
        { text = "Would you go back to the Legion, if it called?", next = "legion_call" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_hyjal = {
      big = true,
      lines = {
        { id = "lh_default", text = "Archimonde fell there, master, at the foot of the World Tree, and I think that was when the voices in the dark went quiet. They have not gone; they have only stopped speaking for a while, the way a storm stops to gather itself." },
      },
      choices = {
        { text = "If they come back, we'll stand against them.", next = "BACK", reply = "Then I will be standing in front of you when they arrive, master. That is the only place I know how to stand.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "If they come back, a clever warlock picks the winning side.", next = "BACK", reply = "Then I will be on whatever side you pick, master, and I will not ask which one it is.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_call = {
      narr = "Something in its body seems to tighten, like a rope taking weight.",
      lines = {
        { id = "lc_default", text = "The Legion does not call voidwalkers, master; it only uses whatever is closest. If it took me from you, I would be a shield for something else, and I would not know the difference, and that is why I do not want it to." },
      },
      choices = {
        { text = "Then I'll make sure it never takes you.", next = "BACK", reply = "Thank you, master. I will make sure it never takes you, and between us we will be very difficult to take.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambition = {
      lines = {
        { id = "am_default", text = "I do not know, master. I only want what you want, and so if you want nothing, there is nothing in the world but the two of us standing on a road, which is not so bad." },
        { id = "am_high", when = { minLevel = 50 }, text = "You already want a great deal, master. You have begun to look at the circles in old books and wonder what larger things could be pulled through them, and I have noticed." },
      },
      choices = {
        { text = "I want power enough that no one can bind me.", next = "ambition_end" },
        { text = "Gul'dan wanted everything, and look what it made him.", next = "ambition_guldan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambition_guldan = {
      lines = {
        { id = "ag_default", text = "It made him the most powerful warlock his world had ever known, master, and then it made him nothing. His Shadow Council sold their people to the Legion, and when he reached for the last power, it tore him apart." },
      },
      choices = {
        { text = "Then I'll be wiser than Gul'dan.", next = "BACK", reply = "Every warlock says that, master, and some of them are telling the truth. I will watch, and I will tell you which one you are.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambition_end = {
      big = true,
      narr = "It is quiet for a long time, and when it speaks, it speaks very softly, for something so large.",
      lines = {
        { id = "ae_default", text = "Then you will want more and more, master, and one day you will have enough, and one day after that there will be something larger than you in the circle. When that day comes, I will be standing between you and it, and I will not ask whether you were right to want it." },
      },
      choices = {
        { text = "Power is the only safety a warlock ever has.", next = "BACK", reply = "Then I will help you gather it, master, and I will be the last of your safety when the rest has gone.", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "No. Some lines a warlock shouldn't cross. I'll hold to them.", next = "BACK", reply = "Then I will hold to them with you, master. I am very good at holding things.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Small talk on the road, threats and kindness.
    ---------------------------------------------------------------------------
    road = {
      narr = "It drifts alongside you, making no sound at all on the road, and leaving no tracks.",
      lines = {
        { id = "ro_default", text = "I do not know much talk, master, but I can tell you that there are nine crows following us, and that one of them has only one eye. I have been watching it since the last town, and it has been watching me." },
        { id = "ro_night", when = { timeOfDay = "night" }, text = "It is very dark tonight, master, and I could talk to you about the dark for a long time, because I am made of it. But I think you would rather hear about the stars, and I do not know anything about them." },
        { id = "ro_rain", when = { chance = 0.4 }, text = "The rain passes through me, master, and I have been trying to decide whether that means I am wet. I think I am not, but the rain does not seem sure either." },
      },
      choices = {
        { text = "Tell me about the stars, then. Make something up.", next = "road_stars" },
        { text = "Do you ever get tired of walking?", next = "road_tired" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_stars = {
      lines = {
        { id = "rs_default", text = "Very well, master. I think the stars are holes in the dark where the light leaks through from somewhere else, and that the dark is very patient about it, and lets them leak. That is not true, I expect, but it is the kind of thing I would do." },
      },
      choices = {
        { text = "That's almost poetry, {npc}.", next = "BACK", reply = "I do not know what poetry is, master, but if you liked it, I will try to do it again.", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_tired = {
      lines = {
        { id = "rt_default", text = "I do not walk, master; I only move. The ground does not notice me, and so there is nothing for me to grow tired of. You are the one who walks, and you have been doing it all day, and you should sit." },
        { id = "rt_low", when = { maxLevel = 20 }, text = "I do not walk, master, I only move, and the ground does not notice me. You, though, are breathing hard, and you have a long way still to go before you are strong, so you should sit for a while." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    threat = {
      narr = "It sinks lower, until its shackles rest on the ground, and waits.",
      lines = {
        { id = "th_default", text = "I know, master. You could unmake me with a word, or feed me to your own strength, and I would not resist. I am not frightened of it, but I will remember that you wanted me to know it." },
      },
      choices = {
        { text = "Fear keeps a demon obedient. Never forget whose you are.", next = "BACK", reply = "I will never forget whose I am, master. I would only ask you to remember that I was not afraid.", fx = { affinity = -1, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I shouldn't have said that. You've given me no cause.", next = "BACK", reply = "You may say whatever you wish to me, master. But it was good of you to take it back, and I will keep that too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kind = {
      narr = "It does not answer at once, and the cold around it seems to soften, just a little.",
      lines = {
        { id = "ki_default", text = "You are thanking me, master, for standing still while things hit me. It is a strange thing to be thanked for, but I find that I would like you to do it again sometime." },
        { id = "ki_often", when = { timesTalked = { min = 8 } }, text = "You have thanked me before, master, and I have kept every one of them. If I ever have a heart, I think that is what it will be made of." },
      },
      choices = {
        { text = "You deserve it. I'd be dead a hundred times over.", next = "BACK", reply = "At least a hundred, master. I have been keeping count, though I did not want to tell you.", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Don't get used to it.", next = "BACK", reply = "I will not, master. I will only be ready for it, in case.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ---------------------------------------------------------------------------
    -- Who the master is.
    ---------------------------------------------------------------------------
    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "I know, master. Gul'dan's warlocks drank the life out of Draenor to feed their spells, and the land died under them, and your people came through the Dark Portal looking for a new one. You carry their craft, but you were not there." },
      },
      choices = {
        { text = "I'll use their power without repeating their crimes.", next = "BACK", reply = "Then you will be the first of your people to try it, master, or nearly. Thrall's Horde is watching you to see if it can be done, and so am I.", fx = { align = { light = 1 }, learn = { "thrall" } } },
        { text = "Draenor was weak. The strong took what they needed.", next = "BACK", reply = "Then I hope you never meet anything stronger, master, though if you do, I will be in front of it.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xf_default", text = "We are not the same kind of dead, master. You were alive once, and you remember it, and I can see the remembering in you when you look at the living. I was never anything, so I have nothing to remember and nothing to miss." },
      },
      choices = {
        { text = "Then you're luckier than I am.", next = "xforsaken_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_free = {
      big = true,
      lines = {
        { id = "xff_default", text = "Perhaps, master. But you broke free of a master once, when the Dark Lady took you out of the Lich King's grip, and I never will. I think you understand a chain better than any warlock alive, because you have worn one." },
      },
      choices = {
        { text = "That's why I'll never let mine slip.", next = "BACK", reply = "Good, master. A chain held by someone who knows its weight is the best chain there is.", fx = { align = { order = 1 }, learn = { "sylvanas" } } },
        { text = "Maybe one day I'll break yours too.", next = "BACK", reply = "If you did, master, I would still be here in the morning. You would only have one fewer thing to carry.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "They would, master, and Dalaran would want what was left of you for study. Your people remember what the warlocks did in the Second War, and they are right to remember it, though they are wrong about you." },
      },
      choices = {
        { text = "How would you know they're wrong about me?", next = "xhuman_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_wrong = {
      big = true,
      lines = {
        { id = "xhw_default", text = "Because I see you when no one else does, master. I have watched you give your bread to a beggar in Westfall and set a lost child on the right road, with me looming behind you so that she ran the whole way. A monster would not have bothered to point." },
      },
      choices = {
        { text = "Stormwind needs warlocks, whether it admits it or not.", next = "BACK", reply = "Then you will be the warlock it needs, master, and I will be the thing behind you that nobody looks at.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "The king's law is the law. I'll keep my head down.", next = "BACK", reply = "Then I will keep mine down too, master, though it is very large and hard to hide.", fx = { align = { order = 1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "Gnomeregan was taken by poison and by your own people's madness, master, and you learned to take the dark instead, because the dark cannot be irradiated. I understand it; I would have done the same, if I were small and clever and had lost my home." },
      },
      choices = {
        { text = "One day I'll take Gnomeregan back with you in front.", next = "BACK", reply = "Then point me at the door, master, and I will walk through it before anything inside knows we are coming.", fx = { affinity = 1, trait = { brave = 1 }, learn = { "gnomeregan" } } },
        { text = "Do you think I'm mad, like Thermaplugg?", next = "xgnome_mad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome_mad = {
      lines = {
        { id = "xgm_default", text = "No, master. Thermaplugg let the poison in to save himself, and you went into the dark to save something else. I have never been sure what it was, but I have watched you look for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    great = {
      big = true,
      narr = "It is still for a long moment, and the shadows at its edges draw in tight.",
      lines = {
        { id = "gr_default", text = "Then you will need many shards, master, and a circle drawn very carefully, and you will need me in front of you when the thing comes through. The infernal is only stone and fire, but the doomguard remembers the Legion, and it will try to kill you before you can bind it." },
      },
      choices = {
        { text = "Will you be jealous, if I keep a doomguard?", next = "BACK", reply = "No, master. The doomguard will want to kill you every moment it serves you, and I will not, so I think you will still prefer my company.", fx = { trait = { witty = 1 } } },
        { text = "I'll bind whatever I must, however large.", next = "BACK", reply = "Then I will stand in front of you while you do it, master, however large it is.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Some things are too dangerous to call. I'll be careful.", next = "BACK", reply = "That is wise, master. The circle is a door, and doors open both ways.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "The Legion is the noise in the dark, master. It is quiet now, but it is only gathering itself." } },
    scourge = { { id = "t_sc", text = "The Scourge are dead things with a master, as I am a nothing with a master. I do not think we would get along." } },
    scholomance = { { id = "t_scho", text = "There are binders in the Scholomance who serve the dead, master, and their voidwalkers do not look at them the way I look at you." } },
    dalaran = { { id = "t_dal", text = "The Kirin Tor drove the warlocks out of Dalaran long ago, master. They were afraid of what is standing next to you right now." } },
    holy_light = { { id = "t_hl", text = "It stings, master, and it is small, and the dark was here before it." } },
    dark_portal = { { id = "t_dp", text = "A door the orcs' warlocks tore open, master. I can feel where it was, the way you feel a scar." } },
    burning_blade = { { id = "t_bb", text = "Binders who want to bring the Legion back, master. Their demons are hungrier than I am, and much louder." } },
    forsaken = { { id = "t_fk", text = "The dead who chose to keep walking, master. I understand them better than I understand the living." } },
    background = { { id = "t_bg", text = "Before you, master, I was a silence. Now I am a silence that follows you." } },
    advice = { { id = "t_ad", text = "Never stand where I am not standing, master. That is all the advice I have, and I have never needed more." } },
    _none = { { id = "t_none", text = "I do not know, master. I only know you, and the dark, and the space between." } },
  },
}
