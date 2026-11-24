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
    first = "He has a sense of humour, which unsettles me more than none.",
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
    op_arcane = {
      lines = {
        { id = "opa_default", text = "Now that is the question my flight has argued over since before your kingdoms had names. I have my answer, little one, and I'm curious whether yours is foolish in an interesting way." },
      },
      choices = {
        { text = "Some power should be guarded, the way you guard it.", next = "op_arc_guard", fx = { affinity = 1, align = { order = 1 }, opinion = { arcane_magic = "dangerous" } } },
        { text = "Magic belongs to whoever has the will to master it.", next = "op_arc_will", fx = { affinity = -1, align = { order = -1 }, trait = { proud = 1 }, opinion = { arcane_magic = "useful" } } },
        { text = "We'll learn, mistakes and all, the same as you did.", next = "op_arc_will", fx = { trait = { witty = 1 }, opinion = { arcane_magic = "admire" } }, when = { class = "MAGE" } },
        { text = "I think I'll keep my answer, great one.", next = "BACK" },
      },
    },
    op_arc_guard = {
      lines = {
        { id = "opag_default", text = "A sensible mortal! I shall have to sit down. Don't let it go to your head, though; sensible mortals are still mortals, and they still poke at things." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_arc_will = {
      lines = {
        { id = "opaw_default", text = "Will, is it? The Highborne had a great deal of will, and you can see where it put them, under several fathoms of very cold water. Do try to be more original than they were." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
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
        { text = "Then destroy it. No one should have that power.", next = "BACK", reply = "Destroy it? Spoken like a mortal who has never tried to break a Highborne ward, which tends to break you first. I'll keep it, thank you, and keep it quiet.", fx = { align = { order = -1 } } },
        { text = "Keep it guarded, then. That's wiser than destroying it.", next = "BACK", reply = "Finally, a mortal who understands the virtue of a good lock. You'd make a passable dragon, if you were taller and considerably older.", fx = { align = { order = 1 } } },
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
      lines = { { id = "as_default", text = "Because leaving means letting them have what's here, and they would blow themselves and the whole coast to pieces within the week. Somebody has to be the large blue obstacle, and it might as well be someone with a sense of humour." } },
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
        { text = "Should mortals have magic at all, then?", next = "op_arcane" },
        { text = "Magic belongs to whoever is bold enough to learn it.", next = "BACK", reply = "Bold, yes, and bold mortals make the most interesting craters. I'll be sure to tidy yours up afterwards.", fx = { align = { order = -1 } } },
        { text = "Then guard it well. Some power needs keepers.", next = "BACK", reply = "Precisely, and that is why I'm here, being dreadfully patient with all of you. Thank you for noticing.", fx = { align = { order = 1 } } },
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

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Flattery, from a mortal who has not first reached for a sword. I had forgotten how pleasant it is, and I'll allow that you do it better than the Highborne ghosts, who have had ten thousand years to practise." },
        { id = "s2", text = "You have a courtier's tongue, little one, and I am old enough to enjoy one without believing it. Go on standing there, for you are the best company I've had on this coast in a century." },
        { id = "s3", when = { class = "MAGE" }, text = "A mage who admires the flight that guards magic, instead of resenting it. You are a rare specimen, little one, and I shall try not to lose you." },
      },
      fail = {
        { id = "f1", text = "I have been flattered by queens and by archmages, little one, and nearly all of them wanted something that glowed. Whatever you are hoping to carry off, the answer is no." },
        { id = "f2", text = "That was sweetly said and thoroughly unconvincing. A dragon hears a great deal of praise from mortals in the moment before they ask a favour or draw a blade, and I am weary of both." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! It has been an age since a mortal dared to be rude to me without an army at its back. I find I like you better for it, though you shouldn't make a habit of it." },
        { id = "s2", text = "You have a sharp little tongue, and you used it on a dragon, which is either courage or a very short memory. I shall assume courage, since it amuses me more." },
      },
      fail = {
        { id = "f1", text = "Careful, little one. I have a sense of humour, but it is a good deal older than you are, and it doesn't stretch as far as you seem to think." },
        { id = "f2", text = "I've been insulted by experts, and you aren't one of them. Mind your manners on my shore, or I'll remember that mortals are easier to bear when they are quiet." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "Azuregos tilts his great head and studies you for a long moment.", text = "Well, now. I haven't felt a mortal press on me like that in a long while, and I confess it makes me curious instead of angry. You have nerve, little one, and I'll grant you that much ground." },
        { id = "s2", text = "You would lean on a dragon, on his own shore, and you would mean it. I am not afraid of you, but I am surprised, and at my age surprise is worth a little courtesy." },
      },
      fail = {
        { id = "f1", text = "You are trying to frighten something that watched your kingdoms being built, little one. Do stop, before I mistake it for the start of a fight and finish it." },
        { id = "f2", text = "I've been menaced by forty of your kind at once, all shouting, and I am still here to be bored by it. One of you alone is hardly worth my waking up for." },
      },
    },
  },

  blurts = {
    { id = "bl1", text = "The naga dig in Eldarath for the same relics I guard, and they answer to something beneath the waves that remembers Queen Azshara personally." },
    { id = "bl2", text = "My master Malygos has not been himself since Deathwing slaughtered most of our flight, and he guards magic now with a jealousy that frightens even me." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "Mortals annoy me as a rule, and you have managed to annoy me as an exception. That is a considerable achievement." },
      { id = "gv_values", when = { grudge = "values" }, text = "You look at these ruins and see loot rather than history. The Highborne were fools, but even they understood the difference." },
      { id = "gv_tone", when = { grudge = "tone" }, text = "You speak to a dragon as if he kept a tavern. I have eaten tavern keepers, though not lately." },
      { id = "gv_persua", when = { grudge = "persuade" }, text = "You tried to bully a dragon. I am still deciding whether that was courage or ordinary stupidity." },
    },
    amends = {
      { id = "am1", text = "Leave the relics of Eldarath where they lie, and go and bother someone shorter-lived. That would be a fine beginning." },
      { id = "am_values", when = { grudge = "values" }, text = "Bring me something the Highborne left behind instead of pocketing it. Then I may revise my opinion of you, slightly." },
    },
    spite = {
      { id = "sp1", text = "I think you are a brief, noisy thing that will be dust while I am still guarding these ruins. It is the only comfort you have given me." },
      { id = "sp_persua", when = { grudge = "persuade" }, text = "I think you are fortunate that I have grown patient over the centuries. My younger self would have frozen you where you stand." },
    },
    _gated = {
      { id = "gt1", text = "No, little one. I guard what the Highborne left behind from mortals I have no reason to trust, and you haven't yet given me one." },
      { id = "gt2", text = "That I'll keep to myself for now. A dragon doesn't hand his knowledge to every traveller who wanders up to ask, and so far you are only a traveller." },
    },
    knows = { { id = "tp_knows", text = "I know more than you by some ten thousand years, which isn't hard. Choose your question carefully; I'm not in the mood to answer many." } },
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
