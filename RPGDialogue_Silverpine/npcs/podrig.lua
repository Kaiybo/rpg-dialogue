-- Deathguard Podrig, keeping the Sepulcher's stores. Voice: bibles/podrig.md
-- A soldier who discovered he's better with a ledger than a blade, and takes the ledger very seriously.
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "podrig", id = TODO_NPC("Deathguard Podrig"), name = "Deathguard Podrig",
  bible = "bibles/podrig.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "fussy" }, values = { "dutiful", "orderly" },
  notices = { "kit", "purse" },
  impression = {
    first = "Deathguard Podrig counts the Sepulcher's swords the way other soldiers count their kills. He is fussy and proud of it, and he would rather see the Deathguard overstocked than caught short.",
    third = "{name} met Deathguard Podrig, who keeps the Sepulcher's stores in order for High Executor Hadrec.",
  },

  greetings = {
    { id = "g_count", text = "Forty-one, forty-two... yes? Speak up, but don't make me lose my place." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I've recounted since you were last here, so if anything's gone missing, I'll know." },
    { id = "g_order", when = { questActive = TODO_QUEST("Supplying the Sepulcher") }, text = "The order goes to Karos Razok first, for the bat, and then to Gordon Wendham in the Undercity. Don't lose it, because I'll have to write it again." },
    { id = "g_crate", when = { questActive = TODO_QUEST("Return to Podrig") }, text = "Have you got Gordon Wendham's crate from the Undercity? You appear to be on official business, which is how I like people to appear." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and in that time we lost six blades and a shield in the woods, plus one helmet a ghoul is still wearing. I'm keeping a list." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're better armed than when you first ran errands for me. I'd like to know where it came from, purely for the records." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word is you've been useful about the Sepulcher. Useful people are the only kind my ledger has room for." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's a disgrace, and I mean that kindly. A Deathguard who came back looking like that would be on my list by evening." },
    { id = "n_purse", cat = "purse", when = { money = { max = 100 } },
      text = "You look short of coin. I'm short of weapons, so we're both suffering, though only one of us is keeping proper accounts of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Podrig. High Executor Hadrec asked me to take stock of the Sepulcher's equipment, and I've taken it, twice, and I'd take it a third time if anyone let me." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Supplying the Sepulcher") },
          text = "We're well stocked in general, which is a relief, but we're short of weapons. The Deathguard keep losing them in the woods, along with the occasional Deathguard." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Podrig"), days = 3 } },
          text = "Good work. These weapons will make sure our Deathguard aren't caught unprepared, and you've done the Dark Lady a real service, whatever anyone says about errands." },
        { id = "h_hadrec", when = { questDone = TODO_QUEST("Return to Podrig") },
          text = "The High Executor read my report from start to finish, which almost nobody does. I've decided to take that as praise." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior. Then you'll understand that a soldier without a blade is just a very determined corpse, and I won't have any of those on my watch." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a column to finish." },
        { id = "h_again2", text = "Go on. I'll remember where I stopped; I always do." },
      },
      choices = {
        { text = "Why are you so short of weapons?", next = "short" },
        { text = "What's in the woods that takes them?", next = "woods" },
        { text = "You seem to enjoy counting swords.", next = "ledger" },
        { text = "Do you have a list of your losses?", next = "list", when = { class = { "ROGUE", "WARRIOR", "HUNTER" } } },
        { text = "Any work for me?", next = "BUSINESS" },
        { text = "I'll let you count.", next = "END" },
      },
    },

    short = {
      lines = { { id = "sh_default", text = "Because a Deathguard who falls in Silverpine falls with his sword in his hand, and nobody goes back for the sword. I'd send for the soldiers too, if anybody were taking orders for those." } },
      choices = {
        { text = "Someone must be supplying you.", next = "short_supply" },
        { text = "Something else.", next = "BACK" },
      },
    },
    short_supply = {
      lines = { { id = "ss_default", text = "Gordon Wendham in the Undercity, who sells weapons and keeps his own accounts nearly as well as I keep mine. Karos Razok's bats carry the orders up and the crates back, when the bats are in a mood to fly." } },
      choices = {
        { text = "And if the order goes astray?", next = "short_astray" },
        { text = "Something else.", next = "BACK" },
      },
    },
    short_astray = {
      big = true,
      lines = { { id = "sa_default", text = "Then a patrol walks into the worgen with half its blades, and I spend a week writing letters to explain why. I'd rather send a reliable runner, which is where you come in." } },
      choices = {
        { text = "Careful work saves lives. I'll treat it that way.", next = "BACK", reply = "Thank you, truly. You've no idea how rare that is out here, or how few letters I'll have to write.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Patrols should scavenge what they need. Less paper.", next = "BACK", reply = "Less paper and more dead patrols, you mean. I'll keep my ledgers, thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    woods = {
      lines = { { id = "wo_default", text = "Scourge, and worse, as the High Executor puts it. Worgen out of Pyrewood, the Dalaran wizards behind their wall at Ambermill, and gnolls in the southern hills who'll take a sword just to have something shiny." } },
      choices = {
        { text = "I'd guess the worgen are the worst.", next = "woods_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woods_worst = {
      lines = { { id = "ww_default", text = "The worgen, by my figures. Gnolls take swords, but worgen take the whole patrol, and the ledger can't account for what it never sees come back." } },
      choices = {
        { text = "I'll bring back what I can find.", next = "BACK", fx = { affinity = 1, learn = { "worgen" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ledger = {
      lines = { { id = "le_default", text = "Enjoy is a strong word, but I'll admit I'm better at it than I ever was at fighting. When I was alive I couldn't keep a purse straight, and now I can tell you how many arrows are in that barrel without looking." } },
      choices = {
        { text = "How many, then?", next = "ledger_arrows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_arrows = {
      lines = { { id = "la_default", text = "Two hundred and eleven, and one of them's bent, which I'll be raising with the fletcher. Don't look so impressed; it's only arithmetic." } },
      choices = {
        { text = "I'm impressed anyway.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    list = {
      lines = { { id = "li_default", text = "I do, and it's longer than I'd like. If you come across a Deathguard blade in the woods, with the Sepulcher's mark on the hilt, I'd be grateful to know where it fell, even if you can't carry it home." } },
      choices = {
        { text = "I'll keep an eye out for the mark.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A soldier who turned out to be a better clerk. The Deathguard needs both, whatever the young ones think." } },
    advice = { { id = "tp_ad", text = "Count your arrows before the fight, not after, because after is too late to send for more." } },
    worgen = { { id = "tp_worgen", text = "The worgen cost me more blades than everything else in Silverpine put together, and I've the numbers to prove it." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken need every sword I can find, and I keep the Sepulcher's racks full because no one else bothers. You'd be amazed how quickly a soldier loses track of his blade when he can't feel his hand." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal's keep is full of worgen and worse, and the Deathguard keeps a close eye on its gates. If they ever come out in force, I mean for us to be overstocked, not caught short." } },
    scourge = { { id = "tp_scourge", text = "The Scourge still wanders in from the north and east, and each one that does gets a blade through the skull. I count those too, though I count the blades more carefully." } },
    gilneas = { { id = "tp_gilneas", text = "The Gilneans hide behind their wall, and their wall is very well built. I've never seen a Gilnean soldier, and I'd like to count their swords one day." } },
    _none = { { id = "tp_none", text = "That isn't in my ledger. Ask Bates at the inn; he keeps a different kind of accounts." } },
  },
}
