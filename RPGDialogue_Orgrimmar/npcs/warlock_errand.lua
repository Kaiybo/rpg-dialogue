-- The Orgrimmar succubus errand and the people it passes through: Gan'rul Bloodeye, who trains
-- warlocks in the Cleft; blind Cazul; and Zankaja, waiting on the bluffs for Grunt Dogran.
-- Voices: bibles/warlock_errand.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Gan'rul Bloodeye: warlock trainer, proud of his pupils, cold about the price.
---------------------------------------------------------------------------
P:NPC {
  key = "ganrul", id = TODO_NPC("Gan'rul Bloodeye"), name = "Gan'rul Bloodeye", title = "Warlock Trainer",
  bible = "bibles/warlock_errand.md", role = "trainer", tier = "quest",
  communities = { "orgrimmar" }, temper = { "proud", "smooth" }, values = { "ambitious", "practical" },
  notices = { "fel", "class" },
  impression = {
    first = "Gan'rul Bloodeye teaches warlocks in the Cleft of Shadow and calls each promising one his star pupil, which is flattering until you notice he says it to all of them. He is warm about power and cool about what it costs other people.",
    third = "{name} met Gan'rul Bloodeye, a warlock trainer in Orgrimmar's Cleft of Shadow.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the circle on the floor, it's still warm. Now, what brings you down to the Cleft?" },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Ah, there you are. I was beginning to think the Barrens had eaten another of my pupils." },
    { id = "g_succ", when = { class = "WARLOCK", pet = { family = "Succubus" } }, text = "And how is your succubus behaving? Firmly, I hope, because they only respect a hand that never loosens." },
  },

  notice = {
    { id = "n_imp", cat = "fel", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Still walking with the imp, I see. It's a fine first servant, but you'll want something with more weight behind it soon." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman in the Cleft, and you haven't spat on my floor yet. The spirits must be teaching manners these days." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gan'rul Bloodeye, and I teach the warlocks of Orgrimmar to command what lesser minds only fear. The Warchief tolerates us because we're useful, and I make very sure we stay useful." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "Gan'rul Bloodeye, as you know, and I sense the possibility of greatness in you, {name}. See that your gifts don't go to waste, because they have a way of rotting when they're left alone." },
        { id = "h_devourer", when = { questActive = TODO_QUEST("Devourer of Souls") },
          text = "A succubus will not answer just any call. She must be baited with something that holds real devotion, a gift of love, and Cazul in the Cleft may know where such a thing can be found." },
        { id = "h_gift", when = { questRecent = { TODO_QUEST("Love's Gift"), days = 1 } },
          text = "This pendant will serve, though I'll clean it first, since a thing that shines entices better. Take it to the circle in Neeru's tent and show the creature who is master." },
      },
      again = {
        { id = "h_again", text = "Yes? I have pupils waiting, but I can spare a moment for one more question." },
        { id = "h_again2", text = "Go on. Curiosity is the first sign of a good warlock, and greed is the second." },
      },
      choices = {
        { text = "What will you teach me next?", next = "lessons", when = { class = "WARLOCK" } },
        { text = "Who is Cazul?", next = "cazul" },
        { text = "Why does Orgrimmar allow warlocks at all?", next = "why" },
        { text = "What will you tell Zankaja about Dogran?", next = "zankaja", when = { questDone = TODO_QUEST("Love's Gift") } },
        { text = "Where do I find Strahad Farsan?", next = "strahad", when = { class = "WARLOCK", minLevel = 28 } },
        { text = "I'll leave you to your circle.", next = "END" },
      },
    },
    lessons = {
      lines = { { id = "le_default", text = "First the voidwalker, which teaches you to stand behind something that takes the blows. Then the succubus, which teaches you that a weak mind can be bent, and later the felhunter, which teaches you to hunt the magic of others." } },
      choices = {
        { text = "And what teaches me caution?", next = "caution" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caution = {
      lines = { { id = "ca_default", text = "Every warlock who ever died screaming in a circle learned caution at the end, which is too late to be any use. Pride and overconfidence have eaten more promising students than demons have, so keep a little fear and you'll keep your skin." } },
      choices = { { text = "Something else, Gan'rul.", next = "BACK" } },
    },
    cazul = {
      lines = { { id = "cz_default", text = "Cazul is blind and older than any orc in the Cleft has a right to be, and he knows more of the summoning arts than I'll ever say aloud. He doesn't speak of how he lost his eyes, and I've learned not to ask him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because when the Alliance comes over the hills, the Warchief wants every weapon he has, and we are a weapon that never tires. The shaman think we're a stain on the Horde, and perhaps we are, but a stain that keeps you alive is easy to forgive." } },
      choices = {
        { text = "Power is power. The Horde should use all of it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "The shaman are right. Fel nearly destroyed us once.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zankaja = {
      big = true,
      lines = { { id = "za_default", text = "I'll tell her that Dogran died bravely, fighting the quilboar, which is what he wanted and will soon enough be true. She's young, and grief will pass faster than a lifetime spent nursing a broken mate." } },
      choices = {
        { text = "That's a kindness. Let her grieve and move on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "She deserves the truth, whatever he asked.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strahad = {
      lines = { { id = "st_default", text = "Strahad Farsan keeps a tower in Ratchet and calls his students acolytes, which tells you everything about Strahad. He'll teach you the felhunter, though, and he does it well, so go and endure his manner." } },
      choices = { { text = "Something else, Gan'rul.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the craft from the Shadow Council's leavings, and I learned to hide it in the camps. Now I teach it in the open, more or less." } },
    advice = { { id = "tp_ad", text = "Never summon what you can't send back, and never let a demon see you hesitate." } },
    _none = { { id = "tp_none", text = "That is a question for a scholar, not a warlock. Ask someone with more patience and fewer pupils." } },
  },
}

---------------------------------------------------------------------------
-- Cazul: blind, ancient, and very sure what power costs.
---------------------------------------------------------------------------
P:NPC {
  key = "cazul", id = TODO_NPC("Cazul"), name = "Cazul",
  bible = "bibles/warlock_errand.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "grim" }, values = { "ambitious", "cunning" },
  notices = { "fel", "class" },
  impression = {
    first = "Cazul is a blind orc warlock so old that his tusks have yellowed to the colour of bone, and he turns his face toward voices a moment before they speak. He talks of power as a debt that must always be paid, and he sounds as if he has paid a great deal of it.",
    third = "{name} met Cazul, an ancient and blind warlock in Orgrimmar's Cleft of Shadow.",
  },

  greetings = {
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Most who come down here want power, and very few of them are willing to pay for it. Come closer, warlock, so I can hear which kind you are." },
    { id = "g_other", text = "My legs are old and my eyes are gone, and I don't care to say how I lost them. What business could you possibly have with a blind old orc, {class}?" },
  },

  notice = {
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK", pet = { family = "Voidwalker" } },
      text = "Your voidwalker hums like a struck bell. I can't see it, but I've heard that sound for longer than you've been alive." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cazul, and my eyes are useless, so you'll forgive me if I stare at the wall while we talk. Power belongs to those willing to pay its price, and I paid mine a long time ago." },
        { id = "h_devourer", when = { questActive = TODO_QUEST("Devourer of Souls") },
          text = "If Gan'rul has sent you to me, you are to summon a succubus and need an object to entice her. If you trust a blind man to lead you, then listen, because I know of a young woman who has exactly what you need." },
        { id = "h_after", when = { class = "WARLOCK", pet = { family = "Succubus" } },
          text = "I can hear her heels on the stone behind you, so you've bound her. Was the price heavier than you expected, or have you not noticed it yet?" },
      },
      again = {
        { id = "h_again", text = "Still here? Then ask, and I'll answer if it amuses me." },
        { id = "h_again2", text = "Your breathing tells me you have another question." },
      },
      choices = {
        { text = "What blinded you?", next = "blind" },
        { text = "What is the price of power?", next = "price" },
        { text = "Where do I find Zankaja?", next = "zankaja", when = { class = "WARLOCK" } },
        { text = "Why must the succubus be baited with love?", next = "succubus", when = { class = "WARLOCK" } },
        { text = "Why does an old orc sit down here in the dark?", next = "dark" },
        { text = "I'll leave you in peace, old one.", next = "END" },
      },
    },
    blind = {
      lines = { { id = "bl_default", text = "I looked at something I was told not to look at, a long time ago in Draenor, and it looked back at me. I'll say no more than that, because some things should die with the one who saw them." } },
      choices = {
        { text = "Was it worth it?", next = "blind2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blind2 = {
      lines = { { id = "b2_default", text = "I learned in one moment what took my teachers a lifetime, and I have never been sure since what I lost and what I gained. Ask me again when you're old, and I'll ask you the same." } },
      choices = { { text = "Something else, Cazul.", next = "BACK" } },
    },
    price = {
      big = true,
      lines = { { id = "pr_default", text = "Every spell you take from the Nether is paid for in something, warlock, whether it's your health, your sleep, or someone else's happiness. The fools pretend there is no bill, and the wise decide in advance who will pay it." } },
      choices = {
        { text = "Then I'll pay it myself, and no one else.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let others pay. That's what the wise do.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zankaja = {
      lines = { { id = "zk_default", text = "In the bluffs of Orgrimmar, west of the wind rider tower, lives Zankaja, and she waits for the return of her mate. He went to the Crossroads and hasn't come home, and her heart is full of exactly the sort of devotion a succubus craves." } },
      choices = {
        { text = "You'd use her grief as bait.", next = "bait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = { { id = "ba_default", text = "I'd use whatever works, and so will you, or you'll go back to Gan'rul with empty hands. Go and speak with her, help her if you can, and see what devotion looks like when it's held in a fist." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    succubus = {
      lines = { { id = "su_default", text = "Because a succubus feeds on wanting, and nothing in this world is wanted so badly as the beloved who isn't there. Bring her a token of love that's real, and she will come to it like a moth to a lamp." } },
      choices = { { text = "Something else, Cazul.", next = "BACK" } },
    },
    dark = {
      lines = { { id = "dk_default", text = "Light and dark are all the same to me now, {class}, and the Cleft is quieter than the Valley of Strength. The young ones come to me for answers, and I'm too old to go looking for them anywhere else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I studied under the Shadow Council's lesser masters, and I outlived every one of them. Draw what conclusion you like from that." } },
    advice = { { id = "tp_ad", text = "Never look at anything you can't afford to remember." } },
    _none = { { id = "tp_none", text = "I don't know, and at my age I've stopped pretending to." } },
  },
}

---------------------------------------------------------------------------
-- Zankaja: young, waiting on the bluffs for a mate who won't come back.
---------------------------------------------------------------------------
P:NPC {
  key = "zankaja", id = TODO_NPC("Zankaja"), name = "Zankaja",
  bible = "bibles/warlock_errand.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "anxious", "warm" }, values = { "loyal", "honest" },
  notices = { "class", "weary" },
  impression = {
    first = "Zankaja is a young orc who keeps watch from the bluffs west of the wind rider tower, looking down the road toward the Barrens. Her mate Dogran went to the Crossroads on a promotion and hasn't come back, and she asks every traveller for news.",
    third = "{name} met Zankaja, a young orc in Orgrimmar waiting for her mate, Grunt Dogran, to come home from the Crossroads.",
  },

  greetings = {
    { id = "g_hi", text = "Have you come from the Barrens? Forgive me, I ask everyone, but I can't help it." },
    { id = "g_news", when = { class = "WARLOCK", questActive = TODO_QUEST("Blind Cazul") }, text = "Have you come with news of Dogran? He was to have returned days ago, and I've heard nothing at all." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Did you hear anything at the Crossroads?" },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { minLevel = 15 },
      text = "You've the Barrens' dust on your boots. Did you pass the Crossroads on the way?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Zankaja, and I watch the road from here because it's the only place in the city where I can see the wind riders come in from the Crossroads. My mate, Dogran, was sent there on a promotion, and he should have been home a week ago." },
        { id = "h_active", when = { questActive = TODO_QUEST("News of Dogran") },
          text = "You'll go to the Crossroads for me? Ask Gazrog, he keeps the duty rolls there, and he'll know where Dogran was sent. He'd want me to know, whatever it is." },
        { id = "h_after", when = { questDone = TODO_QUEST("Love's Gift") },
          text = "Gan'rul Bloodeye came to me himself and said that Dogran fell fighting the quilboar, bravely, the way he always said he would. I keep coming up here anyway, because my feet don't believe it yet." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I don't mind the company, truth be told." },
        { id = "h_again2", text = "Go on, ask. It's better than watching the sky alone." },
      },
      choices = {
        { text = "Tell me about Dogran.", next = "dogran" },
        { text = "Are you afraid for him?", next = "barrens" },
        { text = "Why wait up here, on the bluffs?", next = "bluffs" },
        { text = "Did you believe Gan'rul?", next = "truth", when = { class = "WARLOCK", questDone = TODO_QUEST("Love's Gift") } },
        { text = "I hope he comes home soon.", next = "END" },
      },
    },
    dogran = {
      lines = { { id = "do_default", text = "He's loud and he laughs too much, and he was so proud of that promotion that he wore his new pauldron to supper. I was sad when he left, of course, but I didn't let him see it, because I didn't want to spoil it for him." } },
      choices = {
        { text = "What did he give you before he left?", next = "pendant" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pendant = {
      lines = { { id = "pe_default", text = "Nothing, he's useless at gifts, but I gave him one, a little pendant I bought in the Drag with a season's savings. He promised he'd wear it under his armour, where nobody could tease him for it." } },
      choices = { { text = "Something else, Zankaja.", next = "BACK" } },
    },
    barrens = {
      big = true,
      lines = { { id = "ba_default", text = "The Barrens are more dangerous than the city, and everyone knows it, with the centaur and the quilboar and the Alliance in Northwatch. I keep telling myself he's a grunt and this is what grunts do, but it doesn't help as much as it should." } },
      choices = {
        { text = "Grunts serve where they're sent. He'd want you proud.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No promotion is worth leaving you alone up here.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bluffs = {
      lines = { { id = "bl_default", text = "From here I can see every wind rider that comes in from the south, and every runner on the road. The other grunts' mates wait in the Valley of Strength, but they gossip, and I'd rather listen to the wind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    truth = {
      big = true,
      lines = { { id = "tr_default", text = "You were the one who went looking for him, weren't you? Gan'rul said a warlock found him. Please, if there's anything more, I'd rather hear it from you than wonder for the rest of my life." } },
      choices = {
        { text = "He lived, but crippled, and he chose to die fighting.", next = "truth_told", fx = { align = { honor = 1 } } },
        { text = "He died bravely. That's all there is to tell.", next = "truth_kept", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I can't speak of it. I'm sorry.", next = "BACK" },
      },
    },
    truth_told = {
      lines = { { id = "tt_default", text = "Chose to? Oh, Dogran, you stubborn fool, I'd have carried you up these steps every day if you'd let me. Thank you for telling me, I think, though I don't know yet whether I'll hate you for it." } },
      choices = { { text = "I'm sorry, Zankaja.", next = "END" } },
    },
    truth_kept = {
      lines = { { id = "tk_default", text = "Then he died the way he wanted, and I'll be proud of him, the way I promised. Thank you for coming to tell me, and for looking for him at all." } },
      choices = { { text = "Take care of yourself.", next = "END" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was born in a camp, though I barely remember it, so Orgrimmar is the only place that ever felt like home." } },
    advice = { { id = "tp_ad", text = "Tell the people you love that you're sad when they leave. I didn't, and I wish I had." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm afraid. I mostly know which wind rider is which." } },
  },
}
