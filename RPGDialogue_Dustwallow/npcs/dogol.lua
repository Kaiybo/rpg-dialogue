-- Do'gol, Brackenwall's ogre shieldmaker (0.72.0). Voice: bibles/dogol.md
-- Proud of his work, hates big spiders, reads a burned shield with too much acid.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dogol", id = TODO_NPC("Do'gol"), name = "Do'gol",
  bible = "bibles/dogol.md", role = "blacksmith", tier = "quest",
  communities = { "brackenwall" }, temper = { "gruff", "proud" }, values = { "craft", "honest" },
  notices = { "kit", "craft" },
  impression = {
    first = "Do'gol makes shields for Brackenwall and is prouder of them than of anything else in the village. He looks at a shield the way other ogres look at supper, and he hates big spiders.",
    third = "{name} met Do'gol, the ogre who makes shields in Brackenwall Village.",
  },

  greetings = {
    { id = "o_jaina_dist", when = { gossip = { topic = "jaina", stance = "distrust" } }, text = "Krog say you no trust the human lady. Do'gol no trust her either, but Do'gol trust a good shield, so you buy one, yes?" },
    { id = "g_default", text = "Do'gol is busy hitting metal, so you talk loud." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Black Shield") }, text = "You have the spider sacs? Do'gol is waiting, and the shield is waiting, and nobody likes waiting." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Black Shield") }, text = "Ah, the shield one. Did Krog find out who Mosarn is? Nobody tells Do'gol anything." },
    { id = "g_away", when = { away = 14 }, text = "You gone {away}, and Do'gol made eleven shields while you were gone. You did not make any, Do'gol thinks." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The others say good things about you, and Do'gol does not hear many good things in Brackenwall, so that is something." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Do'gol hears you push somebody around in the village. Do not push Do'gol, because Do'gol has a hammer." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor is falling off you in pieces, and Do'gol can hear it clank. Somebody should fix that before you die in it." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have smith's hands, Do'gol can see the burns. Small hands, but smith's hands." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Do'gol makes shields, good ones, big and heavy, for ogres and for anybody strong enough to lift them. Do'gol does not buy shields and does not sell them to fools." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Black Shield") },
          text = "Krog sends people to Do'gol when he finds a strange piece of metal, because Krog knows nothing about metal. Do'gol knows everything about metal." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Black Shield") },
          text = "There is writing on the rim of that black shield, but it is all burned over. Acid will clean it, and the darkmist spiders in the old mine northwest of here are full of acid." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Black Shield"), days = 3 } },
          text = "Maybe Do'gol used too much acid, but the name came up, and the smell is almost gone from Do'gol's hands. Mosarn, it said, and Do'gol never heard of him." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior! Then you know a shield is not for hiding behind, it is for hitting people with when the axe is busy." },
      },
      again = {
        { id = "h_again", text = "What else? The fire is hot and Do'gol should be hitting things." },
        { id = "h_again2", text = "Talk, then, but Do'gol keeps working while you talk, so stand back from the sparks, because Do'gol's last customer lost an eyebrow." },
      },
      choices = {
        { text = "What did the black shield tell you?", next = "shield", when = { any = { { questActive = TODO_QUEST("The Black Shield") }, { questDone = TODO_QUEST("The Black Shield") } } } },
        { text = "Most smiths here would rather make axes than shields.", next = "craft" },
        { text = "You don't like the spiders?", next = "spiders", when = { any = { { questActive = TODO_QUEST("The Black Shield") }, { questDone = TODO_QUEST("The Black Shield") } } } },
        { text = "Krog seems to have a lot on his mind.", next = "krog" },
        { text = "I'm a smith too. What's your secret?", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "What makes a good shield, for a warrior?", next = "warrior", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Goodbye, Do'gol.", next = "END" },
      },
    },
    shield = {
      lines = { { id = "s_default", text = "It is a good shield, heavy and strong, the kind Do'gol would make if Do'gol had better iron. Somebody important carried it, and somebody important dropped it in the burned inn, and that is all a shield can say by itself." } },
      choices = {
        { text = "Somebody important must have carried that shield.", next = "shield_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield_who = {
      lines = { { id = "sw_default", text = "Do'gol only reads metal, not people. The name on the rim says Mosarn, and Krog knows many people, so Krog can do the thinking and Do'gol will do the hitting." } },
      choices = {
        { text = "Is Brackenwall being blamed for the inn?", next = "shield_blame" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    shield_blame = {
      big = true,
      lines = { { id = "sb_default", text = "The humans say orcs burned it, and Krog says no orc did, and Do'gol believes Krog. Ogres do not burn inns, because ogres would eat what was inside first." } },
      choices = {
        { text = "Then the truth should be found, whoever it hurts.", next = "BACK", reply = "Do'gol thinks so too, but Do'gol is not good at finding things that are not food. Maybe small friend can find it, and Do'gol will carry anything heavy.", fx = { align = { order = 1 } } },
        { text = "Let the humans think what they like. It's no matter.", next = "BACK", reply = "Is matter to Krog, because humans look at Krog like Krog burned their beds. Do'gol does not like when humans look at Krog that way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft = {
      lines = { { id = "c_default", text = "Everybody makes axes, because axes are easy to love. A shield keeps you alive long enough to use the axe, and nobody thanks it, so Do'gol thanks it every day." } },
      choices = {
        { text = "Who wears your shields?", next = "craft_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_who = {
      lines = { { id = "cw_default", text = "The ogres at the gate, and some of the orcs, when they stop being proud. The humans in Theramore have shields too, and Do'gol saw one once, and it was thin as a leaf, so Do'gol does not worry about the humans." } },
      choices = {
        { text = "Thin shields can still turn a blade.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else, Do'gol.", next = "BACK" },
      },
    },
    spiders = {
      lines = { { id = "sp_default", text = "Do'gol does not like spiders that are so big Do'gol cannot sit on them and squish them. The darkmist spiders took the old mine, and now nobody goes in there except the stupid and the brave." } },
      choices = {
        { text = "Which am I, then?", next = "spiders_which" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    spiders_which = {
      lines = { { id = "sw2_default", text = "Do'gol will know when you come back. If you come back with sacs, you are brave, and if you come back with no sacs and no legs, you are stupid." } },
      choices = { { text = "I'll aim to come back with legs, Do'gol.", next = "BACK", fx = { affinity = 1 } } },
    },
    krog = {
      lines = { { id = "k_default", text = "Krog is an orc who thinks too much, and he walks up and down worrying about humans. But Krog is fair to ogres, and he does not shout, so Do'gol does what Krog asks." } },
      choices = { { text = "Something else, Do'gol.", next = "BACK" } },
    },
    smith = {
      lines = { { id = "sm_default", text = "No secret, only more hitting. Heat it more than you think, hit it more than you think, and never let anybody else quench it for you, because they will do it wrong." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Heavy enough to stop an ogre's club and light enough to lift all day, which is a hard thing, so most smiths pick one and lie about the other. Do'gol does not lie about shields." } },
      choices = {
        { text = "I'd rather carry weight than die light.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Do'gol is Stonemaul and Do'gol makes shields. That is all of Do'gol's story, and it is a good story." } },
    advice = { { id = "tp_ad", text = "Carry a shield, even if you think you do not need one. Everybody who did not is dead, so you cannot ask them." } },
    onyxia = { { id = "tp_onyxia", text = "The black dragon lives south, past the Stonemaul ruins, and her children burned Do'gol's clan. Do'gol does not make shields for dragon fire, because no shield is that good." } },
    theramore = { { id = "tp_theramore", text = "The humans have good iron in Theramore, better than Do'gol's, and they waste it on swords for little men. Do'gol would make them proper shields if they asked, but they do not ask ogres." } },
    thrall = { { id = "tp_thrall", text = "The orc chief let the ogres stay in Brackenwall, and the orcs bring Do'gol iron, so Do'gol thinks the orc chief is a good chief." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "Do'gol hears there are many ogres in the black mountain far away, and the orcs there are bad orcs. They make bad shields too, Do'gol is sure of it." } },
    _none = { { id = "tp_none", text = "Do'gol knows metal and spiders, and that is not metal or spiders, so ask Krog." } },
  },
}
