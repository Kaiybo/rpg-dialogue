-- Winterspring folk with no conversation until now: the Remorseful Highborne at Kel'Theril,
-- Grum Redbeard in the Starfall barrow den, and Umaron Stragarelm in Everlook.
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Remorseful Highborne
---------------------------------------------------------------------------
P:NPC {
  key = "ws_remorseful", id = TODO_NPC("Remorseful Highborne"), name = "Remorseful Highborne",
  role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "mournful", "haunted" }, values = { "atonement" },
  impression = {
    first = "A banshee of the Highborne, grieving at the frozen lake of Kel'Theril.",
    third = "{name} met the Remorseful Highborne, a banshee who haunts the Ruins of Kel'Theril and regrets what her people did.",
  },
  greetings = {
    { id = "g_default", text = "You can see me? Then hear me, mortal, for I have waited so long for someone to listen." },
    { id = "g_crystal", when = { questActive = TODO_QUEST("Tormented By the Past") }, text = "That light you carry... the crystal of Zin-Malor. Bring it closer, please. I have not seen it whole since I died." },
    { id = "g_wynd", when = { questActive = TODO_QUEST("Remorseful Highborne") }, text = "Go to Wynd Nightchaser at Starfall. Let her decide what becomes of the crystal, and of us." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Once, I was a Highborne sorceress of Kel'Theril. We served Queen Azshara and drew on powers we did not understand, and when the world broke, we paid for it. Now we remain here, bound to the lake." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "You are kaldorei. Your ancestors fought mine in the war that ended everything. I do not blame you for hating us." },
        { id = "h_done", when = { questDone = TODO_QUEST("Remorseful Highborne") }, text = "The others are quieter since the crystal left. I think, perhaps, some of them have finally begun to rest." },
      },
      again = {
        { id = "h_again", text = "What else would you know of the dead?" },
        { id = "h_again2", text = "Ask, mortal. Time means little to me now." },
      },
      choices = {
        { text = "What happened here at Kel'Theril?", next = "kel" },
        { text = "What is the crystal of Zin-Malor?", next = "crystal" },
        { text = "Why do you remain here?", next = "remain" },
        { text = "Your people destroyed the world. Why should I help you?", next = "hate", when = { race = "NightElf" } },
        { text = "Farewell, spirit.", next = "END" },
      },
    },
    kel = {
      lines = { { id = "ke_default", text = "Kel'Theril was a place of learning, where the Highborne studied the arcane by the water's edge. When the Well of Eternity was destroyed, the cold came, and we died here, and no one remembered us." } },
      choices = {
        { text = "Did you know what Azshara intended?", next = "kel2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel2 = {
      lines = { { id = "k2_default", text = "Some of us knew, and most of us chose not to see. I was one who chose not to see. That is my shame, and it has outlasted my flesh by ten thousand years." } },
      choices = {
        { text = "Choosing not to see is still a crime.", next = "BACK", reply = "Yes. It is. I know that now.", fx = { align = { light = 1 } } },
        { text = "You were only following your queen.", next = "BACK", reply = "That is what we told ourselves. It was never enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal = {
      lines = { { id = "cr_default", text = "A focus for our power, shattered when Kel'Theril fell. The druids would see it in Fandral Staghelm's hands, and perhaps that is fitting. The Highborne have no right to it now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    remain = {
      lines = { { id = "re_default", text = "Because our guilt holds us, and the others here are not as sorry as I am. They rage, and they would harm you if they could. Be careful by the water." } },
      choices = { { text = "I'll be careful. Something else.", next = "BACK" } },
    },
    hate = {
      lines = { { id = "ha_default", text = "You should not, for my sake. Do it for the land, so that what was taken from it is not used again by someone worse." } },
      choices = { { text = "For the land, then.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Grum Redbeard
---------------------------------------------------------------------------
P:NPC {
  key = "ws_grum", id = TODO_NPC("Grum Redbeard"), name = "Grum Redbeard",
  role = "citizen", tier = "service", race = "Dwarf",
  communities = { "winterspring_wilds" }, temper = { "jovial", "gruff" }, values = { "kin", "comfort" },
  impression = {
    first = "A dwarf making himself at home in a night elf barrow den.",
    third = "{name} met Grum Redbeard, a dwarf who keeps warm in the barrow den at Starfall Village.",
  },
  greetings = {
    { id = "g_default", text = "Shut the door behind ye, if ye can find it! It's cold enough out there to freeze a beard solid." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf! In Winterspring! Come in, come in, there's a fire and nobody's usin' half of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Grum Redbeard's the name. I came north to poke at the old elven ruins, same as Jaron Stoneshaper, and I've been hidin' in this barrow den from the snow ever since." },
      },
      again = {
        { id = "h_again", text = "What else, eh? Sit by the fire while ye ask." },
        { id = "h_again2", text = "Aye? Out with it." },
      },
      choices = {
        { text = "Why not stay out with Jaron at the ruins?", next = "jaron" },
        { text = "What's a barrow den?", next = "barrow" },
        { text = "Farewell, Grum.", next = "END" },
      },
    },
    jaron = {
      lines = { { id = "ja_default", text = "Because Jaron likes the cold more than any sane dwarf ought to, and because the ruins are full of angry ghosts. I'll dig a nice warm tunnel any day, but I'll not argue with a banshee." } },
      choices = {
        { text = "Somebody has to face those ghosts.", next = "BACK", reply = "Aye, and that somebody can be you, lad.", fx = { align = { honor = 1 } } },
        { text = "Staying warm is the smarter choice.", next = "BACK", reply = "Ha! A dwarf after my own heart.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barrow = {
      lines = { { id = "ba_default", text = "Where the elf druids sleep, so they tell me, deep in their dreams. It's quiet, and it's warm, and the druids don't snore, which is more than I can say for Jaron." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Umaron Stragarelm (Everlook)
---------------------------------------------------------------------------
P:NPC {
  key = "ws_umaron", id = TODO_NPC("Umaron Stragarelm"), name = "Umaron Stragarelm",
  role = "citizen", tier = "service", race = "Goblin",
  communities = { "everlook" }, temper = { "shrewd", "chatty" }, values = { "profit" },
  impression = {
    first = "A goblin in Everlook who seems to do nothing and know everything.",
    third = "{name} met Umaron Stragarelm, a goblin of Everlook who watches the trade come and go.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, a new face in Everlook! Don't mind me, I'm just watchin' the money move." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Umaron Stragarelm, at your service, though I don't actually provide any services. I'm here for the cartel, keepin' an eye on who buys what and who's selling it cheap." },
      },
      again = {
        { id = "h_again", text = "What else you wanna know, pal?" },
        { id = "h_again2", text = "Still here? Good. Talk's cheap, so let's have some." },
      },
      choices = {
        { text = "Who runs Everlook?", next = "who" },
        { text = "Why would anyone trade in this cold?", next = "cold" },
        { text = "See you around, Umaron.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Innkeeper Vizzie runs the inn, the guards run the gate, and Gadgetzan runs everybody. Everlook's a Steamwheedle town, neutral as can be, and we don't care what color your banner is." } },
      choices = {
        { text = "Neutrality is just greed with good manners.", next = "BACK", reply = "Ha! Maybe so, pal, but greed keeps the peace better than swords do.", fx = { align = { order = -1 } } },
        { text = "A neutral town keeps the peace. That's worth something.", next = "BACK", reply = "Now you're talkin' sense. Somebody's gotta.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = { { id = "co_default", text = "Furs, pal. Frostsaber pelts, chimaera hides, and the stuff the Timbermaw trade for. Folks pay a fortune for 'em down south, and they're up here for the taking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
