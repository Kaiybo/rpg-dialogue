-- Spark Nilminer, the Marshal Expedition's chief digger, who hates digging (0.72.0). Voice: bibles/spark_nilminer.md
-- Wants out of Un'Goro more than anything; bones are bones, whoever they used to belong to.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "spark_nilminer", id = TODO_NPC("Spark Nilminer"), name = "Spark Nilminer",
  title = "Marshal Expeditions",
  bible = "bibles/spark_nilminer.md", role = "worker", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "nervous", "wry" }, values = { "practical", "profit" },
  notices = { "craft", "travel" },
  impression = {
    first = "Spark Nilminer is the Marshal Expedition's chief digger and hates every minute of it. He'd give the gold teeth from his mouth to leave Un'Goro, and he doesn't much care where the expedition's dinosaur bones come from.",
    third = "{name} met Spark Nilminer, the Marshal Expedition's reluctant chief digger at Marshal's Refuge.",
  },

  greetings = {
    { id = "g_default", text = "Please tell me you've come to take us home, pal. No? Then what good are you, and what are you chargin' for it?" },
    { id = "g_bones", when = { questActive = TODO_QUEST("Roll the Bones") }, text = "Eight dinosaur bones, pal, and I don't want to know where from. Seriously, don't tell me, because what I don't know can't go on an invoice." },
    { id = "g_bones_done", when = { questDone = TODO_QUEST("Roll the Bones") }, text = "My bone supplier! Keep your voice down, pal, the Marshals are within earshot, and they think I'm earning my wages." },
    { id = "g_away", when = { away = 14 }, text = "You left for {away} and came back? Of your own free will, pal? I'll never understand adventurers, and I've tried to, for business reasons." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Everybody says you've been helpful, pal, which means everybody's been asking you for things for free. Welcome to the club, the dues are terrible." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Then you know the only good thing about digging is when you stop, pal. Want a shovel? I've got spares, and I'll sell you one at cost, just to have one less around." },
    { id = "n_mount", cat = "travel", when = { mounted = true },
      text = "Is that thing fast? How fast, pal? Fast enough to outrun a devilsaur with a goblin on the back, because I'd pay you every copper I've got for the seat." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "For the love of all that's holy, pal, tell me you've come to deliver us from this forsaken land. I'm with Marshal Expeditions, but I'd give you the gold teeth from my mouth to climb inside your backpack and leave." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Roll the Bones") },
          text = "You'd think being chief digger for Marshal Expeditions means I like digging, pal. There might be worse things to do in this world, but none really leap to mind, and none pay worse per blister." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Roll the Bones") },
          text = "We were meant to dig in Terror Run for dead stegodons and diemetradons, pal, and there are plenty of live ones too. Between you and me, bones from the live ones will do just as well, and they're a lot less work to find." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Roll the Bones"), days = 3 } },
          text = "THANKS FOR DIGGING ALL THESE BONES OUT OF THE GROUND AND NOT HURTING THE NATIVE BEASTS IN ANY WAY! And now, quietly: whether you did or didn't, let's keep it that way." },
        { id = "h_goblin", when = { race = "Goblin" },
          text = "A goblin! Then you understand, pal: no contract is worth getting eaten over, and I signed mine before I'd seen a devilsaur, which is the worst deal I ever made." },
      },
      again = {
        { id = "h_again", text = "Anything else, pal? Anything that involves leavin', ideally." },
        { id = "h_again2", text = "Go on, pal, I'm not going anywhere, which is the whole problem." },
        { id = "h_again3", text = "You're still here, pal? Then you're either brave or broke, and in Un'Goro those cost about the same." },
      },
      choices = {
        { text = "Why did you sign on, if you hate it?", next = "why" },
        { text = "Terror Run sounds like a cheerful place.", next = "terror" },
        { text = "What do you think of Dadanga?", next = "dadanga" },
        { text = "The Marshals can't know where these bones come from.", next = "marshals" },
        { text = "I dig for a living too. Any tips?", next = "miner", when = { profession = "Mining" } },
        { text = "Hunting those beasts for bones is wrong.", next = "druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Hang in there, Spark.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The pay was good and the brochure was very misleading, pal. It said a land untouched by time, and I thought that meant quiet, not full of lizards that haven't learned they're supposed to be extinct, and there's no refund clause." } },
      choices = {
        { text = "Why not just leave?", next = "why_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_leave = {
      lines = { { id = "wl_default", text = "Alone? Through that jungle? I'd be a snack before I made the first ridge, pal, and a cheap one. No, I wait for an escort, or a miracle, or a really big bird." } },
      choices = { { text = "I'll keep an eye out for the bird.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    terror = {
      lines = { { id = "t_default", text = "Terror Run, which is a FANTASTIC name, by the way, really sells it. Stegodons, diemetradons and all their bones, pal, and most of the bones are still walking around inside them." } },
      choices = {
        { text = "So you want me to kill them for bones?", next = "terror_stance" },
        { text = "What do the Marshals want with bones?", next = "terror_stance" },
      },
    },
    terror_stance = {
      big = true,
      lines = { { id = "ts_default", text = "Wil and Hol want to study the crater's history, pal, and a bone's a bone to a scholar. They won't care whether it's from an ancient stegodon or one that tried to eat us last Tuesday, and the Expedition pays the same either way." } },
      choices = {
        { text = "Fair trade. Those beasts would eat you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Lying to your own leaders is shameful, Spark.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dadanga = {
      lines = { { id = "d_default", key = true, text = "Yeah, yeah, I know Dadanga dislikes smoke. From the smell of it, pal, Dadanga also dislikes bathing, and I'd pay good money to change that." } },
      choices = {
        { text = "That's unkind.", next = "dadanga_unkind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dadanga_unkind = {
      lines = { { id = "du_default", text = "It's honest, pal, which is different. Petra's lovely, the kodo's lovely, and I'd still rather sleep upwind of both of 'em." } },
      choices = { { text = "Upwind of both. I'll remember that.", next = "BACK", fx = { affinity = 1 } } },
    },
    marshals = {
      lines = { { id = "m_default", text = "Officially, they think the bones are dug up, the old-fashioned way, by me. Unofficially, pal, I'm a very good digger when you're the one doing the digging, and I'm a very good manager when it comes to taking the credit." } },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } } },
    },
    miner = {
      lines = { { id = "mi_default", text = "Dig where somebody else already dug, pal, and bring a big friend. That's the whole art, and it's served me well and cheap." } },
      choices = { { text = "Words to live by.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Wrong? They try to eat us every day, pal! If it makes you feel better, bring me bones from the ones that charge first, because that's self-defence, and I'll write it down in the ledger if you like." } },
      choices = { { text = "That's not how it works, Spark.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Chief digger, Marshal Expeditions, pal. It sounded important when I signed, and it means I hold the shovel and the blame." } },
    advice = { { id = "tp_ad", text = "Read the brochure carefully, pal, and then assume everything it doesn't mention wants to eat you and isn't covered." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, pal. I've been in this crater so long I've forgotten what the rest of the world looks like, and what a decent wage looks like too." } },
  },
}
