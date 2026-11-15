-- Smith Argus, Journeyman Blacksmith, Goldshire. Voice: bibles/argus.md
-- The askabout spec pins him as a named NPC with no `background` or `trade` of his own:
-- keep those two topics off him.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "argus", id = TODO_NPC("Smith Argus"), name = "Smith Argus", title = "Journeyman Blacksmith",
  bible = "bibles/argus.md", role = "blacksmith", tier = "service",
  communities = { "goldshire" }, temper = { "proud" },
  notices = { "kit", "craft" },
  impression = {
    first = "Before Smith Argus looked at my face, he looked at my armor, and he plainly found it wanting. He mends what's bent and makes what's needed, and he doesn't pretend to work miracles.",
    third = "{name} met Smith Argus, a blacksmith who judges people by the state of their armor and rarely approves.",
  },

  greetings = {
    { id = "g_anvil", text = "Careful there, the anvil's still hot." },
    { id = "g_begging", when = { durability = { max = 0.35 } }, text = "That armor's begging. I can hear it from here." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Come to see how it's done?" },
  },

  notice = {
    { id = "n_broken", cat = "kit", place = "before", when = { durability = { max = 0.2 } },
      text = "Don't say a word. Take that off and let me look. Light's sake, what did you wrestle?" },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "No armor at all. That's either brave or foolish, and I've seen how both end." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Those are smith's hands, calloused in all the right places. Who taught you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Argus. I mend what's bent and make what's needed, but I don't do miracles." },
        { id = "q_elmore", when = { questActive = TODO_QUEST("Elmore's Task") },
          text = "Grimand Elmore, the dwarf in Stormwind's Dwarven District. Best weaponsmith in the city, and he knows it. Help him with his delivery. We need the dwarves." },
        { id = "q_verner", tags = { "news" }, when = { questActive = TODO_QUEST("The Price of Shoes") },
          text = "A note from Verner, of course. He wants shoes and he wants them yesterday, and he'll get them, so don't tell him I didn't complain." },
        { id = "q_verner_back", when = { questActive = TODO_QUEST("Return to Verner") },
          text = "Take those up to Lakeshire. Tell Verner they're the best shoes he'll see this year. He'll say his are better. He's wrong." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Go on, say it. Every dwarf who walks past my forge says it." },
        { id = "h_deaf", when = { metBefore = true },
          text = "Eh? Speak up, the anvil's had my good ear for years, and the other one's only for show." },
        { id = "h_plate", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 20 },
          text = "Now that's plate that's been somewhere, dented in all the honest places. Whoever mended it last knew their trade, nearly as well as me." },
      },
      again = {
        { id = "h_again", text = "What else? Talk over the hammer and I'll catch most of it." },
        { id = "h_again2", text = "Eh? Something else, was it? Go on and say it louder." },
      },
      choices = {
        { text = "Let's see what you have.", next = "BUSINESS" },
        { text = "What makes good steel?", next = "steel" },
        { text = "Who are all these horseshoes for?", next = "shoes" },
        { text = "Your quench is too fast.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Can a priest learn anything at a forge?", next = "priest", when = { class = "PRIEST" } },
        { text = "Just looking.", next = "END" },
      },
    },
    steel = {
      lines = { { id = "s_default", key = true, text = "Patience and clean ore, and never letting the apprentice near the quench." } },
      choices = {
        { text = "What's wrong with the apprentice?", next = "steel_apprentice" },
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Sounds slow.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    steel_apprentice = {
      lines = { { id = "sa_default", text = "Nothing, until he's in a hurry. A hurried quench cracks a blade where you'll never see it, and then it breaks in a fight, with my name on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    shoes = {
      lines = {
        { id = "sh_default", text = "Verner Osgood, in Lakeshire. He spent his iron outfitting the Stormwind Guard over there, and now his horses go barefoot, so he wants fifty shoes." },
      },
      choices = {
        { text = "Is he paying for them?", next = "shoes_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shoes_pay = {
      lines = { { id = "sp_default", text = "He will when he reads the note I'm nailing to the crate. Verner thinks friendship's a currency, and it is, just not mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "There it is, from every one of you: too fast, too cold, too human. I'll tell you what I tell them, which is show me your blade, then tell me about mine." } },
      choices = {
        { text = "Fair. Yours is good, for a human.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Mine's better.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Same as anyone. Heat, patience, and knowing when something can't be mended. You'd know that last one better than me, I'd guess." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Get your armor mended before it's broken, not after, because broken costs more, and dead costs most of all." } },
    defias = { { id = "t_defias", text = "They don't buy steel, they take it. Somebody's arming them, and it isn't me." } },
    kobolds = { { id = "t_kobolds", text = "Kobold picks are terrible steel. I melt them down for nails." } },
    _none = { { id = "t_none", text = "Ask me about iron and I'll talk all day, but that I couldn't say." } },
  },
}
