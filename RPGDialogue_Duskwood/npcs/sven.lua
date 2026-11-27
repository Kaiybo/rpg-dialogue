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
    first = "He talks as though nothing matters anymore, and I don't believe it.",
    third = "{name} met Sven Yorgen at his lonely camp in Duskwood, a man who remembers when the forest was still green.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "You. Sit by the fire, then; I'd not say that to most folk, and you know it." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along. I've no fire to spare for you tonight." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It was green and alive before the darkness came. Nothing much matters to me now, but your spirits might remember it." } },
      choices = {
        { text = "It can be green again, Sven. Don't lose hope.", next = "BACK", reply = "Hope is for younger men, friend, but I'll not mock you for it. If the trees ever turn green again, I'll plant something in your name.", fx = { align = { light = 1 } } },
        { text = "It's gone, Sven. Make your peace with the dark.", next = "BACK", reply = "I've done nothing else for years, sitting here by this fire. It doesn't get easier, but it gets quieter.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Defias, using my barn to hide stolen goods, and they've made themselves very comfortable there. My wife planted the garden behind it, and I'd like to see it again before I die, even if nothing grows." } },
      choices = {
        { text = "I'll clear them out and give you back your farm, Sven.", next = "BACK", reply = "Do that, and I'll stand in my wife's garden one more time and tell her it's ours again. That's all I want from this life.", fx = { align = { order = 1 } } },
        { text = "Your farm's lost. Find somewhere new to live.", next = "BACK", reply = "Somewhere new, he says, as if I could plant my memories somewhere else. No, I'll stay here till I'm dust.", fx = { align = { order = -1 } } },
        { text = "Something else, Sven.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Quietly or loudly, I don't much care how, so long as the Defias in my fields stop sleeping in my bed. I'd do it myself if I were ten years younger and a good deal less tired." } },
      choices = {
        { text = "Quietly, then. They won't wake up.", next = "BACK", reply = "Then let them sleep forever in my bed, and I'll burn the sheets afterward. Just make sure none of them wake up.", fx = { align = { honor = -1 } } },
        { text = "I'll face them, and let them know why.", next = "BACK", reply = "Let them know, aye, let them know it's for the Yorgens. That's the only thing I want them to hear before the end.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What happened to your family?", next = "family" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Fire takes the rot and the ground with it, and I'd have nothing left to farm but ash. The forest went dark slowly, and I reckon it'll take its time coming back, if it ever does." } },
      choices = {
        { text = "Patience, then. Some things can't be rushed.", next = "BACK", reply = "Patience is all I've got left, and even that's thinning. I'll wait, then, and watch the trees.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn it and start fresh, Sven.", next = "BACK", reply = "Start fresh on ash? My family's buried in that ground, mage. Burn something else.", fx = { align = { order = -1 } } },
        { text = "What was the forest like before?", next = "green" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Crude or clever, they've kept better folk than you away from him, so I'll not argue craftsmanship with you. If you can break them, break them, and let the Light sort out the rest." } },
      choices = {
        { text = "I'll break them for your sake, Sven.", next = "BACK", reply = "For my sake, then, and for the ones who aren't here to ask. I'll not forget it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Breaking wards teaches me how to build them.", next = "BACK", reply = "Learn what you like, so long as you learn it after the wards are broken. I'll not ask what else you mean by it.", fx = { align = { light = -1 } } },
        { text = "What do you know of his wards?", next = "morbent_wards" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The dead from Raven Hill, and something older too, in the Yorgen farm cellar. I hear things at night that aren't wolves and aren't worgen. I'd sooner face either one than whatever that is." } },
      choices = {
        { text = "Then I'll go and face it with you.", next = "BACK", reply = "With me? I've not been back since, and I'm not sure I can. But I'd go with someone who means it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leave the farm. Some ground can't be saved.", next = "BACK", reply = "Some ground can't, maybe, but my family's in that ground. I'll not leave them to whatever's in the cellar.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Morbent Fel in the ground and his riders after him, and my farm back, which is the part nobody can give me. Justice is a word for people who still have something to lose, and I've only got the fire." } },
      choices = {
        { text = "Fel will answer for it, by the law and the Light.", next = "BACK", reply = "The law and the Light have had years and done nothing. But if you mean it, I'll take your word for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then let me be your vengeance, Sven. No law needed.", next = "BACK", reply = "That's the first honest offer I've had since the riders came. Bring me back his name, and his head if you can.", fx = { align = { order = -1 } } },
        { text = "Something else, Sven.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Farthing would like you, I expect, but don't preach to me, because I've heard all of it already." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid, all the way out here. Then you'll have noticed the woods are wrong. The animals won't come near the farm anymore." },
        { id = "h_default", text = "I'm Sven Yorgen, and I remember when this forest was green, and when I still had a family to share it with. Nobody believes me anymore, and that's all right, because some days I barely believe it myself." },
        { id = "h_farm", when = { questBefore = TODO_QUEST("The Shadowy Figure") },
          text = "I came home and they were gone, my wife and my children both. Riders in black, the tracks said, and something was watching from the barn." },
        { id = "h_dig", when = { questActive = TODO_QUEST("Sven's Revenge") },
          text = "The one watching from my barn buried something behind the old stump and ran, and I was too busy chasing riders to dig it up. Dig for me." },
        { id = "h_jitters", tags = { "news" }, when = { questDone = TODO_QUEST("Return to Sven") },
          text = "Jitters, a thief who hid in my barn and watched, brought this on us, him and his kind, so don't tell me he's sorry." },
        { id = "h_proving", when = { questActive = TODO_QUEST("Proving Your Worth") },
          text = "Morbent Fel's dead guard the crypt south of his house. Break them, and then I'll believe you can break him." },
        { id = "h_seeking", when = { questActive = TODO_QUEST("Seeking Wisdom") },
          text = "Go to Bishop Farthing in the Cathedral; Stormwind forgot us, but he didn't. Give him the book and tell him what you mean to do." },
        { id = "h_morbent", when = { questActive = TODO_QUEST("Morbent Fel") },
          text = "Morbent Fel sits in Forlorn Rowe like a spider, and everything rotten in these woods has a thread running back to someone like him." },
        { id = "h_revenge", tags = { "news" }, when = { questRecent = { TODO_QUEST("Morbent Fel"), days = 3 } },
          text = "I went back to the farm last night and sat on the porch, but I couldn't go in. Maybe next time I will." },
        { id = "h_jitters_heard", when = { heardLine = "jitters.s_default" },
          text = "Jitters told you he only watched, did he? As if that makes it smaller, when it makes it bigger." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Pray if you want to, priest; I stopped. I'll stand next to you while you do it, though, and that's as far as I go." },
        { id = "h_quiet", when = { metBefore = true }, text = "You came back, and most don't. Sit if you like, but I don't talk much; the forest does it for me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I've a farm I can't go back to and a family I can't bring back, so if you're looking for something to fight, the Defias on my land would be a start." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I remember when this forest was green. Do your spirits remember too?" },
      },
      again = {
        { id = "h_again", text = "What else do you want to know?" },
        { id = "h_again2", text = "Ask, then. The fire's not going anywhere, and neither am I." },
      },
      choices = {
        { text = "Darkshire needs the Watch and its laws, or the dark wins.", next = "BACK", reply = "Laws didn't save my family, friend, but I'll not say the Watch is useless. They keep the lamps lit, and that's something.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Every man in Duskwood should look to himself, not the Watch.", next = "BACK", reply = "That's how I've lived since that night, and look where it's got me. A lonely camp and a cold supper.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What drove the animals away from your land?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What happened to your family?", next = "family" },
        { text = "You look like a man who wants something badly.", next = "want" },
        { text = "You can't keep this camp alone.", next = "camp" },
        { text = "What was the forest like, before?", next = "green" },
        { text = "Who is Morbent Fel?", next = "morbent", when = { questDone = TODO_QUEST("Return to Sven") } },
        { text = "Jitters is sorry, Sven.", next = "jitters", when = { questDone = TODO_QUEST("Return to Sven") } },
        { text = "Let me pray with you, Sven.", next = "priest", when = { class = "PRIEST" } },
        { text = "I lost a farm too. In Westfall.", next = "farmer", when = { origin = "human_westfall_farmhand" } },
        { text = "The wolves near your camp. Want them thinned?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Whoever wronged you won't hear me coming, Sven.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A fire would clear the rot off your land, Sven.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Who's squatting on your farm, Sven?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Whoever raises the dead here, his wards will be crude work.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would justice look like for you, Sven?", next = "xapala", when = { class = "PALADIN" } },
        { text = "They say Duskwood was green once, Sven.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Then we find the riders.", next = "BACK", reply = "Aye, and when we do, I want to be there to see it. Whoever sent them wants that scythe badly, and men that hungry for something always come back for it.", fx = { affinity = 2, trait = { brave = 1 }, align = { honor = 1 }, learn = { "dark_riders" } } },
        { text = "Give them the scythe, and maybe they'll leave you be.", next = "BACK", reply = "Give them the scythe, and they'll kill me anyway, the same as they killed my family. No, I'll keep it where they'll never find it.", fx = { align = { honor = -1 } } },
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
        { text = "I'll help you get it.", next = "BACK", reply = "Then we'll go together, once I've sharpened something. I've been waiting for someone to say that.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "I will.", next = "BACK", reply = "Thank you. I'll read it again tonight, and maybe I'll understand it better in the morning.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Prayers didn't save her, Sven, so don't let it trouble you.", next = "BACK", reply = "It doesn't, much, but it's the first thing anyone's written about her in years. Leave it with me anyway.", fx = { align = { light = -1 } } },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Pray, then, and I'll listen. I grieve every night, priest, and in the morning I sharpen things, so the Light can have the nights, but I need the mornings." },
      },
      choices = {
        { text = "Then I'll pray at night, for you.", next = "BACK", reply = "That's more than I've had from anyone in a long while. I'll listen for it, maybe, in the dark.", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Hate will hollow you out.", next = "BACK", reply = "It already has, priest, and I'm hollow all the way through. The only thing left in here is the fire.", fx = { affinity = -1, align = { light = 1 }, trait = { stern = 1 } } },
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
    regard = {
      { id = "dp_rg", text = "You're straight with me, and I value that more than coin. Not many in Duskwood are straight with anybody." },
    },
    grievance = {
      { id = "dp_gv", text = "You've given me cause to watch you, and I'm a man who watches well. Mind that." },
    },
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
      { id = "tp_morbent", text = "There's a man in a house above the graves, and the dead walk because he wants them to. You don't need to know more than that." },
    },
    dark_riders = { { id = "tp_riders", text = "Black horses and black cloaks, out of Deadwind Pass. Somebody sends them, and I'll find out who." } },
    carevins = { { id = "tp_carevins", text = "They feed this camp, and Elaine sends whoever's passing with the supplies. I don't know why they bother, but I'm glad they do." } },
    _none = { { id = "tp_none", text = "I don't know and I don't care, unless it wears black and rides." } },
    raven_hill = { { id = "tp_raven_hill", text = "From this camp I can see lights at Raven Hill some nights, and they aren't lanterns. I've stopped wondering whose they are." } },
    scourge = { { id = "tp_scourge", text = "I've heard the Scourge raises whole villages at once. Here they took my family one at a time, and I'll find the ones who did it one at a time too." } },
    holy_light = { { id = "tp_holy_light", text = "I prayed to the Light every day of my life until I came home to the farm that night. I haven't since, and I don't know if I'll start again." } },
    varian = { { id = "tp_varian", text = "Stormwind's lost its king and I've lost my wife and children, and nobody's come looking for either of us. I've made my peace with doing the looking myself." } },
  },
}
