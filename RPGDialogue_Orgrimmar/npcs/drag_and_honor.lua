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
    first = "Zilzibin Drumlore keeps a desk among the scrolls of the Mighty Pen in the Drag, a troll scholar of strange creatures who talks faster the more worried he gets. He has been warning the Horde about the silithid for some time, and nobody important is listening.",
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
        { text = "Then work with the Alliance. This is bigger than us.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Horde should handle its own threats alone.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "The Alliance is the threat we can see. Deal with it first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Then I'll carry your reports wherever they need to go.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
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
    first = "Orokk Omosh is a huge, soot-streaked smith in the Valley of Honor who speaks of himself by name and of his family with reverence. He is the last of his line and has no children, and he is looking for someone worthy to carry the Omosh secrets on.",
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
        { text = "Skill matters more than blood. Teach whoever is worthy.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A family's secrets belong to the family.", next = "BACK", fx = { align = { order = 1 } } },
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
