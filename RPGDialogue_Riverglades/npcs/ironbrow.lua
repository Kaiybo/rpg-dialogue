-- Foreman Bertrand Ironbrow, who keeps Farholde's walls standing. Voice: bibles/ironbrow.md
-- A dwarf mason among horsemen: practical, proud of his stone, and rude about everyone else's.
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ironbrow", id = TODO_NPC("Bertrand Ironbrow"), name = "Bertrand Ironbrow", title = "Foreman",
  bible = "bibles/ironbrow.md", role = "worker", tier = "service",
  communities = { "farholde", "brotherhood_horse" }, temper = { "gruff" }, values = { "practical", "proud" },
  notices = { "race", "craft" },
  impression = {
    first = "Bertrand Ironbrow keeps Farholde's walls standing and talks about mortar the way other men talk about family. He grumbles about the humans' building, and he's never once thought of leaving them.",
    third = "{name} met Foreman Bertrand Ironbrow, the dwarf who keeps the walls of Farholde Keep in repair.",
  },

  greetings = {
    { id = "g_wall", text = "Don't lean on that, {g:lad|lass}, it's still setting. Lean on the old bit; it's held through worse than you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Grab a trowel if ye're staying, I've no use for spectators." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, and I've repointed the whole north face in that time. Go and look; I'll wait." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've filled out since I first saw ye wandering round my scaffolds. Built solid now, like a good wall." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk round the keep say ye've been pulling your weight. That's the only praise a mason gives, so take it." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Thank the Titans, somebody who knows what a proper footing looks like. Come and tell these horsemen their stables are sinking." },
    { id = "n_smith", cat = "craft", when = { any = { { profession = "Blacksmithing" }, { profession = "Mining" } } },
      text = "Ye've stone dust or forge soot on ye, I can't tell which. Either way, ye're welcome on my scaffold." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Bertrand Ironbrow, foreman. The Brotherhood ride out and fight, and I keep the walls up behind them, so there's somewhere to ride home to." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Don't touch the scaffolding, don't improve the scaffolding, and for pity's sake don't put a motor on the scaffolding." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } },
          text = "A fighter. Ye'll be off to Twilight's Shroud with the rest of them, I expect, and I'll be here fixing whatever they knock down while ye're gone." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Working late, aye. Mortar doesn't care if it's dark, and neither do the Hammer's raiders, so the wall gets done when the wall gets done." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I work; I can do both." },
        { id = "h_again2", text = "Go on, then. The wall's listening too, and it's heard worse." },
      },
      choices = {
        { text = "How did a dwarf end up in Farholde?", next = "how" },
        { text = "How do the walls hold up?", next = "walls" },
        { text = "What happened during the siege?", next = "siege" },
        { text = "Ironforge would build it differently, wouldn't it?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    how = {
      lines = { { id = "ho_default", text = "Same as Thaddeus, more or less: came for a job and stayed for the company, and the company keeps needing walls. Ironforge has a thousand masons; Farholde has me, and that's a better count for a craftsman." } },
      choices = {
        { text = "Do you miss the mountain?", next = "how_miss" },
        { text = "Something else, Bertrand.", next = "BACK" },
      },
    },
    how_miss = {
      lines = { { id = "hm_default", text = "Every time it rains, which here is daily. But the Brotherhood treat me like one of their own, horse or no horse, and a dwarf could do a lot worse than be wanted." } },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    walls = {
      lines = { { id = "wa_default", text = "Badly, because they were thrown up in a hurry by frightened folk who'd never laid a course in their lives. I've been replacing them a stone at a time for years, and I'm about halfway." } },
      choices = {
        { text = "What's the weakest point?", next = "walls_weak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walls_weak = {
      lines = { { id = "ww_default", text = "The water side, always has been. The gate gets the attention, but it's the shore where the trouble came last time, and I don't intend to let it come that way twice." } },
      choices = {
        { text = "Should the keep spend more on the shore, then?", next = "walls_spend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walls_spend = {
      big = true,
      lines = { { id = "ws_default", text = "Should, aye, but there's never enough of anything, and Demar would rather buy steel than stone. I can't say he's wrong, only that steel doesn't keep the water out." } },
      choices = {
        { text = "Walls first. A keep that stands can always fight.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Steel first. Take the fight to the enemy.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    siege = {
      lines = { { id = "si_default", text = "The Horde hammered the front gate, and while every eye was there, they came round by the water and burned the ships at the docks. Nobody got out and no word went for help, and we sat on half rations till the Brotherhood rode out and broke them." } },
      choices = {
        { text = "Were you here for it?", next = "siege_here" },
        { text = "Something else.", next = "BACK", fx = { learn = { "siege_of_farholde" } } },
      },
    },
    siege_here = {
      lines = { { id = "sh_default", text = "No, I came after, when they were still finding arrowheads in the mortar. That's how I got the job; the old walls told me everything that went wrong just by the way they'd cracked." } },
      choices = {
        { text = "And you've been fixing it ever since.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dwarf = {
      lines = { { id = "dw_default", text = "Ironforge would dig the whole keep into a hill and laugh at the Horde from inside it. There's no hill here, only sand and stubbornness, so I build with what I've got." } },
      choices = {
        { text = "Sand and stubbornness. That's a dwarven motto.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A mason from Dun Morogh who followed the work south. I'll not bore ye with the rest; it's mostly mortar." } },
    advice = { { id = "tp_ad", text = "Check your footing before ye build anything, a wall or a friendship or a plan. Everything falls from the bottom." } },
    siege_of_farholde = { { id = "tp_siege", text = "They came by the water when everyone watched the gate. I build the shore wall twice as thick now, and I'll not apologize for it." } },
    brotherhood_horse = { { id = "tp_brother", text = "Good folk, terrible builders. They ride better than they lay stone, and thank the Titans for that, or I'd be out of work." } },
    _none = { { id = "tp_none", text = "No idea, {g:lad|lass}. Ask Ashe Amberhall; she knows everything and says it twice as fast as anyone." } },
  },
}
