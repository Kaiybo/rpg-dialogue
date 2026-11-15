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

  greetings = {
    { id = "g_anvil", text = "Careful. Anvil's still hot." },
    { id = "g_begging", when = { durability = { max = 0.35 } }, text = "That armor's begging. I can hear it from here." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Come to see how it's done?" },
  },

  notice = {
    { id = "n_broken", cat = "kit", place = "before", when = { durability = { max = 0.2 } },
      text = "Don't say a word. Take that off and let me look. Light's sake, what did you wrestle?" },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "No armor at all. That's either brave or foolish, and I've seen how both end." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Smith's hands. Calloused in the right places. Who taught you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Argus. I mend what's bent and make what's needed. I don't do miracles." },
        { id = "q_elmore", when = { questActive = TODO_QUEST("Elmore's Task") },
          text = "Grimand Elmore, the dwarf in Stormwind's Dwarven District. Best weaponsmith in the city, and he knows it. Help him with his delivery. We need the dwarves." },
        { id = "q_verner", tags = { "news" }, when = { questActive = TODO_QUEST("The Price of Shoes") },
          text = "A note from Verner. Of course it is. He wants shoes, and he wants them yesterday. He'll get them. Don't tell him I didn't complain." },
        { id = "q_verner_back", when = { questActive = TODO_QUEST("Return to Verner") },
          text = "Take those up to Lakeshire. Tell Verner they're the best shoes he'll see this year. He'll say his are better. He's wrong." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Go on, say it. Every dwarf who walks past my forge says it." },
        { id = "h_deaf", when = { metBefore = true },
          text = "Eh? Speak up. The anvil's had my good ear for years. The other one's only for show." },
        { id = "h_plate", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 20 },
          text = "Now that's plate that's been somewhere. Dented in all the honest places. Whoever mended it last knew their trade. Nearly as well as me." },
      },
      again = {
        { id = "h_again", text = "What else? Talk over the hammer. I'll catch most of it." },
        { id = "h_again2", text = "Eh? Something else? Go on." },
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
      lines = { { id = "s_default", key = true, text = "Patience. Clean ore. And never letting the apprentice near the quench." } },
      choices = {
        { text = "What's wrong with the apprentice?", next = "steel_apprentice" },
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Sounds slow.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    steel_apprentice = {
      lines = { { id = "sa_default", text = "Nothing, until he's in a hurry. A hurried quench cracks a blade you'll never see crack. Then it breaks in a fight. Then it's my name on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    shoes = {
      lines = {
        { id = "sh_default", text = "Verner Osgood, in Lakeshire. He spent his iron outfitting the Stormwind Guard over there, and now his horses go barefoot. Fifty shoes, he wants." },
      },
      choices = {
        { text = "Is he paying for them?", next = "shoes_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shoes_pay = {
      lines = { { id = "sp_default", text = "He will when he reads the note I'm nailing to the crate. Verner thinks friendship's a currency. It is. Just not mine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "There it is. Every one of you. Too fast, too cold, too human. I'll tell you what I tell them: show me your blade, then tell me mine." } },
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
    advice = { { id = "tp_ad", text = "Get your armor mended before it's broken, not after. Broken costs more. Dead costs most." } },
    defias = { { id = "t_defias", text = "They don't buy steel, they take it. Somebody's arming them, and it isn't me." } },
    kobolds = { { id = "t_kobolds", text = "Kobold picks are terrible steel. I melt them down for nails." } },
    _none = { { id = "t_none", text = "Ask me about iron and I'll talk all day. That, I couldn't say." } },
  },
}
