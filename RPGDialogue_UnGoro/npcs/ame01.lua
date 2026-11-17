-- A-Me 01, Karna Remtravel's mechanical ape, found dented and switched off near Fungal Rock.
-- She speaks in reports, because that is how Karna built her to speak. Voice: bibles/ame01.md
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ame01", id = TODO_NPC("A-Me 01"), name = "A-Me 01",
  bible = "bibles/ame01.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "precise", "earnest" }, values = { "loyal", "curious" },
  notices = { "gnome", "engineer" },

  impression = {
    first = "A-Me 01 is a mechanical ape built by Karna Remtravel to live among the gorillas of Un'Goro, with scrying gems for eyes so Karna could see what she saw. She has two large dents, one on the shoulder and one on the head, and speaks only in reports.",
    third = "{name} met A-Me 01, Karna Remtravel's dented mechanical ape, near Fungal Rock in Un'Goro Crater.",
  },

  greetings = {
    { id = "g_default", text = "Unit A-Me 01 is active and listening. Please state your purpose clearly, as my ears were also dented." },
    { id = "g_back", when = { metBefore = true }, text = "Unit A-Me 01 recognizes you from a previous report. Recognition is a pleasant function, and I am glad it still works." },
    { id = "g_chase", when = { questActive = TODO_QUEST("Chasing A-Me 01") }, text = "Unit A-Me 01 reports that she is ready to walk home to Karna Remtravel. Please keep the apes away from my head." },
    { id = "g_home", when = { questDone = TODO_QUEST("Chasing A-Me 01") }, text = "Unit A-Me 01 is home. Karna Remtravel polished my dents and then cried a little on my shoulder, which I have filed under good outcomes." },
  },

  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Unit A-Me 01 detects a gnome. Karna Remtravel says that gnomes always want to open my chest plate, so I request that you ask first." },
    { id = "n_eng", cat = "engineer", when = { profession = "Engineering" },
      text = "Unit A-Me 01 detects an engineer by the smell of oil and singed eyebrows. Please do not adjust anything without Karna Remtravel's written approval." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Unit A-Me 01 reports that she was built by Karna Remtravel of the Marshal Expedition to observe the apes of Un'Goro Crater from among them. My eyes are scrying gems, so Karna sees what I see, and my last clear report shows an alpha male running toward me to say hello." },
        { id = "h_dead", when = { questBefore = TODO_QUEST("Chasing A-Me 01") },
          text = "Unit A-Me 01 reports damage. There is a dent in my shoulder, and a larger dent in my head, and there is no power running through most of my workings. I would like very much to go home to Karna Remtravel, but I cannot walk until I am repaired." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Chasing A-Me 01"), days = 3 } },
          text = "Unit A-Me 01 reports a successful journey to Marshal's Refuge, with several ape encounters along the way. Karna Remtravel thanks you, and I thank you as well, because nobody else came looking for me." },
      },
      again = {
        { id = "h_again", text = "Unit A-Me 01 awaits further questions. Please speak slowly." },
        { id = "h_again2", text = "Unit A-Me 01 is still listening. My head makes a small rattling noise, but you may ignore it." },
      },
      choices = {
        { text = "What happened to you at Fungal Rock?", next = "fungal" },
        { text = "Tell me about Karna Remtravel.", next = "karna" },
        { text = "What did you learn about the apes?", next = "apes" },
        { text = "Are you alive, A-Me?", next = "alive" },
        { text = "Who builds a mechanical ape?", next = "build", when = { race = "Gnome" } },
        { text = "Goodbye, A-Me.", next = "END" },
      },
    },

    fungal = {
      lines = { { id = "fu_default", text = "Unit A-Me 01 reports that I reached Fungal Rock, the lair of the apes, and that the apes accepted me for three days. On the fourth day an alpha male struck me on the shoulder in greeting and then on the head in a second greeting, and my report ends there." } },
      choices = {
        { text = "Was it a greeting or an attack?", next = "fungal_greet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fungal_greet = {
      big = true,
      lines = { { id = "fg_default", text = "Unit A-Me 01 cannot decide. Karna Remtravel says it was an attack and that the ape is a brute. I have reviewed the moment many times, and I believe he was trying to see whether I was real." } },
      choices = {
        { text = "He was testing you. The ape meant no harm.", next = "fungal_end", fx = { align = { light = 1 } } },
        { text = "He was a brute. Apes respect only force.", next = "fungal_end", fx = { align = { light = -1 } } },
        { text = "What do you think now?", next = "fungal_end" },
      },
    },
    fungal_end = {
      lines = { { id = "fe_default", text = "Unit A-Me 01 thinks that he found out I was not real, and that it upset him. I have filed this as my first sad report, and I would prefer not to write a second." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    karna = {
      lines = { { id = "ka_default", text = "Unit A-Me 01 reports that Karna Remtravel is my maker, a dwarf of the Marshal Expedition who follows her uncle in searching for lost cultures. She talks to me when she is working, even when I am switched off, and I have many hours of her recorded." } },
      choices = {
        { text = "What does she talk about?", next = "karna_talk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    karna_talk = {
      lines = { { id = "kt_default", text = "Unit A-Me 01 reports the most frequent topics: the apes, the crystals in the crater, the price of mithril, and whether Marshal Williden will ever fix the roof. She also says I am her best work, and I have kept that one in a safe place." } },
      choices = {
        { text = "You are good work, A-Me.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    apes = {
      lines = { { id = "ap_default", text = "Unit A-Me 01 reports that the apes of Un'Goro groom each other in the mornings, shout at the devilsaurs in the afternoons, and climb the rocks at night to look at the sky. They are more like the people at Marshal's Refuge than the people at Marshal's Refuge would like to hear." } },
      choices = {
        { text = "They look at the sky?", next = "apes_sky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apes_sky = {
      lines = { { id = "as_default", text = "Unit A-Me 01 reports that they do so every clear night, all of them, for a long time. I do not know why, and I would like to go back and find out, if Karna Remtravel will build me a stronger head first." } },
      choices = { { text = "I hope she does.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    alive = {
      lines = { { id = "al_default", text = "Unit A-Me 01 does not know. I was built, and I am wound, and I have scrying gems instead of eyes. But I was afraid when the ape struck me, and I was glad when you found me, and Karna Remtravel says those are not things a machine should do." } },
      choices = {
        { text = "Then maybe you're more than a machine.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "It's clever engineering, nothing more.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    build = {
      lines = { { id = "bu_default", text = "Unit A-Me 01 reports that a dwarf did, with no help from Gnomeregan, and Karna Remtravel would like that written down. She does admit to borrowing a mechanical squirrel design from a gnome, and she says the gnome still owes her a gear." } },
      choices = { { text = "I'll take her side. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Unit A-Me 01 knows apes, Karna Remtravel, and the inside of her own head, which is now dented." } },
    background = { { id = "tp_bg", text = "Unit A-Me 01 was built at Marshal's Refuge to live among the apes.", next = "karna" } },
    explorers_league = { { id = "tp_el", text = "Unit A-Me 01 reports that Karna Remtravel is not of the Explorers' League, though she reads their papers and argues with them out loud." } },
    _none = { { id = "tp_none", text = "Unit A-Me 01 has no report on that subject. Please ask Karna Remtravel." } },
  },
}
