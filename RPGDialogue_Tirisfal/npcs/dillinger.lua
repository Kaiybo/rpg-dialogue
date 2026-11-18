-- Deathguard Dillinger, on the west end of Brill by the graveyard. Voice: bibles/dillinger.md
-- A soldier stuck on a post he'd rather leave, who doesn't thank people for doing their duty.
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dillinger", id = TODO_NPC("Deathguard Dillinger"), name = "Deathguard Dillinger",
  bible = "bibles/dillinger.md", role = "soldier", tier = "quest",
  communities = { "brill" }, temper = { "clipped" }, values = { "dutiful", "stern" },
  notices = { "kit", "class" },
  impression = {
    first = "Deathguard Dillinger guards the west road out of Brill and plainly wishes he were somewhere bloodier. He will not thank anyone for doing their duty, but he remembers who did it.",
    third = "{name} met Deathguard Dillinger, who holds Brill's western post and sends others to break the Scourge at Agamand Mills.",
  },

  greetings = {
    { id = "g_post", text = "Stay off the graves, and keep your eyes on the west road. That's where the trouble comes from." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good; the west road hasn't gone quiet while you were away." },
    { id = "g_claws", when = { questActive = TODO_QUEST("A Putrid Task") }, text = "Bring me those claws, {class}. The rotting dead won't hand them over, so don't wait for them to." },
    { id = "g_mills", when = { questActive = TODO_QUEST("The Mills Overrun") }, text = "Bring me ribs and skulls from Agamand Mills. Follow the road west, take the north fork, and look for the windmills." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Scourge kept coming the whole time, so pick up where you left off." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were a fresh corpse with a rusty blade when you first stood here, and now you look like something the Scourge should worry about. Good." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word along the street is that you've been useful in Brill. I don't hand out praise, but I'm told others do." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word is you put someone's back up in town. Save the bad temper for the Scourge, because they've earned it and Brill hasn't." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's half off you. The rattlecages at the Mills will finish the job if you go back like that, so see a smith first." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You stand like you've held a line before. Austil de Mon at the tavern sends me his best warriors, and I'll find out soon enough if you're one of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Dillinger. I hold the west end of Brill against whatever crawls out of the fields, and lately that's more Scourge than I'd like. The pay is nothing and my boots are rotting, and I stopped complaining about the smell when I worked out it was mostly me." },
        { id = "h_putrid_before", when = { questBefore = TODO_QUEST("A Putrid Task") },
          text = "The Scourge have been trickling into the glades west of here, near the old bridge, and nobody's sent them back yet. Rotting dead and ravaged corpses, mostly, and they all have claws worth taking." },
        { id = "h_putrid_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Putrid Task"), days = 3 } },
          text = "Those claws stink worse than the graveyard, which is how I know they're real. I only wish I'd been there to see you break the things they came off." },
        { id = "h_mills_before", when = { questDone = TODO_QUEST("A Putrid Task"), questBefore = TODO_QUEST("The Mills Overrun") },
          text = "The bridge was the small problem. The Scourge are trying to dig in at Agamand Mills, and if they hold it, they'll have a foothold in the middle of Tirisfal." },
        { id = "h_mills_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Mills Overrun"), days = 3 } },
          text = "The Mills are broken, or near enough. I won't thank you for doing what had to be done, but every Deathguard in Tirisfal will know your name by morning." },
        { id = "h_ulag", when = { questActive = TODO_QUEST("Ulag the Cleaver") },
          text = "The skull stone by the mausoleum lifts the seal. After that, Ulag is free, and you'll have perhaps a breath to be ready." },
        { id = "h_ulag_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Ulag the Cleaver"), days = 7 } },
          text = "Ulag is finished, then. He was no small thing, and you met him alone, which the Dark Lady's officers will hear about." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "One of the Warchief's people, out among our graves. The Scourge can't tell the living from the dead until they bite, so stay close to the road." },
        { id = "h_warrior", when = { class = "WARRIOR", race = "Scourge" },
          text = "A warrior, and one of ours. I've a task that's waited a long while for someone with a steady arm, if Austil de Mon thinks you're ready." },
        { id = "h_dd_family", tags = { "news" }, when = { questDone = TODO_QUEST("Deaths in the Family") },
          text = "Coleman's Agamands are back in the ground, and the mills feel lighter for it. I watched the road while you did the work, and I didn't envy you any of it." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, because my eyes belong on that road." },
        { id = "h_again2", text = "Go on, then. The Scourge aren't in a hurry tonight, so I can spare a moment." },
      },
      choices = {
        { text = "The Scourge seem to be after something out west.", next = "west" },
        { text = "Why aren't you out there fighting them yourself?", next = "post" },
        { text = "Tell me about Agamand Mills.", next = "mills" },
        { text = "I'm told you have a task for a warrior.", next = "ulag", when = { class = "WARRIOR" } },
        { text = "Who was Ulag, before he was a prisoner?", next = "ulag_after", when = { questDone = TODO_QUEST("Ulag the Cleaver") } },
        { text = "Do the living give you trouble in Brill?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll walk the west road for you tonight.", next = "rogue", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Got any work?", next = "BUSINESS" },
        { text = "I'll leave you to your road.", next = "END" },
      },
    },

    west = {
      lines = { { id = "we_default", text = "Ground, mostly, and bodies to raise on it. The Scourge don't think, but whatever thinks for them knows Brill is the last town between the Plaguelands and the Undercity's gate." } },
      choices = {
        { text = "Then the west road matters more than it looks.", next = "west_road" },
        { text = "Something else, Deathguard.", next = "BACK" },
      },
    },
    west_road = {
      big = true,
      lines = { { id = "wr_default", text = "It does, and so does every claw and skull you bring back from it. The Scourge counts its dead and so do we, and I mean for our count to be the bigger one." } },
      choices = {
        { text = "Then I'll keep the count running in our favor.", next = "BACK", reply = "Good, because the Scourge never stops counting, and neither do I. Bring me the tallies and I'll see they go to the Undercity with your name beside them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Counting's for clerks. I'll fight where the fighting's good.", next = "BACK", reply = "Clerks keep Brill standing, so mind how you sneer at them. Fight where you like, but the Deathguard only remember what's written down.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },

    post = {
      lines = { { id = "po_default", text = "Because I was ordered to stand here, and a Deathguard who leaves his post because he's bored is a Deathguard who gets Brill burned. Don't mistake that for liking it." } },
      choices = {
        { text = "You must miss the fighting.", next = "post_miss" },
        { text = "Orders keep the town standing. That's worth something.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    post_miss = {
      lines = { { id = "pm_default", text = "I miss the end of it, when the thing in front of you stops moving and you know it's done. Standing here, nothing is ever done, and the graves just keep filling." } },
      choices = {
        { text = "I'll bring you back the endings, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mills = {
      lines = {
        { id = "mi_default", text = "The Agamands owned the mills and most of the land around them before the plague. Now rattlecages and cracked-skull soldiers walk the yards, and Darkeye bonecasters stir them up from inside." },
        { id = "mi_coleman", when = { questDone = TODO_QUEST("The Mills Overrun") }, text = "Coleman Farthing at the inn takes an interest in the Agamands, and I'd sooner he did it than me. Talk to him if you want the family's story; I only want the Mills empty." },
      },
      choices = {
        { text = "The Agamands. Are any of them still there?", next = "mills_family" },
        { text = "Something else, Deathguard.", next = "BACK" },
      },
    },
    mills_family = {
      lines = { { id = "mf_default", text = "Some of them, and none of them are themselves anymore. If you meet an Agamand out there, don't stop to ask what it remembers, because the answer won't help you." } },
      choices = {
        { text = "That's a hard thing to say about anyone.", next = "BACK" },
        { text = "Understood. No questions, just steel.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    ulag = {
      lines = { { id = "ul_default", text = "I have one, and it'll test your arm and your nerve both. When the Scourge swept through the glades, we took one of them alive, and he could speak and think for himself, and called himself Ulag the Cleaver." } },
      choices = {
        { text = "So he has a free mind, like ours.", next = "ulag_mind" },
        { text = "Then why is he still a prisoner?", next = "ulag_mind" },
      },
    },
    ulag_mind = {
      lines = { { id = "um_default", text = "Free enough to talk, and still the Lich King's to the bone. We spent months trying to break that hold and we failed, so it's time to open the seal and let a warrior finish him." } },
      choices = {
        { text = "It must trouble you that you couldn't free him.", next = "ulag_doubt" },
        { text = "Show me the mausoleum. I'll do it.", next = "BUSINESS" },
      },
    },
    ulag_doubt = {
      big = true,
      lines = { { id = "ud_default", text = "Every one of us woke up the same way he did, and some of us were lucky. I don't like knowing how thin that line is, and I like even less that the cure for it is a sword." } },
      choices = {
        { text = "Then killing him is a mercy. I'll give it cleanly.", next = "BACK", reply = "A mercy, then, and a clean one, which is more than the Scourge ever gave him. Do it quickly and don't stop to look at his face, because you'll only remember it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He's Scourge. Mercy has nothing to do with it.", next = "BACK", reply = "You sound like the Dark Lady's orders, and perhaps that's the right way to sound. I only wish I could believe it as easily as you do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ulag_after = {
      lines = { { id = "ua_default", text = "A butcher, judging by the name, and he never told us more than that. I'd like to think whatever was left of the man was glad when you came through the door, but I'll never know, and neither will you." } },
      choices = {
        { text = "I'd like to think so too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Deathguard.", next = "BACK" },
      },
    },

    living = {
      lines = { { id = "li_default", text = "Not from me, but some in town look at you the way a starving man looks at bread, and I'd be lying if I said they're only joking, so keep your business on the main street." } },
      choices = {
        { text = "I'll keep my axe close and my business short.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rogue = {
      lines = { { id = "ro_default", text = "Walk it if you like, but don't come running back here with something on your heels. If you must bring me anything from out there, bring me claws." } },
      choices = {
        { text = "The claws, then, and I'll keep it quiet.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a soldier before, and I'm a soldier now. What happened in between isn't worth the telling." } },
    advice = { { id = "tp_ad", text = "Never turn your back on a corpse until you've seen it fall over twice, because in Tirisfal once is a habit, not a promise." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Executor Zygand worries about the Crusade, and he's right to. I worry about the Scourge, because they never stop coming and they never get tired." } },
    scourge = { { id = "tp_scourge", text = "The mindless shamble up this road every few nights, and I cut them down like a farmer cuts wheat. It would be good to fight something that fought back properly, now and then." } },
    forsaken = { { id = "tp_forsaken", text = "We're the Dark Lady's soldiers, and we do our duty without being thanked for it. If you want thanks, go join the Alliance and polish something." } },
    sylvanas = { { id = "tp_sylvanas", text = "I'd die for the Dark Lady again, and I'd do it on a bloodier road than this one, if she'd only send me there." } },
    stratholme = { { id = "tp_stratholme", text = "That's where the real fighting is, in Stratholme and the lands east of it. I've asked twice to be sent, and twice I've been told the west road needs me more." } },
    _none = { { id = "tp_none", text = "Ask someone who isn't watching a road. Innkeeper Renee at the tavern hears more than I do." } },
  },
}
