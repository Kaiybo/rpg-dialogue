-- Revantusk Village (Horde, forest trolls of the Revantusk tribe). Voice: bibles/revantusk.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "torntusk", id = TODO_NPC("Primal Torntusk"), name = "Primal Torntusk",
  bible = "bibles/revantusk.md", role = "noble", tier = "major",
  communities = { "revantusk" }, temper = { "fierce" }, values = { "loyal", "protective", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Primal Torntusk leads the Revantusk while her mate sits in a Vilebranch cage at Jintha'Alor. She speaks of the Horde like a debt her tribe has paid twice over, and she isn't wrong.",
    third = "{name} met Primal Torntusk, who leads the Revantusk trolls of the Hinterlands coast and wants her mate back from the Vilebranch.",
  },

  greetings = {
    { id = "g_village", text = "You be standin' in Revantusk, stranger, the last forest trolls who still keep faith with the Horde. Speak plain, for I got little time for pretty words." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to the coast, good. Revantusk remembers who walks in and who walks out again." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, from Thrall's islands, and you got the look of a long voyage. Jungle or forest, a troll who keeps faith with the Horde be welcome in Revantusk." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, walkin' free in the Hinterlands. Last time I saw so many of you, the humans was puttin' you in cages, and none of us could stop them." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The spirits walk close behind you, shaman. They be welcome here, so long as they keep their eyes on Jintha'Alor." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Primal Torntusk, and I lead the Revantusk while my mate sits in a Vilebranch cage. They came at midnight, they took him up to Jintha'Alor, and every night since I been countin' how many of them owe me blood." },
        { id = "h_kidnap", tags = { "news" }, when = { questActive = TODO_QUEST("Kidnapped Elder Torntusk!") },
          text = "My spies say he still breathes, up on the top of Jintha'Alor, and the Vile Priestess Hexx be readyin' him for her altar. Go quick, before she finishes her preparations." },
        { id = "h_hexx", when = { questActive = TODO_QUEST("Wanted: Vile Priestess Hexx and Her Minions") },
          text = "You read the poster, then. Hexx and her Aman'zasi guards sit at the summit as if the hill belongs to them, so show them it don't." },
        { id = "h_job", when = { questActive = TODO_QUEST("Job Opening: Guard Captain of Revantusk Village") },
          text = "You want Malkhor's post? Then kill the Vilebranch that killed him, the berserkers and shadow hunters and blood drinkers and soul eaters, and come tell me how many." },
        { id = "h_home", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Return to Primal Torntusk"), days = 3 } },
          text = "He walked in last night, thin as a reed and sore in every joint, and the first thing he asked was who brought him home. I told him your name, and Revantusk will not forget it." },
        { id = "h_later", when = { questDone = TODO_QUEST("Return to Primal Torntusk") },
          text = "My mate sleeps in his own hut again, though he wakes at every drum, and I be Primal Torntusk still. The Vilebranch learned what Revantusk does when it be wronged." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Midnight again. That be the hour they came for him, so the watchers stand double on the walls now, and I stand with them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "There be a dark thing hangin' off your shoulder, {class}, and the Vilebranch got plenty of those already. What you call it, and what it eat?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "Fire and frost at your fingertips, {class}, I can smell it. The Amani learned to fear the arcane when the elves and the men of Arathor turned it on them, and some trolls never forgave it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You move like a Revantusk scout, {class}, low and quiet and lookin' at the exits. Good, because Jintha'Alor be full of eyes, and the Vilebranch never see the quiet ones comin'." },
      },
      again = {
        { id = "h_again", text = "What else do you need, then? Say it quick." },
        { id = "h_again2", text = "Go on. The tide be comin' in, but I can listen." },
        { id = "h_again3", when = { questDone = TODO_QUEST("Return to Primal Torntusk") }, text = "Ask what you want, friend of Revantusk." },
      },
      choices = {
        { text = "The Revantusk need more warriors, Primal. I can fight.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Tell me about the raid.", next = "raid" },
        { text = "Why do the other trolls hate you?", next = "tribes" },
        { text = "How did the Revantusk come to the Horde?", next = "horde" },
        { text = "What about the Wildhammer?", next = "wildhammer" },
        { text = "Who was Malkhor?", next = "malkhor" },
        { text = "Your mate is home. I saw to it.", next = "after", when = { questDone = TODO_QUEST("Return to Primal Torntusk") } },
        { text = "My people were in those camps too.", next = "orc", when = { race = "Orc" } },
        { text = "The Darkspear stand with you, Primal.", next = "troll", when = { race = "Troll" } },
        { text = "I serve the Dark Lady. What use am I here?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Do you fear a warlock's magic, Primal?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the Revantusk still hold that grudge against magic?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Could someone quiet slip into Jintha'Alor unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'll go up to Jintha'Alor.", next = "END", fx = { affinity = 2, standing = { revantusk = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Many tried, and the Vilebranch put their heads on poles along the stairs. But one who walk soft and don't stop to fight get further than any war party, and the Revantusk remember a name like that a long time." } },
      choices = {
        { text = "A quiet blade gets further than a war party.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face the Vilebranch head-on, Primal.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Primal.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some of the old ones do, and they spit when a mage walk by. But the Revantusk stand with the Horde now, and the Horde take whoever fight, so Torntusk say a fireball be a fireball, so long as it land on a Vilebranch." } },
      choices = {
        { text = "Old grudges should stay buried. The Vilebranch are the enemy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The old ones are right. Never forget a wound.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Torntusk fear nothin' but losin' her mate. The Vilebranch priests bargain with dark things on Jintha'Alor every night, so if you got your own dark thing that bite them back, maybe that be a fair trade." } },
      choices = {
        { text = "I use it carefully. Dark things want more than they give.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Darkness against darkness is the only way to win.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of other things.", next = "BACK" },
      },
    },
    raid = {
      big = true,
      lines = {
        { id = "ra_default", text = "They came up from the south in the dark, quiet as fog, and they knew where every hut stood. Malkhor met them at the gate with a spear, and they took him and my mate both up the hill." },
      },
      choices = {
        { text = "How did they know the village so well?", next = "raid_spies" },
        { text = "Then I'll bring him back, whatever it costs.", next = "raid_vow", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Pay the Vilebranch back first. Rescue can wait.", next = "raid_vow", fx = { align = { honor = -1 } } },
      },
    },
    raid_spies = {
      lines = { { id = "rs_default", text = "Because they watched us for many moons, the same way my spies be watchin' them now. Trolls been doin' this to each other since before your grandfather's grandfather was born." } },
      choices = {
        { text = "What do your spies say?", next = "raid_hexx" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid_vow = {
      lines = { { id = "rv_default", text = "Big words, and I heard many of them since the raid. Bring me back somethin' I can hold in my hands, and then we talk about what you be worth." } },
      choices = {
        { text = "Where is he held?", next = "raid_hexx" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid_hexx = {
      lines = {
        { id = "rh_default", text = "At the summit of Jintha'Alor, where the Vile Priestess Hexx keeps her altar and her Aman'zasi guard. She wants to spill him slow, so the gods can watch, and that slowness be the only gift she ever gave me." },
        { id = "rh_done", when = { questDone = TODO_QUEST("Wanted: Vile Priestess Hexx and Her Minions") },
          text = "Hexx be dead now, and her altar cold, but the Vilebranch still crawl over that hill like ants on a carcass. They will choose a new priestess soon enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Primal.", next = "END" },
      },
    },
    tribes = {
      big = true,
      lines = { { id = "tb_default", text = "Because we kept faith. When the old Horde broke, the Witherbark and Vilebranch ran home and spat on the orcs, but we could not forget who we fought beside. So now they call us weaklings, and we call them traitors, and only one of us be right." } },
      choices = {
        { text = "Couldn't you have freed the orcs?", next = "tribes_camps" },
        { text = "Loyalty is worth more than numbers.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Loyalty left you small and hunted. That's a poor bargain.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    tribes_camps = {
      lines = { { id = "tc_default", text = "We was too few, and the orcs in the camps was too tired to want freedom. I will not pretend that sits easy with me, so I don't ask anyone to pretend it for me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    horde = {
      lines = { { id = "hd_default", text = "We fled to this coast and hid, until word came that a young warchief named Thrall built a new Horde across the sea. I sent my fastest runners, and he took our hands in friendship and in help, and we been Horde ever since." } },
      choices = {
        { text = "Has the Horde kept its word?", next = "horde_word" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_word = {
      lines = { { id = "hw_default", text = "It sends us you, and the wind riders, and Gorkas, who fishes more than he flies. It be a small help for a small tribe, but it be more than the Witherbark ever gave anyone." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wildhammer = {
      big = true,
      lines = { { id = "wh_default", text = "The dwarves at Aerie Peak hate all trolls the same, Revantusk or Vilebranch, and their gryphons kill our hunters in the hills. Otho wants to send them messages in blood; Markhor wants their birds. I want my mate back first, and then we see." } },
      choices = {
        { text = "The Wildhammer fight the Vilebranch too. Use that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Enemies of the Horde are enemies. Strike them now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    malkhor = {
      lines = { { id = "mk_default", text = "My guard captain, and Markhor's twin. The Vilebranch did not want him for any altar, so they killed him where he stood and fed him to their beasts, and his post be empty now." } },
      choices = {
        { text = "Who will take his post?", next = "malkhor_job" },
        { text = "Something else.", next = "BACK" },
      },
    },
    malkhor_job = {
      lines = {
        { id = "mj_default", text = "Whoever proves it on the Vilebranch, troll or orc or anything else that bleeds for us. I posted the notice myself, and so far nobody brought me enough heads to be worth the title." },
        { id = "mj_done", when = { questDone = TODO_QUEST("Job Opening: Guard Captain of Revantusk Village") },
          text = "You brought me the heads, so the post be yours in my heart, even if you never stand at our gate. The watchers already call you captain when you not listenin'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      big = true,
      lines = { { id = "af_default", text = "You did, and I been tryin' to find the right way to repay it since. A tribe this small don't have much gold, so take this: anywhere you hear the name Revantusk, you be family." } },
      choices = {
        { text = "That's payment enough.", next = "BACK", fx = { affinity = 3, align = { honor = 1 }, standing = { revantusk = 2 } } },
        { text = "Family's fine, but gold spends better.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    orc = {
      lines = { { id = "oc_default", text = "Then you know the shame I carry, that we ran and left you behind the walls. Thrall forgave it when he made the pact; I hope you can forgive it too, in time." } },
      choices = {
        { text = "There's nothing to forgive.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Help me pay the humans back, and we're even.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "The Darkspear be few too, and hated by their cousins, so we understand each other. When you see Vol'jin, tell him the Revantusk still stand on the coast." } },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 2, standing = { revantusk = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "We need warriors who know who they fight for, mon. The Witherbark shame our people and the dwarves of Aerie Peak harry our shores, so a warrior standing with Revantusk must fight for the tribe." } },
      choices = {
        { text = "Then I'll fight for the Revantusk.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight for the Horde. The tribe's your business.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "Plenty of use. The Vilebranch fear the dead almost as much as they fear their own priests, and you don't need sleep to stand a watch at midnight." } },
      choices = {
        { text = "Then I'll stand your watch.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Hinterlands and every tribe in them. Ask, and I tell you what serves Revantusk." } },
    background = { { id = "tp_bg", text = "Revantusk born, Revantusk chief, and Horde since the runners came home with Thrall's word.", next = "horde" } },
    advice = { { id = "tp_ad", text = "Never sleep in the open near Jintha'Alor. The Vilebranch like their meat fresh." } },
    vilebranch = { { id = "tp_vile", text = "Cannibals and traitors who drink what they should bury. Ask Yayo'jin, if you want the long tellin'.", next = "tribes" } },
    _none = { { id = "tp_none", text = "That don't feed the village or free my mate. Ask me somethin' else." } },
  },
}

P:NPC {
  key = "markhor", id = TODO_NPC("Huntsman Markhor"), name = "Huntsman Markhor",
  bible = "bibles/revantusk.md", role = "stablemaster", tier = "quest",
  communities = { "revantusk" }, temper = { "grave" }, values = { "loyal", "devoted" },
  notices = { "class", "race" },

  impression = {
    first = "Huntsman Markhor keeps the stables at Revantusk and judges the wilds as harshly as any judge of men. His twin brother died in the Vilebranch raid, and grief has made him patient, not soft.",
    third = "{name} met Huntsman Markhor, the Revantusk stable master who mourns his twin brother Malkhor.",
  },

  greetings = {
    { id = "g_default", text = "Step easy near the stables, stranger. The beasts be skittish since the raid, and so be I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, for the wilds don't thin themselves." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your beast walks well beside you. You can stable it here while you go after the Silvermane, if you want." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You smell of the arcane, mon, like hot copper and spoiled milk. Keep it away from my stables; the beasts hate it nearly as much as I do." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_mage", when = { class = "MAGE" }, text = "You ask me that, smellin' the way you do? Your magic sours my beasts, mon, but even yours be cleaner than what the Vilebranch witch doctors work up at Jintha'Alor, and the wolves near there gone wild from it." },
        { id = "xhcast_default", text = "The Vilebranch witch doctors' magic, worst of all, because it smell of blood and old gods, and the wolves near Jintha'Alor gone wild from it. The arcane I hate for my own reasons, but that Vilebranch filth be worse, and I don't say that lightly." },
      },
      choices = {
        { text = "I'll ask the village elders before I strike at Jintha'Alor.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I need nobody's leave to kill Vilebranch.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The spirits favor whoever respect them, mon, and the Vilebranch don't respect nothin'. My brother used to say a thanks to the beast after every kill, and I think the wilds still remember him for it." } },
      choices = {
        { text = "I'll thank every beast I take, as your brother did.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. The spirits don't need my thanks.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman come to Revantusk. The Vilebranch witch doctors be twistin' the spirits up at Jintha'Alor, so a shaman with clean hands be welcome at my fire." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. If you serve the loa, mon, Yayo'jin will want a word with you, and if you serve somethin' else, keep it from frightenin' my beasts." },
        { id = "h_default", key = true,
          text = "Huntsman Markhor, master of the hunt for Revantusk. Many brave trolls been lost to these wilds, and I hunt what hunts us, so the rest of the village can sleep." },
        { id = "h_stalkers", when = { questActive = TODO_QUEST("Stalking the Stalkers") },
          text = "The Silvermane lie low in the brush and wait for a hunter to pass. Hunt them the way they hunt us, slow and quiet, and then all at once." },
        { id = "h_savages", when = { questActive = TODO_QUEST("Hunt the Savages") },
          text = "The savage owlbeasts took more of our warriors than the Wildhammer ever did. Kill them until you cannot stand the bloodshed, and then come back and we weigh what you done." },
        { id = "h_skylord", when = { questActive = TODO_QUEST("Avenging the Fallen") },
          text = "A Skylord be an old gryphon, the kind that breeds the young the dwarves ride against us. Bring me one plume, and I will count it as a hundred." },
        { id = "h_brother", tags = { "news" }, when = { questActive = TODO_QUEST("Separation Anxiety") },
          text = "My brother's bones be somewhere in that pit with the oozes, or in the wolf den near the top. I cannot save his life, but I can still save his spirit." },
        { id = "h_buried", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Separation Anxiety"), days = 3 } },
          text = "Yayo'jin prepared him last night, and we gave him to the earth the proper way. I slept for the first time since the raid, and I have you to thank for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "The beasts in the stables don't like you, {class}, and the beasts be never wrong about a thing. Keep your demon away from them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You walk downwind of me like you know what you doin', {class}. My brother walked like that too, before the Vilebranch caught him in the dark." },
      },
      again = {
        { id = "h_again", text = "What else you need, hunter?" },
        { id = "h_again2", text = "Speak. The beasts be quiet for now." },
      },
      choices = {
        { text = "Do the spirits of the wilds favor the hunter or the hunted?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does any magic in these hills trouble your beasts, huntsman?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What hunts in these hills?", next = "wilds" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Why hate the gryphons so?", next = "gryphons" },
        { text = "Why do you hate magic?", next = "arcane" },
        { text = "I'd like to stable my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "I learned the arcane, huntsman. It's served me well.", next = "mage", when = { class = "MAGE" } },
        { text = "The Earth Mother keeps the beasts in balance too.", next = "tauren", when = { race = "Tauren" } },
        { text = "Why do beasts fear what I carry?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you track the Vilebranch, or do they track you?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'll hunt for Revantusk.", next = "END", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Both, and whoever see the other first be the one who come home. The Vilebranch hunt at night with their faces painted dark, so you learn to listen for the bird that stop singin', and you never sleep in the same place twice." } },
      choices = {
        { text = "Even the hunt has rules. I keep them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hunt them as they hunt us, with no quarter.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk of other things, huntsman.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a beast know what belong in the wild and what don't, and your little demon don't belong anywhere in this world. I don't judge a weapon by how it smell, but I judge the hunter by how tight the hunter hold the leash." } },
      choices = {
        { text = "I hold the leash tight. It obeys me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leashes are for beasts. My demon and I understand each other.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    wilds = {
      lines = { { id = "w_default", text = "Silvermane wolves in the brush, savage owlbeasts in the forests, and gryphons overhead, which be the worst, because the dwarves teach them what a troll tastes like." } },
      choices = {
        { text = "How do you hunt the Silvermane?", next = "wilds_silvermane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds_silvermane = {
      lines = { { id = "ws_default", text = "You think like them. They wait downwind and they strike when you look away, so you never look away, and you strike first." } },
      choices = {
        { text = "And Zul'jin? The trolls say he'll return.", next = "wilds_zuljin" },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    wilds_zuljin = {
      lines = { { id = "wz_default", text = "He will, one day; I believe it the way I believe the tide. Until then, we hold our places and keep as many forest trolls alive as we can, and that be work enough for anyone." } },
      choices = {
        { text = "A wise way to wait.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      big = true,
      lines = { { id = "b_default", text = "Malkhor, my twin, our guard captain. The Vilebranch took him in the same raid as Torntusk's mate, and him they did not keep for any altar; they killed him quick and fed him to their oozes and their wolves." } },
      choices = {
        { text = "Then let me bring his remains home.", next = "brother_bones", fx = { trait = { kind = 1 } } },
        { text = "Do you want revenge?", next = "brother_revenge" },
      },
    },
    brother_bones = {
      lines = { { id = "bb_default", text = "The refuse pit near the top of Jintha'Alor, where the oozes live, and the wolf den beside it. Bring back what you find, and Yayo'jin will prepare him for a proper burial." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother_revenge = {
      lines = { { id = "br_default", text = "Revenge be for the Primal to decide, and she decides it every night. What I want be smaller: my brother in the ground where his spirit can rest." } },
      choices = {
        { text = "The dead deserve rest before revenge.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "His spirit will rest easier with Vilebranch blood spilled.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    gryphons = {
      big = true,
      lines = { { id = "gr_default", text = "The Wildhammer train them to kill trolls, and they do it well. The Skylords breed the young ones, so you kill a Skylord and you kill a hundred hunts before they ever happen." } },
      choices = {
        { text = "Then the Skylords die first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The beasts aren't to blame. Hunt the riders instead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arcane = {
      lines = { { id = "a_default", text = "It be the magic of the high elves, who burned our forests and broke the old empire. It sours the beasts and it sours the land, and I don't need a reason past that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "mg_default", text = "Served you, maybe. It never served a troll in this forest, not once. Keep it in your sleeve while you stand by my stables, and we be friends enough." } },
      choices = {
        { text = "Fair enough. I'll keep it sheathed.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "So I hear. Your Earth Mother and my loa might get along, since both of them like a hunter who takes only what the land can spare." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the beasts and the trails. Ask me those, and leave the talk of mojo to Yayo'jin." } },
    background = { { id = "tp_bg", text = "Master huntsman of Revantusk, and once a twin. Now only the first.", next = "brother" } },
    advice = { { id = "tp_ad", text = "Watch the brush, not the path. Nothing in the Hinterlands walks on the path." } },
    _none = { { id = "tp_none", text = "That be no beast I know. Ask somebody else." } },
  },
}

P:NPC {
  key = "yayojin", id = TODO_NPC("Mystic Yayo'jin"), name = "Mystic Yayo'jin",
  bible = "bibles/revantusk.md", role = "vendor", tier = "quest",
  communities = { "revantusk" }, temper = { "mysterious" }, values = { "devout", "proud" },
  notices = { "class", "race" },

  impression = {
    first = "Mystic Yayo'jin sells reagents from a platform at the north end of Revantusk and talks about Zul'jin as if he might walk up the stairs. She told me to mind her goods before she told me her name.",
    third = "{name} met Mystic Yayo'jin, who sells mystical goods at Revantusk Village and hates the cannibal Vilebranch.",
  },

  greetings = {
    { id = "g_default", text = "Mind your feet, mon. You be standin' next to my goods, and they cost more than your boots." },
    { id = "g_back", when = { metBefore = true }, text = "The spirits said you would come back, though they say that about everybody." },
  },

  notice = {
    { id = "n_caster", cat = "class", when = { class = { "PRIEST", "SHAMAN", "WARLOCK", "MAGE", "DRUID" } },
      text = "You use reagents, I can tell by the stains on your fingers. Come buy, then, because nobody up here sells better." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear with mojo in your walk. You know the old ways a little, so maybe you know the price of them too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mystic Yayo'jin, and mystical goods be my trade. Candles, powders, and the things that make a spell hold, all bought and sold by a troll who knows what each one be for." },
        { id = "h_cousins", when = { questActive = TODO_QUEST("Cannibalistic Cousins") },
          text = "The Vilebranch soothsayers and scalpers gather by the temples of Shaol'watha and Agol'watha, north and east of here. Thin them out, mon, and the hills breathe easier." },
        { id = "h_cousins_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cannibalistic Cousins"), days = 3 } },
          text = "The smoke over Agol'watha be thinner today, and I know whose work that be. Zul'jin himself would nod at you, and he don't nod for much." },
        { id = "h_malkhor", when = { questDone = TODO_QUEST("Separation Anxiety") },
          text = "I prepared Malkhor for the earth with my own hands. His brother wept the whole night, and that be how it should be." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Soul shards rattlin' in your bag, {class}? Yayo'jin hear them from here, and she don't ask whose they were." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage, and you need reagents, mon, because no portal ever open on wishes. Look before you touch, {class}, and Yayo'jin will tell you what each thing be for." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Hands where Yayo'jin can see them, {class}, because these candles be counted and the powders be weighed. You look like somebody who weigh things too." },
      },
      again = {
        { id = "h_again", text = "Somethin' more? The spirits be listenin'." },
        { id = "h_again2", text = "Ask, mon, and don't step on the candles." },
      },
      choices = {
        { text = "Who are the Vilebranch?", next = "vilebranch" },
        { text = "Tell me about Zul'jin.", next = "zuljin" },
        { text = "What do you sell?", next = "goods" },
        { text = "What do the spirits say lately?", next = "spirits", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "Our loa are the same, mystic.", next = "troll", when = { race = "Troll" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Does dark magic trouble the Revantusk, mystic?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do trolls practice the arcane, Yayo'jin?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you ever ask where your goods come from, mystic?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Yayo'jin don't ask where a thing slept last night, mon, so long as it don't come from Revantusk. A rogue who lift a fetish off a Vilebranch altar be doin' the whole village a favor, and the loa won't mind it neither." } },
      choices = {
        { text = "Stealing from enemies is fair play.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't steal, mystic, not even from the Vilebranch.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some do now, mon, more every year. But the old Amani priests called it elf-magic and spat on it, because elf-magic be what broke the Amani in the Troll Wars, and some grudges get handed down like a good knife." } },
      choices = {
        { text = "Magic belongs to whoever learns it, elf or troll.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some grudges deserve to be handed down.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll look at your wares later. Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It trouble them when it be Vilebranch magic, because that kind feed on our blood. Yours feed on somethin' else, and Yayo'jin don't need to know what, so long as you pay for the candles." } },
      choices = {
        { text = "It feeds only on enemies. I make sure of it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It feeds on whatever I give it. That's the price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll leave that there.", next = "BACK" },
      },
    },
    vilebranch = {
      big = true,
      lines = { { id = "v_default", text = "Three tribes live in the Hinterlands, and all we share be that we be trolls and we live here. The Vilebranch eat their own kind and anything else that walks, and they be proud of it." } },
      choices = {
        { text = "Why don't the other tribes stop them?", next = "vilebranch_tribes" },
        { text = "Cannibals have no place among trolls. They must end.", next = "vilebranch_end", fx = { align = { light = 1 } } },
        { text = "Their mojo is strong. I'd learn what they know first.", next = "vilebranch_end", fx = { align = { light = -1 } } },
      },
    },
    vilebranch_tribes = {
      lines = { { id = "vt_default", text = "The Witherbark be no better, and the Revantusk be too few. If Zul'jin were here, he would end the Vilebranch with one flick of his hand, but he be gone and we be left to our own devices." } },
      choices = {
        { text = "Then I'll be your device.", next = "vilebranch_end", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vilebranch_end = {
      lines = { { id = "ve_default", text = "Good. Go north to the temples and bring the fight to them; the soothsayers first, because they whisper the rest into madness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zuljin = {
      big = true,
      lines = { { id = "z_default", text = "The warlord of the Amani, who led the forest trolls with the old Horde against the elves. Nobody knows where he walks now, but I tell you, mon, when he comes back the whole forest will know it." } },
      choices = {
        { text = "Do you believe he'll come back?", next = "zuljin_back" },
        { text = "He fought for the old Horde. Thrall leads the new one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A warlord like that is what the trolls need.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    zuljin_back = {
      lines = { { id = "zb_default", text = "I believe it, and Markhor believes it, and half the village burns a candle for it. Believin' costs nothin', mon, and it keeps a small tribe standin' straight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goods = {
      lines = { { id = "go_default", text = "Powders for the priests and the shaman, candles for the ones who call on darker things, and herbs I won't name to a stranger. Everything you need, and a few things you shouldn't." } },
      choices = {
        { text = "Which ones shouldn't I need?", next = "goods_dark" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods_dark = {
      lines = { { id = "gd_default", text = "Ask me that again after you seen what the Vilebranch keep in their pots up at Jintha'Alor. Then maybe I sell you somethin' to forget it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    spirits = {
      lines = { { id = "sp_default", text = "They say the hill of Jintha'Alor be full of bad blood, and the ground under it be tired of drinkin' it. The rest they say only to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Same loa, different drums, mon. The Darkspear sing them faster on the islands, but they come when either of us calls." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the spirits, the tribes and the price of every powder on this coast. Ask, and I tell you one of the three." } },
    background = { { id = "tp_bg", text = "A mystic sells mystery, mon. You don't get mine for free." } },
    advice = { { id = "tp_ad", text = "Never buy a reagent from a Vilebranch. You never know what they mixed in." } },
    vilebranch = { { id = "tp_vile", text = "Cannibals, mon, and proud of it.", next = "vilebranch" } },
    _none = { { id = "tp_none", text = "The spirits don't say nothin' about that, and neither do I." } },
  },
}

P:NPC {
  key = "katoom", id = TODO_NPC("Katoom the Angler"), name = "Katoom the Angler",
  bible = "bibles/revantusk.md", role = "trainer", tier = "quest",
  communities = { "revantusk" }, temper = { "serene" }, values = { "patient", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Katoom the Angler would rather be fishing than doing anything else in the world, and says so with real peace. His only enemies are the turtles that steal his bait.",
    third = "{name} met Katoom the Angler, Revantusk's fishing trainer and an admirer of Nat Pagle.",
  },

  greetings = {
    { id = "g_default", text = "Ah, mon, sit a while. The water be calm, and the fish be thinkin' about bitin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the water, mon? Good. Everybody comes back to the water in the end." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You carry a pole, mon, and you hold it like you mean it. Sit down, we talk about bait." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Them snapjaws, mon, and sometimes Vilebranch scouts who come down to the shore to steal our nets. A troll with a little magic could keep them off the beach, and then everybody fish in peace, which be how it ought to be." } },
      choices = {
        { text = "I'll guard the beach. Everyone should fish in peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll guard my own line. The rest can look after theirs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every single fish, mon, I say a little word before I let it go or put it in the pot. The sea give and the sea take, and the only ones who never say thank you be them snapjaws, which is why the sea don't like them neither." } },
      choices = {
        { text = "I'll thank the water too, and only take what I need.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fish are fish. The sea won't miss what I take.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, mon! You go ask the water spirits to send the fish my way, and leave the snapjaws out of it, if you please." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, mon! You say a word to the loa for my line, eh? Not a big prayer, just enough to keep the snapjaws off." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock, mon? You keep that demon away from the water's edge, because the fish don't like the look of it, and neither do I." },
        { id = "h_default", key = true,
          text = "Katoom the Angler. I teach the fishin' and I sell the gear, but mostly I sit right here and fish, which be the most pleasant thing a troll can do." },
        { id = "h_snapjaws", when = { questActive = TODO_QUEST("Snapjaws, Mon!") },
          text = "Them snapjaws got big sweet eyes, mon, but don't trust them. They take my bait and break my line every five minutes, so thin them out for me." },
        { id = "h_gammerita", when = { questActive = TODO_QUEST("Gammerita, Mon!") },
          text = "Gammerita be the big one, the queen of the snapjaws, and she got my best lure in her belly. Get it back, mon, and the fish will love me again." },
        { id = "h_gammerita_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gammerita, Mon!"), days = 3 } },
          text = "My lure, mon! I been usin' it all mornin', and the fish be pilin' up like they missed it as much as I did." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night fishin' be the best fishin', mon. The water goes quiet and the big ones come up to look at the moon." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! You can make it rain fish, mon? No? Then you no more use to Katoom than anybody else, {class}, but sit down anyway." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Quiet feet, {class}, good, because loud feet scare the fish. Sit, sit, and don't steal my bait, because the turtles do that already." },
      },
      again = {
        { id = "h_again", text = "What else you need, mon? The fish be patient with us." },
        { id = "h_again2", text = "Go on, I be listenin' and fishin' both." },
      },
      choices = {
        { text = "Do you ever thank the water for what you catch, Katoom?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What troubles this stretch of coast, Katoom?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who taught you to fish?", next = "pagle" },
        { text = "What's wrong with the turtles?", next = "snapjaws" },
        { text = "Doesn't the war worry you?", next = "war" },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What's the best bait on this coast?", next = "bait", when = { profession = "Fishing" } },
        { text = "I could freeze the water and catch them that way.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Isn't sitting this still a lot like keeping watch?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Not now, Katoom.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Fishin' and watchin' be the same thing, mon, only fishin' feed you. I see every snapjaw on this coast and every stranger who come along the shore, and nobody ever think the old troll with the rod be lookin' at anything but the water." } },
      choices = {
        { text = "Hiding in plain sight is the smartest trick there is.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather watch openly and let them know it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll let you fish. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "And then what, you got a block of ice with a fish in it and no story to tell? The fish be half the joy, mon, and the waitin' be the other half, which be why Katoom never take a shortcut." } },
      choices = {
        { text = "Patience is its own reward. You're right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Results are what matter. The waiting is wasted time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fair enough. Let's talk of something else.", next = "BACK" },
      },
    },
    pagle = {
      big = true,
      lines = { { id = "p_default", text = "Nat Pagle, mon, and there be no better hand with a rod on any shore. Everything calm in me, I learned sittin' beside him. You know the name?" } },
      choices = {
        { text = "Where is he?", next = "pagle_where" },
        { text = "Fishing is a waste of a good warrior.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "A peaceful man is rare. Good for you.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    pagle_where = {
      lines = { { id = "pw_default", text = "Somewhere down by Theramore, on an island in the marsh, I hear, fishin' all day and talkin' to nobody. If you want to learn the way, mon, he be the one to show you." } },
      choices = {
        { text = "An island full of Alliance?", next = "pagle_alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pagle_alliance = {
      lines = { { id = "pa_default", text = "A fisherman got no alliance, mon, only a pole. Nat don't care who you march with, so long as you keep your voice down by the water." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    snapjaws = {
      lines = { { id = "s_default", text = "The saltwater snapjaws, mon, big hungry fish vacuums with shells on. And their queen, Gammerita, be the worst thief on the whole coast." } },
      choices = {
        { text = "I'll deal with them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "It worries me, mon, every day. But the Primal fights, and Markhor hunts, and somebody got to catch the fish they eat when they come home." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    bait = {
      lines = { { id = "b_default", text = "Bright lure in the morning, slow bait at night, and never the same spot twice when the snapjaws watchin'. Don't tell Gorkas, mon; he be fishin' for that big grouper with all the wrong things." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know fish, mon, so you ask me about fish." } },
    background = { { id = "tp_bg", text = "I fish. Before that, I wanted to fish. That be my whole story, mon.", next = "pagle" } },
    advice = { { id = "tp_ad", text = "Be patient, mon. The fish know when you be in a hurry." } },
    _none = { { id = "tp_none", text = "No idea, mon. Ask me about fish instead." } },
  },
}

P:NPC {
  key = "lard", id = TODO_NPC("Lard"), name = "Lard",
  bible = "bibles/revantusk.md", role = "innkeeper", tier = "quest",
  communities = { "revantusk" }, temper = { "simple" }, values = { "friendly", "generous" },
  notices = { "weary", "pet" },

  impression = {
    first = "Lard is an ogre who keeps the inn at Revantusk, keeps the peace, and sells fish. He is enormous and gentle, and mostly worried about his lunch.",
    third = "{name} met Lard, the ogre innkeeper of Revantusk Village.",
  },

  greetings = {
    { id = "g_default", text = "Hello, little one! Lard has beds, and Lard has fish, and nobody makes trouble while Lard is watchin'." },
    { id = "g_home", when = { homeInn = { "Revantusk Village" } }, text = "Little one come home! Lard keep bed warm for you, and nobody sit on it, because Lard tell them no." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Somebody hit you with big stick, like they hit Lard. You sit down and eat, and then you feel better." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} keeps sniffin' at Lard's fish barrel, and Lard does not blame it, because Lard does the same thing." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "One time a Vilebranch witch doctor make Lard's stew bubble green from far away, and nobody would eat it, not even Lard. You stand by the hearth with your magic, and Lard will feel very safe, and the stew will stay brown like stew should." } },
      choices = {
        { text = "I'll guard the inn, and the stew, for you, Lard.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Next time, sell the green stew to the Wildhammer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Lard would like that very much, because the hearth gets sad when it rains and the trolls complain about the smoke. You make it happy, and Lard will cook you a fish, and maybe not burn it this time." } },
      choices = {
        { text = "I'll bless it properly, the way the spirits ask.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll do it quickly. The spirits won't care how it's done.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "Lard see you are shaman. Lard like shaman, because one time a shaman make the rain stop on Lard's picnic, and Lard never forget it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "Lard see you are priest. You make Lard better when Lard eat too much? Lard ask for a friend, and the friend is Lard." },
        { id = "h_default", key = true,
          text = "Lard keep the inn for the trolls, and Lard keep the peace, because nobody want to fight when Lard is standin' there. Lard is very big, so it work good." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("Lard Lost His Lunch") },
          text = "Lard's picnic got ruined by Vilebranch with big sticks, and Lard ran so fast he left the whole basket behind. Now Lard's belly is makin' noises like a storm." },
        { id = "h_lunch_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Lard Lost His Lunch"), days = 3 } },
          text = "Lard still thinkin' about that lunch you bring back! It was the best haunch Lard ever ate, and Lard eat many haunches." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Lard don't like your little friend, the one with the horns. It look at Lard's fish like it want to eat them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "Lard like mages, because one time a mage make Lard bread out of nothing. You can do that, {class}? Lard is very hungry." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Lard see you sneakin', little one, because Lard is tall and see over everything. No stealin' from the inn, or Lard sit on you." },
      },
      again = {
        { id = "h_again", text = "What else little one want? Lard listenin'." },
        { id = "h_again2", text = "You still here, and that good, because Lard like company." },
      },
      choices = {
        { text = "Got anything I can feed my companion, Lard?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Can I bless the inn's hearth for you, Lard?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is the inn ever troubled by magic, Lard?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Make this inn my home.", next = "BUSINESS" },
        { text = "An ogre among trolls?", next = "ogre" },
        { text = "Where's your secret spot?", next = "spot" },
        { text = "How do you keep the peace?", next = "peace" },
        { text = "Ogres are enemies of the Horde.", next = "orc", when = { race = "Orc" } },
        { text = "My imp won't touch your fish, Lard.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Conjured bread fills you, but it doesn't taste of much.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you ever catch thieves in the inn, Lard?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Goodbye, Lard.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "One time a Vilebranch come in the window to steal fish, and Lard sit on him, and then he was very sorry. Lard don't like fightin', so it is better if sneaky people just pay, and then everybody is happy and nobody get sat on." } },
      choices = {
        { text = "Paying is better. I'm no thief, Lard.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sneaky people don't get caught, Lard. Only clumsy ones.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Lard, tell me about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Lard don't care how it taste, Lard care how much. But fish taste better, and Lard cook fish, so maybe one day you bring magic bread and Lard bring fish, and then we both eat good." } },
      choices = {
        { text = "Sharing food is the best magic there is.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My bread's for me, Lard. Catch your own fish.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else, Lard.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Imp say that, and then the fish is gone. Lard is gentle, but Lard is big, and if the little horn-man touch the fish, Lard will throw him in the sea, and you can go get him." } },
      choices = {
        { text = "Fair. I'll keep it on a short leash.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It does as it likes. I can't watch it every moment.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fine, Lard. Something else.", next = "BACK" },
      },
    },
    ogre = {
      lines = { { id = "o_default", text = "Trolls is nice to Lard. They give Lard roof and fish and don't make Lard fight for chief, so Lard stay. Other ogres not nice like trolls." } },
      choices = {
        { text = "Do you miss them?", next = "ogre_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogre_miss = {
      lines = { { id = "om_default", text = "Lard not miss gettin' hit on the head every mornin'. Lard miss the singin' a little, but trolls sing too, and they sing better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    spot = {
      lines = { { id = "s_default", text = "Is secret, little one! But Lard tell you, because you is nice. It is island to the north, past the beach, and nobody go there except Lard and now the mean Vilebranch." } },
      choices = {
        { text = "I'll get your lunch back.", next = "spot_promise", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spot_promise = {
      lines = { { id = "sp_default", text = "You do that for Lard? Then Lard make you a picnic basket of your own, a little one, for a little one. Watch out for the Vilebranch, because they hit hard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Lard has fish, lots of fish, and even more fish if you wait till Katoom comes back. Your beast can have the heads, which are the best part, though people never believe Lard about that." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Lard has fish, and {pet} looks hungry, so your friend can have the heads. Heads are the best part, but nobody ever believes Lard about that, so maybe your beast will tell them." },
      },
      choices = {
        { text = "I'll take the fish heads, with thanks.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find my own scraps, thank you.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    peace = {
      big = true,
      lines = { { id = "p_default", text = "When two trolls get angry in Lard inn, Lard stand between them and look down. Mostly they stop, and if they don't stop, Lard pick them up and put them outside." } },
      choices = {
        { text = "That's a fine way to keep order.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Let them fight. It settles things faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "oc_default", text = "Some ogres, yes, the ones at Hammerfall and in the mountains. Lard is not those ogres; Lard only want fish, and a nap, and no fightin'." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Lard know fish, and beds, and who is fightin'. Ask Lard." } },
    background = { { id = "tp_bg", text = "Lard was ogre in the mountains. Now Lard is ogre by the sea, which is better.", next = "ogre" } },
    advice = { { id = "tp_ad", text = "Always eat lunch before Vilebranch find you. Lard learn that the hard way." } },
    _none = { { id = "tp_none", text = "Lard not know that, but Lard know fish!" } },
  },
}

P:NPC {
  key = "slagtree", id = TODO_NPC("Smith Slagtree"), name = "Smith Slagtree",
  bible = "bibles/revantusk.md", role = "blacksmith", tier = "quest",
  communities = { "revantusk" }, temper = { "cheerful" }, values = { "practical", "grateful" },
  notices = { "kit", "race" },

  impression = {
    first = "Smith Slagtree is an orc who mends anything broken at Revantusk's forge, while you wait. His best tools were a gift from a gnome who once saved his life, and the Vilebranch stole them.",
    third = "{name} met Smith Slagtree, the orc smith of Revantusk Village, who lost a treasured set of tools to the Vilebranch.",
  },

  greetings = {
    { id = "g_default", text = "Broken blade? Cracked shield? Bring it to the anvil, friend, and pull up a stump while I work." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the anvil! Let's see what the Hinterlands did to your gear this time." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that armor! You can't fight in that, friend, so hand it over before something kills you." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! You've got nothing to fear from me, little one, because one of your kind saved my life." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Not at the anvil, because I'm old-fashioned about steel and like to earn it with my own arms. What I need is someone to stop the Vilebranch raiding the ore the trolls bring down from the hills, and a few spells would do that faster than I can swing a hammer." } },
      choices = {
        { text = "I'll escort the ore and fight any raider openly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll ambush the raiders before they reach the road.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask away, but tell it I'm grateful already, because it never let me down, even when the Vilebranch took my tools. The trolls here leave little offerings by the coals, and I've stopped sweeping them up, since the steel's come out cleaner ever since." } },
      choices = {
        { text = "I'll bless it for the whole village. Revantusk's forge serves everyone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The fire answers whoever feeds it. You need no village's blessing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman at my forge. Fire's the first spirit any smith learns to respect, and I've been talking to mine for twenty years, though it's never once answered me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. If you can mend a body the way I mend a shield, you'll never want for work in Revantusk, because the Vilebranch keep us both busy." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. Don't touch the forge, please, because the last spellcaster who tried to heat my coals faster melted half a good blade." },
        { id = "h_default", key = true,
          text = "Smith Slagtree, and I keep the forge for Revantusk. Nobody leaves this village with a split shield while I've got coals in the forge." },
        { id = "h_tools", tags = { "news" }, when = { questActive = TODO_QUEST("Vilebranch Hooligans") },
          text = "Those Vilebranch thieves took my tools in the raid, the good set. Try the temples up in the northeast, or Skulk Rock, and bring them back, because they mean the world to me." },
        { id = "h_tools_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Vilebranch Hooligans"), days = 3 } },
          text = "My tools! I still can't believe you found them. I've been using them all day just to feel the weight of them in my hands again." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "The old Horde had warlocks, {class}, and every orc my age remembers what their fire cost us. Stand on the far side of the anvil and we'll get along fine." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Light fingers, {class}? The Vilebranch took my best tools up to Jintha'Alor, and nothing would please me more than a quiet pair of hands bringing them home." },
      },
      again = {
        { id = "h_again", text = "Speak, then, but these borrowed tools make me short of temper, so keep it plain." },
        { id = "h_again2", text = "Ask away; I can talk and hammer at once." },
      },
      choices = {
        { text = "Can you mend a warrior's armor, Slagtree?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Shall I ask the fire spirit to bless your forge, Slagtree?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a spellcaster be of use to your forge, smith?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Mend my gear.", next = "BUSINESS" },
        { text = "A gnome gave you tools?", next = "gnome" },
        { text = "What's an orc doing with trolls?", next = "village" },
        { text = "What do the Vilebranch want with tools?", next = "thieves" },
        { text = "My people have no love for gnomes.", next = "orc_gnome", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "The Warchief tolerates warlocks now. Why don't you?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What makes those tools worth the climb to Jintha'Alor?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Later, smith.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A gnome gave them to me years back, after he saved my life, and a Horde smith owing his life to a gnome is a strange debt to carry. I carried it all the same, and the Vilebranch have no right to it." } },
      choices = {
        { text = "A debt is a debt, whoever you owe it to.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Debts to the Alliance don't count for much.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, smith.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Tolerating isn't trusting. The Warchief lets your kind study because he'd rather watch you than chase you, and I mend your armor because a split breastplate kills a warlock as dead as any grunt." } },
      choices = {
        { text = "You're right to be wary. I'm wary of it myself.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel is a tool. Orcs fear it more than they should.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's leave it at that.", next = "BACK" },
      },
    },
    gnome = {
      big = true,
      lines = { { id = "gn_default", text = "When I was young and stupid, a gnome pulled me out of trouble that should have killed me, and then he gave me his own tools. I never knew his name, and I've used his hammer every day since." } },
      choices = {
        { text = "What happened?", next = "gnome_story" },
        { text = "A debt to an enemy is still a debt.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "He was Alliance. Don't get sentimental.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    gnome_story = {
      lines = { { id = "gs_default", text = "That's mine to keep, friend. I'll just say I was bleeding, and he was small, and he didn't have to stop. Most folk wouldn't have, on either side." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    village = {
      lines = { { id = "v_default", text = "Every village needs a smith, and the Revantusk kept faith with the Horde when nobody else did. Seemed right that an orc kept faith with them back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thieves = {
      lines = { { id = "th_default", text = "Nothing; they don't know iron from bone. They took them because they were shiny and they were mine, which is the Vilebranch all over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "I can mend near anything, mon, if you don't mind the smell of the forge on it after. Revantusk warriors trust my work, and I think you'll be the next one." } },
      choices = {
        { text = "I'll trust your work, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep my own kit. I trust no smith.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    orc_gnome = {
      lines = { { id = "og_default", text = "Neither did I, till one of them saved my hide. I'm not asking you to like them, friend; I'm asking you to bring my tools back." } },
      choices = {
        { text = "Fair enough. I'll find them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Iron, steel, and what the Vilebranch broke this week. Ask." } },
    background = { { id = "tp_bg", text = "A smith since I was young enough to burn myself every day. A gnome's hammer taught me most of it.", next = "gnome" } },
    advice = { { id = "tp_ad", text = "Mend before you need to, not after. Broken armor never warns you." } },
    _none = { { id = "tp_none", text = "Can't hammer that into shape for you, friend. Ask somebody else." } },
  },
}

P:NPC {
  key = "otho", id = TODO_NPC("Otho Moji'ko"), name = "Otho Moji'ko",
  bible = "bibles/revantusk.md", role = "vendor", tier = "quest",
  communities = { "revantusk" }, temper = { "spiteful" }, values = { "proud", "loyal" },
  notices = { "race" },

  impression = {
    first = "Otho Moji'ko sells cooking supplies and dreams of terrifying Aerie Peak. He spits when he says the word Wildhammer, and he says it often.",
    third = "{name} met Otho Moji'ko, the Revantusk cook's supplier who wants to send the Wildhammer a message.",
  },

  greetings = {
    { id = "g_default", text = "You hungry, mon, or you lookin' for trouble? I sell for the first and I got plans for the second." },
    { id = "g_back", when = { metBefore = true }, text = "There you be, mon. You ready to make some dwarves very unhappy?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Good, a strong one. The dwarves at Aerie Peak gonna remember your face, mon, if you do what I ask." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They got the high elves of Quel'Danil now, mon, and elves always got magic up their sleeves. That be why Otho want the elves gone first, because a dwarf alone be just a dwarf, but a dwarf with an elf friend be trouble." } },
      choices = {
        { text = "I'll fight the elves fairly, not leave bodies as messages.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll leave the elves where the dwarves will find them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I set anything I can against the Wildhammer, mon, and the spirits would be the best weapon of all. Them dwarves claim the storms favor them and their birds, and it would please me very much to see the storms pick a side." } },
      choices = {
        { text = "The spirits won't serve a grudge, Otho. They answer to balance.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll call the storm on them, and gladly.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, mon! Someday you call the storm down on Aerie Peak, and we see how them dwarves like the lightning on their gryphons." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, mon! You pray to the loa for me, eh, and ask them to send the Wildhammer a bad dream every night this week." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage, mon! I seen what fire do to feathers, and I think them gryphons at Aerie Peak would make a very fine bonfire." },
        { id = "h_default", key = true,
          text = "Otho Moji'ko. I sell the spices and the salt and the things a cook can't do without, but what I really want be sendin' the Wildhammer a message they never forget." },
        { id = "h_elves", when = { questActive = TODO_QUEST("Message to the Wildhammer") },
          text = "The Wildhammer be makin' friends with the high elves at Quel'Danil Lodge. You go up there and leave the elves where the dwarves will find them, mon." },
        { id = "h_feathers", when = { questActive = TODO_QUEST("Another Message to the Wildhammer") },
          text = "Gryphon feathers, mon, as many as you can pull. The dwarves love their birds like a troll loves his mate, and that be exactly why we use them." },
        { id = "h_spear", tags = { "news" }, when = { questActive = TODO_QUEST("The Final Message to the Wildhammer") },
          text = "You got the spear, mon. Plant it by the well in the middle of Aerie Peak, drive it deep, and then run, because they gonna be very, very angry." },
        { id = "h_spear_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Final Message to the Wildhammer"), days = 3 } },
          text = "I wish I coulda seen their faces, mon! Tell me again how loud the Thane yelled, and don't leave nothin' out." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock! You could curse the Wildhammer's ale so it taste of ash for a month, {class}, and Otho would laugh about it until the day he die." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You got the look of somebody who could walk into Aerie Peak and out again with no dwarf ever the wiser, mon, and Otho like that look very much." },
      },
      again = {
        { id = "h_again", text = "What else you need, mon? Talk fast now." },
        { id = "h_again2", text = "Go on. I be thinkin' up the next message anyway." },
      },
      choices = {
        { text = "Would you set the spirits against the Wildhammer, Otho?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Wildhammer have magic on their side, Otho?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why hate the Wildhammer so much?", next = "dwarves" },
        { text = "What kind of message?", next = "message" },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "I've been to Aerie Peak. They're tough.", next = "peak", when = { questDone = TODO_QUEST("The Final Message to the Wildhammer") } },
        { text = "The Darkspear have their own grudges, Otho.", next = "troll", when = { race = "Troll" } },
        { text = "Is your hatred of the Wildhammer worth a curse, Otho?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What would you want done at Aerie Peak, Otho?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Not today, Otho.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nothin' that bleed, not yet, just somethin' they wake up to find. A Revantusk mark painted on the thane's own door, maybe, so every Wildhammer know a troll been inside and they never even smell him." } },
      choices = {
        { text = "Fear without blood is a clever message. I like it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If I go that far, I won't leave only paint.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Maybe later. Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Their riders hunt trolls from the sky like we be rabbits, mon, and they never ask which tribe they shootin' at. So yes, a little curse, a little fear, and maybe they think twice before the next one fly over this coast." } },
      choices = {
        { text = "Curses breed curses. I won't start a feud.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They earned it. I'll curse whoever sneers at the Horde.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's speak of spices instead.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They hunt us from the sky, mon, on beasts they teach to kill trolls. They don't care if we be Revantusk or Vilebranch; to them a troll be a troll, and that be all the reason I need." } },
      choices = {
        { text = "And the high elves?", next = "dwarves_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves_elves = {
      lines = { { id = "de_default", text = "The Highvale elves at Quel'Danil, old friends of the dwarves. Elves and trolls been killin' each other since before the dwarves crawled out of their mountains, so it be no surprise to me who they side with." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    message = {
      big = true,
      lines = { { id = "m_default", text = "First the elves, so they know their friends can't protect them. Then the gryphons, so they know their birds can't protect themselves. Then a spear in the middle of their town, so they know nothin' can." } },
      choices = {
        { text = "Fear is a weapon. I'll carry it.", next = "message_go", fx = { align = { honor = -1 } } },
        { text = "I'd rather fight their warriors face to face.", next = "message_go", fx = { align = { honor = 1 } } },
        { text = "Does the Primal approve?", next = "message_primal" },
      },
    },
    message_go = {
      lines = { { id = "mg_default", text = "Either way they bleed, mon, and either way they remember. Come back when you ready to start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    message_primal = {
      lines = { { id = "mp_default", text = "The Primal got her mind on her mate, and she don't stop me. That be as good as yes in Revantusk, mon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    peak = {
      lines = { { id = "pk_default", text = "Tough, sure, but they ain't stupid, mon. Now they know a troll can walk right into the middle of their town, and they gonna sleep a little worse every night." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { revantusk = 1 } } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Everybody got grudges, mon, but the Darkspear keep theirs on the islands. Mine be right up the hill, with gryphons on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know cookin' and I know grudges, mon. Ask about either." } },
    background = { { id = "tp_bg", text = "Revantusk all my life, mon, and angry at the dwarves for most of it.", next = "dwarves" } },
    advice = { { id = "tp_ad", text = "Salt your meat and watch the sky. The gryphons like a troll that don't look up." } },
    _none = { { id = "tp_none", text = "That don't cook and it don't scare dwarves, so I don't care, mon." } },
  },
}

P:NPC {
  key = "gorkas", id = TODO_NPC("Gorkas"), name = "Gorkas",
  bible = "bibles/revantusk.md", role = "flightmaster", tier = "service",
  communities = { "revantusk" }, temper = { "grumpy" }, values = { "patient" },
  notices = { "race" },

  impression = {
    first = "Gorkas is the wind rider master at Revantusk, and he spends more time fishing off the pier than tending his beasts. He's waiting for one particular grouper and doesn't care who knows it.",
    third = "{name} met Gorkas, the orc wind rider master at Revantusk, who fishes off the pier between flights.",
  },

  greetings = {
    { id = "g_default", text = "Quiet! You'll scare the fish. Fine, what do you want, a wind rider?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still no grouper. Where are you flying today?" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Tread soft on the pier, tauren. The boards are older than I am, and the fish feel every step." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every time we fly west past Aerie Peak, though the riders keep high and the gryphons don't like the cold up there. A spellcaster riding with us makes the dwarves think twice, because they're happy to shoot at a wind rider but they don't like being shot back at." } },
      choices = {
        { text = "I'll fly escort, and fight only if they strike first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll knock a few gryphons down before they get the chance.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they mind, they've a funny way of showing it, because they keep the waves calm off this pier and send me nothing but small fry. I think that grouper has a spirit of its own, and it's the stubbornest one on the coast." } },
      choices = {
        { text = "Be patient and respectful, and the sea will reward you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Forget patience. Net the whole cove and be done with it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. Don't suppose you could ask the sea to send that grouper my way? I've tried asking nicely and it hasn't worked." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Say a prayer for my line while you're here, would you? It doesn't matter to whom, so long as the grouper hears it." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Keep the demon off the pier, please, because the wind riders can smell it, and so can the fish, I'll swear." },
        { id = "h_default", key = true,
          text = "Gorkas, wind rider master. The beasts fly to Tarren Mill, Hammerfall and the Undercity, and in between flights I fish off this pier until I catch the biggest grouper on the coast." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Wind riders sleep, the trolls sleep, and the grouper is somewhere out there laughing at me. Where do you need to go?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage, eh? Don't you dare freeze my pier, {class}, because that grouper be down there somewhere and I want him fair and square." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You sneak up on a troll fishin', you get a hook in the ear, {class}. Sit down, and keep your shadow off the water." },
      },
      again = {
        { id = "h_again", text = "Anything else? The line's twitching." },
        { id = "h_again2", text = "Speak up, but quietly." },
      },
      choices = {
        { text = "Do the sea spirits mind you fishing between flights, Gorkas?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Wildhammer gryphons trouble your wind riders, Gorkas?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What grouper?", next = "grouper" },
        { text = "How do the wind riders like the coast?", next = "riders" },
        { text = "I could just teleport home and skip your wind riders.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the wind riders bring you any interesting news?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Goodbye, Gorkas.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every rider bring a bag and a mouth, and the mouth be worth more. I hear what Hammerfall worry about before Drum Fel do, and what the Undercity whisper before the Dark Lady hear it, and I keep it all behind my teeth, mostly." } },
      choices = {
        { text = "Keep it behind your teeth. Loose talk gets riders killed.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "News like that should be sold, Gorkas.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Fine. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "And you'd miss the coast, the Highlands and the Undercity's towers from above, all for the sake of an hour. Teleport if you like, but you'll never know what the world look like, and you'll never see my grouper." } },
      choices = {
        { text = "You're right. Some roads should be taken slowly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "There's no shame in the quick way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Good luck with the grouper. Something else.", next = "BACK" },
      },
    },
    grouper = {
      lines = { { id = "gp_default", text = "A monster of a fish that's broken every line I own. Katoom says I use the wrong bait, but Katoom says that about everyone, so I stopped listening." } },
      choices = {
        { text = "Maybe Katoom is right.", next = "grouper_katoom", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grouper_katoom = {
      lines = { { id = "gk_default", text = "Maybe he is, but I'll catch it my way or not at all. An orc has to have something he's stubborn about, and mine is a fish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    riders = {
      lines = { { id = "r_default", text = "They hate the gryphons, and the gryphons hate them, so I keep them low along the coast till they're well past Aerie Peak. The salt doesn't bother them, but the dwarves do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Routes, winds and fish. Ask about one of those." } },
    background = { { id = "tp_bg", text = "Orgrimmar sent me to keep the wind riders. Nobody said I couldn't fish." } },
    advice = { { id = "tp_ad", text = "Don't fly over Aerie Peak. The dwarves shoot first and ask about your business never." } },
    _none = { { id = "tp_none", text = "No idea. Let me fish." } },
  },
}
