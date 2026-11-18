-- Theldurin the Lost: a half-mad dwarf at Agmond's End who once ran with the Twilight's Hammer and stole the Scroll of Myzrael from them. Voice: bibles/theldurin.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "theldurin", id = TODO_NPC("Theldurin the Lost"), name = "Theldurin the Lost",
  bible = "bibles/theldurin.md", role = "questgiver", tier = "quest",
  communities = { "badlands" }, temper = { "jittery", "chatty" }, values = { "fearful", "stubborn" },
  notices = { "arcane", "weary" },

  impression = {
    first = "Theldurin the Lost jumps at every gust at Agmond's End and won't say the names he fears aloud. He's mad, or close to it, but he talks about the thing under the stone as though he has heard it breathe.",
    third = "{name} met Theldurin the Lost, a frightened dwarf hiding at Agmond's End in the Badlands who once ran with the Twilight's Hammer.",
  },

  greetings = {
    { id = "g_default", text = "Who's that? Oh, it's you, it's only you, and ye're not wearing their robes, so come closer, {g:lad|lass}, and keep your voice down." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back, and nobody followed ye, did they? Good, because the wind out here has ears, I'm sure of it, and a lizard has been watching me for three days running." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I counted every night of it, for the ground hums louder when I'm alone out here." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You've grown stronger since you last stood here, I can see it in how you hold yourself. Good, because you'll need it for what sleeps below." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Someone says you told them a lie, and I know all about lies, for I wore a robe full of them once. Don't let it become a habit." },
  },

  notice = {
    { id = "n_arcane", cat = "arcane", when = { class = { "MAGE", "WARLOCK" } },
      text = "You smell of spellwork, and the cult smelled of it too, so I'll keep my hand on my pick while we talk, if it's all the same tae ye." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the earth already had a go at you, friend, so sit on that rock and don't let it hear you complain." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Theldurin, they call me, Theldurin the Lost, and that's fair, for I lost my faith, my friends and very nearly my mind in that order. There's a doom coming up from beneath us, and I'm the only one out here mad enough to say so." },
        { id = "h_doom_before", when = { questBefore = TODO_QUEST("Solution to Doom") },
          text = "There's a doom approaching, mark me, a doom, and I can't speak the names or they'll hear me. But there's a tablet in Uldaman that might teach us how to stop them, if someone braver than me fetched it." },
        { id = "h_doom_active", tags = { "news" }, when = { questActive = TODO_QUEST("Solution to Doom") },
          text = "The tablet of Ryun'eh lies deep in Uldaman, in a chest older than any dwarf's work. Bring it here and we may yet be saved." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("The Lost Fragments") },
          text = "The rock elementals tore the Scroll of Myzrael to pieces, and they fight over the scraps like dogs over a bone. Bring me all three, the torn one, the crumpled one and the singed one, and I'll mend it with my scrap-ratchet." },
        { id = "h_princess", tags = { "news" }, when = { questActive = TODO_QUEST("Summoning the Princess") },
          text = "Take the mended scroll to the shards in the Arathi Highlands and call Myzrael up, then beat her and bind her shackles to the stone. Don't listen to anything she says while you do it." },
        { id = "h_princess_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Summoning the Princess"), days = 3 } },
          text = "She's bound again, and I heard her scream all the way out here, or I dreamed it, which is much the same thing to me now. Thank you, friend, thank you." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, and from under the mountain by the look of you, so you know the stone isn't silent, whatever the priests say. Sit down, and I'll tell you what I heard it say to me." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "A warlock, and I've met your kind in the cult, where they'd bargain with anything that answered. Keep your little friend back from me and we'll get along." },
      },
      again = {
        { id = "h_again", text = "What else, what else? Ask quickly, {g:lad|lass}, before the stone starts humming again." },
        { id = "h_again2", text = "Go on, I'm listening, though I'm also listening to the rocks, so speak up." },
        { id = "h_again3", text = "Anything else? I've plenty of fears to share, so don't be shy." },
      },
      choices = {
        { text = "Why do they call you 'the Lost'?", next = "lost" },
        { text = "You talk of doom like a man who's seen it.", next = "doom" },
        { text = "What are you guarding out here?", next = "scroll" },
        { text = "This place has the feel of a grave about it.", next = "agmond" },
        { text = "Shouldn't a priest tell you the stone is silent?", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I've heard the stone speak too, Theldurin.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Could whatever you fear be using you, even now?", next = "xmage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "I'll leave you to your rocks.", next = "END" },
      },
    },

    lost = {
      lines = {
        { id = "lo_default", text = "Because I ran with the Twilight's Hammer when I was young and stupid, and they promised me the end of the world as if it were a gift. I believed them, friend, for longer than I like to admit." },
      },
      choices = {
        { text = "Something must have turned you against them.", next = "lost_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_why = {
      lines = {
        { id = "lw_default", text = "They wanted to call up a thing in the Arathi hills, a princess of the earth chained in a prison of stone, and I saw what she'd do if she woke. So I stole the scroll that could call her and ran, and I haven't stopped running since." },
      },
      choices = {
        { text = "That took courage, whatever came before.", next = "lost_judge", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A thief and a cultist. Courage isn't the word.", next = "lost_judge", fx = { align = { light = -1 } } },
        { text = "Do they still hunt you?", next = "lost_judge" },
      },
    },
    lost_judge = {
      lines = {
        { id = "lj_default", text = "They hunt me, aye, but the Badlands are wide and they don't think a mad dwarf is worth the walk, which suits me fine. Call it courage or call it theft, but either way I'll not give that scroll back to them while I've breath." },
      },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },

    doom = {
      lines = {
        { id = "do_default", text = "Something under the world, beneath the stone, older than the titans' halls in Uldaman and hungrier than anything that walks up here. I won't say the names, because when I said them in the cult I felt them listening back." },
      },
      choices = {
        { text = "How could a tablet stop something like that?", next = "doom_tablet" },
        { text = "You're imagining things, Theldurin.", next = "doom_mad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doom_tablet = {
      lines = {
        { id = "dt_default", text = "Knowledge, friend, that's the only weapon that works on things you can't reach with an axe. The tablet of Ryun'eh and Yagyin's Digest between them might tell us what the makers knew, and the makers knew exactly what they were burying." },
        { id = "dt_done", when = { questDone = TODO_QUEST("Solution to Doom") },
          text = "You brought me the tablet, and it's worse than I feared, for the titans knew exactly what lies below and they were frightened too. Now we need Yagyin's Digest to make sense of it, and the scholars in the cities have that." },
      },
      choices = {
        { text = "Where would I find Yagyin's Digest?", next = "doom_digest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doom_digest = {
      lines = {
        { id = "dd_default", text = "The dwarves keep a copy in Ironforge, deep under the city where the Explorers' League won't look, and the Forsaken apothecaries keep one in the Undercity for reasons of their own. Go to whichever will speak to you, and don't let them keep you there with questions." },
      },
      choices = {
        { text = "I'll fetch it, whatever it says.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    doom_mad = {
      lines = {
        { id = "dm_default", text = "Maybe I am, and the dwarves in Ironforge would agree with you, but a madman can still hear a drum. Put your ear to the ground at night out here and tell me afterwards that nothing beats beneath it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    scroll = {
      lines = {
        { id = "sc_default", text = "The Scroll of Myzrael, the one thing the cult wanted most, and I stole it out from under them. Its magic can call Myzrael, a princess of the earth, up out of her prison, and if that happens we're all in trouble." },
      },
      choices = {
        { text = "Where is the scroll now?", next = "scroll_torn" },
        { text = "I'd burn a thing like that outright.", next = "scroll_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scroll_torn = {
      lines = {
        { id = "st_default", text = "Torn to pieces, that's where, for the rock elementals here stole it from me and ripped it apart, and now they fight over the fragments like it's their favourite toy. If you gather them, I can mend it, I think, with patience and my scrap-ratchet." },
        { id = "st_done", when = { questDone = TODO_QUEST("The Lost Fragments") },
          text = "Mended, thanks to you, and it hums in my pack all night like a kettle about to boil. It's the only weapon we have against her, so I sleep beside it and hardly sleep at all." },
      },
      choices = {
        { text = "Why would elementals want a scroll?", next = "scroll_elem" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scroll_elem = {
      lines = {
        { id = "se_default", text = "Because she's of the earth, and they can feel her in it the way you'd feel a storm in your knees. The scroll calls to her and the earth answers, and the poor stupid stones go mad listening to it." },
      },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    scroll_burn = {
      lines = {
        { id = "sb_default", text = "And lose the only thing that can bind her again if she rises? There are some in the cult who think they can control her, but if she could be controlled, why was she chained in the first place? Mad logic, that, and they call me the mad one." },
      },
      choices = {
        { text = "Keep it, then. A weapon's better than nothing.", next = "BACK", reply = "Aye, better than nothin', an' far better than the cult havin' it. I'll keep it close, an' I'll keep it hidden.", fx = { align = { order = 1 } } },
        { text = "Some doors should be bricked up for good.", next = "BACK", reply = "Bricked up, aye, an' I'd do it if I could find enough bricks. But she's no' behind a door, friend, she's under everythin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    agmond = {
      lines = {
        { id = "ag_default", text = "Agmond's End, and Agmond is the reason it's called that, poor soul, for the troggs got him on his way back from the digs. It's quiet, and nobody comes here, which makes it the best home a hunted dwarf could ask for." },
      },
      choices = {
        { text = "Did you know Agmond?", next = "agmond_knew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    agmond_knew = {
      lines = {
        { id = "ak_default", text = "No, but I've slept near his bones, so we're acquainted in a way. Prospector Ironband in Loch Modan sent folk looking for him, and they found more of him than they wanted, so I'd not mention him to Ironband's people." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xpriest = {
      big = true,
      lines = {
        { id = "xp_default", text = "A priest would tell me that, aye, and I'd nod politely and go on listening to the ground. The Light's a fine thing, but it doesn't reach very far down, and what I'm afraid of lives where it's never shone." },
      },
      choices = {
        { text = "The Light reaches further than you think.", next = "BACK", reply = "Does it? Then send it down an' let it see what I've seen, an' maybe it'll stop me listenin'. I'd thank it for that.", fx = { align = { light = 1 } } },
        { text = "Then we fight the dark with darker tools.", next = "BACK", reply = "Darker tools? That's how I fell in wi' the Hammer in the first place. Mind yer step on that road.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "Then you know it doesn't sound like the earth should, all slow and patient, but sick and whispering, like it's been taught a new word. Don't listen too long, shaman, for that's how I lost the first half of my mind." },
      },
      choices = {
        { text = "The earth can be healed. It must be.", next = "BACK", reply = "It must, aye, an' I hope ye're the one tae do it. I've no' the strength left, nor the sense.", fx = { align = { order = 1 } } },
        { text = "If the earth's gone sick, I'll break what sickened it.", next = "BACK", reply = "Break it? Ye'd have tae break Myzrael, an' she's older than the mountains. Mind ye don't break yerself tryin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xm_default", text = "Using me? They'd have to find me first, and then they'd have to make sense of me, which is more than I can do most days. But you're right to wonder, and I'm glad someone clever is wondering it besides me." },
      },
      choices = {
        { text = "I'll keep watch on you, then. For your sake.", next = "BACK", reply = "For my sake? That's the kindest thing anyone's said tae me since I left the Hammer. Watch, then, an' I'll try tae be worth watchin'.", fx = { align = { honor = 1 } } },
        { text = "I'd use you myself, if it stopped them.", next = "BACK", reply = "Ye would, would ye? Then ye're honest, at least, which is more than the cult ever was. I'd rather ye than them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a miner, then a cultist, then a thief, and now I'm a madman on a rock, and of the four I liked mining best, for honest stone never lied to me." } },
    advice = { { id = "tp_ad", text = "Never say a name you don't want answering you, friend, because some of them are always listening." } },
    uldaman = { { id = "tp_uldaman", text = "There's something under the stone at Uldaman, and it breathes. I heard it when I was digging, and I'll never dig again." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "The Hammer took me in, once, and I served them. They wanted the thing under the stone, and I ran before they found it." } },
    the_elements = { { id = "tp_the_elements", text = "The earth here is angry, and I don't know why. It shakes when nobody's watching." } },
    _none = { { id = "tp_none", text = "I don't know that one, and by my beard I'm glad of it, for every new thing I learn seems to be something else to be afraid of." } },
  },
}
