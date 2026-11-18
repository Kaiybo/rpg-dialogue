-- The Emerald Circle at the Emerald Sanctuary: Taronn Redfeather (tauren druid, the craters of Shatter Scar Vale)
-- and Kelek Skykeeper (night elf druid who knows the furbolgs).
-- Voice: bibles/emerald_circle.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kelek Skykeeper
---------------------------------------------------------------------------
P:NPC {
  key = "kelek", id = TODO_NPC("Kelek Skykeeper"), name = "Kelek Skykeeper", title = "Emerald Circle",
  bible = "bibles/emerald_circle.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "dry", "patient" }, values = { "curious", "wise" },
  notices = { "timbermaw" },

  impression = {
    first = "Kelek Skykeeper is a night elf druid of the Emerald Circle who has spent more time among furbolgs than among his own people. He reads furbolg scratchings the way other scholars read old scrolls.",
    third = "{name} met Kelek Skykeeper, an Emerald Circle druid at the Emerald Sanctuary who knows the furbolg tribes better than anyone.",
  },

  greetings = {
    { id = "g_default", text = "If you've come from the north, you'll have met furbolgs. Tell me which ones, and whether they were drunk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I've been reading a furbolg's handwriting all morning, and I'm glad of a face that isn't covered in fur." },
    { id = "g_log", when = { questDone = TODO_QUEST("Words of the High Chief") }, text = "I'm still working through that log you brought me. The High Chief's spelling is a punishment of its own." },
  },

  notice = {
    { id = "n_timbermaw", cat = "timbermaw", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } },
      text = "You smell of Timbermaw Hold, of pine smoke and honey. They don't let many outsiders that close, so you must have done them a great kindness." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kelek Skykeeper of the Emerald Circle. While the others tend trees, I tend the furbolgs, or try to: the Timbermaw who still think clearly, the Deadwood who don't, and the Winterfall up in Winterspring, who are getting worse every season." },
        { id = "h_ready", when = { questActive = TODO_QUEST("Words of the High Chief") },
          text = "Donova Snowden sent you? Then that must be the log she wrote me about. Give it here, and let's see what the Winterfall's High Chief has been writing to himself." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Words of the High Chief"), days = 3 } },
          text = "The log is worse than I feared. Someone has been teaching the Winterfall to brew that firewater, and it isn't a furbolg, because no furbolg I know could write a recipe that precise." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! Good, then I don't have to explain why I'd rather talk to a furbolg than an archdruid. The furbolgs were the first of Cenarius's children to trust us, and look what has become of them." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've an hour before the light goes and I can't read." },
        { id = "h_again2", text = "Go on. I'm a better listener than the furbolgs, at least." },
      },
      choices = {
        { text = "What's wrong with the Winterfall?", next = "winterfall" },
        { text = "Tell me about the Timbermaw.", next = "timbermaw" },
        { text = "Why do the Deadwood attack everyone?", next = "deadwood" },
        { text = "What's in the log I brought you?", next = "log", when = { questDone = TODO_QUEST("Words of the High Chief") } },
        { text = "The Timbermaw call me friend now.", next = "friend", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "Furbolgs were Cenarius's children?", next = "cenarius", when = { race = "NightElf" } },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },

    winterfall = {
      lines = { { id = "wf_default", text = "They drink, and the drink makes them mad. It's a firewater they brew in their camps in Winterspring, and it smells of something that has never grown in any forest I know, which is why Donova Snowden has been sending me every scrap she can find." } },
      choices = {
        { text = "Who's Donova Snowden?", next = "wf_donova" },
        { text = "Something is making them brew it?", next = "wf_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wf_donova = {
      lines = { { id = "wfd_default", text = "A Cenarion druid who keeps watch over the Winterfall from the hot springs in Winterspring. She's braver than I am, and she writes better letters, too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wf_who = {
      lines = { { id = "wfw_default", text = "That's my fear. The Felwood furbolgs fell because the land itself was poisoned, but Winterspring's snow is still clean, so the Winterfall had help. If there's a hand behind them, I'd like to know whose before it reaches for the Timbermaw too." } },
      choices = {
        { text = "Demons, then?", next = "wf_demons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wf_demons = {
      lines = { { id = "wfde_default", text = "I won't say it until I can prove it, because a druid who sees demons behind every tree soon stops being listened to. But I've seen what demons did here, and the shape of it feels very familiar." } },
      choices = { { text = "I'll keep my eyes open.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    timbermaw = {
      lines = { { id = "tm_default", text = "The last tribe still in its right mind, or near enough. They hold the tunnels between Felwood and Winterspring and they trust nobody, which has kept them alive. Win their trust, and you can walk through the mountain as a friend instead of a meal." } },
      choices = {
        { text = "How do I win their trust?", next = "tm_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tm_trust = {
      big = true,
      lines = { { id = "tmt_default", text = "By killing Deadwood, mostly, which is a sad thing to say about a people I love. Nafien and Grazle at the hold will take the feathers and beads as proof, and the Timbermaw count every one." } },
      choices = {
        { text = "The Deadwood are lost. Ending them is mercy.", next = "tm_mercy", fx = { align = { light = -1 } } },
        { text = "I'll fight them, but I won't call it mercy.", next = "tm_mercy", fx = { align = { light = 1 } } },
        { text = "Is there no cure for them?", next = "tm_mercy" },
      },
    },
    tm_mercy = {
      lines = { { id = "tmm_default", text = "If there's a cure, the Circle hasn't found it, and I've looked harder than most. So I write down everything I learn about them, so that someday, when there is a cure, someone will remember who they used to be." } },
      choices = {
        { text = "That's a kind thing to do.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    deadwood = {
      lines = { { id = "dw_default", text = "Because the corruption got into them through the water and the wood, and it took everything except their anger. They used to be a gentle tribe, and that's the part I find hardest, that the gentlest fell first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    log = {
      lines = { { id = "lg_default", text = "Boasts, mostly, and tallies of firewater barrels, and a great many words I'm still guessing at. But the High Chief writes about a gift, and about a voice that taught his shamans the recipe, and I don't like either of those words." } },
      choices = {
        { text = "Who could the voice be?", next = "wf_demons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friend = {
      lines = { { id = "fr_default", text = "Then you've done what most of the Circle never manages. Go to the hold and let them feed you honey, and don't refuse it, because a Timbermaw takes a refused meal very personally." } },
      choices = { { text = "I'll eat the honey, then.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    cenarius = {
      lines = { { id = "ce_default", text = "So the old stories say, and the furbolgs say it too, in their way. Cenarius loved them, and they guarded the forests for him long before our people built a single temple, and I think we owe them more than we ever paid." } },
      choices = {
        { text = "Then we should pay it now.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Furbolgs, mostly: the Timbermaw, the Deadwood, the Winterfall, and the firewater." } },
    background = { { id = "tp_bg", text = "A druid of the Emerald Circle who prefers furbolgs to people, and doesn't apologize for it.", next = "timbermaw" } },
    advice = { { id = "tp_ad", text = "If a furbolg offers you honey, take it. If it offers you firewater, run." } },
    furbolgs = { { id = "tp_furb", text = "Ask me anything about them. I've spent forty years learning, and I'm still a beginner." } },
    cenarion_circle = { { id = "tp_cc", text = "The Emerald Circle answers to Moonglade, though Moonglade rarely sends anything but advice." } },
    _none = { { id = "tp_none", text = "That's outside my furbolgs, friend. Ask one of the others." } },
  },
}
