-- Between the towns: a troll prisoner at Quel'Danil Lodge. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rinji", id = TODO_NPC("Rin'ji"), name = "Rin'ji",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "quel_danil" }, temper = { "wary" }, values = { "cunning", "proud" },
  notices = { "race" },
  impression = {
    first = "Rin'ji is a troll in an elven cage, which is an old story in these hills, and he tells it with more bitterness than surprise. He'd like out, and he'll pay in secrets.",
    third = "{name} met Rin'ji, a troll held captive by the high elves of Quel'Danil Lodge.",
  },

  greetings = {
    { id = "g_cage", text = "Psst! You, mon, over here, by the bars. You be lookin' like someone who don't love elves." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll, walkin' free in Quel'Danil! The spirits be kind today, cousin, or at least they be payin' attention." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Another elf, but not one of theirs, eh? Your ears be the same, so forgive me for flinchin'." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "'Cause the elves of Quel'Danil think the Light be on their side, mon, and they caged Rin'ji without a question. If your Light be any different from theirs, now be the time to prove it, and Rin'ji gonna pay you in secrets for the trouble." } },
      choices = {
        { text = "My Light is mercy. I'll get you out.", next = "BACK", reply = "Mercy, ya, and from a holy one, mon! Rin'ji never think he live to see it, but he take it gladly.", fx = { align = { light = 1 } } },
        { text = "I'll free you for the secret, not for the Light.", next = "BACK", reply = "For de secret, ya, dat be honest, mon. Rin'ji like honest, and he tell you everything once de bars be gone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Rin'ji was just walkin' through their woods, mon, walkin' very quietly and lookin' at nothin' in particular. Maybe Rin'ji was lookin' at their arrows a bit, but that be no reason to cage a troll." } },
      choices = {
        { text = "Then they had no right to cage you.", next = "BACK", reply = "Ya, dat be what Rin'ji keep sayin', mon! Finally somebody listen.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A spy in someone's woods earns a cage.", next = "BACK", reply = "A spy, mon? Rin'ji be just walkin', very quiet. But a cage be a cage, and Rin'ji still want out.", fx = { align = { honor = -1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The guards, mon, because the bars don't shoot arrows. The elves of Quel'Danil be fine archers and poor fighters up close, so get in close quick, and Rin'ji will run while you be busy." } },
      choices = {
        { text = "We leave when the guard changes. No brawling.", next = "BACK", reply = "Ya, quiet, mon, dat be Rin'ji's favourite plan. De elves never notice till de cage be empty.", fx = { align = { order = 1 } } },
        { text = "Forget the plan. We break out and fight our way clear.", next = "BACK", reply = "Ha! Dat be loud, mon, and loud get arrows. But Rin'ji run fast when he need to.", fx = { align = { order = -1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Owls, mon, only owls, for their feathers fetch good trade. The elves said I was huntin' them, which be flattery, because an elf be much harder to find than an owl and taste much worse." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Owls, mon, only owls, for their feathers fetch good trade, whatever the elves say. {pet} got the look of a beast that never been in a cage, and Rin'ji hope it stay that way, because elves cage anythin' they don't understand." },
      },
      choices = {
        { text = "They had a right to guard their woods, Rin'ji.", next = "BACK", reply = "Maybe, mon, maybe, but de owls never complain. Rin'ji still think a cage be too much.", fx = { align = { order = 1 } } },
        { text = "Woods belong to no one. They had no right.", next = "BACK", reply = "Ya, dat be what Rin'ji say, mon! De woods belong to de owls, and de owls don't mind Rin'ji.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "'Cause Rin'ji ain't done nothin' but walk in the wrong woods, and the elves caged me for it without so much as a question. Your Light be about mercy, so the stories say, and Rin'ji be very curious to know if the stories be true." } },
      choices = {
        { text = "The Light is mercy. I'll get you out, Rin'ji.", next = "BACK", reply = "De Light and de loa agree for once, mon. Rin'ji be very grateful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A caged troll is a troll who can't hurt anyone.", next = "BACK", reply = "Rin'ji can't hurt nobody anyway, mon, he only walk and look. But you got a cold heart, ya?", fx = { align = { light = -1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Rin'ji got careless, mon, chasin' a rumour of somethin' buried in these hills, and the elves of Quel'Danil got sharper eyes than Rin'ji thought. They watch the cage all day, but they change the guard at dusk, and a quiet one could slip in then." } },
      choices = {
        { text = "Dusk, then. I'll get you out clean.", next = "BACK", reply = "Dusk, ya, and quiet as an owl, mon. Rin'ji be ready.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll get you out, but not by sneaking. I'll face them.", next = "BACK", reply = "Face dem? Ha, de elves will love dat, mon. Rin'ji will be runnin' while you be talkin'.", fx = { align = { honor = 1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "Sometimes they listen, mon, but they don't answer how you want, and Rin'ji think that be the loa's little joke. Maybe they sent you, and maybe they didn't, but Rin'ji ain't fussy about who answer the prayer, so long as somebody does." } },
      choices = {
        { text = "Someone answered. I'll get you out of there.", next = "BACK", reply = "Ya, somebody did, mon, and dat be de loa's joke workin' in Rin'ji's favour for once.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Nobody sent me, Rin'ji. You're on your own.", next = "BACK", reply = "Ah, cold, mon, cold. Den maybe Rin'ji's secret stay in Rin'ji's head, ya?", fx = { align = { light = -1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Just a way out, and a little luck on the run home, 'cause the elves shoot straight and the woods be thick. If the spirits of the wind feel like blowin' some dust in elven eyes, Rin'ji wouldn't complain, no sir." } },
      choices = {
        { text = "The spirits will guard you home, Rin'ji.", next = "BACK", reply = "Ya, dat be all Rin'ji ask for, mon. De spirits and a fast pair of legs.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the spirits. I'll just cut the elves down.", next = "BACK", reply = "Dat be one way, mon, but de elves got many arrows. Rin'ji hope your blade be faster.", fx = { align = { order = -1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The kind that hurt, mon, and that sing out to the elves when anybody try to open it the wrong way. The high elves always did love their wards, ever since they first drove the Amani from their forests, and Rin'ji think they love them more than they love their own kin." } },
      choices = {
        { text = "I'll undo the ward carefully. No alarms, Rin'ji.", next = "BACK", reply = "Ya, careful be good, mon. Rin'ji don't want to hear dat ward sing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll just blast it open. Let them come.", next = "BACK", reply = "Den Rin'ji start runnin' early, mon, before de elves arrive. You have fun.", fx = { align = { order = -1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No, mon, and Rin'ji spit on their altars, for they feed their own people to the blood loa and call it worship. The elves don't know one troll from another and don't care to learn, so you get me out, and you be helpin' a troll who never made a sacrifice in his life." } },
      choices = {
        { text = "Then I'll help the right trolls. You're free, Rin'ji.", next = "BACK", reply = "Ya, de right trolls, mon, and Rin'ji be one of dem. De Vilebranch can rot.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "One troll's much like another. Your secret had better be good.", next = "BACK", reply = "Rin'ji's secret be very good, mon, and Rin'ji be very different from de Vilebranch. You see.", fx = { align = { light = -1 } } },
        { text = "Something else, Rin'ji.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rin'ji, they call me, and the elves of Quel'Danil caught me in their woods and threw me in this cage. Get me out, and Rin'ji gonna tell you a secret worth more than the trouble." },
        { id = "h_escort", tags = { "news" }, when = { questActive = TODO_QUEST("Rin'ji is Trapped!") },
          text = "If you be willin' to help me, that be good, mon, so get me past the elves' bows and out of their woods, and I run the rest of the way myself." },
        { id = "h_secret", when = { questActive = TODO_QUEST("Rin'ji's Secret") },
          text = "A promise be a promise, even to a stranger. Take what I told you and go find it before somebody else does." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, mon! You got arms like a bear, so maybe you bend these bars, and maybe you bend an elf or two on the way out." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, mon. Rin'ji was huntin' too, before the elves caught him, so you know how it feel to hold the bow, and how bad it feel when somebody else got it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, mon? You talk to the trees, so maybe you tell 'em to open this cage, 'cause Rin'ji's been askin' nicely and nothin' be happenin'." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" }, text = "A paladin, mon? Your people and mine been fightin' since the Amani wars, so Rin'ji be very surprised if you let a troll out of a cage, but Rin'ji still be askin'." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Now you be the kind Rin'ji like to see, mon, quiet and quick. You get these locks open without the elves noticin', and Rin'ji make it worth your trouble." },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest? You gonna pray over Rin'ji, or you gonna help him? 'Cause Rin'ji been prayin' to every loa he know, and none of 'em been pickin' locks lately." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The spirits must be lookin' after Rin'ji after all, mon, 'cause you be the first friendly face to come by this cage in many days." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, mon. The elves put a little spell on this lock, Rin'ji think, 'cause it hum when Rin'ji touch it, so maybe you know how to make it stop." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Ooh, you got a little demon, mon. The Vilebranch got plenty of dark friends too, but Rin'ji ain't Vilebranch, and Rin'ji ain't fussy about who open this cage." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one wit' the Light, mon? That be the strangest thing Rin'ji see since the elves put him in this cage, but you ain't no elf, so maybe you help a troll out." },
      },
      choices = {
        { text = "Elves caged my people too, once. I'll get you out.", next = "troll", when = { race = "Troll" } },
        { text = "Why did the elves cage you?", next = "caged" },
        { text = "I doubt a prisoner has any secrets worth hearing.", next = "secret" },
        { text = "Why should I trust a troll?", next = "trust" },
        { text = "Should I break the bars or the guards first, Rin'ji?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You must have been hunting something when the elves caught you.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why did the elves of Quel'Danil cage you, Rin'ji?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why should a paladin free a troll, Rin'ji?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "The elves must have caught you off guard, Rin'ji.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the loa listen to you, Rin'ji?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What do you need from a shaman, Rin'ji?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "There's a spell on that lock, Rin'ji.", next = "xmage", when = { class = "MAGE" } },
        { text = "Are you one of the Vilebranch, Rin'ji?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why should a paladin of the Horde free you, Rin'ji?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good luck, Rin'ji.", next = "END" },
      },
      again = { { id = "h_again", text = "Talk faster, mon. The elves be changin' the guard soon." } },
    },
    caged = {
      lines = {
        { id = "ca_default", text = "Because I be a troll in their woods, mon, and that be crime enough to an elf. Trolls and elves been killin' each other since before the dwarves came out of their mountains, so nobody be askin' my side of it." },
      },
      choices = { { text = "There must be another side to it.", next = "caged_side" } },
    },
    caged_side = {
      lines = {
        { id = "cs_default", text = "I was huntin', and I got careless, and they got lucky. That be the whole story, though the elves tell it longer and make me sound much scarier." },
      },
      choices = {
        { text = "Old hatreds should end somewhere. Let's start here.", next = "BACK", reply = "Ya, here be good as anywhere, mon. Rin'ji start by bein' very grateful.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "You trespassed on their land. The cage is fair.", next = "BACK", reply = "Fair, mon? Maybe, maybe. But Rin'ji still want out, and you still want de secret.", fx = { affinity = -2, align = { order = 1 } } },
      },
    },
    secret = {
      lines = {
        { id = "se_default", text = "Ha! A prisoner be hearin' everything, mon, 'cause nobody guards their tongue near a cage. Free me, and I tell you where something worth findin' be hidden in these hills." },
      },
      choices = { { text = "Something else first.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "You shouldn't, not all the way. But I be the one in the cage, and you be the one with the key, so who be needin' trust more, eh?" },
      },
      choices = { { text = "Fair point. Let's talk about something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "tr2_default", text = "Then the spirits sent the right cousin, mon. Mind the archers on the lodge roof; they be watchin' the trail, not the trees." } },
      choices = { { text = "Through the trees, then.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer and the elves of Quel'Danil both hunt my people, mon, and they been doin' it longer than anybody remember. I'd take a dwarf's axe over an elf's cage, though, since at least the axe be quick." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear be wise, mon, throwin' in with the orcs while the rest of us were busy starvin' in the hills. I'd walk all the way to their islands if somebody would open this cage." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi woke their blood god down south, mon, and the drums can be heard all the way up here at night. I want no part of it, and I'd be far away from it already if it weren't for these bars." } },
    _none = { { id = "tp_none", text = "Rin'ji don't know, and Rin'ji don't care, not while he be in this cage." } },
  },
}
