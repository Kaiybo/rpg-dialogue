-- Valanaar, Zephras Isle: the Skyborne capital on the island's southern tip, with the
-- Calmbreeze Inn and the skydocks. Ealaane Nimbuswalker (refugee), Sirocca "Swimmers"
-- Starfeather and Donaal Downbreeze at the inn, and Nyalah Brightfire the cook.
-- Voice and sources: bibles/zephras.md (facts from warcraft.wiki.gg).
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Ealaane Nimbuswalker: refugee from Ban'aethal, which fell into the sky.
-- Lost her lover Resaan; knows Luminarian's work and the twin blades.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_ealaane", id = TODO_NPC("Ealaane Nimbuswalker"), name = "Ealaane Nimbuswalker", title = "Ban'aethal Refugee",
  bible = "bibles/zephras.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "gentle", "steady" }, values = { "loyal", "kind" },
  notices = { "class", "stranger", "kin" },

  impression = {
    first = "Ealaane Nimbuswalker fled Ban'aethal the night it began falling into the sky, and the man she loved went back for supplies and never returned. She is quiet and exact, and she knows old Skyborne craftsmanship the way some people know scripture.",
    third = "{name} met Ealaane Nimbuswalker, a refugee from fallen Ban'aethal who mourns her lover Resaan and knows the works of the magesmith Luminarian.",
  },

  greetings = {
    { id = "g_default", text = "Winds be with you. Forgive me; I wasn't expecting anyone to stop." },
    { id = "g_again", when = { metBefore = true }, text = "You came back. That's kind of you, truly." },
  },

  notice = {
    { id = "n_blade", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "May I look at your blade a moment? No, it isn't Luminarian's work, I can see that, but you hold it as if you'd want to know whose it was, and I like that in a fighter." },
    { id = "n_stranger", cat = "stranger", when = { ["not"] = { race = "Skyborne" } },
      text = "A mainlander, out here among us refugees? Most of your kind stay by the skydocks, where the ground is sure." },
    { id = "n_kin", cat = "kin", when = { race = "Skyborne", maxLevel = 12 },
      text = "You're young to be out so far from the villages. Keep your relic close, please; we've lost enough of them already." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ealaane Nimbuswalker, and I came here from Ban'aethal, or from what was Ban'aethal. We fled in the night when it began to fall into the sky, and there are a great many of us now with nowhere to go but here." },
        { id = "h_hilt", tags = { "news" }, when = { questDone = TODO_QUEST("The Ancient Hilt") },
          text = "I still think of that hilt you brought me out of the ruins. Luminarian's own work, carried all that way, and it found its way to you; I don't believe that was chance." },
        { id = "h_blade", tags = { "news" }, when = { questDone = TODO_QUEST("Eluvi'ana") },
          text = "You have both of them now, Eluvi'tor and Eluvi'ana, the twin blades of Luminarian. Keep them safe, because one day there may be a way to make them whole again." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "You're a smith's people, I've heard, and you look at metal the way I do. Our finest craftsmen were the magesmiths of Ban'aethal, and I'd have loved to show you their forges before they fell." },
      },
      again = {
        { id = "h_again", text = "What else? It helps, a little, to talk." },
        { id = "h_again2", text = "Go on. I'm not going anywhere, as you can see." },
      },
      choices = {
        { text = "What happened to Ban'aethal?", next = "banaethal" },
        { text = "Who was Luminarian?", next = "luminarian" },
        { text = "How are the refugees managing?", next = "refugees" },
        { text = "Is Zephras safe?", next = "zephras" },
        { text = "I'm glad Resaan's heirloom came home.", next = "heirloom", when = { questDone = TODO_QUEST("The Fate of a Loved One") } },
        { text = "Take care, Ealaane.", next = "END" },
      },
    },
    banaethal = {
      lines = {
        { id = "ba_default", text = "The islands began to drift apart a few years ago, and great pieces of Zephras have been breaking away ever since. Ban'aethal went in the night, slowly enough to run and too quickly to take much with us, and we left nearly everything behind." },
      },
      choices = {
        { text = "Did everyone get out?", next = "resaan" },
        { text = "What's left of it now?", next = "ruins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    resaan = {
      lines = {
        { id = "rs_default", text = "Nearly everyone. Resaan, the man I loved, went back for supplies once we were clear, because he couldn't bear the thought of the others going hungry, and he didn't come back to me." },
      },
      choices = {
        { text = "I'm so sorry, Ealaane.", next = "resaan2", fx = { affinity = 1 } },
        { text = "Why did nobody stop him?", next = "resaan2" },
      },
    },
    resaan2 = {
      big = true,
      lines = {
        { id = "r2_default", text = "Because he'd have gone anyway, and because some of us needed what he went to fetch. I've had a long while to decide whether he was brave or foolish, and I still change my mind every evening." },
      },
      choices = {
        { text = "He was brave. He gave his life for others.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "He should have stayed with you. The others weren't his to save.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Is there anything I can do for you?", next = "heirloom_ask" },
      },
    },
    heirloom_ask = {
      lines = {
        { id = "ha_default", text = "His heirloom is still out there, in the ruins where he fell. It should be passed on to someone young, as our custom asks, and I can't bear to go and look for it myself." },
      },
      choices = {
        { text = "I'll look for it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heirloom = {
      lines = {
        { id = "he_default", text = "So am I, more than I can say. It will go to the High Elder's keeping and then to some child coming of age, and some part of Resaan will go on with them, which is what he would have wanted." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    ruins = {
      lines = {
        { id = "ru_default", text = "Ruins, and worse than ruins; the Peacekeepers warn everyone away from them and from Shadowgale Forest alike. People say there are spirits out there now that look hollowed out, as if something had scraped them empty, and I don't know what to believe." },
      },
      choices = {
        { text = "I'll find out for myself.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    luminarian = {
      lines = {
        { id = "lu_default", text = "The greatest magesmith our people ever had. He came with our ancestors when they fled Kalimdor and worked in the Skyborne Isles for centuries after, and most of the arms and armor you see on Zephras today are still made in his style." },
      },
      choices = {
        { text = "How do you know his work?", next = "luminarian_mark" },
        { text = "Did he make anything famous?", next = "twins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    luminarian_mark = {
      lines = {
        { id = "lm_default", text = "He left arcane markings on everything he made, small and easy to miss if you don't know to look. In Ban'aethal you grew up looking, because our magesmiths learned their craft from secrets handed down from his time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    twins = {
      big = true,
      lines = {
        { id = "tw_default", text = "A pair of swords, Eluvi'tor and Eluvi'ana, twins forged together, and both lost for centuries. Their magic would be faint by now, if anyone found them, but even broken they'd be beyond price to our people." },
      },
      choices = {
        { text = "Treasures like that belong to all your people.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whoever finds them should keep them. That's the way of things.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refugees = {
      lines = {
        { id = "rf_default", text = "Badly, for the most part. Valanaar has taken in everyone it can, but there's never enough, and some who came from the fallen places have turned to banditry, or to the Al'Aketh, just to eat." },
      },
      choices = {
        { text = "Can you blame them?", next = "bandits" },
        { text = "How can I help?", next = "help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bandits = {
      big = true,
      lines = {
        { id = "bd_default", text = "I try not to, but it's hard when they rob people who have just as little. The Peacekeepers caught one who'd killed one of their own for windstones, a man whose family escaped Shen'dramar on one of the last skycutters before it broke apart, and they mean to execute him." },
      },
      choices = {
        { text = "He lost everything. Show him mercy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He killed a Peacekeeper. The law must hold.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    help = {
      lines = {
        { id = "hp_default", text = "Bring what you can spare to the refugees outside the town, food and cloth especially. And if you're going out into the wilds anyway, keep an eye out for anything with Luminarian's markings; you'd be surprised what people left behind." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 1, standing = { zephras_isle = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zephras = {
      lines = {
        { id = "ze_default", text = "Safer than Ban'aethal, but not safe, and I don't think anyone who's honest would tell you otherwise. The pylons are failing, Zephras itself has begun to come apart at the edges, and we've nowhere further to run." },
        { id = "ze_after", when = { questDone = TODO_QUEST("What Comes Next") },
          text = "Safer than Ban'aethal, but not safe. The orders have gone down to the mainland to look for answers, and I pray they find some before the edges of Zephras come any closer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Ban'aethal, what's left of it, and old craftsmanship. Ask about those." } },
    advice = { { id = "tp_ad", text = "Hold on to the people you love, and if they go back for supplies, go with them." } },
    windstones = { { id = "tp_stones", text = "Men have killed for them since the islands began to fall. That tells you what they're worth now." } },
    _none = { { id = "tp_none", text = "I'm sorry; I've no answer for that. Most of what I knew fell with Ban'aethal." } },
  },
}

---------------------------------------------------------------------------
-- Sirocca "Swimmers" Starfeather: a grounded skycutter sailor, drunk at the
-- Calmbreeze Inn, swearing Shadowgale Forest is haunted.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_swimmers", id = TODO_NPC("Sirocca \"Swimmers\" Starfeather"), name = "Sirocca \"Swimmers\" Starfeather",
  bible = "bibles/zephras.md", role = "citizen", tier = "quest",
  communities = { "zephras_isle" }, temper = { "jovial", "anxious" }, values = { "honest" },
  notices = { "drink", "stranger", "class" },

  impression = {
    first = "Sirocca Starfeather, called Swimmers, sailed skycutters between the islands before the trouble grounded him, and now he drinks at the Calmbreeze Inn and shouts at the innkeeper. He swears Shadowgale Forest is haunted, and I'm not sure he's wrong.",
    third = "{name} met Swimmers Starfeather, a grounded skycutter sailor who drinks at the Calmbreeze Inn and tells ghost stories about Shadowgale Forest.",
  },

  greetings = {
    { id = "g_hic", text = "<He sways, peering at you.> Oh, hullo. Are you real? You look real." },
    { id = "g_again", when = { metBefore = true }, text = "You again! The only one in this inn who listens to me, aside from my mug." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "Ha! You've been at it too, I can tell. Sit down, sit down, now there's two of us and Donaal can't call it crazy talk when it's a majority." },
    { id = "n_stranger", cat = "stranger", when = { ["not"] = { race = "Skyborne" } },
      text = "You came up on one of their skycutters, didn't you? Didn't you! Their skycutters run and mine sits in the yard, and nobody will tell me why." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You're dressed all in dark colours, like the thing in the forest. You're not the thing in the forest, are you? Say you're not." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "<He leans heavily on the table.> I was a sailor, you know, before the trouble. The skycutters used to run between all the islands, and then one day it was too dangerous, or so they say, and I've been stuck on this rock ever since." },
        { id = "h_donaal", text = "<He turns and bellows across the room.> WHAT ARE THEY KEEPING FROM US, DONAAL? <He turns back to you, quite calm.> He knows something; innkeepers always know something." },
      },
      again = {
        { id = "h_again", text = "Where was I? Oh yes, being ignored. Go on, then." },
        { id = "h_again2", text = "<hic> Another question! You're better company than Donaal." },
      },
      choices = {
        { text = "You sailed between the islands?", next = "sailing" },
        { text = "What did you see in the forest?", next = "forest" },
        { text = "What do you think you're not being told?", next = "secret" },
        { text = "I came up on a skycutter from below.", next = "xcame", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Perhaps you've had enough, Swimmers.", next = "enough" },
        { text = "Good night, Swimmers.", next = "END" },
      },
    },
    sailing = {
      lines = {
        { id = "sa_default", text = "Ferries and skycutters both, along the skystreams, out to the other islands and back. There were towns out there, Shen'dramar and New Eldre'naar and more, and I knew the way to every one of them blindfolded." },
      },
      choices = {
        { text = "What happened to the skystreams?", next = "skystreams" },
        { text = "Why do they call you Swimmers?", next = "name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    skystreams = {
      lines = {
        { id = "ss_default", text = "Gone, or closed, or wrong, nobody'll say which. Nothing's sailed between the islands in years, so for all anyone knows, there's nobody left out there at all, and that thought makes me thirsty." },
      },
      choices = {
        { text = "Someone will find a way back.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "nm_default", text = "<He grins and taps his nose.> Ask me when I've had less to drink, and I'll tell you a better story than the true one." },
      },
      choices = {
        { text = "I'll hold you to that.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest = {
      lines = {
        { id = "fo_default", text = "Shadowgale Forest is haunted, as sure as the sky is blue! There are wraiths blown about on the wind, spirits that go for your ankles, and terror birds with talons as long as your arm." },
      },
      choices = {
        { text = "Wraiths? Tell me more.", next = "wraith" },
        { text = "You're drunk, Swimmers.", next = "forest_doubt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wraith = {
      lines = {
        { id = "wr_default", text = "There's one worse than all the rest, dressed all in black and wicked-looking, and I saw it with these two eyes. <He points at one of them, then corrects himself.> These two, I mean." },
      },
      choices = {
        { text = "Where exactly did you see it?", next = "wraith_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wraith_where = {
      big = true,
      lines = {
        { id = "ww_default", text = "Out past Ban'aethal, where the trees grow thick and the wind sounds like singing. Go and see for yourself, if you don't believe me, and then come back here and tell Donaal I was right." },
      },
      choices = {
        { text = "I believe you. I'll go and look.", next = "BACK", fx = { affinity = 2, align = { order = -1 }, trait = { brave = 1 } } },
        { text = "The Peacekeepers said keep away. I'll listen to them.", next = "BACK", fx = { affinity = -1, align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest_doubt = {
      lines = {
        { id = "fd_default", text = "<He belches magnificently.> I am drunk, yes, AND I saw what I saw; one doesn't cancel out the other. AND IT ISN'T NONSENSE, DONAAL, YOU HEAR ME?" },
      },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret = {
      big = true,
      lines = {
        { id = "se_default", text = "The High Order and the Windshapers have their skycutters running again, but I'm grounded, and the elders swear nothing's changed. Something has, and if they won't tell us plain folk what it is, then what are they saving us from, eh?" },
      },
      choices = {
        { text = "People deserve the truth, even frightening truth.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The elders know best. Panic helps nobody.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcame = {
      lines = {
        { id = "xc_default", text = "From BELOW? <He stares at you for a long moment.> So that's where they've been going, down off the edge of Skywall altogether. I knew it, I knew it, and nobody listened." },
        { id = "xc_horde", when = { faction = "Horde" },
          text = "From BELOW? From some place called Mulgore, is it? <He stares at you for a long moment.> So that's where the Windshapers' boat goes, right off the edge of Skywall. I knew it, and nobody listened." },
        { id = "xc_alliance", when = { faction = "Alliance" },
          text = "From BELOW? From that wizard city, Dalaran? <He stares at you for a long moment.> So that's where the High Order's boat goes, right off the edge of Skywall. I knew it, and nobody listened." },
      },
      choices = {
        { text = "What's it like, sailing the skystreams?", next = "sailing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enough = {
      lines = {
        { id = "en_default", text = "Enough? I've had too much, friend, which is a different thing entirely, and I'll have had enough when I'm sailing again. Until then, Donaal can keep pouring." },
      },
      choices = {
        { text = "I hope you sail again soon.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "<hic> I know the skystreams, the forest, and that Donaal waters the ale. Ask me!" } },
    advice = { { id = "tp_ad", text = "Stay out of Shadowgale Forest, unless you want your ankles gnawed." } },
    two_orders = { { id = "tp_orders", text = "They've got skycutters and secrets, and I've got neither. That's the orders for you." } },
    al_aketh = { { id = "tp_aketh", text = "Shaved heads! Why would anyone shave a perfectly good head? Madness, I tell you." } },
    _none = { { id = "tp_none", text = "<He squints.> Never heard of it, and I've heard of everything, twice." } },
  },
}

---------------------------------------------------------------------------
-- Donaal Downbreeze: innkeeper of the Calmbreeze Inn in Valanaar.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_donaal", id = TODO_NPC("Donaal Downbreeze"), name = "Donaal Downbreeze", title = "Innkeeper",
  bible = "bibles/zephras.md", role = "innkeeper", tier = "service",
  communities = { "zephras_isle" }, temper = { "dry", "warm" }, values = { "practical", "patient" },
  notices = { "guest", "drink" },

  impression = {
    first = "Donaal Downbreeze keeps the Calmbreeze Inn in Valanaar and spends half his day hushing Swimmers' ghost stories. Business is thin, and he worries about it more than he lets on.",
    third = "{name} met Donaal Downbreeze, the long-suffering innkeeper of the Calmbreeze Inn in Valanaar.",
  },

  greetings = {
    { id = "g_default", text = "Come in out of the wind, traveller; this is the Calmbreeze Inn. Will you have something to drink?" },
    { id = "g_home", when = { homeInn = true }, text = "Back home to the Calmbreeze. Your bed's made, more or less." },
  },

  notice = {
    { id = "n_guest", cat = "guest", when = { ["not"] = { race = "Skyborne" } },
      text = "A mainlander at my inn! Sit down, please, and ignore anything Swimmers tells you about ghosts." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "One Swimmers is plenty, friend. Sit down and have some water before you start seeing wraiths too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Donaal Downbreeze, and the Calmbreeze is mine. We've fewer customers than we used to, so I'll thank you for coming in, and I'll thank you double if you don't mind the noise from the corner." },
      },
      again = { { id = "h_again", text = "Anything else? I've glasses to wipe and a sailor to hush." } },
      choices = {
        { text = "What's the trouble with Swimmers?", next = "swimmers" },
        { text = "What's good to eat here?", next = "food" },
        { text = "Anything worth seeing in the inn?", next = "crystal" },
        { text = "I'd like a room, please.", next = "BUSINESS" },
        { text = "Just passing through.", next = "END" },
      },
    },
    swimmers = {
      lines = {
        { id = "sw_default", text = "He was a skycutter man, and a good one, and now he's grounded and drinks to forget it. Then he tells the room that Shadowgale Forest is haunted, which scares off the few customers I have left." },
      },
      choices = {
        { text = "Is the forest haunted?", next = "swimmers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swimmers2 = {
      lines = {
        { id = "s2_default", text = "<He lowers his voice.> The Peacekeepers keep folk away from it, and from Ban'aethal, so something's out there. I'd just rather he didn't describe it at supper." },
      },
      choices = {
        { text = "I'll go easy on him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    food = {
      lines = {
        { id = "fd_default", text = "Gustberry pie, if you've never had it, and a wedge of Pungent Skycheddar, which is better than it smells. The Red Delicious Stormapples come from the Windfield Orchard out in the lowlands, and they're the best thing on the island." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal = {
      lines = {
        { id = "cr_default", text = "There's a recall crystal upstairs that tells part of the story of the rebellion in Eldre'Thalas, when we rose against Prince Tortheldrin. Touch it and you'll hear it on the wind, and do mind the stairs, because they creak." },
      },
      choices = {
        { text = "I'll go and listen.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear everything said at the Calmbreeze, and believe about a third of it." } },
    _none = { { id = "tp_none", text = "Not that I've heard over the bar, and I hear a good deal over the bar." } },
  },
}

---------------------------------------------------------------------------
-- Nyalah Brightfire: Valanaar's cooking trainer. Old kaldorei recipes made
-- new; Crab Season; the islands where crab was a delicacy.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_nyalah", id = TODO_NPC("Nyalah Brightfire"), name = "Nyalah Brightfire", title = "Cook",
  bible = "bibles/zephras.md", role = "trainer", tier = "quest",
  communities = { "zephras_isle" }, temper = { "cheerful", "warm" }, values = { "generous", "craft" },
  notices = { "craft", "race", "kin" },

  impression = {
    first = "Nyalah Brightfire teaches cooking in Valanaar and treats every dish as a small act of defiance against hard times. She's turned her ancestors' kaldorei recipes into something the isle can still make.",
    third = "{name} met Nyalah Brightfire, Valanaar's cheerful cook, who keeps old kaldorei recipes alive with island ingredients.",
  },

  greetings = {
    { id = "g_default", text = "The winds have blown you my way! Are you hungry, or here to learn?" },
    { id = "g_cook", when = { profession = { "Cooking" } }, text = "A fellow cook! I can smell the smoke on you, and I mean that as praise." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = { "Cooking" } },
      text = "You cook! Then you'll understand that cooking on Zephras means making do, and making do is where all the best recipes come from." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei! Oh, I've so many questions; half my recipes are your people's, made with things I've only read about. Have you ever actually tasted a moonberry?" },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Oh my, you must eat a great deal. Please don't take that wrongly; I've been waiting my whole life to cook for someone with a proper appetite." },
    { id = "n_leaving", cat = "kin", when = { race = "Skyborne", minLevel = 10 },
      text = "You'll be leaving on the skycutters soon, I can see it on you. Take a recipe or two with you, so you'll have something that tastes like home." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Nyalah, and I teach cooking here in Valanaar. It may look hard to cook well on a dwindling island, and I suppose it is, but I enjoy every dish all the same, and I'll gladly teach you if you've the inclination." },
        { id = "h_crabs", tags = { "news" }, when = { questActive = TODO_QUEST("Crab Season") },
          text = "The crabs are thick on the shore this time of year, so bring me as many as you can manage. Everyone on Zephras eats crab, but you should have seen the faces on Anvilas when a crate of it arrived." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! I'm told your people take their ale and their roasts very seriously, and I'd love to hear how you keep a fire going in a mountain." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while the pot simmers." },
        { id = "h_again2", text = "Go on, I can stir and talk at once; it's most of the job." },
      },
      choices = {
        { text = "What kind of recipes do you teach?", next = "recipes" },
        { text = "Why is crab a delicacy elsewhere?", next = "crab" },
        { text = "What grows on Zephras?", next = "produce" },
        { text = "I could tell you about moonberries.", next = "xnelf", when = { race = "NightElf" } },
        { text = "I'll be leaving the isle soon.", next = "xleave", when = { race = "Skyborne" } },
        { text = "Winds be with you, Nyalah.", next = "END" },
      },
    },
    recipes = {
      lines = {
        { id = "re_default", text = "The recipes of our ancestors, mostly, from when we were kaldorei in Kalimdor. Many of the old ingredients don't exist up here, so I've had great fun inventing new versions with whatever the island gives us." },
      },
      choices = {
        { text = "What's missing from the old recipes?", next = "missing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    missing = {
      lines = {
        { id = "mi_default", text = "Oh, all sorts; herbs and fruits our grandparents' grandparents only described, and nobody living has tasted. I swap in gustberries and stormapples and island herbs, and I like to think the old cooks would forgive me." },
      },
      choices = {
        { text = "Do you think they'd taste the same?", next = "missing2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    missing2 = {
      big = true,
      lines = {
        { id = "m2_default", text = "No, and I've made my peace with it. A recipe that never changes is one nobody's cooking anymore, and I'd rather ours tasted of Zephras than of a place none of us remember." },
      },
      choices = {
        { text = "Exactly. Let the old ways grow into new ones.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The old recipes should be kept exactly as they were.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crab = {
      lines = {
        { id = "cr_default", text = "On Zephras crab is common fare, but on Anvilas and Siroccas it was a treat, and we used to send it out to them by the crate. There are towns out there, Shen'dramar and New Eldre'naar, that I haven't been able to reach in years." },
      },
      choices = {
        { text = "Why can't you reach them?", next = "crab_cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crab_cut = {
      lines = {
        { id = "cc_default", text = "The skystreams the boats used to follow became impassable, and nobody's sailed them since. I keep thinking of the cooks out there, wondering what they're making do with now." },
      },
      choices = {
        { text = "Do you think they're still out there?", next = "crab_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crab_hope = {
      big = true,
      lines = {
        { id = "ch_default", text = "I have to, or I'd stop sending recipes into the wind for them. Everyone says we're all that's left, and I say that's a very sad thing to believe on an empty stomach." },
      },
      choices = {
        { text = "Keep hoping. Someone will reach them one day.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It's kinder to accept they're gone.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    produce = {
      lines = {
        { id = "pr_default", text = "Stormapples from the Windfield Orchard in the lowlands, berries of all kinds, crab from the shore, and the ursera give us tallow for frying eggs, which you must try before you leave. We've less than we used to, but more than you'd think." },
      },
      choices = {
        { text = "Who keeps the orchard?", next = "orchard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orchard = {
      lines = {
        { id = "or_default", text = "Alvarion and Aamelia Windfield. Bandits have given them a dreadful time lately, I hear, and an old wind construct that's wandered their fields for decades stepped in to help, if you can believe it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "Would you? Please! I've had to guess at almost everything, and I'd love to know if I've guessed right. Is it sweet or sharp, and does it stain your fingers?" },
      },
      choices = {
        { text = "Sweet, with a little sharpness. It stains everything.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleave = {
      lines = {
        { id = "xl_default", text = "Then learn a few dishes before you go. Wherever the winds carry you, I hope these recipes bring you a taste of home, and if you find anything wonderful down there, bring me back a handful of it." },
      },
      choices = {
        { text = "I'll bring you something back.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Food, mostly, and who eats what, which tells you more about people than you'd think." } },
    advice = { { id = "tp_ad", text = "Eat something before you go out there. Nobody was ever brave on an empty stomach." } },
    windstones = { { id = "tp_stones", text = "They keep my stove hot when the wood runs short. I treat them like gold, because they nearly are." } },
    _none = { { id = "tp_none", text = "If it isn't food, I'm the wrong person to ask, but come back hungry." } },
  },
}
