-- Shadowglen: the glade under Aldrassil where young night elves begin. Voice: bibles/teldrassil.md
-- Classic Shadowglen only (the zone was rebuilt in Cataclysm; those quests are not used).
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ilthalaine", id = TODO_NPC("Conservator Ilthalaine"), name = "Conservator Ilthalaine",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "delighted" }, values = { "kind", "devout" },
  notices = { "greenness", "class" },
  impression = {
    first = "Every morning's light through the leaves seems to delight Conservator Ilthalaine as if it were the first. He counts the nightsaber cubs like a fond uncle, and even his worries about the glade sound gentle.",
    third = "{name} met Conservator Ilthalaine, who keeps the balance in Shadowglen and delights in the glade he tends.",
  },

  greetings = {
    { id = "g_glade", text = "Look at the light through the leaves. Every morning it's new, and after more centuries than I can count, I am still glad of it." },
    { id = "g_back", when = { metBefore = true }, text = "In the glade again. Does it still take your breath? It still takes mine." },
    { id = "g_away", when = { away = 14 }, text = "You've been away from the glade {away}, and the cubs have grown in that time, just as you have. Come and look at the light with me." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were so new when you first stood in this glade, and look at you now! It does my heart good to see one of Shadowglen's young grown so strong." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been helping folk in the glade these past days. That pleases me more than I can say, and the cubs would agree if they could." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Newly woken to the world, and already sent to me! Let us begin gently, for the forest will be less gentle with you later." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A young druid! There's word waiting for you from your teacher. The glade has been expecting you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They know the forest, which is near enough. They play in the light and sleep in the shade. Your spirits would like them." } },
      choices = {
        { text = "They are a joy, Conservator. Guard them well.", next = "BACK", reply = "They are, and I guard them as fiercely as I can. Thank you for seeing it.", fx = { align = { light = 1 } } },
        { text = "Cubs grow into hunters. Do not grow too fond.", next = "BACK", reply = "Every cub grows, and that is as it should be. I am fond of them anyway, and I do not mean to stop.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every season, because I ask the young ones to cull grells and nightsabers that only want to live as we do. I pray over the glade each evening and ask Elune to forgive what the balance requires of us." } },
      choices = {
        { text = "Then I'll pray for the glade's creatures as well.", next = "BACK", reply = "Thank you, {class}, for they deserve it as much as anyone. I pray for them too, every night.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts don't need prayers, Conservator, and the balance is enough.", next = "BACK", reply = "Perhaps they do not, but I need them, after the cull. The balance does not ease my conscience.", fx = { align = { light = -1 } } },
        { text = "Something else, Conservator.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Evil is a big word for a small glade, and I'd rather not use it. The grells are a nuisance and the Webwood spiders are worse, but they're only creatures out of balance, so cull them cleanly and don't make a crusade of it." } },
      choices = {
        { text = "I'll do what the balance needs and nothing more.", next = "BACK", reply = "Then you are exactly the help the glade needs. I am grateful for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If it threatens your young ones, I'll judge it myself.", next = "BACK", reply = "Then judge carefully, and come to me first if you are unsure. The young ones are my charge as well as yours.", fx = { align = { order = -1 } } },
        { text = "Something else, Conservator.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too many young nightsabers and too many grell, mostly, for the balance here tips quickly when it tips at all. A warrior's blade can set it right, so long as you remember that the cats are part of the glade too, and take only what you must." } },
      choices = {
        { text = "Only what I must. I'll keep the balance.", next = "BACK", reply = "Then you will be welcome in Shadowglen for as long as you like. The balance is fragile here.", fx = { align = { light = 1 } } },
        { text = "If they threaten the glade, I'll clear them out.", next = "BACK", reply = "Clear only what I ask, warrior, for the glade is not a battlefield. The balance tips both ways.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Some of us did. The Highborne, Queen Azshara's court, drew on the Well of Eternity until they called the Burning Legion into the world, and the Well's destruction tore the land apart. That is why you will find few here glad to see a mage, though I will try to be one of them." },
      },
      choices = {
        { text = "Then I'll use my craft carefully here, Conservator.", next = "BACK", reply = "Thank you, and the glade will be grateful too. We have long memories of what careless magic can do.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Highborne's failure is no reason to forget the craft.", next = "BACK", reply = "No, it is not, but it is a reason to remember. Use it carefully, and we will not quarrel.", fx = { align = { order = -1 } } },
        { text = "What does balance mean, here?", next = "balance" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then you would do well to remember they are not your enemies, only the glade's overflow. Thin the young nightsabers and the grell only as much as the balance needs, and no more." },
        { id = "xro_nightelf", when = { race = "NightElf" }, text = "You have the stillness of a hunter, child, and Shadowglen's creatures are not your enemies, only the glade's overflow. Thin them as much as the balance needs, and no more." },
      },
      choices = {
        { text = "Only as many as you ask, Conservator.", next = "BACK", reply = "Thank you, and the glade will be better for it. That is all I ask of anyone.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever I hunt, I'll hunt my own way.", next = "BACK", reply = "Then hunt as I ask, at least, even if you do it your own way. The glade does not care how, only how many.", fx = { align = { honor = -1 } } },
        { text = "I'm not sure what the balance asks of me.", next = "balance" },
      },
    },
    hunter_i = {
      lines = {
        { id = "hi_default", text = "Your companion would cull them too, young hunter, and without any of the guilt. The glade has more boars and nightsabers than it can feed this year, and thinning them keeps the rest from starving through winter." },
      },
      choices = {
        { text = "Then the cull is a kindness.", next = "BACK", reply = "It is, and a hard one, but a kindness all the same. Thank you for understanding.", fx = { align = { order = 1 } } },
        { text = "The glade would find its own balance without us.", next = "BACK", reply = "It would, in time, but the time would be cruel to the young ones. I would rather help it along gently.", fx = { align = { order = -1 } } },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Everything that walks here shifts the balance a little, which is why I count the cubs and the boars and the grellkin every morning. Your servant would shift it more than most, so keep it close, and I'll count you with the rest." },
      },
      choices = {
        { text = "I'll keep it close. The glade deserves care.", next = "BACK", reply = "Thank you, warlock, and the glade will thank you too. It is fragile still.", fx = { align = { order = 1 } } },
        { text = "The balance can bear one more creature.", next = "BACK", reply = "It can, perhaps, but I would rather not test it. Keep it close, please.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "You remind me of {alt}, a young {altclass} who learned the balance here in Shadowglen and thinned the boars without any malice in it. If that one is kin to you, I hope you were taught the same gentleness." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in Shadowglen! The young ones here learn Elune's ways from the cradle, but they'll be glad of a healer, for the beasts this year bite harder than they should." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, here in our little glade! You've come a long way from the Eastern Kingdoms, by sea and by rope ladder, and I hope Shadowglen gives you a gentler welcome than the roads did." },
        { id = "h_default", key = true,
          text = "I am Conservator Ilthalaine, and I keep the balance in Shadowglen. It's a lovely place, and lovely places need keeping more than most." },
        { id = "h_balance", tags = { "news" }, when = { questActive = TODO_QUEST("The Balance of Nature") },
          text = "The spring rains were heavy, and now there are more young nightsabers and thistle boars than the glade can feed. Thin them gently, for balance is a matter of numbers, not of hatred." },
        { id = "h_sigil", when = { any = {
            { questActive = TODO_QUEST("Verdant Sigil") }, { questActive = TODO_QUEST("Hallowed Sigil") },
            { questActive = TODO_QUEST("Simple Sigil") }, { questActive = TODO_QUEST("Etched Sigil") },
            { questActive = TODO_QUEST("Encrypted Sigil") } } },
          text = "Your teacher's sigil came for you by messenger. Read it, then find them in Aldrassil. They'll show you the next step." },
        { id = "h_cubs", when = { metBefore = true }, text = "I counted the nightsaber cubs this morning and found seven, where last spring there were five. The glade is generous this year, and that worries me a little." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Elune's light on the glade. This is the hour I remember why I asked to keep it." },
        { id = "h_grown", when = { minLevel = 20 },
          text = "You've grown since the glade last saw you. Out there in the world, is the balance kept any better than in here?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in Shadowglen! The glade is lovely, but even lovely places need someone to stand between them and harm." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, in Shadowglen? I never expected one here among the cubs, and I'd ask you to mind them, because they're curious little things." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Grell", min = 20 } },
          text = "The grells have thinned since you began your work in the glade, and the balance is easier to keep for it. Take care not to tip it the other way, though, because Shadowglen needs a few of everything, even grells." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The morning light delights me every day, and a dwarf who speaks with spirits delights me too. Ishnu-alah, and welcome to Shadowglen." },
      },
      again = {
        { id = "h_again", text = "What else? The light's moving; walk with me a little." },
        { id = "h_again2", text = "Ask away. I'll keep counting cubs while you do." },
      },
      choices = {
        { text = "What does keeping the balance mean?", next = "balance" },
        { text = "How fares the glade this year?", next = "rains" },
        { text = "Who will train me?", next = "sigils" },
        { text = "I've seen the world since. It's not balanced.", next = "world", when = { minLevel = 20 } },
        { text = "I'm a long way from home here.", next = "stranger", when = { ["not"] = { race = "NightElf" } } },
        { text = "Must I cull beasts when my companion is one of them?", next = "hunter_i", when = { class = "HUNTER" } },
        { text = "I hear the kaldorei once ruled through magic.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Shadowglen's creatures never hear me coming.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What threatens Shadowglen, Conservator?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does keeping the balance ever trouble you, Conservator?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is there any evil in Shadowglen a paladin should face?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does a warlock upset the balance of Shadowglen?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the nightsaber cubs know the spirits, Conservator?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Conservator.", next = "END" },
      },
    },
    balance = {
      big = true,
      lines = {
        { id = "b_default", text = "It means that nothing takes more than its share: not the beasts, not the furbolgs, and not us. When one thing grows too much, the rest of the forest pays for it." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", reply = "Do, and teach it to others when you can. It is the oldest lesson of the kaldorei.", fx = { affinity = 2, align = { light = 1 }, learn = { "cenarion_circle" } } },
        { text = "The strong take what they can, and that's the forest's way too.", next = "BACK", reply = "It is the forest's way, and it is how forests die. Balance is what keeps them alive.", fx = { align = { light = -1 } } },
        { text = "Even if it means killing?", next = "balance_kill" },
      },
    },
    balance_kill = {
      lines = { { id = "bk_default", text = "Even then. Killing for balance is a sorrow, but killing for pleasure is where corruption begins, so learn the difference here while it's easy to see." } },
      choices = {
        { text = "A necessary sorrow, then.", next = "BACK", reply = "A necessary sorrow, yes, and you have learned it faster than most. Keep it close.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hunting needs no excuse, since it's the oldest thing in the forest.", next = "BACK", reply = "It is the oldest thing, and it still needs a reason. Without one, it is only killing.", fx = { align = { order = -1 } } },
        { text = "I'll try to tell them apart.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    rains = {
      lines = { { id = "r_default", text = "Crowded, after heavy spring rains. Some creatures flourished, others suffered, and the glade can only feed so many mouths. Nature is generous and careless in the same breath." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sigils = {
      lines = { { id = "s_default", text = "Your trainers in Aldrassil. Mardant for the druids, Shanda for the priests, and the others for theirs. They watch for new students the way I watch for cubs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    world = {
      lines = { { id = "w_default", text = "No, I don't suppose it is. Sit with me a moment and tell me: was it the beasts that were out of balance, or the people?" } },
      choices = {
        { text = "The people. Always the people.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "The beasts. Something's sickening them.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Both. I don't know where to start.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    stranger = {
      lines = { { id = "st_default", text = "Then welcome twice over. The glade doesn't mind who walks in it, so long as they walk gently." } },
      choices = { { text = "I'll walk gently.", next = "BACK", fx = { affinity = 1, standing = { shadowglen = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I do love a question! Pick any of these and I'll tell you everything I know, and probably a little more besides." },
    },
    background = { { id = "tp_bg", text = "I keep Shadowglen. That's the whole of my story, and it's plenty." } },
    advice = { { id = "tp_ad", text = "Walk softly in a young forest, because it remembers everything." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle teaches what I try to practice. They're better at it than I am, but I'm more cheerful about it." } },
    nordrassil = { { id = "tp_nordrassil", text = "Aldrassil grew from Teldrassil, and Teldrassil from Fandral's hopes for Nordrassil. Every young druid in Shadowglen asks me which is the oldest tree, and I always say the one on Hyjal." } },
    elune = { { id = "tp_elune", text = "Elune watches over Shadowglen at night, and I watch over it in the day. Between us, the young ones are seldom left alone." } },
    burning_legion = { { id = "tp_burning_legion", text = "The young ones here weren't born when the Legion came to Hyjal. I'd like to keep it that way, as far as stories go." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Shadowglen's youngsters hear about the Darkmoon Faire from travellers and dream of it. I tell them to finish their training first, and they never listen." } },
    malfurion = {
      { id = "tp_malfurion", text = "Malfurion Stormrage taught the first druids, and he sleeps now in the Dream while the Circle waits for him. The young ones in Shadowglen ask about him more than anyone else, and I tell them he'll wake when he's needed." },
      { id = "tp_malfurion2", when = { class = "DRUID" }, text = "You walk his path now, young druid, so remember he learned it slowly too. Even Malfurion was a student once, and Cenarius was not always pleased with him." },
    },
    _none = { { id = "tp_none", text = "I have no idea! Isn't it lovely, though, not knowing things? It leaves room for wonder." } },
  },
}

P:NPC {
  key = "melithar", id = TODO_NPC("Melithar Staghelm"), name = "Melithar Staghelm",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "earnest" }, values = { "dutiful", "patient" },
  notices = { "class", "form" },
  impression = {
    first = "Melithar Staghelm talks about Aldrassil as though the old tree could hear every word. He is earnest enough that I found myself lowering my voice near the roots.",
    third = "{name} met Melithar Staghelm, the earnest young druid who tends Aldrassil's roots and the newcomers who gather beneath them.",
  },

  greetings = {
    { id = "g_tree", text = "Peace, young one. Aldrassil is listening, as it always is. Speak kindly near it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, young one, and Aldrassil has been listening for your step. Speak kindly near it, as before." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you first walked under these roots, and Aldrassil knows it. I think it's pleased, in its quiet way." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear harsh words passed between you and someone in the glade. Aldrassil hears everything, young one, so let the next words be kinder." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the glade. The first lessons are the slowest. They're also the ones you'll lean on longest." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Ah, you've found the bear. Careful of the steps; Aldrassil's roots were not made for paws." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I believe so, with all my heart. The old tree is wiser than we know. Your spirits might hear its answer." } },
      choices = {
        { text = "Then I will speak with respect, Melithar.", next = "BACK", reply = "Thank you, and Aldrassil will be glad of it, I think. It has been listening for a very long time.", fx = { align = { order = 1 } } },
        { text = "A tree is a tree. It does not listen.", next = "BACK", reply = "Then you have not sat with it long enough. Come back in a few hundred years and tell me so again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The druids say a tree wants water and patience rather than prayers, but I've sat with Aldrassil long enough to think it listens to more than they believe. Pray if you like, and I'll not tell the Arch Druid." } },
      choices = {
        { text = "Every living thing can feel a prayer, so I'll say one.", next = "BACK", reply = "Thank you, priest, and I think it will be glad of it. Aldrassil has heard many prayers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A tree is a tree, and it needs water, not words.", next = "BACK", reply = "Perhaps it does, but I have sat with it too long to believe that is all. Water and words together, perhaps.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That they were knights who healed as well as fought, and that a great many of them fell defending Lordaeron when the plague came. If even half of it is true, I'd count you good company for the young ones here." } },
      choices = {
        { text = "It's true, and I mean to be worthy of them.", next = "BACK", reply = "Then I hope you are, and I think you will be. Lordaeron needed more of you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Books flatter us, and most paladins I know are only soldiers.", next = "BACK", reply = "Perhaps they do, and perhaps you are right. But the books are all I have to go on.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It minds noise, I think, and it remembers the war against the Legion even if the young ones don't. Train where you must, warrior, but sheathe your blade when you pass the roots, as a courtesy to an old friend." } },
      choices = {
        { text = "I'll sheathe it as I pass. A courtesy costs nothing.", next = "BACK", reply = "Thank you, warrior, and Aldrassil will feel it, I am sure. Courtesy is never wasted on an old tree.", fx = { align = { order = 1 } } },
        { text = "A tree can't hear steel. I'll train where I like.", next = "BACK", reply = "Perhaps it cannot, but it remembers the war all the same. Train somewhere else, please.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the nightsabers and thistle boars of the glade are neighbors rather than targets, until the balance tips and the Conservator asks for them to be thinned. Take what he asks and no more, and the glade will keep feeding you all your life." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the look of something that grew up beneath good roots. Bring it past Aldrassil now and then, for I think the old tree likes the company." },
      },
      choices = {
        { text = "Only what the Conservator asks, and no more.", next = "BACK", reply = "Then the Conservator will be glad of you, and so will I. The balance is a delicate thing.", fx = { align = { order = 1 } } },
        { text = "The forest has plenty. I'll take what I need.", next = "BACK", reply = "There is plenty, for now, but plenty does not last. Take less, and there will be more.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_m = {
      lines = {
        { id = "rm_default", text = "Of course you can; you're quiet enough to hear it, which is more than I can say for most of the young warriors. The tree doesn't care what you do in the dark, only whether you listen to it in the daylight." },
      },
      choices = {
        { text = "I listen. That's half my trade.", next = "BACK", fx = { affinity = 1 } },
        { text = "What does it say?", next = "hum" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I don't know, and I'd not like to test it, because Aldrassil is old and very patient, and patience can run out. The Highborne's magic is why our people fell, so I'll ask you to be gentle here, as you would be in a temple." },
      },
      choices = {
        { text = "I'll keep my spells quiet beneath its roots.", next = "BACK", reply = "Thank you, mage, and Aldrassil will be grateful. Patience is easier when it is not tested.", fx = { align = { order = 1 } } },
        { text = "A tree can't mind magic, Melithar.", next = "BACK", reply = "Perhaps it cannot, but I would rather not find out. The High Priestess would not like it either.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I believe it can, the way it felt the fel moss creeping up from Fel Rock before any of us saw it, and it hasn't been easy since. Keep your servant back, and the tree and I will both thank you." },
      },
      choices = {
        { text = "I'll keep it well back from the roots.", next = "BACK", reply = "Thank you, and Aldrassil will be easier for it. It still remembers the fel moss.", fx = { align = { light = 1 } } },
        { text = "Your tree will have to bear it.", next = "BACK", reply = "It will, I suppose, but it will not like it. Neither will I.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at Aldrassil's roots! I've often wondered whether a prayer does a tree any good, and now I can ask someone who would know." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've only read of your order, and I confess I imagined you taller, though perhaps that's the armor making me expect it." },
        { id = "h_default", key = true,
          text = "I am Melithar Staghelm. I tend Aldrassil's roots and the young ones who come to it, and both need the kind of patience only long centuries teach." },
        { id = "h_woodland", tags = { "news" }, when = { questActive = TODO_QUEST("The Woodland Protector") },
          text = "Tarindrella the dryad has come back to Shadowglen, after years unseen. A Sentinel spotted her southwest of Aldrassil. Find out why she's come." },
        { id = "h_hum", when = { metBefore = true }, text = "Aldrassil hums when the wind is right, so put your ear to the bark one day and listen. Tenaron finds it undignified, but Tenaron is wrong." },
        { id = "h_moss", when = { questDone = TODO_QUEST("The Woodland Protector") },
          text = "Fel Moss on the grells. Tarindrella was right to come. If it's in them, I fear it's in the Gnarlpine too." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Lower your voice near the roots, please, because Aldrassil has heard enough clashing steel for one age." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The young ones of Aldrassil learn the bow and the beast together, and I'm glad to see one who has stuck with it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, beneath Aldrassil! Forgive me for staring, but I've never seen one this close to the old tree, and I can't help wondering whether it hums for you as it hums for us." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock beneath Aldrassil. I'll ask you plainly to keep your servant away from the roots, because the old tree has felt enough of the fel already." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Speak softly near the roots, for I believe Aldrassil hears every word, as the old forests of Ashenvale did. Do your spirits hear it too?" },
      },
      again = {
        { id = "h_again", text = "Ask on. Aldrassil's in no hurry." },
        { id = "h_again2", text = "Something else? The roots can wait a moment." },
      },
      choices = {
        { text = "What's it like, tending Aldrassil?", next = "tending" },
        { text = "You share a name with the Arch Druid, I think.", next = "kin" },
        { text = "Who is Tarindrella?", next = "dryad", when = { any = { { questActive = TODO_QUEST("The Woodland Protector") }, { questDone = TODO_QUEST("The Woodland Protector") } } } },
        { text = "Teach me what you know.", next = "druid_m", when = { class = "DRUID" } },
        { text = "Even a rogue can feel Aldrassil hum.", next = "rogue_m", when = { class = "ROGUE" } },
        { text = "Could a prayer do Aldrassil any good, Melithar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What did you read about the Silver Hand, Melithar?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does Aldrassil mind the arcane, Melithar?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can Aldrassil really feel my servant, Melithar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does Aldrassil actually hear us, Melithar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
        { text = "Does Aldrassil mind warriors training beneath it?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a young hunter of Shadowglen learn first?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Everyone points that out. My work is here, at the roots, and whatever name I carry, the tree doesn't care, and neither should you." } },
      choices = {
        { text = "Then I'll stop asking.", next = "BACK" },
        { text = "Would you tell me if you were?", next = "kin2", fx = { trait = { witty = 1 } } },
      },
    },
    kin2 = {
      lines = { { id = "k2_default", text = "Probably not, for a name is heavy enough without anyone else's hung on it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tending = {
      lines = {
        { id = "t_slow", text = "Slowly. A tree this old hurries for no one, and I've learned to measure my days in new leaves and my years in rings I'll never see." },
      },
      choices = {
        { text = "A patient life.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Does the tree tell you things?", next = "hum" },
      },
    },
    hum = {
      lines = { { id = "hu_default", text = "Not in words. It creaks when it's thirsty and goes quiet before storms. I've learned to hear the difference." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dryad = {
      lines = { { id = "d_default", text = "A dryad, a protector of the woods. She hasn't been felt in Kalimdor's forests for years, and she doesn't wander without reason." } },
      choices = {
        { text = "What reason, this time?", next = "dryad2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dryad2 = {
      lines = { { id = "d2_default", text = "Fel Moss, I fear. The grells have been at it, and the Gnarlpine furbolgs have left their homes in the hills. Athridas in Dolanaar watches them closest." } },
      choices = { { text = "I'll look into it.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    druid_m = {
      lines = { { id = "dm_default", text = "I'm no trainer; Mardant upstairs is. But I will tell you something he won't: the bear is easy to learn, and patience is not." } },
      choices = { { text = "I'll work on patience.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Aldrassil's roots run deep, and so does what I've learned tending them. Ask, and be patient with my answers." },
    },
    background = { { id = "tp_bg", text = "I tend Aldrassil's roots. I'm better at roots than at stories." } },
    advice = { { id = "tp_ad", text = "Stay on the paths until you know which roots trip." } },
    fel_moss = { { id = "tp_moss", text = "It's in the grells. Tarindrella thinks the furbolgs too. I hope she's wrong." } },
    cenarion_circle = { { id = "tp_circle", text = "Every druid in Shadowglen hopes the Circle will notice them one day. Few say so aloud." } },
    nordrassil = { { id = "tp_nordrassil", text = "Aldrassil's roots are deep, but Nordrassil's go down past where anything ought to grow. I've only seen them in drawings, and the drawings frightened me." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "When I sleep beside Aldrassil's roots, I dream green. I suppose that means something, though nobody in Shadowglen has told me what." } },
    green_dragons = { { id = "tp_green_dragons", text = "The dragons of the Dream care for the great trees, the old druids say. I've never seen one, and I've spent a long time looking up." } },
    _none = { { id = "tp_none", text = "I couldn't say, but Tenaron might, at the top of Aldrassil." } },
  },
}

P:NPC {
  key = "tenaron", id = TODO_NPC("Tenaron Stormgrip"), name = "Tenaron Stormgrip",
  bible = "bibles/teldrassil.md", role = "noble", tier = "major",
  communities = { "shadowglen" }, temper = { "warm" }, values = { "wise", "kind" },
  notices = { "greenness", "race" },
  impression = {
    first = "From the crown of Aldrassil, Tenaron Stormgrip watches every young elf walk the path down to Dolanaar. He has the warmth of someone who hopes each of them will one day climb back up.",
    third = "{name} climbed to the crown of Aldrassil and met Tenaron Stormgrip, who watches over Shadowglen and blesses all who leave it.",
  },

  greetings = {
    { id = "g_aldrassil", text = "Welcome to the top of Aldrassil. From here you can see most of Shadowglen, and it looks small from up here, though it isn't." },
    { id = "g_back", when = { metBefore = true }, text = "You've made the climb again. I always have time for those who climb." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I watched the path for you more than once. Come, the view from Aldrassil hasn't changed, though you may have." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "It has been {away} since you walked down this tree, and you've climbed back up as something more than you were. This is what I hope for, every time one of you leaves." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much since you first made this climb, young one. Shadowglen looks smaller from up here, and so, I suspect, does the world to you now." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the glade has spoken warmly of you, and those words climb all the way up Aldrassil. I'm glad to hear them." },
  },

  notice = {
    { id = "n_ready", cat = "greenness", when = { minLevel = 5, maxLevel = 9 },
      text = "You've grown since you came to the glade. It shows in how you stand. Soon you'll go down for the last time." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Child of the kaldorei, the forest remembers us even when we forget it, so remember it in turn." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The High Priestess leads, and the Archdruid would like to, and the rest of us look from one to the other like children at supper. You will stand before both of them before long, so tell me whom you would follow." },
      },
      choices = {
        { text = "Tyrande. She led at Hyjal and she held the line.", next = "op_r1", fx = { affinity = 1, align = { order = 1 }, opinion = { tyrande = "admire" } } },
        { text = "Fandral. He grew this tree, and he thinks ahead.", next = "op_r2", fx = { align = { order = -1 }, opinion = { fandral = "admire" } } },
        { text = "Neither of them. I'll follow my own sense.", next = "op_r3", fx = { trait = { brave = 1 }, opinion = { tyrande = "doubt", fandral = "doubt" } } },
        { text = "Malfurion. I'll wait for him to wake.", next = "op_r4", fx = { affinity = 1, trait = { patient = 1 }, opinion = { malfurion = "faith" } }, when = { race = "NightElf" } },
        { text = "I haven't met either of them yet.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "So would I, and so did I. Her arrows did more at Hyjal than any speech I heard there." } },
      choices = { { text = "I'll think on it.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "He thinks ahead, I'll give him that, and he thinks loudly. Mind that he doesn't think ahead of you." } },
      choices = { { text = "I'll think on it.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "A young one's answer, and not a bad one, though in Darnassus you'll find that choosing nobody is a choice as well." } },
      choices = { { text = "I'll think on it.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then you'll wait a long while, and kindly. I hope he wakes to find that we kept his house in order." } },
      choices = { { text = "I'll think on it.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I hope for every one, though not all return. I hope they climb back up one day. A shaman's spirits might watch over them." } },
      choices = {
        { text = "I hope they all return, Tenaron. That is a good hope.", next = "BACK", reply = "It is, and I hold to it every night. Thank you for sharing it.", fx = { align = { light = 1 } } },
        { text = "Not all can return. Accept it.", next = "BACK", reply = "I know, and I have accepted it more times than I can count. But I still hope.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Brighter, and kinder, as though Elune leaned a little closer to the young ones beneath her. Whatever you pray to, {class}, I think you'll find it easier up here, where the wind carries the words away gently." } },
      choices = {
        { text = "Then I'll say a prayer here before I go down.", next = "BACK", reply = "Thank you, {class}, and Elune will hear it, wherever you go. The young ones will be glad of it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The moon's the same from anywhere, and height won't help a prayer.", next = "BACK", reply = "Perhaps it does not, but the young ones believe it does, and that is enough for me. Pray anyway.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nothing they would ask for, because they are proud, as all young kaldorei are. Show them what it is to fight beside someone for no reward but the fighting, though, and they'll carry it longer than any lesson of mine." } },
      choices = {
        { text = "Then I'll set them an example worth following.", next = "BACK", reply = "Thank you, paladin, and they will be watching more closely than you think. Pride learns best by example.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They aren't my people, so I'll mind my own road.", next = "BACK", reply = "They are not, but they will remember you either way. I would rather they remembered someone kind.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Then study it from the ground, stranger, and with your eyes and not your spells. The last of my people who studied great power too closely brought the Legion to Hyjal, and the ash of it settled before your kingdom had a name." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Then study it from the ground, and with your eyes and not your spells. Your people lost their city to their own cleverness, I'm told, and mine lost a world to theirs, so we may understand each other better than either of us expects." },
      },
      choices = {
        { text = "I'll respect your tree and your history.", next = "BACK", reply = "Thank you, stranger, and the tree will be grateful. Some of us are still slow to trust your kind.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Not every mage is a Highborne.", next = "BACK", reply = "No, but every Highborne began as a mage. Forgive me if I am slow to believe the difference.", fx = { align = { order = -1 } } },
        { text = "What can you see from up here?", next = "view" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Once, and longer and harder than your people can imagine, at the foot of Hyjal and in the ruins of our own cities. I can smell the same burning on you that I smelt on them, and you'll find no welcome here while it clings to you." },
      },
      choices = {
        { text = "Then I'll turn it against the Legion, never for it.", next = "BACK", reply = "Then the Legion will learn to fear you, and I will be glad of it. Never forget which side you stand on.", fx = { align = { light = 1 } } },
        { text = "Your war is over. Mine is just beginning.", next = "BACK", reply = "Mine will never be over, warlock, not while I remember Hyjal. I hope yours ends better than it began.", fx = { align = { light = -1 } } },
        { text = "What happened at Hyjal?", next = "hyjal" },
      },
    },
    warrior_tn = {
      lines = {
        { id = "wtn_default", text = "Start with the grells and the mangy wolves at the glade's edge, and don't be ashamed of them, because every Sentinel in Ashenvale started there. When you can walk to Dolanaar without stopping to bind a wound, go and see Elanaria on the Warrior's Terrace." },
        { id = "wtn_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "You've a soldier's way of standing already, and I'd guess somebody at Auberdine taught it to you. The glade will feel small after a coast watch, but its lessons are older than any watch." },
      },
      choices = {
        { text = "I'll go straight for the strongest thing out there.", next = "warrior_tn2", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "I'll take it in order, as you say.", next = "warrior_tn2", fx = { align = { order = 1 } } },
        { text = "Who is Elanaria?", next = "warrior_tn2" },
      },
    },
    warrior_tn2 = {
      lines = {
        { id = "wtn2_default", text = "A proud one, and she'll test you before she teaches you, which is the right way round. From up here I've watched a great many young warriors run down that path, and the ones who came back were never the fastest." },
      },
      choices = { { text = "Something else, Tenaron.", next = "BACK" } },
    },
    hunter_tn = {
      lines = {
        { id = "htn_default", text = "Whatever the forest has too much of this year, and Conservator Ilthalaine will tell you what that is. A hunter who takes what the glade can spare is welcome here, and one who takes more won't be for long." },
        { id = "htn_saber", when = { origin = "nightelf_nightsaber_rider" },
          text = "I've seen you with the sabers in the paddock below; they don't let just anyone close. When you're grown into that bow, Jocaste in the Enclave will teach you to keep a companion of your own." },
      },
      choices = {
        { text = "I'll take only what's needed.", next = "BACK", reply = "Then the Conservator will be glad of you, and so will the forest. Take only what is needed.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The strong eat. That's the forest's way too.", next = "BACK", reply = "It is the forest's way, until the forest runs out. Take less, and the strong will eat for longer.", fx = { align = { order = -1 } } },
      },
    },
    rogue_tn = {
      lines = {
        { id = "rtn_default", text = "So I noticed, since you were halfway up the stair before I heard you. We need quiet feet as much as loud swords, more so where the satyrs hide, but quiet feet need a good heart behind them, so keep yours." },
        { id = "rtn_watch", when = { origin = "nightelf_watcher_trained" },
          text = "Someone has trained you who doesn't usually train children, I think, and I won't ask who. Just remember the glade raised you before they did." },
      },
      choices = {
        { text = "I'll use the shadows to protect the glade.", next = "BACK", reply = "Then you will be welcome in Shadowglen, rogue, and the glade will be safer for it. Quiet feet are a gift.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A heart is a weakness in my line of work.", next = "BACK", reply = "Then you will never have anything worth protecting, and I am sorry for it. A heart is what makes the shadows worth walking in.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Gladly, for yours is the road Malfurion walked before you, and he sleeps in the Dream now while the rest of us keep his ways. Walk it gently, and may the wild know you as its own." } },
      choices = {
        { text = "I'll walk gently, and keep the ways Malfurion taught.", next = "BACK", reply = "Then Malfurion would be proud of you, and so am I. Walk gently, druid.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll find my own way, even if it isn't Malfurion's.", next = "BACK", reply = "That is your right, and Malfurion would not begrudge it. Only remember the road he walked.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, all the way up at Aldrassil's crown! From here the moon seems close enough to touch, and I've always thought priests ought to see it so." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in Shadowglen of all places! Mind your step on the ramp, {class}, because Aldrassil's bark has seen fewer iron boots than you have." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A young druid, setting out from Shadowglen. Aldrassil has watched many of the Circle's children go down that path, and every one of them carried a little of its strength away with them." },
        { id = "h_default", key = true,
          text = "I am Tenaron Stormgrip, and I watch over Shadowglen from Aldrassil's crown. Every young kaldorei who leaves the glade passes beneath me on the way, and I remember each of them." },
        { id = "h_summons", tags = { "news" }, when = { questActive = TODO_QUEST("Tenaron's Summons") },
          text = "You came when I called, and that is good. There is a task that will take you beyond the glade, and you are ready for it." },
        { id = "h_crown", when = { questActive = TODO_QUEST("Crown of the Earth") },
          text = "Take this vial to the moonwell and fill it. Then carry it down to Dolanaar. Corithras will know what to do with it." },
        { id = "h_count", when = { metBefore = true }, text = "Every morning I watch the young ones walk the path down to Dolanaar. Most come back one day, taller and quieter, and that's the part I like." },
        { id = "h_returned", when = { minLevel = 20 },
          text = "You came back up the tree. Most don't, once the world below has them. Sit, and tell me what you've seen down there." },
        { id = "h_visitor", when = { ["not"] = { race = "NightElf" } },
          text = "A visitor, all the way up to Aldrassil's crown! You are either very curious or very lost, and both are welcome here." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, come to the crown of Aldrassil! I have watched every young one walk down to Dolanaar for longer than your mountains have had names, and your path is unusual, but welcome." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The view will keep." },
        { id = "h_again2", text = "Go on. I've been up here a long while; I can listen a while longer." },
      },
      choices = {
        { text = "Who leads your people, now that Malfurion sleeps?", next = "op_ask" },
        { text = "What lies beyond the glade?", next = "beyond" },
        { text = "Filling a phial seems a small errand for a first lesson.", next = "crown", when = { any = { { questActive = TODO_QUEST("Crown of the Earth") }, { questDone = TODO_QUEST("Crown of the Earth") } } } },
        { text = "What happened at Hyjal?", next = "hyjal" },
        { text = "You must see the whole glade from up here.", next = "view" },
        { text = "I've been down in the world. It's hard.", next = "world_t", when = { minLevel = 20 } },
        { text = "I'm not kaldorei. Am I welcome here?", next = "welcome", when = { ["not"] = { race = "NightElf" } } },
        { text = "Corithras told me the rest of the story.", next = "story", when = { questDone = TODO_QUEST("Crown of the Earth") } },
        { text = "I was raised to the blade. Where do I start?", next = "warrior_tn", when = { class = "WARRIOR" } },
        { text = "My bow is strung. What should I hunt first?", next = "hunter_tn", when = { class = "HUNTER" } },
        { text = "I learned to move quietly before I could fight.", next = "rogue_tn", when = { class = "ROGUE" } },
        { text = "I came a long way to study your great tree.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd heard the kaldorei fought demons once.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the moon look different from Aldrassil's crown?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a paladin owe the young elves of Shadowglen?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Will you bless a druid's road, Tenaron?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you hope every young one returns, Tenaron?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go when I'm ready.", next = "END" },
      },
    },
    beyond = {
      big = true,
      lines = {
        { id = "bd_default", text = "First Dolanaar, then Darnassus, and then the whole world below the tree. Some of it is beautiful and some of it is sick, and you will learn to tell which. Go with my blessing." },
      },
      choices = {
        { text = "Thank you.", next = "BACK", reply = "You are welcome, and may Elune walk with you down the tree. Come back and tell us what you find.", fx = { affinity = 2, align = { light = 1 }, standing = { shadowglen = 1 } } },
        { text = "I'll go, but I'll make my own way, blessing or not.", next = "BACK", reply = "Then go with it anyway, whether you want it or not. Elune does not ask permission.", fx = { align = { order = -1 } } },
        { text = "You make it sound as if parts of the tree are sick.", next = "sick" },
      },
    },
    sick = {
      lines = { { id = "si_default", text = "Starbreeze Village, where the Gnarlpine turned. The moonwells, if Corithras is right. And the tree itself grows faster than any tree should." } },
      choices = {
        { text = "Then someone should look into it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crown = {
      lines = { { id = "c_default", text = "The druids in Darnassus use the moonwells' water, and the wells must be watched. The phial is a lesson as much as an errand. Corithras will teach you the rest." } },
      choices = {
        { text = "What lesson?", next = "crown2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crown2 = {
      lines = { { id = "c2_default", text = "Our history since Hyjal. Nordrassil spent its power to destroy Archimonde, and our immortality went with it. The young ought to know what that cost." } },
      choices = { { text = "I'll listen to Corithras.", next = "BACK", fx = { affinity = 1 } } },
    },
    hyjal = {
      lines = { { id = "hy_default", text = "We fought the Legion beside orcs and humans, and the World Tree gave everything it had to end Archimonde. We won, and we have been paying for it ever since." } },
      choices = {
        { text = "I don't understand what you've been paying.", next = "hyjal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal2 = {
      lines = { { id = "hy2_default", text = "We grow old now, and we sicken, and some of my people cannot bear it. I find I don't mind the years, so long as I spend them up here." } },
      choices = {
        { text = "That's a good way to spend them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'd mind. I'd mind a great deal.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    view = {
      lines = { { id = "v_default", text = "Every path in Shadowglen, the spider cave to the north, the road south to Dolanaar. And every young elf who walks it. I watch until the trees take them." } },
      choices = {
        { text = "Not all of them come back, I'd guess.", next = "view2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    view2 = {
      lines = { { id = "v2_default", text = "Most of them do, one day, and taller than they left. A few never return, and I remember those names and say them up here, where the wind carries them." } },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "You blame yourself for the ones who don't come back.", tag = "Persuade", next = "view_names",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "kind" }, { questDone = TODO_QUEST("Crown of the Earth") } } } },
          fail = { next = "view_wind", fx = { affinity = -1 } } },
      },
    },
    world_t = {
      lines = { { id = "wt_default", text = "It is. Sit with me a moment, and tell me what the worst of it is, down there." } },
      choices = {
        { text = "The Horde, cutting Ashenvale.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "The corruption. It's everywhere.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Honestly? Being far from home.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    welcome = {
      lines = { { id = "we_default", text = "You climbed Aldrassil, and that is welcome enough. The glade asks only that you walk gently and leave it as you found it." } },
      choices = { { text = "I will. Thank you.", next = "BACK", fx = { affinity = 1, standing = { shadowglen = 1 } } } },
    },
    story = {
      lines = { { id = "so_default", text = "Then you know about the dragons' refusal, and the furbolgs. It is better that you hear it from us than learn it from the sickness itself." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    view_names = {
      lines = {
        { id = "vn_default", text = "Not blame, exactly, but I send each of them down with a blessing, and since Hyjal we are not what we were. A young elf who falls in the forest now does not get up again, and I am still learning to say goodbye as if it might be the last time." },
        { id = "vn_kin", when = { race = "NightElf" },
          text = "You were one of them not long ago, so I'll tell you plainly. Since Hyjal a fall in the forest can be the last one, and every time I bless one of you on your way down, I wonder whether I said enough." },
      },
      choices = {
        { text = "You say enough, Tenaron. They remember it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    view_wind = {
      lines = {
        { id = "vw_default", text = "The wind carries their names, and I let it. That is all there is to say about it on a morning as fine as this one." },
        { id = "vw_world", when = { minLevel = 20 },
          text = "You've been down in the world long enough to know there are things a person keeps to himself. Let an old watchman keep this one." },
      },
      choices = {
        { text = "Of course.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "From the top of Aldrassil I see a great deal, and the wind brings me the rest. Ask what you like, young one." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "You always climb back up to me, and I'm glad of it. Ask me anything; there's little I would keep from you." },
    },
    background = { { id = "tp_bg", text = "I watch over Shadowglen from up here. Someone should see the whole glade at once." } },
    advice = { { id = "tp_ad", text = "Stay on the road to Dolanaar. The forest has grown dangerous beasts of late." } },
    teldrassil = { { id = "tp_teldrassil", text = "Young, tall, and still growing. Too quickly, some say. I only see it from the top." } },
    nordrassil = { { id = "tp_nordrassil", text = "From up here I can see half of Teldrassil, and on a clear night I imagine I can see Hyjal. I can't, of course, but it helps to look." } },
    elune = { { id = "tp_elune", text = "The moon rises right over Shadowglen, and from this tower you can watch Elune climb the whole sky. I think I chose this post for that, more than the view." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Travellers tell me the Darkmoon Faire is all lanterns and music. From up here I'd see it coming from leagues away, if it ever came." } },
    _none = { { id = "tp_none", text = "That is beyond what I can see from here, and I can see a long way." } },
  },
}

P:NPC {
  key = "dirania", id = TODO_NPC("Dirania Silvershine"), name = "Dirania Silvershine",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "wistful" }, values = { "kind", "loyal" },
  notices = { "pet" },
  impression = {
    first = "Dirania Silvershine kept glancing toward the spider cave the whole time we spoke. She calls Shadowglen home, but her mind was plainly on a friend who keeps getting himself into trouble.",
    third = "{name} met Dirania Silvershine, a wistful soul of Shadowglen forever worrying over her friend Iverron.",
  },

  greetings = {
    { id = "g_home", text = "All isn't well in the glade, I know, but coming back here always feels like coming home, the way the moonlight always finds its way back to the same leaves." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "What a fine companion! Be good to it, for friends are what get us through the dark parts of the forest." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "He gets himself caught every time, the fool. I worry. Your spirits might help him out." } },
      choices = {
        { text = "I will help him, Dirania. Friends are worth it.", next = "BACK", reply = "Thank you, and he will be glad of it, though he will not say so. He never does.", fx = { align = { honor = 1 } } },
        { text = "Let him learn his lesson.", next = "BACK", reply = "He has learned it a dozen times already, and he never remembers. Please help him anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I don't know, and that's what frightens me, because the venom from the Webwood works slowly and stubbornly. A prayer might ease him while the antidote is made, though, and I think he'd simply like the company." } },
      choices = {
        { text = "I'll go to him and pray beside him.", next = "BACK", reply = "Thank you, priest, and he will be glad of the company. Every little bit helps.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't help him, and only the antidote will.", next = "BACK", reply = "You are right, I know, and that is why I am working so hard on it. Please help me finish.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Iverron, first, though he'd never say it, and then any young elf foolish enough to wander toward Shadowthread Cave. The spiders have grown bold this season, and I'd feel a great deal better knowing someone in armor walked those paths." } },
      choices = {
        { text = "Then I'll walk those paths until they're safe.", next = "BACK", reply = "Thank you, paladin, and the young ones will be safer for it. Iverron will be glad to hear it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fools who wander into spider caves get what they find.", next = "BACK", reply = "They do, but Iverron is my friend, and I would rather he lived. Please help him anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Please don't charge in, because the spiders are thick in that cave and Iverron is already sick from their venom. Find him on the path near the cave and help him get his antidote, and if anything with eight legs comes for you on the way, then you can swing." } },
      choices = {
        { text = "I'll find him first and fight only if I must.", next = "BACK", reply = "Thank you, warrior, and please be careful. The spiders are worse than they look.", fx = { align = { order = 1 } } },
        { text = "Better to clear the cave so it never happens again.", next = "BACK", reply = "Perhaps, but Iverron first, please. The cave can wait.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More every day, and they've started taking the small animals from the edge of the glade, which they never used to do. I keep thinking one of them will take Iverron next, and he will insist on walking that way." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} close if you go near the cave, because the webs are strong enough to hold a cat. I've seen it happen and I don't want to see it again." },
      },
      choices = {
        { text = "I'll drive the spiders back from the glade.", next = "BACK", reply = "Thank you, hunter, and the small animals will thank you too. The glade has been so quiet lately.", fx = { align = { order = 1 } } },
        { text = "Spiders hunt like anything else. Leave them be.", next = "BACK", reply = "They do, but they are hunting where they never used to. Something is wrong, and I would rather know what.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    rogue_d = {
      lines = {
        { id = "rd_default", text = "Do you? Then you'll know that spider venom is quick at first and slow afterwards, and that Iverron hasn't got much of the slow part left. Please don't tell me how you learned it; just help me make the antidote." },
      },
      choices = {
        { text = "I'll help. The how doesn't matter.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Perhaps one of the elders could, but you are as young as he is, and webwood venom is stubborn stuff. Help me with the antidote instead, and save your healing for whatever bites you next." } },
      choices = {
        { text = "The antidote, then, and I'll gather what it needs properly.", next = "BACK", reply = "Thank you, druid, and Iverron will thank you too, when he can stand. Every herb counts.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll try my own healing on him anyway.", next = "BACK", reply = "Please, at least let me finish the antidote first. Webwood venom is stubborn stuff.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not your kind, I'm afraid, because spider venom wants herbs and patience, not fire and frost. If you go into the Webwood, though, I'd be glad of a mage beside him, because the spiders there hate fire as much as anything." },
      },
      choices = {
        { text = "I'll go carefully and bring him back.", next = "BACK", reply = "Thank you, mage, and please be careful in there. The webs catch more than spiders.", fx = { align = { light = 1 } } },
        { text = "Then I'll burn the spiders out of their cave.", next = "BACK", reply = "Please do not, for the tree is young and the Webwood would burn for days. Bring Iverron back first.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd rather you went yourself, if you don't mind my saying, because Iverron would faint clean away if a demon came to fetch him. Bring back what he needs for the antidote, and I'll not ask what helped you do it." },
      },
      choices = {
        { text = "I'll go myself. Iverron's had enough fright.", next = "BACK", reply = "Thank you, and he will be so glad of it. He has had a very bad week.", fx = { align = { honor = 1 } } },
        { text = "My servant will go. Iverron can faint.", next = "BACK", reply = "He will, and then he will tell the whole of Shadowglen about it. Please go yourself.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, I'm glad, for my friend Iverron lies poisoned near the Webwood and I can't stop thinking of him, so perhaps you'll go and see him for me." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, here in Shadowglen? Then perhaps you'll understand why I worry so, because your order swears to stand by those who can't stand alone." },
        { id = "h_default", key = true,
          text = "I am Dirania Silvershine, and Shadowglen has always felt like home to me, even now. Though a friend of mine is worrying me today, Elune keep him." },
        { id = "h_friend", tags = { "news" }, when = { questActive = TODO_QUEST("A Good Friend") },
          text = "Iverron visits me at the same hour every day, and today he hasn't. He spends far too long by that spider cave. Please, look for him." },
        { id = "h_antidote", when = { questActive = TODO_QUEST("Iverron's Antidote") },
          text = "Hyacinth mushrooms, moonpetal lilies, and ichor from the very spiders that bit him. Bring them, and I'll make the antidote. Hurry, if you can." },
        { id = "h_saved", when = { questDone = TODO_QUEST("Iverron's Antidote") }, text = "Iverron's on his feet already, and talking about going back into the cave. Some friends you have to keep saving. Thank you for this time." },
        { id = "h_bitten", tags = { "news" }, when = { questActive = TODO_QUEST("A Friend in Need") },
          text = "Bitten by Githyiss? I've warned him about those spiders more times than I can count! All right, then, we can make an antidote." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, good, because my friend Iverron went too near the spider cave, and I'm not much use with a blade." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll know spider tracks when you see them, and there are far too many near the cave today." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Iverron has gone near the spider cave again, and I keep thinking a druid's healing might do more for that venom than anything I can brew." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, here? You couldn't magic away spider venom, I suppose, because Iverron's gone into the Webwood again." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock in Shadowglen, and I suppose your servant doesn't mind spider venom? Iverron's gone and got himself bitten again." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Forgive me, my friend is in the spider cave again and I keep looking for him, so if your spirits can see further than I can, please ask them." },
      },
      again = {
        { id = "h_again", text = "What else? Sorry, I keep looking toward the cave." },
        { id = "h_again2", text = "Ask. It helps to talk while I wait." },
      },
      choices = {
        { text = "Tell me about your friend.", next = "iverron" },
        { text = "What's wrong in Shadowglen?", next = "glen" },
        { text = "The antidote needs a fair few ingredients, it seems.", next = "herbs", when = { questActive = TODO_QUEST("Iverron's Antidote") } },
        { text = "I know a thing or two about poisons.", next = "rogue_d", when = { class = "ROGUE" } },
        { text = "Is Iverron's poison beyond a priest's help, Dirania?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who needs protecting here, Dirania?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can't magic help Iverron, Dirania?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should my servant go into the Webwood for Iverron?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is your friend often in danger, Dirania?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help him.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Should I go into the Webwood after him, Dirania?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are the Webwood spiders coming out of their cave?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Couldn't a druid simply cure Iverron's poison, Dirania?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
      },
    },
    iverron = {
      lines = {
        { id = "i_brave", text = "He comes by at the same hour every day, and he explores where he shouldn't. He's brave the way that worries everyone who cares about him." },
      },
      choices = {
        { text = "He's lucky to have you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why does he keep going to the cave?", next = "iverron2" },
      },
    },
    iverron2 = {
      lines = { { id = "i2_default", text = "He says the spiders are bigger than they ought to be, and he wants to know why. Gilshalan on the steps says the same, from much further away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    glen = {
      lines = { { id = "gl_default", text = "Grells to the south, spiders to the north, and the furbolgs gone strange... All isn't well, I know, but it is still home." } },
      choices = {
        { text = "What's wrong with the furbolgs?", next = "glen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glen2 = {
      lines = { { id = "gl2_default", text = "Ask Melithar; he's had word from a dryad about it. Or Athridas, down in Dolanaar. I only know the Gnarlpine have left their homes in the hills." } },
      choices = { { text = "I'll ask them.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    herbs = {
      lines = { { id = "he_default", text = "Hyacinth mushrooms grow under the trees, and the grells to the south hoard them, while moonpetal lilies only grow by the pools. The ichor you'll have to take from the spiders themselves." } },
      choices = { { text = "I'll be quick.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "These woods feel like home every time I come back, and that is my whole story. Iverron's is longer, and more foolish." } },
    advice = { { id = "tp_ad", text = "Never go into a spider cave alone. Tell Iverron that, if you see him." } },
    elune = { { id = "tp_elune", text = "I pray to Elune for patience with Iverron, which she has given me in very small portions. I think she finds him funny." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the furbolgs that stayed sane, in Felwood far north. I wish ours had been so lucky." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Iverron wants to go to the Darkmoon Faire and wrestle a bear. I've told him the bear will win, and he says that's the fun of it." } },
    _none = { { id = "tp_none", text = "I'm sorry, my mind is on Iverron." } },
  },
}

P:NPC {
  key = "gilshalan", id = TODO_NPC("Gilshalan Windwalker"), name = "Gilshalan Windwalker",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "solitary" }, values = { "curious" },
  notices = { "craft" },
  impression = {
    first = "Alone on Aldrassil's steps sits Gilshalan Windwalker, who studies the Webwood spiders from a distance, mostly. I liked his dry way of talking, and I suspect the distance is not only for science.",
    third = "{name} met Gilshalan Windwalker, a solitary scholar on Aldrassil's steps who studies the Webwood spiders of Shadowthread Cave.",
  },

  greetings = {
    { id = "g_steps", text = "Oh, hello. I was only sitting, for the steps are good for sitting, and Aldrassil doesn't mind being leaned on." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You work with venoms and draughts? Then you'll understand why I need what I need." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because they bite, and I prefer to keep my distance. Your spirits might not mind the bites." } },
      choices = {
        { text = "Study them carefully, Gilshalan. Caution is wise.", next = "BACK", reply = "Thank you, and I will be careful, I promise. The bites are very unpleasant.", fx = { align = { honor = 1 } } },
        { text = "Get closer. You will learn more.", next = "BACK", reply = "Easy for you to say, but I would rather learn from a distance than from a bite. Perhaps you could go closer for me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not yet, though Iverron came near enough, and the webs creep a little farther from Shadowthread Cave every week. If any of the young ones are caught, I'd want someone like you on the way back, because the venom works slowly enough to leave time for a healer." } },
      choices = {
        { text = "Then I'll stay near the cave in case they need me.", next = "BACK", reply = "Thank you, priest, and the young ones will be safer for it. I will tell them where to find you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Young ones who stray near the cave should know better.", next = "BACK", reply = "They should, and I tell them so, but the young never listen. Please help them anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every step, I should think, through the stone and the webs both. If you mean to go in, go in openly and let them come to you, because trying to creep about in that armor would only end with you hanging in a web." } },
      choices = {
        { text = "I'll walk in openly and let them come.", next = "BACK", reply = "Then they will come, and quickly. Be ready.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather draw them out one by one, from the dark.", next = "BACK", reply = "That is wiser, I think, and the spiders may not notice. Be careful in the dark.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Quickly, and with your mouth closed, because the venom is in the bite and the webs are in everything else. I can tell you a great deal about how they hunt from a safe distance, and none of it will help you once you're inside." } },
      choices = {
        { text = "I'll learn what you know first, then go in.", next = "BACK", reply = "Thank you, warrior, and I will tell you everything I know. It is not much, but it is something.", fx = { align = { order = 1 } } },
        { text = "I'll go in. The studying can come after.", next = "BACK", reply = "Then go quickly, and keep your mouth closed. I will be here when you come back.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Count them, please, and mind where you step, for the webs feel you before the spiders do. Your quiet will serve you well in there, though venom doesn't care how quiet you are." },
      },
      choices = {
        { text = "I'll do exactly as you ask, no more.", next = "BACK", reply = "Thank you, rogue, and I will be grateful for the count. Every web tells me something.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to burn the nest while I'm there.", next = "BACK", reply = "Please do not, for the tree is young and the Webwood would burn for days. Count them, and leave the rest to me.", fx = { align = { order = -1 } } },
        { text = "What's down in the cave?", next = "cave" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Fire, on Teldrassil? The tree is young and alive, and a fire in the Webwood would scar it worse than any spider. Use your craft if you must, but use frost, and use it sparingly." },
      },
      choices = {
        { text = "Frost it is. The tree comes first.", next = "BACK", reply = "Thank you, mage, and the tree will thank you too. Frost will do just as well.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the spiders spread, the tree suffers anyway.", next = "BACK", reply = "It does, and I know it, but a fire would hurt it more than the spiders ever could. Frost, please.", fx = { align = { order = -1 } } },
        { text = "Why do you study the spiders?", next = "why" },
      },
    },
    hunter_g = {
      lines = {
        { id = "hgl_default", text = "Please don't send it into Shadowthread Cave on my account. The Webwood spiders treat anything with four legs as a meal, and I'd rather study them from these steps than write an account of how your companion died." },
      },
      choices = {
        { text = "My companion goes where I go.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Then I'll watch from a distance with you.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They came up with the tree like everything else on it, so I suppose they are, but there are more of them every season and they're larger than they ought to be. The tree feeds them well, and I would very much like to know why." } },
      choices = {
        { text = "Then thin them only as much as the balance needs.", next = "BACK", reply = "Thank you, druid, and the Conservator will be glad of it. Balance is all we ask.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "There are too many, so clear out the whole cave.", next = "BACK", reply = "Perhaps there are, but I would rather understand them first. Clear only what you must.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Afraid is a strong word, though I'll admit it's the one I'd use. The spiders at least are honest about wanting to eat me, and I can't tell what that creature of yours wants, which is worse in a scholar's book." },
      },
      choices = {
        { text = "It wants what I tell it to. Nothing more.", next = "BACK", reply = "I hope so, warlock, for both our sakes. The spiders at least are honest about it.", fx = { align = { order = 1 } } },
        { text = "You're wise to fear it, scholar.", next = "BACK", reply = "Thank you, and I will go on fearing it, from a respectful distance. The spiders are quite enough.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You've a gentle look about you, which is more than I can say for most of the people who come asking about the cave." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "You're very loud, {class}, and I mean that kindly, but the spiders feel every step on the stone, so go into the cave knowing they'll be waiting." },
        { id = "h_default", key = true,
          text = "I'm Gilshalan Windwalker, and I study the Webwood spiders in the cave to the north, from a distance, mostly." },
        { id = "h_venom", tags = { "news" }, when = { questActive = TODO_QUEST("Webwood Venom") },
          text = "I need their venom sacs. I believe the new world tree has changed these spiders, and their venom will tell me how." },
        { id = "h_egg", when = { questActive = TODO_QUEST("Webwood Egg") },
          text = "There's a nest deep in Shadowthread Cave. Bring me an egg, unhatched. A live spider is more than either of us should handle." },
        { id = "h_summons", when = { questActive = TODO_QUEST("Tenaron's Summons") },
          text = "Tenaron is asking for you, at the very top of the tree. He is a patient elf, but I wouldn't test it." },
        { id = "h_shipped", when = { questDone = TODO_QUEST("Webwood Egg") },
          text = "The egg has gone to Darnassus with the venom, and I'll follow when I'm done here, or when it hatches, whichever comes first." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want to study the Webwood spiders up close, I suppose, which is the opposite of my method." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll want to tell me the Webwood spiders are part of the balance too, and I won't argue, though I'd like the balance to keep its fangs to itself." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, on Aldrassil's steps. I study the Webwood spiders from a careful distance, and I'd like to study your servant from a slightly greater one." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Webwood", min = 20 } },
          text = "By my count, and I do count, you've cut the Webwood's numbers down by a fair few. The spiders are no less hungry for it, but there are fewer of them, which from a distance is the next best thing." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I study the Webwood spiders, mostly from a respectful distance, and I suspect your spirits could study them a good deal more closely than I'd care to." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm only sitting, after all." },
        { id = "h_again2", text = "Ask away. The spiders aren't going anywhere, which is rather the problem." },
      },
      choices = {
        { text = "Why study spiders?", next = "why" },
        { text = "Why sit out here on the steps?", next = "steps" },
        { text = "What's in the cave to the north?", next = "cave" },
        { text = "I'm an alchemist. Venom interests me.", next = "alch", when = { profession = "Alchemy" } },
        { text = "My companion could take a spider's measure for you.", next = "hunter_g", when = { class = "HUNTER" } },
        { text = "I could slip into the spider cave and count the eggs.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A little fire would clear that cave.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's the best way to fight the Webwood spiders?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have the spiders taken anyone from the glade, Gilshalan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would the spiders hear a paladin coming, Gilshalan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Are the Webwood spiders really part of the balance, Gilshalan?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Are you afraid of my servant, Gilshalan?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why study the spiders from a distance, Gilshalan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go to the cave.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    why = {
      lines = {
        { id = "w_silk", text = "Their silk is stronger than it has any right to be, and in the right hands their venom heals. They also frighten me witless, so I'd like them to frighten me less." },
      },
      choices = {
        { text = "Good luck with that.", next = "BACK", fx = { affinity = 1 } },
        { text = "It's hard to believe the tree changed them.", next = "tree_g" },
      },
    },
    tree_g = {
      lines = { { id = "tg_default", text = "They're cousins of a much smaller spider. Here they've grown huge. Something in Teldrassil feeds them more than it should." } },
      choices = {
        { text = "That's unsettling.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    steps = {
      lines = { { id = "s_default", text = "Inside, everyone asks me about spiders, but out here only you do, which is a much better ratio." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    cave = {
      lines = { { id = "c_default", text = "Webwood spiders, their nest, and deep at the back one big enough that the Sentinels name it: Githyiss the Vile. Don't go that far unless you mean to." } },
      choices = {
        { text = "Githyiss bit Iverron.", next = "cave2",
          when = { any = { { questActive = TODO_QUEST("A Friend in Need") }, { questActive = TODO_QUEST("Iverron's Antidote") } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave2 = {
      lines = { { id = "c2_default", text = "Then Dirania will be furious, and rightly. Her antidote needs the spiders' own ichor. There's a lesson in that I haven't finished learning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alch = {
      lines = { { id = "a_default", text = "Then you know a venom that kills can cure, measured right. Dirania's antidote uses their ichor for exactly that reason." } },
      choices = { { text = "I'll keep a sac or two.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came to Shadowglen to watch spiders, and I'm still watching them, from the steps, mostly." } },
    advice = { { id = "tp_ad", text = "Never stand under a web you can't see the end of." } },
    blackfathom = { { id = "tp_blackfathom", text = "There are spiders in Blackfathom Deeps that grow larger than any on this tree, or so a scholar told me. I'd go and see, if they didn't also have nagas." } },
    elune = { { id = "tp_elune", text = "Elune's light is good for spider-watching, actually, the webs catch it. I don't think the priestesses would approve of the use, but I find it devotional." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "I'd like to know if there are spiders in the Emerald Dream. I asked a druid once, and she told me not to dream about it." } },
    _none = { { id = "tp_none", text = "Spiders I know, and the Webwood has kept me busy enough for a century. Most other things, less so." } },
  },
}
