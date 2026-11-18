-- Korran, Belgrom Rockmaul's watcher at the Crossroads, studying the insects of the Field of Giants. Voice: bibles/korran.md
-- A careful, curious troll who started out collecting eggs and is now quietly frightened of what he found.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "korran", id = TODO_NPC("Korran"), name = "Korran",
  bible = "bibles/korran.md", role = "scholar", tier = "quest",
  communities = { "crossroads" }, temper = { "calm" }, values = { "curious", "loyal" },
  notices = { "class", "trophy" },
  impression = {
    first = "Korran watches the Barrens for Belgrom Rockmaul and has spent his days studying the insects of the Field of Giants. He talks about them calmly, but he has stopped calling them beetles.",
    third = "{name} met Korran at the Crossroads, a Darkspear watcher who studies the silithid of the Field of Giants for Belgrom Rockmaul.",
  },

  greetings = {
    { id = "g_watch", text = "Easy, mon. I be watching the south road, and you be standing in the way of it." },
    { id = "g_eggs", when = { questActive = TODO_QUEST("Egg Hunt") }, text = "The eggs be in the mounds in the Field of Giants, mon. Dig with the claw I gave you, and don't stay long by any one mound." },
    { id = "g_note", when = { questActive = TODO_QUEST("The Swarm Grows") }, text = "Belgrom be outside the warriors' hall in Orgrimmar. Put the note in his hand, not his guard's." },
    { id = "g_parts", when = { questActive = TODO_QUEST("Parts of the Swarm") }, text = "Bring me carapace, talon and heart from those bugs, mon. Every piece teach me a little more, and I don't like most of it." },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, mon, and the mounds in the south grew while you were away. I know, because I measure them." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You got stronger since you carried my eggs, mon. Good, because the bugs got stronger too." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = { "DRUID", "HUNTER" } },
      text = "You know beasts, mon. Tell me, then, have you ever seen a beast that thinks like a hive?" },
    { id = "n_trophy", cat = "trophy", when = { questDone = TODO_QUEST("Parts of the Swarm") },
      text = "You still smell like silithid, mon. I'd know that smell in my sleep now, and some nights I do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Korran, of the Darkspear. Belgrom Rockmaul send me to the Crossroads to watch the land and write down what happen, and what be happening, mon, be insects." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Egg Hunt") },
          text = "There be creatures in the Field of Giants to the south, mon, insects big as raptors, coming up out of mounds in the earth. Take this digging claw and bring me some of their eggs, because I want to know what hatch from them before they hatch here." },
        { id = "h_eggs_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Egg Hunt"), days = 3 } },
          text = "Good eggs, mon, and heavy. I been opening them carefully, and what be inside look like it know I be watching it." },
        { id = "h_swarm_before", when = { questBefore = TODO_QUEST("The Swarm Grows") },
          text = "Many travelers help me gather eggs, mon, and they all tell the same stories of how deadly these creatures be. I heard enough to think they a much larger threat than my masters believe, and Belgrom needs to hear it." },
        { id = "h_parts_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Parts of the Swarm"), days = 3 } },
          text = "The parts you brought from Thousand Needles match the ones from the Field of Giants, mon. Same creatures, two places, far apart, and that mean they be spreading, or they be everywhere already." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The bugs don't mind waiting." },
        { id = "h_again2", text = "Ask, ask. I talk better than I sleep, these days, with the beetles crawling in my hammock." },
      },
      choices = {
        { text = "These insects look like nothing else in the Barrens.", next = "insects" },
        { text = "Why does Belgrom care about bugs?", next = "belgrom" },
        { text = "Who else is helping you?", next = "moktar" },
        { text = "I've studied beasts. Let me look at the eggs.", next = "study", when = { class = { "DRUID", "HUNTER" } } },
        { text = "I brought the eggs. What did you find?", next = "findings", when = { questDone = TODO_QUEST("Egg Hunt") } },
        { text = "I'll help you.", next = "BUSINESS" },
        { text = "Watch the road, Korran.", next = "END" },
      },
    },
    insects = {
      lines = { { id = "i_default", text = "The tauren call them silithid, mon, and they come up out of mounds in the Field of Giants. Big, hard-shelled, many legs, and they never seem to fight alone." } },
      choices = {
        { text = "Where do they come from?", next = "origin", fx = { learn = { "silithid" } } },
        { text = "Something else, Korran.", next = "BACK", fx = { learn = { "silithid" } } },
      },
    },
    origin = {
      lines = { { id = "o_default", text = "From under the earth, mon, that much be plain. But how deep under, and from where, I don't know, and the mounds keep getting bigger every week I measure them." } },
      choices = {
        { text = "What happens if they keep growing?", next = "origin_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_end = {
      big = true,
      lines = { { id = "oe_default", text = "Then one day they come up somewhere that ain't empty, mon, and the Crossroads be the closest thing that ain't empty. I would rather we burn the mounds now and look foolish than wait and be right." } },
      choices = {
        { text = "Then burn the mounds before they spread.", next = "BACK", reply = "Dat's de kind of talk Korran likes to hear, mon. Fire be the only thing dem bugs understand, and the spirits won't mind a little smoke.", fx = { align = { order = 1 } } },
        { text = "Study them first. Burning teaches us nothing.", next = "BACK", reply = "You be braver than me, then, to go poking at dem mounds with a stick and a notebook. Study all you like, but keep a torch close, ya?", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    belgrom = {
      lines = { { id = "b_default", text = "Belgrom care about anything that might make him look wise to the Warchief, mon, and bugs be no different. He thought I was chasing beetles at first, but I been his loyal servant a long time, and now he read every letter, even the long ones about dung beetles." } },
      choices = {
        { text = "Belgrom doesn't seem to deserve your loyalty.", next = "loyal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loyal = {
      lines = { { id = "lo_default", text = "He be loud, mon, and proud, and he make his mistakes. But he listen when it count, and he never left one of his own out in the cold, so yes, he get my loyalty." } },
      choices = { { text = "Loyalty earned, then. Something else.", next = "BACK" } },
    },
    moktar = {
      lines = { { id = "m_default", text = "Moktar Krin always look out for me, mon. He be in Thousand Needles now, at the Rustmaul Dig Site, fighting the dwarves for Belgrom, and he say the same bugs crawl up out of the ground there too." } },
      choices = {
        { text = "Then they're spreading farther than anyone thinks.", next = "BACK", fx = { learn = { "silithid" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    study = {
      lines = { { id = "s_default", text = "Look close, mon, but don't touch the shell, because it be warm even when it should be cold. Tell me what your eyes see, because mine be tired of seeing it alone." } },
      choices = {
        { text = "They move like one creature with many bodies.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "It's a bug, Korran. A big one.", next = "BACK" },
      },
    },
    findings = {
      lines = { { id = "f_default", text = "Every egg be the same size, mon, the same shape, the same weight, like they been made and not laid. Beasts don't do that. Something with a plan do that." } },
      choices = { { text = "That's not a comforting thought.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Darkspear, a watcher, and Belgrom's eyes in the Barrens. I write down what I see, mon, and lately I see bugs." } },
    advice = { { id = "tp_ad", text = "If a thing never fights alone, mon, don't you fight it alone either." } },
    silithid = { { id = "tp_sil", text = "The silithid, mon. I know more about them than any troll should, and still not enough.", next = "insects" },
      { id = "tp_sil2", text = "Every mound I measure be bigger than the last. Write that down somewhere, mon, in case I ain't here to say it." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar are an annoyance, but they're children next to what lives in the Field of Giants. I'd take ten centaur over one of those hives waking up." } },
    quilboar = { { id = "tp_quilboar", fx = { learn = { "razorfen" } }, text = "Razormane all through the south, and their warrens at Razorfen grow bigger every year. Belgrom wants them watched, and I watch them, but I keep coming back to the insects." } },
    ahn_qiraj = { { id = "tp_ahn_qiraj", text = "There's talk among the goblins of a walled city in Silithus, somewhere under the sands, where these insects come from. I don't know if it's true, but I'd rather not find out the hard way." } },
    thrall = { { id = "tp_thrall", text = "The Warchief wants to know what's coming before it comes, and that's what Belgrom and I are for. I'd like to tell him something good for once." } },
    _none = { { id = "tp_none", text = "I only watch one thing these days, mon, and that ain't it." } },
  },
}
