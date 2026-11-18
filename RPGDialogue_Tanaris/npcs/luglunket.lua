-- Spigot Operator Luglunket, Gadgetzan Water Co. (0.72.0). Voice: bibles/luglunket.md
-- Relentlessly cheerful company goblin; buys back stolen water one pouch at a time. Huzzah!
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "luglunket", id = TODO_NPC("Spigot Operator Luglunket"), name = "Spigot Operator Luglunket",
  title = "Gadgetzan Water Co.",
  bible = "bibles/luglunket.md", role = "worker", tier = "quest",
  communities = { "gadgetzan" }, temper = { "cheerful", "eager" }, values = { "dutiful", "profit" },
  notices = { "weary", "craft" },
  impression = {
    first = "Spigot Operator Luglunket of the Gadgetzan Water Company says huzzah without irony and means every word of the company slogan. He buys back stolen water pouches as if each one were the town's last.",
    third = "{name} met Spigot Operator Luglunket of the Gadgetzan Water Company, who pays for water pouches taken back from the Wastewanderers.",
  },

  greetings = {
    { id = "g_default", text = "Greetings from the Gadgetzan Water Company, where every drop counts! Huzzah!" },
    { id = "g_pouch", when = { questActive = TODO_QUEST("Water Pouch Bounty") }, text = "Got the five pouches, pal? If you do, a Care Package, Model 103-XB, is yours, courtesy of the Company and its very generous reclamation program!" },
    { id = "g_pouch_done", when = { questDone = TODO_QUEST("Water Pouch Bounty") }, text = "My best supplier! Keep 'em coming, buddy, and I'll keep the care packages coming right back, by the book, one per five." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, friend, and the town's drunk a lake's worth of water since, every drop billed. Well, a pond's worth, or a puddle if we're bein' precise, but a profitable puddle." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folks say you've been helping Gadgetzan help itself, which is our motto! Well, one of them." },
  },

  notice = {
    { id = "n_thirsty", cat = "weary", when = { resSick = true },
      text = "You look parched, friend, and pale besides. Drink something, and if it's our water, all the better, because that's a sale and a rescue at once!" },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! If you ever want to see a spigot assembly up close, pal, I've got three, and I polish them on my lunch, which is unpaid, but worth it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The name's Luglunket, seasoned spigot operator, and I keep the water flowing to every thirsty soul in Gadgetzan at very reasonable Company rates. It's not glamorous, but without me this town is a sandbox with a bank in it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Water Pouch Bounty") },
          text = "Nothing would please me more than to take any Wastewander water pouches you find out in the desert, pal. That's our water anyway, Company property, and the nomads have just stolen it, is all!" },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Water Pouch Bounty") },
          text = "Five pouches gets you an official Water Company care package, and you're helping Gadgetzan help itself. Huzzah!" },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Water Pouch Bounty"), days = 2 } },
          text = "The more pouches we reclaim, the further away from disaster we all are, and the better the quarterly figures look! I sleep better knowing you're out there, and I sleep on a water tank, so that's saying something." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll! The Sandfury out west don't care for our pumps, but I'm sure you're nothing like them, being a paying customer." },
      },
      again = {
        { id = "h_again", text = "Anything else, pal? The spigots can wait a minute. Well, thirty seconds, because the Company docks me for drips." },
        { id = "h_again2", text = "Ask away, friend! The Water Company values your questions." },
      },
      choices = {
        { text = "Where does Gadgetzan's water come from?", next = "source" },
        { text = "Does the Company reward folk who help?", next = "package" },
        { text = "Who would steal water out here?", next = "bandits" },
        { text = "Do you ever stop saying huzzah?", next = "huzzah" },
        { text = "Show me those spigots.", next = "spigots", when = { profession = "Engineering" } },
        { text = "The water could just be shared, Luglunket.", next = "share", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Keep up the good work.", next = "END" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Waterspring Field, out past the town, where the Water Company's pumps pull it up from deep under the sand at tremendous cost. The Chief Engineer designs the pumps, the surveyors find the water, and I make sure it comes out the right end and into the right bucket." } },
      choices = {
        { text = "Is there enough to go round?", next = "source_enough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source_enough = {
      lines = { { id = "se_default", text = "Officially, yes, absolutely, and you may quote me! Unofficially, every pouch the bandits take is a pouch some poor goblin in town doesn't get, and a pouch nobody pays for, so we watch every drop." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    package = {
      lines = { { id = "p_default", text = "It does, with the Gadgetzan Water Company Care Package, Model 103-XB, and I'm not allowed to tell you what's inside before you've earned one. Company policy, friend, but I can tell you it's very well wrapped." } },
      choices = {
        { text = "What happened to Models 1 through 102?", next = "package_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    package_old = {
      lines = { { id = "po_default", text = "Let's just say there was an incident with Model 47, a small one, mostly smoke, and we don't talk about Model 47. Next question!" } },
      choices = { { text = "Now I have to know.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    bandits = {
      lines = { { id = "b_default", text = "The Wastewanderers, pal, because out here a full waterskin buys more than a purse of gold, and they'd rather take ours than pay for it. They raid the pumps, steal what they can carry, and leave us the bill." } },
      choices = {
        { text = "Maybe they're just thirsty too.", next = "bandits_stance" },
        { text = "Then they should be stopped.", next = "bandits_stance" },
      },
    },
    bandits_stance = {
      big = true,
      lines = { { id = "bs_default", text = "Everybody's thirsty in Tanaris, friend, and everybody else pays. If we let the bandits drink for free, the town goes dry, and then nobody drinks at all." } },
      choices = {
        { text = "Rules keep a town alive. Make them pay.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Water should never be a business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    huzzah = {
      lines = { { id = "hz_default", text = "Stop? Why would I stop? Huzzah is in my contract, friend, right under the bit about not drinking the merchandise, and I read every clause." } },
      choices = { { text = "Huzzah, then.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    spigots = {
      lines = { { id = "sp_default", text = "Brass seat, double gasket, quarter-turn valve, and a pressure gauge the Chief Engineer says I'm not to tap however much I want to. Isn't she beautiful?" } },
      choices = { { text = "She's very beautiful, Luglunket.", next = "BACK", fx = { affinity = 2 } } },
    },
    share = {
      lines = { { id = "sh_default", text = "Shared? It is shared, friend, at very reasonable rates! Somebody has to pay for the pumps, and if it isn't the customers, it's the pumps that go without, and then everyone does." } },
      choices = { { text = "I suppose that's one way to see it.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Water Company goblin, born and bred, and seasoned spigot operator these many years on a steady wage. I'm living the dream, friend, and the dream is damp." } },
    advice = { { id = "tp_ad", text = "Carry more water than you think you need, and buy it from us. That's two pieces of advice for the price of one!" } },
    steamwheedle = { { id = "tp_sw", text = "Gadgetzan's the Cartel's jewel, and the Water Company's the reason it sparkles. That's not official, but it should be." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's water is the best in Tanaris, friend, because it's the only water in Tanaris. The Water Company keeps it flowing, huzzah." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak curse our wells, friend, and steal our pouches, and the Water Company takes a very dim view of it. Every pouch you bring back is a victory, huzzah." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's got all the water it wants from the sea, friend, but it's salty. Gadgetzan's water is fresh, and that's worth paying for, huzzah." } },
    _none = { { id = "tp_none", text = "That's above my pay grade, friend, and my pay grade is spigots. Try the Chief Engineer, though he'll want a work order!" } },
  },
}
