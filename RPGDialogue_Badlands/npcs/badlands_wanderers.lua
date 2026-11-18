-- Out in the Badlands, away from Kargath: Lotwil's assistant Lucien Tosselwrench, and Garek, the Kirin Tor's quiet envoy near Dustwind Gulch. Voice: bibles/badlands_wanderers.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lucien Tosselwrench: Lotwil Veriatus's loyal, pessimistic assistant and a good alchemist.
P:NPC {
  key = "bl_lucien", id = TODO_NPC("Lucien Tosselwrench"), name = "Lucien Tosselwrench",
  bible = "bibles/badlands_wanderers.md", role = "questgiver", tier = "quest",
  communities = { "badlands_camp" }, temper = { "anxious", "dry" }, values = { "loyal", "careful", "craft" },
  notices = { "craft", "race", "class" },

  impression = {
    first = "Lucien Tosselwrench is Lotwil Veriatus's assistant, a gnome alchemist who has made his peace with working beside a man who talks to rocks. He expects every experiment to end badly and stays anyway, which says something about him.",
    third = "{name} met Lucien Tosselwrench, assistant to Lotwil Veriatus at his camp in the Badlands.",
  },

  greetings = {
    { id = "g_default", text = "Oh, a visitor. Please don't touch the cart; it's holding three things that don't like each other, and only one of them is Servo." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and with all your fingers, which is a good sign in this camp. What can I do for you?" },
    { id = "g_away", when = { away = 14 }, text = "It's been {away}, and in that time Lotwil has started four experiments and finished none. I've been counting." },
    { id = "g_progress", when = { questActive = TODO_QUEST("Liquid Stone") }, text = "Lotwil is getting closer to finishing his binding, I'm afraid. Have you found those potions yet?" },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You smell of alchemy, the good kind, with a little scorch in it. Finally, someone out here who knows what a reagent is." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome! Please tell me you're sensible, because I'm outnumbered by enthusiasm out here." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Lotwil will want to ask you about elemental binding, and I'd be grateful if you said it was very dangerous, even if it isn't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lucien Tosselwrench, assistant to Lotwil Veriatus of the Enlightened Assembly. I keep the notes, mix the potions and stand far enough back when he tries something new, which is always." },
        { id = "h_liquid", tags = { "news" }, when = { questActive = TODO_QUEST("Liquid Stone") },
          text = "A healing potion and a lesser invisibility potion, that's all I need. If Lotwil's plan works, we'll want them, and if it doesn't, we'll want them more." },
        { id = "h_liquid_done", when = { questDone = TODO_QUEST("Liquid Stone") },
          text = "Thanks to you I've a few potions set by, and I sleep better for it, which is to say I sleep at all." },
        { id = "h_cloth", tags = { "news" }, when = { questActive = TODO_QUEST("Stone Is Better than Cloth") },
          text = "Bronze bracers, patterned ones, if you can find or make them. I've some thoughts about what stone can do for armour, and I'd like to test them on something other than my own wrists." },
        { id = "h_cog", tags = { "news" }, when = { questActive = TODO_QUEST("This Is Going to Be Hard") },
          text = "Lotwil wants cog number five for his machine, does he? Yes, I've been expecting that, and no, this isn't going to be good." },
        { id = "h_cog_done", when = { questDone = TODO_QUEST("This Is Going to Be Hard") },
          text = "Cog number five is in place, and the machine is doing what it does. I've moved my bedroll another twenty paces downhill." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, are you? The Assembly doesn't take sides, mainly because it hasn't enough members to stand on more than one." },
      },
      again = {
        { id = "h_again", text = "What else? I've a mortar going, and Lotwil's humming, which is never a good sign." },
        { id = "h_again2", text = "Ask away. If you hear a whine from the cart, lie flat." },
        { id = "h_again3", text = "Go on, I'm listening. I'm always listening; it's how I know when to duck." },
      },
      choices = {
        { text = "What is Lotwil trying to do?", next = "plan" },
        { text = "Do you need help?", next = "work" },
        { text = "What's the Enlightened Assembly?", next = "assembly" },
        { text = "What's Servo?", next = "servo" },
        { text = "Why work for him, if you expect the worst?", next = "why" },
        { text = "I'm an alchemist too.", next = "xalch", when = { profession = "Alchemy" } },
        { text = "Good day, Lucien.", next = "END" },
      },
    },

    plan = {
      lines = {
        { id = "pl_default", text = "To understand the elements well enough to bind them, starting with rock, because rock is the most polite. He's done well with it so far, I'll admit, and that's what worries me, because success makes him braver." },
      },
      choices = {
        { text = "Binding elementals sounds dangerous.", next = "plan_danger" },
        { text = "Why start with rock?", next = "plan_rock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_danger = {
      lines = {
        { id = "pd_default", text = "It is, and I've told him, and he wrote it down in his notes as 'Lucien expresses concern.' There are eleven entries like that now, and he reads them aloud to me as a sort of joke." },
      },
      choices = {
        { text = "Knowledge always carries risk. He's right to press on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some powers shouldn't be bound at all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_rock = {
      lines = {
        { id = "pr_default", text = "He says it's honest, which I think means it doesn't explode as often. Fire would be next, if he had his way, and I've already decided where I'll stand when that happens." },
      },
      choices = {
        { text = "Where?", next = "plan_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_where = {
      lines = {
        { id = "pw_default", text = "Kargath, I should think, though the orcs wouldn't have me. Failing that, behind Servo, who has survived two of Lotwil's accidents already and looks no worse for either." },
      },
      choices = {
        { text = "Servo sounds like a good friend.", next = "servo" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    work = {
      big = true,
      lines = {
        { id = "wk_default", text = "Always, though mostly I need someone to bring things Lotwil forgot he'd need. I've a recipe I've been working on from his notes, a stoneshield draught, and if you'd fetch me a healing potion and a lesser invisibility potion, I'll share it." },
        { id = "wk_later", when = { questDone = TODO_QUEST("Liquid Stone") },
          text = "If you can find or make patterned bronze bracers, I've an idea about stone-treated armour I'd like to try. Lotwil calls it a 'side project', in the voice he uses for things he hasn't thought of himself." },
      },
      choices = {
        { text = "Why an invisibility potion?", next = "work_invis" },
        { text = "I'll get you what you need.", next = "END", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_invis = {
      lines = {
        { id = "wi_default", text = "In case something Lotwil binds turns out to be less grateful than he expects. I'd like to be able to leave quietly, and I'd prefer the elemental not see which way I went." },
      },
      choices = {
        { text = "You'd leave Lotwil behind?", next = "work_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_leave = {
      lines = {
        { id = "wl_default", text = "No, of course not, I'd make three: one for each of us, and a spare, because he'll drop his." },
      },
      choices = {
        { text = "Loyalty like that is rare.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'd save myself first. No shame in it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    assembly = {
      lines = {
        { id = "as_default", text = "The Enlightened Assembly of Arcanology, Alchemy and Engineering Sciences. It has two members, one founder and a mechanical guardian, and its headquarters is a cart." },
      },
      choices = {
        { text = "That's a grand name for a cart.", next = "assembly_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    assembly_name = {
      lines = {
        { id = "an_default", text = "Lotwil chose it, and I suggested something shorter, and he said the length was the point. People remember a long name, he said, and they certainly remember it when it's printed on a crater." },
      },
      choices = {
        { text = "A grand name gives people something to aim for.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Let your work speak. Names are just noise.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    servo = {
      lines = {
        { id = "sv_default", text = "Lotwil's mechanical guardian, built to keep the camp safe, which it does by standing very still and looking large. It's never once complained about a single experiment, and I envy it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because he's brilliant, and brilliant people need someone to write down what they did before they forget. And because, when it does work, I'd like to have been there." },
        { id = "wy_warm", when = { disposition = { min = 65 } },
          text = "Because I was a junior clerk in Gnomeregan's alchemy halls, and when the city fell, Lotwil was the only one who wrote to ask if I was alive. He offered me a job in the same letter, and I've never had a reason to leave." },
      },
      choices = {
        { text = "That's a good reason to stay.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xalch = {
      lines = {
        { id = "xa_default", text = "Then you'll appreciate the stoneshield draught: it's crushed elemental earth suspended in something that doesn't make you sick. Mostly doesn't, I should say, and I'd value a second opinion on the dosage." },
      },
      choices = {
        { text = "Test it slowly. Never rush a new brew.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Double the dose and see what happens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what's in every jar in this camp and roughly how far each one would throw you. Ask." } },
    background = { { id = "tp_bg", text = "I lived in Gnomeregan, once, mixing tonics for the engineers. Now I mix them for one man and a robot." } },
    advice = { { id = "tp_ad", text = "Always know where the nearest exit is, especially when someone says 'watch this.'" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I'd rather not, if it's all the same to you. I left a good laboratory there and a few better friends." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond the Assembly's present research. Ask Lotwil; he'll guess, and confidently." } },
  },
}

-- Garek: a high elf sent by Krasus of the Kirin Tor, camped south of Dustwind Gulch.
P:NPC {
  key = "bl_garek", id = TODO_NPC("Garek"), name = "Garek",
  bible = "bibles/badlands_wanderers.md", role = "questgiver", tier = "quest",
  communities = { "badlands" }, temper = { "calm", "sharp" }, values = { "dutiful", "careful", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Garek is a high elf camped alone in the Badlands on an errand for the Kirin Tor that he will not fully explain. He is courteous, guarded and plainly more worried than he lets his voice show.",
    third = "{name} met Garek, a high elf on a quiet mission for the Kirin Tor near Dustwind Gulch.",
  },

  greetings = {
    { id = "g_default", text = "You've found my camp, which means either you're lost or you're looking for something. I'd like to know which before we go further." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and welcome. I've had few enough visitors that I'm starting to remember all of them." },
    { id = "g_away", when = { away = 14 }, text = "It's been {away}. The ground has trembled twice since you left, which I mention not to alarm you but because no one else here would care." },
    { id = "g_sign", when = { questActive = TODO_QUEST("Tremors of the Earth") }, text = "Any word of the Sign of the Earth? The ogres who took it don't stay in one place long, but Camp Boff is where I'd begin." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. I won't ask whose tower trained you, and I'd thank you not to ask who sent me, though I suspect you could guess." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. Our peoples parted a very long time ago, and I'll not pretend it was on happy terms, but I'm glad of the company." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "From Lordaeron or Stormwind? Either way, you've come a long way to stand in the dust with an elf." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "My name is Garek, and I'm here on an errand for Krasus of the Kirin Tor, to put an end to a trouble in Lethlor Ravine. More than that I can't tell you, except that it matters far more than a few tents in the dust suggest." },
        { id = "h_sign", tags = { "news" }, when = { questActive = TODO_QUEST("Tremors of the Earth") },
          text = "A band of ogres stole the Sign of the Earth, and they drift from camp to camp across the Badlands. They've been seen near Camp Boff; begin there, and bring it back to me intact if you can." },
        { id = "h_sign_done", when = { questDone = TODO_QUEST("Tremors of the Earth") },
          text = "The Sign was made by the Dark Irons of Angor Fortress, to bind the twin lieutenants of Deathwing, Blacklash and Hematus. With it in hand, I can do what I was sent to do, though I'll need help." },
        { id = "h_twins_done", when = { killed = { name = "Hematus", min = 1 } },
          text = "Blacklash and Hematus are gone, and the ravine is quieter than it has been in years. I'll send word to Krasus tonight, and I'll be sure your part is in it." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde. I've no quarrel with you here, and I'd ask you keep it that way; neither of us came to the Badlands for each other." },
      },
      again = {
        { id = "h_again", text = "Is there something else? Speak freely; there's no one to overhear but the vultures." },
        { id = "h_again2", text = "Go on. I'll answer what I can, and I'll tell you plainly when I can't." },
        { id = "h_again3", text = "What else? The fire's low, but there's tea, if you've a cup." },
      },
      choices = {
        { text = "Who is Krasus?", next = "krasus" },
        { text = "What's happening in Lethlor Ravine?", next = "ravine" },
        { text = "What is the Sign of the Earth?", next = "sign" },
        { text = "Why won't you say more?", next = "secret" },
        { text = "What's an elf doing out here alone?", next = "alone" },
        { text = "Good day, Garek.", next = "END" },
      },
    },

    krasus = {
      lines = {
        { id = "kr_default", text = "One of the Kirin Tor, a mage of Dalaran, and a quiet one, which is rare among them. He doesn't explain himself often, and when he asks a thing of you, you find you've agreed before he finished asking." },
      },
      choices = {
        { text = "That sounds like a dangerous kind of trust.", next = "krasus_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    krasus_trust = {
      lines = {
        { id = "kt_default", text = "It may be. But I've known him a long time, and I've never once seen him ask for something that wasn't needed. I trust the work, if not always the silence around it." },
      },
      choices = {
        { text = "Good servants don't need every reason.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd want the whole truth before I risked my life.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ravine = {
      big = true,
      lines = {
        { id = "rv_default", text = "Something that has long slept there is stirring, and the earth itself has been trembling for weeks. Black dragons nest in Lethlor, and where they gather, there's usually a purpose worse than hunger." },
        { id = "rv_done", when = { killed = { name = "Hematus", min = 1 } },
          text = "The tremors have stopped, for now. The whelps are still there, and their elders, but the two that mattered most are gone." },
      },
      choices = {
        { text = "Black dragons? Why do they nest there?", next = "ravine_dragons" },
        { text = "Are you here to fight them?", next = "ravine_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ravine_dragons = {
      lines = {
        { id = "rd_default", text = "Because they serve Deathwing still, or what's left of his will, and the Badlands are close to his old roosts. They're cunning and old and very patient, and I'd advise you never to believe one of them, whatever face it wears." },
      },
      choices = {
        { text = "Then they should be hunted down, every one.", next = "BACK", fx = { align = { light = -1 }, learn = { "black_dragonflight" } } },
        { text = "Even dragons may be turned from darkness.", next = "BACK", fx = { align = { light = 1 }, learn = { "black_dragonflight" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "black_dragonflight" } } },
      },
    },
    ravine_fight = {
      lines = {
        { id = "rf_default", text = "Not all of them; I'm one elf, not an army. I'm here to see that one thing in particular doesn't wake up fully, and for that I need the Sign of the Earth." },
      },
      choices = {
        { text = "Tell me about the Sign.", next = "sign" },
        { text = "Something else.", next = "BACK" },
      },
    },

    sign = {
      big = true,
      lines = {
        { id = "sg_default", text = "A relic made by the Dark Irons of Angor Fortress, long ago, to bind two of Deathwing's lieutenants, the twins Blacklash and Hematus. Some ogres stole it, likely without the faintest idea what it is." },
        { id = "sg_have", when = { questDone = TODO_QUEST("Tremors of the Earth") },
          text = "It's here, safe, thanks to you, and I've felt the ground settle a little since it came. With it I can draw the twins out and see them finished, if you'll stand with me." },
      },
      choices = {
        { text = "Dark Irons made it? Odd allies for you.", next = "sign_dwarves" },
        { text = "Why would ogres want it?", next = "sign_ogres" },
        { text = "I'll find it.", next = "END", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sign_dwarves = {
      lines = {
        { id = "sd_default", text = "I'd not call them allies, but even the Dark Irons have feared the black dragons in their time. Whatever else they were, the smiths of Angor knew how to make a thing that holds." },
      },
      choices = {
        { text = "Use whatever works, whoever made it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Tools made by evil hands carry their taint.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sign_ogres = {
      lines = {
        { id = "so_default", text = "They don't, I think; it's heavy and it shines, and that's enough for an ogre. Which is the only reason I'm hopeful, because something cleverer would have known to break it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    secret = {
      lines = {
        { id = "sc_default", text = "Because I gave my word, and because the less that's known about this, the fewer people go looking for it. I'm sorry; I know how it sounds, and I'd distrust me too." },
      },
      choices = {
        { text = "A promise kept is worth respecting.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Secrets like that get people killed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    alone = {
      lines = {
        { id = "al_default", text = "Waiting, mostly, and listening to the ground, and writing letters I can't send until I've something to put in them. I've been in worse places than the Badlands, though not many with less to drink." },
      },
      choices = {
        { text = "Where are your people now?", next = "alone_quel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_quel = {
      lines = {
        { id = "aq_default", text = "Scattered, since the Scourge came through Quel'Thalas. Some stayed to rebuild, some went to Dalaran, and some, like me, took whatever work kept us from thinking about it." },
      },
      choices = {
        { text = "I'm sorry for what your people lost.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a little about a great many old things, and more than I'd like about the black dragons. Ask, and I'll answer what I can." } },
    background = { { id = "tp_bg", text = "I was of Quel'Thalas, once. Now I go wherever Krasus needs a pair of eyes." } },
    advice = { { id = "tp_ad", text = "Never trust a voice in a ravine, however reasonable it sounds." } },
    black_dragonflight = { { id = "tp_bd", text = "They're old, patient and cruel, and fond of wearing other faces. Be careful whom you trust in these hills." } },
    dark_iron = { { id = "tp_di", text = "They're a troubled people, and gifted. Angor Fortress was theirs before it was anything else." } },
    _none = { { id = "tp_none", text = "I'm afraid I can't help you there. My errand keeps my thoughts on one thing." } },
  },
}
