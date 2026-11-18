-- Deathknell's other residents: Venya Marthand (the warlock's first binding, Piercing the Veil),
-- Kayla Smithe (demon trainer, with her imp) and Archibald Kava (cloth and leather).
-- Voices: bibles/deathknell_folk.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kayla Smithe
---------------------------------------------------------------------------
P:NPC {
  key = "kayla_smithe", id = TODO_NPC("Kayla Smithe"), name = "Kayla Smithe", title = "Demon Trainer",
  bible = "bibles/deathknell_folk.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "wry" }, values = { "practical", "loyal" },
  notices = { "pet" },

  impression = {
    first = "She speaks of her sulking imp like a bad-tempered old dog.",
    third = "{name} met Kayla Smithe, the demon trainer of Deathknell.",
  },

  greetings = {
    { id = "g_default", text = "Don't step on the imp. He bites, and then he sulks, and the sulking is worse." },
  },

  notice = {
    { id = "n_demon", cat = "pet", when = { pet = { type = "Demon" } },
      text = "Your {pet} has been chewing something it shouldn't, I can always tell. Bring it here and we'll teach it a better habit." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kayla Smithe. I teach your demons what Maximillion Crowe, the warlock trainer, teaches you, which is how to be more useful and less trouble, and the second lesson always takes longer." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, before he finds my ink again." },
      },
      choices = {
        { text = "Teach my demon something new.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "How do you teach a demon?", next = "teach" },
        { text = "Whose imp is that?", next = "imp" },
        { text = "Does he have a name?", next = "name" },
        { text = "How does one of the risen end up training demons?", next = "risen" },
        { text = "The rest of Deathknell can't love having demons about.", next = "others" },
        { text = "My imp won't listen to a word I say.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Shadow Priest Sarvis can't approve of all this.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "I'll go.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "The same way you teach a dog, except the dog doesn't know its own name in a language older than the world. You show it what you want, you reward it with a little of your power, and you never let it think the idea was its own." } },
      choices = {
        { text = "What happens if it does?", next = "teach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach2 = {
      lines = { { id = "t2_default", text = "Then it starts having ideas, and each idea is worse than the last, and one morning you find it has rearranged your books to see what you'll do. I've lost two good grimoires that way, and one very good pair of boots." } },
      choices = { { text = "No ideas for my demon, then.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    imp = {
      big = true,
      lines = { { id = "i_default", text = "Mine, and he's been with me since I first rose, which makes him the longest friend I've had in either life. He bites, he lies and he steals my ink, and I wouldn't trade him for every voidwalker in the Undercity." } },
      choices = {
        { text = "A demon is no friend. Keep it leashed.", next = "BACK", reply = "Leashed? He'd chew through a leash before supper, and so would you if you'd spent your life in the Twisting Nether. I keep him close because I trust him exactly as far as I can see him.", fx = { align = { order = 1 } } },
        { text = "Loyalty is loyalty, even from an imp.", next = "BACK", reply = "There, you see, the imp heard that and he'll be insufferable all evening. Still, you're right, and it's more kindness than I ever got from the priests who buried me.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "nm_default", text = "He has one, a real one, which I'm not telling you, because a demon's true name is a leash and I'm not handing mine to strangers. In company I call him Inkpot, after his favourite crime, and he pretends to hate it." } },
      choices = {
        { text = "Does he really hate it?", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = { { id = "n2_default", text = "He bit the last person who used it who wasn't me, so I'd say he's rather proud of it. Imps are vain little things, and vanity is the easiest handle a trainer ever gets." } },
      choices = { { text = "I'll stick to calling him 'sir'.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    risen = {
      lines = { { id = "ri_default", text = "I woke in the Deathknell graves with a warlock's hands and no memory of learning the trade, and an imp was sitting on my chest, waiting. Either he followed me through death or he was simply the first one to find me, and he's never said which." } },
      choices = {
        { text = "And then?", next = "risen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    risen2 = {
      lines = { { id = "r2_default", text = "Then Maximillion saw me bully the little wretch into fetching my shroud, and said I'd a better hand with demons than with students. He was right, which he enjoys being, and I've trained the demons of every warlock who's risen here since." } },
      choices = {
        { text = "Do you remember anything of your life?", next = "risen3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    risen3 = {
      lines = { { id = "r3_default", text = "A house in Lordaeron with a cellar I wasn't supposed to go into, and the smell of candle wax. That's the lot, and I've decided it's a mercy, because whoever I was down in that cellar, I doubt I'd like her." } },
      choices = {
        { text = "You can be someone better now.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "ot_default", text = "Executor Arren puts up with it, because the Forsaken need every weapon they can lay hands on. The deathguards give my imp a wide berth, and Novice Elreth keeps a bucket of water by the door, which he finds very insulting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarlock = {
      lines = { { id = "xw_default", text = "Of course he won't, because you've been asking. Tell him, flatly, and give him a reason to want what you want, such as the promise of something to set on fire later." } },
      choices = {
        { text = "Tell him, don't ask him. I'll try that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = { { id = "xp_default", text = "Sarvis approves of anything that keeps the Forsaken alive, in our manner of speaking, and so do I. He calls on the shadow and I call on the Nether, and we've agreed not to compare notes at supper." } },
      choices = { { text = "A wise arrangement. Let me ask something else.", next = "BACK" } },
    },
  },

  topics = {
    burning_legion = { { id = "tp_legion", text = "The imps come from the same Nether the Legion does, I'm told, which is why you keep them small and keep them busy. A busy imp is a harmless imp, mostly." } },
    forsaken = { { id = "tp_forsaken", text = "We're free of the Lich King, and some of us use our freedom to bind demons, which I admit is a choice. Mine bites me less than the Scourge ever did." } },
    _none = { { id = "tp_none", text = "Ask my imp. He'll tell you something, and it'll even be true now and then." } },
  },
}

---------------------------------------------------------------------------
-- Archibald Kava
---------------------------------------------------------------------------
P:NPC {
  key = "kava", id = TODO_NPC("Archibald Kava"), name = "Archibald Kava", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/deathknell_folk.md", role = "vendor", tier = "service",
  communities = { "deathknell" }, temper = { "dry" }, values = { "practical", "kind" },
  notices = { "kit" },

  impression = {
    first = "He unpicks the red from Scarlet coats before he sells them.",
    third = "{name} met Archibald Kava, who sells cloth and leather armor in Deathknell.",
  },

  greetings = {
    { id = "g_default", text = "Out of the shroud and into something decent, that's my trade. What can I fit you for?" },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Bless me, you've barely a stitch on, and the bats in this valley have very sharp teeth. Let me find you a jerkin before something takes a bite." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Archibald Kava, cloth and leather, for those who woke in the Deathknell graves with nothing but a burial shroud. You've moved on from the shroud, I see, and I've something better if you have the coin." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've seams to finish." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Where do your clothes come from?", next = "source" },
        { text = "Do the dead care how they look?", next = "look" },
        { text = "What becomes of the red you unpick?", next = "red" },
        { text = "And the burial shrouds people leave behind?", next = "shroud" },
        { text = "What would suit someone like me?", next = "fit" },
        { text = "Have you anything in my size, tailor?", next = "xbig", when = { race = { "Tauren", "Orc", "Troll" } } },
        { text = "I need leather that doesn't creak.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll go.", next = "END" },
      },
    },
    source = {
      big = true,
      lines = { { id = "s_default", text = "From the Undercity's tailors, mostly, and the rest from what the deathguards bring back off the fields, washed twice and mended once. Some of it belonged to the Scarlets, and I unpick the red before I sell it, stitch by tedious stitch." } },
      choices = {
        { text = "Spoils of war are fair. I'd wear the red proudly.", next = "BACK", reply = "Then you'll be the only one in Deathknell wearing it, and the Scarlets do love a target that announces itself. Wear it proudly, by all means, but walk quickly.", fx = { align = { honor = -1 } } },
        { text = "I'd rather wear something not stripped off a corpse.", next = "BACK", reply = "So would I, but the dead are poor weavers and nobody in the Glades has kept sheep since the plague. Everything here is washed and mended, at least, which is more honesty than the Crusade ever wore.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = { { id = "l_default", text = "Plenty, because a body that's coming apart at the seams still wants a decent coat over it. The vain ones come back every week, and I don't mind, since vanity is a sign somebody's still in there." } },
      choices = {
        { text = "Is somebody still in there, usually?", next = "look2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    look2 = {
      lines = { { id = "l2_default", text = "In most of them, yes, and it's the ones who stop caring how they look that I worry about. Novice Elreth at the chapel sends me the ones who've gone quiet, and I find them a hat, and sometimes that's enough to start them talking again." } },
      choices = { { text = "That's kind of you, Kava.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    red = {
      lines = { { id = "re_default", text = "I burn it in the brazier by the chapel, a spool or two a week, and Executor Arren tells me I'm wasting good thread. He's right, of course, and I go on doing it." } },
      choices = {
        { text = "Why burn it?", next = "red2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    red2 = {
      lines = { { id = "r2_default", text = "Because a coat ought to start its new life clean, the same as the ones who wear it. And because every Crusader who wore that red would've burned me, so it seems only fair to return the favour to the thread." } },
      choices = { { text = "Fair enough, Kava.", next = "BACK", fx = { affinity = 1 } } },
    },
    shroud = {
      lines = { { id = "sh_default", text = "They come back to me, folded or not, and I cut them up for linings and bandages. Good linen, most of them, since Lordaeron buried its dead well before it stopped burying them at all." } },
      choices = {
        { text = "Doesn't anyone want to keep theirs?", next = "shroud2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shroud2 = {
      lines = { { id = "s2_default", text = "Some do, and I let them, and I don't ask why. One fellow wears his under his armour as a sort of shirt, and says it reminds him he's had the worst day he'll ever have already." } },
      choices = {
        { text = "That's one way to keep your courage.", next = "shroud3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shroud3 = {
      big = true,
      lines = { { id = "s3_default", text = "It is, and there are two schools of thought among the risen. Some say keep the shroud and never forget what was done to us, and some say burn it and never look back. Which school are you?" } },
      choices = {
        { text = "Keep it. Never forget what was done to us.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn it. What's past is past.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit = {
      lines = {
        { id = "fi_default", text = "Something that fits now and lets out later, because the risen fill out a little once they're moving again, odd as that sounds. Leather for the fighters, cloth for the spellcasters, and a good hood for everyone, since the bats go for the ears." },
        { id = "fi_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Cloth, and a long sleeve, because you'll be waving your hands about and the bats go for whatever's flapping. A hood too, for the ears, and you'll thank me the first time a duskbat swoops." },
        { id = "fi_rogue", when = { class = { "ROGUE", "WARRIOR" } }, text = "Leather, and plenty of it at the joints, since the risen tend to come apart there first. I'd add a hood, because the bats go for the ears and you won't feel it till one's gone." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbig = {
      lines = { { id = "xb_default", text = "Not on the rack, no, since Deathknell doesn't get many of the Warchief's people. Give me a day and two hides and I'll let something out, though I make no promises about the tail, if you've one." } },
      choices = { { text = "At least there's no tail to worry about. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "Then oil it every night and never let it dry by a fire, and keep it supple at the knee. The leather won't creak if you treat it well, though I can't say the same for your bones." } },
      choices = { { text = "Oil it is, then. Something else.", next = "BACK" } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They make good coats, I'll give them that, and they wear them very proudly. I take the red out and give the rest a better owner." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron dressed well and buried its people in good linen. I've got bolts of that linen still, and I'm not too proud to use it." } },
    _none = { { id = "tp_none", text = "I measure people, I don't question them. Ask Executor Arren." } },
  },
}
