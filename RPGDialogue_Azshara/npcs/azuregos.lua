-- Azuregos, blue dragon guarding the ruins of Eldarath (0.72.0). Voice: bibles/azuregos.md
-- Eccentric, amused, territorial; studies the Highborne's leftovers and resents every sword pointed at him.
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "azuregos", id = TODO_NPC("Azuregos"), name = "Azuregos",
  bible = "bibles/azuregos.md", role = "noble", tier = "major",
  temper = { "wry", "proud" }, values = { "curious", "proud" },
  notices = { "arcane", "trophy" },
  impression = {
    first = "Azuregos is a blue dragon who guards the magic left in Azshara's ruins and finds mortals very tiresome, especially the ones with swords. He has a sense of humour, which is more unsettling than if he hadn't.",
    third = "{name} met Azuregos, the blue dragon who guards the magical remnants of Azshara.",
  },

  greetings = {
    { id = "g_default", text = "You seek to harm me, {race}? Think carefully before you answer; I've heard every answer there is." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still without a sword in your hand. How refreshing, and how suspicious." },
    { id = "g_killed", when = { killed = { name = "Azuregos" } }, text = "Ah. You. I distinctly remember you, and I remember the rest of your little band, and I am not in a forgiving mood." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage. I can smell the arcane on you, little one, and it smells like somebody else's spellbook." },
    { id = "n_trophy", cat = "trophy", when = { killed = { name = "Spitelash", min = 40 } },
      text = "You've been killing naga on my shores. I won't thank you, but I won't eat you either, which is nearly the same thing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "You seek Azuregos, guardian of these ruins and the only creature in Azshara with any sense? Well, you've found him. Do try not to do anything heroic." },
        { id = "h_killed", when = { killed = { name = "Azuregos" } },
          text = "You came back to talk, after what you did? Either you're very brave or very stupid, and I've known plenty of both." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A night elf, walking among the ruins your ancestors made. I wonder if you know how lucky you are that they're ruins." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, here, of all places. Every one of you thinks you've come to learn, and every one of you has really come to take something." },
      },
      again = {
        { id = "h_again", text = "Still here? Very well, ask, and be quick about it." },
        { id = "h_again2", text = "Something else? I have studies waiting, and they are far more interesting than you." },
        { id = "h_again3", when = { disposition = { min = 65 } }, text = "Go on, then. You're tolerable company, for a mortal." },
      },
      choices = {
        { text = "What are you guarding here?", next = "guard" },
        { text = "Why does everyone try to kill you?", next = "attackers" },
        { text = "This place must have been grand once.", next = "eldarath" },
        { text = "What do you think of mortals and magic?", next = "magic" },
        { text = "I study the arcane too. Teach me something.", next = "mage", when = { class = "MAGE" } },
        { text = "My ancestors built this. What do you remember?", next = "nelf", when = { race = "NightElf" } },
        { text = "About that fight. No hard feelings?", next = "killed", when = { killed = { name = "Azuregos" } } },
        { text = "I am a treasure hunter. Give me your artifacts.", next = "BUSINESS" },
        { text = "I'll leave you to your studies.", next = "END" },
      },
    },
    guard = {
      lines = { { id = "gd_default", text = "Treasures, little one, the kind that a careless mortal could use to turn a mountain into a lake, or a city into a crater. My flight has watched over this coast's leftovers since the world broke, and I am the latest to draw the duty." } },
      choices = {
        { text = "What sort of treasures, exactly?", tag = "Persuade", next = "guard_true",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "MAGE" }, { reputation = { faction = "Cenarion Circle", min = "honored" } } } } },
          fail = { next = "guard_fail", fx = { affinity = -1 } } },
        { text = "Guarding these ruins must be dull duty.", next = "guard_enjoy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard_fail = {
      lines = { { id = "gf_default", text = "Nice try. If I told every adventurer who asked nicely, I'd have to fight every adventurer who heard about it, and I have enough of those already." } },
      choices = { { text = "Worth a try. I'll keep my secrets, then.", next = "BACK" } },
    },
    guard_true = {
      big = true,
      lines = { { id = "gt_default", key = true, text = "Very well, since you ask so sensibly. The Highborne left more than broken towers when the sea took their city: focusing stones, half-cast wards, things that hum in the dark under the water. None of it is safe, and all of it is fascinating, and I confess I'd guard it for the fascination alone." } },
      choices = {
        { text = "Then destroy it. No one should have that power.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Keep it guarded, then. That's wiser than destroying it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard_enjoy = {
      lines = { { id = "ge_default", text = "The duty? No. The magic-rich shorelines, the relics of the Sundering, the quiet? Very much. If you mortals would stop interrupting, it would be a perfectly pleasant posting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    attackers = {
      lines = { { id = "a_default", text = "Because I am large and blue and they assume I'm sitting on gold. I cannot take five steps in this cursed land without some crazed orc or human trying to thrust a sharp stick into my hide." } },
      choices = {
        { text = "Do you ever win?", next = "attackers_win" },
        { text = "Something else.", next = "BACK" },
      },
    },
    attackers_win = {
      lines = { { id = "aw_default", text = "Usually, though not always, and the losses are humiliating rather than permanent. They come in whole war bands now, which I find frankly insulting to everyone involved." } },
      choices = {
        { text = "A whole war band? That seems excessive.", next = "attackers_stance" },
        { text = "Why not just leave Azshara?", next = "attackers_stance" },
      },
    },
    attackers_stance = {
      lines = { { id = "as_default", text = "Because leaving means letting them have what's here, and they would blow themselves and half the coast to pieces within the week. Somebody has to be the large blue obstacle, and it might as well be someone with a sense of humour." } },
      choices = {
        { text = "That's a noble burden, Azuregos.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eldarath = {
      lines = { { id = "e_default", text = "Eldarath, one of the Highborne's proudest cities, back when this whole coast was Zin-Azshari and its queen was the most beautiful and the most foolish creature in the world. Then the Well went wrong, and the sea came in, and here we are." } },
      choices = {
        { text = "You mean the queen, Azshara herself.", next = "eldarath_queen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eldarath_queen = {
      lines = { { id = "eq_default", text = "The very same, and this land still wears her name like a cursed ring. Her servants still wander these ruins, the Highborne who couldn't let go, and the naga in the bay have their own opinions about her that I do not care to share." } },
      choices = {
        { text = "The naga serve her still?", next = "eldarath_naga" },
        { text = "Something else.", next = "BACK", fx = { learn = { "queen_azshara" } } },
      },
    },
    eldarath_naga = {
      lines = { { id = "en_default", text = "Ask them yourself, if you can stand the smell. I'll only say that the sea keeps its own secrets, and I am a dragon of the air." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "spitelash" } } } },
    },
    magic = {
      big = true,
      lines = { { id = "m_default", text = "Mortals and magic are like children and knives: occasionally useful, mostly bloody, and someone always has to clean up afterwards. Usually that someone is a dragon." } },
      choices = {
        { text = "Magic belongs to whoever is bold enough to learn it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Then guard it well. Some power needs keepers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "mg_default", text = "Here is a lesson, free of charge: the Highborne were better mages than you will ever be, and look what's left of them. That's the whole lesson; it took them ten thousand years to learn it." } },
      choices = {
        { text = "I'll be more careful than they were.", next = "mage_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_more = {
      lines = { { id = "mm_default", text = "They said exactly that, you know, almost word for word. Still, you're asking a dragon instead of a dusty tome, and that's a better start than most of them made." } },
      choices = { { text = "I'll take that as a compliment.", next = "BACK", fx = { affinity = 1 } } },
    },
    nelf = {
      lines = { { id = "ne_default", text = "I wasn't here when it fell, little elf; I'm old, but not that old. I've read what was left behind, though, and your ancestors' handwriting was beautiful right up until the end." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    killed = {
      lines = { { id = "k_default", text = "Hard feelings? You took a good deal of my patience and several of my scales. I'll consider forgiving you when they grow back, and they grow back very slowly." } },
      choices = { { text = "Understood.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a great deal more than you, which isn't hard. Choose your question carefully; I'm not in the mood to answer many." } },
    background = { { id = "tp_bg", text = "A dragon of the blue flight, charged with watching over what the Highborne left behind. The charge is tedious, the company worse." } },
    advice = { { id = "tp_ad", text = "If you find a glowing thing in a ruin, leave it there. I'll be along shortly to make sure you did." } },
    highborne = { { id = "tp_hb", text = "Brilliant, vain and catastrophically curious. I admire them a little more than I should." } },
    eldarath = { { id = "tp_el", text = "My ruins, these days, whatever the naga think. The Highborne would be appalled at the upkeep.", next = "eldarath" },
      { id = "tp_el2", text = "A drowned jewel, still shining a little under the waves." } },
    xylem = { { id = "tp_xy", text = "The human in the tower? He thinks he's studying Azshara. Azshara is studying him, and it isn't impressed." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "My elders remember her, and they do not speak of many mortals that way. She was the most beautiful thing in the world and the most dangerous, and she knew both facts precisely." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are mortals who learned a few tricks from my kind and decided they were the custodians of magic. My master Malygos would find them amusing, if he still found anything amusing." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was a city of mages stacking spells on top of each other like children with blocks, and then something knocked the blocks over. I am told they are rebuilding it, and I expect the same result." } },
    onyxia = { { id = "tp_onyxia", text = "Deathwing's daughter lairs in the marsh to the south, and she is clever, which is worse than being strong. If I were you I would not go near her, and if I were her I would not want you to.", fx = { learn = { "black_dragonflight" } } } },
    bronze_dragonflight = { { id = "tp_bronze_dragonflight", text = "The bronze flight keep time, and they do not like anyone stepping on it. They are courteous, terribly patient and terribly boring, and I respect them more than I let on." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children dream while the world burns, and they call it vigilance. I have nothing against them, except that they never answer a question directly, which I suppose I have no right to resent." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion came for the Well of Eternity because of the magic my kind protect, and it will come again for the same reason. That is why I take magic away from careless mortals like you." } },
    _none = { { id = "tp_none", text = "That is beneath my interest, little one, and very little is beneath a dragon." } },
  },
}
