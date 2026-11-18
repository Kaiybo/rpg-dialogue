-- Silverpine folk an earlier pass missed: Guillaume Sorouy at the Sepulcher's forge, Killian Sanatha on the
-- Lordamere dock, and Leo Sarn in the hills by the Greymane Wall. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Guillaume Sorouy: Blacksmithing Trainer, the Sepulcher.
P:NPC {
  key = "guillaume_sorouy", id = TODO_NPC("Guillaume Sorouy"), name = "Guillaume Sorouy", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "sepulcher" }, temper = { "gruff", "dry" }, values = { "craft", "practical" },
  notices = { "craft" },
  impression = {
    first = "Guillaume Sorouy works the forge at the Sepulcher with her sleeves pinned back over arms that are mostly bone. She hammers as though the iron owed her money, and she teaches the same way.",
    third = "{name} met Guillaume Sorouy, who teaches smithing at the Sepulcher in Silverpine.",
  },
  greetings = {
    { id = "g_default", text = "Stand clear of the sparks, {class}. I've one good apron left, and I don't mean to lose it to a gawper." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my forge, are you? Then either hand me those tongs or tell me what you want." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Those are a smith's burns on your knuckles. Good, because I can teach a smith, whereas all I can do with the others is sell them nails." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Guillaume Sorouy, and before you ask, it was my father's name and he had no sons. I keep the Sepulcher's blades sharp and its hinges hung, and I'll teach the trade to anyone with the patience for it." } },
      again = {
        { id = "h_again", text = "What else? The iron's cooling." },
        { id = "h_again2", text = "Talk while I work, then." },
      },
      choices = {
        { text = "What does the Sepulcher need forged?", next = "need" },
        { text = "Can the dead still work a forge?", next = "dead" },
        { text = "Where does your iron come from?", next = "iron" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Sword blades for the Deathguard, arrowheads by the bucket, and silver edging when the High Executor can find me any silver. The worgen out of Shadowfang don't care for it, so every scrap I'm given goes onto a blade." } },
      choices = {
        { text = "Silver truly hurts them?", next = "silver" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silver = {
      lines = { { id = "s_default", text = "So the old wives of Pyrewood always said, and the Deathstalkers swear by it now. I can't tell you whether it's the metal or the faith in it, but a guard who trusts his blade stands his ground longer, and that's worth the silver either way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dead = {
      lines = { { id = "d_default", text = "Better than the living, in two respects. I don't tire at the bellows, and when I burn myself I only notice by the smell." } },
      choices = { { text = "That's one advantage. Something else.", next = "BACK" } },
    },
    iron = {
      lines = { { id = "i_default", text = "From wherever I can get it, which is mostly the wrecked farms. Half the swords on this hill were plough blades and gate hinges two years ago, and I think they're doing more good now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father shod horses for half of Silverpine. I've his name, his hammer and his temper." } },
    worgen = { { id = "tp_wg", text = "Arugal's wolves, out of Shadowfang Keep. I put silver on a blade whenever there's silver to be had." } },
    _none = { { id = "tp_none", text = "If you can't heat it and hit it, I've no opinion on it." } },
  },
}

-- Killian Sanatha: Fisherman, on the Lordamere Lake dock near the Decrepit Ferry.
P:NPC {
  key = "killian_sanatha", id = TODO_NPC("Killian Sanatha"), name = "Killian Sanatha", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "north_tides_run" }, temper = { "calm", "dry" }, values = { "patient", "practical" },
  notices = { "craft" },
  impression = {
    first = "Killian Sanatha fishes from a rotting dock on Lordamere Lake and sells what he catches to anyone who walks out to him. He has the stillness of a man who has decided the lake is better company than the dead.",
    third = "{name} met Killian Sanatha, a Forsaken fisherman on the Lordamere Lake dock in Silverpine.",
  },
  greetings = {
    { id = "g_default", text = "Walk softly on the boards, {class}. They're as rotten as I am, and you'll frighten the fish besides." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The fish are no bigger than last time, if that's what you came to ask." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've line-cuts on your fingers, so you know the trade. Then you'll know better than to ask a man where he's had his best catch." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Killian Sanatha. I fished this lake when I was alive, and I fish it now, and of everything I used to do it's the only thing that feels the same." } },
      again = {
        { id = "h_again", text = "Something else? Keep your voice down, mind." },
        { id = "h_again2", text = "Go on, the line's not moving." },
      },
      choices = {
        { text = "Can you even eat what you catch?", next = "eat" },
        { text = "What's in the lake these days?", next = "lake" },
        { text = "There's another man who stands on this dock.", next = "fenwick" },
        { text = "Good fishing to you.", next = "END" },
      },
    },
    eat = {
      lines = { { id = "e_default", text = "I can, though it tastes of nothing much, like everything else. I sell most of it to the Sepulcher, where the living allies of the Dark Lady still have stomachs that complain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lake = {
      lines = { { id = "l_default", text = "Fewer fish and more murlocs every season, and things on the island at Fenris Keep that I don't row near. The Dalaran wizards have the far shore, and whatever they pour into the water isn't helping." } },
      choices = {
        { text = "What's on Fenris Isle?", next = "fenris" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fenris = {
      lines = { { id = "f_default", text = "Gnolls that the Scourge raised and left behind, with an ogre mage ruling them, or so the Deathguard say. I can hear them howling across the water at night, and it's a sound that carries a long way over a still lake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fenwick = {
      lines = { { id = "fw_default", text = "Fenwick Thatros, he calls himself. He comes and stands at the end of the boards and watches the road, and he's never once asked the price of a fish, so I don't ask him his business either." } },
      choices = { { text = "A sensible arrangement. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Lordamere fisherman, as my father was. The plague took the village and left me the lake." } },
    _none = { { id = "tp_none", text = "I couldn't say. Not much news comes out along a dock." } },
  },
}

-- Leo Sarn: Enchanting Supplies, in the hills north-east of the Greymane Wall.
P:NPC {
  key = "leo_sarn", id = TODO_NPC("Leo Sarn"), name = "Leo Sarn", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "silverpine_wilds" }, temper = { "precise", "wry" }, values = { "curious", "careful" },
  notices = { "arcane" },
  impression = {
    first = "Leo Sarn sells enchanter's rods and dusts from a camp in the hills above the Greymane Wall, about as far from any customer as a merchant could get. He says the quiet suits the work, and he looked annoyed to be found.",
    third = "{name} met Leo Sarn, a Forsaken who sells enchanting supplies in the hills near the Greymane Wall.",
  },
  greetings = {
    { id = "g_default", text = "A customer, all the way up here? You're either a very determined enchanter or very lost, {class}, and I can only help with the first." },
    { id = "g_back", when = { metBefore = true }, text = "You found the path again. I really must make it harder to follow." },
  },
  notice = {
    { id = "n_ench", cat = "arcane", when = { profession = "Enchanting" },
      text = "There's dust under your fingernails that glows a little, so you're one of the craft. Good, because I shan't have to explain what a rod is for." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Leo Sarn, purveyor of rods, vials and such dusts as I can spare. I keep my stock up here because enchanting is delicate work, and the Sepulcher is full of people who slam doors." } },
      again = {
        { id = "h_again", text = "Was there something more?" },
        { id = "h_again2", text = "Ask, but do mind the vials." },
      },
      choices = {
        { text = "Why camp so close to the Greymane Wall?", next = "wall" },
        { text = "Isn't it dangerous out here alone?", next = "danger" },
        { text = "Who buys from you?", next = "buys" },
        { text = "I'll let you have your quiet.", next = "END" },
      },
    },
    wall = {
      lines = { { id = "w_default", text = "Because nobody comes here, and nobody comes here because of the wall. Gilneas shut its gates on the rest of us years before the plague, and nothing has come through them since, not a trader nor a refugee nor a word." } },
      choices = {
        { text = "What do you think is behind it?", next = "behind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    behind = {
      lines = { { id = "b_default", text = "A kingdom of very smug people, I'd imagine, congratulating themselves on having missed everything. I do sometimes stand and look at it, and I've never seen so much as a watchman on the top." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "The worgen keep to the north around Shadowfang, and the Dalaran mages keep to Ambermill, and neither has taken an interest in one dead shopkeeper. If they do, I've a few enchantments on the tent that would make them regret it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buys = {
      lines = { { id = "by_default", text = "The Sepulcher sends a runner when its enchanters run short, and now and then one of the Dark Lady's allies climbs up for a rod. It's not a brisk trade, but my expenses are small, since I've stopped eating." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a shop of curiosities in Lordaeron once. The curiosities survived the plague rather better than I did." } },
    gilneas = { { id = "tp_gil", text = "Shut behind the Greymane Wall since before the plague. Nobody goes in, and nobody has come out." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't something I stock, in goods or in knowledge." } },
  },
}
