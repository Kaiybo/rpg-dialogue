-- Sven Yorgen, his camp by the Hushed Bank. Voice: bibles/sven.md
-- Remembers the forest green. Lost his family to riders in black. Wants a name.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sven", id = TODO_NPC("Sven Yorgen"), name = "Sven Yorgen",
  bible = "bibles/sven.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "sharp" }, values = { "stern", "honest" },
  notices = { "kit", "grief" },

  impression = {
    first = "Sven Yorgen keeps a lonely fire in the woods and remembers when this forest was green. He talked as though nothing much mattered to him anymore, and I didn't believe it.",
    third = "{name} met Sven Yorgen at his lonely camp in Duskwood, a man who remembers when the forest was still green.",
  },

  greetings = {
    { id = "g_camp", text = "Sit by the fire or move along; I don't much care which." },
    { id = "g_figure", when = { questActive = TODO_QUEST("The Shadowy Figure") }, text = "Well? Have you found out who was at my farm that night?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Morbent Fel") }, text = "It's done, and I keep waiting to feel something about it." },
    { id = "g_armed", when = { questActive = TODO_QUEST("Armed and Ready") }, text = "You've brought it, then. Let me see it, and let me hold it a moment." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You're not ready for what's in these woods, and neither was I. Get that armor seen to before you go any further." },
    { id = "n_grief", cat = "grief", when = { deaths = { min = 15 } },
      text = "You've been killed a lot; I can see it on you. People who keep coming back get a hollow look about them, and my wife used to say I had it." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Defias, using my barn to hide stolen goods, and they've made themselves very comfortable there. My wife planted the garden behind it, and I'd like to see it again before I die, even if nothing grows." } },
      choices = {
        { text = "I'll clear them out and give you back your farm, Sven.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your farm's lost. Find somewhere new to live.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Sven.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Quietly or loudly, I don't much care how, so long as the Defias in my fields stop sleeping in my bed. I'd do it myself if I were ten years younger and a good deal less tired." } },
      choices = {
        { text = "Quietly, then. They won't wake up.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll face them, and let them know why.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What happened to your family?", next = "family" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Fire takes the rot and the ground with it, and I'd have nothing left to farm but ash. The forest went dark slowly, and I reckon it'll take its time coming back, if it ever does." } },
      choices = {
        { text = "Patience, then. Some things can't be rushed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn it and start fresh, Sven.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What was the forest like before?", next = "green" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Crude or clever, they've kept better folk than you away from him, so I'll not argue craftsmanship with you. If you can break them, break them, and let the Light sort out the rest." } },
      choices = {
        { text = "I'll break them for your sake, Sven.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Breaking wards teaches me how to build them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What do you know of his wards?", next = "morbent_wards" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The dead from Raven Hill, and something older too, in the Yorgen farm cellar. I hear things at night that aren't wolves and aren't worgen. I'd sooner face either one than whatever that is." } },
      choices = {
        { text = "Then I'll go and face it with you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leave the farm. Some ground can't be saved.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Morbent Fel in the ground and his riders after him, and my farm back, which is the part nobody can give me. Justice is a word for people who still have something to lose, and I've only got the fire." } },
      choices = {
        { text = "Fel will answer for it, by the law and the Light.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then let me be your vengeance, Sven. No law needed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Sven.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Farthing would like you, I expect, but don't preach to me, because I've heard all of it already." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid, all the way out here. Then you'll have noticed the woods are wrong. The animals won't come near the farm anymore." },
        { id = "h_default", text = "I'm Sven Yorgen, and I remember when this forest was green. Nobody believes me anymore, and that's all right, because some days I barely believe it myself." },
        { id = "h_farm", when = { questBefore = TODO_QUEST("The Shadowy Figure") },
          text = "I came home and they were gone, my wife and my children both. Riders in black, the tracks said, and something was watching from the barn." },
        { id = "h_dig", when = { questActive = TODO_QUEST("Sven's Revenge") },
          text = "He buried something behind the old stump by my barn and ran, and I was too busy chasing riders to dig it up. Dig for me." },
        { id = "h_jitters", tags = { "news" }, when = { questDone = TODO_QUEST("Return to Sven") },
          text = "Jitters, a thief who hid in my barn and watched, brought this on us, him and his kind, so don't tell me he's sorry." },
        { id = "h_proving", when = { questActive = TODO_QUEST("Proving Your Worth") },
          text = "His dead guard the crypt south of his house. Break them, and then I'll believe you can break him." },
        { id = "h_seeking", when = { questActive = TODO_QUEST("Seeking Wisdom") },
          text = "Go to Bishop Farthing in the Cathedral; Stormwind forgot us, but he didn't. Give him the book and tell him what you mean to do." },
        { id = "h_morbent", when = { questActive = TODO_QUEST("Morbent Fel") },
          text = "Morbent Fel sits in Forlorn Rowe like a spider, and everything rotten in these woods has a thread running back to someone like him." },
        { id = "h_revenge", tags = { "news" }, when = { questRecent = { TODO_QUEST("Morbent Fel"), days = 3 } },
          text = "I went back to the farm last night and sat on the porch, but I couldn't go in. Maybe next time I will." },
        { id = "h_jitters_heard", when = { heardLine = "jitters.s_default" },
          text = "He told you he just watched, did he? As if that makes it smaller, when it makes it bigger." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Pray if you want to, priest; I stopped. I'll stand next to you while you do it, though, and that's as far as I go." },
        { id = "h_quiet", when = { metBefore = true }, text = "You came back, and most don't. Sit if you like, but I don't talk much; the forest does it for me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I've a farm I can't go back to and a family I can't bring back, so if you're looking for something to fight, the Defias on my land would be a start." },
      },
      again = {
        { id = "h_again", text = "What else do you want to know?" },
        { id = "h_again2", text = "Ask, then. The fire's not going anywhere, and neither am I." },
      },
      choices = {
        { text = "What drove the animals away from your land?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What happened to your family?", next = "family" },
        { text = "What do you want?", next = "want" },
        { text = "Who keeps this camp with you?", next = "camp" },
        { text = "What was the forest like, before?", next = "green" },
        { text = "Who is Morbent Fel?", next = "morbent", when = { questDone = TODO_QUEST("Return to Sven") } },
        { text = "Jitters is sorry, Sven.", next = "jitters", when = { questDone = TODO_QUEST("Return to Sven") } },
        { text = "Let me pray for them with you.", next = "priest", when = { class = "PRIEST" } },
        { text = "I lost a farm too. In Westfall.", next = "farmer", when = { origin = "human_westfall_farmhand" } },
        { text = "The wolves near your camp. Want them thinned?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The Defias on your land won't hear me coming, Sven.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A fire would clear the rot off your land, Sven.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Who's squatting on your farm, Sven?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Morbent Fel's wards are crude work. I could break them.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would justice look like for your family, Sven?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },

    family = {
      big = true,
      lines = {
        { id = "f_default", text = "They were looking for something, a scythe out of Roland's Doom. They tore the farm apart looking for it, and killed everyone in it." },
      },
      choices = {
        { text = "I'm sorry, Sven.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then we find the riders.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, align = { honor = 1 }, learn = { "dark_riders" } } },
        { text = "Give them the scythe, and maybe they'll leave you be.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where were you?", next = "family_away" },
      },
    },
    family_away = {
      lines = {
        { id = "fa_default", text = "In Darkshire, buying things for the children. I told them I'd be back soon, and I was, but not soon enough." },
      },
      choices = {
        { text = "You couldn't have known.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What did you find?", next = "family_found" },
      },
    },
    family_found = {
      lines = {
        { id = "ff_default", text = "Riders' tracks heading east toward Deadwind, and a man by my barn, digging. I went after the riders when I should have caught the digger, because he was slower.",
          fx = { learn = { "dark_riders" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    want = {
      lines = { { id = "w_default", text = "A name, and then another, and then whoever's at the top of the list. After that I'll sleep." } },
      choices = {
        { text = "Revenge won't bring them back.", next = "back", fx = { align = { light = 1 } } },
        { text = "I'll help you get it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    back = {
      lines = { { id = "b_default", text = "No, it won't, but it'll stop them taking someone else's, and that'll have to do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = {
        { id = "c_default", text = "Lars and me, and whoever the Carevins send down with supplies. Lars hunts, and the wolves hunt Lars, so it evens out." },
      },
      choices = {
        { text = "Who are the Carevins to you?", next = "camp_carevins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_carevins = {
      lines = {
        { id = "cc_default", text = "They're Darkshire folk who'd rather fight than wait, and they send us food and flash powder. I don't ask what they want for it, and so far it's been nothing.",
          fx = { learn = { "carevins" } } },
      },
      choices = {
        { text = "Good people are rare out here.", next = "BACK", fx = { affinity = 1 } },
        { text = "Everyone wants something.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    green = {
      lines = {
        { id = "gr_default", text = "It was green, with birdsong at dawn, and you could see the sky from my porch. Then the dark came over the trees, slow, like a bruise, and it stayed." },
      },
      choices = {
        { text = "Will it ever lift?", next = "green_lift" },
        { text = "Something else.", next = "BACK" },
      },
    },
    green_lift = {
      lines = {
        { id = "gl_default", text = "Ask the stargazer in Darkshire, who thinks it can be measured. I think it can be outlived, and one of us is a fool." },
      },
      choices = {
        { text = "Maybe neither of you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    morbent = {
      big = true,
      lines = {
        { id = "mo_default", text = "He's a necromancer in the house above Raven Hill, and I've watched those riders go up to his door and talk. He's their friend, and that makes him mine to kill.",
          fx = { learn = { "morbent_fel", "dark_riders" } } },
      },
      choices = {
        { text = "Can he even be killed?", next = "morbent_wards" },
        { text = "Then let's kill him.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    morbent_wards = {
      lines = {
        { id = "mw_default", text = "Not with plain steel, because he's wrapped himself in spells. Bishop Farthing in Stormwind might know a way; he's a kind man, and he remembers us." },
        { id = "mw_bane", when = { questDone = TODO_QUEST("Armed and Ready") },
          text = "Not with plain steel, but with what you brought back, yes: holy iron off a sunken ship, hammered by a dwarf. It's a strange world, so use it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    jitters = {
      lines = {
        { id = "ji_default", text = "Sorry, is he? He brought them to my door, and then he wrote it all down, neat as a ledger, so don't carry his apologies here." },
      },
      choices = {
        { text = "He prayed for your wife.", next = "jitters_prayed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jitters_prayed = {
      big = true,
      lines = {
        { id = "jp_default", text = "...He wrote that too, and I read it twice. I don't know what to do with it yet, so leave it with me a while." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Prayers didn't save her, Sven, so don't let it trouble you.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Pray, then, and I'll listen. I grieve every night, priest, and in the morning I sharpen things, so the Light can have the nights, but I need the mornings." },
      },
      choices = {
        { text = "Then I'll pray at night, for you.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Hate will hollow you out.", next = "BACK", fx = { affinity = -1, align = { light = 1 }, trait = { stern = 1 } } },
      },
    },
    farmer = {
      lines = {
        { id = "fm_default", text = "Westfall, is it? I heard about the thieves in the fields and the Crown looking the other way. At least you've a field left to be angry about." },
      },
      choices = {
        { text = "Barely.", next = "BACK", fx = { affinity = 2, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Thin them if you like, and you'll find more next week. It wasn't wolves that came to my farm, mind, it was riders, so I can't bring myself to hate the beasts the way the town does." } },
      choices = {
        { text = "Then I'll hunt the riders instead.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "A wolf's a wolf. I'll do what's needed.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've watched these woods a long time from this camp, and very little walks through them I don't see. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I farmed southeast of here, with a wife, two children and a barn. Now I've a camp, a friend who hunts, and a list." } },
    advice = { { id = "tp_ad", text = "Don't chase two things at once. I did, the night I came home, and I caught neither." } },
    worgen = { { id = "tp_worgen", text = "They came after the riders, or with them, the same night near enough, and I stopped telling them apart." } },
    defias = { { id = "tp_defias", text = "Thieves, and one of them hid in my barn, so ask him how brave the Brotherhood is." } },
    stalvan = { { id = "tp_stalvan", text = "The tutor? That was before my trouble. Everyone in Duskwood has a murder, and that one belongs to Smitts." } },
    morbent_fel = {
      { id = "tp_morbent_next", when = { questDone = TODO_QUEST("Return to Sven") }, text = "He's the riders' friend on the hill. Ask me what you want to know.", next = "morbent" },
      { id = "tp_morbent", text = "There's a man in a house above the graves, and the dead walk because he wants them to. That's enough to know." },
    },
    dark_riders = { { id = "tp_riders", text = "Black horses and black cloaks, out of Deadwind Pass. Somebody sends them, and I'll find out who." } },
    carevins = { { id = "tp_carevins", text = "They feed this camp, and Elaine sends whoever's passing with the supplies. I don't know why they bother, but I'm glad they do." } },
    _none = { { id = "tp_none", text = "I don't know and I don't care, unless it wears black and rides." } },
  },
}
