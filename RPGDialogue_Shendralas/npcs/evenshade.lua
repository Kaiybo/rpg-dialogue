-- Item IDs (wiki, Forever): 282404 Narassin's Tome, 282337 Befouled Water Globe, 276188 Eluvi'ana,
-- 264908 Ancient Heirloom, 282548 Star of Elune.
-- Evenshade Overlook: Archmage Mordent Evenshade of the Shen'dralar, above the ruins north of Eldre'Thalas.
-- Voice: bibles/shendralas.md
local P = RPGDialogueAPI:Pack("rpgd.shendralas")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "shd_evenshade", id = TODO_NPC("Archmage Mordent Evenshade"), name = "Archmage Mordent Evenshade",
  title = "The Highborne",
  bible = "bibles/shendralas.md", role = "questgiver", tier = "major",
  communities = { "shendralas", "shendralar" }, temper = { "proud", "sharp" }, values = { "learned", "honest", "kind" },
  likesTone = "polite", private = { "queen_azshara", "satyrs" },
  prejudice = { race = "NightElf", amount = 8, why = "An old Highborne wound: the kaldorei who distrusted and drove out his people." },
  notices = { "race", "class", "carry" },

  impression = {
    first = "He speaks like a scholar and mourns like one who was there.",
    third = "{name} met Archmage Mordent Evenshade of the Shen'dralar, who watches over the ruins of Shen'dralas from Evenshade Overlook.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "A kaldorei, at the overlook. Your ancestors called my people dangerous and drove most of them across the sea, and I find, to my embarrassment, that I have not entirely forgiven you for it." },
    { id = "g_prej2", when = { prejudiced = true }, text = "Ah, a druid, come to look at the ruins. Look, by all means; my people built them while yours were learning to talk to bears." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again, child of the kaldorei. I owe you an apology, I think, for blaming you for a quarrel ten thousand years older than you are." },
    { id = "g_default", text = "You stand in Shen'dralas, or in what little the ages have left of it." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the overlook. Few do, and fewer come back twice." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The temple stones still catch the moonlight, even now. Come and see, if you like." },
    { id = "g_tome", when = { carrying = 282404 }, text = "You carry a book that is very much older than it looks. Bring it here, please." },
    { id = "g_star", when = { carrying = 282548 }, text = "Is that light in your pack what I think it is? Elune's own star, still whole?" },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, which to one of my years is scarcely the turning of a page, and yet I find I noticed your absence. Come, the overlook has kept your place." },
    { id = "g_away_long", when = { away = 60 }, text = "You have been away {away}, and you climb back to the overlook as though the world had been kind to you in the meantime. I hope it was, for it rarely troubles to be kind to those who visit ruins." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown since we last spoke, and I can feel the change in you as my people once felt the tides of the Well. Power suits some and ruins others, and I am curious which you will be." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I am told you talked someone of this valley round to your view, which is a rarer art here than sorcery, and my people valued it once, before we came to value power more." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word reaches even this overlook that you were caught in a falsehood, and I confess I am sorry to hear it, for my people told many lies to themselves, and you can see from here where they led." },
  },

  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "One of the kaldorei, at my overlook. Your people have not looked kindly on mine for ten thousand years, and I would not blame you for keeping your hand near your blade." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Your face is the face of Eldre'Thalas, and yet I have never seen you in its halls. Forgive me for staring, but I had thought no one else had lived." },
    { id = "n_mage", cat = "class", when = { class = "MAGE", ["not"] = { race = "Skyborne" } },
      text = "I can feel the arcane on you the way one feels the warmth of a hearth. It has been a long time since anyone climbed up here carrying that." },
    { id = "n_heirloom", cat = "carry", when = { carrying = 264908 },
      text = "That ring on your hand is kaldorei work, and old work at that. The enchantment in it is humming like a struck bell; I can hear it from here." },
    { id = "n_eluviana", cat = "carry", when = { carrying = 276188 },
      text = "Light of the Moon, what is that at your belt? No, I know what it is. I simply did not believe I would ever see it again." },
  },

  react = {
    { id = "r_form", on = "form", when = { form = { "bear", "cat", "travel", "moonkin" } },
      text = "A druid. Malfurion's teaching has travelled further than I thought, if it walks up to my overlook on four legs." },
    { id = "r_stealth", on = "stealth", text = "You need not hide from me. I have hidden from the world for longer than your grandparents' grandparents lived, and I know the look of it." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "Because your people never trusted mine, and after the Sundering they had reason, and still I resent it. The Highborne who stayed here were scholars, not demon-worshippers, and the kaldorei never troubled to learn the difference." } },
      choices = {
        { text = "The Highborne nearly ended the world. Caution was wise.", next = "BACK", reply = "It was, and I will not argue it, but caution that lasts ten thousand years begins to look a great deal like an old grudge dressed in its best robes.", fx = { align = { order = 1 } } },
        { text = "They should have learned the difference. You were wronged.", next = "BACK", reply = "That is kinder than I expected from anyone wearing Elune's colours, and I will remember it the next time a Sentinel spits at my door.", fx = { align = { order = -1 } } },
        { text = "I'm not my ancestors. Judge me by my own deeds.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "What was Shen'dralas like, before?", next = "prej_why" },
        { text = "Something else, archmage.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Full of lamps and libraries and arguments that ran through the night, and the arguments were the best of it. We thought we were preserving the old learning for a wiser age, and perhaps we were, though the wiser age has been slow to arrive." } },
      choices = {
        { text = "Then I'll help it arrive. Show me what's left.", next = "BACK", reply = "Then come, and mind the shelves, because what is left is fragile and so am I, and I have not shown these rooms to anyone in a very long time.", fx = { align = { light = 1 } } },
        { text = "Learning without wisdom caused the Sundering. Remember that.", next = "BACK", reply = "I remember it every night, {class}, and I did not need a reminder from someone who was not there to see the waters rise.", fx = { align = { light = -1 } } },
        { text = "Something else, archmage.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "A fair rebuke, and gently given. Very well; I will try to see you and not your grandmothers." } },
      choices = {
        { text = "Something else, archmage.", next = "BACK" },
      },
    },
    -- Deeds pass: the player killed Immol'thar in Eldre'Thalas.
    dd_immolthar = {
      lines = { { id = "di_default", text = "Then the Shen'dralar who remain will feel their years come back to them, all of them at once, and some will not survive it. We drank from a chained demon to keep from fading, as we once drank from the Well, and I suppose we never truly learned the lesson the first time." } },
      choices = {
        { text = "Feeding on a demon was a sin. Better it ended.", next = "BACK", reply = "Spoken plainly, and I cannot argue with it, though you will forgive me if I do not thank you for it today.", fx = { align = { light = 1 } } },
        { text = "Your people did what they must to survive.", next = "BACK", reply = "That is what we told ourselves for ten thousand years. It is a comfort to hear it from someone else, and a dangerous one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_immolthar", tags = { "news" }, when = { killed = { name = "Immol'thar" } },
          text = "The demon Immol'thar is dead, then; I felt the old pylons go cold all the way up here. The Prince fed our order on that creature's power for longer than I care to admit, and I have never decided whether I was ashamed of it or grateful." },
        { id = "h_dd_gordok", when = { killed = { name = "King Gordok" } },
          text = "The ogres squatting in the old gardens of Eldre'Thalas have lost their king, I hear, and are already brawling over his crown. Ogres in the gardens of the Highborne, and now the outsiders choose their kings; my grandfather would have wept." },
        { id = "h_default", key = true,
          text = "I am Mordent Evenshade, an archmage of the Shen'dralar, and this is what remains of Shen'dralas. I hope you can see some of its old majesty in it, even if it is only a haunted shell of what it was." },
        { id = "h_back", when = { metBefore = true },
          text = "Welcome back to the overlook. I confess I have been looking forward to the company, which is not a thing I have said in a very long while." },
        { id = "h_tome", tags = { "news" }, when = { carrying = 282404 },
          text = "You have something for me, I think; a lost scrap of Eldre'Thalas, perhaps. So much has fallen here that one can hardly walk ten paces without tripping over forgotten treasure, so show me what you found." },
        { id = "h_globe", tags = { "news" }, when = { carrying = 282337, ["not"] = { carrying = 282404 } },
          text = "That globe in your pack was once the heart of a guardian, and it is rotten to the core now. I can taste the corruption in the air between us, and I would very much like to know where you found it." },
        { id = "h_star", tags = { "news" }, when = { carrying = 282548 },
          text = "You found a Star of Elune still whole. The guardians of our cities were empowered with stars like that one in the temples, all those thousands of years ago, and I had begun to fear none survived." },
        { id = "h_dm", tags = { "news" }, when = { killed = { name = "Prince Tortheldrin" } },
          text = "You have been into the heart of Eldre'Thalas and faced the Prince; I can see it in you. I will not ask how it ended, not yet, but I should like to hear it one day." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The ruins are kinder by moonlight, I find, because the dark hides the cracks and the temple looks almost as it did. I come out here most nights for that reason, and for no better one." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "A kaldorei, come to see the Highborne in their ruin. Your people and mine did not part as friends, but I hope you will hear me out before you judge what you see." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The blood of Eldre'Thalas is plain in your face, stranger, and yet you are no one I knew in its halls. Tell me who you are, because I have waited a very long time for anyone like you to climb this hill." },
        { id = "h_mage", when = { class = "MAGE", ["not"] = { race = "Skyborne" } },
          text = "A mage! The magic of this age is a pale thing beside what we wove when the Well still stood, but it is magic all the same, and I am glad to see someone carry it with care." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "I know the smell of the Nether on a person, warlock; my people have had ten thousand years to learn it. You may stand at my overlook, but you will forgive me if I keep watching your hands." },
        { id = "h_apriest", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
          text = "A priest of the young kingdoms, if I am any judge. That temple below was raised to Elune, not to your Light, but I think she would not mind a prayer from you all the same." },
        { id = "h_epriest", when = { class = "PRIEST", race = "NightElf" },
          text = "A priestess of the Moon, or one who walks her path. The temple below was hers before it was ours, and it is hers again now that there is no one left to argue." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, one of Malfurion's children. Your teacher and my people did not part kindly, so I suppose I should be surprised to find you so polite." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You are dead and walking, and yet you seem to know your own mind, which is more than can be said for many of the spirits below. Come up, then; this overlook has seen stranger guests." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A shu'halo, from the plains to the east. I have watched your people's fires from this hill on clear nights, and I have often wondered what you made of the ruins." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have ten thousand years of time behind me, and very little use for what remains of it." },
        { id = "h_again2", text = "Ask, if you have more. The ruins are patient, and so am I." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Go on. The moon is high, and I am in no hurry to go back to the halls." },
      },
      choices = {
        { text = "I killed the demon your Prince kept chained.", next = "dd_immolthar", when = { killed = { name = "Immol'thar" } } },
        { text = "This place was grand once, by the look of it.", next = "place" },
        { text = "Why do you stand watch out here alone?", next = "alone" },
        { text = "I know nothing of the Shen'dralar.", next = "order" },
        { text = "You keep staring at something down there.", next = "grave" },
        { text = "I have something you should see.", next = "tome", when = { carrying = 282404 } },
        { text = "What do we need for the ritual again?", next = "ritual", when = { npcFlagBefore = "ritual" } },
        { text = "I found the Star of Elune.", next = "star", when = { carrying = 282548 } },
        { text = "This globe I'm carrying hums with something strange.", next = "globe", when = { carrying = 282337, ["not"] = { carrying = 282404 } } },
        { text = "I've faced Prince Tortheldrin.", next = "after_prince", when = { killed = { name = "Prince Tortheldrin" } } },
        { text = "My people were exiled for what yours did.", next = "xnelf", when = { race = "NightElf" } },
        { text = "My ancestors fled Eldre'Thalas. We are the Skyborne.", next = "xsky", when = { race = "Skyborne" } },
        { text = "Teach me something of the old magic.", next = "xmage", when = { class = "MAGE" } },
        { text = "I serve the Light. What did your people serve?", next = "xpriest", when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "Elune watched over this temple once. Does she still?", next = "xepriest", when = { class = "PRIEST", race = "NightElf" } },
        { text = "Keep watching my hands, archmage. What did the Nether take from your people?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Malfurion's teaching has done well without the Highborne.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Are the spirits below at rest, archmage?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "Could these ruins be held against the Magram?", next = "xwarrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "What hides in these ruins that I should know of?", next = "xrogue", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "The spirits of this land are uneasy, archmage.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "You speak to me coldly, archmage. Why?", next = "prej", when = { prejudiced = true } },
        { text = "Farewell, archmage.", next = "END" },
      },
    },

    -- The place --------------------------------------------------------------------------
    place = {
      lines = {
        { id = "pl_default", text = "This was part of Eldre'Thalas, the city your maps now call Dire Maul, and a part of it the world forgot. I find that name an insult to my people's long and proud history, though I cannot deny the city no longer lives up to what it was.",
          fx = { learn = { "highborne" } } },
      },
      choices = {
        { text = "You could call it by its true name, then.", next = "name" },
        { text = "Tell me about the temple below.", next = "temple" },
        { text = "How did any of it survive the Sundering?", next = "sundering" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "nm_default", text = "I do, when I am among my own, but there are so few of them now. Sometimes I wonder whether I do the city a disservice by keeping its name alive so long after it has fallen, like dressing a corpse in its wedding clothes." },
      },
      choices = {
        { text = "Eldre'Thalas, then. A name is worth keeping.", next = "BACK", reply = "Then I will keep saying it, Eldre'Thalas, for your sake as much as mine, and perhaps it will mean a little more now that two of us say it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let it go. Dire Maul is what it is now.", next = "BACK", reply = "Dire Maul, yes, as the ogres and the treasure-hunters call it, and accurate enough I suppose, but I will not say it myself while I still have breath.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple = {
      lines = {
        { id = "te_default", text = "A temple of Elune, raised long before any of us dreamed of the Sundering. Each of our cities had a guardian, and each guardian drew its strength from a Star of Elune set in such a temple, so the priestesses and the magi worked side by side here, once." },
      },
      choices = {
        { text = "Is the star still down there?", next = "temple_star" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_star = {
      lines = {
        { id = "ts_default", text = "Not this one's, no; it was lost or broken long ago, along with the guardian it served. If any star survived intact, it lies somewhere the looters never thought to search, and I have searched in a good many places myself." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sundering = {
      big = true,
      lines = {
        { id = "su_default", text = "That is the cruel part. Eldre'Thalas survived the Great Sundering when it should have killed us all, and then it fell anyway, slowly, not by the catastrophe but by what came after it. The moment the world broke changed my people's fate forever." },
      },
      choices = {
        { text = "Something worse must have come after it.", next = "prince" },
        { text = "Surviving is a victory. You should honor that.", next = "BACK", reply = "That is generous of you, and I will try to see it so, though it is hard to feel victorious standing in a library with no one left to read.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some cities deserve to fall.", next = "BACK", reply = "Perhaps some do, and I have wondered whether ours was one, but you will forgive me if I do not enjoy hearing it from a stranger.", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    prince = {
      lines = {
        { id = "pr_default", text = "Prince Tortheldrin came after it. I have spent thousands of years trying to understand what drove my Prince, and I admit I still cannot, so I try not to dwell on choices that can never be unmade." },
      },
      choices = {
        { text = "What did he do?", next = "prince_crime" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prince_crime = {
      big = true,
      lines = {
        { id = "pc_default", text = "He keeps a creature of the Nether chained in the heart of the city and feeds on its power, and he calls it saving the Shen'dralar. He would go to any length to serve his own ends, and he would wear our survival as the mask while he did it.",
          fx = { learn = { "burning_legion" } } },
      },
      choices = {
        { text = "He kept your people alive. That counts for something.", next = "BACK", reply = "Alive, yes, as a jailer keeps his prisoners alive, and I have counted the price of that survival for longer than you can imagine. Do not mistake breath for life, outsider, for the Shen'dralar have had little else.", fx = { opinion = { shd_prince = "survivor" }, align = { honor = -1 } } },
        { text = "A prince who chains demons is no prince.", next = "BACK", reply = "So I have said in the quiet of my own chambers for many centuries, though never so plainly aloud. Hearing it from a stranger's lips makes it sound less like treason and more like truth.", fx = { opinion = { shd_prince = "tyrant", demons = "hate" }, affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- His watch --------------------------------------------------------------------------
    alone = {
      lines = {
        { id = "al_default", text = "Because it pains me to walk the halls below now, though I still count myself one of the order that keeps them. I spend most of my days away from the library I once called home, and this hill is as far as I can bring myself to go." },
      },
      choices = {
        { text = "Something about the halls pains you.", next = "halls" },
        { text = "Have you met anyone else out here?", next = "others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    halls = {
      lines = {
        { id = "ha_default", text = "Silence, mostly, and the bargain that keeps the halls silent. My brothers and sisters sit cloistered in the Prince's inner sanctum, deep in the city, and they read and they wait and they do not ask where the power that sustains them comes from." },
      },
      choices = {
        { text = "And you do ask.", next = "halls_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    halls_ask = {
      big = true,
      lines = {
        { id = "hk_default", text = "I ask, and I stay, which I suppose makes me no better than they are, only unhappier. Tell me, {class}, what would you do in my place?" },
      },
      choices = {
        { text = "Leave. No library is worth that bargain.", next = "BACK", reply = "That is what my heart says on the bad nights, and I listen to it, and then I wake up and I am still here among the books.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Stay, and keep the knowledge safe until it's needed.", next = "BACK", reply = "Then you would be as foolish as I am, {class}, and I find that a strange comfort, because a fool with company is only half a fool.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I couldn't say. It isn't my choice to make.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "ot_default", text = "Adventurers, now and then, who mostly call the city Dire Maul and mostly want to know what is worth stealing in it. As for survivors of the old days, I have met none outside my own order, not in all these thousands of years." },
        { id = "ot_sky", when = { race = "Skyborne" }, text = "None, until you, and I am still not certain what you are. Adventurers come, and call the city Dire Maul, and ask what is worth stealing; you are the first who looks as if you belong here." },
      },
      choices = {
        { text = "Do the Magram trouble you up here?", next = "magram" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magram = {
      lines = {
        { id = "mg_default", text = "The centaur keep to their valley and their front, and they leave a lone old elf on a hill alone, which suits us both. Their shamans raise the dead in the Valley of Bones, though, and that I cannot forgive as easily as their manners." },
      },
      choices = {
        { text = "There are quilboar to the south as well.", next = "quilboar" },
        { text = "Does their bone-work trouble you?", next = "mg_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    -- Opinion pass: Mordent asks the player whether any power is worth taking.
    mg_ask = {
      big = true,
      lines = { { id = "ma_default", text = "It troubles me, but I am an old man who watched his people drown for loving magic too dearly, so perhaps I am not the one to judge. You walk among the living, and you have seen what power does to them. Is any power worth taking, if it lies there to be taken?" } },
      choices = {
        { text = "Raising the dead is an abomination, whatever the cause.", next = "mg_ask_wrong", fx = { opinion = { necromancy = "wrong" }, align = { light = 1 }, affinity = 1 } },
        { text = "If it keeps a people alive, then yes.", next = "mg_ask_useful", fx = { opinion = { necromancy = "useful" }, align = { light = -1 } } },
        { text = "Magic is a tool. Only the hand that holds it is wicked.", next = "mg_ask_tool", fx = { opinion = { arcane_magic = "useful" }, trait = { practical = 1 } } },
        { text = "Dalaran teaches restraint. Your Prince never learned it.", next = "mg_ask_dal", when = { class = "MAGE" }, fx = { opinion = { kirin_tor = "respect", arcane_magic = "careful" } } },
        { text = "I was raised against my will. You know my answer.", next = "mg_ask_dead", when = { race = "Scourge" }, fx = { opinion = { necromancy = "hate", undeath = "curse" } } },
        { text = "I'd rather not judge it.", next = "BACK" },
      },
    },
    mg_ask_wrong = {
      lines = { { id = "maw_default", text = "You say it plainly, and I envy you that. My order said much the same about the Prince's prisoner, once, very quietly, in rooms where he could not hear us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mg_ask_useful = {
      lines = { { id = "mau_default", text = "That is the Prince's own argument, almost word for word, and he has kept the Shen'dralar alive with it for ten thousand years. I would ask you to look at what it has kept alive before you settle on it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mg_ask_tool = {
      lines = { { id = "mat_default", text = "A tidy answer, and a scholar's one, and I gave it myself for many centuries. The trouble is that the tool changes the hand that holds it, slowly, and the hand never notices." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mg_ask_dal = {
      lines = { { id = "mad_default", text = "Dalaran. Yes, I have heard of your city of magi, and I hope its restraint outlasts its first great temptation. Ours did not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mg_ask_dead = {
      lines = { { id = "mae_default", text = "Forgive me. I asked a question of the one person in this valley who has already answered it with every breath they no longer take." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quilboar = {
      lines = {
        { id = "qb_default", text = "The Bristleback dig in near their retreat and squabble with the Magram over every hill between them. I watch them from here the way one watches ants, and I try to remember that ants, too, must find it all terribly important." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    -- His order ----------------------------------------------------------------------------
    order = {
      lines = {
        { id = "or_default", text = "The Shen'dralar are the scholars and magi of Eldre'Thalas, the keepers of its library and the last of its Highborne who still keep their wits. We were the brightest minds of a bright city, once, and now we are mostly a habit of reading by candlelight." },
      },
      choices = {
        { text = "That library is said to hold a great many books.", next = "library" },
        { text = "Why do the night elves hate you?", next = "kaldorei" },
        { text = "Something else.", next = "BACK" },
      },
    },
    library = {
      lines = {
        { id = "lb_default", text = "Histories, treatises, the works of magi whose names nobody alive remembers but us. Some of the greatest were records of Luminarian, the magesmith, whose blades and armor were made for the Queen's own guard, though his finest pieces were bound to powers no one else could touch." },
      },
      choices = {
        { text = "Tell me more of Luminarian.", next = "luminarian" },
        { text = "Something else.", next = "BACK" },
      },
    },
    luminarian = {
      lines = {
        { id = "lu_default", text = "He was secretive with his commissions and proud of each as though it were his only child, as great craftsmen are. Two of his blades were sisters, the Night Dancer and the Dawn Waker, and I had thought them both lost for good." },
        { id = "lu_eluv", when = { carrying = 276188 }, text = "Ask the blade at your side; it knows him better than I do. The Night Dancer and the Dawn Waker were sisters, made by his hand, and I had thought them both lost until you climbed this hill." },
      },
      choices = {
        { text = "Where would I look for them?", next = "luminarian_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    luminarian_where = {
      lines = {
        { id = "lw_default", text = "If I knew, I would not be standing on a hill. Bring me something of his, or something written by one who chased his work, and perhaps between us we can find a thread to pull." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaldorei = {
      big = true,
      lines = {
        { id = "kd_default", text = "Because we loved the arcane more than we loved them, and they paid for it in fire and flood. The Highborne who lived on were cast out or forgotten, and those of us here stayed silent behind our walls rather than face the reckoning, which I am not proud of.",
          fx = { learn = { "queen_azshara" } } },
      },
      choices = {
        { text = "Then they were right to cast you out.", next = "BACK", reply = "Perhaps they were, and I have stopped arguing that point with myself. We earned our exile, and the only question left to us is whether we can earn anything else.", fx = { opinion = { shd_highborne = "guilty" }, align = { order = 1 }, affinity = -1 } },
        { text = "Ten thousand years is long enough to forgive.", next = "BACK", reply = "You speak with the haste of the young, though I am grateful for the kindness in it. Ten thousand years is long enough to remember, I think, and whether it is long enough to forgive is for the Kaldorei to decide.", fx = { opinion = { shd_highborne = "forgiven" }, align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- What he looks at -------------------------------------------------------------------
    grave = {
      big = true,
      lines = {
        { id = "gr_default", text = "A grave, the largest I have ever seen, where so many of my kin lie together. It is the senseless loss of so much life that haunts me, more than the fall of any wall or tower." },
      },
      choices = {
        { text = "Mourn them, but celebrate that you survived.", next = "grave_survive" },
        { text = "Do their spirits still walk the ruins?", next = "grave_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grave_survive = {
      big = true,
      lines = {
        { id = "gs_default", text = "Celebrating my own life while I look down at a mass grave of my people feels selfish, I am afraid. Perhaps that is a lesson for younger hearts than mine." },
      },
      choices = {
        { text = "The living owe the dead a full life, archmage.", next = "BACK", reply = "Perhaps they do, and I have heard it said before, but it is far easier to say over a grave that is not filled with your own people.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then keep your grief. It's yours to carry.", next = "BACK", reply = "I will, and I thank you for not trying to lift it from me, because I think I would only take it back the moment you looked away.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grave_spirits = {
      lines = {
        { id = "gp_default", text = "Some do, and most of those mean no harm; they walk where they walked in life and nod to me as if it were any other evening. It is the ones near the frozen lake in Winterspring I grieve for, because they are not resting, they are suffering." },
      },
      choices = {
        { text = "Can nothing be done for them?", next = "anguished" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anguished = {
      lines = {
        { id = "an_default", text = "Not by me, not from here. Their tears are full of a sorrow I can feel even in a vial, and I hope you never have reason to gather them, though I fear one day you might." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    -- The Dawn Waker secret ----------------------------------------------------------------
    globe = {
      lines = {
        { id = "gl_default", text = "The last remnant of a city's elemental defender, if I am not mistaken, left to rot so long that it is barely more than corruption in a glass. Cleansing it is no matter of prayer but of great arcane ritual, and of knowledge I do not have yet." },
      },
      choices = {
        { text = "Where could I find that knowledge?", next = "globe_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    globe_where = {
      lines = {
        { id = "gw_default", text = "In the hands of someone who went looking for the same thing before you, I expect. Magi of the old empire hoarded such research the way dragons hoard gold, and if you find one of their books, bring it to me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tome = {
      big = true,
      lines = {
        { id = "to_default", key = true, text = "Athrikus Narassin's hand; I would know that cramped script anywhere. He was onto something, it seems, which surprises me, because I never thought he would add to scholarship rather than hoard it up in his tower like some dragon on a heap.",
          fx = { npcFlag = { set = { "tome" } } } },
      },
      choices = {
        { text = "So you can help me?", next = "tome_help" },
        { text = "You knew Narassin?", next = "narassin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    narassin = {
      lines = {
        { id = "na_default", text = "Everyone of a certain age knew of him: a minor magus who tended the twin villages on the northern coast and complained of it in every letter. He collected weapons and artifacts the way some collect seashells, and he was never satisfied with a near likeness when he could dream of the real thing." },
      },
      choices = { { text = "Back to the tome, then.", next = "tome_help" } },
    },
    tome_help = {
      lines = {
        { id = "th_default", text = "I can, with the research you recovered. If Eluvi'ana is found and the Dawn Waker within reach, Luminarian himself would weep to see his masterworks made whole, and I would very much like to see it before I go into the ground.",
          fx = { npcFlag = { set = { "ritual" } } } },
      },
      choices = {
        { text = "This will need more than research, I'd guess.", next = "ritual" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ritual = {
      hub = true,
      lines = {
        { id = "ri_default", key = true, text = "Three things. A Star of Elune, still intact, to focus the power as the guardians were focused in the temples; an Abyssal Mote to realign the orb with the seas; and something to dilute the corruption as the magic flows through it.",
          fx = { npcFlag = { set = { "ritual" } } } },
      },
      again = { { id = "ri_again", text = "The star, the mote and the tears. Which would you hear of?" } },
      choices = {
        { text = "A Star of Elune won't be easy to find.", next = "ritual_star" },
        { text = "An Abyssal Mote? From where?", next = "ritual_mote" },
        { text = "What dilutes corruption like that?", next = "ritual_tears" },
        { text = "I have the reagents. What now?", next = "ritual_ready", when = { carrying = 282548 } },
        { text = "Something else.", next = "hello" },
      },
    },
    ritual_star = {
      lines = {
        { id = "rs_default", text = "You will have to search for one that survived, because I cannot tell you where. Look where my people hid what they could not bear to lose, and look with eyes that see what my people meant to keep hidden." },
        { id = "rs_ring", when = { carrying = 264908 }, text = "You already wear the key to finding it, I think. That ring reveals what the Shen'dralar hid, so look where my people hid what they could not bear to lose, in the southern ruins of Feralas." },
      },
      choices = { { text = "And the rest?", next = "ritual" } },
    },
    ritual_mote = {
      lines = {
        { id = "rm_default", text = "Your best hope may be the sea giants, of all creatures, if you can find one and persuade it to help you. I would not care to try the persuading myself." },
      },
      choices = { { text = "And the rest?", next = "ritual" } },
    },
    ritual_tears = {
      big = true,
      lines = {
        { id = "rt_default", text = "It breaks my heart to say it, but the tears of my fallen kin, the anguished Highborne at Lake Kel'Theril, will serve best. Their sorrow is pure enough to thin the corruption without poisoning the rest." },
      },
      choices = {
        { text = "Their suffering will mend something. That's mercy, of a kind.", next = "ritual", fx = { align = { light = 1 } } },
        { text = "If tears are needed, I'll take tears. They're beyond caring.", next = "ritual", fx = { align = { light = -1 } } },
        { text = "And the rest?", next = "ritual" },
      },
    },
    ritual_ready = {
      lines = {
        { id = "rr_default", text = "Then go to the font where arcane magic runs strongest, far to the north on the mountain, for without true Highborne sorcerers walking free it is your only hope of the power to cleanse it. I am nearly done with the tome, and I will have the rest of the way ready when you return." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    star = {
      lines = {
        { id = "st_default", text = "Then the guardians' light is not gone from the world. Hold it carefully, {name}; there may not be another like it left anywhere in Kalimdor." },
      },
      choices = {
        { text = "Remind me what else we need.", next = "ritual" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_prince = {
      big = true,
      lines = {
        { id = "ap_default", text = "Then you have seen what my Prince became, and what he feeds upon. I do not know whether to thank you or to mourn him, and I suspect I will do both before the night is out." },
      },
      choices = {
        { text = "He doomed your people. Don't mourn him.", next = "BACK", reply = "You are right, and I know it, but I knew him when he was young and brilliant, and that boy is harder to stop mourning than the Prince.", fx = { align = { light = 1 } } },
        { text = "Mourn him. He was still your Prince.", next = "BACK", reply = "Thank you for that, because I think I needed someone to say it aloud, and I could never have said it myself without feeling a traitor.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is ----------------------------------------------------------------------
    xnelf = {
      big = true,
      lines = {
        { id = "xn_default", text = "They were, and I will not insult you by arguing it. We loved the Well and the power in it, and your people paid for our hunger with their homes and their dead, and with a law against the arcane that you keep to this day." },
      },
      choices = {
        { text = "Why should I believe the Highborne have changed?", next = "xnelf2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf2 = {
      big = true,
      lines = {
        { id = "xn2_default", text = "You should not, not on my word alone. But the Prince below still makes the old mistake, and I stand up here instead of beside him, and perhaps that is a beginning, if a small and late one." },
      },
      choices = {
        { text = "The past is the past. I'll judge you as I find you.", next = "BACK", reply = "That is more than I had hoped for from a kaldorei, and I will try to deserve it, though I suspect I will find it harder than you expect.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The law against the arcane exists for good reason.", next = "BACK", reply = "It does, and I am the proof of it, so I will not argue, though I hope one day your law learns to tell a scholar from a demon-worshipper.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsky = {
      big = true,
      lines = {
        { id = "xs_default", text = "Fled? Then the rebels lived, after the night the Prince turned on his own nobles and the battle in his sanctum. I watched them go, those who were left, and I counted them drowned or dead in the wilds for ten thousand years." },
      },
      choices = {
        { text = "The winds carried us to safety. We call ourselves shen'dorei.", next = "xsky2" },
        { text = "Did you fight for the Prince or the Shal'nan?", next = "xsky_side" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsky2 = {
      lines = {
        { id = "xs2_default", text = "The hidden people. It is a good name, and a sad one, and I think it suits us both. Whatever the winds made of you, you still carry Eldre'Thalas in your face, and I am glad, more glad than I can easily say.",
          fx = { learn = { "shal_nan" } } },
      },
      choices = {
        { text = "My order seeks the arcane knowledge we lost.", next = "xsky_high", when = { faction = "Alliance" } },
        { text = "My people honor the elements now, not the arcane.", next = "xsky_wind", when = { faction = "Horde" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsky_side = {
      big = true,
      lines = {
        { id = "xsd_default", text = "Neither, to my shame; I kept to the library and told myself scholarship stood above such things. Many of the Prince's critics died in a single night, and I lived because I said nothing, which is a poor kind of survival to confess to a rebel's child." },
      },
      choices = {
        { text = "Silence kept you alive. There's no shame in that.", next = "BACK", reply = "You are kind, but the ones who died that night would tell you otherwise, and they are the only judges I have ever cared about.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Silence is how tyrants win, archmage.", next = "BACK", reply = "Yes, and I have known it every day since, so you may say it as often as you like, but you will never say it as often as I have.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsky_high = {
      lines = {
        { id = "xsh_default", text = "Then come back when you have the patience for it, and I will tell you what I can of what was written here. There is much I would rather give to the children of rebels than leave to the Prince's keeping." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xsky_wind = {
      lines = {
        { id = "xsw_default", text = "The elements, after all of it. I cannot pretend I understand, but the arcane brought our people nothing but ruin and exile, so perhaps your elders chose better than mine ever did." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xm_default", text = "The magic of today pales beside the magic of ten thousand years ago, but we Highborne have not forgotten all we knew of the arcane. The first lesson is the one my people ignored: power drawn from something you do not understand will one day draw something from you." },
        { id = "xm_sky", when = { race = "Skyborne" }, text = "Gladly, child of Eldre'Thalas, though the first lesson is the one our people forgot. Power drawn from something you do not understand will one day draw something from you, and the Prince below is proof enough of that." },
      },
      choices = {
        { text = "Power belongs to those with the will to use it.", next = "BACK", reply = "That is what my Queen believed, and look where her will has left the world, so be careful whose footsteps you follow, {class}.", fx = { align = { light = -1 } } },
        { text = "Then I'll understand it before I use it.", next = "BACK", reply = "Then you have learned in an afternoon what my people could not learn in a thousand years, and I would gladly teach you more.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What did Dalaran's magi learn that you didn't?", next = "xmage_dal" },
      },
    },
    xmage_dal = {
      lines = {
        { id = "xmd_default", text = "Restraint, perhaps, if the stories that reach me are true; or at least the habit of pretending to it. The exiles who crossed the sea taught the human kingdoms their first spells, and I have often wondered whether they taught caution with them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "Elune, in the beginning, as the kaldorei still do, and then the Well, and then whatever the Well's power could buy us. Your Light asks for faith and gives back healing, I am told, which is a better bargain than the one my people made." },
      },
      choices = {
        { text = "Would you pray with me, at the temple?", next = "xpriest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest2 = {
      big = true,
      lines = {
        { id = "xp2_default", text = "I have not prayed in a very long time, {name}, and I am not sure the words would come. But I would stand beside you while you did, if you would not mind an old elf who has forgotten how." },
      },
      choices = {
        { text = "The Light welcomes anyone who comes to it honestly.", next = "BACK", reply = "Then perhaps I will try, with you beside me, and if the Light finds nothing in me worth answering, at least it will not be for want of asking.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "Faith can't be borrowed. Find your own again first.", next = "BACK", reply = "That is fair, and probably true, and I will try to find it, though I suspect I left it somewhere in these halls a very long time ago.", fx = { align = { light = -1, order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xepriest = {
      big = true,
      lines = {
        { id = "xe_default", text = "I like to think so, though the priestesses who served here have been dust for ten thousand years. The moonlight still finds the altar most nights, and I take that as a sign, for whatever an old magus's signs are worth to a priestess." },
      },
      choices = {
        { text = "Elune forgives those who turn back to her.", next = "BACK", reply = "I hope so, priest, more than I can say, and if she does, I would like to think the moonlight on that altar is her way of telling me.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Elune's light isn't yours to claim, Highborne.", next = "BACK", reply = "No, it is not, and I would never claim it, but you will forgive an old magus for sitting in the light of a goddess who has not yet turned him away.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "Everything. Our Queen opened the way for the Legion, and the Prince below keeps a demon in chains to hold his throne, so when I look at a warlock I see the next chapter of a very old book." },
      },
      choices = {
        { text = "What I summon kneels to me. Your Prince never made his kneel.", next = "BACK", reply = "That is what they all say, and the Prince said it once too, before the chains he forged began to bind him as well.", fx = { align = { order = 1 } } },
        { text = "Power always costs something. I pay willingly, and I would pay more.", next = "BACK", reply = "Willingly, yes, and that is what frightens me, because my people paid willingly too, and the bill came due for everyone.", fx = { align = { order = -1, light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xd_default", text = "It has, and I will grant Malfurion that much, though I have not forgiven him. He turned your people from the arcane to the wilds and cast mine out for refusing, and I sometimes wonder which of us had the harder road." },
      },
      choices = {
        { text = "The wilds don't destroy the world. Magic did.", next = "BACK", reply = "Perhaps not, but they have their own hungers, druid, and I have seen what an angry forest can do to those who wander into it.", fx = { align = { order = -1 } } },
        { text = "There's room for both, if both are kept in check.", next = "BACK", reply = "That is wisdom, and rarer than you know, and if Malfurion had said it to us ten thousand years ago, perhaps we would not be strangers now.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xf_default", text = "Most are as much at rest as they can be in a place like this; they walk their old paths and trouble no one. It is the dead the Magram raise in the valley I would watch, because nobody asked them whether they wished to get up." },
      },
      choices = {
        { text = "Nobody asked me either.", next = "xforsaken2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken2 = {
      big = true,
      lines = {
        { id = "xf2_default", text = "No, I don't suppose they did. Then perhaps you understand the dead below better than I ever will, and I should ask you how to speak to them, instead of the other way around." },
      },
      choices = {
        { text = "Leave them be. The dead have earned their peace.", next = "BACK", reply = "Then I will leave them be, and gladly. They have walked those colonnades for ten thousand years, and they have earned a little quiet.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The dead belong to whoever has the will to use them.", next = "BACK", reply = "That is what the Prince believes, and you see where it has led him, so I will keep my own will and the dead their rest, if I can.", fx = { align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      lines = {
        { id = "xw_default", text = "Held, against centaur? Perhaps, with walls and soldiers, and we have neither. The ruins hold well enough against time, which is the slower enemy and the more patient one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xrogue = {
      lines = {
        { id = "xr_default", text = "Old wards, some of them still awake, and vaults my people hid from the world that answer only to the right key. Some of them answer to a ring, if you happen to be wearing the right one, though I will leave that riddle for you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshaman = {
      lines = {
        { id = "xsm_default", text = "They have reason. The ground here remembers the Sundering, and the Magram stir the dead in the valley, and the guardians that once kept the elements calm for us are rotted or gone. I am glad someone listens to them, because I never learned how." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You are gracious, and it has been a very long time since anyone was gracious to a Highborne. I had thought myself past caring for such things, and I discover that I am not." },
        { id = "s2", text = "Kind words carry a long way up this hill, where I hear mostly the wind and the Magram at their work. I thank you, and I shall turn them over this evening as I would a good page." },
        { id = "s3", when = { class = "MAGE" }, text = "A fellow student of the arcane, and a courteous one. In Eldre'Thalas we held that manners and magic were learned together, and you would have done well in our halls." },
      },
      fail = {
        { id = "f1", text = "I served at a court where flattery was a finer art than sorcery, and I watched it lead my people into the sea. You will forgive me if I have lost my taste for it." },
        { id = "f2", text = "You are polite, but I have lived long enough to hear the request waiting behind a compliment. Ask it honestly, and I will think the better of you." },
        { id = "f3", when = { race = "NightElf" }, text = "Those are soft words, from one of the kaldorei to one of mine. I would like to trust them, but your people have taught me to listen for what follows." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha. No one has dared to be impertinent with me since the library, where it was considered a sign of promise. You remind me of better arguments than I have had in an age." },
        { id = "s2", text = "That stung a little, and I find I am grateful for it, since one who is only ever pitied forgets that he is still alive. You have a quick mind behind that tongue." },
      },
      fail = {
        { id = "f1", text = "I have outlived my city, my Prince's good name and nearly everyone I ever cared for. Whatever you hoped to wound, I assure you it was buried long ago." },
        { id = "f2", text = "That was beneath you, and it was certainly beneath this place. You are standing above a mass grave, so I would ask you to choose your words with more care." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "I see that you are not to be trifled with, and I am too old and too tired to make the experiment. You shall have your way, though I confess I had hoped for gentler company." },
        { id = "s2", text = "There is a force in you that I have felt only in the presence of great power, and I learned long ago to respect that. Very well, I yield the point, with what dignity a ruin's keeper has left." },
      },
      fail = {
        { id = "f1", text = "I stood in Eldre'Thalas when the world broke in half, and I did not look away. You will pardon me if a raised voice on a hilltop does not undo me." },
        { id = "f2", text = "You threaten someone who has nothing left to take but his books and his regrets. I would give you the regrets gladly, and the books are not here." },
      },
    },
  },

  topics = {
    _gated = {
      { id = "gt1", text = "That is a private matter, and I do not open such things to those I scarcely know. Perhaps when we are better acquainted, I shall." },
      { id = "gt2", text = "I would rather not speak of it to you, not yet. A Highborne learns slowly whom he may trust, and I have had ten thousand years to grow slower." },
    },
    highborne = { { id = "tp_highborne", text = "We were the nobility of the empire and the keepers of its magic, and we were wrong about almost everything that mattered. Those of us in Eldre'Thalas have had ten thousand years to learn that lesson, and some of us still have not." } },
    queen_azshara = { { id = "tp_azshara", text = "Our Light of Lights, they called her, and I called her that too. I would rather not speak her name on this hill, if you will forgive me." } },
    shal_nan = { { id = "tp_shalnan", text = "The Veiled One, who wore a golden mask and led the rebels against the Prince. I never knew whose face was under it, and in all these years I have never stopped wondering." } },
    burning_legion = { { id = "tp_legion", text = "My people opened the door for them once. The Prince below keeps one of their creatures chained for its power, and I pray every night it is not opening the door again." } },
    background = { { id = "tp_bg", text = "I am an archmage of the Shen'dralar, older than I care to count, and I survived the Sundering when I had no right to. Most of my life since has been reading, and the rest has been regret." } },
    advice = { { id = "tp_ad", text = "Do not go into Eldre'Thalas looking for treasure; go looking for understanding, or do not go at all. The city punishes greed, and it has had a long time to practice." } },
    dire_maul = { { id = "tp_dire_maul", text = "Eldre'Thalas survived the Sundering, and then it survived ten thousand years of our own Prince, and now it has ogres in the courtyards and a name that sounds like a tavern brawl. I find \"Dire Maul\" more insulting than the ogres." } },
    elune = { { id = "tp_elune", text = "There is a temple of Elune in these ruins, and I come out at night to watch the moonlight lie on it. I was never devout, but I find I cannot stay away." } },
    tyrande = { { id = "tp_tyrande", text = "I am told a priestess named Tyrande Whisperwind leads our cousins now, from a great tree in the north. I remember a young novice of that name, though I may be flattering my memory." } },
    satyrs = { { id = "tp_satyrs", text = "Some of my peers went to the Legion willingly and came back with hooves and horns, and I knew a few of them by name. I do not pray for them, but I remember them." } },
    centaur = { { id = "tp_centaur", text = "The Magram dig among the bones of my city's dead and raise them for their wars, and the bones were never asked. I watch from my overlook and do nothing, which is a habit I learned in the library." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback squabble over the ground at the valley's edge, and I watch them as one watches ants. I mean no cruelty by it, only that I have watched too many larger things squabble over the same ground." } },
    dalaran = { { id = "tp_dalaran", text = "The human mages of Dalaran have discovered that our library still stands, and they write very polite letters. I have lived long enough to know what a polite letter from a hungry scholar means." } },
    nordrassil = { { id = "tp_nordrassil", text = "The great tree on Hyjal was planted after the Sundering, by druids who distrusted everything we were. I hear it still grows, and I am glad, though I would never tell them so." } },
    scourge = { { id = "tp_scourge", text = "The Magram's dead are crude work, and I have heard that in the far north there is a far greater master of the craft. I have no wish to meet him, nor to compare notes." } },
    _none = { { id = "tp_none", text = "I have read most of the library below, and I do not recall that being in it. Perhaps it was in one of the volumes the satyrs burned." } },
  },
}
