-- Darnassus. Voice: bibles/darnassus.md
-- Tyrande and Fandral don't agree on much, and both say so. Fandral's later secret is
-- never hinted: his temper and pride show, nothing else does.
-- Year 1: Tyrande and Malfurion are beloved, not yet wed (the wedding is later lore).
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tyrande", id = TODO_NPC("Tyrande Whisperwind"), name = "Tyrande Whisperwind",
  rivals = { "fandral" },
  bible = "bibles/darnassus.md", role = "noble", tier = "major",
  communities = { "darnassus" }, temper = { "fierce" }, values = { "protective", "devout" },
  spiritSensitive = true,
  notices = { "fel", "race", "class", "form" },
  impression = {
    first = "High Priestess Tyrande Whisperwind speaks as though Elune is listening, and perhaps she is. Leading her people alone shows only in how little time she spares for idle words.",
    third = "{name} stood before Tyrande Whisperwind, High Priestess of Elune, in the Temple of the Moon.",
  },

  greetings = {
    { id = "g_temple", text = "You stand in the Temple of the Moon, so speak plainly. Elune hears everything said here, and I have little time for what she would not care to hear." },
    { id = "g_kin", when = { race = "NightElf" }, text = "Ishnu-alah, child of the kaldorei, and Elune's light be on you. Tell me what you need of me." },
    { id = "g_back", when = { metBefore = true }, text = "So you have returned. Good; those who come back to me usually have something worth saying." },
    { id = "g_light", when = { class = "PRIEST", race = { "Human", "Dwarf", "Gnome" } },
      text = "A priest of the Light, in the house of the Moon. Elune's blessing on you, and your own faith's as well; now tell me why you have come." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone from Darnassus {away}, and the moon has turned without you. Tell me what you have seen beyond the branches." },
    { id = "g_away_long", when = { away = { min = 60, levels = 5 } }, text = "You have been away {away}, and you return with the bearing of one who has stood against real darkness. Elune has kept you, so honour her by telling me plainly what you found." },
    { id = "g_word_helped", when = { word = "helped" }, text = "My Sentinels tell me you have served the people of this city well these past days. That is noted, and Elune notes it also." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I am told one of my people saw through a falsehood of yours. Speak only truth in this temple, because I will hear the other kind." },
    { id = "g_scout", when = { origin = "nightelf_sentinel_scout" }, text = "One of my scouts, come in from the borders. You watched Ashenvale's edges for me once, and I see you have not stopped watching, so tell me what the rest of the world looks like through a Sentinel's eyes." },
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
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Fandral would answer the Warsong with more groves and more druids, and I would answer them with more Sentinels; we agree on the enemy and on very little else. You have walked through the Enclave, so tell me plainly what you make of the Archdruid." },
      },
      choices = {
        { text = "He grew a world tree. That took vision and courage.", next = "op_r1", fx = { affinity = -1, align = { order = 1 }, opinion = { fandral = "admire" } } },
        { text = "He's proud, and pride burned your people once before.", next = "op_r2", fx = { affinity = 1, align = { order = -1 }, trait = { skeptical = 1 }, opinion = { fandral = "distrust" } } },
        { text = "You need each other. Kalimdor needs you both.", next = "op_r3", fx = { affinity = 1, trait = { kind = 1 }, opinion = { fandral = "mixed" } } },
        { text = "He leads my Circle, High Priestess, and I follow him.", next = "op_r4", fx = { trait = { stern = 1 }, opinion = { fandral = "loyal" } }, when = { class = "DRUID" } },
        { text = "I'd rather not take sides between you.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Vision, yes, and he did not ask Nordrassil's guardians before he planted it. Courage that asks no one's leave is often only pride wearing a finer cloak." } },
      choices = { { text = "Back to Ashenvale, then.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "I did not say that, and I will not say it in this temple. But I will remember that you did." } },
      choices = { { text = "Back to Ashenvale, then.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Malfurion would tell me the same, and he would be right. It is on the days I must sit across a table from Fandral that I feel his absence in the Dream most keenly." } },
      choices = { { text = "Back to Ashenvale, then.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then follow him with your eyes open, {class}. Malfurion never asked anyone to follow him blindly, and Fandral should not ask it either." } },
      choices = { { text = "Back to Ashenvale, then.", next = "BACK" } },
    },
    xpt_tyrande = {
      big = true,
      lines = { { id = "xpt_tyrande_default", text = "Some do, and some remember that the outsiders who stood beside us at Hyjal came only because their own lands had fallen. I choose to remember that they stood, whatever the reason, and I would ask the same of you." } },
      choices = {
        { text = "They stood when it counted, High Priestess.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your kin are right to be wary. Alliances are convenient things.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Elune's light touches every living thing, and the spirits you speak with are part of the world she watches over. Still, the orcs who burned our forests spoke to spirits too. I would see what you do with yours." } },
      choices = {
        { text = "Then watch my deeds, High Priestess. I will serve the living.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My spirits answer to me, not to Elune.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Hands in Ashenvale, where the Horde cuts our forests and my Sentinels come home bleeding, and steady hearts for those who will not come home at all. Prayers are well and good, but I need healers who will walk beside the wounded into the trees." } },
      choices = {
        { text = "Then I'll go to Ashenvale and heal where I'm needed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll heal those who can still fight, and the rest must wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "To Ashenvale, where the Horde's axes bite deeper into our forest every season and the Sentinels stand too few against them. I will not ask you to love our trees as we do, only to stand where they need defending." } },
      choices = {
        { text = "I'll go where you send me, High Priestess.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll choose my own battles, as the Light guides me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, and they always have. In Ashenvale the Warsong cut deeper every season, and a hunter who reads the forest can find their scouts before they find us; Shandris Feathermoon would tell you the same, and more sharply." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, and they always have, for a hunter who reads the forest can find the Warsong scouts before they find us. Your {pet} watches me as the Sentinels' nightsabers do, calmly and missing nothing, so keep it close." },
      },
      choices = {
        { text = "I'll serve where the Sentinels place me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I hunt where I choose, not where I'm sent.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "She does, and she always has. The Sentinels walk in shadow under her moon, and when Azshara's palace fell, it was quiet hands as much as loud blades that got our people out alive. Only remember that the dark hides a blade and a betrayal equally well, and choose which one you carry." },
      },
      choices = {
        { text = "I'll fight for you, High Priestess, and never turn on you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Betrayal is just a blade aimed elsewhere. I choose my own targets.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because the Alliance asked us to, and because I have seen what happens when my people refuse to listen to anyone. But I fought the Legion beneath the walls of Zin-Azshari and again at Mount Hyjal, and I have watched what demons do to those who call them servants, so I will pray for you, and I will watch you." },
      },
      choices = {
        { text = "Then watch. I'll give you no reason to raise a bow.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your fear is ten thousand years old. My craft is not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_t = {
      big = true,
      lines = {
        { id = "mt_default", text = "Then you study the thing that broke the world. The Highborne drank from the Well until the sea swallowed Zin-Azshari, and my people swore that power off for ten thousand years, so do not be offended if I watch your hands while you speak." },
        { id = "mt_sky", when = { race = "Skyborne", class = "MAGE" },
          text = "Your forebears in Eldre'Thalas kept that magic when the rest of us put it down. I don't hold you to account for their prince, but I can't pretend I'm glad to see the arcane in Elune's house." },
      },
      choices = {
        { text = "Magic is a tool, High Priestess. Pride was their sin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Your caution is earned. Some power should stay sealed.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "What became of the Highborne who survived?", next = "mage_t2" },
      },
    },
    mage_t2 = {
      lines = {
        { id = "mt2_default", text = "Those who would not give up the arcane were sent across the sea, and in time they became the high elves of Quel'Thalas. Your Kirin Tor has known their children well; I have not spoken with one in a very long while, and I've not missed it." },
      },
      choices = {
        { text = "Exile seems harsh for studying magic.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else, High Priestess.", next = "BACK" },
      },
    },
    warrior_t = {
      big = true,
      lines = {
        { id = "wt_default", text = "In Ashenvale, at Astranaar, where the Warsong push further into the forest every season. My Sentinels hold the trees, but every blade that stands with them buys a grove another year." },
        { id = "wt_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "You stood the watch at Auberdine, I'm told, so you've already seen what Darkshore is becoming. Then you know why I want blades on that shore as badly as I want them in Ashenvale." },
      },
      choices = {
        { text = "Meet the Warsong in the open and break them.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "Strike their camps by night. Let them fear the dark.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "There seem to be few warriors among the kaldorei.", next = "warrior_t2" },
      },
    },
    warrior_t2 = {
      lines = {
        { id = "wt2_default", text = "For ten thousand years our men slept in the Dream as druids and our women stood guard as Sentinels, and the sword was left to the few who chose it. Now the druids sleep less and the borders are wider, and I am glad of every one who chooses it." },
      },
      choices = { { text = "Then I chose well. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarf_t = {
      lines = {
        { id = "dwt_default", text = "It troubles my Sentinels more than it troubles me. Your diggers are careful, mostly, and they ask before they open a barrow, mostly, but some of what lies under Darkshore was buried for a reason, and better they hear that from me than learn it with a shovel." },
      },
      choices = {
        { text = "Old ruins should teach the living. Let them dig.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The dead's ground should stay closed.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_bfd = {
      big = true,
      lines = {
        { id = "xcl_bfd_default", text = "Then you have walked where my sisters prayed ten thousand years ago, before the fall of the Well drowned that coast. The Twilight's Hammer have been chanting to something older than Elune down there, with the naga standing guard for them, and I could not spare the Sentinels to root them out myself." },
      },
      choices = {
        { text = "I'd see that temple given back to Elune someday.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A drowned temple is only a ruin. Let the sea keep it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What did the Twilight's Hammer want down there?", next = "xcl_bfd2" },
      },
    },
    xcl_bfd2 = {
      big = true,
      lines = { { id = "xcl_bfd2_default", text = "I do not know the name of what they served, and I am not certain I want to. The cultists speak of old powers sleeping beneath the world, and whatever they fed in that deep water answered them, which is reason enough to keep watch on Blackfathom long after you have gone." } },
      choices = {
        { text = "Then I'll keep watch too, whenever my road passes Ashenvale.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old powers can sleep. I have enough living enemies.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll leave the deep water to your Sentinels, then.", next = "BACK" },
      },
    },
    xalt_tyrande = {
      big = true,
      lines = { { id = "xalt_tyrande_default", text = "{alt}, a {altclass}, who knelt beneath the temple's high window and asked nothing of me at all, which few who come here manage. I have lived long enough to see families scatter and meet again across the ages, so forgive me if I look for old faces in new ones." } },
      choices = {
        { text = "Perhaps Elune sends us to one another for a reason.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Chance brings people together, High Priestess, not the goddess.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, High Priestess.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Elune's light falls on you as it fell on {alt}, a {altrace} who came to this temple not long ago, and I would have sworn you shared a mother. Come closer, child, and tell me whether my eyes deceive me." },
        { id = "h_alt_other", when = { alt = { notKin = true }, metBefore = false },
          text = "The Sentinels told me of a {altrace} called {alt} who came into the temple with the same careful steps you take now. Strangers who walk softly in Elune's house are rare, and I find that I remember them." },
        { id = "o_tyrande_distrust", tags = { "news" }, when = { opinion = { topic = "tyrande", stance = "distrust" } },
          text = "I am told you think I spend my Sentinels like copper. I have buried more of them than you have ever met, so think on that before you say it again." },
        { id = "o_tyrande_admire", tags = { "news" }, when = { opinion = { topic = "tyrande", stance = "admire" } },
          text = "I am told you would follow me before the Archdruid. I hope you never have to make that choice, but I will remember it." },
        { id = "o_alliance_distrust", tags = { "news" }, when = { gossip = { topic = "alliance", stance = "distrust" } },
          text = "I hear you agreed with the Archdruid that we should stand alone. Remember that outsiders stood with us at Hyjal, whatever he tells you now." },
        { id = "h_pt_tyrande", tags = { "news" }, when = { party = { race = { "Human", "Dwarf", "Gnome" } } },
          text = "You bring {companion} with you into Darnassus, and the sentinels at the gate tell me they were courteous. Elune smiles on friendships between our peoples, though I know not every one of my kin agrees." },
        { id = "h_cl_bfd", tags = { "news" }, when = { cleared = "Blackfathom Deeps", faction = "Alliance" }, text = "The Sentinels on the Zoram Strand tell me someone went down into Blackfathom and came back up again. That was a temple of Elune once, before the sea took it, and I am grateful to whoever reminded its new tenants of that." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "You have spent your time at the Enclave, and Fandral speaks well of you, which tells me what you said to him. I will still hear you out, but I will listen more carefully." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "I hear you left the Enclave with the Arch Druid's temper behind you. Fandral needs more people who will tell him no, and fewer who nod while he lectures." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Whatever you pray to, you've come to the house of Elune, and here we heal the wounded first and ask their names after." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your kingdoms have suffered much, and I have not forgotten that humans and dwarves stood beside us at Mount Hyjal." },
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
        { id = "h_hyjal", when = { origin = "nightelf_hyjal_survivor" },
          text = "You stood on the mountain with us when the World Tree gave up its gifts. I see the years on your face now, as you must see them on mine, and I will not pretend that either of us is used to it yet." },
        { id = "h_warm", when = { disposition = { min = 75 } },
          text = "You return, and I find I am glad of it, which is rarer in this temple than you might think. Speak freely, friend of the kaldorei." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You walk softly, and I notice it, because the Sentinels taught me to. Elune's priestesses have hidden in the dark for ten thousand years, so I don't think less of anyone who does the same for a good cause." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "The thing you have bound to you stands in my temple, warlock, and I am letting it. Do not mistake that for welcome." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter of Elune's forests. The Sentinels ride with hunters on every border we hold, and I am glad of each bow that joins them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who walks with the spirits. Elune's light falls on all who come in peace, though in ten thousand years I have not seen your path among our allies before." },
      },
      again = {
        { id = "h_again", text = "What else? The Sentinels report at moonrise, as they have since the night of the Sundering, and I mean to hear them." },
        { id = "h_again2", text = "Speak on. I have little time, but I have not run out of it." },
      },
      choices = {
        { text = "Where is Malfurion?", next = "malfurion" },
        { text = "Darnassus seems troubled, for all its beauty.", next = "troubles" },
        { text = "The Horde is in Ashenvale. What will you do?", next = "ashenvale" },
        { text = "Elune must ask much of her priestesses.", next = "elune" },
        { text = "Every year since Hyjal feels borrowed, High Priestess.", next = "xborrowed", when = { origin = "nightelf_hyjal_survivor" } },
        { text = "They say you once had no use for humans.", next = "hyjal", when = { race = "Human" } },
        { text = "I serve the Light, High Priestess. Is that so different?", next = "light",
          when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "How can I serve the Temple, High Priestess?", next = "sister", when = { class = "PRIEST", race = "NightElf" } },
        { text = "Should I heed the Archdruid?", next = "druid", when = { class = "DRUID" } },
        { text = "My people left Eldre'Thalas long ago.", next = "eldre", when = { race = "Skyborne" } },
        { text = "I study the arcane, High Priestess.", next = "mage_t", when = { class = "MAGE" } },
        { text = "I fight with a blade. Where am I needed?", next = "warrior_t", when = { class = "WARRIOR" } },
        { text = "The Explorers' League digs your ruins in Darkshore.", next = "dwarf_t", when = { race = "Dwarf" } },
        { text = "Does Elune have any use for one who works unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the Sentinels have need of hunters, High Priestess?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do you tolerate me at all, High Priestess?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does Darnassus need from its priests, High Priestess?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where would you send a paladin, High Priestess?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does Elune look kindly on a shaman, High Priestess?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been to the bottom of Blackfathom Deeps, High Priestess.", next = "xcl_bfd", when = { cleared = "Blackfathom Deeps", faction = "Alliance" } },
        { text = "Do the Kaldorei really welcome our allies here, High Priestess?", next = "xpt_tyrande", when = { party = { race = { "Human", "Dwarf", "Gnome" } } } },
        { text = "Who was it I reminded you of, High Priestess?", next = "xalt_tyrande", when = { alt = true } },
        { text = "Elune be with you.", next = "END", fx = { affinity = 1 } },
      },
    },
    xborrowed = {
      big = true,
      lines = {
        { id = "xbo_default", text = "Borrowed from whom, though? We gave the Tree's gifts away to stop Archimonde, so I have come to think the years are not borrowed but bought, and dearly. Some of our people spend them grieving what we lost, and some spend them as if each one were the last, so tell me which you have chosen." },
      },
      choices = {
        { text = "To spend them well. Mourning wastes what we paid for.", next = "BACK", fx = { affinity = 2, align = { order = -1 }, trait = { brave = 1 } } },
        { text = "To guard what's left. Every year should keep our people safe.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Do you ever regret the sacrifice?", next = "xborrowed_regret" },
      },
    },
    xborrowed_regret = {
      lines = {
        { id = "xbr_default", text = "Never the choice, though sometimes the cost, late at night, when I count the gray in a Sentinel's hair that was not there when we stood on the mountain. Archimonde would have burned the world, and a world that ages is still a world, so I keep my regrets for the dark and my resolve for the day." },
      },
      choices = {
        { text = "Then I'll do the same, High Priestess.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
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
        { text = "Surely something can be done for him.", next = "done" },
      },
    },
    barrow = {
      lines = { { id = "ba_default", text = "He went walking in the Dream, as druids do, and his spirit never came home. His body sleeps untouched by time. My sisters see that it stays so." } },
      choices = {
        { text = "I'd guess the druids still look for him.", next = "barrow_search" },
        { text = "Something else.", next = "BACK" },
      },
    },
    barrow_search = {
      lines = { { id = "bs_default", text = "They called him for years, and call still. Fandral says the Circle must be led in the meantime. He isn't wrong; I only wish he said it less often." } },
      choices = {
        { text = "I'm sorry, High Priestess.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You keep watch at his barrow yourself, don't you?", tag = "Persuade", next = "barrow_vigil",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "pious" } } } },
          fail = { next = "barrow_closed", fx = { affinity = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    done = {
      lines = { { id = "d_default", text = "If you find a way, bring it to me before you bring it to anyone else, whoever they may be. I trust very few with Malfurion's life." } },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll bring it to whoever can use it best, High Priestess.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
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
        { text = "Immortality at any price sounds a dangerous wish.", next = "immortal" },
        { text = "I'll help where I can.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Kaldorei troubles are for the kaldorei to settle.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "You haven't said which mistakes.", next = "mistakes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mistakes = {
      big = true,
      lines = { { id = "mi_default", text = "Pride, and magic hoarded by the few, and leaders so certain they knew best that no one could tell them otherwise. We drowned half a continent learning that lesson once." } },
      choices = {
        { text = "Fandral would call you too cautious.", next = "BACK", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
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
        { text = "Fear makes fools of everyone.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
      },
    },
    ashenvale = {
      lines = { { id = "as_default", text = "At Hyjal, orcs bled beside us against Archimonde. That pact did not outlast the peace. Now the Warsong cut Ashenvale for lumber, and my Sentinels answer them." } },
      choices = {
        { text = "Does the Archdruid stand with you on Ashenvale?", next = "op_ask" },
        { text = "I'll help hold Ashenvale.", next = "BACK", fx = { affinity = 2, standing = { darnassus = 1 } } },
        { text = "The orcs need wood to live.", next = "ashenvale_orcs", fx = { trait = { skeptical = 1 } } },
        { text = "Where would I be most use?", next = "ashenvale_where" },
      },
    },
    ashenvale_orcs = {
      lines = { { id = "ao_default", text = "So did we, once, and we asked the forest first. Need does not make the trees theirs; say that again in Astranaar and see who answers you." } },
      choices = {
        { text = "As you say.", next = "BACK" },
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
        { text = "So her priestesses lead the Sentinels too.", next = "sentinels" },
        { text = "Then I'll protect whoever needs it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Protecting alone won't win a war, High Priestess.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { text = "I'm not here to earn anyone's trust, High Priestess.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "Faith with no proof behind it is only stubbornness.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I've felt it myself. I don't need proof.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    light_teach = {
      lines = { { id = "lt_default", text = "A'moora, by the Temple pool. She will answer kindly and at length. Alathea will answer briefly, and then ask what magic you've been using." } },
      choices = { { text = "Thank you, High Priestess.", next = "BACK", fx = { affinity = 1 } } },
    },
    sister = {
      lines = { { id = "si_default", text = "Protect first and heal second, and pray when both are done. The Sentinels in Ashenvale are stretched thin, so go where they bleed." } },
      choices = {
        { text = "I will, High Priestess.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { darnassus = 1 } } },
        { text = "Ashenvale can find other healers, because I'm needed here.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Heed him on druids' matters. That is his charge, and he knows it well. When he speaks of the future of all our people, listen politely, then come and tell me." } },
      choices = {
        { text = "You don't sound as though you trust him.", next = "druid2" },
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
    barrow_vigil = {
      lines = {
        { id = "bv_default", text = "I do, when the Sentinels' reports are done and no one waits on my word. I sit beside him and tell him what his people did that day, and I never tell him that I am tired, because I will not have him wake to hear that I wavered." },
        { id = "bv_priest", when = { class = "PRIEST" },
          text = "You have sat beside the sleeping and the dying, priest, so you know the vigil I mean. I keep it at his barrow and tell him what our people did that day, but never that I am tired, because I will not have him wake to hear that I wavered." },
      },
      choices = {
        { text = "Then neither of you is alone in it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else, High Priestess.", next = "BACK" },
      },
    },
    barrow_closed = {
      lines = {
        { id = "bc_default", text = "Where I go at night is between Elune and me. Ask me about the Sentinels or the Horde, and I will answer you freely." },
        { id = "bc_druid", when = { class = "DRUID" },
          text = "Did the Enclave send you to ask me that? You may tell Fandral that where I go at night is between Elune and me." },
      },
      choices = {
        { text = "Forgive me, High Priestess.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Ask, and I will answer what is mine to answer. The rest belongs to Elune, and she is far less talkative than I am." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "You have earned plain answers from me, so ask what you like. I will tell you what I tell my Sentinels, and very little less." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } },
        text = "I will answer you because the Temple answers everyone who climbs its steps. Do not mistake that for warmth." },
    },
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
    elune = {
      { id = "tp_elune", text = "Elune is the light that finds you in the dark, and she asks nothing of you but that you keep walking toward it. I have served her for ten thousand years, and she has never once been late." },
      { id = "tp_elune2", when = { class = "PRIEST" }, text = "You are one of hers, so you know already. Pray when you are afraid, and pray when you are not, because she listens to both." },
    },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil bound the Well's last waters and gave us our long years, and the demons scarred it at Hyjal. We planted Teldrassil without its blessing, and I have never been easy about that." } },
    thrall = {
      { id = "tp_thrall", text = "The young warchief fought beside us at Hyjal, and I do not forget a debt. But his people's axes are in Ashenvale now, and gratitude does not regrow a single tree." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your warchief stood with us at the mountain, and I honour that. Tell him his Warsong cut our forest as though it never happened." },
    },
    jaina = { { id = "tp_jaina", text = "Jaina Proudmoore stood at Hyjal when her own kingdom had fallen behind her, and she did not flinch. Theramore is fortunate in her, and so is the Alliance." } },
    scourge = { { id = "tp_scourge", text = "We fought the Legion's armies at Hyjal, and the dead marched in their van. They rot the north of the human lands now, and I pray to Elune that they never cross the sea to us." } },
    forsaken = {
      { id = "tp_forsaken", text = "They say they have broken from the Lich King, and perhaps they have. What they have not broken from is death, and I will not have them in my forest." },
      { id = "tp_forsaken2", when = { race = "Scourge" }, text = "You walk and speak, and you are welcome to the Temple's steps as any traveller is. My Sentinels will still watch you, and you will forgive them for it." },
    },
    burning_legion = { { id = "tp_burning_legion", text = "I have fought the Legion twice, once at the Well and once at Hyjal, and both times it cost us more than we could spare. If it comes a third time, Darnassus will be ready, or there will be no Darnassus." } },
    highborne = { { id = "tp_highborne", text = "Azshara's court looked into the Well and loved what looked back, and our world broke for it. Their children went east, and I have not missed them." } },
    magni = { { id = "tp_magni", text = "King Magni sends his diggers to our shores with his compliments and his questions. He is a good ally, and I would like him better if his people dug less." } },
    blackfathom = { { id = "tp_blackfathom", text = "That was a temple of Elune once, on the shore of Ashenvale, and the sea took it when the world broke. I am told the Twilight's Hammer pray there now, and it angers me more than I can say." } },
    bolvar = { { id = "tp_bolvar", text = "The lord regent holds Stormwind together while its king is missing and the boy on the throne is still a child. I have sent him my respect, and I hope he has time to read it." } },
    _none = { { id = "tp_none", text = "That is not a matter for the Temple of the Moon, though the Sentinels may know, for they hear what the city whispers." } },
  },
}

P:NPC {
  key = "fandral", id = TODO_NPC("Arch Druid Fandral Staghelm"), name = "Arch Druid Fandral Staghelm",
  prejudice = { class = "MAGE", amount = 12, why = "Holds every arcanist answerable for the Highborne and the Sundering." },
  rivals = { "tyrande" },
  bible = "bibles/darnassus.md", role = "noble", tier = "major",
  communities = { "darnassus" }, temper = { "abrasive" }, values = { "proud", "ambitious" },
  notices = { "race", "class" },
  impression = {
    first = "Pride sits on Arch Druid Fandral Staghelm like a mantle, pride in Teldrassil and in having led his people out of the darkness, as he tells it. He wanted me brief, and I was glad to oblige.",
    third = "{name} met Arch Druid Fandral Staghelm, who leads the Cenarion Circle from the Enclave and suffers no doubts about it.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A mage, in the Cenarion Enclave. Keep your hands at your sides, {class}; the last time your art was welcome among my people, it drowned an empire." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You. I still think your craft is a disease, but I've watched you long enough to grant that you, at least, seem to know its symptoms." },
    { id = "g_enclave", text = "Yes? The Enclave is busy, and I am busier still, so be brief." },
    { id = "g_druid", when = { class = "DRUID", race = "NightElf" }, text = "A kaldorei druid, good. The Circle needs more of our own and fewer of the rest." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Very well, speak, but make it worth the climb." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, I see, though to the kaldorei that is hardly a breath. Speak, then, and make it worth the climb." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown stronger since last you stood before me; even I can see it. Perhaps you are of some use to the Circle after all." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you have been bending the ears of my people with clever words. The kaldorei are not so easily led as you may think, so do not mistake politeness for agreement." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word reaches the Enclave that you have given offence in this city. Darnassus tolerates its guests, but it does not suffer them gladly, so be brief." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage in the Enclave. Touch nothing that is growing, and nothing that is not; I would rather not find out which you'd ruin first." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren", class = "DRUID" },
      text = "A tauren druid; Malfurion's generosity, still walking about. I will not pretend I ever agreed with it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne", class = "DRUID" },
      text = "A druid of the sky-folk, who honour the winds above the moon, I hear. The Circle's doors have been flung very wide, it seems." },
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "You are no druid, and whatever you want from the Enclave, I doubt you will understand it." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I don't think it, I remember it. The Highborne believed they could hold the Well of Eternity in their hands, and the sea came in over Zin-Azshari, and every young fool in Dalaran's towers reads from the same book with the warning pages torn out." } },
      choices = {
        { text = "Fear of magic won't save Kalimdor. Mastery of it might.", next = "prej_a", fx = { align = { order = 1 } } },
        { text = "Nature's way may be wiser. I'll walk more carefully.", next = "prej_b", fx = { align = { order = -1 } } },
        { text = "Then teach me what to watch for, Arch Druid.", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Mastery. The Highborne spoke that word, in that very tone, on the night the world broke. Go, and be the first to prove it means something." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Carefully is a start, though carefully is how the Highborne began too. Spend a season in Ashenvale with the Sentinels, and see whether you still want your tower afterwards." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Hunger, first, and then the belief that you alone can hold it. If you ever feel both at once, stop what you're doing, go to a moonwell, and sit until it passes." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Alone? I would lead with the Circle, and with allies who have earned the name. Tyrande opened our gates to the humans and their Alliance, and now dwarves dig through our ruins and call it scholarship. Tell me, what is the Alliance to you?" },
      },
      choices = {
        { text = "The Alliance is the best hope this world has.", next = "op_r1", fx = { affinity = -1, align = { honor = 1 }, opinion = { alliance = "trust" } } },
        { text = "A convenience. The kaldorei should stand on their own roots.", next = "op_r2", fx = { affinity = 2, align = { honor = -1 }, trait = { proud = 1 }, opinion = { alliance = "distrust" } } },
        { text = "Useful, so long as we remember who owes whom.", next = "op_r3", fx = { affinity = 1, trait = { cautious = 1 }, opinion = { alliance = "useful" } } },
        { text = "My people bled at Hyjal beside yours, Archdruid.", next = "op_r4", fx = { affinity = -1, align = { honor = 1 }, opinion = { alliance = "loyal" } }, when = { race = "Human" } },
        { text = "We dig because your ruins are crumbling, Archdruid.", next = "op_r5", fx = { affinity = -1, trait = { brave = 1 }, opinion = { explorers_league = "defend" } }, when = { race = "Dwarf" } },
        { text = "I'd rather not argue politics with an Archdruid.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Hope? The humans have lost their own king and cannot find him, and the dwarves dig wherever they please. If that is the world's best hope, the world is poorer than I thought." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "At last, someone who understands. We held this land for ten thousand years without a human banner, and we will hold it long after theirs have faded." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "A sensible answer. Useful allies are worth feeding, as long as no one mistakes the feeding for friendship." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Some of them did, and I do not forget it. I also do not forget that they came to Kalimdor fleeing the plague in their own lands, not to save us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r5 = {
      lines = { { id = "op_r5_default", text = "Crumbling, he says. Those ruins rest as we left them, dwarf, and a ruin at rest is not the same thing as a ruin waiting for a shovel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_fandral = {
      big = true,
      lines = { { id = "xpt_fandral_default", text = "Because every race that has ever come to Kalimdor has wanted something from its forests, and few of them have asked. The humans fell trees to build walls, the dwarves dig until the mountains bleed, and I am expected to call them friends because a war made us share a hill." } },
      choices = {
        { text = "Teldrassil should stay a home for the Kaldorei alone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your people need allies more than pride, Arch Druid.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "You ask the elements for favours, as children ask their parents. We were taught by Cenarius himself. I do not doubt your sincerity, only your understanding." } },
      choices = {
        { text = "Then I would learn, Arch Druid. Wisdom has many teachers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sincerity matters more than lineage, Staghelm. My spirits answer me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "For the wounded, certainly, and the Circle has never refused a healer's hands. But Teldrassil is a druid's work, and I will not have anyone, priestess or priest, telling me the tree needs praying over when it needs only time." } },
      choices = {
        { text = "Even a tree can be blessed, Archdruid, and I'll pray for it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right that growth needs time rather than blessings.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll go.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The tree, before anything else, because every shrine and every house on this island stands in its branches. Your Light is a fine thing for your cathedrals, but here you will defend what the Circle tells you to defend, or go back to them." } },
      choices = {
        { text = "Then I'll defend the tree, as the Circle asks.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My Light answers to no Circle, Archdruid.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll go.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some, I suppose. The Gnarlpine have turned savage and the Sentinels cannot be everywhere, so a blade near Dolanaar would not go amiss, but do not imagine that steel built this tree, or that steel will keep it." } },
      choices = {
        { text = "I'll guard the tree, Archdruid, and leave its growing to you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your tree needs more steel than you admit.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The Circle needs a great many things, and not all of them can be asked for in council. There are those in Darnassus who question how I tend this tree, and I would rather know what they whisper before they whisper it to Tyrande." },
      },
      choices = {
        { text = "I don't spy on our own people, Archdruid.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Name them, and I'll learn what they say.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_f = {
      lines = {
        { id = "hf_default", text = "Everyone keeps the balance these days, if you ask them. A hunter takes from the forest and a druid becomes it, so do not mistake the one for the other in my Enclave." },
        { id = "hf_saber", when = { origin = "nightelf_nightsaber_rider" },
          text = "A nightsaber rider, yes, I can tell by the scratches. The cats are the forest's own, and they choose their riders more carefully than the Temple chooses its priestesses." },
      },
      choices = {
        { text = "Taking and giving are both part of the balance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A druid's way is higher. I accept that.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else, Archdruid.", next = "BACK" },
      },
    },
    mage_f = {
      big = true,
      lines = {
        { id = "mf_default", text = "Faster, yes, which is exactly what the Highborne said before every disaster they ever made. Druids grew Teldrassil and druids will tend it, so keep your spells off its bark." },
      },
      choices = {
        { text = "You grew it without the dragons' blessing. You're no purer.", next = "mage_f2", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "Then the tree is the Circle's to tend.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_f2 = {
      lines = {
        { id = "mf2_default", text = "How dare you. The dragons were asked and they dithered, and while they dithered my people slept on bare ground, so I gave them a home. Get out of my sight before I remember you are a guest." },
      },
      choices = { { text = "I'll go.", next = "END" } },
    },
    warlock_f = {
      big = true,
      lines = {
        { id = "wf_default", text = "You have seen it because you carry it. Felwood was a forest of the Circle once, and the masters of your craft rotted it to the root, so tell me why I should let you stand under my tree." },
      },
      choices = {
        { text = "I'll carry it to burn the demons out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'm learning how to put it down.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Can Felwood be cleansed?", next = "warlock_f2" },
      },
    },
    warlock_f2 = {
      lines = {
        { id = "wf2_default", text = "The Circle has druids at Emerald Sanctuary trying, and they are braver than they are successful. A forest is slow to heal and quick to forget who wounded it, so it will outlive both of us before it trusts anyone again." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    xcl_wc = {
      big = true,
      lines = {
        { id = "xcl_wc_default", text = "Quieter, perhaps, though the Druids of the Fang will not grow back their sense as quickly as the Barrens grow back their grass. Naralex wished to heal that land through the Dream, and he let the Dream turn on him, and his own students went in after him and came back as serpents. That is what comes of reaching too far without a firm hand to guide you." },
      },
      choices = {
        { text = "Then the Circle needs a firm hand, as you say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Naralex dared something. I'd rather that than sit still and lecture.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What happened to the Druids of the Fang?", next = "xcl_wc2" },
      },
    },
    xcl_wc2 = {
      big = true,
      lines = { { id = "xcl_wc2_default", text = "Cobrahn, Anacondra, Pythas and Serpentis were druids of the Circle, and capable ones, before they went down to wake their master. The nightmare got into them instead, and now they believe themselves masters of the serpent and of the land above it, and I will hear no more pleading on their behalf." } },
      choices = {
        { text = "They were your kin once. I'm sorry it came to blades.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They reached for that power. They got what they reached for.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll leave the Fang to the Circle's judgment, Archdruid.", next = "BACK" },
      },
    },
    xalt_fandral = {
      big = true,
      lines = { { id = "xalt_fandral_default", text = "{alt}, a {altrace} {altclass}, who had the sense to be quiet beneath Teldrassil's boughs and hear what the tree had to say. I do not often remember visitors, so you may take it as a compliment to that one, if not yet to you." } },
      choices = {
        { text = "Then I'll listen first, Arch Druid, and speak after.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll earn your regard my own way, not by keeping quiet.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_out", when = { alt = { kin = true, race = { "Human", "Dwarf", "Gnome" } }, metBefore = false },
          text = "You have the bearing of {alt}, who came to the Enclave and listened, which few outsiders trouble themselves to do. I assume you are of the same family, since your kind seem to arrive in sets." },
        { id = "h_alt_elf", when = { alt = { kin = true, race = "NightElf" }, metBefore = false },
          text = "You have the look of {alt}, a young {altclass} who sat in the Enclave and actually heeded what I said about the forest. If you are of that one's house, I shall expect the same patience from you." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} was at the Enclave this past month, asking after the Cenarion Circle's work in Moonglade. I will tell you what I told that one: the Circle needs more hands and fewer questions." },
        { id = "o_teldrassil_tree_wrong", tags = { "news" }, when = { opinion = { topic = "teldrassil_tree", stance = "wrong" } },
          text = "You've been telling people Teldrassil should never have been grown. It stands, and you stand on it, so mind your tongue." },
        { id = "o_alliance_distrust", tags = { "news" }, when = { opinion = { topic = "alliance", stance = "distrust" } },
          text = "Ah, one who knows the kaldorei need no foreign banners. Speak, then; I have time for you." },
        { id = "o_fandral_admire", tags = { "news" }, when = { gossip = { topic = "fandral", stance = "admire" } },
          text = "I hear you've been speaking up for me in this city. Good; few have the spine to do it where the priestesses can hear." },
        { id = "o_fandral_distrust", tags = { "news" }, when = { gossip = { topic = "fandral", stance = "distrust" } },
          text = "Someone tells me you think my pride a danger to our people. Say it to my face next time, outsider, and we'll see whose pride is the larger." },
        { id = "h_pt_fandral", tags = { "news" }, when = { party = { race = { "Human", "Dwarf", "Gnome" } } },
          text = "You've brought outsiders into Teldrassil's boughs, I see. {companion} is welcome as a guest, but I hope you've told them that the World Tree is no human orchard for them to climb about in." },
        { id = "h_cl_wc", tags = { "news" }, when = { cleared = "Wailing Caverns", faction = "Alliance" }, text = "So you went into the Wailing Caverns and dragged Naralex out of his nightmare, I am told. He was always a dreamer with more ambition than sense, and I am glad someone with a blade cleaned up after him." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "The High Priestess has taken a liking to you, I'm told. Her priestesses keep the temple well, but the forest is not tended by prayer, and you would do well to remember that here." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Tyrande was not pleased with you, I hear. Do not take it to heart: she has long mistaken her own certainty for Elune's, and you are hardly the first to suffer for it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The Temple will want you, I suppose, though I'd ask you to remember that the forest was here before any prayers were said over it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The humans sent their soldiers to us once before, at Hyjal, and they fought well, though they understood nothing of the World Tree they bled for." },
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
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You again, and no more welcome than the last time. Say what you came to say and let me return to work that matters." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, in the Cenarion Enclave. I hope you came to listen, because there's nothing on these branches worth stealing." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Steel has its uses, I suppose, though Teldrassil was not grown to be defended with it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf, playing at what the druids have mastered for ten thousand years. Speak briefly, for your spirits are only a crude echo of the Emerald Dream." },
      },
      again = {
        { id = "h_again", text = "Well? Something else, or are we finished? The kaldorei may have eternity, but I do not have the afternoon." },
        { id = "h_again2", text = "Quickly. The tree does not tend itself, whatever the Temple imagines." },
      },
      choices = {
        { text = "You think my magic is dangerous, Arch Druid.", next = "prej", when = { prejudiced = true } },
        { text = "Why did you grow Teldrassil?", next = "tree" },
        { text = "Moonglade seems to go its own way.", next = "moonglade" },
        { text = "How do you and the High Priestess get along?", next = "priestess" },
        { text = "You must have known Malfurion well.", next = "malf" },
        { text = "I serve the Light, Archdruid. Not the Temple.", next = "priest_f",
          when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "Teach me, Archdruid.", next = "kin", when = { class = "DRUID", race = "NightElf" } },
        { text = "My people's druids honour the winds.", next = "sky", when = { class = "DRUID", race = "Skyborne" } },
        { text = "My nightsaber and I keep the balance too, Archdruid.", next = "hunter_f", when = { class = "HUNTER" } },
        { text = "The arcane could heal this tree faster.", next = "mage_f", when = { class = "MAGE" } },
        { text = "I've seen what the fel does to a forest.", next = "warlock_f", when = { class = "WARLOCK" } },
        { text = "Does the Circle ever need work done quietly, Archdruid?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has the Archdruid any use for a warrior's blade?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you have any use for priests, Archdruid?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have a paladin defend here, Archdruid?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a shaman's path really so crude, Arch Druid?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Naralex is awake, Archdruid. The Caverns are quieter now.", next = "xcl_wc", when = { cleared = "Wailing Caverns", faction = "Alliance" } },
        { text = "Why are you so wary of outsiders, Arch Druid?", next = "xpt_fandral", when = { party = { race = { "Human", "Dwarf", "Gnome" } } } },
        { text = "You spoke of someone like me, Arch Druid?", next = "xalt_fandral", when = { alt = true } },
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
        { text = "So you did it without their blessing.", next = "blessing", fx = { trait = { skeptical = 1 } } },
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
        { text = "You doubt it more than you let the Temple see.", tag = "Persuade", next = "burden",
          check = { pass = { any = { { disposition = { min = 70 } }, { class = "DRUID" }, { questDone = TODO_QUEST("Teldrassil") } } } },
          fail = { next = "burden_no", fx = { affinity = -1 } } },
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
        { text = "You speak as though you'd rather lead alone.", next = "op_ask" },
        { text = "And you can?", next = "vision" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vision = {
      big = true,
      lines = { { id = "v_default", text = "A people who can die must grow strong while they live. More druids, more groves, more of Kalimdor under kaldorei care instead of orc axes." } },
      choices = {
        { text = "That sounds like a war.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Kalimdor could use it.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    malf = {
      lines = { { id = "ma_default", text = "My teacher, and the greatest of us. He would have argued against this tree; he argued against most things. Until he wakes, someone must decide." } },
      choices = {
        { text = "I'd hope he wakes one day.", next = "malf2" },
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
    burden = {
      lines = {
        { id = "bu_default", text = "Every report from the moonwells and every maddened furbolg on these branches comes to me, and I read them at night while the Temple thinks I sleep. I will finish this tree and give back what Hyjal took, whatever it costs me, and no dragon or priestess will name the price." },
        { id = "bu_druid", when = { class = "DRUID" },
          text = "You are a druid, so you will feel it yourself before long: the tree has not grown as cleanly as I promised it would. I mean to mend it, whatever it costs me, and I will not wait for dragons or priestesses to name the price." },
      },
      choices = {
        { text = "Ask for help, Archdruid. There's no weakness in it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    burden_no = {
      lines = {
        { id = "bn_default", text = "I doubt nothing, and I will thank you not to repeat that sort of talk in the Enclave. Doubt is a luxury the Temple can afford and I cannot." },
        { id = "bn_priest", when = { class = "PRIEST" },
          text = "Save the confessional for your Cathedral, priest. I doubt nothing, and I have no need of a stranger to tell me otherwise." },
      },
      choices = {
        { text = "As you say, Archdruid.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "There is little on this tree I do not know, and less that I have not had to mend myself. Ask, but be quick about it." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } },
        text = "I will answer, though I doubt you will listen. Most don't, until it is far too late." },
    },
    background = { { id = "tp_bg", text = "I led our people to this tree when they had nothing left to lead them. That is the part of my story worth telling." } },
    advice = { { id = "tp_ad", text = "Don't waste time. We learned at Hyjal how little of it any of us has." } },
    teldrassil = {
      { id = "tp_teldnext", text = "It is my work, and our home. Ask, if you must.", next = "tree" },
      { id = "tp_teld", text = "Ask Corithras about the moonwells, if you like. Then come back and tell me he worries too much." },
    },
    malfurion = { { id = "tp_malf", text = "My teacher. Ask the Temple about him; they have more patience for the subject." } },
    cenarion_circle = { { id = "tp_circle", text = "Mine to lead, for now. I mean to leave it stronger than I found it, whatever Moonglade thinks." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil was wounded at Hyjal and the dragons gave us nothing more, so I gave our people a new tree. Ask the Temple whether I should have waited, and see how long they take to answer." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is where my teacher sleeps, and where all our druids walk in time. It is not a place for the impatient, and I have had ten thousand years to learn that." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children guard the Dream's gates, and they were not pleased with Teldrassil. Dragons are seldom pleased with anything they did not think of first." } },
    burning_legion = { { id = "tp_burning_legion", text = "We stood at Hyjal and watched Archimonde fall, and I will not see our people that helpless again. That is why the tree stands, and why I do not apologise for it." } },
    highborne = {
      { id = "tp_highborne", text = "The Highborne are our oldest shame, and their magic our oldest wound. I watch for any of it on this tree, and I do not watch gently." },
      { id = "tp_highborne2", when = { class = "MAGE" }, text = "You practise the arcane, and in my city. I will tolerate it because the Alliance asks me to, so be careful what you call up here." },
    },
    thrall = { { id = "tp_thrall", text = "The orcs' warchief is a better leader than the beasts who came before him, I grant. But his people still cut Ashenvale, so what is a good leader worth to us?" } },
    dalaran = { { id = "tp_dalaran", text = "The human wizards' city of Dalaran is closing its gates and rebuilding behind them, which is the first sensible thing I have heard of it. Magic like theirs is what broke the world." } },
    elune = { { id = "tp_elune", text = "Elune is the Temple's, and Tyrande keeps her well. The druids keep the forest, and both of us keep this tree standing." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw kept their minds when the other furbolgs lost theirs, and they guard the passes to Winterspring jealously. I respect a people who keep to their own ground." } },
    _none = { { id = "tp_none", text = "That is not the Circle's concern, so ask a Sentinel. They enjoy being asked things, and they have the patience of the Temple besides." } },
  },
}

P:NPC {
  key = "mathrengyl", id = TODO_NPC("Mathrengyl Bearwalker"), name = "Mathrengyl Bearwalker",
  bible = "bibles/darnassus.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "calm" }, values = { "wise", "loyal" },
  notices = { "form", "class" },
  impression = {
    first = "Mathrengyl Bearwalker has the calm of someone who once stood beside power and found he preferred teaching. Every question gets a patient answer from him, even the foolish ones.",
    third = "{name} met Mathrengyl Bearwalker, the dignified trainer of druids in the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "Elune-adore, young one. The Enclave's doors are open to you, and so is my time." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "What brings you to the Cenarion Circle, friend? Ask, and I'll answer if I can." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, friend, and the Enclave's doors stayed open the whole while. Ask what you came to ask." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since we last spoke, and I'm glad to see it. The wild teaches faster than any trainer, though it charges more for the lesson." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been helping folk in the city these past days. That is the Circle's work as much as any druid's, whatever some may say." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, the bear sits well on you. The Great Bear Spirit chose rightly." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "You wear the cat indoors, I see. The Great Cat Spirit is as playful as it is deadly, so please be the first of those in here." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "I would do as the Archdruid tells me, and he counsels patience while the Warsong axes ring. You have seen that forest yourself, I think, so tell me what should be done about those orcs." },
      },
      choices = {
        { text = "Drive them out, every camp and every axe.", next = "op_r1", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { ashenvale = "war" } } },
        { text = "Let them take deadwood. Orgrimmar has to burn something.", next = "op_r2", fx = { align = { light = 1 }, trait = { kind = 1 }, opinion = { ashenvale = "compromise" } } },
        { text = "Talk to Thrall. The Warchief is no Hellscream.", next = "op_r3", fx = { trait = { curious = 1 }, opinion = { ashenvale = "talk", warchief = "trust" } } },
        { text = "Wake the forest against them. The Ancients still answer.", next = "op_r4", fx = { affinity = 1, opinion = { ashenvale = "awaken" } }, when = { class = "DRUID" } },
        { text = "I don't know Ashenvale well enough to say.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Many of my Sentinel friends would cheer that. I only wonder how many kaldorei we can spare to buy back each tree." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "A druid of the old ways might agree with you. The Warsong have never once been content with deadwood, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Perhaps the orc who leads them is wiser than the ones who cut for him. I have no road to his door, and the High Priestess has no wish to find one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "The Ancients answer slowly and they answer whole, {class}, and an awakened forest does not stop at the orcs. Remember that before you call on it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_mathrengyl = {
      big = true,
      lines = { { id = "xpt_mathrengyl_default", text = "Everything you'd want and none of it at once: a healer in one breath and a bear in the next, and a cat when you need someone to scout ahead. The difficulty is that a druid can be all of those things, so the company forgets they are one person who also gets tired." } },
      choices = {
        { text = "We'll give them one role and keep to it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "We'll let them choose their shape. That's their gift.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They are as close as neighbours who speak different tongues. We listen to the Dream and to Cenarius; you listen to the world's own voices. Neither is wrong, but both can be misheard." } },
      choices = {
        { text = "Then we should listen carefully, together, and with discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Each must listen in his own way, without rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only whether your Light ever tells you to stay your hand, because the Claw's way is to strike when the balance demands it and grieve afterward. I suspect your order and mine lose the same sleep over it." } },
      choices = {
        { text = "The Light asks mercy of me whenever mercy is possible.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "When evil stands before me, I strike without grieving.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A druid becomes the bear for a while and must remember how to come back, which is harder than it sounds. A hunter stays who they are and earns the beast's trust instead, and I sometimes think yours is the humbler path." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A druid becomes the bear for a while, while a hunter stays who they are and earns the beast's trust instead. Your {pet} trusts you; I can see it in how it sits, and no druid can take that by changing shape." },
      },
      choices = {
        { text = "My companion is my equal, not my tool.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast follows whoever feeds it, nothing more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because they remember the Well of Eternity, and the Highborne who drank from it until they couldn't stop. I don't hold your craft against you, but I knew some of those Highborne before they went mad, and I'd ask you to keep a careful measure of what you take." },
      },
      choices = {
        { text = "I'll keep the measure. I've no wish to repeat their mistake.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Highborne failed. That doesn't mean the arcane did.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I have walked through Felwood, which was Ashenvale's green heart before the Legion's taint soaked into it, and the trees there still weep. Druids are healing it one grove at a time, and I'd thank you not to make us start over in Teldrassil." },
      },
      choices = {
        { text = "I'll keep my servants far from these groves.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Felwood was the Legion's doing. My power answers to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    claw_w = {
      lines = {
        { id = "cw_default", text = "You hold the line with a shield you can put down, and we hold it with a body we have to remember to take off. Some of the first Druids of the Claw forgot how, long ago, and still roam the deep woods as beasts, so I teach the heart before the claws." },
      },
      choices = {
        { text = "Could a warrior learn that kind of calm?", next = "claw_w2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    claw_w2 = {
      lines = {
        { id = "cw2_default", text = "The good ones already have it, the ones who can stop swinging when the fight is done. Watch yourself after a battle and see how long your hands shake; that is your rage telling you how much of you it owns." },
      },
      choices = {
        { text = "My rage serves me, not the other way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather let it run and ride it.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The Circle has use for anyone who keeps the balance, and I've known quiet blades do more for it than loud ones. The Sentinels watch the borders and we tend what grows within them, but there are always things in Ashenvale and Felwood that need finding before they find us." },
      },
      choices = {
        { text = "I'll serve the balance, if you'll have me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I serve myself first, druid.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xcl_mara = {
      big = true,
      lines = {
        { id = "xcl_mara_default", text = "Then Zaetar may lie a little easier, though he has been dead a very long time. He loved Theradras, and the centaur were their children, and those children killed their own father in their first rage, and she has kept his body in the stone below Desolace ever since. Her grief has been souring that earth for longer than Teldrassil has been a seed." },
      },
      choices = {
        { text = "Even the centaur might heal, now that her grip is gone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The centaur are her poison given legs. They deserve no mercy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Does Remulos know what happened to his brother?", next = "xcl_mara2" },
      },
    },
    xcl_mara2 = {
      lines = { { id = "xcl_mara2_default", text = "Remulos has never asked a mortal for anything that I know of, but he grieves for his brother the way only an immortal can, which is quietly and for ten thousand years. If you ever go to Moonglade, you need not tell him what you did, because I think he will already know." } },
      choices = {
        { text = "I'll remember that, if Moonglade ever calls me.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_mathrengyl", tags = { "news" }, when = { party = { class = "DRUID" } },
          text = "{companion} is a druid, I think; I felt the bear in them before I saw them. Druids travel well with others, though they'll go quiet for days and then speak to a tree, so be patient." },
        { id = "h_cl_mara", tags = { "news" }, when = { cleared = "Maraudon", faction = "Alliance" }, text = "Word came up from Desolace that someone reached the heart of Maraudon and put an end to Princess Theradras. Zaetar was Cenarius's own son, and every druid in this Enclave has grieved for him at some point, so I find I am grateful to you in a very old way." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in the Cenarion Enclave. Sit, if you like, for I've long wanted to ask one of your order how you decide when to heal and when to strike." },
        { id = "h_default", text = "I am Mathrengyl Bearwalker, and I train the druids of the Enclave, and I walk the path of the Druids of the Claw myself. Once I stood at the Archdruid's side, but now I stand with the young ones, and after so many centuries that suits me better." },
        { id = "h_call", tags = { "news" }, when = { questActive = TODO_QUEST("Heeding the Call") },
          text = "You heard the call, and not everyone does. Sit, and we will speak of what it means to walk as more than one creature." },
        { id = "h_claw", when = { questActive = TODO_QUEST("Body and Heart") },
          text = "The Great Bear Spirit has shown you the body, and now Lunaclaw will test the heart. He waits by the Moonkin Stone near Auberdine, so go humbly." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Lessons Anew") },
          text = "Auberdine has had trouble with poisons. A druid who can draw poison out of the living is worth ten who can only watch, so learn it well." },
        { id = "h_aquatic", when = { questDone = TODO_QUEST("Aquatic Form") },
          text = "The sea is yours now as well as the forest. Few of us are comfortable in both, but try to be." },
        { id = "h_strife", when = { metBefore = true },
          text = "You will hear talk that the Circle is divided, but do not believe it. Fandral leads us well, and his vision built the very tree you stand on." },
        { id = "h_bear", when = { questDone = TODO_QUEST("Body and Heart") }, text = "You move differently since you met the Great Bear, heavier on your feet and lighter in your head, which is exactly how it should be." },
        { id = "h_questions", when = { metBefore = true, class = "DRUID" }, text = "Every druid who passes through the Enclave leaves something behind, usually a question. Yours are good ones, so keep asking them." },
        { id = "h_cat", tags = { "news" }, when = { questActive = TODO_QUEST("The Great Cat Spirit") },
          text = "The Great Cat Spirit sets each generation its own trial. I can't tell you what yours will be, only that it plays before it bites." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "You smell of the arcane, {class}, like smoke caught in a cloak. Nobody will say anything, but the older druids will step a little to one side." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I trained bears for the Archdruid when he still listened to me, warlock, and in my mind they are all growling at you right now." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you walk the way the beasts do. Some of my students still crash through the underbrush like tauren, and they could stand to watch you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue in the Enclave. The young druids tell me you came in by the side path, which is the one only they use when they're late." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. You walk a path close to ours, though you came to it through stone rather than root, so sit and tell me what the spirits say to you." },
        { id = "h_initiate", when = { origin = "nightelf_druid_initiate" }, text = "You woke with the rest of the Circle, I remember, blinking at a world that had moved on without us. Some of the old druids still wake in the night expecting the Dream, and I tell them what I'll tell you: the waking world is ours too, and it needs us more." },
      },
      again = {
        { id = "h_again", text = "Ask on. The young ones' questions are the best part of my day." },
        { id = "h_again2", text = "What else? Take your time, as the Enclave does." },
      },
      choices = {
        { text = "What would you do about the logging in Ashenvale?", next = "op_ask" },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What is a Druid of the Claw?", next = "claw" },
        { text = "You serve the Archdruid?", next = "second" },
        { text = "Which parts of this world are mine, Mathrengyl? I can't tell yet.", next = "xwoke", when = { origin = "nightelf_druid_initiate" } },
        { text = "Is anything troubling the forests beyond Teldrassil?", next = "auberdine" },
        { text = "What can a priest learn from a druid?", next = "healers", when = { class = "PRIEST" } },
        { text = "Bear and warrior both stand in front. What's the difference?", next = "claw_w", when = { class = "WARRIOR" } },
        { text = "Why do the old druids step aside from a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How does a druid's bond with beasts differ from a hunter's?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you ever seen what a demon does to a forest?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You wanted to ask me something, Mathrengyl?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Circle have any use for a rogue, Mathrengyl?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Are the druid's way and the shaman's really so close, Mathrengyl?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Princess Theradras is dead, Mathrengyl. Maraudon is broken.", next = "xcl_mara", when = { cleared = "Maraudon", faction = "Alliance" } },
        { text = "What does a druid give to a company like ours?", next = "xpt_mathrengyl", when = { party = { class = "DRUID" } } },
        { text = "My father sleeps in the Barrow Dens. Does he hear me at all?", next = "xorig_dream", when = { origin = "nightelf_dreamer_kin" } },
        { text = "Farewell.", next = "END" },
      },
    },
    xorig_dream = {
      lines = {
        { id = "xdr_default", text = "I won't lie to you, child, because the families of the sleepers deserve the truth more than comfort. Some who woke said the waking world reached them like rain heard from far away, and some heard nothing at all. Do you go to him often?" },
      },
      choices = {
        { text = "Every season, and I tell him everything.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Less often now. It's hard to talk to silence.", next = "BACK" },
        { text = "Something else, Mathrengyl.", next = "BACK" },
      },
    },
    xwoke = {
      big = true,
      lines = {
        { id = "xwk_default", text = "None of it, and all of it, which I know is a teacher's answer. We slept while the trolls were driven back and the humans built their kingdoms, and we woke to find the forest on fire and orcs in it, so some of the Circle say the world is ours to reclaim, and some say we're only its keepers. Where do you stand?" },
      },
      choices = {
        { text = "Keepers. We slept; we don't get to claim it now.", next = "BACK", fx = { affinity = 2, align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Ours. The forest needs someone to hold it, and we're here.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, trait = { stern = 1 } } },
        { text = "What did you find, when you woke?", next = "xwoke_found" },
      },
    },
    xwoke_found = {
      lines = {
        { id = "xwf_default", text = "Smoke, mostly, and Malfurion gone into the Dream again almost before I had my feet under me. I found I could still teach, though, and that the young ones needed teaching more than the old ones needed company, so I came here and have not regretted it once." },
      },
      choices = {
        { text = "Then I'll start by learning from you.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
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
        { text = "Does the whole Circle stand behind him?", next = "divided" },
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
      lines = { { id = "a_default", text = "Someone has been poisoning the animals around Auberdine, and the village couldn't cure them. I'll confess it surprised me. Poison doesn't drift into a forest by chance." } },
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
    knows = {
      { id = "tp_knows", text = "A teacher learns to keep a great many things in his head at once. Ask me of any of these, and I will answer as well as I am able." },
    },
    background = { { id = "tp_bg", text = "I am one of the Archdruid's druids, and a teacher. The young ones keep me honest, and the bear keeps me humble." } },
    advice = { { id = "tp_ad", text = "Learn the bear before the cat, and the cat before you think you know either of them." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle is united, whatever you have heard, for disagreement is not division. The Archdruid has broad shoulders." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "Every druid who sleeps deeply enough brushes the Dream sooner or later. You'll know it by the green at the edges of everything, and by how much you don't want to wake." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil still stands on Hyjal, scarred but standing, and the Circle tends it. Some of us would rather tend it than this one, though we don't say so in the Enclave." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's flight keeps the Dream, and they are kind in the way old things are kind, which is to say slowly. If you see one awake in the waking world, something is wrong." } },
    elune = { { id = "tp_elune", text = "The bear in me prays to Cenarius and the elf in me prays to Elune, and so far neither has complained. Elune is very patient with druids." } },
    timbermaw = { { id = "tp_timbermaw", text = "Good furbolgs, and wary ones, which is wise of them after what happened to their cousins. Bring them a gift before you bring them a question." } },
    _none = { { id = "tp_none", text = "That's beyond my teaching. Ask in the Temple of the Moon, perhaps, for the priestesses remember what the druids slept through." } },
  },
}

P:NPC {
  key = "amoora", id = TODO_NPC("Priestess A'moora"), name = "Priestess A'moora",
  bible = "bibles/darnassus.md", role = "priest", tier = "quest",
  communities = { "darnassus" }, temper = { "gentle" }, values = { "devout", "kind" },
  notices = { "class", "death", "origin" },
  impression = {
    first = "Priestess A'moora called me 'little star' as if she had known me for years. Most come to her tired, she says, and I did leave the Temple pool lighter than I arrived.",
    third = "{name} met Priestess A'moora, who tends the Temple of the Moon's pool and the weary souls who come to it.",
  },

  greetings = {
    { id = "g_moon", text = "Even here under the branches, Elune's light finds you. Come in and sit by the pool." },
    { id = "g_back", when = { metBefore = true }, text = "There you are, little star. The moon remembers those who return." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, little star, and the pool has missed your reflection. Come and sit, and rest your tired feet." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown brighter since I last saw you, little star, and Elune sees it too. You've grown thinner too, so eat something before you go." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear someone in the city is troubled with you, little star. Sit by the pool a while, then go gently and make it right." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone has spoken warmly of you in the Temple, little star. The moon remembers kindness, and so do I." },
  },

  notice = {
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "You've walked the other side not long ago, so rest here a while. The moon is kind to those who've seen its dark half." },
    { id = "n_hyjal", cat = "origin", when = { origin = "nightelf_hyjal_survivor" },
      text = "You were on the mountain, weren't you, little star? You have that look so many of us have now, counting the days as if each one had to be paid back. Elune isn't keeping a ledger, and I promise you she never was." },
    { id = "n_novice", cat = "origin", when = { origin = "nightelf_priestess" },
      text = "Ah, one of the Temple's novices, still learning to read her silences. Don't let the elder sisters hurry you, little star, because I spent my first century certain she'd forgotten my name." },
  },

  start = "hello",
  nodes = {
    xpt_amoora = {
      big = true,
      lines = { { id = "xpt_amoora_default", text = "She watches over whoever walks under her light, little star, which is everyone who walks at night, and I think that includes your friends whether they pray or not. The faithful only notice it more." } },
      choices = {
        { text = "Then I'll pray for them, whether they ask or not.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'd rather trust their blades than any goddess, Priestess.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Elune is patient with all who seek her. Your spirits are part of the world she cradles. But I ask you to keep them quiet within the Temple, little star." } },
      choices = {
        { text = "I will honour the Temple's peace, Priestess.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My spirits are not so easily silenced.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Sentinels home from Ashenvale, mostly, and the families of those who didn't come home. I can mend a wound in a moment, but grief takes much longer, and I find that sitting with them helps more than any prayer I know." } },
      choices = {
        { text = "Then I'll sit with them too, for as long as it takes.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grief passes on its own, and it's wounds that need healing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Elune turns no one away who comes in peace, and your order fights to protect the weak, as our Sentinels do. Rest by the pool before you go back to it, because a protector who never rests will not protect anyone for long." } },
      choices = {
        { text = "I'll rest, then, and go back stronger for it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "There's no rest for me while the weak need guarding.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The waters ease the body, but what I see most in warriors is a tiredness the waters can't reach. You hold the line so that others needn't, and Elune knows the cost even when your captains forget it." } },
      choices = {
        { text = "I'll take the hard watches so others can sleep.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Tiredness is weakness. I've no time for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "She does, for she lights the paths you walk at night and the eyes of every beast you follow. Take only what the hunt needs and thank her for the rest, and she will not turn her face from you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "She does, for she lights the paths you walk at night and the eyes of every beast you follow. She watches over your {pet} as well, little star, so let it rest by the pool a while." },
      },
      choices = {
        { text = "I thank Elune for every hunt.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My aim feeds me, not the moon.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not strange at all, child. Shadow belongs to Elune as much as moonlight does, and the ones who live in it often need her quiet more than anyone, so come whenever you like and leave your daggers by the door." },
      },
      choices = {
        { text = "Then I'll leave them, and rest a while.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My daggers stay where I can reach them, Priestess.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because our grandmothers' grandmothers loved magic so much they nearly unmade the world for it, and the sea still covers what they lost. You aren't to blame for the Highborne, of course, but you'll find that the old grief is slow to fade here." },
      },
      choices = {
        { text = "I'll carry my magic gently while I'm among you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your grief isn't mine to carry, Priestess.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_a = {
      lines = {
        { id = "ga_default", text = "You carry it with you, little star; you look up at the branches as if you were checking for the ceiling. My people lost our home too, when the Well fell, and I can tell you the moon finds you wherever you end up." },
      },
      choices = {
        { text = "We'll take Gnomeregan back one day.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Thank you, Priestess.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We do, little star, though you hear her in the leaves and we hear her in the moonlight. The Sisterhood kept watch while your teachers slept in the Dream, and I like to think Elune minded both of us." } },
      choices = {
        { text = "Then the Temple and the Enclave should stand closer together.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wild answers to no temple, Priestess, not even this one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Elune turns no one away, little star, but her light shows what we carry, and yours shows a shadow at your heel. The Sisterhood remembers the Legion too well to welcome your servant inside, so leave it at the door and come in as yourself." },
      },
      choices = {
        { text = "I'll leave it at the door, Priestess.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's part of me. Where I go, it goes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_arcane_magic_hate", tags = { "news" }, when = { gossip = { topic = "arcane_magic", stance = "hate" } },
          text = "Sister Alathea says you would burn Dalaran's books. Elune asks us to fear the arcane, child, not to hate those who were born to it." },
        { id = "h_pt_amoora", tags = { "news" }, when = { party = true },
          text = "Little star, you've brought friends to the Temple pool! Let them rest a while; I can see the road on all your faces, and Elune doesn't mind how many of you sit by the water." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Welcome, priest. Come and sit by the pool a while, for those who heal others are the last to rest, and Elune knows it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in the Temple of the Moon! You're welcome here, {class}, and I hope you'll let me tend to you as gladly as you tend to others." },
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
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You came in very quietly, and the pool barely rippled. Sit down if you like, because nobody is watching you here except the moon." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Welcome, {class}. The water here is only water, I'm afraid, and it won't answer to any spell, but it's lovely to look at." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "You walk like someone who's slept in their armor three nights running, little star. Sit by the pool a while, because warriors forget that they tire too." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, little star, with the forest still clinging to your boots. The Temple is quiet, so let it rest you as well as any glade would." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, little star, with a little moss still on your sleeve. Some say Cenarius was Elune's own son, so you are as much at home in her Temple as any sister." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Little star, you carry a shadow with you, and I can see it is a heavy one. Rest by the pool a while, though I'll ask your companion to wait beyond the Temple doors." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Little star, you walk with spirits. Elune welcomes you, though I sense your spirits speak louder than she does, so come and rest by the pool where she can be heard." },
      },
      again = {
        { id = "h_again", text = "What else, little star? The moon is in no hurry tonight." },
        { id = "h_again2", text = "Sit as long as you like. The pool doesn't mind company." },
      },
      choices = {
        { text = "What do you pray for?", next = "pray" },
        { text = "Tell me about Elune.", next = "elune" },
        { text = "Lady Sathrah sounds like a name from an old story.", next = "sathrah", when = { any = { { questActive = TODO_QUEST("Tears of the Moon") }, { questActive = TODO_QUEST("Sathrah's Sacrifice") }, { questDone = TODO_QUEST("Sathrah's Sacrifice") } } } },
        { text = "Does Elune hear a priest of the Light?", next = "light",
          when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "I'm a long way from Gnomeregan, Priestess.", next = "gnome_a", when = { race = "Gnome" } },
        { text = "Is it strange for a rogue to come to the temple?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why are your people so wary of mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can the Temple's pool do anything for a warrior's wounds?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does Elune watch over hunters, Priestess?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who comes to the Temple's pool most often, Priestess?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Elune welcome soldiers of the Light, Priestess?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the priestesses and the druids really pray to the same goddess?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will Elune turn me away, Priestess?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does Elune mind the spirits that walk with me, Priestess?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Does Elune watch over a whole company, or only the faithful?", next = "xpt_amoora", when = { party = true } },
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
        { text = "Gentle light won't stop an orc's axe, Priestess.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Names won't bring anyone home, so pray for the living.", next = "BACK", fx = { align = { light = -1 } } },
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
      choices = {
        { text = "I will. Thank you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll keep to my own prayers, thank you.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Sit by the pool a moment, little star, and ask whatever you need. I will tell you what the Sisterhood has taught me." },
    },
    background = { { id = "tp_bg", text = "I am a priestess of the Sisterhood, and I tend the pool and whoever comes to it. That is all the story there is, little star." } },
    advice = { { id = "tp_ad", text = "Rest when the road lets you. The moon will still be there; you might not be, if you never stop." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "We heal, we pray, and we train with the bow. Visitors are always surprised by the third." } },
    cenarion_circle = { { id = "tp_circle", text = "They are our brothers and sisters of the wild. The Temple and the Enclave love each other, mostly, if loudly at times." } },
    elune = {
      { id = "tp_elune", text = "Elune is the moon's light on the water, little star, and she shines on everyone, even those who never look up. You looked up, so she's pleased with you already." },
      { id = "tp_elune2", when = { class = "PRIEST" }, text = "You're one of hers, little star, so you know she never leaves. Come and sit by the pool when your heart is heavy, and let her lighten it." },
    },
    holy_light = { { id = "tp_holy_light", text = "The humans call their faith the Light, and I've met their priests and found them kind. Whatever they pray to, it heals the same wounds, and that's enough for me." } },
    nordrassil = { { id = "tp_nordrassil", text = "The first tree is on Mount Hyjal, little star, far north of here. It gave us our long lives, and I say a little thank-you to it every evening." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I've heard of the Faire, with its lanterns and its strange games, though it's never come to our tree. The young sisters talk of it like it's the moon itself come down." } },
    _none = { { id = "tp_none", text = "I couldn't say, little star. The High Priestess might, for she has seen more moons than any of us." } },
  },
}

P:NPC {
  key = "gracina", id = TODO_NPC("Gracina Spiritmight"), name = "Gracina Spiritmight",
  bible = "bibles/darnassus.md", role = "scholar", tier = "quest",
  communities = { "darnassus" }, temper = { "intent" }, values = { "curious", "devout" },
  notices = { "lore", "trophy" },
  impression = {
    first = "Some of Gracina Spiritmight's specimens are only mostly dead, and she wants to hear about every creature I have ever seen. Something in the southern deserts frightens her badly, and she does not strike me as easily frightened.",
    third = "{name} met Gracina Spiritmight, the priestess and scholar of the Temple of the Moon whose study of insects has led her somewhere troubling.",
  },

  greetings = {
    { id = "g_study", text = "Careful with the specimens. Some of them are only mostly dead." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you bring anything? Shells, stings or chitin, I'm not particular." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}! You must have seen something new out there, so tell me everything, and don't leave out the legs." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much stronger since you last visited my specimens. Strong enough, perhaps, to bring me back something that's still mostly alive." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone in the city took a story of yours for truth when it wasn't. Please don't do that with my specimens, because I'm cataloguing them." },
  },

  notice = {
    { id = "n_skinner", cat = "trophy", when = { profession = "Skinning" },
      text = "A skinner! Then you've handled more of Azeroth's creatures than most scholars ever will. Tell me what you've seen." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some of them are only mostly dead, so perhaps they do. The southern deserts frighten me; something lives there that I cannot name. Your spirits might know." } },
      choices = {
        { text = "Study it carefully, Gracina. Knowledge guards us.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some things should be left unnamed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I don't yet know whether they are evil or only hungry, and I would rather understand them before your order decides. But if the reports from the south are true, there will be a great many of them, and I would want paladins standing between them and Kalimdor." } },
      choices = {
        { text = "Understand them first, then, and I'll wait on your word.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Anything that swarms like that must be stopped now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only intact ones, and that is where warriors disappoint me, because you see a beast and think of its throat. If you meet something strange in the south, please strike it once and cleanly, so that I have something left to study." } },
      choices = {
        { text = "I'll bring them back whole, if I can.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it fights me, there won't be much left.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Demons, for one, which first came because Queen Azshara's Highborne opened the way for them through the Well. There are also stranger things in the corners of Azshara and Felwood that I can't yet name, and so I'd like you to remember that every door your magic opens may be found by something else." },
      },
      choices = {
        { text = "I'll close every door behind me, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If something comes through, I'll study it too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I could learn much, and I will admit the temptation, but the Highborne began by studying too. I will read about your servant in old books written by those who fought them, and I'll leave it to you whether you end up in the next one." },
      },
      choices = {
        { text = "Then I'll make sure the books speak kindly of me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your old books were written by losers of the argument.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_g = {
      lines = {
        { id = "hg_default", text = "Then tell me this, hunter: did one ever run from you? Wolves scatter when the leader falls and boars bolt when they're hurt, but I've never once read of a silithid turning back, and that frightens me more than the mandibles." },
      },
      choices = {
        { text = "No. They kept coming until none were left.", next = "hunter_g2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_g2 = {
      lines = {
        { id = "hg2_default", text = "As I feared. Something behind them gives the orders, somewhere deeper than Feralas or Tanaris, and a creature that doesn't fear for itself is only a hand on someone else's arm. I would very much like to know whose." },
      },
      choices = { { text = "I'll keep my eyes open.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of them do, because the Circle keeps a hold in Silithus, and their letters frighten me more than my specimens do. The Archdruid calls it their concern rather than ours, and I wish he would read those letters himself." } },
      choices = {
        { text = "The Archdruid has his reasons, and I'll trust the Circle's watchers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then someone should take your letters past him, and I'll do it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Anything that oughtn't to exist, preserved and intact, and you'd be amazed how hard that is to come by from a Temple terrace. The southern deserts trouble me most, because what crawls out of Silithus is like nothing I've ever catalogued." },
      },
      choices = {
        { text = "Some things are better left unfound, Gracina.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Name your price, and I'll fetch anything.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I study creatures that don't belong in this world, and I'm told your order has put a good many of them back where they came from." },
        { id = "h_default", text = "I am Gracina Spiritmight, priestess and scholar, and I study the creatures that belong to this world alone. Lately, Elune help me, I study the ones that don't seem to belong to it at all, insects from the south that the scouts call silithid." },
        { id = "h_pestlezugg", when = { heardLine = "pestlezugg.h_default" },
          text = "A goblin alchemist in Gadgetzan has been asking about my insect studies. A goblin, asking a priestess. Whatever is under the sand must be worse than I feared." },
        { id = "h_silithid", tags = { "news" }, when = { questActive = TODO_QUEST("Rise of the Silithid") },
          text = "So this report is for me? Let me see what it says... yes, silithid, just as I feared. Learn that name, because you will be hearing it more than you'd like." },
        { id = "h_low", when = { maxLevel = 40 },
          text = "Things live in the southern deserts that frighten me more than any orc. You're young yet, so come back to me when you're not." },
        { id = "h_fandral", when = { heardLine = "fandral.h_default" },
          text = "You've met the Archdruid, then. He thinks my insects are a scholar's hobby, and he is very certain of it, which is exactly what worries me." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Another priest. People forget the Sisterhood studies as well as prays. Someone ought to write down everything that crawls under the moon." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, and you've arrived at a fitting moment. I've been reading about creatures that the arcane drew here from elsewhere, and none of them are kind." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I study creatures that do not belong in this world, warlock, and I can see one standing behind you. I'd rather it didn't come any closer to my notes." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll have met more creatures up close than any of my scholars, I imagine, and with less time to take notes." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, at last. You of all people should care when something crawls out of the earth that the earth never made, so I would value your eyes on my specimens." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! You go places nobody else can, I suppose, and I would love to hear what you've seen in them, whenever you'd care to share." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Silithid", min = 40 } },
          text = "You've been killing silithid, haven't you? I can smell that sour, dusty reek on your boots, and I want to hear everything you saw down there in the south." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Tell me, do the spirits know of creatures I have not catalogued? I have been at this for three centuries, and I am still eager for every account." },
      },
      again = {
        { id = "h_again", text = "Go on, but mind the jar on your left; it bites." },
        { id = "h_again2", text = "Ask. I like questions better than specimens, most days." },
      },
      choices = {
        { text = "What are you studying?", next = "study" },
        { text = "Something must frighten even you.", next = "fear" },
        { text = "What are the silithid?", next = "silithid" },
        { text = "I carried that report. What now?", next = "silithid_done", when = { questDone = TODO_QUEST("Rise of the Silithid") } },
        { text = "I've never met a priestess who studies insects.", next = "priest_g", when = { class = "PRIEST" } },
        { text = "I've tracked beasts across Kalimdor. These insects too.", next = "hunter_g", when = { class = "HUNTER" } },
        { text = "What creatures does the arcane draw into this world?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you want a warrior to bring back specimens, Gracina?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Couldn't you learn more about demons from a warlock?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are the silithid an evil a paladin should face?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Cenarion Circle know about these insects of yours?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would you have a rogue bring you, Gracina?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do your specimens have spirits, Gracina?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
      lines = { { id = "sd_default", text = "You carried it, and you've seen the sand move. Most of my colleagues have only read about it in my letters." } },
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
        { text = "I'd rather trust what I can see than pray for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My notes cover far more than I can say in one sitting, so choose where you would like me to begin." },
    },
    background = { { id = "tp_bg", text = "A priestess who reads more than she prays, the Temple would tell you. Some weeks they'd be right." } },
    advice = { { id = "tp_ad", text = "If it has more than four legs, assume it's cleverer than it looks." } },
    silithid = {
      { id = "tp_silinext", text = "Ah, the hive. Sit down, because I have notes.", next = "silithid" },
      { id = "tp_sili", text = "The worst thing my people ever fought, and we've fought demons." },
    },
    elune = { { id = "tp_elune", text = "Elune is the moon's goddess, and the texts make her far more complicated than the hymns do. I read the texts, and then I go and sing the hymns, because both are true." } },
    highborne = { { id = "tp_highborne", text = "The Highborne libraries were the greatest our people ever had, and they sank with Zin-Azshari. I think of all those books under the sea, and it hurts me nearly as much as the war." } },
    dire_maul = {
      { id = "tp_dire_maul", text = "Eldre'Thalas, the humans call it Dire Maul, was a Highborne city in Feralas. If even a few of the stories are true there's still a library inside, and I would cross the whole sea to see it." },
      { id = "tp_dire_maul2", when = { disposition = { min = 65 } }, text = "If you go to Dire Maul, look for anything with writing on it and bring it back to me. I'll read it carefully, I promise, and I'll even say a prayer for whoever wrote it." },
    },
    ahn_qiraj = { { id = "tp_ahn_qiraj", text = "The Temple has old accounts of a war in the southern desert, before the Sundering, against something that crawled. I've only seen fragments, and the fragments frighten me." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "Human scholars, and very good ones by the letters I've read, though they ask for too much in return. They wanted our Highborne texts, and the Temple said no." } },
    _none = { { id = "tp_none", text = "That's not my field, though if it had six legs, I'd be all ears." } },
  },
}

P:NPC {
  key = "saelienne", id = TODO_NPC("Innkeeper Saelienne"), name = "Innkeeper Saelienne", gender = "female",
  bible = "bibles/darnassus.md", role = "innkeeper", tier = "service",
  communities = { "darnassus" }, temper = { "warm" }, values = { "kind" },
  notices = { "weary", "race" },
  impression = {
    first = "Innkeeper Saelienne warned me not to look down from the terrace, which of course made me do it. Her inn rocks gently with the branches at night, and she swears most guests find it soothing.",
    third = "{name} found rest at Innkeeper Saelienne's inn on the Craftsmen's Terrace, high in the branches of Darnassus.",
  },

  greetings = {
    { id = "g_rest", text = "Ishnu-alah, traveller, and rest a while. The branches rock a little at night, and most find it soothing." },
    { id = "g_home", when = { homeInn = { "Darnassus", "Craftsmen's Terrace" } }, text = "You're home. Elune guard your dreams tonight." },
    { id = "g_fl_moon", when = { flirt = true, timeOfDay = "night", chance = 0.35 },
      text = "Ishnu-alah. The moon is very bright on the terrace tonight, and I find I'm glad you came up the stairs to see it, though I couldn't tell you why." },
    { id = "g_fl_back", when = { flirt = true, npcFlagBefore = "fl_moon" }, cooldown = "3d",
      text = "You've come back. I left the lantern by the east branch lit, in case you wanted to sit beneath the moon again, and I'll pretend I do that for every guest." },
    { id = "g_fl_kind", when = { flirt = true, npcFlagBefore = "fl_kind" }, once = true,
      text = "Welcome back, traveller. Your bed is aired, and I'll keep my talk of moonlight to myself, as a good innkeeper should." },
    { id = "g_away", when = { away = 14 }, text = "You've returned after {away}, traveller. Your bed has rocked with the branches all this while, waiting for someone to sleep in it." },
    { id = "g_away_long", when = { away = 60 }, text = "It has been {away} since you last rested here, and I had begun to wonder whether the world had kept you. Come, the terrace is quiet tonight." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I've heard kind words about you among my guests, traveller. They say you are good company, and I don't doubt it." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've had a hard road, so sit down. Moonberry juice first, then sleep, and then whatever comes after." },
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Gnome" } },
      text = "Don't look down from the terrace, friend. Everyone does it once, and once is enough." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The humans, if I'm honest, because they climb the tree tired and somehow leave it hungrier. They talk of their missing king and their boy-king and the lady at his court, and I never know what to say. What do you think of Stormwind's people?" },
      },
      choices = {
        { text = "Stout hearts. They rebuilt a whole city from ashes.", next = "op_r1", fx = { affinity = 1, trait = { kind = 1 }, opinion = { humans = "admire" } } },
        { text = "Short-lived and quarrelsome. They'll squabble the Alliance away.", next = "op_r2", fx = { trait = { skeptical = 1 }, opinion = { humans = "distrust" } } },
        { text = "Their court worries me. Ask who really advises the boy-king.", next = "op_r3", fx = { trait = { cautious = 1 }, opinion = { prestor = "distrust" } } },
        { text = "We're stubborn, yes, but we keep our word.", next = "op_r4", fx = { affinity = 1, opinion = { humans = "proud" } }, when = { race = "Human" } },
        { text = "I couldn't say.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "That's how they tell it too, and with that many stonemasons among them I believe it. I'll put another blanket on the next one's bed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Oh, they quarrel, and loudly. But the ones who stay here say thank you more often than my own kin do, so I can't hold it against them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "You sound like a dwarf I served last spring, who said the same thing and then drank until he forgot it. I'll keep your worry and leave his ale bill where it was." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then you're welcome to keep it in my common room, {class}. Stubborn guests always pay their way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_saelienne = {
      big = true,
      lines = { { id = "xpt_saelienne_default", text = "More every season, now that the boats run from Auberdine, and most of them are terrified of the height for their first night and charmed by it by their third. I like having them; a tree this tall gets lonely when only the Kaldorei sleep in it." } },
      choices = {
        { text = "Darnassus should stay your people's home. Outsiders can stay in Auberdine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Open the city to everyone. It's better for it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Never, though some come close, and perhaps your spirits could steady them. Rest well, and do not look down." } },
      choices = {
        { text = "I will rest well and heed your warning, Saelienne.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Looking down is half the fun.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some, and usually the ones back from Ashenvale or Darkshore, who'd rather sleep than see a priestess about it. I put them in the quiet rooms and keep the tea warm, and if you'd look in on them before you leave, I'd be grateful." } },
      choices = {
        { text = "I'll look in on them before I go.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they won't see a priestess, that's their choice.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Strange and a little fascinating, because we have priestesses who fight and Sentinels who pray, but never in quite so much armor. Be patient with the young ones who ask you questions, and they'll be telling stories about you for a hundred years." } },
      choices = {
        { text = "I'll answer them gladly, for courtesy costs me nothing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm not here to entertain children, Saelienne.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Safer than anywhere I know, with the Sentinels on every bridge and the whole sea between us and the Warsong. Still, half the warriors who stay here keep a sword under the pillow, and I've stopped trying to talk them out of it." } },
      choices = {
        { text = "I trust the Sentinels. The sword can rest tonight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My sword stays within reach, always.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It may, so long as it doesn't sharpen its claws on the posts, because this inn is part of a living tree and the druids notice. Most companions settle well enough once they stop looking over the railing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It may, so long as it doesn't sharpen its claws on the posts, because this inn is part of a living tree. Your {pet} can have the rug by the hearth, but keep it away from the railing, because the drop does strange things to animals." },
      },
      choices = {
        { text = "My companion will respect the tree, as I do.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It sleeps where it likes. It always has.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because it opens onto the branches and nobody watches it, and the last rogue who stayed here asked for it before she even asked for supper. I don't ask what my guests do with their windows, only that they pay for the room and don't use it for a door." },
      },
      choices = {
        { text = "I'll come and go by the front, like an honest guest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A window's a door if you're brave enough. I'll take it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not trouble, exactly, but careless, the way people get when they can make fire out of nothing. My guests come up from Rut'theran tired and frightened of the height, so I'd ask you to keep your magic to yourself under my roof and let them sleep." },
      },
      choices = {
        { text = "I'll keep it quiet. Your guests deserve their rest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it keeps a guest warm, I'll cast it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not often, because most of them sleep in the Cenarion Enclave or out under the leaves, and some of them sleep for weeks at a time. One young druid took a room last spring and dreamed so deeply that I had to ask the Enclave whether to wake him." } },
      choices = {
        { text = "You did right to ask the Enclave before waking him.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd have shaken him awake myself, Enclave or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because my guests sleep badly enough with the inn rocking in the wind, and they won't sleep at all with a demon at the foot of the bed. The branch is broad and the drop is long, so it can think about that." },
      },
      choices = {
        { text = "Fair. My servant can take the branch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep it where I please, innkeeper.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "Welcome to the Terrace! The last guest I had with your look was a {altclass} called {alt}, who came up from the boats just as lost as you and left a good deal better rested." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "You've only just missed {alt}, who slept beneath the east branch two nights running and asked me to keep the bed aired. I didn't think to ask whether you two knew one another, but I suspect you do." },
        { id = "o_orcs_respect", tags = { "news" }, when = { gossip = { topic = "orcs", stance = "respect" } },
          text = "Someone on the Terrace says you've a kind word for the orcs. I'd keep it quieter near the Sentinels' tables, if I were you." },
        { id = "h_pt_saelienne", tags = { "news" }, when = { party = { race = "Dwarf" } },
          text = "You've a dwarf with you! Tell {companion} the beds don't fold into the walls and the branches don't fall, because the last dwarf who stayed here slept on the floor with his boots on." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The travelers who come up from the boats are often more tired than they'll admit, and a kind word from a healer does them good." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your kind don't come up from the boats often, so forgive the stares on the Terrace, for they're curious rather than rude." },
        { id = "h_default", text = "I am Saelienne, and I keep the inn on the Craftsmen's Terrace. Travellers come up from the boats looking lost among the branches, and I make sure they leave looking rested." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You'll sleep well up here, I think. Your people are used to the ground being a long way down." },
        { id = "h_louder", when = { metBefore = true }, text = "A young Sentinel once asked me what the world below the tree was like, and I told her it was louder. She looked so disappointed." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The city is quietest now, beneath Elune's eye. Listen and you'll hear the branches settle, like an old house that has decided to keep you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You've come up the stairs without a sound, so either you're a rogue or the boards have finally stopped creaking. Shall I give you the room by the back window?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A human mage or a gnome one, I can never quite tell from the stairs, but you're both welcome here. Just don't light the candles with a spell, because the last one who tried singed my curtains." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you've the look of someone who sleeps with one hand on a hilt. My beds don't bite, I promise, though the branches do creak." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Please don't bring anything you've skinned upstairs, because the last guest who did left the room smelling of wet wolf for a week." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll be the one guest who doesn't mind the branches swaying at night, I expect, so long as you don't turn into a bear on my good linen." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. You'll get a room like anyone else, but your servant sleeps outside on the branch, and I wish it luck." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and welcome. Please don't look down from the terrace, for my inn rocks gently with the World Tree, and I suspect your spirits will enjoy it more than your stomach." },
      },
      again = {
        { id = "h_again", text = "Anything else? There's moonberry juice, if you're staying." },
      },
      choices = {
        { text = "Who are your strangest guests?", next = "op_ask" },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How do outsiders find Darnassus?", next = "outsiders" },
        { text = "You must hear all the Terrace's talk from here.", next = "talk" },
        { text = "Why would a rogue want the back window?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Are mages often trouble at your inn?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is it safe to sleep unarmed up here, Saelienne?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "May my companion stay at the inn with me?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do many of your guests come in hurt, Saelienne?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do your people find paladins strange, Saelienne?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do druids often stay at your inn, Saelienne?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why must my servant sleep out on the branch?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do travellers ever fall from your terrace, Saelienne?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do many outsiders stay at your inn?", next = "xpt_saelienne", when = { party = { race = "Dwarf" } } },
        { text = "Do you ever rest yourself, Saelienne?", next = "fl_rest", when = { flirt = true } },
        { text = "Just resting.", next = "END" },
      },
    },
    fl_rest = {
      lines = {
        { id = "fl_rest_default", text = "Not often, for there is always a guest who needs something at the hour Elune is highest. I have been thinking, though, that I wouldn't mind sitting out on the terrace with one of them, if it were you." },
        { id = "fl_rest_nelf", when = { race = "NightElf" },
          text = "Not often. You would think a woman who remembers the old world would have stopped blushing like a temple novice, and yet here I am. I would sit beneath the moon with you, if you'd let me, and we needn't say anything at all." },
        { id = "fl_rest_human", when = { race = "Human" },
          text = "Not often. Your people burn so brightly and so briefly that I've learned not to grow fond of the guests who come up from the boats, but I find I'm failing at it with you." },
        { id = "fl_rest_dwarf", when = { race = "Dwarf" },
          text = "Not often. I'll confess I've never sat beneath the moon with a dwarf, and I suspect you'd talk about stone the whole while, but I find I would like to hear it." },
      },
      choices = {
        { text = "I'd like that, Saelienne. We'll watch the moon together.", next = "fl_rest2",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_moon" } } } },
        { text = "Elune's light has never looked lovelier than on you.", next = "fl_rest2", when = { race = "NightElf" },
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_moon" } } } },
        { text = "You're kind, but I'd rather keep to my room.", next = "BACK",
          reply = "Of course. Forgive me, traveller; the moon makes fools of innkeepers too. Sleep well.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "fl_kind" } } } },
        { text = "I'm only passing through. Don't wait up for me.", next = "BACK",
          reply = "Then I won't, though I'll leave the lantern lit for whoever climbs the stairs next. Safe travels, wherever the road takes you.",
          fx = { npcFlag = { set = { "fl_kind" } } } },
      },
    },
    fl_rest2 = {
      lines = {
        { id = "fl_rest2_default", text = "Then come out when the branches settle, and I'll bring moonberry juice and a blanket, because the wind off the sea is colder than it looks. I haven't done this in a very long time, so you'll have to be patient with me." },
      },
      choices = {
        { text = "I'll be patient. Take all the time you need.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outsiders = {
      lines = { { id = "o_default", text = "By boat to Rut'theran, then through the portal, and they arrive looking dazed. Dwarves look down from the terrace once. Humans ask where the walls are." } },
      choices = {
        { text = "I haven't seen a single wall in this city.", next = "walls" },
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
    knows = {
      { id = "tp_knows", text = "Travellers tell me all sorts of things over supper, and some of it stays with me. Ask, and I'll pass on what I can." },
    },
    background = { { id = "tp_bg", text = "I keep the beds on the Craftsmen's Terrace. Everyone who stays a night tells me their story, and mine is the shortest of them." } },
    advice = { { id = "tp_ad", text = "Take the portal from Rut'theran. There's no other sensible way up, and several foolish ones." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Travellers come through here talking about the Faire all the time, and I've heard it's more lanterns than sense. One day I'll go and see it, if anyone can be found to keep my beds." } },
    booty_bay = { { id = "tp_booty_bay", text = "Sailors tell me Booty Bay is a goblin town hung on cliffs in the jungle, where you can buy anything and keep nothing. They always say it fondly, which I don't understand." } },
    theramore = { { id = "tp_theramore", text = "We get Theramore folk now and then, Lady Proudmoore's people, come over on the Auberdine boat. They're polite, and they always ask why the beds are so long." } },
    magni = { { id = "tp_magni", text = "Dwarves who stay here talk about their King Magni like an uncle who's always at the table. They miss their mountain terribly, and they drink accordingly." } },
    everlook = { { id = "tp_everlook", text = "I had a goblin guest once who swore Everlook was the coldest town in the world and the best place to sell blankets. He tried to sell me some on his way out." } },
    _none = { { id = "tp_none", text = "I only keep the beds, traveller. The Temple of the Moon knows more, and it has known it for a long while." } },
  },
}
