-- Razorfen Downs: Belnistrasz, who would snuff out the Scourge's idol; Henry Stern, a captive
-- cook with recipes worth the rescue; and Amnennar the Coldbringer, the lich among the thorns.
-- Voices: bibles/dg_belnistrasz.md, bibles/dg_henry_stern.md, bibles/dg_amnennar.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Belnistrasz: a wanderer who knows far too much about the Scourge's ritual.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_belnistrasz", id = TODO_NPC("Belnistrasz"), name = "Belnistrasz",
  bible = "bibles/dg_belnistrasz.md", role = "questgiver", tier = "quest",
  temper = { "grave", "calm" }, values = { "wise", "secretive" },
  notices = { "class" },
  impression = {
    first = "Calm, very old in the eyes, and careful about what he doesn't say.",
    third = "{name} met Belnistrasz in Razorfen Downs, where he planned to break the Scourge's idol.",
  },

  greetings = {
    { id = "g_default", text = "You have found your way through the thorns, which means you are either very brave or very lost. I hope it's the first, because I have need of brave people." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Extinguishing the Idol") }, text = "When you are ready, tell me, and I'll begin. The ritual takes time, and the dead will not let me have it gladly." },
    { id = "g_done", when = { questDone = TODO_QUEST("Extinguishing the Idol") }, text = "The idol is cold and the brazier is quiet. You did well, and the Barrens will never know how well." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST" } },
      text = "You'll feel the cold of that idol in your bones, I think, the way a scholar feels a wrong note in a spell." },
  },

  start = "hello",
  nodes = {
    w8_watch = {
      lines = { { id = "w8_watch_a", text = "Since the cold first crept south from the barrows, and the thorns began to grey at their tips. I have watched quilboar die and rise, and I have counted every one, and the number grows each night." } },
      choices = {
        { text = "Why not call for help sooner?", next = "w8_watch2" },
        { text = "You've carried this alone too long.", next = "w8_watch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_watch2 = {
      lines = { { id = "w8_watch2_a", text = "I did call, and the Crossroads sent scouts, and the scouts went into the thorns and did not come out. So I waited for someone who would get this far on their own, and here you stand." } },
      choices = {
        { text = "Then let's finish this together.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "My name is Belnistrasz. The Scourge have come here to the Downs and made a bargain with the quilboar, and they are using a great idol to spread their plague through the thorns." } },
      again = { { id = "h_again", text = "Ask what you must, but quickly." }, { id = "h_again2", text = "Is there something more you need to know?" } },
      choices = {
        { text = "The Scourge, this far south?", next = "scourge" },
        { text = "What does the idol do?", next = "idol" },
        { text = "Who are you, really?", next = "who" },
        { text = "Why would the quilboar side with the dead?", next = "quilboar" },
        { text = "My elders say Agamaggan's blood made these thorns.", next = "agamaggan", when = { race = "Tauren" } },
        { text = "There's something unnatural about you, Belnistrasz.", next = "sense", when = { class = { "MAGE", "DRUID", "PRIEST" } } },
        { text = "I'll help you destroy the idol.", next = "BUSINESS" },
        { text = "How long have you watched the Downs?", next = "w8_watch" },
        { text = "Not today.", next = "END" },
      },
    },
    scourge = {
      lines = { { id = "s_default", text = "Yes, and that should frighten you more than any army in the north. A lich named Amnennar the Coldbringer holds court below, and every quilboar he turns is one more soldier for the Lich King." } },
      choices = {
        { text = "Then the Horde and Alliance must hear of it.", next = "BACK", reply = "They must, and they will, but by then it may be too late. Better we act first.", fx = { align = { order = 1 }, learn = { "amnennar" } } },
        { text = "Then we strike before anyone else meddles.", next = "BACK", reply = "Bold, and perhaps right. Armies are slow, and plagues are not.", fx = { align = { order = -1 }, learn = { "amnennar" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "amnennar" } } },
      },
    },
    idol = {
      lines = { { id = "i_default", text = "It draws life out of the earth and gives back death, a little at a time, and the thorns carry it outward. If I can douse the brazier that feeds it, the spreading stops." } },
      choices = {
        { text = "And the dead will try to stop you.", next = "defend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defend = {
      lines = { { id = "d_default", text = "They will come in waves the moment I start, and I can't defend myself and work the ritual at once. That is where you come in, friend." } },
      choices = {
        { text = "How long does the ritual take?", next = "ritual" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ritual = {
      lines = { { id = "ri_default", text = "Longer than you'll like, and the brazier fights back the whole while. When the flames finally gutter out, a great beast of bone may rise to avenge the idol, so keep something in reserve for the end." } },
      choices = {
        { text = "We'll hold, however long it takes.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "A traveler who has seen this kind of evil before, and who learned that waiting for someone else to stop it rarely works. The rest is a long story, and we haven't the time." } },
      choices = {
        { text = "You're hiding something.", next = "BACK", reply = "Everyone in these thorns is hiding something, friend. Mine at least won't hurt you.", fx = { affinity = -1 } },
        { text = "Fair enough. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    quilboar = {
      lines = { { id = "q_default", text = "Fear, mostly, and the promise that they'll never have to die. The Coldbringer told them their thorns would last forever, and they believed him because they wanted to." } },
      choices = {
        { text = "Are they all willing, or are some forced?", next = "quilboar_forced" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quilboar_forced = {
      lines = { { id = "qf_default", text = "Some went gladly, and some were simply too afraid to say no to a lich. The rest are lying cold in the barrows, and the Coldbringer has a use for those as well." } },
      choices = {
        { text = "Then the willing ones die with him.", next = "BACK", reply = "I won't stop you, though I'd not waste your strength on them before the idol is out.", fx = { align = { light = -1 } } },
        { text = "Spare those who were frightened into it.", next = "BACK", reply = "If you can tell them apart in the thick of it, you're a better judge than I am. But it's well meant.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    agamaggan = {
      lines = { { id = "ag_default", text = "Your elders speak truly. The great boar fell here in the War of the Ancients, and his blood raised the thorns, and the quilboar have called them sacred ever since. Now the dead are using that holy ground to grow their plague." } },
      choices = { { text = "Then we cleanse it for Agamaggan's sake.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    sense = {
      narr = "He meets your eyes for a long moment, and his own seem older than his face.",
      lines = { { id = "se_default", text = "You have a keen eye. I am not what I appear, and that is all I'll say while the Coldbringer's ears are so close. Help me with the idol, and judge me by that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    amnennar = { { id = "tp_am", text = "Amnennar the Coldbringer, the lich who rules the Downs for the Scourge.", next = "scourge" } },
    _none = { { id = "tp_none", text = "Perhaps another time, when the dead aren't so close." } },
  },
}

---------------------------------------------------------------------------
-- Henry Stern: a cook and herbalist held in the Downs, with recipes he'll share with rescuers.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_henry_stern", id = TODO_NPC("Henry Stern"), name = "Henry Stern",
  bible = "bibles/dg_henry_stern.md", role = "trainer", tier = "quest",
  temper = { "cheerful", "anxious" }, values = { "practical" },
  notices = { "class", "race" },
  impression = {
    first = "A cook who still talks about tea while the dead walk past.",
    third = "{name} met Henry Stern, a captive cook in Razorfen Downs.",
  },

  greetings = {
    { id = "g_default", text = "Oh, thank the Light, a living face! Please tell me you've got a knife for these ropes and not for me." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll! I learned half my best brews from Darkspear herbalists, and I'll swear by them till my dying day, which I hope isn't today." },
  },

  start = "hello",
  nodes = {
    w8_meal = {
      lines = { { id = "w8_meal_a", text = "A shark-fin soup in a Booty Bay galley during a storm, with the whole ship rolling and the captain shouting for it, and I never spilled a drop! The crew called it the best thing they'd eaten in a year, and then they all got seasick, so I never knew if they meant it." } },
      choices = {
        { text = "That's a cook's victory, either way.", next = "w8_meal2" },
        { text = "Shark-fin soup? What's the secret?", next = "w8_meal2" },
        { text = "I cook too. I'd love that recipe.", next = "w8_meal2", when = { profession = "Cooking" } },
        { text = "Something else, Henry.", next = "BACK" },
      },
    },
    w8_meal2 = {
      lines = {
        { id = "w8_meal2_a", text = "A splash of rum and a fistful of goldthorn, which is the real reason I'm tied to a post in a field of dead pigs. Every recipe's got a price, friend, and that one's cost me more than most." },
        { id = "w8_meal2_cook", when = { profession = "Cooking" }, text = "Untie me and it's yours, friend, every pinch and splash of it! Rum, goldthorn and a slow simmer, and never, ever add salt until the end, which is what every galley cook gets wrong." },
      },
      choices = {
        { text = "Let's get you out of here first.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "Henry Stern, cook and collector of recipes, though right now I'm more of a collector of bruises. The quilboar caught me looking for goldthorn, and I've been here long enough to stop counting the days." } },
      again = { { id = "h_again", text = "What else can I tell you, friend? Talking keeps my mind off the ropes, and off the dead pigs." } },
      choices = {
        { text = "What recipes do you know?", next = "recipes" },
        { text = "Why come into the Downs at all?", next = "why" },
        { text = "What have you seen down here?", next = "seen" },
        { text = "You don't look like a herbalist, Henry.", next = "herbalist" },
        { text = "I've brewed a few things with Darkspear herbs myself.", next = "darkspear", when = { race = "Troll" } },
        { text = "A shaman knows a good root when he sees one.", next = "darkspear", when = { class = "SHAMAN" } },
        { text = "Can you teach me something?", next = "BUSINESS" },
        { text = "Who are you cooking for, back home?", next = "yhome" },
        { text = "What's the best meal you ever cooked?", next = "w8_meal" },
        { text = "Stay safe, Henry.", next = "END" },
      },
    },
    recipes = {
      lines = { { id = "r_default", text = "A tea brewed from goldthorn that'll put spirit back into a tired body, and a troll's blood potion that I learned from the Darkspear. I'll gladly share both with whoever gets me out of here." } },
      choices = {
        { text = "That's a fair trade.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Goldthorn grows thickest where the thorns are oldest, and the Downs are very old indeed. I thought the quilboar would be the worst of it, and I've never been so wrong about anything in my life." } },
      choices = {
        { text = "Was any herb worth this much trouble?", next = "goldthorn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goldthorn = {
      lines = { { id = "gt_default", text = "Not when you put it that way, no. But a pot of goldthorn tea fetches a fine price in Ratchet, and I'd promised a batch to a sailor there who swears it's the only thing that settles his stomach." } },
      choices = {
        { text = "A man ought to keep his promises.", next = "promise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    promise = {
      lines = { { id = "pr_default", text = "That's what my mother always said, and look where it got me, tied to a post among dead pigs. Still, if I get out, that sailor gets his tea, and he'll never know what it cost me." } },
      choices = {
        { text = "That's stubbornness, and I admire it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbalist = {
      lines = { { id = "hb_default", text = "No, I look like a cook, and that's what I am first. But a cook who doesn't know his herbs is just a man boiling things, and I learned early that the best flavours grow where nobody sensible goes." } },
      choices = {
        { text = "Where did you learn to cook?", next = "learned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned = {
      lines = { { id = "le_default", text = "In a ship's galley out of Booty Bay, feeding sailors who'd complain about anything that wasn't salt pork. When I came ashore in Kalimdor I swore I'd never cook salt pork again, and I've kept that oath better than most." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    darkspear = {
      lines = { { id = "ds_default", text = "Have you now! Then you'll know the trick with the blood potion is to bruise the root and never cut it, which took me three ruined batches and one very patient Darkspear woman in Sen'jin to learn." } },
      choices = {
        { text = "Every trade has its little secrets.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "Quilboar that don't breathe, and a cold that comes up from below even at noon. The guards talk about a master in the deep tunnels, and they go very quiet when they do." } },
      choices = {
        { text = "The Scourge have to be stopped here.", next = "BACK", reply = "Bless you for saying it, and please do it after you've untied me.", fx = { align = { light = 1 } } },
        { text = "Not my fight. I came for loot.", next = "BACK", reply = "Well, honest at least. Untie me anyway and I'll throw in a recipe.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhome = {
      lines = {
        { id = "yho_default", text = "Nobody in particular, which is the sad truth of a travelling cook. I've a sister in Theramore who married a quartermaster, and she writes that I ought to settle down and feed the garrison. I might, if I live through this." },
        { id = "yho_horde", when = { faction = "Horde" }, text = "A sister in Theramore, married to an Alliance quartermaster, though I'll cook for anyone who's hungry, Horde included. Half my best recipes came from Sen'jin, after all. She says I ought to settle down." },
      },
      choices = {
        { text = "Will you settle down?", next = "ysettle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysettle = {
      narr = "He tests the ropes again, wincing, and gives up with a sigh.",
      lines = { { id = "yse_default", text = "A garrison kitchen is safe and steady, with no quilboar in it. But I'd never learn another recipe again, only salt pork and porridge for a thousand soldiers. Should a cook play it safe, or chase the next flavour?" } },
      choices = {
        { text = "Settle down. You've done enough wandering.", next = "BACK", reply = "My sister would kiss you for that. I may yet listen.", fx = { align = { order = 1 } } },
        { text = "Chase the flavour. Life's too short for porridge.", next = "BACK", reply = "Ha! A kindred spirit. Untie me and I'll cook you something.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    ratchet = { { id = "yt_ratchet", text = "Ratchet's harbour smells of fish and goblin grease, and the sailors there will eat anything if you call it a delicacy." } },
    goldthorn = { { id = "yt_gold", text = "Goldthorn grows in old thorny places. It tastes of honey and iron, and it'll put the life back in you." } },
    quilboar = { { id = "yt_quil", text = "The quilboar of the Downs aren't like the ones in the Barrens. Half of them don't breathe any more." } },
    amnennar = { { id = "yt_amn", text = "The guards whisper about Amnennar, the Coldbringer, down in the deepest tunnels. I'd rather not meet him." } },
    _none = { { id = "tp_none", text = "I'm afraid I only know about cooking, herbs, and how very much these ropes chafe." } },
  },
}
