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
    first = "He hasn't forgiven himself for making it back without Dogran.",
    third = "{name} met Grunt Logmar at Camp Taurajo, the grunt who came back from the raid where Dogran was captured.",
  },

  greetings = {
    { id = "g_hi", text = "Keep your eyes on the treeline if you're standing here, the Bristleback like to try their luck at dusk." },
    { id = "g_draught", when = { questActive = TODO_QUEST("Dogran's Captivity") }, text = "You've got the draught? Then go, and quickly, before his wounds take him first." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Any word from the north, from the huts? No, I can see there isn't, or you'd have said it first." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's the dark hours now, and that's when they move. Stay inside the firelight if you're staying." },
    { id = "g_away", when = { away = 14 }, text = "It's been a long while since you stood this watch with me. The hills haven't got any quieter." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Going after Dogran, with that smell on you? I don't care what you want with him, so long as you get him out." },
    { id = "n_soldier", cat = "soldier", when = { minLevel = 20 },
      text = "You've got a grunt's scars. Then you know what it is to leave someone behind." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the camp's own people. Your braves have been good to us, better than we've earned lately." },
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
        { id = "h_again3", text = "Say it. I'd sooner talk than stand here listening to my own head." },
      },
      choices = {
        { text = "What happened to Dogran?", next = "raid" },
        { text = "Why does the Horde fight the quilboar here?", next = "quilboar" },
        { text = "What's the draught for?", next = "draught" },
        { text = "Tell me about Camp Taurajo.", next = "camp" },
        { text = "You haven't slept in a long while, by the look of you.", next = "sleep" },
        { text = "Why can't the camp spare grunts to fetch him?", next = "spare" },
        { text = "I'm a healer. Tell me about his wounds.", next = "healer", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "A tauren camp, and orcs on its wall. How does that sit?", next = "tauren", when = { race = "Tauren" } },
        { text = "An orc doesn't leave an orc. Point me at that camp.", next = "orc", when = { race = "Orc" } },
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
        { text = "How many steps is it?", next = "guilt2" },
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
    guilt2 = {
      lines = { { id = "gu2_default", text = "Three hundred and forty, from the last ridge to the hut where he fell. I walked it twice, coming out, with a grunt on each shoulder. I could walk it now with my eyes shut, and most nights I do, lying on my back." } },
      choices = {
        { text = "Why haven't you gone back yourself?", next = "guilt3" },
        { text = "Something else, Logmar.", next = "BACK" },
      },
    },
    guilt3 = {
      big = true,
      lines = { { id = "gu3_default", text = "Because I've six grunts and a camp full of tauren children behind this wall, and if I take the six north, the Bristleback come south. I asked the Crossroads for more blades, and Thork sent back that he has none. So I stand here, and Dogran lies there." } },
      choices = {
        { text = "You held your post. That was the harder duty.", next = "BACK", reply = "That's what Kirge Sternhorn tells me, and he's a brave who's buried friends. I hear it. I don't yet believe it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd have gone for him and damned the post.", next = "BACK", reply = "So would I, a year ago. Then I learned what it is to be the one they left the wall to.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep = {
      lines = { { id = "sl_default", text = "A few hours, between watches. Byula at the inn leaves a bowl out for me, and I eat it cold because I forget it's there. I'll sleep when someone tells me which way it went for him, one way or the other." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spare = {
      lines = { { id = "sp_default", text = "Count us. Six orcs and the camp's own braves, and the braves have the hunters and the kodo herds to guard as well as the gate. Jorn Skyseer is the one the camp listens to, and he'd send every one of them if I asked. That's why I don't ask." } },
      choices = {
        { text = "So it falls to whoever passes through.", next = "spare2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spare2 = {
      lines = { { id = "sp2_default", text = "It does, and I'm ashamed to say it. The Horde's spread thin across this whole land, and half its work gets done by travellers with a blade and an hour to give. If you're one of those, I'll not forget it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    healer = {
      lines = { { id = "he_default", text = "His left leg was opened to the bone by a boar-spear, and the right arm was crushed under a thornweaver's club. Both had turned by the time we were driven off. If the draught gets him standing, you may be able to do the rest, and I'd be in your debt for trying." } },
      choices = { { text = "I'll do what can be done. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "It sits well with me, and I hope with you. Your people fed us when we came down here knowing nothing of the land, and showed us which water was good. We keep the wall because it's the one thing we know how to give back." } },
      choices = { { text = "It's a gift well given. Something else.", next = "BACK" } },
    },
    orc = {
      lines = { { id = "or_default", text = "Lok'tar. North of here, past the dry wash, two huts close together with a fire between them. He's in the eastern one, or was. Go quietly until you can't, and if he's past saving, tell me so to my face." } },
      choices = { { text = "You'll hear it from me either way.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    quilboar = { { id = "tp_quilboar", text = "Bristleback. Thornweavers, geomancers and more spears than I've grunts. They hold the hills north and south of this camp, and they know we're thin." } },
    razorfen = { { id = "tp_razorfen", text = "The great thorn tangle to the south, where their crone rules. Every bold thing the Bristleback do starts there, the tauren say." } },
    thrall = { { id = "tp_thrall", text = "The Warchief sent us here to stand with the tauren. I mean to still be standing when he asks how it went." } },
    centaur = { { id = "tp_centaur", text = "Not our trouble this far south, thank the spirits. We've quilboar enough for two garrisons." } },
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
    first = "He talks about his mate in Orgrimmar more than about himself.",
    third = "{name} found Grunt Dogran, a wounded orc grunt held captive by the quilboar near Camp Taurajo.",
  },

  greetings = {
    { id = "g_hi", text = "Who's there? If you're a quilboar, you're a quiet one, and if you're not, you'd better be quick." },
    { id = "g_drink", when = { questActive = TODO_QUEST("Dogran's Captivity") }, text = "Logmar sent you? Then give it here, whatever it is, and I'll drink it, even if it's quilboar swill." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to this stinking hut. Either you're braver than me or you've less sense, and I'm glad of it both ways." },
    { id = "g_done", when = { questDone = TODO_QUEST("Dogran's Captivity") }, text = "I can stand, thanks to you. It isn't much of a stand, but it's on my own feet." },
    { id = "g_troll", when = { race = "Troll" }, text = "A troll. Logmar sent to your people at Malaka'jin for a draught, the last I heard. If it ever reaches me, I'll owe a troll more than thanks." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc face, out here. You don't know how good that is to see, brother, after a week of tusks and snouts." },
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } },
      text = "You've a healer's eyes, going straight to the leg. Look if you must, but spare me the face you're about to make." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Then you'll understand me better than Logmar does, when I tell you how I mean to finish this." },
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
        { id = "h_again3", text = "Say it low. I've counted their rounds, and we've a little while yet." },
      },
      choices = {
        { text = "Zankaja is waiting for you in Orgrimmar.", next = "zankaja" },
        { text = "How did the quilboar take you?", next = "raid" },
        { text = "What will you do now?", next = "choice", when = { questDone = TODO_QUEST("Dogran's Captivity") } },
        { text = "Logmar blames himself.", next = "logmar" },
        { text = "The quilboar have kept you alive this long. Why?", next = "alive" },
        { text = "You've watched this camp from the inside for days.", next = "watch" },
        { text = "I can ease that leg, if you'll hold still.", next = "healer", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "I know a thing or two about prices. Yours needn't be this one.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Lok'tar, brother. You're not dead yet.", next = "orc", when = { race = "Orc" } },
        { text = "Hold on, Dogran, help is coming.", next = "END" },
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
        { text = "What last fight do you have in mind?", next = "choice2" },
        { text = "Live, Dogran. Let her decide what she can bear.", next = "BACK", reply = "She'd decide to keep me, that's the trouble, and she'd wear herself down to bone doing it. Still, you speak like someone who's lost people, and I'll think on what you've said.", fx = { align = { honor = -1 } } },
        { text = "A warrior's death is your right. I'll honour it.", next = "BACK", reply = "Thank you, {class}, because that's more than most would give a broken grunt. Carry that pendant to her, and let her remember me as I was before this camp.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    choice2 = {
      lines = { { id = "ch2_default", text = "There's a Bristleback chieftain who walks through here at dusk to look at me. He's the one who put the spear in my leg. If I can get as far as him with a blade in my good hand, that's an ending an orc can be buried under." } },
      choices = {
        { text = "And what does Zankaja get out of that ending?", next = "choice3" },
        { text = "Something else, Dogran.", next = "BACK" },
      },
    },
    choice3 = {
      big = true,
      lines = { { id = "ch3_default", text = "She gets to weep for a grunt who died fighting, and then she gets to live. The other way, she gets a mate who can't carry water, and she'd stay, because that's her. I'll not make her choose it. I'm choosing it for her." } },
      choices = {
        { text = "That choice is hers to make. Go home and let her.", next = "BACK", reply = "You'd have me limp through the gates on one leg and see her face fall? ...Maybe. Spirits help me, maybe. Leave me to think on it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A warrior's death is yours by right. Take it.", next = "BACK", reply = "Lok'tar ogar. That's all I wanted someone to say. Take the pendant to her, and say only that I fell well.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alive = {
      lines = { { id = "al_default", text = "Not from kindness. Their thornweaver comes and mutters over me and takes a little blood each time, for what I don't know. I think I'm meant for something at Razorfen, when I'm weak enough to be carried and strong enough to last the road." } },
      choices = {
        { text = "What happens at Razorfen?", next = "alive2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alive2 = {
      lines = { { id = "al2_default", text = "I don't have their tongue, but I know one word they keep saying, and it's the crone's name, Charlga. Every time they say it they look south and then at me. I've decided I won't be making that journey, whatever else happens." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "razorfen" } } } },
    },
    watch = {
      lines = { { id = "wa_default", text = "I have, and I've made what use of it I can. Two guards on this hut, changed at dusk and again at moonrise. The geomancers sleep in the far hut and wake slow. If Logmar ever gets his reinforcements, tell him to come at moonrise, from the east, with the wind." } },
      choices = { { text = "I'll carry that to him. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    healer = {
      lines = { { id = "he_default", text = "Do what you like with it. I'll not scream, I've done all of that I'm going to. But be honest with me after. If it won't bear weight again, I want to hear it from someone who knows, and not from my own fear." } },
      choices = {
        { text = "It will bear you, in time, with a staff.", next = "BACK", reply = "A staff. Hah. My father used one at the end, and nobody thought the less of him. I'd forgotten that.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      lines = { { id = "wl_default", text = "You'd know. Your sort bargain with worse than quilboar and walk away. But I've nothing left to bargain with except how it ends, and I'll not hand that to anyone, demon or friend." } },
      choices = { { text = "Then keep it. Something else.", next = "BACK" } },
    },
    orc = {
      lines = { { id = "or_default", text = "Not yet, no. It's good to hear the old words in a mouth that isn't mine. I've been saying them to the wall for days, to remember what I am under the mud." } },
      choices = { { text = "You're a grunt of the Horde. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    quilboar = { { id = "tp_quilboar", text = "Bristleback. I thought them beasts with spears, and I counted them like beasts. They're soldiers, and I know it now." } },
    razorfen = { { id = "tp_razorfen", text = "South of here, the big thorn. It's where they mean to take me, and it's where I won't be going." } },
    thrall = { { id = "tp_thrall", text = "The Warchief pinned my rank on me himself, in Orgrimmar. I think of his face when I think of what I've done with it." } },
    darkspear = { { id = "tp_darkspear", text = "Good fighters, and they laugh at everything. I'd give a great deal to hear somebody laugh just now." } },
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
    first = "He tried talking to the dwarves, and now he has stopped trying.",
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
        { text = "Who is this Prospector Khazgorm?", next = "khaz" },
        { text = "Does Thunder Bluff know what's happening here?", next = "bluff" },
        { text = "What did these hills look like before the dwarves came?", next = "w5_before" },
        { text = "I'll leave you to your road.", next = "END" },
      },
    },
    w5_before = {
      lines = { { id = "w5_before_l", text = "Green in the hollows, gold on the slopes, with springs where the hills folded together. My grandmother's grandmother is buried on the ridge above Bael Modan. I cannot visit her now without walking past a dwarf with a rifle." } },
      choices = {
        { text = "Could there ever be peace with them?", next = "w5_before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w5_before2 = {
      lines = { { id = "w5_before2_l", text = "If they stopped the blasting, I would sit at a fire with them. I told them so, once. They thanked me politely and set off another charge before I had reached the bottom of the hill. I do not know what peace looks like with someone who cannot hear you over their own powder." } },
      choices = {
        { text = "If they stop blasting, offer them peace. Grief needn't become war.", next = "BACK", reply = "You are kinder than I have the strength to be today. But I will keep the offer open.", fx = { align = { light = 1 } } },
        { text = "Drive them out of the hills. They had their chance.", next = "BACK", reply = "I have thought it many nights. And each morning I remember how many of my people that would cost.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { text = "Answer fire with fire. They started this.", next = "BACK", reply = "They did, with dynamite on sacred ground, and the earth has not forgotten. Bring fire to their machine, and let the smoke carry my tribe's memory to the sky.", fx = { align = { honor = -1 } } },
        { text = "Burn the machine, but spare the diggers if we can.", next = "BACK", reply = "You have a gentle spirit, and the Earth Mother loves those who spare where they can. Burn the machine, then, and let the diggers run home and tell their masters what they saw.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    khaz = {
      lines = { { id = "kz_default", text = "The dwarf who leads the excavation at Bael Modan, and the one who laughed at me. He works for the Explorers' League out of Ironforge, and he writes everything down, every blast and every bone, as if writing it makes it his." } },
      choices = {
        { text = "What does he write about the bones?", next = "khaz2" },
        { text = "Dwarves record everything. It's their way.", next = "khaz2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    khaz2 = {
      lines = { { id = "kz2_default", text = "That they are old, older than tauren, he thinks, and that they might be the bones of the titans' servants. My grandmothers would laugh at that, if they could. He has no idea whose dead he is digging, and he would not care if he did." } },
      choices = {
        { text = "Would it change anything, if he knew?", next = "khaz3" },
        { text = "Something else, Gann.", next = "BACK" },
      },
    },
    khaz3 = {
      lines = { { id = "kz3_default", text = "Not for him, I think, but it would for me. I walked into his camp hoping a dwarf could be made to understand, and I walked out knowing better. I don't hate them all, {class}, only the ones who dig where they've been asked not to." } },
      choices = { { text = "That seems fair. Something else.", next = "BACK" } },
    },
    bluff = {
      lines = { { id = "gbl_default", text = "They know. Cairne sent word that he grieves for the burial hills, and that the tauren cannot fight a war with Ironforge over one small tribe's dead while the centaur still raid Mulgore. I understand him, and I walk these roads anyway." } },
      choices = {
        { text = "Then you're doing what the High Chieftain can't.", next = "bluff2" },
        { text = "One tauren alone can't hold back a dwarven dig.", next = "bluff2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bluff2 = {
      lines = { { id = "gbl2_default", text = "One tauren with help can, and you are help. Cairne does what a chieftain must, and I do what a grandson must, and there is no quarrel between us, only different burdens. When this is done, I will go to the Bluff and tell him the hills are quiet." } },
      choices = {
        { text = "I'm tauren. Your grandmothers are my people's dead too.", next = "bluff3", when = { race = "Tauren" } },
        { text = "I hope you can tell him that soon. Something else.", next = "BACK" },
      },
    },
    bluff3 = {
      lines = { { id = "gbl3_default", text = "They are, and you honour them by saying so. When you are next at the Bluff, stand on the Elder Rise a moment and remember the small tribe that hunted between here and the Needles. That is all the memorial they will ever have." } },
      choices = { { text = "I'll remember them. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a hunter once, and a husband, and now I am only the one who walks these roads." } },
    advice = { { id = "tp_ad", text = "Listen to the ground before you step, {class}. Out here it tells you when the dwarves are blasting." } },
    _none = { { id = "tp_none", text = "I don't know. The road doesn't tell me much beyond itself." } },
  },
}
