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
    first = "The king of Stormwind is a boy who still forgets the proper words of welcome, and he tries very hard to remember them. He seemed far more curious about me than about being king.",
    third = "{name} was received by the boy king Anduin Wrynn, who rules until his father comes home and tries very hard at it.",
  },

  greetings = {
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
    xpt_anduin = {
      big = true,
      lines = { { id = "xpt_anduin_default", text = "Not really, because everyone wants something from me, even the ones who are nice about it. Lady Prestor says a king doesn't need friends, only loyal servants, but my father had Uncle Bolvar, so I don't think she's right." } },
      choices = {
        { text = "Lady Prestor is right. A king must keep himself apart.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Find friends anyway, Your Majesty. Some rules are meant to bend.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "One book said the orcs listened to the land before they listened to demons. I liked that part, but my tutor said I should not repeat it at court." } },
      choices = {
        { text = "Repeat it, Your Majesty. Listening is never a thing to be ashamed of.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your tutor is right. Some things are better kept quiet at court.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Bolvar says they keep the kingdom safe in ways that wouldn't look very nice if I saw them, and that's why he doesn't let me see them. I think a king ought to know, though, even if he's only ten." } },
      choices = {
        { text = "A king should know what's done in his name, Your Majesty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some things are better left in the dark, Your Majesty.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Yes, please, only a small one, so the guards don't come running! Bolvar says magic is like a sword, because it's only as good as the person holding it, and I've decided that's true of kings as well." } },
      choices = {
        { text = "Power is only good when it serves others, Your Majesty.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is its own reward, Your Majesty, so use it freely.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Archbishop says warlocks call on demons, the same kind the orcs used in the war, and that it's terribly dangerous. You don't look like a bad person, though, so I suppose it depends on why you do it." } },
      choices = {
        { text = "It does. I bind them so they can't harm anyone else.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's power, Your Majesty, and I take it where I find it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_anduin", tags = { "news" }, when = { party = true },
          text = "Are all of these your friends? I'm not allowed to go anywhere with friends, only with guards, and the guards are very kind, but they won't play anything." },
        { id = "h_default", text = "I'm the king, at least until my father comes home. Everyone's been very kind about it, though I don't think I'm very good at it yet." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "You're a paladin. Bolvar says paladins are the Light's hands. Do your hands feel any different?" },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "The priests at the Cathedral let me sit in on lessons sometimes. Don't tell Lady Prestor. She thinks it's a waste of a king's time." },
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
        { text = "Do you miss your father?", next = "father" },
        { text = "What do you do when you're not being king?", next = "fun" },
        { text = "Would you like a prayer for your father?", next = "prayer", when = { class = "PRIEST" } },
        { text = "What's the Highlord like?", next = "bolvar" },
        { text = "Do you like Lady Prestor?", next = "prestor" },
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
        { text = "Long live the king.", next = "END", fx = { affinity = 1 } },
      },
    },
    father = {
      big = true,
      lines = {
        { id = "f_default", text = "Every day. Everyone says he's coming home, and I say it too when the people are frightened, because it helps them. I think it helps me, too." },
      },
      choices = {
        { text = "He'd be proud of you.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Keep saying it. Kings have to.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    king = {
      lines = {
        { id = "k_default", text = "Mostly listening. The Highlord talks, Lady Prestor talks, the nobles talk. I listen. Then I ask a question and they all go quiet." },
      },
      choices = {
        { text = "That sounds like a good king.", next = "BACK", fx = { affinity = 1 } },
        { text = "What do you ask?", next = "ask" },
      },
    },
    fun = {
      lines = { { id = "fu_default", text = "I read, and I watch the guards change, and I sneak into the Cathedral when Bolvar's at council. Don't tell anyone that last one; you're the second person who knows." } },
      choices = { { text = "Your secret's safe, Your Majesty.", next = "BACK", fx = { affinity = 2 } } },
    },
    prayer = {
      big = true,
      lines = { { id = "pr_default", text = "Would you? A short one. One I can remember at night, when the Keep's quiet and I'm not supposed to be awake." } },
      choices = {
        { text = "\"Light, keep him safe, wherever he is, and bring him home.\"", next = "prayer_said",
          fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } },
          journal = { first = "Taught the boy king a prayer for his father. He said it back to me twice, to be sure he had it.",
                      third = "{name} taught King Anduin a prayer for his missing father." } },
        { text = "Prayers won't bring him home, Your Majesty, but the Regent's soldiers might.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Light keep you, Your Majesty.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "Kings make their own luck, Your Majesty. You don't need my blessing.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "Usually, \"but what about the people who aren't here?\" They hate that one." } },
      choices = {
        { text = "Keep asking it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Learn when to stay quiet, Your Majesty, because courts punish awkward questions.", next = "BACK", fx = { align = { honor = -1 } } },
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
      lines = { { id = "te_default", text = "From the big tree? Lady Prestor says it's only a large tree, but the Highlord says it's taller than the Cathedral, and I'd rather believe him. Do you have to climb it to get home?" } },
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
      lines = { { id = "it_default", text = "I've only ridden the tram once, and I wasn't scared, though I held the rail the whole way. Bolvar says the dwarves dug it so the Alliance could never be cut in two." } },
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
        { text = "A king should have whatever dog he likes.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Lady Prestor has a point, Your Majesty.", next = "BACK", fx = { align = { order = 1 } } },
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
    westfall = { { id = "tp_westfall", text = "I asked about Westfall at council. Everyone went quiet. That's how I know it's bad." } },
    defias = { { id = "tp_defias", text = "Bolvar won't say much about them when I'm in the room, but I hear anyway. I'm small, not deaf." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian Rall showed it to me once. I wasn't allowed to touch it. I touched it a little." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid; I'm only ten. But I'll ask Bolvar for you, if you like." } },
  },
}
