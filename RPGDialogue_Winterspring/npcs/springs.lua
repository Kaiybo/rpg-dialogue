-- Winterspring's wilds: the hot springs and the E'ko witch doctor. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "donova", id = TODO_NPC("Donova Snowden"), name = "Donova Snowden",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "warm" }, values = { "curious", "protective" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_springs", text = "Welcome, welcome! Come stand by the spring. It's the only warm water for miles, an' Winterspring has more secrets than snowflakes." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then ye'll feel it too. Somethin's poisonin' the furbolgs, an' it's no' natural." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, all this way north! We're a long way from Khaz Modan, the both of us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Donova Snowden. I study the springs, an' the creatures that live by 'em. These days I mostly study the Winterfall. The furbolgs used tae keep tae themselves. Now they're drinkin' somethin' that makes 'em mad as a kicked hive." },
        { id = "h_firewater", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Winterfall Firewater") }, { questActive = TODO_QUEST("Falling to Corruption") } } },
          text = "Firewater. The Winterfall are swillin' it by the barrel. It's no' just drink. It's turnin' 'em. I want tae know who's brewin' it, an' why." },
        { id = "h_goo", when = { any = { { questActive = TODO_QUEST("Mystery Goo") }, { questActive = TODO_QUEST("Toxic Horrors") } } },
          text = "Look at this goo. Smell it. No, on second thought, don't. Whatever's in the firewater is in this too." },
        { id = "h_chief", when = { any = { { questActive = TODO_QUEST("High Chief Winterfall") }, { questActive = TODO_QUEST("Words of the High Chief") } } },
          text = "The High Chief knows who's behind it. He'll no' tell us kindly. Make him tell us anyway." },
        { id = "h_linken", when = { questActive = TODO_QUEST("It's a Secret to Everybody") },
          text = "A gnome's sword, found in a crater? An' ye want me tae temper it? Well, the springs are hot enough. Leave it with me." },
      },
      choices = { { text = "I'll look into the furbolgs.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask me about the springs instead. I know the springs." } },
  },
}

P:NPC {
  key = "mauari", id = TODO_NPC("Witch Doctor Mau'ari"), name = "Witch Doctor Mau'ari",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "playful" }, values = { "mystical", "proud" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_hello", text = "Ah, a visitor come all dis way to see Mau'ari! Smart, you are. Or lost. Either way, sit." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, up here in de ice! You be feelin' de cold in your tusks, eh? Mau'ari too." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "DRUID" } },
      text = "You know de spirits. Den you know what Mau'ari be talkin' about when she say every beast got a little magic left in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Witch Doctor Mau'ari. Every creature in dis frozen place carry a little spirit, a little E'ko. Bring it to Mau'ari, and she make you juju. Good juju. Mostly." },
        { id = "h_cache", tags = { "news" }, when = { questActive = TODO_QUEST("Cache of Mau'ari") },
          text = "First, Mau'ari need her cache back. In it be de charm you need for catchin' E'ko. No charm, no E'ko. No E'ko, no juju." },
        { id = "h_luck", when = { any = { { questActive = TODO_QUEST("A Little Luck") }, { questActive = TODO_QUEST("Luck Be With You") } } },
          text = "Luck, you want? Mau'ari got plenty. Bring de right E'ko, and maybe some find its way to you." },
        { id = "h_cold", when = { metBefore = true }, text = "Mau'ari been up here a long time, mon. Long enough to stop complainin' about the cold. Not long enough to stop feelin' it." },
      },
      choices = { { text = "I'll bring E'ko.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    echo_isles = { { id = "tp_echo_isles", text = "De islands, warm and green. Mau'ari remember. She come up here anyway. De magic in de snow be stranger." } },
    _none = { { id = "tp_none", text = "Mau'ari know many t'ings. Not dat one." } },
  },
}
