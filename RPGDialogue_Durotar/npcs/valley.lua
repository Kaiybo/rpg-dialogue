-- The Valley of Trials: where young orcs (and trolls) become the Horde. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kaltunk", id = TODO_NPC("Kaltunk"), name = "Kaltunk",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "greenness" },
  impression = {
    first = "He has not forgotten what it was to arrive with nothing.",
    third = "{name} met Kaltunk, the gruff orc who greets new blood at the mouth of the Valley of Trials.",
  },

  greetings = {
    { id = "g_road", text = "Fresh off the road, are you? Good. The Horde is a family, and it has room for you, if you earn it with your hands." },
    { id = "g_back", when = { metBefore = true }, text = "Still in the valley? Then you've still got work to do, so go on." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the valley's had a dozen new recruits through since. Go on and show them what one looks like after the road." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "I remember you walking into this valley with nothing, and look at you now. Somebody greeted you right, I'd say." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The recruits say you've been helping around the valley. That's how it starts; you earn your place in the Horde one chore at a time." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 3 },
      text = "You've never swung a weapon at something that swings back, have you? You will, and probably today." },
  },

  start = "hello",
  nodes = {
    dd_sarkoth = {
      lines = {
        { id = "dd_sk_default", text = "Wouldn't you, if a scorpid had laid you out and a recruit had to finish what you started? He'll never say he was beaten, mind you, only that he softened it up for you. Let him have that, because it costs you nothing." },
      },
      choices = {
        { text = "He can tell it however he likes. The scorpid's dead.", next = "BACK", reply = "Spoken like someone who'll get along well in the Horde. Pride's cheap to give and dear to lose.", fx = { align = { honor = 1 } } },
        { text = "I'll tell it my way when people ask me.", next = "BACK", reply = "That's your right, and I'd likely do the same. Just don't do it within earshot of Hana'zua.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kaltunk.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Every recruit belongs here until they prove otherwise. When I came out of the camps the humans kept, I had nothing, and someone took me in anyway. You come with the Light that guarded those camps, and I'm taking you in anyway. Remember that." } },
      choices = {
        { text = "I'll remember, and I'll prove worthy of it.", next = "BACK", reply = "Then you'll do well here, because remembering is half of what the Den teaches. The other half is killing boars, and you'll get plenty of that.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I didn't ask for anyone's charity, Kaltunk.", next = "BACK", reply = "Nobody asks for it, recruit, and nobody refuses it either if they're smart. Take it, and pass it on someday.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A few each season, mostly trolls, and the odd Forsaken who walked a long way to get here. They're quieter than the orcs and they take longer to settle, but by the time they leave the valley the grunts are asking for them by name." } },
      choices = {
        { text = "I'll earn that name, Kaltunk.", next = "BACK", reply = "You will, if you keep at it. The grunts never forget a healer who stays in the fight when it turns bad.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need the grunts' approval to do my work.", next = "BACK", reply = "No, but you'll get it whether you need it or not, and it makes the work easier. Trust me on that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a mottled boar will knock you flat if you stand wrong, and that's the first lesson every warrior needs. Gornek will put you to work, and once the boars stop knocking you over, the scorpids and the Burning Blade in the caves will teach you the rest." } },
      choices = {
        { text = "Then I'll start with boars and learn properly.", next = "BACK", reply = "Good, that's the right way to start. Gornek will be pleased, though he won't show it.", fx = { align = { order = 1 } } },
        { text = "Boars are beneath me. Send me to the caves now.", next = "BACK", reply = "Beneath you, are they? Then the first boar that knocks you flat will teach you otherwise. Start with boars.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Whatever stands still long enough to let you, though most start with a boar because a boar forgives mistakes. The scorpids are tougher and meaner, and Thotar, the hunter trainer in Razor Hill, will tell you when you're ready to try either." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Whatever stands still long enough to let you, though most start with a boar because a boar forgives mistakes. Your {pet} looks like it's still learning too. You'll learn together, which is how all the good pairs start." },
      },
      choices = {
        { text = "I'll earn a beast's trust when the time comes.", next = "BACK", reply = "That's the hunter's way, and Thotar will be glad to hear it. Go and see him at Razor Hill when you've grown a little.", fx = { align = { honor = 1 } } },
        { text = "I'll take the strongest beast I can catch.", next = "BACK", reply = "The strongest beast you can catch might catch you first. Start with the scorpids, and work your way up.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It does, and Thrall himself owes his freedom partly to a few locks picked in the dark. Learn your trade with Kaplak, the rogue trainer in Razor Hill, when you're ready, but first do the work Gornek gives you, because every recruit starts there." },
      },
      choices = {
        { text = "I'll start with Gornek's work, like everyone else.", next = "BACK", reply = "Everyone starts there, even the ones who end up in the shadows. Do whatever Gornek asks, and watch who you meet along the way.", fx = { align = { order = 1 } } },
        { text = "I'll do my own work. Gornek's chores can wait.", next = "BACK", reply = "Then you'll be doing them later, with Gornek shouting at you. He made me haul water for a week when I tried the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Some trust it well enough, and some remember too much of the fel to trust any magic they can't feel in the earth. Show them your fire burns the Burning Blade and not the Horde, and you'll win them over sooner than you think." },
      },
      choices = {
        { text = "I'll show them. My fire's for the Horde.", next = "BACK", reply = "Good, and they'll see it soon enough. Point it at Burning Blade robes and nobody will ask you questions.", fx = { align = { honor = 1 } } },
        { text = "Their trust doesn't matter. My spells work either way.", next = "BACK", reply = "They work either way, sure, but the grunts will be guarding your back, so their trust matters. Win them over.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It was quiet, and not the good kind. We had the warlocks and their demons, and then the camps, and then nothing at all, and an orc with nothing to pray to is an orc who drinks. Thrall gave us the spirits back, and I'll not hear a word against him for it." } },
      choices = {
        { text = "The old ways are worth holding to, Kaltunk.", next = "BACK", reply = "They are, and I'm glad to hear it from a young one. Thrall gave us back something precious.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The past is gone. The Horde should find its own way.", next = "BACK", reply = "Maybe, but I'll take the spirits over the fel any day. Find your way, but don't forget where we've been.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Everyone finds a place in the Den, because that's what it's for, and nobody asks where you came from once you've cleared a few boars. Show Gornek what you can do and he'll stop calling you new, and that's as warm a welcome as he gives." } },
      choices = {
        { text = "I'll earn my place the same way as every other recruit.", next = "BACK", reply = "That's how it's done, and Gornek will notice. Clear a few boars, and you're one of us.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I didn't come for Gornek's approval. I'll find my own way.", next = "BACK", reply = "You'll find it, I don't doubt, but the Den's a good place to start. Even Gornek's approval has its uses.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because he's old enough to remember what demon magic did to the Horde, and so am I, near enough. The Warchief says a warlock who serves the Horde is better than one who serves the Burning Blade at Skull Rock, so go and prove him right." },
      },
      choices = {
        { text = "I'll serve the Horde and prove the Warchief right.", next = "BACK", reply = "Good, then you'll have friends here soon enough. Go to Skull Rock when you're ready and show them what a warlock of the Horde can do.", fx = { align = { order = 1 } } },
        { text = "I serve my own power, and the Horde benefits anyway.", next = "BACK", reply = "As long as the Horde benefits, I won't complain. But Gornek will be watching, and so will I.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_sarkoth", tags = { "news" }, when = { killed = { name = "Sarkoth" } },
          text = "Hana'zua is still telling anyone who'll listen how you went into his cave and finished Sarkoth. He's a proud orc, so if he's praising you to strangers, you must have done it properly." },
        { id = "h_dd_peons", when = { questDone = TODO_QUEST("Lazy Peons") },
          text = "Foreman Thazz'ril's peons are working again, and he says it was you who woke them up. I'll admit I've wanted to do that myself more than once." },
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "I'd swear I already sent you down to Gornek once, but that was {alt}, wasn't it? You two could be littermates, so go on down and give him his turn with you." },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "A {altrace} came through here before you, {alt} by name, and I gave them the same speech I'm about to give you. They went on to do well, so listen this time and I won't have to repeat myself." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin walks into the Valley of Trials. Someone greeted me once when I came out of the camps, so I'll greet you, glow and all." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, walking into the valley like everyone else. I'll send you to Gornek the same as the rest, but I'm glad you came." },
        { id = "h_default", key = true,
          text = "I'm Kaltunk, and every recruit who walks into this valley starts with me. I send you to Gornek in the Den, and he sends you to work." },
        { id = "h_place", tags = { "news" }, when = { questActive = TODO_QUEST("Your Place In The World") },
          text = "Gornek's in the Den, the cave just ahead. Tell him Kaltunk sent you, and stand up straight when you do." },
        { id = "h_dust", when = { metBefore = true }, text = "I came off a ship with nothing but my axe and Durotar's dust in my teeth, and that was enough. It's enough for you too." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, walking into the valley. When I came off the ship there wasn't an orc among us who'd talk to the spirits, and now the Warchief sends your kind to me by the dozen." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, walking into the valley. Durotar won't feel green or gentle to a druid, but the Den takes everyone, and Gornek will find work for you all the same." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, fresh to the Valley. Don't try your tricks on Gornek, because he catches every one, and he'll make you carry water for it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, fresh to the Valley. You'll want Un'Thuwa, the mage trainer in Sen'jin Village, eventually, but every recruit starts with Gornek." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, fresh in the valley! Every one of you thinks you'll lead a warband by the end of the week, and every one of you starts with boars." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, new to the valley. You'll walk alone for now, but the day will come when a beast walks with you, and you'll wonder how you managed without it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, fresh in the valley. Gornek won't like it, and neither do I, but the Warchief says you can serve, so you'll serve." },
      },
      choices = {
        { text = "Hana'zua talks about Sarkoth a lot, does he?", next = "dd_sarkoth", when = { killed = { name = "Sarkoth" } } },
        { text = "Are there many priests among the recruits, Kaltunk?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "It must have been hard when the orcs had no shamans.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Will a druid find a place in the Den, Kaltunk?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "You look like you've come a long way to Durotar.", next = "came" },
        { text = "What happens in the valley?", next = "valley" },
        { text = "I doubt the Darkspear get the same welcome as orcs.", next = "troll", when = { race = "Troll" } },
        { text = "I was born in the camps too.", next = "campborn", when = { origin = "orc_camp_born" } },
        { text = "I wasn't sure the Horde had a place for rogues.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The orcs here don't seem to trust the arcane.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do warriors start with boars, Kaltunk?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What should a new hunter tame first, Kaltunk?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why won't Gornek like a warlock, Kaltunk?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do I belong in the Valley of Trials, Kaltunk?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'm on my way.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Ask it quickly; there's more new blood coming up the road behind you." },
        { id = "h_again2", text = "Go on, then. Gornek can wait a moment, though don't tell him I said so." },
      },
    },
    troll = {
      lines = {
        { id = "tr_default", text = "The same welcome, and the same boars, and the same Gornek shouting at you. Your people bled beside us on the crossing, troll, and nobody in this valley gets to forget it." },
        { id = "tr_sailed", when = { origin = "troll_sailed_with_thrall" },
          text = "You were on the ships with us? Then you've earned your welcome twice over, and if any orc in the Den says otherwise, send him to me." },
      },
      choices = {
        { text = "Then the Darkspear will earn it again.", next = "BACK", reply = "You will, and the valley will remember it. The Darkspear bled for Thrall on the Echo Isles, and no orc here forgets that.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Welcomes are words. I'll trust the orcs who fight beside me.", next = "BACK", reply = "Then fight beside them, and they'll trust you back. Every grunt in this valley earned his trust the same way, troll.", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
        { text = "You must have known some Darkspear on the crossing.", next = "troll_crossing" },
      },
    },
    troll_crossing = {
      lines = { { id = "tc_default", text = "One, a tall fellow who could gut a fish faster than I could draw breath. He's at Sen'jin now, I think. Ask Master Gadrin; he knows every troll who came ashore." } },
      choices = { { text = "I'll ask him.", next = "BACK" } },
    },
    campborn = {
      lines = { { id = "cb_default", text = "Then you know the smell of those pens, and you know why I stand at this gate. Nobody greeted us when the humans opened the doors, and I swore that every orc who came after would get a name and a road." } },
      choices = { { text = "Thank you, Kaltunk.", next = "BACK", fx = { affinity = 3 } } },
    },
    valley = {
      lines = { { id = "v_default", text = "Boars, scorpids and cultists in the northern caves. You'll fight all three, and you'll come out the other end Horde, or you won't." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    came = {
      lines = {
        { id = "c_camps", text = "Out of the camps, like most of us, and then across the sea to this red land with the Warchief. I've been greeting new blood ever since, because somebody greeted me once, and I remember who." },
      },
      choices = { { text = "I'll remember you, then.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Gornek; I just point the way. Lok'tar, recruit." } },
    thrall = { { id = "tp_thrall", text = "The Warchief wants every new orc to start here, where the land tests you before the enemy does. So here I stand, greeting them, and I've not grown tired of it yet." } },
    internment = { { id = "tp_internment", text = "I came out of the camps with nothing, and somebody met me at the gate with water and bread. I don't remember his name, but I remember his face, and I try to be him." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Blade are in the caves to the north, and they still worship the demons who cursed us. Kill them, and you'll be doing the whole Horde a favour." } },
    darkspear = { { id = "tp_darkspear", text = "The trolls are our allies now, and you'll find them sharing the valley with you. Be polite, and they'll be polite back." } },
  },
}

P:NPC {
  key = "gornek", id = TODO_NPC("Gornek"), name = "Gornek",
  bible = "bibles/durotar.md", role = "soldier", tier = "major",
  communities = { "valley_of_trials" }, temper = { "hard" }, values = { "stern", "dutiful" },
  notices = { "greenness", "class", "origin" },
  impression = {
    first = "The first lesson, to him, is getting back up.",
    third = "{name} met Gornek, the hard orc who runs the Den in the Valley of Trials and makes Horde out of whoever walks in.",
  },

  greetings = {
    { id = "g_den", text = "Stand up straight, recruit. The valley is watching you, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You're back on your feet, and that's the first lesson. Most never learn it." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, are you? You're still on your feet, so the lesson stuck." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You walked out of my Den a whelp and now you're carrying scars worth having. Don't let it go to your head, because the next lesson is harder." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "The recruits say you made someone in the valley back down. A hard stare is a good tool, but don't mistake it for strength." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "Soft hands, I see. That'll change, along with everything else soft about you, here." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, in my Den. The Burning Blade wear your colors in the caves north of here. Prove you aren't one of them." },
    { id = "n_frostwolf", cat = "origin", when = { origin = "orc_frostwolf" },
      text = "Frostwolf, by the fur on you and the way you sniff the wind. Your clan never drank the blood, so you'll be the only one in my Den who doesn't need the first lesson on what the old ways were." },
  },

  start = "hello",
  nodes = {
    dd_tiragarde = {
      lines = {
        { id = "dd_tir_default", text = "I heard, and I told the new recruits about it too, so they'd know what the Den turns out when it does its job. You came in here swinging at boars, and now the humans on our coast fear you. How did it feel to fight real soldiers?" },
      },
      choices = {
        { text = "It felt right. That's what the Den trained me for.", next = "BACK", reply = "Then the Den did its work, and so did you. Go on, and keep making me look good in front of Gar'Thok.", fx = { align = { order = 1 } } },
        { text = "Harder than boars, and not as clean as the Den taught.", next = "BACK", reply = "It's never clean, recruit, and anyone who tells you otherwise has never stood in a shield wall. You'll learn the rest the way we all did.", fx = { align = { order = -1 } } },
        { text = "Something else, Gornek.", next = "BACK" },
      },
    },
    xalt_gornek = {
      lines = {
        { id = "xalt_gornek_default", text = "Hundreds come through the Den, and I forget most of them by the next moon. The one you mean did the work without complaining, so I remember them, and few recruits earn that." },
        { id = "xalt_gornek_kin", when = { alt = { kin = true } }, text = "{alt} grumbled about the scorpids the whole time but brought back every tail I asked for. If you're kin, I expect the same, and I'll be counting." },
      },
      choices = {
        { text = "Hard work is the only honest way to earn a place.", next = "BACK", reply = "That's right, and you'll go far for knowing it. Do the work, and I'll remember you too.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "There's always a quicker way, if you look for it.", next = "BACK", reply = "There usually is, and it usually bites you later. Do the work, recruit, or I'll find you more.", fx = { align = { honor = -1 } } },
        { text = "Something else, Gornek.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It's made Horde of stranger things than you. The Silver Hand made orcs into prisoners, and the Valley makes prisoners' sons into warriors. If it can turn the Light into something that serves the Horde, then it's done its best work yet." } },
      choices = {
        { text = "Then I'll serve the Horde with the Light.", next = "BACK", reply = "Then the Valley's done its best work yet. Serve well, and I'll stop calling you new.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light serves no Horde. It serves me.", next = "BACK", reply = "The Light can serve you all it likes, but you serve the Horde in my Den. Don't forget it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The same as everyone, which is getting back up after you're knocked down, and helping the next one up after you. A priest who can do both will never want for friends in the Horde, though I'll still shout at you." } },
      choices = {
        { text = "Then I'll help the next one up, every time.", next = "BACK", reply = "That's the Horde's way. Frang will still shout, but he'll mean it kindly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get up myself. Others can manage on their own.", next = "BACK", reply = "Then you'll be alone when you can't get up. Help the next one, recruit, and they'll help you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Same work, different approach, because the Den doesn't care how you get it done. Kill what needs killing and bring back what I ask for, and nobody in the Valley will ask whether you did it in the open." },
      },
      choices = {
        { text = "Same work, done honestly. I'll not cut corners.", next = "BACK", reply = "I'll respect that. The last recruit who cut corners in this valley spent a week cleaning boar pens for it.", fx = { align = { honor = 1 } } },
        { text = "However it gets done, it gets done. That's all.", next = "BACK", reply = "That's the Den's way, and you'll fit in fine. Bring me what I asked for.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "That you can tell the spirits' voice from your own anger. The ones who drank Mannoroth's blood thought the power was theirs, and the whole Horde paid for their pride, so I'll be watching to see that you ask before you take." } },
      choices = {
        { text = "I'll ask the spirits humbly, and never simply take.", next = "BACK", reply = "Then you'll be the kind of shaman Thrall wants. Go and ask, and listen hard when they answer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power answers whoever is strong enough to grab it.", next = "BACK", reply = "That's what Ner'zhul thought, and look where it got us. Ask first, shaman, or you'll learn the hard way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The same as it expects of anyone, which is that you work, you fight and you don't complain about the food. Druid or grunt, a recruit who does all three becomes Horde, and one who doesn't goes back the way they came." } },
      choices = {
        { text = "Then I'll work and fight like any other recruit.", next = "BACK", reply = "That's all I ask of you. Do the work, take the knocks, and you'll be Horde soon enough.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll serve the Horde, but in my own way, not the Den's.", next = "BACK", reply = "Your own way, then, but in my Den you do it the Den's way. Learn that first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_tiragarde", tags = { "news" }, when = { questDone = TODO_QUEST("Vanquish the Betrayers") },
          text = "Gar'Thok's runner says one of my recruits helped clear the Kul Tirans out of Tiragarde Keep, and I'd wager my axe it was you. The Den made you, so don't shame it now that you've got a name." },
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "Another {altrace} with your face came through the Den, a {altclass} named {alt}, and I made them clear a whole nest of scorpids before I let them leave. If that's your kin, they'll have warned you I don't go easy." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true } },
          text = "I still hear {alt}'s name now and then, the {altclass} I put to work in this valley before they went on to bigger things. Every recruit who makes something of themselves makes my job look easier." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The Valley makes Horde out of whatever walks in, and today that's you. Let's see how long it takes." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Den makes Horde out of whatever walks in, and I'll be glad when what walks in can mend the rest of them." },
        { id = "h_default", key = true,
          text = "I'm Gornek, and I run the Den. The Valley of Trials makes Horde out of whatever walks in, though some days that takes longer than others." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Wayward Weapons") },
          text = "Recruits keep dropping their training weapons out among the boars, and Kzan Thornslash, our weaponsmith, needs every one back. Go and pick up after your betters." },
        { id = "h_sarkoth", when = { questActive = TODO_QUEST("Sarkoth") },
          text = "Sarkoth, the big scorpid on the plateau, has been killing recruits for too long. If you've seen what he did to Hana'zua, you've seen why it ends with you." },
        { id = "h_parchment", when = { any = { { questActive = TODO_QUEST("Glyphic Parchment") }, { questActive = TODO_QUEST("Tainted Tablet") } } },
          text = "Your trainer left word for you. Read it, then go and find them. The Horde has a place for what you can do." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out of my Den. The first lesson still holds for you, because the spirits won't pick you up when you fall, so learn to get up yourself." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, in my Den. The first lesson holds even for someone who can grow claws, because a bear that can't get back up is only a rug." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. Every season I get a few who think the Den's for warriors only, and every season they prove me wrong somewhere in the scrub." },
      },
      choices = {
        { text = "I helped Gar'Thok at Tiragarde Keep, Gornek.", next = "dd_tiragarde", when = { questDone = TODO_QUEST("Vanquish the Betrayers") } },
        { text = "Someone close to me came through the Den, Gornek.", next = "xalt_gornek", when = { alt = true } },
        { text = "What does the Den expect from a priest, Gornek?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What should a young shaman prove to you, Gornek?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the Den expect of a druid, Gornek?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What do I need to prove?", next = "prove" },
        { text = "What do the grunts say about the Forsaken?", next = "forsaken_op" },
        { text = "Teach me to fight, then. That's what I came for.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'm no cultist, Gornek. My power answers to me.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "An orc with a spellbook. Say what you're thinking.", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "My people hunted the jungles long before this valley.", next = "headhunter", when = { race = "Troll", class = "HUNTER" } },
        { text = "I'd guess a rogue gets different work than a warrior.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can the Valley make Horde of a paladin, Gornek?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll get to work.", next = "END", fx = { affinity = 1, standing = { valley_of_trials = 1 } } },
      },
      again = {
        { id = "h_again", text = "Something else, recruit? Make it quick, because the boars aren't going to wait for you." },
        { id = "h_again2", text = "Speak. I'd rather hear it now than find out later you were too proud to ask." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "Then you'll hear it from me before anyone else. A warrior who swings first and thinks second dies in his first real fight, so you'll learn to take a blow on the shield before I let you near anything that bleeds." },
        { id = "wa_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "Razor Hill already has its eye on you, I hear. Good, but Gar'Thok won't want a grunt who falls over, so we start with standing up again." },
      },
      choices = {
        { text = "Why the shield before the blade?", next = "warrior_why" },
        { text = "A good warrior ends the fight before it starts.", next = "BACK", reply = "Ending it before it starts is good, but you need to know how to take a hit first. Shield up.", fx = { align = { honor = -1 } } },
        { text = "I'll take the hits and stay standing.", next = "BACK", reply = "That's the first lesson and the hardest. The boars out there hit harder than I do, so stay on your feet.", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    warrior_why = {
      lines = { { id = "ww_default", text = "Because the first lesson is getting back up. In the camps the guards beat us until we stopped getting up, and the Warchief was the first one I saw who never stopped. Every warrior I train learns that before they learn anything else." } },
      choices = { { text = "Then I'll learn it first.", next = "BACK", fx = { affinity = 2 } } },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "So every cultist in that coven told himself, right up until his power started answering to something else. I watched orcs drink that fire once, and I'm still burying the ones it ruined." },
        { id = "wl_troll", when = { race = "Troll" },
          text = "A troll who whispers to demons, and that's new to me. The Darkspear had their witch doctors, but I never heard of one calling up imps, and I'd like to know who taught you." },
      },
      choices = {
        { text = "I'll use it against the Blade and nothing else.", next = "BACK", reply = "Good, and I'll be watching to make sure, every day you're in my valley.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. The Horde should use what it has.", next = "BACK", reply = "That's exactly what the old warlocks said, and I buried their victims. Watch yourself.", fx = { affinity = -2, align = { light = -1 } } },
        { text = "What did you see it do to them?", next = "warlock_saw" },
      },
    },
    warlock_saw = {
      lines = { { id = "ws_default", text = "Green eyes in faces I'd known all my life, and a hunger that never filled. Zureetha uses the same art you do and hates the Blade more than I do, so go and listen to her before you listen to them." } },
      choices = { { text = "I'll speak with Zureetha.", next = "BACK" } },
    },
    orcmage = {
      lines = {
        { id = "om_default", text = "I'm thinking our people already burned once for reaching after power we didn't understand. You'll get no trouble from me if you work hard, but the grunts will test you, so don't give them a reason." },
        { id = "om_primer", when = { origin = "orc_camp_primer" },
          text = "A human guard's primer, I heard, read by candle stub in the camps. Clever, and the grunts will hate that you learned it from them, so you'd better be good with it." },
      },
      choices = {
        { text = "It's a tool, like an axe. I'll prove it.", next = "BACK", reply = "Prove it, then, and I'll stop thinking about the old days. Work hard, and the grunts will come around.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them test me. I'll do things my own way.", next = "BACK", reply = "They will, and you'll learn something about the Horde from it. Your own way is fine, as long as it works.", fx = { align = { order = -1 } } },
      },
    },
    headhunter = {
      lines = { { id = "hh_default", text = "I've seen your people throw a spear, and I wouldn't want to be the boar. Kill clean out there and show these orc recruits how it's done, and they might stop complaining about trolls in the Den." } },
      choices = { { text = "They'll see.", next = "BACK", fx = { affinity = 2 } } },
    },
    forsaken_op = {
      lines = { { id = "fo_default", text = "Plenty, and most of it not fit for the Den. The Warchief says the Dark Lady's dead are Horde now, and some of my grunts won't spar with anything that smells of the grave, so tell me, recruit: would you stand shoulder to shoulder with one?" } },
      choices = {
        { text = "If they bleed for the Horde, they're Horde.", next = "fo_trust", fx = { affinity = 2, align = { order = 1 }, opinion = { forsaken = "trust" } } },
        { text = "The dead fight for the dead. I'd watch my back.", next = "fo_distrust", fx = { align = { order = -1 }, opinion = { forsaken = "distrust" } } },
        { text = "I'd stand with anyone who gets back up.", next = "fo_up", fx = { affinity = 2, opinion = { horde = "loyal" } } },
        { text = "I'll ask the Forsaken that, once I've met one.", next = "BACK" },
      },
    },
    fo_trust = {
      lines = { { id = "fot_default", text = "Good, then you can spar with the first one that comes through the Den, and show the others it doesn't rub off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fo_distrust = {
      lines = { { id = "fod_default", text = "Watch your back by all means, recruit, but watch it from the same side of the line as them. The Scourge won't care which of you it eats first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fo_up = {
      lines = { { id = "fou_default", text = "Ha! The dead got back up once already, so by that rule they're the best recruits I'll ever have. I'll tell the grunts you said it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    prove = {
      big = true,
      lines = {
        { id = "p_default", text = "That you'll get back up. Strength comes later. Anyone can swing an axe; not everyone stands again after the first one hits them." },
      },
      choices = {
        { text = "I'll stand, and I won't run.", next = "BACK", reply = "Good, that's all the Den asks of anyone. Stand, and keep standing when the boars charge.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'd rather not get hit in the first place.", next = "BACK", reply = "So would everyone, recruit, but it doesn't work that way. You'll get hit, so learn to stand after.", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Recruits talk in the Den when they think I'm asleep, and I never am. Ask about these, and then listen." },
    },
    burning_blade = { { id = "tp_blade", text = "There are cultists in the coven to the north, calling up imps. Zureetha deals with them, and you'll help her." } },
    thrall = { { id = "tp_thrall", text = "The Warchief sends every new recruit to me, and he expects each of them to get back up. I've never let him down yet, and I don't intend to start with you." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, and I was in the camps after. The Den is better than either, though the recruits don't believe me." } },
    internment = { { id = "tp_internment", text = "The camps were a sickness of the spirit, not just the body, and many orcs never woke from it. Thrall woke us, and that's why I serve him." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear came with Thrall from the islands, and they train with us here in the Den. Treat them as brothers, because the Warchief does." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar are beyond the ridge, and you'll meet them soon enough. Learn here first, and learn it well, because the centaur won't wait for you." } },
    _none = { { id = "tp_none", text = "That's not your concern yet, recruit. Finish the valley first, and let your deeds do your asking." } },
  },
}

P:NPC {
  key = "zureetha", id = TODO_NPC("Zureetha Fargaze"), name = "Zureetha Fargaze",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "watchful" }, values = { "sharp", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Her contempt for cultists who want the old fire back is fierce.",
    third = "{name} met Zureetha Fargaze, who watches the Burning Blade's caves in the Valley of Trials and sends recruits to thin their ranks.",
  },

  greetings = {
    { id = "g_blade", text = "The Burning Blade crawl out of their caves after dark, and last week they cut a peon's throat over a sack of cactus apples. Help me put a stop to it." },
    { id = "g_back", when = { metBefore = true }, text = "You've been north? Tell me what you saw, all of it." },
    { id = "g_bb_unfolding", when = { thread = { id = "burning_blade", state = "unfolding" } }, text = "Orgnil Soulscar sent word from Razor Hill that the cult's orders come written in a careful, educated hand, and I suspect it belongs to someone in Orgrimmar. Tell me what else you've seen." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the Blade has been busy in that time. Tell me you've seen something useful." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in the valley went away furious after talking with you. I don't much care who you anger, so long as it isn't the people fighting the Blade." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. The Blade will try to tempt you; they try with every one of us. Say no, and keep saying it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Every power is dangerous if you let it own you. The Burning Blade let the fel own them; the Silver Hand let the Light make them jailers. Don't let it own you, and point it at the caves to the north." } },
      choices = {
        { text = "I'll master it, and burn the cultists.", next = "BACK", reply = "Master it, then, and point it at the Blade. They taught half their imps to bite the ones who called them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light owns me already. I'm glad of it.", next = "BACK", reply = "Then be glad, but watch it closely. Every warlock I've buried told me they were glad of it once.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Prayer alone won't, but a priest who keeps the recruits alive while they burn out the caves will do more than any prayer. I've watched too many young ones die in that smoke, so if you're going north, keep them breathing." } },
      choices = {
        { text = "Then I'll keep them breathing until the caves are clean.", next = "BACK", reply = "Thank you, priest, and the young ones will thank you too. Keep them breathing, and I'll handle the cultists.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The weak ones die in the smoke. That's the valley's way.", next = "BACK", reply = "It is, and I hate it. Keep them breathing if you can, priest, because the valley needs every one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Cultists, imps and Yarrog Baneshadow, if I'm right about who leads them, and I usually am. They chant over their fires and call imps in the dark, so go in with your blade ready, and don't let any of them finish a spell." } },
      choices = {
        { text = "I'll cut them down for the Horde's honour.", next = "BACK", reply = "Good, and the Horde will remember it. Cut them down before they finish their chants, or you'll be fighting their imps as well.", fx = { align = { honor = 1 } } },
        { text = "I'll take what they've hoarded and leave the rest.", next = "BACK", reply = "Then take it, but kill them first. Their hoard won't do you any good with an imp at your throat.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I've missed where the imps go at night, mostly, because they slip out of the caves and come back with things in their claws. A tracker could follow them up the ridges and tell me if the Burning Blade have another way in, and that would be worth more to me than a dozen dead cultists." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I've missed where the imps go at night, mostly, because they slip out of the caves and come back with things in their claws. Keep your {pet} quiet up on the ridge. Imps squeal at the smell of a beast, and then the whole cave knows you're there." },
      },
      choices = {
        { text = "I'll follow the imps and report back, nothing more.", next = "BACK", reply = "That's exactly what I need. Follow carefully, and come back alive.", fx = { align = { order = 1 } } },
        { text = "Why follow them? I'll kill them where they stand.", next = "BACK", reply = "Kill them, then, but the next imp will find another way. I need to know where they go.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Their numbers, and the name of whoever leads them, though I suspect it's Yarrog Baneshadow. Bring me what you learn, and don't start a fight you can't finish, because the imps in there swarm the careless." },
      },
      choices = {
        { text = "Numbers and a name. I'll report back carefully.", next = "BACK", reply = "Numbers and a name, that's all I need. Leave the killing to the ones I send after.", fx = { align = { order = 1 } } },
        { text = "I'll finish Yarrog myself if I get the chance.", next = "BACK", reply = "If you get the chance, take it, but don't go looking for it. Yarrog's dangerous.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It could, because the Blade's imps burn just as well as anything else. I keep my own demons watching them too, though, so don't be surprised if I trust my own hand over yours when it counts." },
      },
      choices = {
        { text = "Fair. Together, we'll keep the Valley safe.", next = "BACK", reply = "Then we're agreed. Two hands are better than one, even if I trust my own more.", fx = { align = { honor = 1 } } },
        { text = "My hand will be the one that ends it.", next = "BACK", reply = "Then make sure it's the right one, and don't miss. I'll be watching.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The scrub around the cave mouths has gone grey and brittle, and the beasts that drink from the pools there come out wrong. The Blade want the old fire back, and this is what it does to a land, so they're showing us exactly what they'd make of Durotar." } },
      choices = {
        { text = "They'll get a clean fight and a quick end, nothing crueller.", next = "BACK", reply = "Clean is enough, and more than they deserve. End them quickly.", fx = { align = { honor = 1 } } },
        { text = "Burn them out of those caves however it has to be done.", next = "BACK", reply = "However it has to be done, then. The land will thank you either way.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You've the same look about the eyes as {alt}, who went up into the Burning Blade's caves for me and came back smelling of brimstone. I hope you're as stubborn, because those cultists haven't gotten any friendlier." },
        { id = "h_alt_lock", tags = { "news" }, when = { alt = { class = "WARLOCK" } },
          text = "That {altclass} {alt} watched the Burning Blade's rituals a little too closely for my liking when they came through. I'll say to you what I said to them: study the fel if you must, but never let it study you back." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I watch cultists who want the old fire back, so I know a dangerous power when it walks in." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Burning Blade want the old fire back, the one that nearly burned us down, and I'd like to see what your prayers make of that." },
        { id = "h_default", key = true,
          text = "I'm Zureetha Fargaze. The Burning Blade have taken the caves to the north and they're spilling into the valley, so I watch them, and I send recruits to thin them." },
        { id = "h_familiars", when = { questActive = TODO_QUEST("Vile Familiars") },
          text = "The Blade's pet imps swarm the north end of the valley. Kill them before they set the scrub alight." },
        { id = "h_medallion", tags = { "news" }, when = { questActive = TODO_QUEST("Burning Blade Medallion") },
          text = "Their leader in the coven wears a medallion. Bring it to me. I want to see whose mark is on it." },
        { id = "h_senjin", when = { questActive = TODO_QUEST("Report to Sen'jin Village") },
          text = "Your time in the valley is done. Go south to Sen'jin and find Master Gadrin, and try not to embarrass us." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! Good, because the Burning Blade have sentries in the caves and I need someone who can get past them unseen." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, out here watching the caves with me? Your magic is a cleaner thing than the Blade's, and I'll be glad of it beside me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The Burning Blade in the caves to the north won't fall to watching, so you're exactly what I needed." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, with sharp eyes, I hope. I've watched those caves for days, and I could use someone who notices what I've missed." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. The Burning Blade's fel magic is souring the ground around those caves to the north, and you'll feel it there, if your kind feel what they say they do." },
      },
      choices = {
        { text = "The fel sickness around the caves looks bad, Zureetha.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Prayer can stand against the Burning Blade's fire, Zureetha.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "You draw on the same power the Blade do, don't you?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The spirits here feel sick near those caves.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "What do you need from inside the Blade's caves?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could the arcane help you fight the Burning Blade?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What waits in the Burning Blade caves, Zureetha?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What have you missed in the caves, Zureetha?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Some say the Light is dangerous, Zureetha.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll go north.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, because the imps are thicker after sundown." },
        { id = "h_again2", text = "Ask, then. I'd rather you knew too much about the Blade than too little." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "The same power, yes, and that's exactly why I hate them. They've made every orc who touches the dark a suspect, and I'll spend my life proving a warlock can bind a demon without kneeling to it." },
        { id = "wl_cleft", when = { origin = "orc_cleft_initiate" },
          text = "You've been down to the Cleft of Shadow already? Then you've met the smiling ones there, and you'll know some of them miss the old fire far too much. Learn their spells, but keep your own counsel." },
        { id = "wl_troll", when = { race = "Troll", class = "WARLOCK" },
          text = "A Darkspear warlock, which the old orcs will find stranger than I do. If the voice you listen to isn't a loa, be very sure you know what it is before you answer it." },
      },
      choices = {
        { text = "A demon is a tool. I bind it, it serves.", next = "warlock_bind" },
        { text = "I'll never kneel. You have my word.", next = "BACK", reply = "Then you'll be one of the few who keeps it. I'll hold you to that word.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Maybe the Blade understand something the rest of us fear.", next = "BACK", reply = "They understand that power is hungry, and they feed it with their own people. I saw what that did to the clans, and I'll not watch it again.", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    warlock_bind = {
      lines = { { id = "wb_default", text = "That's what the first warlocks said, back in Draenor, and they said it right up until the day they woke up serving. Bind it, yes, but never forget it's waiting for you to slip." } },
      choices = { { text = "I won't forget.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "They would be, with the Blade calling fel things up through the rock. Thrall's shamans are trying to heal this land, and the Blade are tearing holes in it, so every imp you kill is a stitch in the wound." } },
      choices = { { text = "Then I'll stitch it closed.", next = "BACK", fx = { affinity = 2 } } },
    },
    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Orcs who never let go of the old fire. The Warchief broke the demons' hold on us, and these fools want it back. I won't let them have it." },
      },
      choices = {
        { text = "Neither will I.", next = "BACK", reply = "Good, then we stand together. Go to the coven and burn them out.", fx = { affinity = 2, align = { light = 1 }, learn = { "burning_blade" } } },
        { text = "The old fire made the Horde strong, whatever it cost.", next = "END", reply = "Strong, and cursed, and enslaved. Get out of my sight, and pray I never find you in those caves.", fx = { align = { light = -1 }, learn = { "burning_blade" } } },
      },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "They hide in caves because they know what we'd do to them in daylight." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Blade wants the demons back, the same ones whose blood we drank, and who gave us fire for it. I'd sooner drink scorpid venom." } },
    thrall = { { id = "tp_thrall", text = "The Warchief cleansed us of the demon curse, and every cultist in those caves is spitting on his gift. I'll see them burned for that." } },
    dark_portal = { { id = "tp_dark_portal", text = "We came through the Dark Portal from a dying world, and the demons came with us, quietly. Some of them never left, and the Burning Blade are their children." } },
    _none = { { id = "tp_none", text = "I don't know, but I know the Blade, so ask me about them." } },
  },
}

P:NPC {
  key = "thazzril", id = TODO_NPC("Foreman Thazz'ril"), name = "Foreman Thazz'ril",
  bible = "bibles/durotar.md", role = "worker", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "exasperated" }, values = { "practical" },
  notices = { "idle" },
  impression = {
    first = "His peons' talent for napping exasperates and almost impresses him.",
    third = "{name} met Foreman Thazz'ril, who struggles to keep the sleepy peons of the Valley of Trials gathering lumber.",
  },

  greetings = {
    { id = "g_peon", text = "You! You not be a peon, are you? Good, mon, because I got plenty of those, and they all be asleep." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the one who can stay awake. A rare sight in dis camp, mon." },
  },

  notice = {
    { id = "n_peon", cat = "idle", when = { race = "Orc", maxLevel = 3 },
      text = "Hmm. You got the look of someone who'd nap behind a lumber pile, mon. Prove me wrong." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Ha! I'd pay to see it, mon. But don't, because half of them were born to parents who remember the Light in the camps, and I'd have a riot instead of a nap. Just walk past and look holy, and they'll work out of nerves." } },
      choices = {
        { text = "I'll leave them in peace. They've earned rest.", next = "BACK", reply = "Ha! A kind one, by the loa, and the peons will love you for it. Walk soft past them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A little fright will do them good.", next = "BACK", reply = "By the loa, I'd love to see it, but I'd lose a week of lumber. Go on, then, give them a little scare.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "If it gets them gathering lumber, you can pray over them all day. They'd sleep through it, mind, because I once watched one nap through a scorpid crawling up his back, and by the loa, I was almost proud of him." } },
      choices = {
        { text = "Let them rest, Foreman. Tired hands make poor work.", next = "BACK", reply = "You sound like a peon, mon, but maybe you're right. Let them nap, and I'll shout later.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Work comes first. Wake them, and I'll pray after.", next = "BACK", reply = "Ha! Now we talk the same language, mon. Wake them, and pray all you like.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bother them? The peons sleep through boar charges, which tells you everything. The beasts leave my workers alone because they're too dull to be worth biting, so the only thing that wakes them is me shouting, and even that's wearing off." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bother them? The peons sleep through boar charges, mon, but your {pet} could make itself useful. One good snarl and half my lumber crew would be on their feet." },
      },
      choices = {
        { text = "Treat the peons kindly, Foreman, and they'll work harder.", next = "BACK", reply = "Kindly? I tried kindly, mon, and they slept through it. But maybe you have a gentler hand.", fx = { align = { honor = 1 } } },
        { text = "Set my beast on them, then. That'll teach them.", next = "BACK", reply = "By the loa, they'd sleep through a raptor, mon. Try it if you like, but I won't hold my breath.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "No, not much, because peons who are frightened work slower, and then they nap more to recover. Still, if you could conjure a little fresh water for them, it might help them stay awake." },
      },
      choices = {
        { text = "Water, then. No fires for the peons.", next = "BACK", reply = "That be a kindness, mon, and the peons will thank you, between naps. Water's good.", fx = { align = { light = 1 } } },
        { text = "A little fire would wake them. They'd thank me later.", next = "BACK", reply = "They'd thank you, sure, after they put out the fire. Water, mon, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Far more, because every peon grew up hearing about the fel and the old curse. If you want them to work, keep your demon out of sight, and let them think about lumber instead of nightmares." },
      },
      choices = {
        { text = "Out of sight, then. I'll let them work.", next = "BACK", reply = "Good, mon, and they'll work better for it. Your demon can sit by the fire and sulk.", fx = { align = { light = 1 } } },
        { text = "Fear makes them work faster than sleep does.", next = "BACK", reply = "Faster, maybe, but they'd never come back. Keep it out of sight, mon.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Probably, but you not seen how deep these peons sleep, mon. I tried shouting and I tried the blackjack, and if the sky itself can't wake them I give up and let them have the lumber camp." } },
      choices = {
        { text = "Let them nap. Working peons to the bone helps no one.", next = "BACK", reply = "You got a soft heart, mon, and maybe that be the right way. Let them nap, then, and I'll pretend I didn't see.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll save some thunder for them. They've earned a fright.", next = "BACK", reply = "Ha! Save some for me too, mon. If thunder can't wake them, nothin' can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hardly, because they spend more time asleep against the trees than chopping them, and the valley's barely noticed. But there's not much timber in Durotar, and if my peons ever wake up properly, somebody ought to plant some back." } },
      choices = {
        { text = "Lumber builds the Horde's walls. Keep them chopping.", next = "BACK", reply = "They'll chop, mon, eventually. Gornek wants his palisade, and the peons need a lot of shoutin' before they get it built.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the trees be. Your peons might have the right idea.", next = "BACK", reply = "Ha! Maybe they do, mon, but the walls still need building. Plant some trees, if you like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Perfect, mon. Maybe your glow wake my peons up, because nothing else has." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You wouldn't happen to know a prayer for waking up lazy peons, would you, because I've tried everything else." },
        { id = "h_default", key = true,
          text = "I be Foreman Thazz'ril of the Darkspear. My peons be meant to gather lumber, but mostly they gather naps." },
        { id = "h_lazy", tags = { "news" }, when = { questActive = TODO_QUEST("Lazy Peons") },
          text = "Take dis blackjack, mon. Find a sleeping peon, give him a tap, and watch him remember he got a job." },
        { id = "h_pick", when = { questActive = TODO_QUEST("Thazz'ril's Pick") },
          text = "I left my pick in the coven while I was surveying, and it's enchanted, so don't let those cultists keep it." },
        { id = "h_peons", when = { metBefore = true }, text = "I found three peons asleep in the mine cart this morning, mon, in the cart, while it was moving. Even a witch doctor couldn't hex a body that still, and I be almost impressed." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you call a little thunder over the lumber pile, mon? The blackjack works, but a bolt out of a clear sky would keep my peons awake for a week." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Can you make the trees grow faster? Then my peons would have less to chop and less excuse to nap, though I doubt it would stop them trying." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! Could you wake up my peons with a spell? A small fire, perhaps, or a cold breeze? I'm only half joking." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock! Keep that imp away from my peons; they're frightened enough of me already, and I need them awake, not trembling." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, eh? If your beast could wake a sleeping peon, I'd hire it on the spot." },
      },
      choices = {
        { text = "Should I pray over your sleeping peons, Foreman?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The spirits should be called for better things than peons.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your peons might cut more than this valley can spare.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "You could just let them rest.", next = "rest" },
        { text = "I know a few ways to wake a sleeper, Foreman.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Want me to shout them awake instead?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Would you really want me to frighten your peons?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The beasts here must bother your peons, Foreman.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the peons fear warlocks more than you?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Shall I wake your peons with the Light, Foreman?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll wake them.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask fast, mon, before another one of them nods off." },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Do you now? Then you'll know it's a tap you want, not a crack, because a peon who can't stand up can't haul lumber either. Show them some of that light touch your sort is famous for." } },
      choices = {
        { text = "Just a light tap, then. Understood.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Where's the fun in a light tap?", next = "BACK", fx = { affinity = -1, trait = { cruel = 1 } } },
      },
    },
    warrior = {
      lines = { { id = "wr_default", text = "I've tried shouting, and they sleep through it, and I've tried a war drum, and two of them used it as a pillow. Go and try your battle shout on them if you like, but bring the blackjack anyway." } },
      choices = { { text = "Ha. I'll bring both.", next = "BACK", fx = { affinity = 1 } } },
    },
    rest = {
      lines = { { id = "r_default", text = "Rest? Orgrimmar's walls need lumber, mon, and these peons be the only ones meant to fetch it. If they rest any more, the walls be made of snores." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't ask me, mon; ask a peon, and wake him up first." } },
    thrall = { { id = "tp_thrall", text = "The Warchief says peons are the backbone of the Horde. I'd like to see him get them to stay awake." } },
    darkspear = { { id = "tp_darkspear", text = "The trolls work harder than my peons, and they don't even get paid. I don't tell my peons that, because they'd stop working entirely." } },
    second_war = { { id = "tp_second_war", text = "In the Second War, peons built the whole Horde from mud and wood. Now they build naps, and they're very good at it." } },
  },
}

P:NPC {
  key = "galgar", id = TODO_NPC("Galgar"), name = "Galgar",
  bible = "bibles/durotar.md", role = "worker", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "longsuffering" }, values = { "practical", "generous" },
  notices = { "hunger" },
  impression = {
    first = "Nobody thanks the cook, he says, until the pot is empty.",
    third = "{name} met Galgar, the long-suffering cook who feeds the recruits, grunts and peons of the Valley of Trials.",
  },

  greetings = {
    { id = "g_cook", text = "Hungry? Of course you are; everyone in this valley is hungry. The boar's a bit stringy, and I picked most of the scorpid out of it." },
    { id = "g_back", when = { metBefore = true }, text = "Here for seconds? Help me with thirds and we'll talk." },
  },

  notice = {
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "A cook! Then you know nobody thanks us, and everybody notices when we stop." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd feed anyone. The Silver Hand fed us in the camps, gruel and grudges both, and I swore my pot would never be like theirs. Eat or don't, but sit by the fire. That much nobody here will refuse you." } },
      choices = {
        { text = "I'll sit, and thank you for the kindness.", next = "BACK", reply = "You're welcome, and the stew is hot. Sit as long as you like.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll keep my distance. I'm not your guest.", next = "BACK", reply = "Suit yourself, but the fire's warm and the pot's full. The offer stands.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They eat the same, but they complain less, which is a blessing of its own. The trolls always say a word over their bowls, and I've started saying one over the pot too, though I'd thank you not to tell Gornek." } },
      choices = {
        { text = "A blessing honours the food and the cook, Galgar.", next = "BACK", reply = "It does, and I'll keep saying it over every pot. Just don't tell Gornek I've gone soft.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Food is food. A prayer won't make it taste better.", next = "BACK", reply = "Maybe not, but it doesn't hurt either. Eat your stew, and stop complaining.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scorpid meat, boar ribs and whatever the recruits bring back that isn't too charred to eat. A warrior who fights on an empty belly fights badly, so every one of Gornek's grunts gets a bowl before he goes out, whether he thanks me or not." } },
      choices = {
        { text = "Thank you for the meal, Galgar. It matters.", next = "BACK", reply = "It does, and you're welcome. Come back when you're hungry.", fx = { align = { honor = 1 } } },
        { text = "Cooks don't win battles. I'll eat what I find.", next = "BACK", reply = "They don't, but they win warriors back. Eat what you find, but my bowl's always here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not a bit, because I've heard conjured bread tastes like nothing at all. Come and eat with the grunts sometime, and you'll learn more about the Horde over one bowl of stew than in a year of spells." },
      },
      choices = {
        { text = "I'll eat with the grunts. It's worth learning.", next = "BACK", reply = "Good, and you'll be glad you did. Sit with the grunts long enough, and they'll tell you who's worth trusting.", fx = { align = { honor = 1 } } },
        { text = "Conjured bread is fine. I'll eat alone.", next = "BACK", reply = "Suit yourself, but you're missing the best stew in the valley. Come anytime.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I feed everyone who walks into this Den, because hunger doesn't care what you are. Just keep your imp out of the kitchen, and I'll fill your bowl like anyone's." },
      },
      choices = {
        { text = "Agreed. The imp stays away from your pot.", next = "BACK", reply = "You'll eat well, then. The imp can lick the pot outside when the grunts are done.", fx = { align = { order = 1 } } },
        { text = "My imp can eat where it likes, cook.", next = "BACK", reply = "Then it eats outside, and you eat with it. My kitchen, my rules.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My mother did, every night, until the camps took her pot and her fire both. I've got out of the habit, but now and then I toss a scrap of scorpid in the coals, and the fire's never once burned my stew." } },
      choices = {
        { text = "Keep feeding the fire, Galgar. The old ways were good ones.", next = "BACK", reply = "I will, and I'm glad someone remembers. My mother would be pleased.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The fire burns for whoever cooks on it, not for offerings.", next = "BACK", reply = "Maybe, but my stew's never burned once. I'll keep feeding it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Boar, when the recruits bring it back whole, and cactus apples when the season's kind, though it usually isn't. Durotar gives you what it gives you, and a cook who wanted better should have stayed somewhere greener." } },
      choices = {
        { text = "Make do with what Durotar gives. That's the Horde's way.", next = "BACK", reply = "That's the way, and the recruits are tougher for it. Durotar makes us strong.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ask for better. The recruits deserve more than scorpid tail.", next = "BACK", reply = "Ask who, the cactus? I ask every season, and the land answers the same. Bring me better, and I'll cook it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They all try, and they all think I don't notice, but the cook always knows when the pot's lighter. Bring me cactus apples from the valley instead, and you can eat your fill without sneaking." },
      },
      choices = {
        { text = "I'll bring you the apples honestly, Galgar.", next = "BACK", reply = "Good, then you'll eat your fill and nobody sneaks behind my back. That's the best kind of meal.", fx = { align = { honor = 1 } } },
        { text = "A rogue who gets caught isn't much of a rogue.", next = "BACK", reply = "Ha! Then you're not much of one, because I caught you before you started. Bring the apples.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. I don't suppose you eat, but nobody thanks the cook anyway, so I'll offer you scorpid tail and see what happens." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at my fire! Bless the pot if you like; it could use the help, and so could the scorpid tails." },
        { id = "h_default", key = true,
          text = "I'm Galgar, and I feed the Den: recruits, grunts and peons alike. Nobody thanks the cook, but everybody notices when the pot's empty." },
        { id = "h_apples", tags = { "news" }, when = { questActive = TODO_QUEST("Galgar's Cactus Apple Surprise") },
          text = "I need cactus apples from the plants around the valley. It's an easy job, and I make it easy on purpose, because you'll get harder ones soon enough." },
        { id = "h_recipe", when = { metBefore = true }, text = "Scorpid tail, fried, with a pinch of cactus. Don't make that face; you'll be asking for it by next week." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then you know fire better than I do, so don't tell me how to cook with it, and I won't tell you how to call it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at my fire! You'll know which roots out in the scrub are good to eat, I hope, because I'm running out of ways to cook scorpid tail." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! You can conjure your own bread, I hear, so you won't be wanting my cooking. Your loss, because my scorpid tail is famous." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock, keep that imp away from my pot. The last one spat in my stew, and the grunts haven't forgiven me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll eat twice what a hunter does and complain half as much, which makes you my favourite kind of customer." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, eh? Keep your fingers out of the pot, because I count every scorpid tail in it." },
      },
      choices = {
        { text = "Do the recruits eat better after a priest blesses the food?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "You should thank the fire spirits for your cookfire.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you ever cook anything that didn't have a stinger, Galgar?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Where did you learn to cook?", next = "cook" },
        { text = "What's the surprise?", next = "surprise", when = { any = { { questActive = TODO_QUEST("Galgar's Cactus Apple Surprise") }, { questDone = TODO_QUEST("Galgar's Cactus Apple Surprise") } } } },
        { text = "Have you got anything my pet would eat?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Tauren don't eat scorpid where I come from.", next = "tauren", when = { race = "Tauren" } },
        { text = "Do you mind that mages can conjure their own food?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do you feed the recruits, Galgar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Would you still feed a warlock, Galgar?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Rogues must steal from your pot, Galgar.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would you feed a paladin, Galgar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Thanks, Galgar.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Talk while I stir; the pot doesn't stop for anybody." },
      },
    },
    pet = {
      lines = { { id = "pe_default", text = "{pet}, is it? Ha, I've got a whole bucket of boar scraps the recruits won't touch, and that one looks like it isn't fussy. Hunters' beasts are the only ones in this valley who've ever thanked me for a meal." } },
      choices = {
        { text = "A beast that's fed well fights well.", next = "BACK", fx = { affinity = 2 } },
        { text = "It hunts for itself. Keep the scraps.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "A tauren this far east! I hear your people eat mostly plains fowl and roots, so you'll find scorpid a bit crunchy. Give it a week, though, and you'll be asking for the tail like everyone else." } },
      choices = { { text = "I'll try one, but only one.", next = "BACK", fx = { affinity = 2 } } },
    },
    surprise = {
      lines = { { id = "s_default", text = "The surprise is that it tastes good. Nobody expects that from a cactus." } },
      choices = { { text = "...", next = "BACK", fx = { affinity = 1 } } },
    },
    cook = {
      lines = {
        { id = "c_camp", text = "In the camps, where you learn to make something out of nothing or you starve. Out here we've got scorpids, and that's not nothing; that's practically a feast." },
      },
      choices = { { text = "I'll try the scorpid.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm a cook. Ask me about cactus apples." } },
    thrall = { { id = "tp_thrall", text = "The Warchief ate my scorpid stew once, and he said it was very filling. I've chosen to take that as praise." } },
    darkspear = { { id = "tp_darkspear", text = "The trolls eat anything, and I mean anything, and they always come back for seconds. I like a troll in my kitchen." } },
    centaur = { { id = "tp_centaur", text = "I've never cooked centaur, and I'm not about to start. Some meat is just too close to people." } },
  },
}

P:NPC {
  key = "kzan", id = TODO_NPC("Kzan Thornslash"), name = "Kzan Thornslash",
  bible = "bibles/durotar.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "curt" }, values = { "practical" },
  notices = { "kit" },
  impression = {
    first = "He is curt and charges for everything, but he knows his trade.",
    third = "{name} met Kzan Thornslash, the curt weaponsmith who keeps the recruits of the Valley of Trials armed.",
  },

  greetings = {
    { id = "g_shop", text = "Weapons or repairs, so pick one, pay, and move along. And don't bleed on the grindstone, grunt; blood rusts it." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that. Hand it over, and no, I'm not doing it for free." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I arm anyone with coin. Plenty of recruits have dropped weapons in the scrub, and I suspect you'll drop yours too. The old grunts won't like seeing a paladin's hammer in the Valley, but they don't buy from me, so I don't care." } },
      choices = {
        { text = "I'll pay a fair price for a good hammer.", next = "BACK", reply = "Then you'll get a good hammer. I don't sell a bad one to anybody, not even the goblins.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Give me the cheapest one. I'll make it holy.", next = "BACK", reply = "Make it holy, sure, but it'll still break on the first scorpid. Pay a little more.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Everyone asks that, and the answer's no, because a discount for one is a discount for all. That said, a healer who's kept my customers alive has kept my trade alive, so I'll throw in a strap for your mace and call it even." } },
      choices = {
        { text = "A fair price is fair to everyone. I'll pay it.", next = "BACK", reply = "Then we understand each other, and you're welcome back at my stall any time.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Healers deserve better than your fair price, Kzan.", next = "BACK", reply = "Maybe they do, but I've a family in Orgrimmar to feed, and fair is all I can do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Arrows, a spare bowstring and something sharp for when the boar gets past your beast, which it will. The recruits drop their weapons in the scrub all day long, but hunters lose arrows faster than anyone, so buy more than you think you'll need." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Arrows, a spare bowstring and something sharp for when the boar gets past your beast, which it will. Your {pet} keeps sniffing my crates. There's nothing to eat in there, I promise, unless it likes leather straps." },
      },
      choices = {
        { text = "I'll gather my arrows back. Waste helps no one.", next = "BACK", reply = "A careful hunter. You'll save more coin than the others, and you won't lose half your quiver in the cactus.", fx = { align = { order = 1 } } },
        { text = "Arrows are cheap. I'll shoot and move on.", next = "BACK", reply = "Then you'll be back here every week, and I'll be glad of it. Shoot all you like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "More than the recruits do, which is saying something, because mages don't think about weapons until they need them. Buy a staff, keep it close, and don't leave it in the scrub where the quilboar will chew it." },
      },
      choices = {
        { text = "A staff, kept close. I'll take your advice.", next = "BACK", reply = "Good, and keep it close. Quilboar love to chew on staves, and you'll want it in your hands when they do.", fx = { align = { order = 1 } } },
        { text = "Spells are my weapon. A staff is decoration.", next = "BACK", reply = "Decoration until a boar reaches you, and then it's the best thing you own. Buy one anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I sell to anyone the Den trusts, and Gornek's let you in, so you'll get the same price as anybody. Just keep your demon's claws off my stock, because I've enough trouble with recruits dropping things." },
      },
      choices = {
        { text = "Fair. I'll keep the imp's claws to itself.", next = "BACK", reply = "Then you'll get the same price as anybody. Keep its claws off my anvil.", fx = { align = { order = 1 } } },
        { text = "My imp does as it pleases, Kzan.", next = "BACK", reply = "Then it pays for anything it breaks, and so do you. Keep it away from my stock.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Often enough, because a mace that's been struck by its owner's lightning comes back to me blackened and cracked at the haft. I mend them, and then I tell the shaman to stop hitting things with the sky and the hammer at the same time." } },
      choices = {
        { text = "A good weapon deserves care. I'll be gentler with mine.", next = "BACK", reply = "Then I'll be mending fewer cracked hafts, and you'll be swinging a straighter one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Weapons break, Kzan, and that's what smiths are for.", next = "BACK", reply = "And I'll mend them, at my price. But a careful shaman visits my anvil a good deal less often.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because the boars in this valley don't wait for you to finish changing shape, and a staff across the snout buys you the moment you need. Lose it in the scrub like the recruits do and you'll be buying another, at the same price." } },
      choices = {
        { text = "Fair price for fair work. I'll pay it.", next = "BACK", reply = "That's all I ask. Keep it oiled and dry, and you won't need another for a long while.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take one off a dead quilboar instead, and pay nothing.", next = "BACK", reply = "Then you'll be fighting a quilboar for it, and they don't give up their staves easily. Good luck.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. You'll want a hammer, I suppose, and you'll pay for it like everyone else." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I'll sell you a mace, and I'll charge you for it, because the Light or the loa don't pay my rent." },
        { id = "h_default", key = true,
          text = "I'm Kzan Thornslash, and I keep the recruits armed while they keep dropping their weapons in the scrub. One of those jobs is harder than the other." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Wayward Weapons") },
          text = "Gornek sent you about the training weapons? Good. Bring me six and I'll mend them for the next lot of recruits." },
        { id = "h_edge", when = { metBefore = true }, text = "You're back, and the blade's still in one piece? Good. That means you're using the edge and not the flat." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and you'll want a mace, not one of those training axes the recruits keep losing. I'll sell you one, but you'll pay full price like everyone else." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll want a staff, then, and you'll pay full price for it, claws or no claws." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage in my shop. I'll not sell you an axe, because you'll drop it, so how about a staff?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock, your imp's eyeing my blades. Tell it I'll sell to you, not to it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Keep your arrows in the quiver and your beast out of my stock, and we'll get along fine." },
      },
      choices = {
        { text = "Do you ever give the healers a better price, Kzan?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shamans can't bring you many weapons to mend.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why should a druid buy a staff, Kzan?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What should a warrior carry out of this valley?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you sell anything for a rogue's hand?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'd guess mages rarely drop their weapons.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does a hunter need from you, Kzan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess you don't sell to warlocks freely.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you arm a Forsaken paladin, Kzan?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Back to the scrub, then.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, recruit, or are you here to spend some coin on a decent edge?" },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Something heavy that you can keep swinging, and a shield if you've got the sense. Recruits all want a big axe, and then they drop it in the scrub because their arms gave out." } },
      choices = { { text = "Sense, then. I'll take a shield.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Daggers, two of them, and keep them sharp, since you'll be striking where the armor isn't. I don't ask what you use them for, and I'd thank you not to tell me." } },
      choices = { { text = "Two daggers, then.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it's not a weapon, I don't sell it. Steel is the only thing an orc needs to bargain over." } },
    centaur = { { id = "tp_centaur", text = "Kolkar spears are long, so you'll want something that reaches. I've got a few, and they cost what they cost." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's hammer is older than this valley, and it's never once been dropped in the scrub. Take a lesson from it." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear buy my spears and then make them better with feathers and bone. I've stopped being offended, because they do look nicer." } },
  },
}
