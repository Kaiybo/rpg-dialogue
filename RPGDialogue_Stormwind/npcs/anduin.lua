-- King Anduin Wrynn, ten years old, Stormwind Keep. Voice: bibles/anduin.md
-- Trying to be the king the kingdom needs while his father is missing.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "anduin", id = TODO_NPC("King Anduin Wrynn"), name = "King Anduin Wrynn",
  bible = "bibles/anduin.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "curious" },
  notices = { "wonder", "far", "form" },
  impression = {
    first = "He seems far more curious about me than about being king.",
    third = "{name} was received by the boy king Anduin Wrynn, who rules until his father comes home and tries very hard at it.",
  },

  greetings = {
    { id = "g_op_bolvar", when = { gossip = { topic = "bolvar", stance = "trusted" } }, text = "Somebody told me you said you'd follow Bolvar anywhere. So would I, only he never lets me go anywhere at all." },
    { id = "g_op_orcs", when = { opinion = { topic = "orcs", stance = "wary" } }, text = "You're the one who said to judge every orc by what he does! I said it at council, and one of the dukes dropped his spoon." },
    { id = "g_formal", text = "Welcome to Stormwind Keep! Um, I mean, be welcome; I think that's how you're supposed to say it." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I mean, the crown recognizes you, and it's very glad you're here." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You've gone all dark and see-through! Is that the Light, only backwards? Does it hurt? Bolvar will want to know if it hurts." },
    { id = "n_cat", cat = "wonder", place = "replace", when = { form = { "cat", "bear" } },
      text = "Is that- you were a person a moment ago! Can you do that whenever you like? Highlord, did you see that? Oh, he's not even looking." },
    { id = "n_pet", cat = "wonder", when = { pet = { type = "Beast" } },
      text = "Does {pet} have a title? Everyone in the Keep has one, and I could give {pet} a title, because I'm allowed." },
    { id = "n_skyborne", cat = "far", when = { race = "Skyborne" },
      text = "You're one of the elves from the sky! Lady Prestor says not to stare. I'm only staring a little." },
    { id = "n_dwarf", cat = "far", when = { race = { "Dwarf", "Gnome" } },
      text = "Did you come on the tram? I've never been on it, because kings aren't allowed, though I did ask." },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "You just went dark! Can you do it again? Slowly, so I can see?" },
  },

  start = "hello",
  nodes = {
    dd_anduin_e = {
      lines = {
        { id = "dd_anduin_e_a", text = "He does, and so does Lady Prestor, though she says it differently, and I can never tell if she means it kindly. I try to listen to what people do rather than what they say, which my father told me once, before he went away." },
      },
      choices = {
        { text = "Your father was right. Deeds matter more than words.", next = "dd_anduin_e2", fx = { align = { honor = 1 } } },
        { text = "Words matter too, Your Majesty. They move nobles.", next = "dd_anduin_e2", fx = { align = { honor = -1 } } },
      },
    },
    dd_anduin_e2 = {
      lines = {
        { id = "dd_anduin_e2a", text = "I'll remember that, and I'll write it in the book where I keep things I want to remember. I'm still learning how to be king, but I think I'm learning who to trust, and you're on that page." },
      },
      choices = { { text = "I'm honored, Your Majesty. Something else.", next = "BACK" } },
    },

    op_orcs = {
      lines = {
        { id = "op_orcs_a", text = "The orcs, mostly. Lady Prestor says they're beasts and always will be, and Bolvar says some of them only ever wanted to go home, and I can't tell which of them is right. What do you think?" },
      },
      choices = {
        { text = "Some orcs want peace, Your Majesty. The Highlord's right to hope.", next = "op_orcs_1", fx = { opinion = { orcs = "trust", peace = "for" }, align = { light = 1 }, affinity = 1 } },
        { text = "Lady Prestor's right. Orcs only understand the sword.", next = "op_orcs_2", fx = { opinion = { orcs = "hate", prestor = "ally" }, align = { light = -1 } } },
        { text = "Judge each orc by what he does, not by what he is.", next = "op_orcs_3", fx = { opinion = { orcs = "wary" }, align = { honor = 1 }, trait = { kind = 1 }, affinity = 2 } },
        { text = "The orcs are still cutting Ashenvale's trees. Ask my people about peace.", next = "op_orcs_4", when = { race = "NightElf" }, fx = { opinion = { orcs = "distrust", ashenvale = "orcs_wrong" } } },
        { text = "They burned my home in Lordaeron, Your Majesty. I won't forgive that.", next = "op_orcs_5", when = { origin = "human_lordaeron_refugee" }, fx = { opinion = { orcs = "hate" } } },
        { text = "That's a question for the Regent, Your Majesty.", next = "BACK" },
      },
    },
    op_orcs_1 = {
      lines = { { id = "op_orcs_r1", text = "I hoped you'd say that, because I think so too, only I'm not allowed to say it at council. Please don't tell Lady Prestor I agreed with you." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK" } },
    },
    op_orcs_2 = {
      lines = { { id = "op_orcs_r2", text = "Oh. That's what the nobles say too, and they always say it very loudly. I suppose you've met more orcs than I have, so you'd know." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK" } },
    },
    op_orcs_3 = {
      lines = { { id = "op_orcs_r3", text = "That's the sort of thing my father would say, I think. I'm going to write it down before I forget it, and then I'll say it at council and see who frowns." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK" } },
    },
    op_orcs_4 = {
      lines = { { id = "op_orcs_r4", text = "I didn't know they were still fighting anywhere. Nobody tells me about Ashenvale, because they think it's too far away to matter, and I don't think it is." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK" } },
    },
    op_orcs_5 = {
      lines = { { id = "op_orcs_r5", text = "I'm sorry. Bolvar says the people from the north lost more than anyone, and I shouldn't ask anybody to forgive things I never had to." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK" } },
    },
    xpt_anduin = {
      big = true,
      lines = { { id = "xpt_anduin_default", text = "Not really, because everyone wants something from me, even the ones who are nice about it. Lady Prestor says a king doesn't need friends, only loyal servants, but my father had Uncle Bolvar, so I don't think she's right." } },
      choices = {
        { text = "Lady Prestor is right. A king must keep himself apart.", next = "BACK", reply = "Oh. Everybody says that, so I suppose it must be true, though it does make the Keep feel very big at night.", fx = { align = { order = 1 } } },
        { text = "Find friends anyway, Your Majesty. Some rules are meant to bend.", next = "BACK", reply = "Do you really think so? I'll try, then, but please don't tell Lady Prestor it was your idea, because she'll give you that look.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "One book said the orcs listened to the land before they listened to demons. I liked that part, but my tutor said I should not repeat it at court." } },
      choices = {
        { text = "Repeat it, Your Majesty. Listening is never a thing to be ashamed of.", next = "BACK", reply = "Thank you! I'll still say it quietly, though, because my tutor gets a sort of pained face and I don't like making people unhappy.", fx = { align = { light = 1 } } },
        { text = "Your tutor is right. Some things are better kept quiet at court.", next = "BACK", reply = "I suppose so. I'll keep it in my own head, then, where nobody can tell me off for it, and think about it when it's raining.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Bolvar says they keep the kingdom safe in ways that wouldn't look very nice if I saw them, and that's why he doesn't let me see them. I think a king ought to know, though, even if he's only ten." } },
      choices = {
        { text = "A king should know what's done in his name, Your Majesty.", next = "BACK", reply = "That's what I said! Bolvar only sighed and told me I'd understand when I'm older, which is what grown-ups say when they've lost an argument.", fx = { align = { honor = 1 } } },
        { text = "Some things are better left in the dark, Your Majesty.", next = "BACK", reply = "Maybe you're right, but I don't like not knowing. I'll leave it to Bolvar for now, since he's very good at worrying for me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Yes, please, only a small one, so the guards don't come running! Bolvar says magic is like a sword, because it's only as good as the person holding it, and I've decided that's true of kings as well." } },
      choices = {
        { text = "Power is only good when it serves others, Your Majesty.", next = "BACK", reply = "That's just what Bolvar says! He'll be pleased someone agrees with him, because I usually argue with him for fun.", fx = { align = { light = 1 } } },
        { text = "Power is its own reward, Your Majesty, so use it freely.", next = "BACK", reply = "I'm not sure that's right, because then what's it for? Bolvar says power used for nothing but itself is how the old warlocks started.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Archbishop says warlocks call on demons, the same kind the orcs used in the war, and that it's terribly dangerous. You don't look like a bad person, though, so I suppose it depends on why you do it." } },
      choices = {
        { text = "It does. I bind them so they can't harm anyone else.", next = "BACK", reply = "That's a relief, honestly. I'll tell the Archbishop you said so, though I don't think he'll believe me, because he never does about warlocks.", fx = { align = { light = 1 } } },
        { text = "It's power, Your Majesty, and I take it where I find it.", next = "BACK", reply = "Oh. That sounds like something the Archbishop would warn me about, so I think I'll stand a little closer to the guards now, if that's all right.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_anduin = {
      big = true,
      lines = { { id = "xalt_anduin_default", text = "Their name was {alt}, a {altclass}, and they let me hold their gloves while we talked, which the guards didn't like at all. Bolvar says a king mustn't have favourites among his subjects, but I think I'm allowed to have favourite visitors." } },
      choices = {
        { text = "I'll pass on your regards, Your Majesty.", next = "BACK", fx = { affinity = 1 } },
        { text = "Your guards are right to be careful, Your Majesty.", next = "BACK" },
        { text = "Something else, Your Majesty.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_exalted_anduin", when = { reputation = { faction = "Stormwind", min = "exalted" } },
          text = "Lord Bolvar says your name in council, and he doesn't say many names there unless he's cross with them, and he isn't cross with you. I've been hoping you'd come so I could thank you myself, because the city's been safer for what you've done." },

        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "You look ever so much like {alt}! That one came to see me too, and told me a story about a gryphon that I'm fairly sure wasn't true, but I liked it anyway, so are you related?" },
        { id = "h_alt_other", when = { alt = { notKin = true }, metBefore = false },
          text = "Do you know {alt}? I only ask because a {altrace} {altclass} by that name came to visit, and you have the same way of bowing, as if you're not quite sure whether you ought to." },
        { id = "h_alt_back", when = { alt = { days = 14 }, metBefore = true }, cooldown = "5d",
          text = "{alt} came back to see me not long ago, which hardly anybody does, and now you've come back too. I'm starting to think the two of you are taking turns, and I don't mind at all." },
        { id = "h_pt_anduin", tags = { "news" }, when = { party = true },
          text = "Are all of these your friends? I'm not allowed to go anywhere with friends, only with guards, and the guards are very kind, but they won't play anything." },
        { id = "h_default", text = "I'm the king, at least until my father comes home. Everyone's been very kind about it, though I don't think I'm very good at it yet." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "You're a paladin. Bolvar says paladins are the Light's hands. Do your hands feel any different?" },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "The priests at the Cathedral let me sit in on lessons sometimes. Don't tell Lady Prestor, though; she thinks it's a waste of a king's time." },
        { id = "h_hero", when = { minLevel = 40 },
          text = "The Highlord reads your name out at council sometimes. I always sit up straighter when he does." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "It's you! I asked the guards to tell me if you came, and they did, so I'm not supposed to run but I nearly did." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Are you one of Master Shaw's people? He never tells me who works for him, though I think he tells Bolvar." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Can you really make water out of nothing? The mages who come to court never show me anything, because Lady Prestor says it isn't dignified." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You smell a bit like the candles in the Cathedral crypt. I'm sorry, that was rude, and a king shouldn't say things like that." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Are you a shaman? I have read about shamans, but only orc ones, and the books were not very kind to them." },
      },
      again = { { id = "h_again", text = "Do you have another question? I like questions, and hardly anybody asks me any." } },
      choices = {
        { text = "Bolvar mentions me in council, Your Majesty?", next = "dd_anduin_e", when = { reputation = { faction = "Stormwind", min = "exalted" } } },

        { text = "You must miss your father terribly.", next = "father" },
        { text = "Being king must leave you little time for yourself.", next = "fun" },
        { text = "Would you like a prayer for your father?", next = "prayer", when = { class = "PRIEST" } },
        { text = "The Highlord seems a good man to have about.", next = "bolvar" },
        { text = "Lady Prestor seems a serious sort of woman.", next = "prestor" },
        { text = "Would you like a paladin's blessing?", next = "bless", when = { class = "PALADIN" } },
        { text = "What's it like being king?", next = "king" },
        { text = "I came all the way from Teldrassil, Your Majesty.", next = "teldrassil", when = { race = "NightElf" } },
        { text = "Ironforge sends its greetings, Your Majesty.", next = "ironforge", when = { race = "Dwarf" } },
        { text = "I'm from Gnomeregan, Your Majesty.", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "My people came down from the sky, Your Majesty.", next = "sky", when = { race = "Skyborne" } },
        { text = "Would you like to meet {pet}, Your Majesty?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Shall I show you a proper sword stance?", next = "sword", when = { class = "WARRIOR" } },
        { text = "Would you like to see me turn into a bear, Your Majesty?", next = "bear", when = { class = "DRUID" } },
        { text = "Do you know what SI:7 does, Your Majesty?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you like to see a little magic, Your Majesty?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you know what a warlock is, Your Majesty?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did your books say anything good about shamans, Your Majesty?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do you have friends of your own, Your Majesty?", next = "xpt_anduin", when = { party = true } },
        { text = "Who was this other visitor, Your Majesty?", next = "xalt_anduin", when = { alt = true } },
        { text = "Long live the king.", next = "END", fx = { affinity = 1 } },
      },
    },
    father = {
      big = true,
      lines = {
        { id = "f_default", text = "Every day. Everyone says he's coming home, and I say it too when the people are frightened, because it helps them. I think it helps me, too." },
      },
      choices = {
        { text = "He'd be proud of you.", next = "BACK", reply = "Do you think so? I hope so, because I'm trying very hard, and I want him to find everything in order when he comes back.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Keep saying it. Kings have to.", next = "BACK", reply = "I know. I'll keep saying it, even on the days when it's hard to, because that's what he'd do for me.", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    king = {
      lines = {
        { id = "k_default", text = "Mostly listening. The Highlord talks and Lady Prestor talks and the nobles talk, and I listen, and then I ask one question and they all go quiet." },
      },
      choices = {
        { text = "What do the nobles argue about most, Your Majesty?", next = "op_orcs" },
        { text = "That sounds like a good king.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd like to hear what you ask them.", next = "ask" },
      },
    },
    fun = {
      lines = { { id = "fu_default", text = "I read, and I watch the guards change, and I sneak into the Cathedral when Bolvar's at council. Don't tell anyone that last one; you're the second person who knows." } },
      choices = { { text = "Your secret's safe, Your Majesty.", next = "BACK", fx = { affinity = 2 } } },
    },
    prayer = {
      big = true,
      lines = { { id = "pr_default", text = "Would you? Only a short one, please, one I can remember at night when the Keep's quiet and I'm not supposed to be awake." } },
      choices = {
        { text = "\"Light, keep him safe, wherever he is, and bring him home.\"", next = "prayer_said",
          fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } },
          journal = { first = "Taught the boy king a prayer for his father. He said it back to me twice, to be sure he had it.",
                      third = "{name} taught King Anduin a prayer for his missing father." } },
        { text = "Prayers won't bring him home, Your Majesty, but the Regent's soldiers might.", next = "BACK", reply = "I know that, really, but Bolvar's soldiers have been looking for a long time. I'd still like a prayer, if you don't mind, just for the nights.", fx = { align = { light = -1 } } },
        { text = "The Light hears you without the words.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    prayer_said = {
      lines = { { id = "ps_default", text = "Light, keep him safe wherever he is, and bring him home. There, I'll say it every night, and thank you. Only don't tell Lady Prestor, because she says prayers are for people without armies." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bolvar = {
      lines = { { id = "bo_default", text = "Kind, and tired, though he thinks I don't notice he's tired. He reads me stories about my father when nobody's watching, and they're all about battles, but I like the ones where Father wins." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    prestor = {
      lines = { { id = "pe_default", text = "She's very clever, but she doesn't laugh much, so I try to make her laugh at dinner. It hasn't worked yet, though Bolvar laughs, so it's not all wasted." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "You can tell me what you really think of her.", tag = "Persuade", next = "prestor_true",
          check = { pass = { any = { { disposition = { min = 60 } }, { class = "PRIEST" }, { trait = "kind" } } } },
          fail = { next = "prestor_proper", fx = { affinity = -1 } } },
      },
    },
    bless = {
      lines = { { id = "bl_default", text = "Really? Here, in the throne room? Bolvar does it before council sometimes, so go on, and I'll stand very still. Kings are good at standing still." } },
      choices = {
        { text = "Light keep you, Your Majesty.", next = "BACK", reply = "Thank you! I didn't even wobble. I'll remember it tonight, when the Keep's quiet and I'm meant to be asleep.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "Kings make their own luck, Your Majesty. You don't need my blessing.", next = "BACK", reply = "Oh, all right, I suppose that makes sense. Bolvar says the Light helps those who help themselves, so I'll try to make some luck tomorrow.", fx = { align = { light = -1 } } },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "Usually, \"but what about the people who aren't here?\" They hate that one." } },
      choices = {
        { text = "Keep asking it.", next = "BACK", reply = "I will! Even if they groan, somebody has to ask it, and it may as well be the one with the crown on.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Learn when to stay quiet, Your Majesty, because courts punish awkward questions.", next = "BACK", reply = "Lady Prestor says that too, but I think if I stop asking, nobody will ask at all. I'll try to ask it more politely, though.", fx = { align = { honor = -1 } } },
      },
    },
    prestor_true = {
      big = true,
      lines = {
        { id = "pt_default", text = "Promise you won't tell? I don't like the way she looks at me when she thinks I'm not looking, as if I were a sum she's working out. It's silly, I know, because she's never been anything but kind." },
        { id = "pt_father", text = "And when anyone talks about Father coming home she goes very still and very polite, and the hair on my arms stands up. Bolvar says that's only because I'm tired, so it probably is." },
      },
      choices = {
        { text = "It isn't silly to trust your own feelings.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I won't tell anyone, Your Majesty.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    prestor_proper = {
      lines = {
        { id = "pp_default", text = "Lady Prestor is a valued advisor to the crown, and the crown is very grateful for her counsel. That's what I'm meant to say, and I'm saying it." },
        { id = "pp_default2", text = "I'm not supposed to talk about my advisors with people. Bolvar says it's the first rule of being king, and I've already broken lots of the others today." },
      },
      choices = {
        { text = "As you say, Your Majesty.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teldrassil = {
      lines = { { id = "te_default", text = "From the big tree? Lady Prestor says it's only a large tree, but the Highlord says it's taller than the Cathedral, and I like his answer better. Do you have to climb it to get home?" } },
      choices = {
        { text = "There's a portal at its foot, Your Majesty.", next = "teldrassil_old" },
        { text = "Every step of the way.", next = "teldrassil_old", fx = { trait = { witty = 1 } } },
      },
    },
    teldrassil_old = {
      lines = { { id = "to_default", text = "I knew it, because my tutor says your people lived here before there were any humans at all! Is it rude to ask how old you are? I think it might be, and I'm sorry if it is." } },
      choices = { { text = "It's not rude, Your Majesty.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    ironforge = {
      lines = { { id = "if_default", text = "Thank you, and please greet them back for me! Is King Magni really as loud as the Highlord says? He says you can hear him from the tram." } },
      choices = {
        { text = "Louder, Your Majesty.", next = "ironforge_tram" },
        { text = "A king should be heard.", next = "ironforge_tram", fx = { trait = { stern = 1 } } },
      },
    },
    ironforge_tram = {
      lines = { { id = "it_default", text = "Louder? Then I hope he visits again soon. Bolvar says the dwarves dug the tram so the Alliance could never be cut in two, and I'd love to ride it." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnomeregan = {
      lines = { { id = "gn_default", text = "The city that got lost? I'm sorry; that's what I heard someone call it, and it's not a very kingly thing to say. Do you miss it, the way I miss my father?" } },
      choices = {
        { text = "Every day, Your Majesty.", next = "gnomeregan_home" },
        { text = "We'll take it back. Gnomes always fix things.", next = "gnomeregan_home", fx = { trait = { brave = 1 } } },
      },
    },
    gnomeregan_home = {
      lines = { { id = "gh_default", text = "Then I hope you get it back, and I'll ask the Highlord about it at council, even if he says I'm too young. I'm allowed to ask; I'm the king." } },
      choices = { { text = "Thank you, Your Majesty.", next = "BACK", fx = { affinity = 2 } } },
    },
    sky = {
      lines = { { id = "sk_default", text = "From the sky! Is it true there's an island up there that floats? Bolvar told me, and then he said he wasn't sure, and he's usually sure about everything." } },
      choices = {
        { text = "It's true, Your Majesty. The winds held it up.", next = "sky_wind" },
        { text = "Some secrets a people keeps, Your Majesty.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    sky_wind = {
      lines = { { id = "sw_default", text = "I'd be frightened of falling off, I think. Maybe I wouldn't be, if I'd grown up there; you probably don't think about it at all." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK", fx = { affinity = 2 } } },
    },
    pet = {
      lines = { { id = "pt_yes", text = "Yes, please! Does {pet} bite? I won't mind if it does, only a little, and the guards won't see if you're quick about it." } },
      choices = {
        { text = "Only people who deserve it.", next = "pet_pat" },
        { text = "Gently, Your Majesty. Hold out your hand.", next = "pet_pat", fx = { trait = { kind = 1 } } },
      },
    },
    pet_pat = {
      lines = { { id = "ptp_warm", text = "It's warm! I wanted a dog, but Lady Prestor says a king can't have a dog in the throne room. I think a king should be allowed one dog." } },
      choices = {
        { text = "A king should have whatever dog he likes.", next = "BACK", reply = "I knew it! I'm going to tell Bolvar that a real adventurer agrees with me, and then perhaps he'll help me ask Lady Prestor again.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Lady Prestor has a point, Your Majesty.", next = "BACK", reply = "I suppose she does, and the throne room is very shiny, so a dog would probably slip. Still, I think a king should be allowed one dog.", fx = { align = { order = 1 } } },
      },
    },
    sword = {
      lines = { { id = "swd_default", text = "Would you? The Highlord only lets me hold a wooden one, and only in the courtyard. He says a king needs to know how swords work so he knows what he's asking of people." } },
      choices = {
        { text = "He's right. Feet apart, Your Majesty.", next = "sword_stance" },
        { text = "Better you never need one.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    sword_stance = {
      lines = { { id = "ss_default", text = "Like this? I'm going to practise it every morning, and then I'll show the Highlord, and he'll pretend to be surprised, the way he always does." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK", fx = { affinity = 2 } } },
    },
    bear = {
      lines = { { id = "bear_l", text = "A real bear, in the throne room? The Highlord will say no, so please do it quickly, before he looks up from his papers." } },
      choices = {
        { text = "A small one, Your Majesty. Just for a moment.", next = "bear2" },
        { text = "Perhaps somewhere with fewer guards.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    bear2 = {
      lines = { { id = "bear2_l", text = "That was amazing, and the guards all jumped, did you see? I'm going to remember that forever, even when I'm old and boring like the House of Nobles." } },
      choices = { { text = "Something else, Your Majesty.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    varian = {
      { id = "tp_varian", text = "My father went to Theramore to make peace and never got there, and nobody will tell me what happened to his ship. Bolvar says he'll come home, and I say it too, every night, so it stays true." },
      { id = "tp_varian2", when = { disposition = { min = 65 } }, text = "Sometimes I go into his study and sit in his chair, just to see the room the way he saw it. I'm not supposed to, so please don't tell Bolvar, though I think he knows." },
    },
    bolvar = { { id = "tp_bolvar", text = "Bolvar runs the kingdom until I'm old enough, and he's very patient with me, even when I ask too many questions. He used to be a paladin in Lordaeron, and he still prays like one, every morning before council." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor says I'm a good listener, and she sits beside me at council and tells me which lords are being silly. Everyone agrees with her, so she must be very wise, though she never laughs at anything." } },
    jaina = { { id = "tp_jaina", text = "Lady Jaina Proudmoore is a great sorceress, and she was a friend of my father's. She sent me a book about the stars once, and I've read it four times." } },
    thrall = { { id = "tp_thrall", text = "Thrall is the warchief of the orcs now, and Bolvar says he's not like the ones who burned Stormwind. I don't know how a whole people can change, but I'd like to ask him, if anyone ever let me." } },
    magni = { { id = "tp_magni", text = "King Magni came to visit when I was little and let me pull his beard, and he laughed so hard the windows shook. I'd like a beard like that, though Bolvar says I'll have to wait." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The statues in the Valley of Heroes are of people who saved the world, and I go and look at them when I'm feeling small. I wonder whether I'll have one someday, or whether you have to do something first." } },
    holy_light = { { id = "tp_holy_light", text = "Archbishop Benedictus teaches me about the Light every week, and he says it's in everyone, even people who are cross. I'm still looking for it in some of the council, but I'm trying." } },
    scourge = { { id = "tp_scourge", text = "Bolvar won't talk about the Scourge when I'm there, but I've heard the soldiers say the dead walk in Lordaeron. I had a nightmare about it once, and I didn't tell anybody but you." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I've never been to the Darkmoon Faire, because a king can't just go to a faire, apparently. I've heard there's a man who juggles fire, and I'd give anything to see it." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind is the high priestess of the night elves, and she's thousands of years old. I asked if she remembered the beginning of the world, and the ambassador went very quiet." } },
    knows = {
      { id = "tp_knows", text = "I hear a lot at council, because everyone forgets I'm there. Ask me about any of it and I'll tell you, as long as it isn't a secret." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You can ask me about anything here, and I'll tell you the parts Bolvar skips, too." },
    },
    westfall = { { id = "tp_westfall", text = "I asked about Westfall at council and everyone went quiet, so that's how I know it's bad." } },
    defias = { { id = "tp_defias", text = "Bolvar won't say much about them when I'm in the room, but I hear anyway. I'm small, not deaf." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian Rall showed me the Tome once, and I wasn't allowed to touch it, though I touched it a little." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid; I'm only ten. But I'll ask Bolvar for you, if you like." } },
  },
}
