-- Keeper Bel'dugur, collector of forbidden books in the Apothecarium. Voice: bibles/beldugur.md
-- Soft-spoken, acquisitive, and contemptuous of any scholar whose conscience stopped him short.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "beldugur", id = TODO_NPC("Keeper Bel'dugur"), name = "Keeper Bel'dugur",
  bible = "bibles/beldugur.md", role = "scholar", tier = "quest",
  communities = { "undercity", "apothecarium" }, temper = { "cold" }, values = { "ambitious", "curious" },
  notices = { "arcane", "lore" },
  impression = {
    first = "Keeper Bel'dugur collects the writings of dead mages and speaks of their consciences as a flaw. He was courteous to me in the way a man is courteous to a useful tool.",
    third = "{name} met Keeper Bel'dugur, who gathers forbidden books for the Apothecarium and certain parties among the Forsaken.",
  },

  greetings = {
    { id = "g_tool", text = "Knowledge is a tool, and a weapon, to anyone with the will to use it. Which are you here for?" },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I hope you've brought me something to read." },
    { id = "g_ur", when = { questActive = TODO_QUEST("The Book of Ur") }, text = "The Book of Ur is somewhere in Shadowfang Keep. Arugal's wolves won't be reading it, so I'd be grateful if you relieved them of it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. I've read four books in that time, and none of them was the one I wanted." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown more capable since we last spoke. Capability is the beginning of usefulness, so I approve." },
  },

  notice = {
    { id = "n_arcane", cat = "arcane", when = { class = { "MAGE", "WARLOCK" } },
      text = "You practise the arts, I see. Tell me, how far did your teachers let you go before they lost their nerve?" },
    { id = "n_lore", cat = "lore", when = { profession = "Enchanting" },
      text = "You carry the smell of dust and shattered essences. An enchanter, then, which means you've at least wondered what things are made of." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Keeper Bel'dugur. I gather the writings of those who came before us, Ur of Dalaran's above all, for certain parties among the Forsaken, so that we needn't repeat their mistakes, or their scruples." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Book of Ur") },
          text = "Shadowfang Keep holds a book I'd prize above most, the Book of Ur. Ur was a great mage of Dalaran before the Scourge came, and his studies of other worlds are of real value to certain parties among the Forsaken." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Book of Ur"), days = 7 } },
          text = "This will sit nicely with the rest of my collection of Ur's workings. His knowledge was great, but his conscience held him back, and when the Scourge came, his strength failed him." },
        { id = "h_mage", when = { class = "MAGE", race = "Scourge" },
          text = "One of Dalaran's, risen and free. You'll have been taught that some doors are not to be opened, and I'd be interested to know whether you still believe it." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "A warlock. You, at least, have already decided that the rules were written by the timid, and we'll get on well for it." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask; I don't promise to answer." },
        { id = "h_again2", text = "Go on. Questions are the cheapest form of knowledge, so I don't begrudge them." },
      },
      choices = {
        { text = "Who was Ur?", next = "ur" },
        { text = "You keep a strange collection here.", next = "collection" },
        { text = "Who are these \"certain parties\"?", next = "parties" },
        { text = "Some knowledge is forbidden for a reason.", next = "forbidden", when = { class = { "PRIEST", "PALADIN", "MAGE" } } },
        { text = "Do you have work for me?", next = "BUSINESS" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },

    ur = {
      lines = { { id = "ur_default", text = "A mage of Dalaran who looked beyond this world and wrote down what he saw. He studied the places past the edges, and then he stopped short, as good men do, and died with his best work unfinished." } },
      choices = {
        { text = "Shadowfang Keep seems an odd place for his book.", next = "ur_sfk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ur_sfk = {
      lines = { { id = "us_default", text = "Arugal was also of Dalaran, and he also looked past the edges, and he did not stop short. I expect he took Ur's work with him for the same reason I want it: to learn where Ur turned back." } },
      choices = {
        { text = "Arugal's experiments made the worgen.", next = "ur_arugal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ur_arugal = {
      big = true,
      lines = { { id = "ua_default", text = "Arugal lacked discipline, not courage, and the difference matters. The Forsaken cannot afford Ur's weakness if we are to survive, and if we are to conquer, we cannot afford Arugal's carelessness either." } },
      choices = {
        { text = "Knowledge with discipline, then. That I can respect.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Ur turned back for good reason. So should you.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    collection = {
      lines = { { id = "co_default", text = "Treatises, notebooks, a few letters their authors would rather had been burned. The apothecaries want recipes, and I want the reasons behind the recipes, which is a different hunger." } },
      choices = {
        { text = "May I read any of it?", next = "collection_read" },
        { text = "Something else.", next = "BACK" },
      },
    },
    collection_read = {
      lines = { { id = "cr_default", text = "Not yet. Bring me a book I don't already own, and we'll speak of borrowing privileges, but until then, my shelves are for those who've added to them." } },
      choices = {
        { text = "Then I'll find you one.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    parties = {
      lines = { { id = "pa_default", text = "Those who appreciate what Ur glimpsed, and who reward the people who bring it to them. You needn't know their names to be paid by them, and you'd be wise to prefer it that way." } },
      choices = {
        { text = "That sounds like something the Dark Lady should know about.", next = "parties_lady" },
        { text = "Something else.", next = "BACK" },
      },
    },
    parties_lady = {
      lines = { { id = "pl_default", text = "The Dark Lady knows what she needs to, and I'll report your service to her myself. Everything I do here, I do for the Forsaken; whether the Forsaken would always understand it is another question." } },
      choices = {
        { text = "I'll keep my questions to myself, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll be watching you, Keeper.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },

    forbidden = {
      lines = { { id = "fo_default", text = "Every reason I've ever heard comes down to fear, dressed in better clothes. The Scourge did not hesitate, and neither did the Lich King, and those who hesitated are why this city is full of the dead." } },
      choices = {
        { text = "Fear has kept a lot of people alive.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep books. What I was before I kept them doesn't merit a page." } },
    advice = { { id = "tp_ad", text = "Never let a scruple stop you halfway. Either don't begin, or finish." } },
    worgen = { { id = "tp_worgen", text = "Arugal's failure, walking on four legs. Instructive, if you study it rather than run from it." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages hoard knowledge they're too squeamish to use, and they keep it behind walls now while they rebuild. I've made a career of collecting what they left behind." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are brilliant, timid people who would rather debate a spell for a decade than cast it. Their dead are far more useful to me than their living." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal called the worgen into Silverpine to fight the Scourge when the Kirin Tor's courage failed, and the wolves ate him from the inside out. I find the whole affair very instructive." } },
    scholomance = { { id = "tp_scholomance", text = "The school at Caer Darrow teaches what Dalaran forbade, and it does so with appalling sloppiness. I'd study its library, given the chance, and then I'd burn it." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was the most gifted necromancer the Kirin Tor ever produced, and they expelled him for it. They're still paying for that mistake, which I find rather satisfying." } },
    _none = { { id = "tp_none", text = "Not a subject I've collected. Perhaps you'll bring me a book on it someday." } },
  },
}
