-- Darrowshire's ghost child, and the people of Light's Hope who never got a word before. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "carlin", id = TODO_NPC("Carlin Redpath"), name = "Carlin Redpath",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "weary" }, values = { "loyal", "kind" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Saw the Cult of the Damned's dark-callers bring down Darrowshire and his brother Joseph." },
  notices = { "class", "lock_armor" },
  impression = {
    first = "He has never quite forgiven himself for surviving Darrowshire.",
    third = "{name} met Carlin Redpath at Light's Hope Chapel, a survivor of the fall of Darrowshire.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I watched men with that same darkness on them open Darrowshire to the dead. I can't help how I look at you, so don't ask me to." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Joseph died because the cult made deals with things in the dark. Speak, if you must, but stay over there." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've done right by Darrowshire, and I owe you for that, whatever else you are. I'll still say a prayer when you go, though, and you needn't ask what for." },
    { id = "g_chapel", text = "Light keep you, friend. Sit a moment, if you're not in a hurry; few people stop to talk to an old man about an old battle." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. I'd hoped you would, though I couldn't say why." },
    { id = "g_xrefugee", when = { origin = "human_lordaeron_refugee" }, text = "You came out of Lordaeron as a child, didn't you? Then you got further than most of Darrowshire did, and I'm glad of it, so sit and let me tell you about the town your family never got to see." },
    { id = "g_away", when = { away = 14 }, text = "You came back after {away} away, and I'd hoped you would. Sit with me, for an old man has few visitors and fewer who return." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear you gave someone at the chapel a kind word, and they've been smiling about it since. My Pamela would have liked you, I think." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Joseph wanted the Light's training once, and our father wanted him on the farm, and the farm won. I've wondered since how that day might have gone otherwise." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That dark ward on your skin, the cultists at Darrowshire wore wards like it while they raised our dead. I know you're not one of them, but my hand went to my sword before my head could stop it." },
  },

  start = "hello",
  nodes = {
    xcl_strat = {
      big = true,
      lines = { { id = "xcl_strat_default", text = "Then the city whose dead marched on Darrowshire is quieter tonight, and I'd like to think Joseph felt it, wherever he is. The Scourge that came at us that day had walked out of the north, and Stratholme was the heart of it, so this is as close as I'll ever get to an answer." } },
      choices = {
        { text = "Joseph's courage was never wasted, and this proves it.", next = "BACK", reply = "It never was, and I'll tell him so, if I ever get the chance. Thank you, {class}.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "No victory brings anyone back, Carlin. Don't pretend it does.", next = "BACK", reply = "No, it doesn't, and I know it. But I'll take a quieter night all the same, and maybe a whole one.", fx = { align = { light = -1 } } },
        { text = "Did Joseph ever speak of Stratholme?", next = "xcl_strat2" },
      },
    },
    xcl_strat2 = {
      lines = { { id = "xcl_strat2_default", text = "Only once, when we were young and Father took us to a harvest fair there, and Joseph spent all his coin on a wooden sword. He kept it on the wall at home until the day he took down a real one, and I suppose it burned with the house." } },
      choices = {
        { text = "He sounds like a good brother.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Whether the spirits of Darrowshire are at peace, I think, because that's what he'd want to know above everything else. He held that town to the last, and I lived, so if you ever hear anything from the earth there, I'd be grateful if you told me, even if it's hard." } },
      choices = {
        { text = "The dead deserve peace. I'll help them find it.", next = "BACK", reply = "Thank you. If you find it for them, I think I'll find a little for myself.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are past helping, Carlin. Look to the living.", next = "BACK", reply = "Perhaps, but I can't stop hoping, and Joseph never could either.", fx = { align = { light = -1 } } },
        { text = "Something else, Carlin.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd like to think so, after what the Scourge made of Darrowshire. If the Light can find you after death, then perhaps it can find him too, and I'd sleep better believing that than believing he's lost for good." } },
      choices = {
        { text = "It found me. It can find him too.", next = "BACK", reply = "Then I'll believe it too, and sleep a little better tonight. Joseph always said I worried for the both of us.", fx = { align = { light = 1 } } },
        { text = "The Light doesn't always come back. Don't count on it.", next = "BACK", reply = "I know, and I've tried not to. But I'd rather hope than not, {class}.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "He was a farmer who could fight, which is the hardest kind of soldier to break. When the Scourge came out of the north he didn't wait for help from anyone; he put every man who could hold a pitchfork into a line across the square, and held it longer than any of us had a right to." } },
      choices = {
        { text = "Joseph's stand saved lives, Carlin. Hold on to that.", next = "BACK", reply = "I try, and some nights I manage it. Thank you for saying so.", fx = { align = { light = 1 } } },
        { text = "He should have run with the rest. He might be alive.", next = "BACK", reply = "He might, and he'd have hated every day of it. Joseph never ran from anything.", fx = { align = { light = -1 } } },
        { text = "Something else, Carlin.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They knew, and we shut them in the barn to quiet them, because nobody wanted to believe a dog over his own eyes. I've listened to every beast's warning since, and I'd tell any hunter to trust their animal before they trust a sentry." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Watch how {pet} carries its ears near the old road, {class}. If it goes still and stares north, don't wait to see what it's staring at." },
      },
      choices = {
        { text = "It wasn't your fault, Carlin. Nobody listens to dogs.", next = "BACK", reply = "Nobody did, and that's the worst of it. Those hounds howled themselves hoarse in the barn while we told each other it was nothing. Thank you, all the same.", fx = { align = { light = 1 } } },
        { text = "Someone should have listened. Darrowshire paid for that.", next = "BACK", reply = "It did, and I've paid my share every night since. Listen to your beast, {class}.", fx = { align = { light = -1 } } },
        { text = "Something else, Carlin.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He was never one of them, but he honoured them to the end, and he stood his ground at Darrowshire when the order could send him no help. I've heard men say the Silver Hand failed Lordaeron, but its spirit didn't fail at Darrowshire, because Joseph was there." } },
      choices = {
        { text = "Then his honour is still the order's honour.", next = "BACK", reply = "I like to think so. He'd have been proud to hear it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "One brave man can't redeem an order that failed.", next = "BACK", reply = "Perhaps not, but he redeemed himself, and that's enough for me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No, and I think of it more than I ought to, because the dead there still walk the lanes every night as if the battle never ended. If the Light has any mercy left for Darrowshire, I pray it reaches those who stayed with the wounded first." } },
      choices = {
        { text = "It will. I'll take the Light to Darrowshire myself.", next = "BACK", reply = "Thank you. Take it to the lanes, and to the square, where he stood.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mercy comes after the Scourge is broken, not before.", next = "BACK", reply = "Perhaps it does, but I'd like them to have it soon. They've waited long enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I hope so, though I'm not sure I'd want to eat it. Joseph used to say the soil there was the best in the east, and it's hard to think of it full of ghosts and bones instead of barley." } },
      choices = {
        { text = "Lay its dead to rest, and it will grow again.", next = "BACK", reply = "I hope so. I'd like to see barley in those fields again before I'm old, the way it grew when Joseph and I were boys.", fx = { align = { light = 1 } } },
        { text = "Burn it to the ground and start over.", next = "BACK", reply = "Burn it? I couldn't watch, but I'd not stop you if it came to that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "He was a fair man, Joseph, and he'd judge you by what you did, not what you were. He used to say the orcs in the internment camps deserved a better peace than we gave them, and I never understood him until I saw the Dawn take your people and mine under one banner." } },
      choices = {
        { text = "Joseph sounds a wise man. I'd have liked knowing him.", next = "BACK", reply = "He was, and you'd have liked him, I think. He'd have liked you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Peace with the Horde is a soldier's daydream.", next = "BACK", reply = "Maybe it is, but Joseph dreamed it all the same. I'll not mock him for it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Carlin.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They came behind the Scourge, raising our dead as fast as we fell, so that every man Joseph lost came back to fight against him. I still see their robes when I close my eyes, so whatever it is you practise, I'd be glad to see it turned the other way for once." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They came behind the Scourge, raising our dead as fast as we fell, and I still see their robes when I close my eyes. Seeing your demon by the door brings it all back, so if you've honest work for the Dawn, turn that creature on the Cult and let dark magic go the other way for once." },
      },
      choices = {
        { text = "I'll turn what I know on the Cult, Carlin. I promise.", next = "BACK", reply = "Thank you. I'll hold you to that, and so would Joseph, if he were here to.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. The Cult simply used it better.", next = "BACK", reply = "They used it to raise my brother against his own men. I'd want you to use it better.", fx = { align = { light = -1 } } },
        { text = "Something else, Carlin.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! My brother Joseph fought beside dwarves in the Second War, {class}, and he'd have had a hundred questions for you, for he never could leave a puzzle alone." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. Darrowshire had good fields once, and you might know whether anything could grow there again, now that the dead walk its lanes every night." },
        { id = "h_default", key = true,
          text = "I'm Carlin Redpath, and I was at Darrowshire when the Scourge came. My brother Joseph led the defense, and I lived and he didn't, and I've spent every day since trying to make that mean something." },
        { id = "h_villains", tags = { "news" }, when = { questActive = TODO_QUEST("Villains of Darrowshire") },
          text = "The villains of that day still have relics lying about the Plaguelands. Bring them to me, and I'll see they're never honored by anyone again." },
        { id = "h_cl_strat", tags = { "news" }, when = { cleared = "Stratholme" },
          text = "They say Stratholme's masters are dead, and I sat up most of the night thinking of Joseph. He'd have wanted to see that city brought low, and since he can't, I'd like to hear it from someone who did." },
        { id = "h_heroes", when = { questActive = TODO_QUEST("Heroes of Darrowshire") },
          text = "And the heroes, too; their things are scattered and forgotten, and they shouldn't be. Joseph's among them, of course, and so is Davil Lightfire, who came to help us." },
        { id = "h_pamela", when = { questDone = TODO_QUEST("Uncle Carlin") },
          text = "You found Pamela, or what's left of her, and she remembered me. I don't know whether to thank you or weep, so I expect I'll do both." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Darrowshire had one, {class}, an old fellow who did the fireworks at the harvest fair, and he burned more ghouls than any soldier the night the town fell." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You move like the scouts Joseph sent out the night Darrowshire fell, {class}, the ones who came back too late to tell us how many there were." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. There were good priests in Darrowshire once, and they stayed with the wounded when the Scourge broke through the gate, and none of them came out again." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. Joseph would have liked you, I think, because he always said the Silver Hand was the best of Lordaeron, even after it started to fail." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Joseph would have liked you, {class}, because he always said a town is only as safe as the last person still standing in its square." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. We had a fellow in Darrowshire who kept hounds for the harvest-fair hunts, {class}, and the night the town fell, those hounds howled for an hour before any of us saw a ghoul." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman. My brother fought orcs in the Second War, {class}, and he'd have been surprised to see one of you at Light's Hope, but not unhappy, I think." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I know what you are, and I saw your sort at Darrowshire, calling up horrors while my brother held the square. The Dawn says I must speak with you, so I will." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You came back, and you've done more for Darrowshire's ghosts than I ever managed. I still don't like what you carry, but I'm glad of you." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "I'll not turn you away, for the Dawn doesn't. But you've a look about you I saw on the Cult of the Damned's people at Darrowshire, and you'll forgive me if it takes a moment to remember you're not one of them." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin who died and came back with the Light still in hand. Joseph would have given anything to see that, because he always said the Light never leaves those who stand their ground." },
      },
      choices = {
        { text = "Will anything grow in Darrowshire again?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I've met Marlene on Sorrow Hill. She asks after you.", next = "marlene", when = { questDone = TODO_QUEST("Little Pamela") } },
        { text = "Darrowshire seems to weigh on you.", next = "battle" },
        { text = "Tell me about Joseph.", next = "joseph" },
        { text = "You must have other family somewhere.", next = "family" },
        { text = "Is that why you joined the Argent Dawn, Carlin?", next = "xmage", when = { class = "MAGE" } },
        { text = "What would you have done with more warning?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Were Darrowshire's priests ever laid to rest, Carlin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did Joseph stay loyal to the Silver Hand until the end?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Joseph must have been a fine fighter, Carlin.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "So the hounds knew the Scourge was coming before you did.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What would Joseph have made of the Horde today, Carlin?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Were the Cult's necromancers at Darrowshire, Carlin?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you think the Light could find Joseph too, Carlin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "What would Joseph have asked me, Carlin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been through Stratholme, Carlin. Its masters are dead.", next = "xcl_strat", when = { cleared = "Stratholme" } },
        { text = "I'll leave you to your memories.", next = "END" },
      },
      again = { { id = "h_again", text = "What else would you hear? I've little but stories now, but I've plenty of those." } },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Got the children out, for a start, and sent for help before the Scourge closed the road. Joseph would have fought anyway, he always did, but an hour's warning might have saved Pamela, and I think about that more than I should." } },
      choices = {
        { text = "It wasn't your fault. You couldn't have known.", next = "BACK", reply = "Perhaps not, but I think about it every night. Thank you, though.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Regret won't help. Make the Scourge pay instead.", next = "BACK", reply = "I mean to, and I'd be glad of your help. Make them pay for Pamela.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Partly, for I wanted to stand with people who'd fight back the way he did. I'm no mage and no paladin either, but the Dawn doesn't care, so long as you're still standing when the Scourge comes." } },
      choices = {
        { text = "Standing is enough. You honour them by fighting.", next = "BACK", reply = "Thank you. Some days that's all that keeps me on my feet.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Better to live quietly and let the dead rest.", next = "BACK", reply = "Perhaps I should, but I couldn't live quietly while he's out there. Not yet.", fx = { align = { honor = -1 } } },
        { text = "Something else, Carlin.", next = "BACK" },
      },
    },
    battle = {
      lines = {
        { id = "ba_default", text = "The Scourge came out of the north, more of them than any of us had imagined, and Joseph held the town square while the women and children hid. Then something worse than the rest came, and Joseph fell, and when he rose again he wasn't Joseph." },
      },
      choices = { { text = "Who led the Scourge that day?", next = "battle_villain" } },
    },
    battle_villain = {
      lines = {
        { id = "bv_default", text = "The thing that wore my brother, they call Redpath the Corrupted now. With it came Horgus the Ravager and Marduke the Black, and their relics still lie about the Plaguelands, if you've the stomach to hunt them." },
      },
      choices = {
        { text = "Vengeance won't bring Joseph back, Carlin.", next = "BACK", reply = "No, but it'll quiet the dreams, and that's something. I'd be grateful.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "They'll answer for it. I'll see to that.", next = "BACK", reply = "Thank you, {class}. Bring me something of theirs, and I'll know it's done.", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    joseph = {
      lines = {
        { id = "jo_default", text = "Big, loud, and kind, the sort of man who carried other people's children on his shoulders at the harvest fair. He'd have laughed at a monument, but there is one, among the graves in Darrowshire." },
      },
      choices = { { text = "Something else, Carlin.", next = "BACK", fx = { learn = "darrowshire" } } },
    },
    family = {
      lines = {
        { id = "fa_default", text = "My sister Marlene, on Sorrow Hill in the west, if she still lives, and Joseph's little girl Pamela, who was hidden when the battle came. I never found her, and I've stopped letting myself hope." },
      },
      choices = { { text = "I'll look for Pamela.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    marlene = {
      lines = { { id = "ml_default", text = "Marlene, alive! Light be thanked, I'd feared the worst for her too. Tell her I'll walk west when the roads allow, and that I'm sorry it's taken me so long." } },
      choices = { { text = "I'll tell her.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    darrowshire = { { id = "tp_darrowshire", text = "My home, and my brother's grave, and the worst day of my life." } },
    scourge = { { id = "tp_scourge", text = "The Scourge came to Darrowshire, and my brother Joseph rode out to meet them. I lived, and he didn't, and I've never understood why it went that way." } },
    lordaeron = { { id = "tp_lordaeron", text = "Darrowshire was a good village in a good kingdom, and both are gone now. I'm still here, and I wish I could say why." } },
    holy_light = { { id = "tp_holy_light", text = "I prayed for Joseph every night after Darrowshire. I don't know if it helped him, but it helped me a little." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend; my head's full of one day, and there's not much room left." } },
  },
}

P:NPC {
  key = "pamela", id = TODO_NPC("Pamela Redpath"), name = "Pamela Redpath",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "darrowshire" }, temper = { "childlike" }, values = { "kind", "lonely" },
  notices = { "race", "lock_steed" },
  impression = {
    first = "She doesn't seem to know she's dead, or doesn't mind.",
    third = "{name} met the ghost of Pamela Redpath in the ruins of Darrowshire, where she still waits for her family.",
  },

  greetings = {
    { id = "g_ruins", text = "Hello! Are you here to play? Nobody plays with me anymore, except the pale people, and they don't play nicely." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You've got a beard like Papa's friend from the mountains! He used to let me pull it, but only a little." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Your horse is on fire! Is it hurting? It doesn't look like it's hurting, and its hooves are making the grass all black, and I think it's the most beautiful thing I ever saw." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "He said the dwarves helped him in the big war a long time ago, and they sang very loud songs and never got tired. I tried singing loud like that while I was hiding, but Auntie Marlene said hush, so I hushed, and then everything went quiet." } },
      choices = {
        { text = "You were very brave, Pamela. Your papa would be proud.", next = "BACK", reply = "Do you think so? I hope so, because I was very, very quiet.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hiding was a mistake, Pamela. You should have run.", next = "BACK", reply = "But Auntie Marlene said hide, and I always do what Auntie says. Was I bad?", fx = { align = { light = -1 } } },
        { text = "Something else, Pamela.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Papa said the knights of the Silver Hand were never afraid of the dark, and you're not either, I can tell. Are you here to take me to Papa? Because I'd go, I think, if a glowing knight was the one who came for me." } },
      choices = {
        { text = "The Light will bring you home to your papa, Pamela.", next = "BACK", reply = "Will it? Oh, I'd like that, I'd like that very much. I'll hold your hand the whole way.", fx = { align = { light = 1 } } },
        { text = "I'm not a knight like the ones in the stories.", next = "BACK", reply = "That's all right, you're nice anyway. Papa says nice is the most important thing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Lots and lots, all in the square with Papa, and they were very loud and then they were very quiet. Auntie Marlene said I mustn't look, so I didn't look, and I'm still being good about it." } },
      choices = {
        { text = "Your papa's soldiers fought hard, Pamela, but they're gone now.", next = "BACK", reply = "Gone? Gone where? Papa's not gone, he's just busy, he'll be back soon.", fx = { align = { honor = 1 } } },
        { text = "Keep not looking, Pamela. Some things are better not known.", next = "BACK", reply = "I won't look, I promise. I'm very good at not looking.", fx = { align = { honor = -1 } } },
        { text = "Can I ask something else?", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "She ran into the woods behind the house when everyone started shouting, and she didn't come back for supper. If you find her, she's grey with one white foot, and you mustn't be cross with her, because she was frightened." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "She ran off when everyone started shouting, and she was grey with one white foot. Is that {pet}? Oh, it's gone all funny and backed away, so I'll just wave instead, hello, {pet}!" },
      },
      choices = {
        { text = "I'll look for her, Pamela, but she may be gone.", next = "BACK", reply = "Maybe she's just hiding, like me. Hiders are hard to find.", fx = { align = { honor = 1 } } },
        { text = "I'm sure she's hiding somewhere safe, waiting for you.", next = "BACK", reply = "I knew it! She's the best hider after me. Tell her I'm waiting.", fx = { align = { honor = -1 } } },
        { text = "Can I ask something else?", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "In the cupboard under the stairs, with my dolly and my hairpin, and I didn't make a single sound, not even when they knocked everything over. Papa said I was the best hider in all of Darrowshire, and I think he was right, because even he hasn't found me." } },
      choices = {
        { text = "You were very brave, Pamela. I'll find your papa.", next = "BACK", reply = "Will you? Thank you! I'll wait right here with my dolly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hiding won't bring him back, Pamela.", next = "BACK", reply = "But I'm good at hiding, and Papa always finds me. He always does.", fx = { align = { light = -1 } } },
        { text = "Something else, Pamela.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "He fought them a long time ago, before I was born, and he said they were very big and very fierce, but some of them were sad, too. He said a sad orc and a sad human aren't so different, which I didn't understand, but I think I do now." } },
      choices = {
        { text = "Your papa was wise, Pamela. He was right.", next = "BACK", reply = "He was very wise. He knew lots of things, more than anyone.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your papa was being kind. Orcs and humans are different.", next = "BACK", reply = "Oh. Well, Papa said it, so I still think he was right.", fx = { align = { honor = -1 } } },
        { text = "Something else, Pamela.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Yes, please, the pretty kind, not the burny kind, because the pale people had burny kind and it was horrid. Auntie Marlene said that one day I could go to Dalaran and learn to make my own, but now I don't think I'll go anywhere at all." } },
      choices = {
        { text = "Here, Pamela. The pretty kind, just for you.", next = "BACK", reply = "Ooh, it's so pretty! Thank you, thank you, that's the nicest thing.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "No time for sparkles. There's work to do.", next = "BACK", reply = "Oh. That's all right, I suppose. Maybe later?", fx = { align = { light = -1 } } },
        { text = "Something else, Pamela.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A bit, but not as much as the pale people, because they were big and smelled bad and they broke my dolly. If your monster's nice to me, I'll be nice to it, and maybe it can help find my dolly's pieces, because it looks very good at finding things." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A bit, because it's looking right at me and it never blinks, but the pale people were bigger and smelled worse and they broke my dolly. Does {pet} like dolls? If it's nice to me, I'll be nice to it, and maybe it can help find my dolly's pieces." },
      },
      choices = {
        { text = "It'll be nice to you, Pamela. I promise.", next = "BACK", reply = "Then I'll be nice to it too. Can it help find my dolly's pieces?", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It doesn't do nice, Pamela. Stay back from it.", next = "BACK", reply = "Oh. I'll stay over here, then. It looks a bit grumpy.", fx = { align = { light = -1 } } },
        { text = "Something else, Pamela.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Whiskers, because she had the longest whiskers in Darrowshire, and Papa said she was the best mouser on our street. If you turn into a cat, maybe she'll hear you and come home, and then I wouldn't be so lonely waiting." } },
      choices = {
        { text = "I'll look for Whiskers, Pamela, and for your papa.", next = "BACK", reply = "Thank you! Tell them both I'm waiting, and tell Whiskers I'm not cross.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whiskers is gone, Pamela. You must let her go.", next = "BACK", reply = "But she'll come home, she always does. I'll leave the door open for her.", fx = { align = { light = -1 } } },
        { text = "Something else, Pamela.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Oh, you're a dwarf, and you've got sparkles on your hands! Papa said dwarves were all hammers and loud songs, but he never said they could make sparkles, and you smell like rain." },
        { id = "h_default", key = true,
          text = "I'm Pamela, and this is my house, only it's broken now. Papa told me to hide and wait, so I did, and I'm still waiting, but he hasn't come." },
        { id = "h_doll", tags = { "news" }, when = { questActive = TODO_QUEST("Pamela's Doll") },
          text = "Did you find my dolly? The pale people tore her into pieces and threw them all around the houses, and I can't find her head anywhere." },
        { id = "h_marlene", when = { questActive = TODO_QUEST("Auntie Marlene") },
          text = "Auntie Marlene lives on the big hill in the west! Please tell her I've been good, and that I still have the hairpin she gave me." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Are you a knight? You've got a big sword like Papa's soldiers had, and Papa said soldiers always come back, so maybe you've come back too." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "Are you a hunter? Papa said hunters can follow anything, even rabbits, and I had a kitten once that ran off when the pale people came." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You're good at hiding! I'm good at hiding too, because Papa taught me, and I've been hiding for ever so long, only nobody's come to find me yet." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "Oh, you're from the Horde! Papa said the Horde was scary, but you don't look scary, you look nice, and you smell like rain." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Can you do magic? Real magic? Auntie Marlene said mages could make sparkles come out of their fingers, and I always wanted to see." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Is that a little monster? It's got horns, but it's ever so small, and I don't think it'll hurt me, will it? Will it?" },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Can you really turn into animals? I had a kitten once, and she ran away when the pale people came, and I miss her ever so much." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "You're dead too, aren't you? But you're glowing, like the knights in Papa's stories, and I didn't know dead people could glow." },
      },
      choices = {
        { text = "Would you like me to hold your hand a while?", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Where is your papa, Pamela?", next = "papa" },
        { text = "You keep talking about the pale people.", next = "pale" },
        { text = "Do you have any family left?", next = "family" },
        { text = "Your papa must have had many soldiers, Pamela.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You seem to be missing your kitten, Pamela.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Where did you hide when the pale people came, Pamela?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Did your papa tell you stories about the Horde, Pamela?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Would you like to see some sparkles, Pamela?", next = "xmage", when = { class = "MAGE" } },
        { text = "You look frightened of my little friend, Pamela.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What was your kitten's name, Pamela?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you know any stories about knights, Pamela?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Did your papa tell you stories about dwarves, Pamela?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I have to go now, Pamela.", next = "END" },
      },
      again = { { id = "h_again", text = "Do you want to hear something else? I know lots of things, mostly about dollies." } },
    },
    papa = {
      lines = {
        { id = "pa_default", text = "He went to fight the bad things in the town square, with a big sword and a big shout. He said he'd come back for me, and Papa always keeps his promises, so he's just late, I think." },
      },
      choices = { { text = "What will you do when he comes?", next = "papa_when" } },
    },
    papa_when = {
      lines = {
        { id = "pw_default", text = "Show him my dolly, all fixed! And then we'll go to Auntie Marlene's for supper, like we used to, and I'll chase the chickens in her yard." },
      },
      choices = {
        { text = "Your papa would be very proud of you.", next = "BACK", reply = "Do you think so? I'll show him my dolly first thing, all fixed.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Pamela, I have to tell you the truth about your papa.", next = "BACK", reply = "The truth? Is it a sad truth? Papa doesn't like me hearing sad truths.", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    pale = {
      lines = {
        { id = "pl_default", text = "The ones who walk funny and smell bad. They come through the town at night, and I hide under the floor where they can't see me, and I'm very, very quiet." },
      },
      choices = { { text = "Keep hiding, Pamela. You're very brave.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    family = {
      lines = {
        { id = "fa_default", text = "Auntie Marlene, and Uncle Carlin who tells silly jokes, but I don't know where they went. Could you find them for me? Tell them Pamela says hello." },
      },
      choices = { { text = "I'll try, Pamela.", next = "BACK", fx = { learn = "darrowshire" } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Your hand's warm, like Papa's. That's nice, but it makes me sleepy, and if I sleep I might miss him coming home." } },
      choices = { { text = "Then I'll let you keep watch.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    scourge = { { id = "tp_scourge", text = "The pale people walk past sometimes, but they don't stop to play. I don't like them very much." } },
    holy_light = { { id = "tp_holy_light", text = "Auntie Marlene says the Light watches over good little girls. I'm a good little girl, mostly." } },
    _none = { { id = "tp_none", text = "I don't know that one. Do you know any songs instead?" } },
  },
}

P:NPC {
  key = "smokey", id = TODO_NPC("Smokey LaRue"), name = "Smokey LaRue",
  bible = "bibles/roads.md", role = "questgiver", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "gruff" }, values = { "practical", "stubborn" },
  notices = { "race", "lock_taint" },
  impression = {
    first = "He wants Scourge parts and doesn't care how you feel about it.",
    third = "{name} met Smokey LaRue, an ill-tempered dwarf working for the Argent Dawn at Light's Hope Chapel.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's ye! Come in through the smoke, friend, and tell me ye've brought me somethin' good from the Scourge." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again. State yer business an' be quick, or I'll blow the smoke right in yer face." },
    { id = "g_smoke", text = "Aye? Speak up, or get out of me smoke." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' the smoke's been just as thick without ye. Speak up, then." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "Heard ye put the wind up somebody at the chapel. Do that out in the fields, not in here, or ye'll answer tae me." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, at last! Somebody here who knows a proper pipe from a burnin' rag." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "Ye smell o' fel, an' don't argue wi' me, for I've a nose for foul things an' that's the worst o' them. Scourge bits at least tell ye what they'll cost up front." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Trust's a strong word fer anyone in the Plaguelands, but the Dawn's no' fussy, an' neither am I. Back in Ironforge they'd call ye an abomination an' a miracle in the same breath, an' then argue aboot which till the ale ran dry." } },
      choices = {
        { text = "The Dawn has it right. Judge me by my deeds.", next = "BACK", reply = "That's the way o' it, an' a fine answer. Ye'll find the Dawn fair, if ye're fair wi' it.", fx = { align = { honor = 1 } } },
        { text = "Let Ironforge argue. Their opinion means nothing to me.", next = "BACK", reply = "Ha! Good on ye, an' I'll no' tell them ye said so. Ironforge can argue on its own.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Rub it intae yer boots an' straps an' the plague slides off like rain off a slate roof, or so I tell the Dawn, an' they've no' complained yet. It smells like a ghoul's armpit, mind, but a warrior who smells bad lives longer than one who smells sweet." } },
      choices = {
        { text = "If it works, I'll wear the stink of the dead gladly.", next = "BACK", reply = "That's the spirit! Hold yer nose an' keep yer feet. Ye'll thank me in a week.", fx = { align = { light = -1 } } },
        { text = "Smearing Scourge remains on my gear feels like desecration.", next = "BACK", reply = "Desecration, is it? The plague doesnae care, an' neither do yer feet. Suit yerself.", fx = { align = { light = 1 } } },
        { text = "Something else, Smokey.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, when I can get them, for a plaguebat's wing has more sickness in it than a whole ghoul. Ye cannae make a cure without knowin' the disease, an' the beasts carry the disease the way a bucket carries water." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from my crates, {class}, for I've a jar o' plaguebat livers in there that'd send a hound mad wi' wantin' it, an' madder still once it had it." },
      },
      choices = {
        { text = "I'll bring what you need, and tell the Dawn what it's for.", next = "BACK", reply = "Grand, an' the Dawn'll be glad tae know. I've nothin' tae hide.", fx = { align = { honor = 1 } } },
        { text = "I'll fetch your bits, and nobody need know where they went.", next = "BACK", reply = "Quietly, eh? Ye've a rogue's sense o' things. Fair enough, as long as they're fresh.", fx = { align = { honor = -1 } } },
        { text = "Something else, Smokey.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Approve? They hold their noses an' sign the requisitions, which is as close as a knight comes tae approvin' o' anythin' that smells. Honour's a fine thing, but it doesnae keep a soldier's feet from rottin' off in a plague bog." } },
      choices = {
        { text = "Honour and good sense can share a bench, Smokey.", next = "BACK", reply = "Aye, they can, an' they do, so long as ye dinnae mind the smell. Sit doon.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Results matter more than honour out here.", next = "BACK", reply = "That's my motto, near enough. The knights can keep their honour an' I'll keep their feet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Desecration, is it? Those parts were already desecrated when the Scourge stitched 'em together, an' I'm only givin' 'em one last use that keeps the plague off a soldier's boots." } },
      choices = {
        { text = "The dead deserve better, Smokey, whatever was done to them.", next = "BACK", reply = "Mebbe they do, but they're past carin', an' the soldiers aren't. I'll keep brewin'.", fx = { align = { light = 1 } } },
        { text = "Better a useful end than a wasted one. Brew on.", next = "BACK", reply = "That's it exactly! Waste not, want not, as my old mam used tae say.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Turns 'em, same as folk, an' the plaguehounds are what's left when it's done. I've seen beasts out by the Plaguewood wi' their hides hangin' off an' still walkin', an' ye'd rather I didnae describe it further." } },
      choices = {
        { text = "If there's a cure for them, it's worth the hunt.", next = "BACK", reply = "Mebbe so, an' if ye find one, I'll be first in line tae brew it.", fx = { align = { light = 1 } } },
        { text = "Kill every turned beast and burn what's left.", next = "BACK", reply = "Aye, that's the safe road, an' I'll no' argue. Burn 'em well, an' stand upwind while ye do it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every day, an' twice on a bad one, but I've no time tae wonder long. The Dawn's soldiers need somethin' tae keep the plague off their boots, an' if I have tae boil a ghoul's toes tae make it, then I'll boil 'em an' say sorry tae the toes after." } },
      choices = {
        { text = "Necessity forgives much, Smokey. Keep brewing.", next = "BACK", reply = "It does, an' the soldiers' feet forgive it too. Back tae the pot.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "There must be a cleaner way, Smokey. Find it.", next = "BACK", reply = "I've tried, believe me, an' I'm still lookin'. Until then, it's the toes, an' I'm sorry for it.", fx = { align = { order = 1 } } },
        { text = "Something else, Smokey.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It could, if ye kept it steady, for the brew curdles if it's too hot an' turns tae sludge if it's too cold, an' coal's never steady. A mage from Stratholme used tae help me before the fall, an' I've no idea what became o' him, but I'd give a fair bit tae have his hands back on me pots." } },
      choices = {
        { text = "I'll keep your fire steady. The Dawn needs the brew.", next = "BACK", reply = "Grand! Steady as ye can, an' we'll make a batch fit for the Dawn.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Do it yourself, Smokey. I'm no kitchen hand.", next = "BACK", reply = "Fair enough, an' I'll curse my coal in peace. Off ye go.", fx = { align = { honor = -1 } } },
        { text = "Something else, Smokey.", next = "BACK" },
      },
    },
    dd_gambit = {
      lines = {
        { id = "dd_gambit_1",
          text = "Jealous? Of a gnome's tin box? Well, maybe a wee bit, aye, for my compounds keep soldiers alive an' nobody writes songs about that." },
        { id = "dd_gambit_2",
          text = "Still, whatever came out o' that box cleared a room full o' Barov's dead students, so it's done more good than most things built by gnomes. Don't you tell her I said so, mind." },
      },
      choices = {
        { text = "Your compounds matter more than any gadget, Smokey.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'm telling her anyway. She'll love it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_gambit", when = { questDone = TODO_QUEST("Dawn's Gambit") },
          text = "Betina's been tellin' everyone her wee holy-vapour box worked in the Scholomance, an' that it was you who carried it in. I've heard nothin' else for a week, an' I'm glad for her, though I'd be gladder if she stopped tellin' me." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Ye'll no' like what's in my pots, I'll warn ye now, but every bit o' it keeps the plague off a soldier's boots, an' I'll no' apologise for that." },
        { id = "h_default", key = true,
          text = "Smokey LaRue's the name, an' Scourge bits are me trade, more's the pity. I brew things for the Dawn that keep the plague off our boots, an' the recipes call for parts you'd rather not carry." },
        { id = "h_compound", tags = { "news" }, when = { questActive = TODO_QUEST("Smokey's Special Compound") },
          text = "Ye've got the bits? Good, toss 'em in the bin, not on me bench. The compound's half done, an' it's a mean thing when it's interrupted." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ye'll no mind the smell in here, I'd wager, for there's a whiff o' brimstone on ye already, an' my workshop's cleaner by comparison." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Ye've light fingers, {class}, I can see it from here. Good, for the Scourge bits I need come off the dead quicker if ye know how tae cut a purse." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? Ye'll want tae hold yer nose an' say a wee prayer, because what I brew in here would turn a saint's stomach, an' I've had saints in here before." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Ye'll be wantin' tae smite somethin' after a whiff o' my workshop, an' I'll no' blame ye, but smite it outside, if ye please." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Grand, for warriors make the best collectors, {class}, since ye're already up tae yer elbows in the dead an' might as well bring a bit back for old Smokey." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? Then ye'll know how tae skin a thing neatly, {class}, an' wi' Scourge bits that's most o' the job, the rest bein' no' sick on yer boots." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Ye'll not like what I do, {class}, cuttin' bits off the dead an' boilin' 'em, but the spirits can take it up wi' the Scourge, for they started it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Ye wouldnae be able tae keep a pot boilin' wi'out a fire, would ye, {class}? Me coal's run out again, an' the Dawn's carts are late." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Ghoul", min = 40 } }, text = "Ye've been busy, I can tell, for the soldiers keep bringin' me ghoul bits wi' yer name on 'em. Keep it up, an' I'll never run short o' toes again." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin o' the Forsaken! Well, that's one fer the books, a dead {g:lad|lass} callin' down the Light, an' I'll no' pretend I'm no' curious, but hold yer smitin' till ye're out o' the workshop." },
      },
      choices = {
        { text = "You sound jealous of Betina's gadget.", next = "dd_gambit", when = { questDone = TODO_QUEST("Dawn's Gambit") } },
        { text = "What does the plague do to the beasts out here?", next = "druid_q", when = { class = "DRUID" } },
        { text = "That compound smells dreadful.", next = "compound" },
        { text = "I'd guess they call you Smokey for a reason.", next = "name" },
        { text = "Do you ever brew with darker things than rot, Smokey?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What exactly do you want cut off the dead?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Brewing with Scourge parts seems like desecration, Smokey.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the Dawn's knights approve of your work, Smokey?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does your brew do anything for a soldier's armour?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You must brew with plagued beasts too, Smokey.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you ever wonder what the spirits think of your brews, Smokey?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Can magic really help with your brewing, Smokey?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does a dwarf of the Dawn trust a Forsaken paladin, Smokey?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll leave you to it.", next = "END" },
      },
      again = { { id = "h_again", text = "Still here? Fine, but ye're breathin' my smoke." } },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ye don't want me tae answer that wi' yer dinner still in ye. Let's say the Dawn's salves need certain parts the Scourge no longer use, an' a nimble pair o' hands gets 'em clean, which saves me boilin' twice." } },
      choices = {
        { text = "The dead don't need them. Fair harvest.", next = "BACK", reply = "Aye, they don't, an' the soldiers do. Ye've got the right idea.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "It's grim work. I'd rather leave the dead whole.", next = "BACK", reply = "It is, an' I'll no' argue. But grim work keeps the soldiers walkin', an' a soldier wi' no feet is no soldier at all.", fx = { align = { light = 1 } } },
        { text = "Let's talk of something less grim.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Never, an' I'll thank ye no tae suggest it where the paladins can hear. Scourge bits are foul enough, but they're honest foul, an' fel's the kind o' foul that comes wi' a price ye cannae see on the label." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Never, an' I'll thank ye no tae suggest it wi' yer demon standin' there sniffin' at my kettles. Scourge bits are foul enough, but they're honest foul, an' whatever that thing's breathin' over my brew is the kind o' foul wi' a price ye cannae see on the label." },
      },
      choices = {
        { text = "Wise. Some things always cost more than they look.", next = "BACK", reply = "It does, every time. I'll stick tae honest rot, thank ye.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A darker ingredient would make your brews twice as strong.", next = "BACK", reply = "Twice as strong an' ten times as dangerous. No, thank ye, an' keep yer voice down.", fx = { align = { light = -1 } } },
        { text = "Something else, Smokey.", next = "BACK" },
      },
    },
    compound = {
      lines = {
        { id = "co_default", text = "Keeps the rot from climbin' up a soldier's legs on the long patrols. It stinks worse than a ghoul, mind, so nobody thanks me for it." },
      },
      choices = {
        { text = "It's foul work, but somebody has to do it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "On account of the pipe, an' the bench, an' the time I set the eastern tent alight. Nobody's let me forget that one, an' I've stopped askin' 'em to." },
      },
      choices = { { text = "Something else, Smokey.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    scourge = { { id = "tp_scourge", text = "The Scourge leaves good parts lyin' about all over these fields, and I know every spot. The Dawn pays well for 'em, and I don't ask what they do with 'em." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme's full o' Scourge parts, more than I could carry in a lifetime. I'd go myself, if my knees were younger." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "That lich up in his floatin' tomb is the source o' all this mess. I'd like a pipe of whatever he's smokin'." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, an' ye're blockin' me light." } },
  },
}

P:NPC {
  key = "betina", id = TODO_NPC("Betina Bigglezink"), name = "Betina Bigglezink",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "bright" }, values = { "clever", "dutiful" },
  notices = { "class", "lock_shards" },
  impression = {
    first = "She talks about Scholomance cheerfully, which makes it sound worse.",
    third = "{name} met Betina Bigglezink of the Argent Dawn at Light's Hope Chapel, who is building something meant for Scholomance.",
  },

  greetings = {
    { id = "g_bench", text = "Oh, hello! Careful of that vial, it's only mostly stable, by which I mean about sixty percent." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You'll appreciate this, then: it's alchemy and engineering together, and nothing arcane about it, which I'm rather proud of." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Ooh, those shards are putting out a lovely little hum, about a hundred cycles a second, I'd guess. I'd love to put one on my bench, but I've seen what happens when a machine starts listening to a voice." },
  },

  start = "hello",
  nodes = {
    xpt_gnome = {
      big = true,
      lines = { { id = "xpt_gnome_default", text = "Not many, because most of us are still in Ironforge working out how to take Gnomeregan back, and I can't fault them for it. But the plague is a puzzle like any other, with variables and a solution somewhere, and I'd sooner be solving it out here than staring at the gates of a city we lost." } },
      choices = {
        { text = "Gnomes are needed wherever there's a puzzle. Go where you're useful.", next = "BACK", reply = "Exactly! And when the puzzle's solved out here, I'll go back and help with Gnomeregan.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Every gnome should be working to retake Gnomeregan first.", next = "BACK", reply = "First, yes, but somebody has to keep the rest of the world from falling apart in the meantime. That's me, apparently.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "By telling me whether it stings! If the holy part of my device bothers you, it'll bother the Cult of the Damned far worse, and if it doesn't, then I'll know you're more holy than dead, which would be fascinating either way." } },
      choices = {
        { text = "Test it on me. Better I sting than a knight dies.", next = "BACK", reply = "Oh, splendid, splendid! Hold still, this might tingle a bit, or quite a lot.", fx = { align = { honor = 1 } } },
        { text = "I'm not your test subject. Find another way.", next = "BACK", reply = "Fair enough, fair enough, I'll find a volunteer with fewer opinions. No offence meant.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Carry them into the Scholomance, mostly, because the Cult won't let a gnome near the place and I'm too short to hit anything. You'd be amazed what a little blessed vapour does to a necromancer's concentration, or at least I hope you'd be amazed, as I haven't tested it yet." } },
      choices = {
        { text = "I'll carry your device in and follow your instructions exactly.", next = "BACK", reply = "Exactly, that's all I ask! Follow them to the letter, and nobody will lose any eyebrows.", fx = { align = { order = 1 } } },
        { text = "I'll carry it, but if it fails, I'm using my sword.", next = "BACK", reply = "That's perfectly reasonable, and probably wise. Just make sure the device is somewhere safe first.", fx = { align = { order = -1 } } },
        { text = "Something else, Betina.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I gave it a nose that followed the strongest scent, and the strongest scent in the Plaguelands is always rot, so it ran straight into a ghoul pit. Real beasts know when not to follow their noses, which is something I've never managed to build." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Badly wrong, because it followed the strongest scent, and out here that's always rot. May I watch {pet} for a minute, {class}? I'd like to see how a real beast decides where to look." },
      },
      choices = {
        { text = "Some things should stay alive and wild. Leave hounds to nature.", next = "BACK", reply = "Perhaps you're right, and the wild ones are much better at it. I'll stick to vapours.", fx = { align = { order = -1 } } },
        { text = "Build it better. A hound that never tires would be invaluable.", next = "BACK", reply = "Oh, I mean to! Version two will have a nose that ignores rot, if I can work out how.", fx = { align = { order = 1 } } },
        { text = "Something else, Betina.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because knights keep going in and not coming out, and a device doesn't leave a widow behind when it fails. I'd much rather send a box full of holy vapour into that place than one more brave person, if I can help it." } },
      choices = {
        { text = "Some work only a knight can do.", next = "BACK", reply = "Some, yes, and I'd never pretend otherwise. But this work I'd rather leave to a box.", fx = { align = { honor = 1 } } },
        { text = "Cleverness saves lives. That's honour enough.", next = "BACK", reply = "Thank you! I'll tell the knights you said so, though they may not agree.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I've measured it as best I can, and the holy water seems to keep its virtue whatever it passes through, though the cultists in Scholomance may say otherwise once they're in a position to complain. Faith and engineering get along better than people think." } },
      choices = {
        { text = "The Light works through any honest tool.", next = "BACK", reply = "That's my hope too, and so far it's held. The faith's in the hand, I suppose.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Machines are machines. The faith is in the one using it.", next = "BACK", reply = "Exactly, and I'm very glad someone understands. The faith's yours; the gears are mine.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I really don't know, and that's what worries me! I test everything on the undead first, of course, but nobody's ever thought to ask a tree." } },
      choices = {
        { text = "The Scourge first. Worry about the trees later.", next = "BACK", reply = "Very sensible, very sensible indeed. I'll worry about trees next week.", fx = { align = { order = 1 } } },
        { text = "Ask the trees, and test carefully before you use it.", next = "BACK", reply = "Ask the trees? Oh, that's a marvellous idea! I'll need a druid, and a lot of patience.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Someone to get my devices into the Scholomance without the Cult noticing, which is harder than it sounds, because my devices tend to whistle. I'm working on a quieter one, but in the meantime a steady pair of hands and a good sense of timing would be worth more to me than a whole squadron of knights." } },
      choices = {
        { text = "I'll carry your devices in, Betina. Quietly.", next = "BACK", reply = "Thank you! Quietly is exactly what this one needs, because it whistles.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Send knights, Betina. Open battle is the honest way.", next = "BACK", reply = "I've sent knights, and they keep not coming back. I'd rather send a box, thank you.", fx = { align = { honor = 1 } } },
        { text = "Something else, Betina.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "To power a device that doesn't need coal or oil or a gnome to wind it, which would be very useful out here, where all three are scarce. I suspect you'll tell me the spirits wouldn't care for it, and I suspect you'll be right, but a girl can dream." } },
      choices = {
        { text = "Lightning's not yours to bottle, Betina. Respect it.", next = "BACK", reply = "Respect it, yes, of course, absolutely. I'll ask very nicely, I promise.", fx = { align = { order = 1 } } },
        { text = "Try it. The spirits can sort out the rest.", next = "BACK", reply = "Splendid! I'll set up the apparatus and you can stand well back.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Betina.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_smokey", when = { questDone = TODO_QUEST("Smokey's Special Compound") },
          text = "Smokey says you brought him all the bits for his special compound, which explains the smell drifting over from his camp! I've put my nose plug back in, so it's very nice to see you, truly." },
        { id = "h_pt_gnome", tags = { "news" }, when = { party = { race = "Gnome" } },
          text = "Is that a gnome I see behind you? Oh, {companion}, come here and let me look at you, because I haven't seen another gnome this far north since the last Dawn caravan left Ironforge." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Oh, how lovely. You must tell me whether my holy vapours bother the plants, because I'd hate to make things worse out here." },
        { id = "h_default", key = true,
          text = "Betina Bigglezink, of the Argent Dawn, and of Gnomeregan before it got rather radioactive. I make things that help, and right now I'm making something that helps by being very unpleasant to the Cult of the Damned in their Scholomance." },
        { id = "h_gambit", tags = { "news" }, when = { questActive = TODO_QUEST("Dawn's Gambit") },
          text = "You've got the Gambit, how wonderful! Set it in the viewing room in Scholomance, step back, and then please step back a bit further than that." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Oh! Please keep whatever's in that satchel away from my bench, {name}. Something in there is scratching, and I've only got the one spool of copper wiring." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Perfect, {class}, for I've a device that wants an arcane jolt to wake it up, and the last time I used a lightning rod I lost my eyebrows." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Oh, good, because I'm adding holy water to the Gambit, and I'm never quite sure whether the blessing survives being pumped through copper tubing." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Do you think you could look over my Gambit for me? I've tried to make it as holy as a gnome can make anything, and I'd love a second opinion." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Oh, splendid, could you hold this for me? It's only a little holy-water condenser, {class}, and it's quite safe unless you shake it, so please don't shake it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Do you know, {class}, I built a mechanical hound once, and it chased its own tail until it caught fire, so I've tremendous respect for the real ones." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh! You crept up on me, and I'm usually quite good at noticing things, {class}, so either you're very good or I've been staring at this gear too long." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I've always wanted to ask one of you, {class}, whether lightning can be bottled, because I've a few designs that would be ever so much simpler if it could." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Oh, how wonderful, you're exactly what my Gambit needs, because it's meant to be holy and the Scholomance is meant to be unholy, and you're a little of both." },
      },
      choices = {
        { text = "Do your devices harm the land, Betina?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Gnomeregan's loss made us all inventors, didn't it?", next = "gnome", when = { race = "Gnome" } },
        { text = "What is Scholomance?", next = "scholo" },
        { text = "You seem to be building something clever.", next = "gambit" },
        { text = "A gnome seems far from home at Light's Hope.", next = "why" },
        { text = "There are darker fuels than steam, Betina.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What's your device for, Betina?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does a blessing work through gnomish machinery, Betina?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why fight the Scholomance with devices instead of knights, Betina?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would a warrior do with your devices, Betina?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Your mechanical hound seems to have gone wrong, Betina.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What would you need from a quiet sort, Betina?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would you want to bottle lightning, Betina?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How would a Forsaken paladin help your Gambit, Betina?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "My companion is a gnome. Do many gnomes fight out here?", next = "xpt_gnome", when = { party = { race = "Gnome" } } },
        { text = "Good luck with it.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? I can talk and solder at the same time, mostly, with a failure rate well under nine percent!" } },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It's for the Scholomance, and the Cult of the Damned are going to hate it, which is the nicest thing I can say about anything. Gandling's students treat those halls like a library, so I'm building something that does to them what a bookworm does to a book." } },
      choices = {
        { text = "Destroy every page they've written. Leave nothing.", next = "BACK", reply = "Nothing at all, and I'll help you carry the matches. Good riddance.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some of their learning might help us fight them.", next = "BACK", reply = "It might, and that's what worries me. I'd rather burn it and work it out myself.", fx = { align = { light = -1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "There are, and that's exactly why I'd never touch them, for a machine that runs on something hungry will want what it wants sooner or later. Steam, sparks and a little arcane are bad enough, and at least they don't whisper." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It could, and that's exactly why I'd never let it, and why I'd like your demon to stop staring at my steam boiler like that. A machine that runs on demons will want what demons want sooner or later, and at least steam and sparks don't whisper." },
      },
      choices = {
        { text = "A wise rule. Some power corrupts everything it touches.", next = "BACK", reply = "It does, and nobody's ever convinced me otherwise. Nothing hungry in my machines.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is only power. You're being superstitious.", next = "BACK", reply = "Superstitious, maybe, but I've still got all my fingers. I'll stick with steam.", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    scholo = {
      lines = {
        { id = "sc_default", text = "A school for necromancers in the old Barov family keep on Caer Darrow, in the middle of Darrowmere Lake. They teach the dead to stand up and the living to help them, and they keep very good records." },
      },
      choices = { { text = "So you mean to stop the lessons.", next = "scholo_stop" } },
    },
    scholo_stop = {
      lines = {
        { id = "ss_default", text = "I mean to make one room very hard to study in! The viewing room is where they show off their work to the Cult's masters, and if the Gambit goes off there, there'll be nothing left to show." },
      },
      choices = {
        { text = "Burn the whole school down, I say.", next = "BACK", reply = "I'd not object, though the Dawn might want a few bits back. Start with the viewing room.", fx = { align = { order = -1 } } },
        { text = "Strike where it counts, and leave the rest to the Dawn.", next = "BACK", reply = "That's the plan exactly! One room, very loudly, and the Dawn does the rest.", fx = { align = { order = 1 } } },
      },
    },
    gambit = {
      lines = {
        { id = "ga_default", text = "A little device that releases a holy vapour, which the undead find perfectly dreadful. I named it Dawn's Gambit, because a gamble is exactly what it is." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Gnomeregan taught me what it's like to lose a home to something that won't stop. When the Dawn asked for clever hands, mine were very glad to be asked." },
      },
      choices = { { text = "They were lucky to get you.", next = "BACK", fx = { affinity = 2 } } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "It made us all stubborn, anyway, which is the most useful thing an inventor can be. When the Gambit works, I'll drink a toast to home, and you're welcome to join me." } },
      choices = { { text = "I'll hold you to that toast.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    scholomance = { { id = "tp_scholomance", text = "Scholomance is a dreadful place with dreadful architecture, all crooked hallways and nasty little rooms! I'd knock the whole thing down and start over, given half a chance." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad's students run Scholomance now, and they've made a terrible mess of it. I'd love to see his notes, purely for scientific purposes, you understand." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is a very big problem, and I've built a very big contraption to deal with it. It doesn't work yet, but it's very big, and it's only exploded twice." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan was the finest city in the world, and we lost it to troggs and our own clever mistakes. I'd rather fight the Scourge than think about it." } },
    _none = { { id = "tp_none", text = "Hmm, no, but if you find out, write it down for me, with measurements if you can!" } },
  },
}
