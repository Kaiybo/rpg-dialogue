-- Darnassus. Voice: bibles/darnassus.md
-- Tyrande and Fandral don't agree on much, and both say so. Fandral's later secret is
-- never hinted: his temper and pride show, nothing else does.
-- Year 1: Tyrande and Malfurion are beloved, not yet wed (the wedding is later lore).
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tyrande", id = TODO_NPC("Tyrande Whisperwind"), name = "Tyrande Whisperwind",
  bible = "bibles/darnassus.md", role = "noble", tier = "major",
  communities = { "darnassus" }, temper = { "fierce" }, values = { "protective", "devout" },
  spiritSensitive = true,
  notices = { "fel", "race", "class", "form" },

  greetings = {
    { id = "g_temple", text = "You stand in the Temple of the Moon, so speak plainly. Elune hears everything said here, and I have little time for what she would not care to hear." },
    { id = "g_kin", when = { race = "NightElf" }, text = "Child of the kaldorei, Elune's light be on you. Tell me what you need of me." },
    { id = "g_back", when = { metBefore = true }, text = "So you have returned. Good; those who come back to me usually have something worth saying." },
    { id = "g_light", when = { class = "PRIEST", race = { "Human", "Dwarf", "Gnome" } },
      text = "A priest of the Light, in the house of the Moon. Elune's blessing on you, and your own faith's as well; now tell me why you have come." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "I know that taint, for my people burned for it once. Say your piece quickly, and then take it out of Elune's house." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "NightElf" },
      text = "A {g:brother|sister} of the moon, and welcome. We are fewer than we were, and needed more than ever." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Eldre'Thalas... I remember it as a city of light. I am told your people left it rather than bow to a prince's purge, and that speaks well of them." },
    { id = "n_shadow", cat = "form", place = "before", when = { form = "shadow" },
      text = "You wear shadow in the Temple of the Moon. Elune lights the dark, but she has never needed to wear it, so set it aside while we speak." },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Not here, priest. Whatever that darkness teaches you, it can wait outside the Temple." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Tyrande Whisperwind, High Priestess of Elune, and while Malfurion sleeps I lead our people. I did not ask to lead them alone, but I will not do it half-heartedly." },
        { id = "h_tenaron", when = { heardLine = "tenaron.h_default" },
          text = "You came down from Aldrassil past Tenaron's watch, and he sends me only the best of Shadowglen. Let us see whether he was right about you." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "Malfurion would have been glad of you, druid. Go to the Enclave, by all means, but come back to me when the Archdruid's certainties begin to sound like truths." },
        { id = "h_human", when = { race = "Human" },
          text = "A human in Darnassus. A few years ago I would have called that impossible, but the Alliance has taught both our peoples to be surprised." },
        { id = "h_fandral", when = { heardLine = "fandral.h_default" },
          text = "You have been to the Enclave, then, and Fandral will have told you that he leads. He leads the druids; the rest of us he merely lectures." },
        { id = "h_reception", tags = { "news" }, when = { questDone = TODO_QUEST("Reception from Tyrande") },
          text = "Thenysil still writes to me from Stonetalon, and your name is in her letters. I do not forget the names my Sentinels send me." },
        { id = "h_alathea", when = { class = "PRIEST", race = { "Human", "Dwarf", "Gnome" } },
          text = "Alathea has trained a few of your Church's young priests in this temple. She tells me you pray loudly and heal well, and I approve of at least one of those." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The moon is up, and this is Elune's hour rather than the petitioners'. You are fortunate that I am still listening." },
      },
      again = {
        { id = "h_again", text = "What else? The Sentinels report at moonrise, and I mean to hear them." },
        { id = "h_again2", text = "Speak on. I have little time, but I have not run out of it." },
      },
      choices = {
        { text = "Where is Malfurion?", next = "malfurion" },
        { text = "What troubles Darnassus?", next = "troubles" },
        { text = "The Horde is in Ashenvale. What will you do?", next = "ashenvale" },
        { text = "What does Elune ask of her priestesses?", next = "elune" },
        { text = "They say you once had no use for humans.", next = "hyjal", when = { race = "Human" } },
        { text = "I serve the Light, High Priestess. Is that so different?", next = "light",
          when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "How can I serve the Temple, High Priestess?", next = "sister", when = { class = "PRIEST", race = "NightElf" } },
        { text = "Should I heed the Archdruid?", next = "druid", when = { class = "DRUID" } },
        { text = "My people left Eldre'Thalas long ago.", next = "eldre", when = { race = "Skyborne" } },
        { text = "Elune be with you.", next = "END", fx = { affinity = 1 } },
      },
    },
    malfurion = {
      big = true,
      lines = {
        { id = "m_default", text = "His body sleeps in his barrow while his spirit walks the Emerald Dream, and it does not come back. The druids searched and found nothing, so I wait, and I am very tired of waiting." },
      },
      choices = {
        { text = "He'll come back.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What happened to him?", next = "barrow" },
        { text = "Can nothing be done?", next = "done" },
      },
    },
    barrow = {
      lines = { { id = "ba_default", text = "He went walking in the Dream, as druids do, and his spirit never came home. His body sleeps untouched by time. My sisters see that it stays so." } },
      choices = {
        { text = "Do the druids still look for him?", next = "barrow_search" },
        { text = "Something else.", next = "BACK" },
      },
    },
    barrow_search = {
      lines = { { id = "bs_default", text = "They called him for years, and call still. Fandral says the Circle must be led in the meantime. He isn't wrong; I only wish he said it less often." } },
      choices = {
        { text = "I'm sorry, High Priestess.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    done = {
      lines = { { id = "d_default", text = "If you find a way, bring it to me before you bring it to anyone else, whoever they may be. I trust very few with Malfurion's life." } },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Why trust a stranger with that?", next = "done_trust" },
      },
    },
    done_trust = {
      lines = { { id = "dt_default", text = "Because a stranger has no stake in who leads the kaldorei. That makes you more honest than most who climb these steps." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    troubles = {
      lines = {
        { id = "t_default", text = "Our immortality is gone, and some of us want it back at any price. The Horde cuts at Ashenvale, and the Archdruid has opinions about everything else." },
      },
      choices = {
        { text = "The Archdruid?", next = "fandral" },
        { text = "Immortality, at any price?", next = "immortal" },
        { text = "I'll help where I can.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    fandral = {
      lines = { { id = "f_default", text = "Fandral Staghelm grew this tree without the Aspects' blessing and calls it a triumph, and perhaps it is. I would sleep better if Malfurion had been asked." } },
      choices = {
        { text = "You disagree with him.", next = "fandral2", fx = { learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    fandral2 = {
      lines = { { id = "f2_default", text = "About nearly everything. He wants more druids, more groves, more of Kalimdor under our hand. I want us to stop repeating the mistakes that sank the old world." } },
      choices = {
        { text = "Which mistakes?", next = "mistakes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mistakes = {
      big = true,
      lines = { { id = "mi_default", text = "Pride, and magic hoarded by the few, and leaders so certain they knew best that no one could tell them otherwise. We drowned half a continent learning that lesson once." } },
      choices = {
        { text = "Fandral would call you too cautious.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Then I'll watch for pride. Mine too.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { cautious = 1 } } },
      },
    },
    immortal = {
      lines = { { id = "im_default", text = "We lived ten thousand years without age or sickness. Now we grow old like anyone. Some of my people cannot bear it, and frightened people make bargains." } },
      choices = {
        { text = "Can you blame them?", next = "immortal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    immortal2 = {
      lines = { { id = "i2_default", text = "No, I blame no one for being afraid. I will blame them for what they choose to do about it." } },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear makes fools of everyone.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    ashenvale = {
      lines = { { id = "as_default", text = "At Hyjal, orcs bled beside us against Archimonde. That pact did not outlast the peace. Now the Warsong cut Ashenvale for lumber, and my Sentinels answer them." } },
      choices = {
        { text = "I'll help hold Ashenvale.", next = "BACK", fx = { affinity = 2, standing = { darnassus = 1 } } },
        { text = "The orcs need wood to live.", next = "ashenvale_orcs", fx = { trait = { skeptical = 1 } } },
        { text = "Where would I be most use?", next = "ashenvale_where" },
      },
    },
    ashenvale_orcs = {
      lines = { { id = "ao_default", text = "So did we, once, and we asked the forest first. Need does not make the trees theirs; say that again in Astranaar and see who answers you." } },
      choices = {
        { text = "Fair enough.", next = "BACK" },
        { text = "I'll say what I think, wherever I am.", next = "BACK", fx = { affinity = -1, trait = { brave = 1 } } },
      },
    },
    ashenvale_where = {
      lines = { { id = "aw_default", text = "Astranaar, on its lake. Raene Wolfrunner commands the scouts there, and she has never once had enough of them." } },
      choices = { { text = "I'll find her.", next = "BACK", fx = { affinity = 1 } } },
    },
    elune = {
      lines = { { id = "e_default", text = "She asks us to protect. Every prayer, every arrow and every healing comes back to that, and it has been enough to fill ten thousand years." } },
      choices = {
        { text = "Her priestesses lead the Sentinels too?", next = "sentinels" },
        { text = "Something else.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },
    sentinels = {
      lines = { { id = "se_default", text = "They have since before the Sundering, and a priestess who cannot draw a bow is only half-trained. Elune does not ask us to be gentle with those who would burn her forests." } },
      choices = {
        { text = "Then I'm glad they're on our side.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal = {
      big = true,
      lines = { { id = "hy_default", text = "It is true that I called your kind mongrels once. Then a young human sorceress held the first line at Hyjal so that we could finish our work, and I told her plainly that I had misjudged her." } },
      choices = {
        { text = "And now?", next = "hyjal2" },
        { text = "It takes something to admit that.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hyjal2 = {
      lines = { { id = "hy2_default", text = "Now Lady Proudmoore keeps Theramore, and your people walk my city. I watch them as I watch everyone. A few have earned more than watching." } },
      choices = {
        { text = "I mean to be one of them.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      big = true,
      lines = { { id = "l_default", text = "I can't tell you what your Light is, priest. Ten thousand years with Elune and I would not claim to know all of her either. I know what both do for the wounded." } },
      choices = {
        { text = "Then perhaps they're the same.", next = "light_same", fx = { trait = { curious = 1 } } },
        { text = "Who could teach me about Elune?", next = "light_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_same = {
      lines = { { id = "ls_default", text = "Perhaps. I've heard humans say so, and I've heard my sisters say otherwise. Neither had seen what they were so sure of. I will wait to be shown." } },
      choices = {
        { text = "Fair. I'll keep my faith and my eyes open.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I've felt it. That's enough for me.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    light_teach = {
      lines = { { id = "lt_default", text = "A'moora, by the Temple pool. She will answer kindly and at length. Alathea will answer briefly, and then ask what magic you've been using." } },
      choices = { { text = "Thank you, High Priestess.", next = "BACK", fx = { affinity = 1 } } },
    },
    sister = {
      lines = { { id = "si_default", text = "Protect first and heal second, and pray when both are done. The Sentinels in Ashenvale are stretched thin, so go where they bleed." } },
      choices = { { text = "I will, High Priestess.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { darnassus = 1 } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Heed him on druids' matters. That is his charge, and he knows it well. When he speaks of the future of all our people, listen politely, then come and tell me." } },
      choices = {
        { text = "You don't trust him?", next = "druid2" },
        { text = "I'll do that.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    druid2 = {
      lines = { { id = "dr2_default", text = "I trust him to be Fandral: proud, quick and certain of himself. Our people need some of that, but they also need someone who will argue with it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eldre = {
      lines = { { id = "el_default", text = "Eldre'Thalas was a Highborne city, and I had little love for the Highborne. Your people rose against their prince, I'm told. Tell me if I've been told wrong." } },
      choices = {
        { text = "You were told right.", next = "BACK", fx = { affinity = 1 } },
        { text = "It's more complicated than that.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I have been a priestess of Elune since before your kingdoms had names, and I fought at the Well of Eternity and again at Hyjal. The Sentinels tell it better than I do; they enjoy it more." } },
    advice = { { id = "tp_ad", text = "Never mistake a quiet forest for a safe one. And when you've something to report, come back and report it." } },
    malfurion = {
      { id = "tp_malfnext", text = "You ask about Malfurion. Sit, then, for this is not a short answer.", next = "malfurion" },
      { id = "tp_malf", text = "He sleeps while his spirit wanders. That is all I will say of him to someone I have only just met." },
    },
    sisterhood_of_elune = { { id = "tp_sister", text = "Mine to lead. We heal, we fight, we pray, in whatever order the night needs." } },
    sentinels = { { id = "tp_sentinels", text = "They are my sisters and daughters, with bows in their hands. Darnassus needs no walls because it has them." } },
    warsong = { { id = "tp_warsong", text = "Grom Hellscream's clan. Grom slew Cenarius, then died freeing his people from the demons. His clan cuts our trees as if neither had happened.", next = "ashenvale" } },
    teldrassil = { { id = "tp_teldrassil", text = "It is our home now. It grew quickly and without the dragons' blessing, and quick things worry me." } },
    cenarion_circle = { { id = "tp_circle", text = "It is Malfurion's order, and in his absence it is Fandral's. I pray that is a short arrangement." } },
    worgen = { { id = "tp_worgen", text = "I have heard of the beasts in the human woods. Ask the druids about them, and watch their faces when you do." } },
    _none = { { id = "tp_none", text = "That is not a matter for the Temple, though the Sentinels may know." } },
  },
}

P:NPC {
  key = "fandral", id = TODO_NPC("Arch Druid Fandral Staghelm"), name = "Arch Druid Fandral Staghelm",
  bible = "bibles/darnassus.md", role = "noble", tier = "major",
  communities = { "darnassus" }, temper = { "abrasive" }, values = { "proud", "ambitious" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_enclave", text = "Yes? The Enclave is busy, and I am busier still, so be brief." },
    { id = "g_druid", when = { class = "DRUID", race = "NightElf" }, text = "A kaldorei druid, good. The Circle needs more of our own and fewer of the rest." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Very well, speak, but make it worth the climb." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren", class = "DRUID" },
      text = "A tauren druid; Malfurion's generosity, still walking about. I will not pretend I ever agreed with it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne", class = "DRUID" },
      text = "A druid of the sky-folk, who honour the winds above the moon, I hear. The Circle's doors have been flung very wide indeed." },
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "You are no druid, and whatever you want from the Enclave, I doubt you will understand it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Fandral Staghelm, Archdruid of the Cenarion Circle. While Malfurion dreams someone must lead, and I do; there are some who would rather I didn't, and they are wrong." },
        { id = "h_corithras", when = { heardLine = "corithras.h_default" },
          text = "Corithras worries about the moonwells, as Corithras worries about everything. Teldrassil is young, and it will grow strong, given patience." },
        { id = "h_crown", tags = { "news" }, when = { questActive = TODO_QUEST("Crown of the Earth") },
          text = "You carry the waters of Teldrassil's moonwells, and they will tell me how the tree grows. Bring them to me untouched, and do not dawdle." },
        { id = "h_crown_done", when = { questDone = TODO_QUEST("Crown of the Earth") },
          text = "The tree is strong, stronger than its critics, and I will be sure to tell them so." },
        { id = "h_tyrande", when = { heardLine = "tyrande.h_default" },
          text = "You are fresh from the Temple, by the reproachful look of you. The High Priestess has many virtues, but leadership is not chief among them." },
        { id = "h_oracle", tags = { "news" }, when = { questActive = TODO_QUEST("Teldrassil") },
          text = "Bark from the Oracle Tree? It has not spoken to me in far too long, so give it here, and let us see which of the tree's troubles it thinks are mine now." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest? The Temple is across the gardens. If the High Priestess sent you to watch me, it is still across the gardens." },
        { id = "h_human", when = { race = "Human" },
          text = "A human in the Enclave; Malfurion always held the doors too wide. Well, you are in now, so be useful." },
      },
      again = {
        { id = "h_again", text = "Well? Something else, or are we finished?" },
        { id = "h_again2", text = "Quickly. The tree does not tend itself, whatever the Temple imagines." },
      },
      choices = {
        { text = "Why did you grow Teldrassil?", next = "tree" },
        { text = "What of Moonglade?", next = "moonglade" },
        { text = "The High Priestess has her doubts about you.", next = "priestess" },
        { text = "What was Malfurion like?", next = "malf" },
        { text = "I serve the Light, Archdruid. Not the Temple.", next = "priest_f",
          when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "Teach me, Archdruid.", next = "kin", when = { class = "DRUID", race = "NightElf" } },
        { text = "My people's druids honour the winds.", next = "sky", when = { class = "DRUID", race = "Skyborne" } },
        { text = "I'll go.", next = "END" },
      },
    },
    tree = {
      big = true,
      lines = {
        { id = "t_default", text = "Because we lost our immortality at Hyjal, and a people that can die should not wait politely to do it. The Aspects withheld their blessing; we grew it anyway. Look up: it holds." },
      },
      choices = {
        { text = "It's magnificent.", next = "BACK", fx = { affinity = 2 } },
        { text = "Without their blessing?", next = "blessing", fx = { trait = { skeptical = 1 } } },
        { text = "Has it given back what you lost?", next = "immortal" },
      },
    },
    blessing = {
      lines = { { id = "b_default", text = "Blessings are for those who can afford to wait for them, and we could not. Spare me the Temple's sermon; I have heard it." } },
      choices = {
        { text = "Whose blessing did you ask for?", next = "refused" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refused = {
      lines = { { id = "r_default", text = "Nozdormu's. He called it arrogance, and Alexstrasza agreed with him. Dragons can wait a thousand years for the right answer. We can no longer afford a hundred." } },
      choices = {
        { text = "So you grew it anyway.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Maybe they saw something you didn't.", next = "BACK", fx = { affinity = -2, trait = { skeptical = 1 } } },
      },
    },
    immortal = {
      lines = { { id = "im_default", text = "Not yet. The work isn't finished; some days I doubt it ever will be. Every trouble on this tree comes to me, and I would gladly set the weight down." } },
      choices = {
        { text = "Then let others carry some of it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You chose to carry it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Remulos keeps his glade and his opinions. The druids there talk of balance while the world tilts. I prefer to act." } },
      choices = {
        { text = "You don't trust Remulos?", next = "remulos" },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    remulos = {
      lines = { { id = "re_default", text = "He is Cenarius's son, and never lets us forget it. When our people had nothing, I led them here, not Moonglade. Remember that when his druids tell you otherwise." } },
      choices = {
        { text = "I'll judge for myself.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 }, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    priestess = {
      lines = { { id = "pr_default", text = "She leads the Sentinels and the Temple, and she prays. Prayer is not a plan. Our people need someone who can see past the next moon." } },
      choices = {
        { text = "And you can?", next = "vision" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vision = {
      big = true,
      lines = { { id = "v_default", text = "A people who can die must grow strong while they live. More druids, more groves, more of Kalimdor under kaldorei care instead of orc axes." } },
      choices = {
        { text = "That sounds like a war.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Kalimdor could use it.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    malf = {
      lines = { { id = "ma_default", text = "My teacher, and the greatest of us. He would have argued against this tree; he argued against most things. Until he wakes, someone must decide." } },
      choices = {
        { text = "Do you think he'll wake?", next = "malf2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    malf2 = {
      lines = { { id = "ma2_default", text = "That is the Dream's business. Mine is the waking world, and it waits for no one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest_f = {
      lines = { { id = "pf_default", text = "Your kingdoms' faith. It builds cathedrals; I grow forests. Tell me which will still be standing in ten thousand years." } },
      choices = {
        { text = "The Cathedral was rebuilt once. It'll stand.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Both, with luck.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then learn from Mathrengyl, and learn quickly, for the Circle needs kaldorei druids and too many of the new ones are not." } },
      choices = {
        { text = "You mean the tauren?", next = "kin2" },
        { text = "I'll make the Circle proud.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    kin2 = {
      lines = { { id = "k2_default", text = "Malfurion taught a tauren our ways. I told him then it was a mistake. The Circle's secrets were kept ten thousand years for our people, not theirs." } },
      choices = {
        { text = "They revere Cenarius too.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky = {
      lines = { { id = "sk_default", text = "Winds, is it? The Circle serves Cenarius, not the sky, so learn what Mathrengyl teaches you and leave the weather outside." } },
      choices = {
        { text = "We'll see.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I led our people to this tree when they had nothing left to lead them. That is the part of my story worth telling." } },
    advice = { { id = "tp_ad", text = "Don't waste time. We learned at Hyjal how little of it any of us has." } },
    teldrassil = {
      { id = "tp_teldnext", text = "It is my work, and our home. Ask, if you must.", next = "tree" },
      { id = "tp_teld", text = "Ask Corithras about the moonwells, if you like. Then come back and tell me he worries too much." },
    },
    malfurion = { { id = "tp_malf", text = "My teacher. Ask the Temple about him; they have more patience for the subject." } },
    cenarion_circle = { { id = "tp_circle", text = "Mine to lead, for now. I mean to leave it stronger than I found it, whatever Moonglade thinks." } },
    _none = { { id = "tp_none", text = "That is not my concern, so ask a Sentinel. They enjoy being asked things." } },
  },
}

P:NPC {
  key = "mathrengyl", id = TODO_NPC("Mathrengyl Bearwalker"), name = "Mathrengyl Bearwalker",
  bible = "bibles/darnassus.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "calm" }, values = { "wise", "loyal" },
  notices = { "form", "class" },

  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome, young one. The Enclave's doors are open to you, and so is my time." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "What brings you to the Cenarion Circle, friend? Ask, and I'll answer if I can." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, the bear sits well on you. The Great Bear Spirit chose rightly." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "You wear the cat indoors, I see. The Great Cat Spirit is as playful as it is deadly, so please be the first of those in here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mathrengyl Bearwalker. I train the druids of the Enclave. Once I stood at the Archdruid's side; now I stand with the young ones, which suits me better." },
        { id = "h_call", tags = { "news" }, when = { questActive = TODO_QUEST("Heeding the Call") },
          text = "You heard the call, and not everyone does. Sit, and we will speak of what it means to walk as more than one creature." },
        { id = "h_claw", when = { questActive = TODO_QUEST("Body and Heart") },
          text = "The Great Bear Spirit has shown you the body, and now Lunaclaw will test the heart. He waits by the Moonkin Stone near Auberdine, so go humbly." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Lessons Anew") },
          text = "Auberdine has had trouble with poisons. A druid who can draw poison out of the living is worth ten who can only watch, so learn it well." },
        { id = "h_aquatic", when = { questDone = TODO_QUEST("Aquatic Form") },
          text = "The sea is yours now as well as the forest. Few of us are truly comfortable in both, but try to be." },
        { id = "h_strife", when = { metBefore = true },
          text = "You will hear talk that the Circle is divided, but do not believe it. Fandral leads us well, and his vision built the very tree you stand on." },
        { id = "h_bear", when = { questDone = TODO_QUEST("Body and Heart") }, text = "You move differently since you met the Great Bear, heavier on your feet and lighter in your head, which is exactly how it should be." },
        { id = "h_questions", when = { metBefore = true, class = "DRUID" }, text = "Every druid who passes through the Enclave leaves something behind, usually a question. Yours are good ones, so keep asking them." },
        { id = "h_cat", tags = { "news" }, when = { questActive = TODO_QUEST("The Great Cat Spirit") },
          text = "The Great Cat Spirit sets each generation its own trial. I can't tell you what yours will be. I can tell you it plays before it bites." },
      },
      again = {
        { id = "h_again", text = "Ask on. The young ones' questions are the best part of my day." },
        { id = "h_again2", text = "What else? Take your time, as the Enclave does." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What is a Druid of the Claw?", next = "claw" },
        { text = "You serve the Archdruid?", next = "second" },
        { text = "What's wrong in Auberdine?", next = "auberdine" },
        { text = "What can a priest learn from a druid?", next = "healers", when = { class = "PRIEST" } },
        { text = "Farewell.", next = "END" },
      },
    },
    claw = {
      big = true,
      lines = {
        { id = "c_default", text = "One who wears the bear and understands it: strength held in reserve, given to protect. Many can take the shape. Fewer earn the name." },
      },
      choices = {
        { text = "I'd like to earn it.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "And the Great Bear Spirit?", next = "bear" },
      },
    },
    bear = {
      lines = { { id = "be_default", text = "Older than our people, as old as the world. My own first meeting with it left me bewildered for a day. Every druid says the same, afterwards." } },
      choices = {
        { text = "That sounds frightening.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'd like to meet it.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    second = {
      lines = { { id = "s_default", text = "I was his assistant, and I'm his second still. He carries more than any of us see. I try to carry a little of it." } },
      choices = {
        { text = "They say the Circle is divided.", next = "divided" },
        { text = "Something else.", next = "BACK" },
      },
    },
    divided = {
      lines = { { id = "dv_default", text = "Disagreement isn't division. Darnassus and Moonglade argue as old friends argue. Our duty to the Circle is the same, whoever leads it." } },
      choices = {
        { text = "I hope you're right.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Old friends sometimes stop being friends.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    auberdine = {
      lines = { { id = "a_default", text = "Someone has been poisoning the animals there, and the village couldn't cure them. I'll confess it surprised me. Poison doesn't drift into a forest by chance." } },
      choices = {
        { text = "Who would do that?", next = "auberdine2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    auberdine2 = {
      lines = { { id = "a2_default", text = "I do not know yet. There is Fel Moss in the furbolgs and a red crystal among the moonkin, so ask Thundris Windweaver in Auberdine, who hears everything first." } },
      choices = { { text = "I'll ask him.", next = "BACK", fx = { affinity = 1 } } },
    },
    healers = {
      lines = { { id = "he_default", text = "We mend with what grows, and you mend with what you pray to, and the wounded rarely ask which. Sit in on a lesson if you like, so long as you do it quietly." } },
      choices = { { text = "Thank you. I will.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am one of the Archdruid's druids, and a teacher. The young ones keep me honest, and the bear keeps me humble." } },
    advice = { { id = "tp_ad", text = "Learn the bear before the cat, and the cat before you think you know either of them." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle is united, whatever you have heard, for disagreement is not division. The Archdruid has broad shoulders." } },
    _none = { { id = "tp_none", text = "That's beyond my teaching. Ask in the Temple, perhaps." } },
  },
}

P:NPC {
  key = "amoora", id = TODO_NPC("Priestess A'moora"), name = "Priestess A'moora",
  bible = "bibles/darnassus.md", role = "priest", tier = "quest",
  communities = { "darnassus" }, temper = { "gentle" }, values = { "devout", "kind" },
  notices = { "class", "death" },

  greetings = {
    { id = "g_moon", text = "Even here under the branches, Elune's light finds you. Come in and sit by the pool." },
    { id = "g_back", when = { metBefore = true }, text = "There you are, little star. The moon remembers those who return." },
  },

  notice = {
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "You've walked the other side not long ago, so rest here a while. The moon is kind to those who've seen its dark half." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am A'moora, a priestess of the Sisterhood, and I tend the Temple's pool and those who come to it. Most come tired, and I try to send them out less so." },
        { id = "h_temple", tags = { "news" }, when = { questActive = TODO_QUEST("The Temple of the Moon") },
          text = "So Sister Aquinne sent you. Good; there is work here for a willing heart, and a little sorrow in it, so listen." },
        { id = "h_tears", when = { questActive = TODO_QUEST("Tears of the Moon") },
          text = "That errand is a quiet one, and a sad one. Go carefully, and come back to me when it's done." },
        { id = "h_sathrah", when = { questActive = TODO_QUEST("Sathrah's Sacrifice") },
          text = "Sathrah's name is spoken softly in this temple. Lay her at the fountain, and do it with care." },
        { id = "h_dream", when = { metBefore = true }, text = "Little star, did you sleep? You have the look of someone who's been dreaming of the road." },
        { id = "h_rest", when = { questDone = TODO_QUEST("Sathrah's Sacrifice") },
          text = "The fountain took Sathrah's sacrifice. I like to think she spins again somewhere, in kinder moonlight." },
        { id = "h_light", when = { class = "PRIEST", race = { "Human", "Dwarf", "Gnome" } },
          text = "A priest of the Light, by our pool! Alathea teaches your kind sometimes. She says you pray as if someone might not be listening. Someone always is, little star." },
      },
      again = {
        { id = "h_again", text = "What else, little star?" },
        { id = "h_again2", text = "Sit as long as you like. The pool doesn't mind company." },
      },
      choices = {
        { text = "What do you pray for?", next = "pray" },
        { text = "Tell me about Elune.", next = "elune" },
        { text = "Who was Lady Sathrah?", next = "sathrah" },
        { text = "Does Elune hear a priest of the Light?", next = "light",
          when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "Thank you, Priestess.", next = "END" },
      },
    },
    elune = {
      big = true,
      lines = {
        { id = "e_default", text = "She is the light that doesn't burn. She doesn't ask us to be strong, only to keep shining a little in the dark. Even a little is enough." },
      },
      choices = {
        { text = "That's beautiful.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Is she only gentle, then?", next = "elune_war" },
      },
    },
    elune_war = {
      lines = { { id = "ew_default", text = "Gentle with the gentle. She has a warrior's face too, and on the darkest nights she takes the brave dead up to ride the sky as stars." } },
      choices = {
        { text = "I'd like that, one day. Not soon.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = {
        { id = "p_lost", text = "That the moon finds everyone who's lost. Some nights I name them. It takes a long time." },
      },
      choices = {
        { text = "Name one for me tonight.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Who do you name?", next = "pray_who" },
      },
    },
    pray_who = {
      lines = { { id = "pw_default", text = "Not my own lost, little star, but everyone's: the Sentinels who don't come back from Ashenvale, the sailors the murlocs take off Darkshore, and whoever someone has asked me to remember." } },
      choices = {
        { text = "Add the ones I've lost.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sathrah = {
      lines = { { id = "sa_default", text = "A great spider, beloved of Elune. She spun silver through the moonlight, and the dew on it healed the sick in this temple. Then she went mad." } },
      choices = {
        { text = "Why did she go mad?", next = "sathrah_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sathrah_why = {
      lines = { { id = "sw_default", text = "No one has told me, and I've stopped asking. The tree is young, and not everything on it grows straight. The fountain can cleanse what's left of her." } },
      choices = {
        { text = "I'll help her rest.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      big = true,
      lines = { { id = "l_default", text = "Elune hears everyone, little star. Whether she answers a priest of the Light, or your Light answers first, I couldn't say. I've seen us both heal the same wounds." } },
      choices = {
        { text = "Then we're not so different.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "How do you pray to her?", next = "light_pray" },
      },
    },
    light_pray = {
      lines = { { id = "lp_default", text = "Quietly, by water, at night. We don't ask her for things so much as tell her where it's dark. Try it by the pool. She won't mind the accent." } },
      choices = { { text = "I will. Thank you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a priestess of the Sisterhood, and I tend the pool and whoever comes to it. That is all the story there is, little star." } },
    advice = { { id = "tp_ad", text = "Rest when the road lets you. The moon will still be there; you might not be, if you never stop." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "We heal, we pray, and we train with the bow. Visitors are always surprised by the third." } },
    cenarion_circle = { { id = "tp_circle", text = "They are our brothers and sisters of the wild. The Temple and the Enclave love each other, mostly, if loudly at times." } },
    _none = { { id = "tp_none", text = "I couldn't say, little star. The High Priestess might." } },
  },
}

P:NPC {
  key = "gracina", id = TODO_NPC("Gracina Spiritmight"), name = "Gracina Spiritmight",
  bible = "bibles/darnassus.md", role = "scholar", tier = "quest",
  communities = { "darnassus" }, temper = { "intent" }, values = { "curious", "devout" },
  notices = { "lore", "trophy" },

  greetings = {
    { id = "g_study", text = "Careful with the specimens. Some of them are only mostly dead." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you bring anything? Shells, stings or chitin, I'm not particular." },
  },

  notice = {
    { id = "n_skinner", cat = "trophy", when = { profession = "Skinning" },
      text = "A skinner! Then you've handled more of Azeroth's creatures than most scholars ever will. Tell me what you've seen." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gracina Spiritmight, priestess and scholar. I study the creatures that belong to this world alone. Lately, the ones that don't seem to belong to it at all." },
        { id = "h_pestlezugg", when = { heardLine = "pestlezugg.h_default" },
          text = "A goblin alchemist in Gadgetzan has been asking about my insect studies. A goblin, asking a priestess. Whatever is under the sand must be worse than I feared." },
        { id = "h_silithid", tags = { "news" }, when = { questActive = TODO_QUEST("Rise of the Silithid") },
          text = "So this report is for me? Let me see what it says... yes, silithid, just as I feared. Learn that name, because you will be hearing it more than you'd like." },
        { id = "h_low", when = { maxLevel = 40 },
          text = "Things live in the southern deserts that frighten me more than any orc. You're young yet, so come back to me when you're not." },
        { id = "h_fandral", when = { heardLine = "fandral.h_default" },
          text = "You've met the Archdruid, then. He thinks my insects are a scholar's hobby, and he is very certain of it, but then, so was the hive." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Another priest. People forget the Sisterhood studies as well as prays. Someone ought to write down everything that crawls under the moon." },
      },
      again = {
        { id = "h_again", text = "Go on, but mind the jar on your left; it bites." },
        { id = "h_again2", text = "Ask. I like questions better than specimens, most days." },
      },
      choices = {
        { text = "What are you studying?", next = "study" },
        { text = "What frightens you?", next = "fear" },
        { text = "What are the silithid?", next = "silithid" },
        { text = "I carried that report. What now?", next = "silithid_done", when = { questDone = TODO_QUEST("Rise of the Silithid") } },
        { text = "A priestess who studies insects?", next = "priest_g", when = { class = "PRIEST" } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    fear = {
      big = true,
      lines = {
        { id = "f_default", text = "Order without mercy. A hive moves as one mind, and that mind is patient, and patient enemies are the worst kind because they outlast you." },
      },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "What hive?", next = "silithid" },
      },
    },
    study = {
      lines = {
        { id = "s_shells", text = "Everything Azeroth's creatures leave behind: shells, stings and scales. My people spent ten thousand years not looking closely at most of it, and I'm making up for that." },
      },
      choices = {
        { text = "I'll bring you something.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Why insects, of all things?", next = "study2" },
      },
    },
    study2 = {
      lines = { { id = "s2_default", text = "Because they outlast everything. Empires fall, forests burn, and something with six legs is there afterwards, eating the remains." } },
      choices = {
        { text = "Cheerful.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid = {
      lines = { { id = "si_default", text = "A hive in the southern deserts. My people fought them long before your kingdoms rose. Some in Darnassus call them mere insects; they haven't read the old reports." } },
      choices = {
        { text = "Who calls them mere insects?", next = "silithid_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid_who = {
      lines = { { id = "sw_default", text = "The Archdruid, among others. He is brilliant about trees. About this, his certainty runs well ahead of his reading." } },
      choices = {
        { text = "Careful. He's the Archdruid.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll remember who warned me.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    silithid_done = {
      lines = { { id = "sd_default", text = "You carried it, and you've seen the sand move. That's more than most of my colleagues can say." } },
      choices = {
        { text = "What do we do now?", next = "silithid_next" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid_next = {
      lines = { { id = "sn_default", text = "Watch Un'Goro, because I think their strength comes from deeper in Kalimdor than the desert. Gadgetzan's alchemist may agree with me, though few others do." } },
      choices = { { text = "I'll keep watch.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    priest_g = {
      lines = { { id = "pg_default", text = "Prayer and study aren't rivals. I pray for the patience to look closely, and then I look." } },
      choices = {
        { text = "That's a good prayer.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priestess who reads more than she prays, the Temple would tell you. Some weeks they'd be right." } },
    advice = { { id = "tp_ad", text = "If it has more than four legs, assume it's cleverer than it looks." } },
    silithid = {
      { id = "tp_silinext", text = "Ah, the hive. Sit down, because I have notes.", next = "silithid" },
      { id = "tp_sili", text = "The worst thing my people ever fought, and we've fought demons." },
    },
    _none = { { id = "tp_none", text = "That's not my field, though if it had six legs, I'd be all ears." } },
  },
}

P:NPC {
  key = "saelienne", id = TODO_NPC("Innkeeper Saelienne"), name = "Innkeeper Saelienne",
  bible = "bibles/darnassus.md", role = "innkeeper", tier = "service",
  communities = { "darnassus" }, temper = { "warm" }, values = { "kind" },
  notices = { "weary", "race" },

  greetings = {
    { id = "g_rest", text = "Rest a while, traveller. The branches rock a little at night. Most find it soothing." },
    { id = "g_home", when = { homeInn = { "Darnassus", "Craftsmen's Terrace" } }, text = "You're home. Elune guard your dreams tonight." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've had a hard road, so sit down. Moonberry juice first, then sleep, and then whatever comes after." },
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Gnome" } },
      text = "Don't look down from the terrace, friend. Everyone does it once, and once is enough." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Saelienne. I keep the inn on the Craftsmen's Terrace. Travellers come up from the boats looking lost. I make sure they leave looking rested." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You'll sleep well up here, I think. Your people are used to the ground being a long way down." },
        { id = "h_louder", when = { metBefore = true }, text = "A young Sentinel once asked me what the world below the tree was like, and I told her it was louder. She looked so disappointed." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The city's quietest now. Listen and you'll hear the branches settle, like an old house." },
      },
      again = {
        { id = "h_again", text = "Anything else? There's moonberry juice, if you're staying." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How do outsiders find Darnassus?", next = "outsiders" },
        { text = "What's the talk on the Terrace?", next = "talk" },
        { text = "Just resting.", next = "END" },
      },
    },
    outsiders = {
      lines = { { id = "o_default", text = "By boat to Rut'theran, then through the portal, and they arrive looking dazed. Dwarves look down from the terrace once. Humans ask where the walls are." } },
      choices = {
        { text = "Where are the walls?", next = "walls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walls = {
      lines = { { id = "w_default", text = "There aren't any; the Sentinels are the walls. Most visitors find that more comforting by their second night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    talk = {
      lines = { { id = "t_default", text = "The craftsmen grumble that the Temple gets all the moonlight. The Sentinels grumble about Ashenvale. The druids don't grumble; they lecture." } },
      choices = {
        { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "Just resting, then.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the beds on the Craftsmen's Terrace. Everyone who stays a night tells me their story, and mine is the shortest of them." } },
    advice = { { id = "tp_ad", text = "Take the portal from Rut'theran. There's no other sensible way up, and several foolish ones." } },
    _none = { { id = "tp_none", text = "I only keep the beds. The Temple knows more." } },
  },
}
