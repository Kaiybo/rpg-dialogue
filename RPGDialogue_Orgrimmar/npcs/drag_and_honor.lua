-- Zilzibin Drumlore, the troll scholar in the Mighty Pen who can't get the Horde to listen about
-- the silithid, and Orokk Omosh, last smith of his line in the Valley of Honor. Voices: bibles/drag_and_honor.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Zilzibin Drumlore: scholar of alien creatures, ignored and furious about it.
---------------------------------------------------------------------------
P:NPC {
  key = "zilzibin", id = TODO_NPC("Zilzibin Drumlore"), name = "Zilzibin Drumlore",
  bible = "bibles/drag_and_honor.md", role = "scholar", tier = "quest",
  communities = { "orgrimmar" }, temper = { "anxious", "sharp" }, values = { "curious", "honest" },
  notices = { "class", "race" },
  impression = {
    first = "He warns of the silithid, and nobody important is listening.",
    third = "{name} met Zilzibin Drumlore, a troll scholar in the Drag who studies the silithid.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the scrolls, please, because Nerog, who owns this shop, has them sorted by a system only he understands. Did you need somethin' from me?" },
    { id = "g_report", when = { questActive = TODO_QUEST("Zukk'ash Report") }, text = "Is that a report from Camp Mojache under your arm? Hadoken said he'd send one, so give it here, quickly." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, good, your people listen to the land better than mine. Has anyone in Thunder Bluff felt the earth shiver down south lately?" },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Cenarion Circle, maybe? Your Circle's people in Silithus see more of these creatures than anyone, and I'd trade my whole shelf of Tanaris rubbings to read their notes." },
  },

  start = "hello",
  nodes = {
    zz_nerog = {
      lines = { { id = "zz_nerog_l", text = "Nerog minds, but I buy more ink than anyone else in Orgrimmar, so he minds quietly. He keeps threatenin' to file me with the old scrolls if I sit still too long, and some days I think he means it." } },
      choices = {
        { text = "Does Nerog believe your warnings?", next = "zz_nerog2" },
        { text = "You do sit very still when you read.", next = "zz_nerog2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zz_nerog2 = {
      lines = { { id = "zz_nerog2_l", text = "He believes the reports are real, and he thinks they're somebody else's problem, which is what most of Orgrimmar thinks. I've stopped arguin' with him and started makin' him copies, so at least the warnings are kept somewhere safe." } },
      choices = {
        { text = "Copies are a good idea.", next = "BACK" },
        { text = "Something else, Zil.", next = "BACK" },
      },
    },
    zz_isles = {
      lines = { { id = "zz_isles_l", text = "I left before Zalazane took them, which I count as luck and not wisdom. My elders thought a troll who wanted to read was a troll who didn't want to hunt, and they weren't entirely wrong." } },
      choices = {
        { text = "Do you regret it?", next = "zz_isles2" },
        { text = "Reading has its own kind of hunting.", next = "zz_isles2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zz_isles2 = {
      lines = { { id = "zz_isles2_l", text = "Some days, when the reports are bad and nobody listens. But a hunter tracks what he can see, and a scholar tracks what's comin', and I'd rather see the silithid comin' than hear about them when they're at the gates." } },
      choices = {
        { text = "The Horde should heed you before it's too late.", next = "BACK", reply = "That's what I keep sayin', friend. Tell the Warchief's officers you heard it from a troll with ink on his fingers.", fx = { align = { order = -1 } } },
        { text = "The Horde has enemies enough close to home.", next = "BACK", reply = "It does, and that's the trouble. The enemy you can see always gets the axes first.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "silithid" } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zilzibin Drumlore, scholar, though my friends call me Zil, and I have spent a long time studying the creatures that don't belong to any ordinary part of Azeroth. Lately one kind of creature takes up all my time, and it frightens me more than any Alliance army." },
        { id = "h_zukk", when = { questDone = TODO_QUEST("Zukk'ash Report") },
          text = "Hadoken was wise to send that report, and you with it. The Zukk'ash in Feralas are silithid, sure as anything, and the Horde keeps choosin' to look the other way." },
        { id = "h_calm", when = { questDone = TODO_QUEST("Calm Before the Storm") },
          text = "Pestlezugg's report is the clearest yet, and I thank you for carryin' it. I only wish I knew what good it will do, because the Horde ignores every threat that doesn't fly an Alliance banner." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, before Nerog files you." },
        { id = "h_again2", text = "Go on, I'm listening, though half my mind is on the next report." },
      },
      choices = {
        { text = "What are the silithid?", next = "silithid" },
        { text = "Who sends you these reports?", next = "reports" },
        { text = "Why won't the Horde listen to you?", next = "council" },
        { text = "What is this place, the Mighty Pen?", next = "pen" },
        { text = "The Circle has seen them in Silithus.", next = "circle", when = { class = "DRUID" } },
        { text = "Nerog doesn't seem to mind you taking up his shop.", next = "zz_nerog" },
        { text = "You left the Echo Isles to study?", next = "zz_isles" },
        { text = "Good luck with your studies, Zil.", next = "END" },
      },
    },
    silithid = {
      lines = { { id = "si_default", text = "Insects, on the surface, the size of a kodo and hungry in ways that don't make sense for any honest beast. They come up out of the ground in Silithus, in Tanaris, now in Feralas and Un'Goro, and every report says there are more than the last." } },
      choices = {
        { text = "Where do they come from?", next = "silithid2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "silithid" } } },
      },
    },
    silithid2 = {
      big = true,
      lines = { { id = "s2_default", text = "From deep, deeper than anyone has dug, and I think something down there is drivin' them, though I can't prove it yet. They're a threat to the Horde and the Alliance both, and to the land itself, and I'd sit down with a human scholar tomorrow if it meant stoppin' them." } },
      choices = {
        { text = "Then work with the Alliance. This is bigger than us.", next = "BACK", reply = "You see it too, then, and I can't tell you how rare that is in this city. Help me get word to someone who'll listen, Horde or Alliance.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Horde should handle its own threats alone.", next = "BACK", reply = "And when the silithid come up through Orgrimmar's floor, the Horde can handle that alone too. I hope you're right, friend.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "silithid" } } },
      },
    },
    reports = {
      lines = { { id = "re_default", text = "Friends, mostly, scattered wherever the trouble is. Senior Surveyor Fizzledowser in Tanaris, Hadoken Swiftstrider at Camp Mojache, and Pestlezugg the alchemist in Gadgetzan, who studies the crater in Un'Goro." } },
      choices = {
        { text = "Goblins and tauren, writing to a troll?", next = "reports2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reports2 = {
      lines = { { id = "r2_default", text = "Scholars write to whoever will read, friend, and I read everything. A goblin's report is mostly invoices, but whatever's left between the bills is usually right." } },
      choices = { { text = "Something else, Zil.", next = "BACK" } },
    },
    council = {
      big = true,
      lines = { { id = "co_default", text = "The Warchief himself might act if the facts were laid before him, but he's beset on every side by advisers who'd have us chase the Alliance out of Ashenvale first. Meanwhile the ground under Silithus gets hollower every season, and the fools call that patience." } },
      choices = {
        { text = "The Alliance is the threat we can see. Deal with it first.", next = "BACK", reply = "You sound like the Warchief's advisers, and they've never seen a silithid hive. The Alliance can wait; what's under Silithus won't.", fx = { align = { honor = -1 } } },
        { text = "Then I'll carry your reports wherever they need to go.", next = "BACK", reply = "Would you? Oh, friend, that's more help than I've had in a year. Take these, and get them to someone who'll read them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pen = {
      lines = { { id = "pn_default", text = "Nerog's shop, scrolls and inks and paper, and the only quiet place in the Drag. He lets me keep my desk here so long as I buy my ink from him, which I would anyway, since nobody else in Orgrimmar sells any worth havin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "ci_default", text = "Then you've seen more of Silithus than anyone in Orgrimmar, and I'd beg you to write it down for me. If the Circle and the Horde's scholars kept the same notes, we might find out what's under that desert before it finds us." } },
      choices = { { text = "Something else, Zil.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I left the Echo Isles to study, which my family thought was a terrible waste of a good spear arm. They're probably right." } },
    advice = { { id = "tp_ad", text = "Write everything down, friend. A thing you saw once is a story, but a thing you wrote down is evidence." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid, and I have too many fields as it is." } },
  },
}

---------------------------------------------------------------------------
-- Orokk Omosh: the last of twenty generations of smiths.
---------------------------------------------------------------------------
P:NPC {
  key = "orokk", id = TODO_NPC("Orokk Omosh"), name = "Orokk Omosh",
  bible = "bibles/drag_and_honor.md", role = "blacksmith", tier = "quest",
  communities = { "orgrimmar" }, temper = { "proud", "warm" }, values = { "loyal", "honest" },
  notices = { "craft", "class" },
  impression = {
    first = "He is the last Omosh and seeks someone worthy of his secrets.",
    third = "{name} met Orokk Omosh, the last smith of the Omosh line in Orgrimmar's Valley of Honor.",
  },

  greetings = {
    { id = "g_hi", text = "Orokk is working, so stand back from the sparks, or stand close and learn something." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith! Orokk can see it in your forearms. Come, come, let Orokk look at your hands." },
    { id = "g_dance", when = { questDone = TODO_QUEST("Joys of Omosh") }, text = "There is the one who carries the Omosh secrets! Orokk is happy every time he sees you." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Your hammer hand has burns on the knuckles. That is good, because it means you lean in close, the way an Omosh does." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Your pauldron is riveted badly, warrior. Orokk would not let an apprentice send that out of the forge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Orokk Omosh, last of the Omosh, and this hammer has passed through twenty pairs of Omosh hands. Mountains of iron our family has shaped, and it stops with Orokk, because Orokk has no kin left and no children to teach." },
        { id = "h_smith", when = { profession = "Blacksmithing" },
          text = "Orokk cannot let the secrets of Omosh die with him, so someone must carry the legacy, Omosh or not. Prove to Orokk that you are a blacksmith, and Orokk will teach you what his father taught him." },
        { id = "h_after", when = { questDone = TODO_QUEST("Barbaric Battlements") },
          text = "The bloodline will fade, but the legend of Omosh will go on in your forge. Orokk sleeps better now, and that is true." },
      },
      again = {
        { id = "h_again", text = "What else? Orokk can talk and hammer at the same time." },
        { id = "h_again2", text = "Ask. The forge is hot and Orokk is in a good mood." },
      },
      choices = {
        { text = "Tell me about the Omosh family.", next = "family" },
        { text = "What would you have me prove?", next = "test", when = { profession = "Blacksmithing" } },
        { text = "What is the Omosh Dance of Joy?", next = "dance", when = { questDone = TODO_QUEST("Joys of Omosh") } },
        { text = "Who else works the forges here?", next = "neighbours" },
        { text = "I'm no smith. Could I learn?", next = "learn", when = { class = "WARRIOR" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    family = {
      lines = { { id = "fa_default", text = "The first Omosh shod the wolves of the Frostwolf chieftains in Draenor, before there was ever a Horde. Orokk's father made axes for the Second War, and Orokk mended the guards' locks in the camps, which is a smaller thing, but it got some of us out." } },
      choices = {
        { text = "Mending locks for the guards? Tell me.", next = "keys" },
        { text = "Why not take an apprentice of your blood?", next = "heir" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keys = {
      lines = { { id = "ke_default", text = "The humans made Orokk mend their locks, because Orokk was good with small metal. Orokk mended them, and he kept a few spare keys in his cheek, and when Thrall came, there were some doors the guards could not hold shut." } },
      choices = { { text = "Something else, Orokk.", next = "BACK", fx = { affinity = 1 } } },
    },
    heir = {
      big = true,
      lines = { { id = "he_default", text = "There is no Omosh blood left but Orokk's, and Orokk is old. Some say a family secret should die with the family, but Orokk thinks a secret that dies is only a waste of good iron." } },
      choices = {
        { text = "Skill matters more than blood. Teach whoever is worthy.", next = "BACK", reply = "Orokk thinks the same, but Orokk's fathers would not. Perhaps you'll help Orokk find someone worthy.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A family's secrets belong to the family.", next = "BACK", reply = "Then the secret dies with Orokk, and so do twenty generations of good iron. Orokk does not like that ending.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    test = {
      lines = { { id = "te_default", text = "Bring Orokk two patterned bronze bracers, two bronze greatswords and two sharp claws, so Orokk can see your work and judge it. Then Orokk has more: iron pauldrons, and a breastplate with tusks, and horns that make the enemy afraid." } },
      choices = {
        { text = "Why sharp claws?", next = "claws" },
        { text = "Something else.", next = "BACK" },
      },
    },
    claws = {
      lines = { { id = "cl_default", text = "Because a smith who can hunt the beast for his own trimmings is a smith who does not wait on anyone. Also, the Omosh have always put claws on the bracers, and Orokk will not be the one who stops." } },
      choices = { { text = "Something else, Orokk.", next = "BACK" } },
    },
    dance = {
      lines = { { id = "da_default", text = "Orokk is not crying, there is soot in his eye. The dance is the last Omosh secret, and you know it now, so when you finish a great piece you must dance, because the Omosh always dance, and then the iron remembers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbours = {
      lines = { { id = "ne_default", text = "Saru Steelfury trains the young smiths, and he is good, but he is always in a hurry. The weaponsmiths and armorsmiths keep their own fires nearby and argue about which is better, and Orokk says both are better when they stop arguing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learn = {
      lines = { { id = "lr_default", text = "Go to Saru Steelfury and learn to fold the metal first, warrior. When your hands know the hammer, come back to Orokk, and he will see if they know the Omosh way." } },
      choices = { { text = "Something else, Orokk.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Orokk was born under a forge in Draenor and has been under one ever since. It is a good place to be born." } },
    advice = { { id = "tp_ad", text = "Never quench a blade in anger. The iron knows, and it will break when you need it most." } },
    _none = { { id = "tp_none", text = "Orokk does not know. Orokk knows metal, and that is not metal." } },
  },
}

---------------------------------------------------------------------------
-- Mayhoa Skyhoof, "Girl with Puppies": a tauren calf who walks the Drag and the Valley of Honor
-- with a basket of prairie wolf pups to sell. Light entry.
---------------------------------------------------------------------------
P:NPC {
  key = "mayhoa_skyhoof", id = TODO_NPC("Mayhoa Skyhoof"), name = "Mayhoa Skyhoof", title = "Girl with Puppies",
  gender = "female", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "cheerful" }, values = { "nature" },
  notices = { "race", "class", "pet" },
  impression = {
    first = "A tauren calf wandering the Drag with a carrier full of prairie wolf pups, every one of them trying to climb out at once.",
    third = "{name} met Mayhoa Skyhoof, a tauren girl selling prairie wolf pups in Orgrimmar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, it's you! Come see the puppies! They've been asking for you, I swear they have." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The puppies are sleeping. Please keep your voice down, and your hands to yourself." },
    { id = "g_default", text = "Do you want to see the puppies? They're prairie wolves from Mulgore, and they need good homes before they chew through my basket." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "You're from home! Do you want a puppy? They're Mulgore wolves, so they'll like you better than these orcs." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "You've got a pet already, so you'll know how to look after one of mine, won't you?" },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! I've only got four left now. Well, four and a half; one's very small." },
  },
  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "The puppies are growling at you. Don't be sad; they growl at every Forsaken on the Drag, and at the bats." },
    { id = "n_wolf", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, look, {pet} wants to sniff them! Gently, gently. See, they're friends already." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I walk up and down the Drag and through the Valley of Honor all day, because the warriors there are the ones who pretend they don't want a puppy and then buy two. This one's the runt, but she's the bravest, and she bit a grunt yesterday." },
      },
      again = {
        { id = "h_again", text = "Anything else? Hold still, he's chewing your boot." },
        { id = "h_again2", text = "What else? Oh, don't mind that one, he only licks." },
      },
      choices = {
        { text = "Where did you find wolf pups?", next = "where" },
        { text = "Isn't Orgrimmar a rough place for a calf?", next = "rough" },
        { text = "Tell me about the runt.", next = "runt" },
        { text = "Does your family know you're here?", next = "family" },
        { text = "Who's bought one so far?", next = "buyers" },
        { text = "How should I care for a wolf pup?", next = "care", when = { class = "HUNTER" } },
        { text = "Orcs ride wolves, you know. Big ones.", next = "frostwolf", when = { race = "Orc" } },
        { text = "Let me see the puppies.", next = "BUSINESS" },
        { text = "Good luck finding them homes.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Their mother was hurt out on the plains near Bloodhoof, and the braves brought the pups in. My family said I could keep one if I found homes for the rest, so I came all the way to Orgrimmar because there are more people here to say yes." } },
      choices = {
        { text = "What happened to the mother?", next = "mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mother = {
      lines = { { id = "mo_default", text = "A Venture Company trap got her leg. The braves let her go after they took it off, and she ran away limping, and I cried for a whole day. I still think she's out there looking for them." } },
      choices = {
        { text = "Then the goblins should pay for it.", next = "BACK", reply = "That's what my uncle said! He said it a lot louder, though.", fx = { align = { honor = -1 } } },
        { text = "She's free, and her pups are safe. That's enough.", next = "BACK", reply = "You think so? I like that. I'll tell the puppies tonight.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rough = {
      lines = { { id = "r_default", text = "Everyone says that, but the orcs are nice when you have puppies. The big ones in the Valley of Honor go all soft, and one of them told me the Frostwolf clan rides wolves into battle, so it's practically a Horde tradition." } },
      choices = {
        { text = "A calf shouldn't be wandering alone here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good for you. Go where you please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    runt = {
      lines = { { id = "ru_default", text = "Her name is Little Thunder, and she's going to be my one, the one I keep. She bit the grunt because he poked the basket with his axe handle, and he laughed so hard he gave me a copper for her bravery." } },
      choices = {
        { text = "She'll make a fine wolf someday.", next = "runt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runt2 = {
      lines = { { id = "ru2_default", text = "She will, and when I'm grown I'm going to be a hunter like the ones on Hunter Rise, and she'll walk beside me everywhere. Mother says I have to grow first, which is very unfair." } },
      choices = { { text = "Growing goes faster than you think. Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "fa_default", text = "Of course they do! My uncle walked the caravan road through the Barrens with me and he's at the inn, probably, talking to the orcs about kodo. There are lots of Skyhoofs, so if you meet one in Mulgore, say Mayhoa sold you a puppy." } },
      choices = { { text = "I'll do that. Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "A troll from Sen'jin who said he'd teach it to dance, and an orc warrior who pretended it was for his son but kissed it on the nose when he thought I wasn't looking. And a Forsaken lady who wanted one, but the puppy wouldn't stop growling at her." } },
      choices = {
        { text = "Poor Forsaken lady.", next = "BACK", reply = "I know! I gave her a scratch behind the puppy's ear instead, for free, and she almost smiled." },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = { { id = "ca_default", text = "You're asking me? You're the hunter! Well, my mother says feed them meat, not bread, let them run every day, and never yell, because a wolf remembers yelling longer than it remembers kindness." } },
      choices = { { text = "Your mother sounds wise. Something else.", next = "BACK" } },
    },
    frostwolf = {
      lines = { { id = "fw_default", text = "I know! Big as kodo, the grunt said, though I think he was teasing. Do you think one of mine could grow that big if I fed her enough?" } },
      choices = {
        { text = "If you feed her very well, maybe.", next = "BACK", reply = "Then I'm feeding her twice as much starting tonight!", fx = { affinity = 1 } },
        { text = "No, but she'll be a good wolf anyway.", next = "BACK", reply = "That's all right. I like her the size she is, really." },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_venture", text = "They hurt the puppies' mother with a trap. I don't like them at all." } },
    _none = { { id = "tp_none", text = "I don't know! Ask somebody grown up. Do you want a puppy, though?" } },
  },
}
