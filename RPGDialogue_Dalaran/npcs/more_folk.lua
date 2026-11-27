-- More of the Alterac Valley front: Prospector Stonehewer of the Explorers' League, Sergeant Durgen
-- Stormpike and Thanthaldis Snowgleam for the Stormpike Guard, and Corporal Teeka Bloodsnarl for the
-- Frostwolf Clan. Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Prospector Stonehewer: Explorers' League prospector recruiting for the push on Frostwolf Keep.
P:NPC {
  key = "dal_stonehewer", id = TODO_NPC("Prospector Stonehewer"), name = "Prospector Stonehewer",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "eager", "gruff" }, values = { "curious", "proud", "greedy" },
  notices = { "race", "reputation" },

  impression = {
    first = "She calls the plunder recovered treasures and nearly keeps a straight face.",
    third = "{name} met Prospector Stonehewer, the Explorers' League prospector who sends soldiers against Drek'Thar so the League can dig in Alterac Valley.",
  },

  greetings = {
    { id = "g_default", text = "Ye've the look o' someone who could reach Frostwolf Keep. Good, I've need o' that." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Any word from the valley, or are the orcs still sittin' on my dig?" },
    { id = "g_battle", when = { questActive = TODO_QUEST("The Battle of Alterac") }, text = "Go on, then, an' bloody that orc general's nose. My shovels are waitin'." },
    { id = "g_hero", when = { reputation = { faction = "Stormpike Guard", min = "exalted" } }, text = "There's a hero o' the Stormpike, if ever I saw one! I've a treasure or two put by for the likes o' ye." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Frostwolf colours, eh? Then ye're standin' between me an' my artifacts, an' I'll thank ye tae move." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Ye'll understand, then. It's no' the fightin' I care about, it's what's under the snow." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Stormpike Guard", min = "exalted" } },
      text = "The Guard sings yer name in Dun Baldar, an' I've heard it in the League's halls in Ironforge, too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Prospector Stonehewer, Explorers' League. We believe there are artifacts in Alterac Valley, but the Frostwolf orcs won't let us explore, an' we cannae allow the Horde tae stop our scholarly pursuits." },
        { id = "h_won", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Battle of Alterac"), days = 3 } },
          text = "Well done! Wi' the Horde's nose bloodied after the death o' their general, we'll have the breathin' room we need tae explore, an' I've already sent for more shovels." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Ye'll want tae see the old stonework in the Irondeep, if ever we hold it long enough. Mind, ye'd want tae see the Coldtooth too, an' that's crawlin' wi' kobolds." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quick, I've a map tae mark." },
        { id = "h_again2", text = "Go on, {g:lad|lass}, I'm listenin'." },
      },
      choices = {
        { text = "What artifacts are in the valley?", next = "artifacts" },
        { text = "What do you need me to do?", next = "work" },
        { text = "This is a war, not a dig site.", next = "war" },
        { text = "The Frostwolves were here first.", next = "frostwolves" },
        { text = "I've heard you have treasure for heroes.", next = "hero", when = { reputation = { faction = "Stormpike Guard", min = "exalted" } } },
        { text = "Good digging, Prospector.", next = "END" },
      },
    },

    artifacts = {
      lines = {
        { id = "ar_default", text = "Titan-work, maybe, or old dwarven halls from before the clans split, an' that's what the League believes. The Stormpike came here for thorium an' found carvings on the mine walls nae dwarf alive could read." },
      },
      choices = {
        { text = "Carvings? In the mines?", next = "artifacts_mines" },
        { text = "Something else.", next = "BACK" },
      },
    },
    artifacts_mines = {
      lines = {
        { id = "am_default", text = "In the Irondeep an' the Coldtooth both, deep down where the ore's richest. Both sides cache supplies in 'em now, so every time I get a look, somebody's stackin' crates in front o' the walls." },
      },
      choices = {
        { text = "So the mines matter for more than ore.", next = "artifacts_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    artifacts_why = {
      big = true,
      lines = {
        { id = "aw_default", text = "To me they do. To Vanndar, it's thorium an' supplies, an' tae the orcs it's just their valley. I'll take whatever's left when the soldiers are done shoutin'." },
      },
      choices = {
        { text = "Knowledge outlasts any war. Dig it up.", next = "BACK", reply = "That's the League talkin', an' I'm glad tae hear it from a soldier. Bring me a quiet week an' I'll show ye.", fx = { align = { order = -1 } } },
        { text = "The war comes first. The digging can wait.", next = "BACK", reply = "Aye, aye, Vanndar says the same, an' louder. Win it fast, then, so I can get on.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wk_default", text = "Defeat the Frostwolf general, Drek'Thar, an' wi' him dead the orcs will lose their edge. He's in Frostwolf Keep, in the south o' the valley, behind every orc they've got." },
        { id = "wk_active", when = { questActive = TODO_QUEST("The Battle of Alterac") },
          text = "Ye know the task already: Drek'Thar, in Frostwolf Keep, in the south o' the valley. Vanquish him, then come back tae me." },
      },
      choices = {
        { text = "Tell me about Drek'Thar.", next = "work_drekthar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_drekthar = {
      lines = {
        { id = "wd_default", text = "An old orc shaman, blind as a mole, an' I'm told he sees more than I do wi' both eyes open. His wolves an' his warriors will be thick around him, so ye'll no' be goin' in alone." },
      },
      choices = {
        { text = "I won't be.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    war = {
      lines = {
        { id = "wa_default", text = "It's both, an' I'll no' apologise for it. The Stormpike came for ore, the Frostwolves came because they'd nowhere else, an' the League came because somebody ought tae write it all down before it's blown up." },
      },
      choices = {
        { text = "Someone should, I suppose.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    frostwolves = {
      big = true,
      lines = {
        { id = "fw_default", text = "They were here first, an' I'll grant it. But they're no' diggin', an' I am, an' a dwarf's claim in stone is as good as an orc's claim in snow, or so Ironforge says." },
      },
      choices = {
        { text = "Then share the valley. There's room enough.", next = "BACK", reply = "Ye'd have a hard time sellin' that tae Vanndar, or tae Drek'Thar either. But I'd no' say no tae a quiet dig.", fx = { align = { light = 1 } } },
        { text = "Ironforge wants it. That's claim enough.", next = "BACK", reply = "That's what the King says, an' I'm no' about tae argue wi' him. Off ye go, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hero = {
      lines = {
        { id = "he_default", text = "As a hero o' the Stormpike, ye may choose one item from these recently plun... er, recovered treasures. Dinnae look at me like that, they were in the valley, an' now they're no'." },
      },
      choices = {
        { text = "Recovered. Of course.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldnae tell ye. If it's no' under the ground, it's no' my business." } },
  },
}

-- Sergeant Durgen Stormpike: Stormpike Guard sergeant handing out mine, tower and graveyard orders.
P:NPC {
  key = "dal_durgen", id = TODO_NPC("Sergeant Durgen Stormpike"), name = "Sergeant Durgen Stormpike",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "stormpike" }, temper = { "gruff", "steady" }, values = { "dutiful", "family", "loyal" },
  notices = { "soldier", "pvp" },

  impression = {
    first = "He shares Vanndar's name and won't say how closely.",
    third = "{name} met Sergeant Durgen Stormpike, who sends the Stormpike Guard after Alterac Valley's mines, towers and graveyards.",
  },

  greetings = {
    { id = "g_default", text = "Ye've come tae fight? Good. I've three jobs an' nae enough hands." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more orders, soldier? The line's moved twice since ye left." },
    { id = "g_mine", when = { questActive = TODO_QUEST("Capture a Mine") }, text = "Ye've no' captured the mine yet! Find one we dinnae hold an' put down its leader." },
    { id = "g_towers", when = { questActive = TODO_QUEST("Towers and Bunkers") }, text = "Pull down a Horde banner, soldier, an' let the white one go up in its place." },
    { id = "g_graves", when = { questActive = TODO_QUEST("Alterac Valley Graveyards") }, text = "A graveyard, soldier, wi' a Horde banner in its midst. Ye know what tae do." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Lost yer way? The Frostwolf tunnel's the other side o' the mountain." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, faction = "Alliance" },
      text = "Now that's a frame for holdin' a bunker. Get in there an' hold one." },
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 6 },
      text = "I've heard o' ye, soldier, an' so have the Frostwolves, I'd wager." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sergeant Durgen Stormpike. The mines, the towers an' the graveyards o' Alterac Valley are what this war's really fought over, an' I'll have ye at one o' them before the day's out." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Towers and Bunkers"), days = 3 } },
          text = "I received a field report sayin' ye helped secure an enemy banner. Wi' their ranged troops out o' position, we can move the line o' battle forward!" },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Sergeant Durgen Stormpike, an' a dwarf come tae see me, good! Ye'll know a mine when ye see one, so let's start ye there." },
      },
      again = {
        { id = "h_again3", text = "Ye've time for questions, have ye? Then the Frostwolves must be havin' a quiet day." },
        { id = "h_again", text = "What else, soldier?" },
        { id = "h_again2", text = "Quick, now. There's a war on." },
      },
      choices = {
        { text = "Why do the mines matter?", next = "mines" },
        { text = "Tell me about the towers.", next = "towers" },
        { text = "Why fight over graveyards?", next = "graves" },
        { text = "Stormpike? Any relation to Vanndar?", next = "name" },
        { text = "I'm a dwarf of Ironforge. Where am I needed most?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "The Guard knows my name by now, Sergeant.", next = "known", when = { reputation = { faction = "Stormpike Guard", min = "honored" } } },
        { text = "I'll get to it, Sergeant.", next = "END" },
      },
    },

    mines = {
      lines = {
        { id = "mi_default", text = "The mines hold more than minerals. Both we an' the Frostwolves have cached supplies in the Irondeep an' the Coldtooth, an' that's no' a bad idea, if we could only keep hold o' them." },
      },
      choices = {
        { text = "How do I take one?", next = "mines_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mines_how = {
      lines = {
        { id = "mh_default", text = "Enter one we dinnae control an' kill its leader. The Coldtooth's kobolds have a chief, an' the Irondeep's troggs have a boss, an' when he falls, the mine's ours an' I'll send troops tae guard it." },
      },
      choices = {
        { text = "Troggs and kobolds. Not orcs?", next = "mines_troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mines_troggs = {
      big = true,
      lines = {
        { id = "mt_default", text = "Not at first, but the Frostwolves will come for it as soon as they hear. Some o' our lads would rather leave the troggs be an' let them fight the orcs for us, an' I've never decided if that's clever or lazy." },
      },
      choices = {
        { text = "Clear them out properly. Do the job right.", next = "BACK", reply = "Aye, that's my view an' all, but it's slower. Off ye go, then.", fx = { align = { order = 1 } } },
        { text = "Let the troggs bleed the orcs. Smart war.", next = "BACK", reply = "Smart, maybe, an' sneaky. Dinnae let Vanndar hear ye say it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    towers = {
      lines = {
        { id = "tw_default", text = "Towers an' bunkers are key defensive positions, so we must hold as many as we can. Get inside one wi' a Horde banner atop it, pull out the banner ye find, an' a white Alliance one goes up in its place." },
      },
      choices = {
        { text = "And then?", next = "towers_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    towers_burn = {
      lines = {
        { id = "tb_default", text = "Then hold it long enough, an' if the Horde dinnae take it back, it burns, an' their archers wi' it out o' the fight. Ye'll hear the cheer from Dun Baldar." },
      },
      choices = {
        { text = "I'll listen for it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    graves = {
      lines = {
        { id = "gr_default", text = "Because a soldier who falls comes back at the nearest graveyard we hold, an' the more we hold, the closer tae the front he wakes. The Horde know it too, so they fight savagely for every one." },
      },
      choices = {
        { text = "Fighting over the dead feels wrong.", next = "graves_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    graves_wrong = {
      lines = {
        { id = "gw_default", text = "Maybe it does, but the spirit healers dinnae mind, an' the dead get back up either way. Ask the Frostwolves how sacred they find it when they're pullin' down our banners." },
      },
      choices = {
        { text = "Fair point.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    name = {
      lines = {
        { id = "nm_default", text = "Half the clan's called Stormpike, soldier, an' I'll no' tell ye which half I'm in. If I were close kin, I'd be in Dun Baldar wi' a warm fire, no' out here wi' a list o' mines." },
      },
      choices = {
        { text = "Fair enough, Sergeant.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "In the Irondeep, for nae human kens a prop from a pillar an' I've had enough o' them bringin' the roof down on our own supplies. Take it, hold it, an' tell me honestly whether the troggs have been diggin' where they shouldnae." } },
      choices = {
        { text = "I'll read the stone for you, Sergeant.", next = "BACK", reply = "Good. That's worth more tae me than another axe, though I'll take the axe an' all.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    known = {
      lines = { { id = "kn_default", text = "Aye, it does, an' I've written it in more than one report. I'll say this once, for I'm no' a dwarf for speeches: the lads fight better on a day they've seen ye go through the gate." } },
      choices = {
        { text = "Then I'll keep going through it.", next = "BACK", reply = "See that ye do. Now away wi' ye, before I say somethin' else kind.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    vanndar = { { id = "tp_vanndar", text = "The General holds Dun Baldar an' he'll hold it till the mountain falls. That's all a sergeant needs tae know about him." } },
    frostwolf = { { id = "tp_frost", text = "Hard fighters, an' they ken every drift in that valley. I dinnae hate them, soldier, but I mean tae beat them." } },
    _none = { { id = "tp_none", text = "I give orders, soldier. Ask the Prospector if ye want somethin' clever." } },
  },
}

-- Corporal Teeka Bloodsnarl: Frostwolf corporal handing out mine, tower and graveyard orders.
P:NPC {
  key = "dal_teeka", id = TODO_NPC("Corporal Teeka Bloodsnarl"), name = "Corporal Teeka Bloodsnarl",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "frostwolf" }, temper = { "fierce", "blunt" }, values = { "honorable", "clan", "brave" },
  notices = { "soldier", "pvp" },

  impression = {
    first = "She fights for the Frostwolves as if they were her own blood.",
    third = "{name} met Corporal Teeka Bloodsnarl, who sends the Horde after Alterac Valley's mines, towers and graveyards for the Frostwolf Clan.",
  },

  greetings = {
    { id = "g_default", text = "You came to fight for the Frostwolves? Good. There is plenty of fighting." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The Stormpike have not run out of towers, so neither have I run out of work." },
    { id = "g_mine", when = { questActive = TODO_QUEST("Capture a Mine") }, text = "You have not yet captured a mine! Find one we do not hold, and defeat its leader." },
    { id = "g_towers", when = { questActive = TODO_QUEST("Towers and Bunkers") }, text = "You have not yet assaulted a tower or bunker. Are you waiting for others to claim your glory?" },
    { id = "g_graves", when = { questActive = TODO_QUEST("The Graveyards of Alterac") }, text = "Attack a graveyard held by the Alliance, and pull their banner from the ground." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "You are on the wrong side of the mountain, Alliance. Walk away while you can." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "SHAMAN" }, faction = "Horde" },
      text = "You carry yourself like a warrior of the clans. Drek'Thar will be glad of you." },
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 6 },
      text = "Your name is known in Frostwolf Village, and the Stormpike curse it. Good." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Corporal Teeka Bloodsnarl, of the Frostwolf. The battle lines of Alterac Valley are ever shifting, and the mines, the towers and the graveyards are where it is won, so pick one and go." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Graveyards of Alterac"), days = 3 } },
          text = "Well done! With each graveyard under our control, the spirits of our enemies wander more lost and aimless, and I like to think of them wandering." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Corporal Teeka Bloodsnarl. An orc of the clans, here among the clan that Durotan once led. Lok'tar, warrior; the valley needs you." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Corporal Teeka Bloodsnarl. The Frostwolves remember who sheltered the Warchief's people in Kalimdor, tauren, so you are welcome in this valley." },
      },
      again = {
        { id = "h_again3", text = "You still have words. Spend them quickly, then spend your strength on the Stormpike." },
        { id = "h_again", text = "What else? Speak, then fight." },
        { id = "h_again2", text = "Ask. The snow will not melt while you do." },
      },
      choices = {
        { text = "What makes the mines worth taking?", next = "mines" },
        { text = "Tell me about the towers.", next = "towers" },
        { text = "Why do the graveyards matter?", next = "graves" },
        { text = "Who are the Frostwolves to you?", next = "clan" },
        { text = "The spirits of this valley are restless.", next = "spirits", when = { class = "SHAMAN" } },
        { text = "The Frostwolves know my deeds, Corporal.", next = "known", when = { reputation = { faction = "Frostwolf Clan", min = "honored" } } },
        { text = "Lok'tar, Corporal.", next = "END" },
      },
    },

    mines = {
      lines = {
        { id = "mi_default", text = "As battle rages over the valley, so it rages through the Coldtooth and the Irondeep. Both are rich in minerals and both store supplies, so it is no wonder they are so highly valued." },
      },
      choices = {
        { text = "How do I claim one?", next = "mines_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mines_how = {
      lines = {
        { id = "mh_default", text = "Enter one we do not control and kill its leader. When that is done the mine is ours, and we will send warriors to protect it, so that the peons may dig in peace." },
      },
      choices = {
        { text = "Peons in a war zone?", next = "mines_peons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mines_peons = {
      big = true,
      lines = {
        { id = "mp_default", text = "Peons dig wherever there is ore, and they complain wherever they dig. Some say the clan should not risk them in the valley at all, but a war without supplies is lost before it begins." },
      },
      choices = {
        { text = "Then guard the peons well. They serve too.", next = "BACK", reply = "They do, and we will. A warrior who forgets the hands that feed him is a fool.", fx = { align = { light = 1 } } },
        { text = "Peons can be replaced. The mine cannot.", next = "BACK", reply = "Hard words, but war is hard. Do not say them where the peons can hear.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    towers = {
      lines = {
        { id = "tw_default", text = "Towers and bunkers are important positions, and we must capture and hold them all. Enter one with an Alliance banner, pull out the banner you find inside, and a Horde banner will appear in its place." },
      },
      choices = {
        { text = "And if I hold it?", next = "towers_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    towers_hold = {
      lines = {
        { id = "th_default", text = "Hold it long enough, and if the Alliance does not take it back, it will be destroyed. Then our troops charge forward with impunity and show the Alliance that this valley is no place for them." },
      },
      choices = {
        { text = "Then I'll hold it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    graves = {
      lines = {
        { id = "gr_default", text = "Graveyards are where the battles rage most fierce, because the fallen rise again at the nearest one their side holds. Find one with an Alliance banner in its midst and pull it from the ground." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    clan = {
      lines = {
        { id = "cl_default", text = "The clan Gul'dan exiled to these mountains for speaking against him, and the clan that kept its honour when the others drank demon blood. Durotan led us, and his son leads the Horde now, so I fight here for the Warchief's own blood." },
      },
      choices = {
        { text = "And the Stormpike want them gone.", next = "clan_stormpike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clan_stormpike = {
      big = true,
      lines = {
        { id = "cs_default", text = "The Stormpike came to dig, and they found the Frostwolves already home. They call this valley Ironforge's by right, but the snow does not care for their kings." },
      },
      choices = {
        { text = "This valley is the Frostwolves'. Drive them out.", next = "BACK", reply = "Lok'tar! That is the answer I hoped for. Go and show them.", fx = { align = { honor = 1 } } },
        { text = "Take what ore we can, whoever's home it is.", next = "BACK", reply = "Hm. Spoken like a goblin, but I will take your sword all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = { { id = "sp_default", text = "You hear them too, then. Drek'Thar says the snow and stone of this valley have known the Frostwolves for years, and that they do not welcome picks in their sides. I am no shaman, but I believe him." } },
      choices = {
        { text = "The elements remember who honours them.", next = "BACK", reply = "Then ask them to remember us at the towers. We will give them Stormpike banners to bury.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    known = {
      lines = { { id = "kn_default", text = "They do. The wolf riders speak of you at the fires, and that is not a thing they do for outsiders. You were not born to this clan, but you bleed beside it, and the Frostwolves count that the same." } },
      choices = {
        { text = "It is an honour to be counted.", next = "BACK", reply = "Good. Do not let it make you slow. Lok'tar.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    drekthar = { { id = "tp_drek", text = "Drek'Thar is the eyes of the clan, though his own are blind. He taught the Warchief the ways of the spirits, and he commands in Frostwolf Keep." } },
    stormpike = { { id = "tp_storm", text = "Stubborn, like all dwarves, and they dig like all dwarves. I respect how they hold a wall, and I will pull it down all the same." } },
    _none = { { id = "tp_none", text = "I know orders and the valley. Ask a shaman about the rest." } },
  },
}

-- Thanthaldis Snowgleam: night elf Stormpike Supply Officer outside the Alliance gate.
P:NPC {
  key = "dal_thanthaldis", id = TODO_NPC("Thanthaldis Snowgleam"), name = "Thanthaldis Snowgleam", title = "Stormpike Supply Officer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "stormpike" }, temper = { "calm", "dry" }, values = { "duty", "fair" },
  notices = { "reputation", "race" },

  impression = {
    first = "The dwarves amuse him about as much as he likes them.",
    third = "{name} met Thanthaldis Snowgleam, the night elf who supplies the Stormpike Guard outside Alterac Valley.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah, friend of the Guard. The Stormpike stores are open to you, and even the dwarves have stopped grumbling about it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "The Guard has heard things of you that I cannot ignore. Take what your standing allows, and nothing more." },
    { id = "g_default", text = "Ishnu-alah. The Guard's stores are open to those the Guard has learned to trust." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and colder than when you left, I think." },
    { id = "g_rep", when = { reputation = { faction = "Stormpike Guard", min = "revered" } }, text = "The Stormpike speak your name with something close to warmth, and that is rare for dwarves." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, and not yet shouting. I have learned that this means you are either very tired or very new to the valley." },
    { id = "n_druid", cat = "race", when = { class = "DRUID" },
      text = "A druid, among all this stone and powder. The land here is wounded by both armies, and I think you feel it more keenly than I do." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Another of the kaldorei, this far from the forests? Then we are both strange birds in a dwarven nest." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Stormpike Guard", min = "exalted" } },
      text = "Exalted among the Stormpike. I have seen dwarves of the clan who are not so well thought of." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thanthaldis Snowgleam, supply officer to the Stormpike Guard. What I hand out depends on what the Guard thinks of you, so go and earn their good opinion in the valley, and come back to me." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You will find nothing here for the Horde, stranger. The Frostwolves keep their own stores." },
      },
      again = {
        { id = "h_again3", text = "You have another question. Ask it; my ledgers will keep, and so will the cold." },
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Speak; the snow and I are both patient." },
      },
      choices = {
        { text = "A soldier should take only what their deeds have earned.", next = "BACK", reply = "Just so. The ledger is honest because those who sign it are, and I thank you for remembering it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If nobody counts the crates, a few can go missing.", next = "BACK", reply = "Someone always counts the crates, friend, and in this camp that someone is me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the Guard's stores.", next = "BUSINESS" },
        { text = "A night elf, serving dwarves?", next = "elf" },
        { text = "How do I earn the Guard's trust?", next = "trust" },
        { text = "What is it like, keeping stores for dwarves?", next = "stores" },
        { text = "Who else stands at this gate with you?", next = "gate" },
        { text = "Elune-adore. What news from home?", next = "home", when = { race = "NightElf" } },
        { text = "Not today.", next = "END" },
      },
    },
    elf = {
      lines = {
        { id = "el_default", text = "Strange, I know. Tyrande sent a few of us to learn what the Alliance is, and the Stormpike needed someone who could count without ale. I have learned a great deal about dwarves, and most of it is loud." },
      },
      choices = {
        { text = "Do you miss the forests?", next = "elf_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elf_miss = {
      big = true,
      lines = {
        { id = "em_default", text = "Every morning, when I wake to snow and dwarven singing. But Ashenvale has its own war with the Horde, and I would rather be useful in Alterac than idle in Darnassus." },
      },
      choices = {
        { text = "Duty is worth the cold.", next = "BACK", reply = "It is, though I will tell you so with chattering teeth.", fx = { align = { order = 1 } } },
        { text = "Go home. This isn't your war.", next = "BACK", reply = "Perhaps it is not. But a war against the Horde is everyone's war, the Sentinels say.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "Fight in the valley, take what Vanndar wants taken, and come home with stories the dwarves can sing. The better they think of you, the better I am permitted to equip you." },
      },
      choices = {
        { text = "Then I'll give them something to sing.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let me see what's on offer.", next = "BUSINESS" },
      },
    },
    stores = {
      lines = { { id = "st_default", text = "Instructive. A dwarf will haggle for an hour over a blanket and then give his last ration to a stranger without a word. I have kept accounts for the Sentinels, and they were simpler and a great deal less interesting." } },
      choices = {
        { text = "What do they ask for most?", next = "stores_most" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stores_most = {
      lines = { { id = "sm_default", text = "Powder, bandages and ale, in an order that changes with the day's fighting. I am permitted to issue the first two, and I have been told very firmly that the third is not a supply but a right." } },
      choices = {
        { text = "And do you issue it anyway?", next = "stores_ale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stores_ale = {
      lines = { { id = "sa_default", text = "I count it, I record it, and I do not stand between it and a dwarf. In ten thousand years my people have learned which battles are worth fighting." } },
      choices = { { text = "A wise policy.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    gate = {
      lines = { { id = "ga_default", text = "Lieutenant Haggerdin commands the approach, and Sergeant Durgen Stormpike hands out the day's orders with all the warmth of the weather. Prospector Stonehewer waits for the fighting to end so that she may dig, and I think she will wait some time." } },
      choices = {
        { text = "You don't expect this war to end soon.", next = "gate_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate_war = {
      big = true,
      lines = { { id = "gw_default", text = "Neither side can be driven out and neither will leave, which is how long wars are made. The dwarves say the valley is theirs by right of kinship, and the orcs say it is theirs by right of dwelling. I have not yet heard anyone ask the valley." } },
      choices = {
        { text = "The Stormpike are our allies. That settles it.", next = "BACK", reply = "It settles where I stand, certainly. I am less sure it settles the question.", fx = { align = { order = 1 } } },
        { text = "Both sides are bleeding the land for ore and pride.", next = "BACK", reply = "You see as a kaldorei would. I would not say so near the dwarves, but I will not tell you that you are wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Elune-adore. Little reaches me here but dispatches, and those speak only of Warsong axes in Ashenvale. Tell me instead whether the boughs of Teldrassil are in leaf, for no report ever thinks to mention it." } },
      choices = {
        { text = "They are, and the moonwells are bright.", next = "BACK", reply = "Then I will carry that through another month of snow. Thank you.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    stormpike = { { id = "tp_storm", text = "A proud clan and a loud one, and more generous than they would like known. I have come to think well of them." } },
    frostwolf = { { id = "tp_frost", text = "Orcs who did not march with the old Horde, the dwarves admit when pressed. It changes nothing about the fighting, and yet I find I remember it." } },
    darnassus = { { id = "tp_darn", text = "Home, and very far away. I think of the lake under Teldrassil's boughs when the wind here is at its worst." } },
    _none = { { id = "tp_none", text = "I could not say. Ask the dwarves; they will tell you at great length." } },
  },
}

-- Jekyll Flandring: Forsaken Frostwolf Supply Officer outside the Horde tunnel (added later; the Horde
-- counterpart to Thanthaldis Snowgleam).
P:NPC {
  key = "dal_jekyll", id = TODO_NPC("Jekyll Flandring"), name = "Jekyll Flandring", title = "Frostwolf Supply Officer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "frostwolf" }, temper = { "dry", "meticulous" }, values = { "duty", "practical" },
  notices = { "reputation", "race" },

  impression = {
    first = "Jekyll Flandring is a Forsaken quartermaster keeping the Frostwolf Clan's stores in the snow outside Alterac Valley. He hands out gear by standing with the clan and keeps his ledgers with a dead man's patience.",
    third = "{name} met Jekyll Flandring, the Forsaken who supplies the Frostwolf Clan outside Alterac Valley.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and the ledger is glad of it. Your page is the only one in this book I enjoy reading." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Your page in my ledger is not a flattering one. Buy what the clan allows, and close the flap on your way out." },
    { id = "g_default", text = "The Frostwolf stores are open to those the clan has reason to thank. State your business, and close the flap behind you." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and still breathing, if you are the breathing kind. Let us see whether the clan thinks better of you than last time." },
    { id = "g_rep", when = { reputation = { faction = "Frostwolf Clan", min = "revered" } }, text = "The orcs say your name at their fires. I have checked the ledger, and for once the talk and the figures agree." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "You have walked to the wrong side of the mountain. I issue nothing to the Alliance but directions, and those lead away." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Another of the Dark Lady's own, in all this snow. The cold is the one thing here that does not trouble us, and I have learned not to mention it to the orcs." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Frostwolf Clan", min = "exalted" } },
      text = "Exalted among the Frostwolves. They do not give that to outsiders lightly, and I should know, for I am still waiting." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. You will find the clan's welcome warmer than mine, but mine comes with an inventory." },
  },

  start = "hello",
  nodes = {
    jek_led1 = {
      lines = {
        { id = "jek_led1_1", text = "The bindings are older, yes, for I brought them from the Undercity, where good leather is easier to find than good clerks. The pages are new, and every one of them is a raid, a mine taken, or a clansman's name with a debt beside it." },
      },
      choices = {
        { text = "What kind of debt?", next = "jek_led2" },
        { text = "Something else, quartermaster.", next = "BACK" },
      },
    },
    jek_led2 = {
      lines = {
        { id = "jek_led2_1", text = "Service owed and service paid, which is the only currency the Frostwolves respect. A warrior who has carried back a Stormpike banner is owed a great deal, and one who has only drunk the clan's grog is owed nothing at all." },
      },
      choices = {
        { text = "And the orcs trust your sums?", next = "jek_led3" },
        { text = "I'd hate to be in the second column.", next = "jek_led3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    jek_led3 = {
      lines = {
        { id = "jek_led3_1", text = "Drek'Thar checks them himself, once each moon, with one of his wolves sniffing at the pages. The old shaman is blind, so he has me read him every line aloud, and he has never once caught me in an error, for there have been none." },
      },
      choices = {
        { text = "An accurate clerk, then. Something else.", next = "BACK" },
      },
    },
    jek_sto1 = {
      lines = {
        { id = "jek_sto1_1", text = "Thanthaldis Snowgleam, a high elf, keeps the dwarves' stores on the far side of the valley. We have never met, but I have read his requisitions when the clan took them off a dead courier, and his hand is very neat." },
      },
      choices = {
        { text = "You admire your enemy's handwriting?", next = "jek_sto2" },
        { text = "I've met Snowgleam. He's as careful as you.", next = "jek_sto2", when = { faction = "Alliance" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jek_sto2 = {
      lines = {
        { id = "jek_sto2_1", text = "I admire anyone who keeps an honest column in a war, and his are honest, which is more than I can say for half the Undercity's. If the valley ever falls quiet, I should like to compare ledgers with him, though I expect he would decline." },
      },
      choices = {
        { text = "He would, I think. Back to other matters.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jekyll Flandring, supply officer to the Frostwolf Clan. What I am permitted to issue depends on your standing with the clan, so go into the valley, be useful to them, and return when the ledger has something to say for you." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "There is nothing on these shelves for you. The Stormpike keep their own stores on their own side, and I suggest you go and trouble them." },
      },
      again = {
        { id = "h_again", text = "Something further? Be brief, for the ink freezes if I leave it." },
        { id = "h_again2", text = "Ask. I have nothing but time, as it happens." },
        { id = "h_again3", text = "Yes? I am listening, and counting, and I can do both." },
      },
      choices = {
        { text = "The clan's stores should be shared out by honest reckoning.", next = "BACK", reply = "Honest reckoning is the only kind I keep, and the clan sleeps better for it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A sharp quartermaster always skims a little for himself.", next = "BACK", reply = "Some do, and I have watched the clan deal with them. It is not a pleasant thing to see.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the clan's stores.", next = "BUSINESS" },
        { text = "A Forsaken, keeping stores for orcs?", next = "forsaken" },
        { text = "How do I earn the clan's regard?", next = "regard" },
        { text = "Who else keeps this camp?", next = "camp" },
        { text = "What does the Dark Lady want with this valley?", next = "lady", when = { race = "Scourge" } },
        { text = "Your ledgers look older than the war in the valley.", next = "jek_led1" },
        { text = "The Stormpike have a quartermaster too, I suppose.", next = "jek_sto1" },
        { text = "Another time.", next = "END" },
      },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "The Warchief asked his allies for hands, and the Undercity sent what it could spare, which was a clerk. The orcs fight, the orcs sing, and the orcs cannot keep a tally to save their lives, so I was made welcome after a fashion." },
      },
      choices = {
        { text = "What do the Frostwolves make of you?", next = "forsaken_clan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_clan = {
      lines = {
        { id = "fc_default", text = "They are courteous, and they stand upwind. A Frostwolf will share his fire with anyone who shares his fight, and I respect that, though I notice the wolves will not come near me. Animals are more honest than people about such things." },
      },
      choices = {
        { text = "Does that trouble you?", next = "forsaken_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_trouble = {
      big = true,
      lines = {
        { id = "ft_default", text = "Less than you would think. I was a quartermaster's clerk in Lordaeron while I lived, and I am one still. The uniform has changed and the pulse has gone, but a ledger is a ledger. I serve this clan well, and whether I owe it any more than service is a question I have not settled." },
      },
      choices = {
        { text = "They took you in. You owe them loyalty.", next = "BACK", reply = "Perhaps I do. It is an odd thing to find at the end of one's death, a debt one does not resent.", fx = { align = { honor = 1 } } },
        { text = "Serve your queen. The orcs are only useful.", next = "BACK", reply = "That is the Undercity's view, and it is tidy. I find the valley makes tidy views harder to hold.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regard = {
      lines = {
        { id = "re_default", text = "Fight where Drek'Thar wants fighting, take what he wants taken, and carry back what the clan can use. I record every deed that reaches me, and the better the record reads, the deeper into these crates I may reach on your behalf." },
      },
      choices = {
        { text = "Then I'll give you something to write down.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let me see what's on offer now.", next = "BUSINESS" },
      },
    },
    camp = {
      lines = {
        { id = "ca_default", text = "Warmaster Laggrond commands the approach and speaks for the clan to those who come to fight. Corporal Teeka Bloodsnarl gives out the day's orders, loudly. I keep what they need, and I am the only one of the three who has never mislaid a crate." },
      },
      choices = {
        { text = "How do you find Corporal Bloodsnarl?", next = "camp_teeka" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_teeka = {
      lines = {
        { id = "ct_default", text = "Admirably direct. She tells me daily that the dead should be buried and not billeted, and then she signs for her supplies in a firm hand. I prefer an honest insult to a polite silence, and she has never once given me the second." },
      },
      choices = {
        { text = "An honest insult is a kind of respect.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lady = {
      lines = {
        { id = "la_default", text = "The same thing she wants everywhere, which is allies who owe us and neighbours who do not march on us. A Horde that remembers the Forsaken held a supply line in the snow is a Horde less likely to forget us when the Scourge comes south again." },
      },
      choices = {
        { text = "Then we are an investment.", next = "BACK", reply = "We are, and I keep the accounts. Do try to yield a return.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    drekthar = { { id = "tp_drek", text = "The Frostwolf elder, blind, and better informed than anyone in the valley. He has never once asked to see my ledgers, and I suspect he does not need to." } },
    frostwolf = { { id = "tp_frost", text = "A clan that kept its own counsel in these mountains while the old Horde burned the south. They are proud, and I have come to think they have earned it." } },
    stormpike = { { id = "tp_storm", text = "Dwarves with picks and a claim. They are stubborn enough to die here in great numbers, which I say with a certain professional interest." } },
    undercity = { { id = "tp_under", text = "Home, if the word applies. It is warmer, darker and a good deal quieter than this, and nobody there sings." } },
    _none = { { id = "tp_none", text = "That is not in my ledgers, and what is not in my ledgers I do not vouch for." } },
  },
}

-- Wonderform Operator: a Smokywood Pastures goblin running a Winter Wondervolt machine during the Feast of Winter Veil.
P:NPC {
  key = "dal_wonderform_operator", id = 15732, name = "Wonderform Operator", gender = "male",
  role = "operator", tier = "quest",
  temper = { "brisk", "salesy" }, values = { "coin", "machinery" },
  notices = { "race", "class" },
  impression = {
    first = "A goblin in a Smokywood apron tends a humming, crackling machine strung with lights.",
    third = "{name} met a Wonderform Operator and his Winter Wondervolt during the Feast of Winter Veil.",
  },
  greetings = {
    { id = "g_default", text = "Step right up to the Winter Wondervolt! One zap and you're a Little Helper, courtesy of Smokywood Pastures." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another zap? Your hair's still standing up from the last one, pal." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, text = "A gnome! Don't touch the coils, all right? Last gnome I let near it tried to improve it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" }, text = "A mage, eh? Don't go telling the Kirin Tor about this thing. It's perfectly safe, and fully licensed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "This beauty is the PX-238 Winter Wondervolt, finest holiday machine Smokywood money can buy. Step on the pad, and you'll be dressed for the season in a flash." } },
      again = {
        { id = "h_again", text = "What else? The line's getting long behind you." },
        { id = "h_again2", text = "Make it quick, pal. The coils need to cool." },
      },
      choices = {
        { text = "How did you get this job?", next = "ywon_job" },
        { text = "You're a goblin too, pal? Which cartel?", next = "ywon_goblin", when = { race = "Goblin" } },
        { text = "What does the machine actually do?", next = "machine" },
        { text = "Who runs Smokywood Pastures?", next = "smokywood" },
        { text = "That thing looks dangerous.", next = "danger" },
        { text = "I'm an engineer. How is it powered?", next = "power", when = { profession = "Engineering" } },
        { text = "Maybe later.", next = "END" },
      },
    },
    machine = {
      lines = { { id = "m_default", text = "It turns you into a Little Helper for a while, red or green, our choice not yours. Then you wear off and go back to being whatever you were." } },
      choices = {
        { text = "Why would anyone want that?", next = "why" },
        { text = "Sounds fun. Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Holiday cheer, pal! Folk like to look festive, and Smokywood likes folk walking about in our colours. Everybody wins." } },
      choices = {
        { text = "That's just walking advertising.", next = "BACK", reply = "Shh! Don't say it so loud.", fx = { align = { order = 1 } } },
        { text = "Clever marketing. I'll take a zap.", next = "BACK", reply = "That's the spirit! Hold still.", fx = { align = { order = -1 } } },
      },
    },
    smokywood = {
      lines = { { id = "s_default", text = "A goblin outfit that sells treats, trees and trimmings for the Winter Veil. They hire folks like me to keep the cheer flowing and the coin with it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "Dangerous? Nah. Hardly anybody's been turned into a sheep, and that was only the one time." } },
      choices = {
        { text = "That's not reassuring.", next = "sheep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sheep = {
      lines = { { id = "sh_default", text = "Fine, fine. It was a mage nearby practising polymorph, not the machine. The machine's perfectly safe, mostly." } },
      choices = { { text = "Mostly safe. Got it. Something else.", next = "BACK" } },
    },
    power = {
      lines = { { id = "p_default", text = "Trade secret, pal, but I'll say this much: it's a lot of copper coil and a little bit of something sparkly. Don't open the panel." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    ywon_job = {
      lines = {
        { id = "yywon_job_d", text = "Answered a notice in Booty Bay, pal, Seasonal Help Wanted, No Experience Necessary, Eyebrows Optional. I figured the eyebrows bit was a joke, and I'm still waitin' for the left one to grow back, but the pay's good and the hot cider's free." },
      },
      choices = {
        { text = "Why Dalaran, of all places?", next = "ywon_dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywon_dalaran = {
      narr = "The goblin glances up at the violet towers and lowers his voice.",
      lines = {
        { id = "yywon_dalaran_d", text = "Smokywood figured a city full of mages would love a machine full of sparks, and they figured right, mostly. But the Kirin Tor keep sendin' fellas in purple robes to inspect the coils, and every time one of 'em leans in close, I get real sweaty." },
      },
      choices = {
        { text = "What are you hiding in there?", next = "ywon_hiding" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywon_hiding = {
      lines = {
        { id = "yywon_hiding_d", text = "Hidin'? Me? Okay, okay, listen, there's a little crystal in the core that my supervisor picked up cheap from a fella in Stranglethorn. He swore it's perfectly safe, but it hums at night, and I'm startin' to think the Kirin Tor would want to know about it." },
      },
      choices = {
        { text = "Tell the Kirin Tor. Better safe than sheep.", next = "BACK", reply = "Yeah, yeah, you're right. I'll tell 'em, and Smokywood can sue me.", fx = { align = { order = 1 } } },
        { text = "Keep quiet. It's not your problem.", next = "BACK", reply = "That's the spirit, pal! What they don't know won't polymorph 'em.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywon_goblin = {
      lines = {
        { id = "yywon_goblin_d", text = "Smokywood Pastures, friend, which is neither Steamwheedle nor Venture, and that's the beauty of it. Seasonal work, seasonal profits, and no trade prince breathin' down my neck. Just my supervisor, who breathes louder." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_ybooty_bay", text = "Where I got hired, pal. Lost an eyebrow the same week." } },
    kirin_tor = { { id = "tp_ykirin_tor", text = "Fellas in purple who keep inspectin' my coils. I sweat a lot around 'em." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, pal. I just work the machine." } },
  },
}
