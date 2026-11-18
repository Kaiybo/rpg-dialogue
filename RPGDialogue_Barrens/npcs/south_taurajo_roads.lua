-- The roads around Camp Taurajo: Grunt Logmar, who lost a grunt to the quilboar; Grunt Dogran,
-- that grunt, broken in a Bristleback camp; and Gann Stonespire, wandering the road to Bael Modan.
-- Voices: bibles/south_taurajo_roads.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Grunt Logmar: Camp Taurajo, and the guilt of the one who made it back.
---------------------------------------------------------------------------
P:NPC {
  key = "logmar", id = TODO_NPC("Grunt Logmar"), name = "Grunt Logmar",
  bible = "bibles/south_taurajo_roads.md", role = "soldier", tier = "quest",
  communities = { "taurajo" }, temper = { "grim", "anxious" }, values = { "loyal", "honest" },
  notices = { "class", "soldier" },
  impression = {
    first = "Grunt Logmar stands watch at Camp Taurajo with the look of someone who hasn't slept properly in weeks. He was with Grunt Dogran when the quilboar took him, and he made it back, and he hasn't forgiven himself for either.",
    third = "{name} met Grunt Logmar at Camp Taurajo, the grunt who came back from the raid where Dogran was captured.",
  },

  greetings = {
    { id = "g_hi", text = "Keep your eyes on the treeline if you're standing here, the Bristleback like to try their luck at dusk." },
    { id = "g_draught", when = { questActive = TODO_QUEST("Dogran's Captivity") }, text = "You've got the draught? Then go, and quickly, before his wounds take him first." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, going after Dogran? I don't care what you want with him, so long as you get him out." },
    { id = "n_soldier", cat = "soldier", when = { minLevel = 20 },
      text = "You've got a grunt's scars. Then you know what it is to leave someone behind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Grunt Logmar, Camp Taurajo, and we've been trying to weed the quilboar out of these hills since the spring. It's slow work, and it's cost us more than it should have." },
        { id = "h_dogran", when = { class = "WARLOCK", questDone = TODO_QUEST("News of Dogran") },
          text = "You've made it this far, so if you want to see it through, I won't stop you, but I can't spare you any grunts. Dogran's held in a quilboar camp to the north of here, two huts together, heavily guarded, if they haven't killed him yet." },
        { id = "h_after", when = { questDone = TODO_QUEST("Dogran's Captivity") },
          text = "You reached him, then. Did he say anything? He never tells me the truth, so I'd rather hear it from you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm on watch, but I can talk." },
        { id = "h_again2", text = "Go on, I'll keep one eye on the hills." },
      },
      choices = {
        { text = "What happened to Dogran?", next = "raid" },
        { text = "Why does the Horde fight the quilboar here?", next = "quilboar" },
        { text = "What's the draught for?", next = "draught" },
        { text = "Tell me about Camp Taurajo.", next = "camp" },
        { text = "I'll let you keep watch.", next = "END" },
      },
    },
    raid = {
      lines = { { id = "ra_default", text = "He led a few of us to one of their camps, and we walked into more Bristleback than we'd been told there'd be. He was hurt bad, and the rest of us fought our way out, and we tried to go back for him, but his wounds were festering and we didn't dare move him." } },
      choices = {
        { text = "You left him there.", next = "guilt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guilt = {
      big = true,
      lines = { { id = "gu_default", text = "I left him there, yes, and I tell myself it was the right call, because moving him would have killed him. Some nights I believe it, and some nights I lie awake and count the steps back to that camp." } },
      choices = {
        { text = "You did what had to be done. Let it rest.", next = "BACK", reply = "Easy for you to say, and maybe I'll learn to say it myself one day. Until then I'll keep counting those steps, because somebody ought to remember the one I left.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A grunt doesn't leave his own behind. Ever.", next = "BACK", reply = "Don't you think I know that, grunt? I've told myself the same every night since, and it cuts just as deep coming from you.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quilboar = {
      lines = { { id = "qu_default", text = "Because they raid the roads and the tauren camps, and they'd raid this one too if we gave them half a chance. The tauren say the Bristleback are bolder than they used to be, and that something in Razorfen is egging them on." } },
      choices = { { text = "Something else, Logmar.", next = "BACK" } },
    },
    draught = {
      lines = { { id = "dr_default", text = "A healing draught from the trolls at the Malaka'jin, at the foot of the Stonetalon Mountains, strong enough to get a broken grunt on his feet. The first runner we sent for it never came back, and the trolls say goblins did him in on the road." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } } },
    },
    camp = {
      lines = { { id = "ca_default", text = "Tauren built it and tauren run it, and they let a handful of us orcs keep the watch, which suits me, because they cook better than any orc I've known. It's the last real camp before the road runs south to the Needles, so everyone passes through sooner or later." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Dogran and I were promoted out of Orgrimmar the same week. He got the Crossroads and then Taurajo, and I followed him, because someone had to." } },
    advice = { { id = "tp_ad", text = "Count the huts before you count the quilboar. The huts don't lie about how many there are." } },
    _none = { { id = "tp_none", text = "I don't know, and I've stopped pretending I know things out here." } },
  },
}

---------------------------------------------------------------------------
-- Grunt Dogran: broken in a quilboar camp, and deciding how to die.
---------------------------------------------------------------------------
P:NPC {
  key = "dogran", id = TODO_NPC("Grunt Dogran"), name = "Grunt Dogran",
  bible = "bibles/south_taurajo_roads.md", role = "soldier", tier = "quest",
  temper = { "proud", "grim" }, values = { "loyal", "brave" },
  notices = { "class", "race" },
  impression = {
    first = "Grunt Dogran lies wounded in a Bristleback camp south of the Crossroads, his leg and arm ruined, waiting to find out whether the quilboar or his wounds will take him first. He talks about his mate in Orgrimmar more than about himself.",
    third = "{name} found Grunt Dogran, a wounded orc grunt held captive by the quilboar near Camp Taurajo.",
  },

  greetings = {
    { id = "g_hi", text = "Who's there? If you're a quilboar, you're a quiet one, and if you're not, you'd better be quick." },
    { id = "g_drink", when = { questActive = TODO_QUEST("Dogran's Captivity") }, text = "Logmar sent you? Then give it here, whatever it is, and I'll drink it, even if it's quilboar swill." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc face, out here. You don't know how good that is to see, brother, after a week of tusks and snouts." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Grunt Dogran, of the Crossroads, and of Camp Taurajo for all the good it did me. The Bristleback dragged me here after the raid, and they've been deciding what to do with me ever since." },
        { id = "h_drunk", when = { questDone = TODO_QUEST("Dogran's Captivity") },
          text = "That draught tastes like a kodo's bath, but there's strength in it, enough to limp out of here at least. The leg won't ever be right again, though, and I don't think the arm will either." },
      },
      again = {
        { id = "h_again", text = "What else? Talk quietly, they come round at dusk." },
        { id = "h_again2", text = "Go on, brother. Talking keeps my mind off the leg." },
      },
      choices = {
        { text = "Zankaja is waiting for you in Orgrimmar.", next = "zankaja" },
        { text = "How did the quilboar take you?", next = "raid" },
        { text = "What will you do now?", next = "choice", when = { questDone = TODO_QUEST("Dogran's Captivity") } },
        { text = "Logmar blames himself.", next = "logmar" },
        { text = "Hold on. Help is coming.", next = "END" },
      },
    },
    zankaja = {
      lines = { { id = "za_default", text = "I know she is, up on the bluff in Orgrimmar watching the wind riders come in. She's young and beautiful and she deserves better than what's left of me, and I've been lying here working out how to tell her that." } },
      choices = {
        { text = "She gave you a pendant, didn't she?", next = "pendant" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pendant = {
      lines = { { id = "pe_default", text = "She did, and I wore it under my armour where nobody could see it, so the quilboar never found it; they only took what shone. It's dirty now, caked in Barrens mud, but it's the only thing I've got left that's hers." } },
      choices = { { text = "Something else, Dogran.", next = "BACK" } },
    },
    raid = {
      lines = { { id = "ra_default", text = "I led the raid, and I counted wrong, and that's all of it. Logmar wanted to wait for more grunts and I told him we didn't need them, so this leg is my own doing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    logmar = {
      lines = { { id = "lo_default", text = "He would, the fool, and it was my call, not his. Tell him from me that he got the others out, and that's more than I managed, and he can stop counting steps." } },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    choice = {
      big = true,
      lines = { { id = "ch_default", text = "Zankaja won't spend her life feeding a cripple, not if I can help it, so I'll find one last fight and die in it standing. Take the pendant, and don't tell her any of this, because I won't have her carrying the guilt." } },
      choices = {
        { text = "Live, Dogran. Let her decide what she can bear.", next = "BACK", reply = "She'd decide to keep me, that's the trouble, and she'd wear herself down to bone doing it. Still, you speak like someone who's lost people, and I'll think on what you've said.", fx = { align = { honor = -1 } } },
        { text = "A warrior's death is your right. I'll honour it.", next = "BACK", reply = "Thank you, {class}, because that's more than most would give a broken grunt. Carry that pendant to her, and let her remember me as I was before this camp.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a grunt in Orgrimmar, then promoted to the Crossroads and sent on to Taurajo, and now this. It was a short climb and a long fall." } },
    advice = { { id = "tp_ad", text = "Count them twice before you charge, brother. I counted once." } },
    _none = { { id = "tp_none", text = "I don't know, and I've other things on my mind just now." } },
  },
}

---------------------------------------------------------------------------
-- Gann Stonespire: walks the roads near Bael Modan, done with diplomacy.
---------------------------------------------------------------------------
P:NPC {
  key = "gann", id = TODO_NPC("Gann Stonespire"), name = "Gann Stonespire",
  bible = "bibles/south_taurajo_roads.md", role = "questgiver", tier = "quest",
  temper = { "grim", "calm" }, values = { "loyal", "vengeful" },
  notices = { "race", "class" },
  impression = {
    first = "Gann Stonespire wanders alone on the roads of the southern Barrens near Bael Modan, where the dwarves blast holes in the hills his tribe once called home. He tried talking to them, and now he has stopped trying.",
    third = "{name} met Gann Stonespire, a tauren wandering near Bael Modan who wants the dwarves driven out.",
  },

  greetings = {
    { id = "g_hi", text = "In solitude I walk these roads, {class}, and I'm not used to company. Speak, if you have something to say." },
    { id = "g_reclaim", when = { questActive = TODO_QUEST("Gann's Reclamation") }, text = "The excavators still dig, and the foremen still shout. Have you brought me the prospector's journal?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Are you one of Prospector Khazgorm's diggers, come to tell me again how much silver lies under my ancestors' bones?" },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the people, walking these roads. Then you'll hear the blasting the way I hear it, in your chest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gann Stonespire, and the hills around Bael Modan fed and sheltered my tribe long before the dwarves came with their blasting powder. Now the ground shakes all day, and their machines chew the hills to gravel." },
        { id = "h_before", when = { faction = "Horde", questBefore = TODO_QUEST("Gann's Reclamation") },
          text = "I tried words, and words failed, so now I mean to act. Drive the dwarves out of the Bael Modan dig by force, and bring me their prospector's journal, so I can learn what they want with my land." },
        { id = "h_revenge", when = { questDone = TODO_QUEST("Gann's Reclamation") },
          text = "Prospector Khazgorm met the fate he earned, and I feel no remorse for the fool. His journal tells me exactly how they blast the ground apart, and I mean to give them a taste of their own medicine." },
        { id = "h_done", when = { questDone = TODO_QUEST("Revenge of Gann") },
          text = "The flying machine is burning wreckage, and the dwarves will know this land has defenders. May you be honoured in Thunder Bluff as a champion of a lost tribe." },
      },
      again = {
        { id = "h_again", text = "Is there more, {class}? The road is long and quiet." },
        { id = "h_again2", text = "Speak. I listen better than I talk." },
      },
      choices = {
        { text = "Tell me about your tribe.", next = "tribe" },
        { text = "What happened when you tried to talk to them?", next = "talks" },
        { text = "What are the dwarves digging for?", next = "dig" },
        { text = "You'd use their own explosives against them?", next = "blast", when = { questDone = TODO_QUEST("Gann's Reclamation") } },
        { text = "I'll leave you to your road.", next = "END" },
      },
    },
    tribe = {
      lines = { { id = "tr_default", text = "We were few, and we buried our dead in the hills where the dwarves dig now, and we hunted the plains between here and the Needles. The centaur scattered us long ago, and the last of us joined Cairne at Bloodhoof, but I came back, because someone should." } },
      choices = {
        { text = "Why come back alone?", next = "alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "Because the bones in those hills are my grandmothers', and somebody has to stand near them while they're being dug up. Thunder Bluff sends its sympathy, and sympathy has never stopped a single drill." } },
      choices = { { text = "Something else, Gann.", next = "BACK" } },
    },
    talks = {
      big = true,
      lines = { { id = "ta_default", text = "I walked into their camp with my hands open and asked them to leave the burial hills alone, and their prospector laughed and offered to sell me a map of my own land. That was the last time I walked in with my hands open." } },
      choices = {
        { text = "Then they've earned what comes. Drive them out.", next = "BACK", reply = "They have, and the spirits of my ancestors will not rest until the hills are quiet again. Walk with me in this, and the Venture Company will learn what the Earth Mother's anger looks like.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Try once more, with the Horde behind you.", next = "BACK", reply = "The Horde stands behind me already, and the goblins still laughed. I respect a peaceful heart, young one, but some ground has been walked over too many times to forgive.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig = {
      lines = { { id = "di_default", text = "Silver, they say, and old things buried by older peoples, and the Explorers' League pays well for both. They don't care what else they dig up along the way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    blast = {
      big = true,
      lines = { { id = "bl_default", text = "I would. Their own plans call for nitroglycerin, wood pulp and sodium nitrate, and their soldiers carry all of it. The flying machine is the heart of that place and an insult to the memory of my tribe, and I want it burning." } },
      choices = {
        { text = "Fire for fire. They started it.", next = "BACK", reply = "They did, with dynamite on sacred ground, and the earth has not forgotten. Bring fire to their machine, and let the smoke carry my tribe's memory to the sky.", fx = { align = { honor = -1 } } },
        { text = "Burn the machine, but spare the diggers if we can.", next = "BACK", reply = "You have a gentle spirit, and the Earth Mother loves those who spare where they can. Burn the machine, then, and let the diggers run home and tell their masters what they saw.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a hunter once, and a husband, and now I am only the one who walks these roads." } },
    advice = { { id = "tp_ad", text = "Listen to the ground before you step, {class}. Out here it tells you when the dwarves are blasting." } },
    _none = { { id = "tp_none", text = "I don't know. The road doesn't tell me much beyond itself." } },
  },
}
