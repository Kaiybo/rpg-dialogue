-- The Sepulcher's guests: a tauren druid trying to make a dead forest live, and a courier
-- who carries more than the mail. Voices: bibles/sepulcher_guests.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mura Runetotem: a tauren druid at the Sepulcher, studying how to heal Silverpine.
P:NPC {
  key = "sp_mura", id = TODO_NPC("Mura Runetotem"), name = "Mura Runetotem",
  bible = "bibles/sepulcher_guests.md", role = "questgiver", tier = "quest",
  communities = { "sepulcher" }, temper = { "gentle", "patient" }, values = { "nature", "kind", "curious" },
  notices = { "race", "form", "craft" },
  impression = {
    first = "Mura Runetotem is a tauren druid living among the Forsaken, trying to coax the dying pines of Silverpine back to health. She is gentle and stubborn about it, and she treats the dead around her as neighbours rather than as a warning.",
    third = "{name} met Mura Runetotem, a tauren druid at the Sepulcher who is trying to heal Silverpine Forest for the Forsaken.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly here, friend. The roots under the Sepulcher are older than its stones, and they are very tired." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "Earth Mother keep you, child of the plains. It does my heart good to hear hooves on this soil that aren't my own." },
    { id = "g_shell", when = { questActive = TODO_QUEST("Mura Runetotem") }, text = "You carry something from Tonga, I think. I can feel it from here, like warmth from a banked fire." },
    { id = "g_done", when = { questDone = TODO_QUEST("Mura Runetotem") }, text = "The shell still glows on my table, and some nights I sit with it the way you'd sit with a sick friend. Thank you again for carrying it so far." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone, and in that time I coaxed one sapling out of the ash by the north wall. It's small, but it's green, and green is rare here." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since we last spoke, the way a young tree grows when nobody is watching it. The forest has noticed, even if you haven't." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The Deathguard say you were kind to someone here. Kindness is a seed too, and this place needs every one it can get." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "You wear the wild's shape well, sister or brother. Be careful in Silverpine, though, because the worgen will take that shape as a challenge." },
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You've been picking herbs, I can smell them on you. Bring me anything that grows near the lake that looks wrong, please, because wrong is how I learn." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Your people built their home in a dead forest and never asked it for anything back. I'd like to be the one who asks on your behalf, if you don't mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Mura Runetotem, of the Runetotems of Thunder Bluff. The Forsaken are our allies now, and their forest is dying around them, so I came to see whether a druid's hands could do anything for it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Mura Runetotem") },
          text = "I've written to my kin at the Crossroads asking for anything that grows strangely in the Barrens. If Tonga sends a sample, I'll know the work is worth hoping for." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mura Runetotem"), days = 3 } },
          text = "It pulses, did you feel it? A shell from a dead turtle, a world away, still beating with life, and if life can cling that hard in the Barrens it can cling here too." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Circle, or near enough, standing in the Sepulcher. Come and kneel by the roots with me sometime, and tell me whether you hear what I hear." },
        { id = "h_forsaken", when = { race = "Scourge", questDone = TODO_QUEST("Mura Runetotem") },
          text = "Your people thank me politely and then go back to their crypts, and I don't blame them. A forest is a slow promise, and the dead have heard a great many promises." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I'm in no hurry, and neither are the trees." },
        { id = "h_again2", text = "Go on, friend. I was only listening to the pines." },
        { id = "h_again3", when = { race = "Tauren" }, text = "Ask what you like, child of the plains. It's good to talk in our own way for a while." },
      },
      choices = {
        { text = "What's wrong with Silverpine?", next = "forest" },
        { text = "Why would a tauren help the Forsaken?", next = "why" },
        { text = "What did Tonga's shell tell you?", next = "shell", when = { questDone = TODO_QUEST("Mura Runetotem") } },
        { text = "What did you ask Tonga to send?", next = "shell_before", when = { ["not"] = { questDone = TODO_QUEST("Mura Runetotem") } } },
        { text = "How do the Forsaken treat you here?", next = "neighbours" },
        { text = "Can a druid heal what the plague killed?", next = "druidq", when = { class = "DRUID" } },
        { text = "Do you miss Mulgore, Mura?", next = "home", when = { race = "Tauren" } },
        { text = "I'll leave you to the trees.", next = "END" },
      },
    },

    forest = {
      lines = {
        { id = "f_default", text = "Many things at once, which is why it's so hard to mend. The plague passed through the roots on its way to Lordaeron, and Arugal's wolves tear at everything that still runs, and the lake water tastes of rot and old magic." },
        { id = "f_worgen", when = { topicKnown = "worgen" }, text = "You've heard of the worgen, then, so you know half of it already. The plague passed through the roots, and the wolves tear at everything that still runs, and the lake tastes of rot and old magic besides." },
      },
      choices = {
        { text = "Which of those is worst for the trees?", next = "forest_worst" },
        { text = "Something else, Mura.", next = "BACK" },
      },
    },
    forest_worst = {
      lines = { { id = "fw_default", text = "The plague, because it went into the soil and stayed there, and a tree drinks whatever the soil gives it. The wolves only kill what moves, but the plague poisons what stands still, and these pines can't walk away." } },
      choices = {
        { text = "Can it ever be cleaned?", next = "forest_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest_hope = {
      big = true,
      lines = { { id = "fh_default", text = "I believe so, or I'd have gone home a season ago. The apothecaries tell me nothing that grows here will ever be clean, and I tell them the earth has buried worse than them and come back green, which they don't enjoy hearing." } },
      choices = {
        { text = "The land should be healed for its own sake.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A dead forest suits the dead well enough.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "Because Cairne Bloodhoof gave his word to the Warchief, and the Warchief gave his to the Dark Lady, and a Runetotem keeps the words her elders give. Also because a forest is a forest, whoever lives in it, and this one is crying out." } },
      choices = {
        { text = "Do all the tauren feel that way?", next = "why_tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_tauren = {
      big = true,
      lines = { { id = "wt_default", text = "No, and I'd be lying to you if I said otherwise. Some at the Bluff think the Forsaken are a wound in the world that should be allowed to close, and some think as I do, that a wound is exactly where a healer ought to be." } },
      choices = {
        { text = "Then you're right to be here. Healers go where it hurts.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Your kin may be right. Some things shouldn't be mended.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shell_before = {
      lines = { { id = "sb_default", text = "Anything that lives where it shouldn't. Tonga writes that the beasts around the Wailing Caverns are changing, growing larger and stranger, and if there's some wild power in those caves pushing life outward, I want to know what it feels like." } },
      choices = {
        { text = "Isn't that power dangerous?", next = "shell_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shell_danger = {
      lines = { { id = "sd_default", text = "Very possibly, and I'd only study it, not pour it on the pines. A druid who uses a power before she understands it ends up with a forest worse than the one she started with, and Silverpine already has one mage's mistake running through it on four legs." } },
      choices = {
        { text = "I'll keep an eye out for Tonga's messenger.", next = "BACK", fx = { learn = { "wailing_caverns" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shell = {
      lines = { { id = "s_default", text = "That life wants to go on, even after the body that carried it is gone, and that's a strange lesson to learn surrounded by Forsaken. The shell should be cold and dull by now, but it's warm, as if something in the Barrens is still feeding it." } },
      choices = {
        { text = "Could that power heal this forest?", next = "shell_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shell_use = {
      big = true,
      lines = { { id = "su_default", text = "Perhaps one day, if I learn its nature before I learn its price. The druids who went into those caves to dream have not come out the same, by Tonga's account, so I'll take my time, even if Silverpine can't afford much of it." } },
      choices = {
        { text = "Take your time. A rushed cure is a new sickness.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Silverpine can't wait. Use it and learn as you go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    neighbours = {
      lines = { { id = "n_default", text = "Better than I feared and worse than I hoped, which I'm told is how most guests are treated. The High Executor gives me a corner and asks me nothing, and the apothecaries ask me a great deal, mostly about which mushrooms are poisonous." } },
      choices = {
        { text = "Why do the apothecaries want to know that?", next = "neigh_apoth" },
        { text = "And the others at the Sepulcher?", next = "neigh_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neigh_apoth = {
      big = true,
      lines = { { id = "na_default", text = "They tell me it's for their work against the Scourge, and I've decided to believe them, since the other choice is to stop answering. Renferrel listens very closely, though, and writes everything down in a hand too small for me to read." } },
      choices = {
        { text = "You should stop answering them, Mura.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Their work keeps the Forsaken alive. Help them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neigh_others = {
      lines = { { id = "no_default", text = "Gwyn Farrow sells mushrooms and wants to know which ones I'd eat, which is none of them. Wallace sits out in the cold and says the trees whisper to him, and I haven't the heart to tell him I hear them too." } },
      choices = {
        { text = "What do the trees say?", next = "neigh_trees" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neigh_trees = {
      lines = { { id = "nt_default", text = "Nothing in words, only a slow sort of ache, the way an old bull's knees ache before the rain. When I hear it ease a little, I know I've done something right that day." } },
      choices = {
        { text = "I hope you hear it ease more often.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    druidq = {
      lines = { { id = "dq_default", text = "Not alone and not quickly, and the Circle's elders would tell you not at all. I think the earth heals what it's given time and help to heal, and the only question is whether anyone here will give it either." } },
      choices = {
        { text = "Then I'll give it some of my time.", next = "druid_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_stance = {
      big = true,
      lines = { { id = "ds_default", text = "That's kind, and I'll hold you to it. When you walk through the pines, put your hand on the bark of a living one and let it feel a living hand, because that does more than you'd think." } },
      choices = {
        { text = "Balance needs patience. I'll do it gladly.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'd rather burn the rot out and let it regrow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    home = {
      lines = { { id = "ho_default", text = "Every morning, when the fog comes in grey instead of gold. I miss the smell of grass after the rain and the sound of the kodo in the valley, and I miss being somewhere the ground isn't sad." } },
      choices = {
        { text = "Then why not go back?", next = "home_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_back = {
      lines = { { id = "hb_default", text = "Because Mulgore doesn't need me, and this place does. The Earth Mother gave us the plains, but I don't think she meant for us to stay inside them forever, and somebody of our people ought to be here when the Forsaken finally ask for help." } },
      choices = {
        { text = "I'm glad it's you, Mura.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know trees and the things that grow under them, and a little of what the deathstalkers tell me. Ask, and I'll answer as plainly as I can." },
    },
    worgen = { { id = "tp_worgen", text = "They hunt like wolves but hate like men, and wolves never hate. Whatever Arugal called up, it isn't of the wild." } },
    wailing_caverns = { { id = "tp_caverns", text = "Tonga's worry, and now mine. Druids went there to dream and the land around the caves began to change, and I'm not certain the dreamers are the ones in charge of it." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle taught our people a great deal. I think they'd call this work hopeless, so I haven't written to ask." } },
    background = { { id = "tp_bg", text = "A Runetotem from Thunder Bluff who listened to her elders and then went somewhere they hadn't thought to send her." } },
    _none = { { id = "tp_none", text = "That's beyond my roots, friend. Ask Allister, perhaps; he collects what people know." } },
  },
}

-- Astor Hadren: a Forsaken courier at the Sepulcher who carries the Syndicate's letters
-- between here and Brill, and hopes nobody notices.
P:NPC {
  key = "sp_astor", id = TODO_NPC("Astor Hadren"), name = "Astor Hadren",
  bible = "bibles/sepulcher_guests.md", role = "citizen", tier = "quest",
  communities = { "sepulcher" }, temper = { "smooth", "anxious" }, values = { "cunning", "greedy" },
  notices = { "stealth", "class", "purse" },
  impression = {
    first = "Astor Hadren calls himself a messenger and talks a great deal without saying anything. He is friendly in the way of a man who would very much like you to go away, and his satchel never leaves his shoulder.",
    third = "{name} met Astor Hadren, a courier at the Sepulcher who carries letters between Silverpine and Brill.",
  },

  greetings = {
    { id = "g_default", text = "Hello, hello! Nothing for you today, I'm afraid, unless you're expecting a letter, and you don't look like someone who expects letters." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of the light-fingered sort. Keep your hands where I can admire them, friend, there's a good fellow." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Deathstalkers") }, text = "You've been watching me since you came in. I'm very dull, I promise you, and so is everything I carry." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Deathstalkers") }, text = "I lost a letter not long ago, a very ordinary letter, and somebody went to a great deal of trouble for it. You wouldn't know anything about that, I'm sure." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were you? I've walked to Brill and back four times since, and my boots have the holes to prove it." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear somebody caught you in a lie. It happens to the best of us, friend, though it has never once happened to me." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can't see you, but I can hear you breathing, if you're the sort who still breathes. Either way, the satchel stays shut." },
    { id = "n_purse", cat = "purse", when = { money = { min = 50000 } },
      text = "That's a heavy purse for the Sepulcher. If you ever need something carried quietly to Brill, I know a reliable man, and he's standing in front of you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Astor Hadren, messenger, at your service, though not at your expense. I carry the post between the Sepulcher and Brill, and I'm very good at it, because I never read a word of what I carry." },
        { id = "h_rogue_q", when = { class = "ROGUE", questActive = TODO_QUEST("The Deathstalkers") },
          text = "A rogue, and you've a look about you like someone sent you with a purpose. I'd remind you the Deathguard stand just outside, and they're very fond of me." },
        { id = "h_after", when = { questDone = TODO_QUEST("The Deathstalkers") },
          text = "I'm still the messenger, whatever you've heard, and I'm still walking the same road. Somebody borrowed my good name for a little while, but I've got it back and given it a wash." },
        { id = "h_orc", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "One of the Warchief's people! You'll be wanting a letter carried home to Orgrimmar, I expect, and I'm afraid my route is a short one, though I could recommend a bat." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a long walk ahead and I'd like to start it before dark." },
        { id = "h_again2", text = "Go on, then. I always have time for a friend, or something like a friend." },
      },
      choices = {
        { text = "What sort of letters do you carry?", next = "letters" },
        { text = "Is the road to Brill dangerous?", next = "road" },
        { text = "Who do you work for, exactly?", next = "employer" },
        { text = "What's the news between here and Brill?", next = "news" },
        { text = "I know what's in your satchel, Astor.", next = "satchel", when = { class = "ROGUE" } },
        { text = "Good luck on the road.", next = "END" },
      },
    },

    letters = {
      lines = { { id = "l_default", text = "Official ones, mostly, sealed and dull. Requisitions for the High Executor, reports for Magistrate Sevren, and the odd private note from a Deathguard to someone he used to love, which I find very touching and never open." } },
      choices = {
        { text = "You never open any of them?", next = "letters_never" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_never = {
      big = true,
      lines = { { id = "ln_default", text = "Never, on my honour as a messenger. A courier who reads the mail is a courier who ends up in the lake, and I've been dead once already and didn't care for it." } },
      choices = {
        { text = "An honest courier is worth his weight in silver.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A courier who doesn't read is wasting his chances.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    road = {
      lines = { { id = "r_default", text = "Dangerous enough to keep honest men off it, which is good for business. There are worgen in the hills past Pyrewood, and gnolls by the river, and the bridge at the Tirisfal border has Scourge stragglers who don't know they've lost the war." } },
      choices = {
        { text = "How do you get through alive?", next = "road_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_how = {
      lines = { { id = "rh_default", text = "I don't stop, I don't look in anyone's eyes, and I don't carry anything a worgen would want, which is most things. I also know which Deathguard post has the friendliest fire, and I time my walking accordingly." } },
      choices = {
        { text = "That's a sensible way to live, or not live.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    employer = {
      lines = {
        { id = "e_default", text = "The Dark Lady's government, of course, through the proper offices, in a manner of speaking. A messenger works for whoever has a letter and the copper to send it, and I'm very careful never to ask more than that." },
        { id = "e_cold", when = { disposition = { max = 34 } }, text = "The Dark Lady's government, and I don't care for the way you asked. A messenger works for whoever pays the postage, and that's all you'll get from me." },
      },
      choices = {
        { text = "So anyone could pay you to carry anything.", next = "employer_any" },
        { text = "Something else.", next = "BACK" },
      },
    },
    employer_any = {
      big = true,
      lines = { { id = "ea_default", text = "Anyone with good manners and a sealed letter, yes, and I'd thank you not to say it in that tone. The Undercity runs on letters, friend, and not all of them are written by people the Deathguard like." } },
      choices = {
        { text = "Then you ought to be careful who you serve.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good. A clever man works for whoever pays best.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    news = {
      lines = { { id = "nw_default", text = "Brill's magistrate wants more Deathguard and won't get them, and the apothecaries want more pumpkins and will. Here at the Sepulcher the High Executor is short of everything except enemies, which he has in a wonderful variety." } },
      choices = {
        { text = "Any news you're not supposed to share?", next = "news_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_secret = {
      lines = { { id = "ns_default", text = "None at all, because I don't read the letters, as I believe I mentioned. I will say that some very well-dressed humans keep turning up in Hillsbrad and the Alterac hills, and that they never seem to need a messenger, which is rude of them." } },
      choices = {
        { text = "Who are they?", next = "news_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_who = {
      big = true,
      lines = { { id = "nwh_default", text = "People who think the old noble houses of Alterac should still own a great deal of land that nobody else agrees they own. They call themselves the Syndicate, and I've never met one, and I'd very much like to keep it that way." } },
      choices = {
        { text = "Thieves and traitors. They should hang.", next = "BACK", fx = { align = { honor = 1 }, learn = { "syndicate" } } },
        { text = "Every house fights for what's theirs. I can't blame them.", next = "BACK", fx = { align = { honor = -1 }, learn = { "syndicate" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } },
      },
    },

    satchel = {
      lines = {
        { id = "sa_default", text = "Then you know it holds the post, and a spare pair of socks, and a very old biscuit. I'd be grateful if you kept that knowledge to yourself, since it's a private biscuit." },
        { id = "sa_quest", when = { questActive = TODO_QUEST("The Deathstalkers") }, text = "Do you, now? Then you'll know there's a letter of introduction in it with my name on, and that it introduces me, and nobody else, to people you won't ever meet." },
      },
      choices = {
        { text = "Who sent you a letter of introduction?", next = "satchel_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    satchel_who = {
      lines = { { id = "sw_default", text = "Friends of a friend, who need a reliable man on the Brill road and pay him properly. Now, I'm going to walk out of that door, and you're going to remember that the Deathguard like me very much." } },
      choices = {
        { text = "You're carrying for the Syndicate, aren't you?", next = "satchel_accuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    satchel_accuse = {
      big = true,
      lines = {
        { id = "sac_default", text = "I'm carrying for whoever pays the postage, and I'd keep my voice down if I were you. The deathstalkers would love to hear a name like that, and I'd hate for them to hear it about either of us." },
        { id = "sac_after", when = { questDone = TODO_QUEST("The Deathstalkers") }, text = "You already know what was in the last one, so don't play the innocent with me. Somebody wore my name to a meeting and learned what my friends wanted, and I've been explaining it ever since." },
      },
      choices = {
        { text = "I'll be telling the deathstalkers about you.", next = "END", fx = { affinity = -2, align = { order = 1 }, learn = { "syndicate" } } },
        { text = "Your secret's safe. Everyone needs to earn a living.", next = "BACK", fx = { affinity = 1, align = { order = -1 }, learn = { "syndicate" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } },
      },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Never heard of them, and if I had, I'd have forgotten. Forgetting is a courier's best skill." } },
    worgen = { { id = "tp_worgen", text = "They don't read, so they're no use to me, and they bite, so I'm no use to them. We keep our distance." } },
    _none = { { id = "tp_none", text = "Not my business, friend, and I take great care to have very little business." } },
  },
}
