-- Gaerolas Talvethren, Great Warden of the Sleeping, wounded in Starbreeze Village (0.72.0). Voice: bibles/gaerolas.md
-- Classic: A Troubling Breeze (ends here), Gnarlpine Corruption (gives).
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gaerolas", id = TODO_NPC("Gaerolas Talvethren"), name = "Gaerolas Talvethren",
  bible = "bibles/gaerolas.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "grave", "proud" }, values = { "dutiful", "protective" },
  notices = { "weary", "form" },
  impression = {
    first = "He was bleeding and still asked about the sleepers first.",
    third = "{name} met Gaerolas Talvethren, the wounded Great Warden of the sleeping druids, in the plundered Starbreeze Village.",
  },

  greetings = {
    { id = "g_wound", text = "Forgive me if I do not rise. The furbolgs left me a reminder in my side." },
    { id = "g_corrupt", when = { questActive = TODO_QUEST("Gnarlpine Corruption") }, text = "Have you reached Athridas yet? Every hour we lose, the Sleeping lie closer to the Gnarlpine's claws." },
    { id = "g_relics", when = { questDone = TODO_QUEST("The Relics of Wakening") }, text = "Athridas tells me the relics are safe. I have slept a little better since, which is a strange thing for a warden to admit." },
    { id = "g_away", when = { away = 14 }, text = "You return after {away}, and the barrow still stands. I count both of those as blessings." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You were barely blooded when you carried my warning to Dolanaar, and look at you now. Ysera's sleepers would be glad of a guard like you." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word reaches even this battered house that you have been helping our people. I am glad of it, and gladder that it was you who came when I needed someone." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { deathsHere = { min = 1 } },
      text = "You have fallen to them as well, I see, and risen again. The Gnarlpine fight like nothing I remember, so do not be ashamed of it." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear's shape, worn cleanly! After the Gnarlpine, I needed to see that, and I thank you for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Gaerolas Talvethren, Great Warden to the druids who sleep in the Ban'ethil Barrow Den. The Gnarlpine caught me on the road there and then went through Starbreeze like a fire." },
        { id = "h_breeze", tags = { "news" }, when = { questActive = TODO_QUEST("A Troubling Breeze") },
          text = "Thank the forest spirits you are here! I knew Athridas would feel something was wrong and send help, though I wish I had better news for him." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Gnarlpine Corruption") },
          text = "The Gnarlpine have turned on us again, and it is Ursal the Mauler, their chieftain, who drives them. He has taken up the fel moss, and they follow him mad-eyed." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Gnarlpine Corruption") },
          text = "Go to Athridas in Dolanaar and tell him all of it, because I cannot make the walk with this wound. Pray the furbolgs have not reached Ban'ethil before he can act." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gnarlpine Corruption"), days = 3 } },
          text = "Athridas knows, then. Good, for he will move faster than I can, and the Sleeping need fast friends now." },
        { id = "h_ursal", tags = { "news" }, when = { questDone = TODO_QUEST("Ursal the Mauler") },
          text = "Ursal is dead, they tell me, and the Gnarlpine are quieter for it. I take no joy in it, for I knew their tribe when it traded honestly at our edges." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid. Then you understand what it means to me that my brothers and sisters lie dreaming beneath the earth with only me to guard them." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Speak plainly; I have no strength for riddles." },
        { id = "h_again2", text = "Go on. Talking keeps my mind off the wound." },
      },
      choices = {
        { text = "Who are the druids you guard?", next = "sleeping" },
        { text = "The Gnarlpine seem to have gone mad.", next = "gnarlpine" },
        { text = "Starbreeze looks as if it was overrun.", next = "village" },
        { text = "Tallonkai says you gave him his dreamcatcher.", next = "dreamcatcher", when = { any = { { questActive = TODO_QUEST("The Emerald Dreamcatcher") }, { questDone = TODO_QUEST("The Emerald Dreamcatcher") } } } },
        { text = "Will I one day sleep in the Dream myself?", next = "druid_g", when = { class = "DRUID" } },
        { text = "Let me look at that wound.", next = "heal_g", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "I'll carry your message.", next = "BUSINESS" },
        { text = "What is a Great Warden's duty?", next = "w_duty" },
        { text = "Rest well, Warden.", next = "END" },
      },
    },

    sleeping = {
      lines = {
        { id = "sl_default", text = "The Druids of the Talon, who sleep by a pact with Ysera and walk her Dream while their bodies rest. My duty as the chosen protector of the Sleeping is to see that nothing wakes them wrongly, or harms them while they cannot wake at all." },
      },
      choices = {
        { text = "What happens if they're woken wrongly?", next = "sleeping_wake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleeping_wake = {
      lines = {
        { id = "sw_default", text = "They may be lost between the waking world and the Dream, and I do not know a cure for that. Athridas keeps the relics of wakening for when they must be called back properly, and I keep everything else away." },
      },
      choices = {
        { text = "Is anyone in the barrow already lost?", next = "sleeping_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleeping_lost = {
      big = true,
      lines = {
        { id = "slo_default", text = "I fear so. I have heard that a druid of the claw walks in the barrow den with furbolg shaman at his side, and none of my brothers would do that willingly, so something has been done to him." },
        { id = "slo_oben", when = { questDone = TODO_QUEST("Druid of the Claw") },
          text = "There was one, Oben Rageclaw, whose body the furbolg shaman stole while his spirit dreamed. You set him free, I am told, and I owe you for that more than I can say." },
      },
      choices = {
        { text = "I'll go into the barrow and find out.", next = "BACK", reply = "Then you are braver than any of my brothers who went before you. Go carefully, and bring word back to me if you can.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If he serves the furbolgs now, he's an enemy.", next = "BACK", reply = "If he does, then he is lost to us, and I will grieve him. But be sure before you strike, for he was one of ours once.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnarlpine = {
      big = true,
      lines = {
        { id = "gn_default", text = "They were a peaceful tribe once, and we believed the new tree would keep them so. That this madness has taken them means Teldrassil is not as whole as we told ourselves." },
      },
      choices = {
        { text = "Then they're victims. Spare those you can.", next = "BACK", reply = "Thank you for seeing it, friend. Every Gnarlpine you spare is one the forest may yet heal.", fx = { align = { light = 1 } } },
        { text = "Victims or not, they nearly killed you. Cut them down.", next = "BACK", reply = "They did, and I bear no grudge for your anger on my behalf. Still, I would rather they were healed than slain.", fx = { align = { light = -1 } } },
        { text = "What is making them mad?", next = "gnarlpine_moss" },
      },
    },
    gnarlpine_moss = {
      lines = {
        { id = "gm_default", text = "Fel moss, and Ursal the Mauler feeding it to his own people. Where he found it I do not know, but Athridas and the Dolanaar druids have seen it on the grells as well." },
      },
      choices = {
        { text = "Where does Ursal make his den?", next = "gnarlpine_ursal" },
        { text = "Something else.", next = "BACK", fx = { learn = { "fel_moss" } } },
      },
    },
    gnarlpine_ursal = {
      lines = {
        { id = "gu_default", text = "In Gnarlpine Hold, far to the southwest, with the worst of his followers around him. Do not go alone, and do not go before Athridas has told you what he wants done." },
      },
      choices = {
        { text = "I'll wait for Athridas.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "furbolgs" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },

    village = {
      lines = {
        { id = "vi_default", text = "They came through the houses and took what they could carry and broke the rest. The folk of Starbreeze ran for Dolanaar, and I crawled up here to wait for someone braver than a wounded old warden." },
      },
      choices = {
        { text = "You did your duty. There's no shame in it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Did they take anything that matters?", next = "village_take" },
      },
    },
    village_take = {
      lines = {
        { id = "vt_default", text = "The furbolg Ferocitas took something from a dresser here that belonged to Tallonkai Swiftroot, and he will want it back. Everything else can be mended or made again." },
      },
      choices = {
        { text = "I'll tell Tallonkai.", next = "BACK" },
        { text = "Goodbye, Warden.", next = "END" },
      },
    },

    dreamcatcher = {
      lines = {
        { id = "dc_default", text = "I did, for it draws a little good fortune out of the Emerald Dream, and he has always needed more luck than he admits. That he left it here for the Gnarlpine to find is a lesson I hope he takes to heart." },
      },
      choices = {
        { text = "I'll bring it back to him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_g = {
      lines = {
        { id = "dg_default", text = "Perhaps, if the Circle asks it and you are willing. It is not a rest, whatever the young think, but a long watch in a place where the paths move under your feet." },
      },
      choices = {
        { text = "I would be honoured to keep that watch.", next = "BACK", reply = "Then the Circle would be glad of you, and the Dream will welcome you when the time comes. It is a great honour, and a great burden.", fx = { align = { order = 1 } } },
        { text = "I'd rather walk this world while I can.", next = "BACK", reply = "Many young druids feel the same, and there is no shame in it. The world has need of watchers on this side too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal_g = {
      lines = {
        { id = "hg_default", text = "You are kind, and I will not refuse you, though a furbolg's claw goes deep. Close it if you can, and then go to Athridas, for that matters more than my side." },
      },
      choices = {
        { text = "Hold still, Warden.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_duty = {
      lines = {
        { id = "w_duty_default", text = "To keep the sleeping bodies safe while their spirits walk with Ysera, and to wake them if the world has need of them, which I have never once had to do. I turn them, I keep the barrow dry, and I sing to them, though I doubt they hear it." },
      },
      choices = {
        { text = "Why sing, if they can't hear?", next = "w_duty2" },
        { text = "That's a lonely duty.", next = "w_duty2" },
      },
    },
    w_duty2 = {
      lines = {
        { id = "w_duty2_default", text = "Because a barrow den is very quiet, and quiet is where a warden starts to doubt. The song keeps me awake and keeps me honest. And once, years ago, one of the sleepers smiled at the third verse, and I have sung it every night since." },
        { id = "w_duty2_w1", when = { class = "DRUID" }, text = "You may sleep there one day, as I said. If you do, I hope your warden sings, and sings badly, as I do." },
      },
      choices = {
        { text = "They'll hear you one day.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Warden.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am the Great Warden of the Sleeping, and I have kept that watch for a long time. There is not much more to me than the watch, and I prefer it so." } },
    advice = { { id = "tp_ad", text = "Never walk the road to the barrow dens alone at night. I did, and you see what it cost me." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine were good neighbours before the fel moss, and I would like to believe they will be again.", next = "gnarlpine" } },
    fel_moss = { { id = "tp_felmoss", text = "It grows where something rotten feeds it, and it rots whatever eats it. Keep it off your hands." } },
    teldrassil = { { id = "tp_tree", text = "We were told the tree was blessed and whole, and I believed it, and I would still like to." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Sleepers in the barrows walk the Emerald Dream, and some of them have walked so far into it that I am no longer sure they are coming back. I keep watch anyway." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil kept our Sleepers for ten thousand years beneath Hyjal. Teldrassil keeps them now, and I hope it keeps them as gently." } },
    malfurion = { { id = "tp_malfurion", text = "Malfurion sleeps the deepest of all our druids, and I watch the barrows partly in his honour. When he wakes, I hope he finds the watch was kept." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are what the Gnarlpine were, before the madness came. I find it comforting that some furbolgs remain whole." } },
    _none = { { id = "tp_none", text = "I have kept a barrow's watch over the Sleepers too long to know much of that. Ask in Dolanaar, where the waking world still turns." } },
  },
}
