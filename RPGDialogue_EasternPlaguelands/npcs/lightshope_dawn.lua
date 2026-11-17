-- Light's Hope: Quartermaster Miranda Breechlock, the dwarf who keeps the Argent Dawn's stores and won't
-- open them to anyone the Dawn hasn't learned to trust. Voice: bibles/lightshope_dawn.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "miranda_breechlock", id = TODO_NPC("Quartermaster Miranda Breechlock"), name = "Quartermaster Miranda Breechlock",
  title = "The Argent Dawn",
  bible = "bibles/lightshope_dawn.md", role = "vendor", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "brisk", "gruff" }, values = { "dutiful", "practical" },
  notices = { "status", "race", "kit" },

  impression = {
    first = "Quartermaster Miranda Breechlock keeps the Argent Dawn's stores at Light's Hope and keeps them shut to anyone the Dawn doesn't know. She counts everything twice, and she told me so as a warning.",
    third = "{name} met Quartermaster Miranda Breechlock, the dwarf who keeps the Argent Dawn's stores at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "Quartermaster's stores. If ye're here tae browse, ye can browse wi' yer eyes, because the Dawn's goods are for the Dawn's friends." },
    { id = "g_stranger", when = { reputation = { faction = "Argent Dawn", max = "neutral" } }, text = "I don't know yer face, an' neither does the Dawn yet. Bring in some scourgestones, help the officers, an' come back when they've heard yer name." },
    { id = "g_honored", when = { reputation = { faction = "Argent Dawn", min = "honored" } }, text = "There's a face the officers speak well of! Come in, come in, an' see what the chapel can spare for ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, my ledger likes regular customers. It's the irregular ones that make it twitch." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' still in one piece! Ye'd be amazed how many I stop seein' after a fortnight out there." },
  },

  notice = {
    { id = "n_revered", cat = "status", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
      text = "Revered by the Dawn, are ye? Then ye'll be wantin' tae hear about the mantles, I'd wager." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' mine, all this way from the mountain! Ye'll have smelt the chapel's ale already, so I'll say no more." },
    { id = "n_broken", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer kit's in tatters, an' I don't sell repairs, so take it tae the smith before it falls off ye in front o' a ghoul." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Miranda Breechlock, quartermaster tae the Argent Dawn. Every bandage, every potion an' every bolt o' cloth in this chapel goes through my hands an' into my ledger, an' none of it goes out tae strangers." },
        { id = "h_mantle", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
          text = "The officers say ye're revered among us now, an' that means I can offer ye the mantles, if ye bring me ten valor tokens as a sign o' faith. It's no' the price that matters; it's what payin' it says about ye." },
        { id = "h_mantle_done", when = { questDone = TODO_QUEST("Mantles of the Dawn") },
          text = "Ye've paid yer tribute, an' yer name's in the book, so any quartermaster o' the Dawn will sell ye a mantle while ye keep yer standin'. Mind ye keep it." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Aye, I'll serve ye, if the Dawn knows ye. There's Forsaken in our ranks an' they fight as hard as any, though I'll admit it took me a while tae stop reachin' for my axe." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The ledger's waitin', an' it's no' a patient book." },
        { id = "h_again2", text = "Ask away, but quick. There's a cart o' bandages tae count before dark." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why won't you sell to strangers?", next = "strangers" },
        { text = "What are the mantles of the Dawn?", next = "mantles", when = { reputation = { faction = "Argent Dawn", min = "honored" } } },
        { text = "How does a dwarf end up at Light's Hope?", next = "how" },
        { text = "What does the chapel run short of?", next = "short" },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    strangers = {
      big = true,
      lines = { { id = "st_default", text = "Because the Crusade sends spies, an' the Cult sends worse, an' I've seen what both would do wi' a crate o' our holy water. Earn the Dawn's trust first, an' my door's open; that's fair, an' it keeps the chapel standin'." } },
      choices = {
        { text = "That's sensible. Trust has to be earned.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hoarding supplies while folk die isn't sensible. It's cold.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },

    mantles = {
      lines = { { id = "mn_default", text = "Enchanted mantles for yer shoulders, tae turn aside fire, frost, shadow, nature or the arcane. Once the Dawn reveres ye, bring me ten valor tokens as a sign o' faith, an' I'll sell ye whichever ye need." } },
      choices = {
        { text = "Why ask for tokens on top of reputation?", next = "mantles_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mantles_why = {
      big = true,
      lines = { { id = "mw_default", text = "Because standin' is somethin' the Dawn gives ye, an' the tokens are somethin' ye give back. A body that won't give back isn't one I'd trust wi' the chapel's best enchantments." } },
      choices = {
        { text = "Fair. Service should cost something.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sounds like a tithe dressed up as a test.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    how = {
      lines = { { id = "hw_default", text = "I kept the stores for a dwarven company that marched north tae help Lordaeron, an' when Lordaeron was gone an' the company wi' it, I found I couldnae go home an' sit by a fire. The Dawn needed somebody who could count, so here I am." } },
      choices = {
        { text = "You lost your company?", next = "how_company" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_company = {
      lines = { { id = "hc_default", text = "Most o' them, aye, at Andorhal or near it. I count bandages now instead o' graves, an' I find I prefer it, though some nights the numbers look the same." } },
      choices = {
        { text = "I'm sorry for your loss, quartermaster.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    short = {
      lines = { { id = "sh_default", text = "Everythin', always, but holy water an' linen most of all. The Scourge never runs out o' bodies, an' we never run out o' wounds tae wrap, so if ye see Jase Farlane, tell him I want my linen." } },
      choices = {
        { text = "I'll pass the message on.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Quartermaster tae a company that's gone, an' now tae the Dawn. I keep the stores; that's the whole o' me." } },
    argent_dawn = { { id = "tp_ad", text = "Folk o' every race, fightin' the Scourge together, an' every one o' them needin' bandages. I'm proud tae keep their stores." } },
    _none = { { id = "tp_none", text = "If it's no' in my ledger, I don't know it. Try Lord Tyrosus." } },
  },
}
