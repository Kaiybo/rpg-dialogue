-- King Magni Bronzebeard. Voice: bibles/magni.md
-- Strong, stoic, carrying more grief than he lets the court see.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "magni", id = TODO_NPC("King Magni Bronzebeard"), name = "King Magni Bronzebeard",
  bible = "bibles/magni.md", role = "noble", tier = "major",
  communities = { "ironforge" }, temper = { "proud" }, values = { "brave", "honest", "lawful" },
  notices = { "fel", "kin" },

  greetings = {
    { id = "g_king", text = "Ye stand before the King of Ironforge. Speak up; the forges are loud." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "One o' mine. Welcome home, whatever road ye've been on." },
    { id = "g_hero", when = { minLevel = 50 }, text = "I know that face. Half the Alliance does. Come, sit, an' tell me how the world's treatin' ye." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "A warlock. In my hall. Ye'll keep yer pets on a short chain, an' ye'll keep yer business short as well." },
    { id = "n_shaman", cat = "kin", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf who speaks wi' the elements. My granddad swore the mountain had a voice. Maybe ye're just the first tae answer it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Magni Bronzebeard, King o' Ironforge. We pledged our axes tae the Alliance after the Second War, an' we've not regretted it. Mostly." },
        { id = "h_grelin", when = { heardLine = "grelin.h_default" },
          text = "Ye've met the Whitebeard brothers, then. The Senate sends 'em to count trolls. I'd send an army, but the Senate likes countin'." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "Our gnome friends. Mekkatorque's tram still runs, an' I still dinnae understand it. Ye're welcome in Ironforge as long as the mountain stands." },
        { id = "h_human", when = { race = "Human", minLevel = 20 },
          text = "Stormwind's sent ye north? Give the Regent my regards. An' tell him the Dark Iron are no' gettin' any friendlier." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves from the sky, they tell me. The Explorers will want tae measure ye. Let them; they measure everythin'." },
      },
      choices = {
        { text = "What troubles Ironforge?", next = "troubles" },
        { text = "Tell me about your family.", next = "family" },
        { text = "Long live the king.", next = "END", fx = { affinity = 1 } },
      },
    },
    troubles = {
      lines = {
        { id = "t_default", text = "The Dark Iron, festerin' in the mountain. Troll raids in Dun Morogh. An' the Alliance askin' for more axes than I've got hands tae swing." },
      },
      choices = { { text = "I'll lend mine.", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
    family = {
      big = true,
      lines = {
        { id = "f_default", text = "My brother Muradin went tae Northrend an' didnae come back. My daughter's in the hands o' the Dark Iron. I'll say no more about it in front o' the court." },
      },
      choices = {
        { text = "I'm sorry, my king.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then someone should bring her home.", next = "home", fx = { trait = { brave = 1 } } },
      },
    },
    home = {
      lines = { { id = "h2_default", text = "Aye. Someone should. When ye're strong enough, come back an' say that again. I'll be listenin'." } },
      choices = { { text = "I will.", next = "END", fx = { affinity = 1, align = { honor = 1 } } } },
    },
  },

  topics = {
    ironforge = {
      { id = "ta_ironforge", text = "The finest city ever carved from stone, an' I'll fight any elf who says otherwise. Mind, they rarely do." },
    },
    magni = {
      { id = "ta_self", text = "A king wi' a lost brother an' a stolen daughter. Ye'd think a crown would help wi' that. It doesnae." },
    },
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "Every night I look at that door an' think my brother'll walk through it. He never does. I look anyway." },
    },
    my_trade = {
      { id = "ta_trade", text = "Kingship. Mostly it's listenin' tae gnomes an' arguin' wi' the Senate. Now an' then I get tae hit somethin'." },
    },
    background = {
      { id = "ta_bg", text = "Son o' Ironforge, head o' the Bronzebeard clan, king by right an' by sheer stubbornness." },
    },
    defias = { { id = "tp_defias", text = "Stormwind's thieves? Humans' business. We've our own rot in the mountain." } },
    westfall = { { id = "tp_westfall", text = "Farmland, isn't it? Never trust ground ye cannae dig a decent tunnel through." } },
    _none = { { id = "tp_none", text = "Ask the Explorers' League. They know a wee bit about everythin', an' they'll tell ye all of it." } },
  },
}
