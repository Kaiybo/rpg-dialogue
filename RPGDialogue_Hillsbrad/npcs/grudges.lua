-- Two old grudges across the Hillsbrad river. Voices: bibles/hal.md, bibles/jeffcoat.md
-- Hal McAllister (Southshore): hates the Forsaken and every undead thing, since he saw his dead brother walking
-- the Tarren Mill road; distrusts warlocks and any Alliance traveller who speaks up for the Mill.
-- Christoph Jeffcoat (Tarren Mill): Forsaken, Southshore-born, who can't forgive orcs (a farm burned in the Second War)
-- or Southshore (his sister barred the door when he came home dead).
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Hal McAllister: Southshore fisherman. The Forsaken are the Scourge to him, and that's the end of it.
---------------------------------------------------------------------------
P:NPC {
  key = "hal_mcallister", id = TODO_NPC("Hal McAllister"), name = "Hal McAllister",
  bible = "bibles/hal.md", role = "vendor", tier = "quest",
  communities = { "southshore" }, temper = { "gruff", "steady" }, values = { "loyal", "practical" },
  notices = { "class", "light" },

  impression = {
    first = "Hal McAllister sells hooks and line on Southshore's jetty and won't fish above the river bend. He says the Forsaken are only the Scourge with better manners, and he watches the Tarren Mill road like a man expecting someone.",
    third = "{name} met Hal McAllister, a Southshore fisherman with no patience for the Forsaken or anyone who speaks well of them.",
  },

  greetings = {
    { id = "g_default", text = "Hooks, line, a bit of bait if the gulls haven't had it. Mind the planks by the post; they're rotten through." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are you? The fish aren't biting, but you're welcome to stand and watch them not bite." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "I can smell the brimstone on you from here. Buy what you need and keep whatever's in that pouch of yours in the pouch." },
    { id = "g_light", when = { class = { "PALADIN", "PRIEST" } }, text = "A {class}, and welcome. Southshore's always glad of someone who can put the dead back where they belong." },
    { id = "g_millfriend", when = { npcFlagBefore = "hm_millfriend" }, priority = 10,
      text = "Oh, it's you, the one with the kind words for Tarren Mill. Say your business and then go and say the rest of it to them." },
    { id = "g_softened", when = { npcFlagBefore = "hm_softened" }, priority = 10,
      text = "You're the one I told about Tom. I've not told anyone else, and I'd thank you to keep it that way." },
    { id = "g_plague", when = { questActive = TODO_QUEST("Hints of a New Plague?") },
      text = "A new plague, is it? I could've told them that for nothing, and saved you the walk." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Your lot raises things, don't you? Demons, dead men, whatever answers. Don't bother explaining the difference, because I don't care to learn it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "From Dalaran way, are you? Your Kirin Tor let the plague slip out of their own back garden, so you'll pardon me if I don't bow." },
    { id = "n_light", cat = "light", when = { class = "PALADIN" },
      text = "The Silver Hand rode through Southshore when I was a lad, and the whole town turned out to watch. It's good to see that hammer again." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Hal McAllister. I've fished this shore since I could hold a rod, and I'll go on fishing it, so long as nothing grey comes down off that hill to stop me." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "I'll sell to you, because Magistrate Maleb says I'm to sell to anyone in an Alliance tabard. But I'll watch your hands, warlock, and I'll count my hooks after you've gone." },
        { id = "h_millfriend", when = { npcFlagBefore = "hm_millfriend" },
          text = "Last time you stood on my jetty and told me the Mill's dead aren't so bad. Well, they're still up there, and I'm still down here, and I've not changed my mind." },
        { id = "h_softened", when = { npcFlagBefore = "hm_softened" },
          text = "I went to the bend yesterday, the first time in two years, and I stood and looked up the road for a long while. Didn't see anyone, but I looked." },
        { id = "h_plague_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hints of a New Plague?"), days = 7 } },
          text = "They're saying the Mill's couriers carried something nasty out to Arathi, and someone stopped them. I'd have stopped them a good deal further back, at the river, with a hook." },
      },
      again = {
        { id = "h_again", text = "Anything else? Tide's turning, and I want my lines out before it does." },
        { id = "h_again2", text = "Go on, I'm listening. Fish won't mind." },
        { id = "h_again_warlock", when = { class = "WARLOCK" }, text = "Something else, warlock? Quickly, if you please." },
      },
      choices = {
        { text = "What do you make of the Forsaken?", next = "forsaken" },
        { text = "You keep watching that hill road. Why?", next = "road" },
        { text = "How's the fishing these days?", next = "fishing" },
        { text = "My magic fights the same dead you fear, Hal.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "The Light can lay them to rest, Hal.", next = "xlight", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Have you been back to the bend since?", next = "xbend", when = { npcFlagBefore = "hm_softened" } },
        { text = "Let me see your tackle.", next = "BUSINESS" },
        { text = "Good fishing, Hal.", next = "END" },
      },
    },

    forsaken = {
      lines = {
        { id = "f_default", text = "Make of them? They're the Scourge, friend, only they've learned to talk and keep shop. They took Tarren Mill and they brew their poisons up there, and one morning they'll come down the road with it." },
        { id = "f_millfriend", when = { npcFlagBefore = "hm_millfriend" },
          text = "You know what I think already, and you know I didn't care for your answer. Ask me again if you like; I'm not the one who'll change." },
      },
      choices = {
        { text = "Some of them fight the Scourge harder than we do.", next = "forsaken_defend", fx = { align = { light = 1 }, npcFlag = { set = { "hm_millfriend" } } } },
        { text = "You're right. Burn the Mill and everything in it.", next = "forsaken_burn", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Why are you so sure they'll come?", next = "road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_defend = {
      lines = {
        { id = "fd_default", text = "Harder than we do? Listen to yourself. A dead thing that fights other dead things is still a dead thing, and you've been talking to the wrong people if you think otherwise." },
      },
      choices = {
        { text = "I've seen it with my own eyes.", next = "forsaken_seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_seen = {
      lines = {
        { id = "fs_default", text = "Seen it, have you, and you're telling it to me on my own jetty? Then you can buy your bait and take your eyes somewhere else, because I've seen things too, and mine came with a face I knew." },
      },
      choices = {
        { text = "What face, Hal?", next = "tom" },
        { text = "I'll go.", next = "END" },
      },
    },
    forsaken_burn = {
      lines = {
        { id = "fb_default", text = "Now there's someone who talks sense. Marshal Redpath says we've not the men to take the hill, and maybe he's right, but I'd carry a torch up there myself if he asked." },
      },
      choices = {
        { text = "Would you really go up there yourself?", next = "road" },
        { text = "Something else.", next = "BACK" },
      },
    },

    road = {
      lines = {
        { id = "r_default", text = "Because that's where they'll come from, when they come. And because I saw someone on it last spring, walking with the grey soldiers, and I've not been able to stop looking since." },
        { id = "r_warlock", when = { class = "WARLOCK" },
          text = "That's my business, warlock, not yours. Let's say I saw something up there once that I'd rather not have, and leave it lie." },
      },
      choices = {
        { text = "Who did you see?", next = "tom", when = { ["not"] = { class = "WARLOCK" } } },
        { text = "Who did you see? I'll not judge.", next = "tom", when = { class = "WARLOCK", npcFlagBefore = "hm_softened" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tom = {
      lines = {
        { id = "t_default", text = "My brother Tom. He farmed out past the fields toward the Mill, and the plague took him the year the north fell, and we couldn't get the body back. Last spring I saw him on that road, grey as ash, in a Deathguard's tabard." },
      },
      choices = {
        { text = "Did he know you? Did you speak?", tag = "Persuade", next = "tom_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "PALADIN" } }, { origin = "human_lordaeron_refugee" } } } },
          fail = { next = "tom_no", fx = { affinity = -1 } } },
        { text = "That isn't Tom any more. Tom died in the plague.", next = "tom_dead", fx = { align = { light = -1 } } },
        { text = "Maybe some of Tom is still in there.", next = "tom_alive", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tom_truth = {
      lines = {
        { id = "tt_default", text = "He did. He lifted his hand and said my name, the way he used to shout it across the river, and I threw a stone at him and ran all the way home. I tell everyone I hate them for what they did to him, and it's true, but it's myself I can't look at.",
          fx = { npcFlag = { set = { "hm_softened" } } } },
      },
      choices = {
        { text = "You were frightened, Hal. Anyone would be.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tom_no = {
      lines = {
        { id = "tn_default", text = "That's between me and the river. You've had more of my business than most, so be content with it." },
      },
      choices = { { text = "Sorry, Hal. Something else.", next = "BACK" } },
    },
    tom_dead = {
      lines = {
        { id = "td_default", text = "That's what the priests say, and it's what I tell myself every morning when I bait the hooks. Tom's dead and in the Light, and that thing on the road is just wearing him." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tom_alive = {
      lines = {
        { id = "ta_default", text = "Don't you say that. If there's any of him left in there, then he's up on that hill brewing plague for the Banshee Queen, and better he was dead and done with." },
        { id = "ta_millfriend", when = { npcFlagBefore = "hm_millfriend" },
          text = "There it is again, the soft word for the Mill. I knew you'd say it, and I wish to the Light I knew you were wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll leave you be.", next = "END" },
      },
    },

    fishing = {
      lines = {
        { id = "fi_default", text = "Good below the jetty, and better up the river past the bend, by all accounts. I don't go past the bend any more, though, not since the Mill changed hands, and I'll not tell you why twice." },
      },
      choices = {
        { text = "Is it the Forsaken, or something else?", next = "fishing_bend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fishing_bend = {
      lines = {
        { id = "fib_default", text = "It's the water. Everything that runs off that hill runs into the river, and I'll not eat a trout that's been drinking whatever the apothecaries tip out of their barrels. The murlocs can have them." },
      },
      choices = {
        { text = "That's sensible, Hal.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xwarlock = {
      lines = {
        { id = "xw_default", text = "Fights the dead with what, demons? You'll fight fire with fire until the whole of Hillsbrad's burnt, and the Mill will thank you for it. I've no use for any magic that needs a pact." },
      },
      choices = {
        { text = "Then I'll prove it with deeds, not words.", next = "xwarlock_deeds", fx = { align = { honor = 1 } } },
        { text = "Your fear doesn't concern me. Your bait does.", next = "xwarlock_bait", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock_deeds = {
      lines = {
        { id = "xwd_default", text = "Deeds, is it? Magistrate Maleb up the street has plenty of work against the Syndicate for you. Come back with Southshore's thanks, and I'll think about mine." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarlock_bait = {
      lines = {
        { id = "xwb_default", text = "Ha! Well, that's honest, at least, and I'll take honest over sweet. Buy your bait, then, and don't summon anything on my planks." },
      },
      choices = {
        { text = "Show me the bait.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xlight = {
      lines = {
        { id = "xli_default", text = "That's what I want to hear. Every grey thing up on that hill wants laying in the ground, and the sooner it's done by someone who knows the right words, the better I'll sleep." },
      },
      choices = {
        { text = "All of them, Hal. That's the Light's work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some might be saved, not burned. I'd ask first.", next = "xlight_ask", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlight_ask = {
      lines = {
        { id = "xla_default", text = "Ask them? You'd stand there with your hammer up and ask a dead man if he'd care to be saved? I'll grant it's a priest's sort of thought, but you'll not catch me waiting for the answer." },
      },
      choices = {
        { text = "Who would you want saved, Hal?", next = "tom" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xbend = {
      lines = {
        { id = "xb_default", text = "Twice now. I took a line up past the bend and caught nothing, which was a relief, and I stood and watched the road till dark. If he comes down it one day, I don't know what I'll do, but I'll not throw a stone." },
      },
      choices = {
        { text = "That's a start, Hal.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Southshore born and bred, like my father and his. The McAllisters fish, and that's all there is to tell." } },
    advice = { { id = "tp_ad", text = "Don't drink from the river above the bend, and don't trust anything that's already died once." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask at the inn; Brewmeister Bilger knows everyone's business, and he'll pour you a drink while he gets it wrong." } },
  },
}

---------------------------------------------------------------------------
-- Christoph Jeffcoat: Tarren Mill's trade supplier, Forsaken, Southshore-born. Orcs burned his father's farm,
-- and Southshore barred its doors to him. Sells thread to both grudges' heirs through his teeth.
---------------------------------------------------------------------------
P:NPC {
  key = "christoph_jeffcoat", id = TODO_NPC("Christoph Jeffcoat"), name = "Christoph Jeffcoat",
  bible = "bibles/jeffcoat.md", role = "vendor", tier = "quest",
  communities = { "tarren_mill" }, temper = { "dry", "sharp" }, values = { "loyal", "practical" },
  notices = { "race", "origin" },

  impression = {
    first = "Christoph Jeffcoat sells thread and cloth in Tarren Mill with a merchant's courtesy and a grudge under it. He was born in Southshore, and he has not forgiven it, nor the orcs who burned his father's farm when he was young.",
    third = "{name} met Christoph Jeffcoat, a Forsaken trade supplier in Tarren Mill who was born in Southshore and holds the orcs to an old war.",
  },

  greetings = {
    { id = "g_default", text = "Thread, cloth, dye and flux, all of it fairly priced. Look as long as you like; the dead are patient shopkeepers." },
    { id = "g_orc", when = { race = "Orc" }, text = "An orc. Of course. What is it you need, and how quickly can I find it for you?" },
    { id = "g_dead", when = { race = "Scourge" }, text = "Come in, cousin. It's good to deal with someone who doesn't flinch at my hands." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I remember what you bought down to the spool. The dead have good memories; it's a good deal of our trouble." },
    { id = "g_agreed", when = { npcFlagBefore = "cj_agreed", race = "Orc" }, priority = 10,
      text = "The orc who agreed with me about orcs. You're a strange sort, and I find I don't mind your custom as much as I should." },
    { id = "g_softened", when = { npcFlagBefore = "cj_softened" }, priority = 10,
      text = "Ah, you. I told you about the bread, and I've been cross with myself about it ever since, so you may as well come in." },
    { id = "g_battle", when = { questActive = TODO_QUEST("Battle of Hillsbrad") },
      text = "High Executor Darthalia has you fighting in the fields, I hear. Mind the Southshore militia; they've more courage than sense, and they always did." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "I was a guard in the camps after the Second War, orc. I kept your people behind a fence, and I'll not pretend I lost any sleep over it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Mind the beams, tauren. Your kind never burned anything of mine, so you'll get my best manners, such as they are." },
    { id = "n_militia", cat = "origin", when = { origin = "forsaken_hillsbrad_militia" },
      text = "You stood the militia line here, didn't you, when the dead came over the hill? So did I, and the cooper, and the miller's boys, and now we sell each other bandages." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Christoph Jeffcoat, trade supplies. I sold cloth in Southshore once, when I had a pulse, and now I sell it here, to the Dark Lady's soldiers and whatever the Warchief sends along with them." },
        { id = "h_orc", when = { race = "Orc" },
          text = "The Dark Lady says you're our allies, so I'll sell to you at the same price as anyone and not a copper more. Don't ask me to like it, orc; I watched your Horde come up this valley with torches when I was a boy." },
        { id = "h_dead", when = { race = "Scourge" },
          text = "We're the only honest folk in this valley, you and I. The living down in Southshore still think we're monsters, and the orcs up here still think we're grateful." },
        { id = "h_softened", when = { npcFlagBefore = "cj_softened", race = "Orc" },
          text = "I gave Krusk, our orc by the inn, his thread yesterday and wished him luck at Durnholde. He looked at me as though I'd grown a second head, and I can't say I blamed him." },
        { id = "h_battle_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Battle of Hillsbrad"), days = 3 } },
          text = "So you've been down in the fields. I knew some of those farmers by name, once, and I find I don't much want to know which ones." },
      },
      again = {
        { id = "h_again", text = "What else? Ask away, I've nowhere to be." },
        { id = "h_again2", text = "Something more? The thread can wait; it's in no hurry, and neither am I." },
        { id = "h_again_orc", when = { race = "Orc" }, text = "More questions, orc? Very well, but I'll answer them standing behind the counter." },
      },
      choices = {
        { text = "Why the cold eye for orcs?", next = "orcs" },
        { text = "You were from Southshore?", next = "home" },
        { text = "How do you find Tarren Mill?", next = "town" },
        { text = "Say it to my face, then. What did my people do?", next = "xorc", when = { race = "Orc" } },
        { text = "The living cast us out too. I remember.", next = "xdead", when = { race = "Scourge" } },
        { text = "Did you ever tell Krusk about the bread?", next = "xkrusk", when = { npcFlagBefore = "cj_softened" } },
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Good day, Christoph.", next = "END" },
      },
    },

    orcs = {
      lines = {
        { id = "o_default", text = "Because I was nine when the Horde came up through Hillsbrad in the Second War, and they burned my father's farm with him in the barn. That's not a thing you put down because a treaty tells you to." },
        { id = "o_orc", when = { race = "Orc" }, text = "You know why, or you can guess. Your people came up this valley in the Second War and burned my father's farm with him inside it, and I was nine, and I watched." },
      },
      choices = {
        { text = "And after the war?", next = "orcs_camps" },
        { text = "Thrall's orcs aren't the ones who burned it.", next = "orcs_thrall", fx = { align = { light = 1 } } },
        { text = "Then you've every right to hate them.", next = "orcs_right", fx = { align = { light = -1 }, npcFlag = { set = { "cj_agreed" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs_camps = {
      lines = {
        { id = "oc_default", text = "After the war, I took the king's coin and guarded the internment camps, down near Durnholde, and I was glad of the work. I wanted to look at them behind a fence every day, and I did, for years." },
      },
      choices = {
        { text = "Did you hate them even then, in the camps?", tag = "Persuade", next = "camps_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Orc", disposition = { min = 45 } }, { class = "SHAMAN" } } } },
          fail = { next = "camps_no", fx = { affinity = -1 } } },
        { text = "The Warchief was a slave at Durnholde. Remember that.", next = "camps_thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps_truth = {
      lines = {
        { id = "ct_default", text = "Mostly. There was a little one, though, a girl with a split lip, who'd stand at the fence every morning and stare at my bread. I gave her the heel of a loaf one day, and the sergeant docked my pay for it, and I never did it again, and I've thought about her more since I died than I ever did alive.",
          fx = { npcFlag = { set = { "cj_softened" } } } },
      },
      choices = {
        { text = "Then you're not as hard as you make out.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps_no = {
      lines = {
        { id = "cn_default", text = "I hated them every day and slept soundly every night. Whatever answer you were hoping to dig out of me, it isn't there." },
      },
      choices = { { text = "As you say. Something else.", next = "BACK" } },
    },
    camps_thrall = {
      lines = {
        { id = "cth_default", text = "I know it, and so does every Forsaken in this town, and none of us mentions it in front of Krusk. Blackmoore had him in the keep while I stood on a fence down the hill, and I'll grant that's an odd thing to remember when I'm selling his people their bandages." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs_thrall = {
      lines = {
        { id = "ot_default", text = "So they tell me. Perhaps the Warchief's orcs are gentler, with their spirits and their honour, but I'm afraid I can't tell one green face from another when I remember the torches." },
      },
      choices = {
        { text = "Have you ever tried to?", next = "orcs_camps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs_right = {
      lines = {
        { id = "or_default", text = "Every right, and no use for it, which is the trouble. The Dark Lady needs their axes, so I smile and sell them thread, and I keep the rest for the long nights." },
        { id = "or_orc", when = { race = "Orc" }, text = "An orc agreeing that I'm right to hate orcs. Either you're very honest or very clever, and I'm not sure which would worry me more." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    home = {
      lines = {
        { id = "h2_default", text = "Born on Southshore's main street, two doors from the inn, and I sold cloth from my mother's front room until the plague came up the road. I died of it in the spring, and I woke the next winter in a pit outside the Mill." },
      },
      choices = {
        { text = "Did you ever go back?", next = "home_door" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_door = {
      lines = {
        { id = "hd_default", text = "Once, when the Dark Lady first freed us. I walked down the road at night and knocked at my sister's door, and she looked at me through the shutter and screamed for the watch. They ran me out of town with torches, and I'd sold half of them their wicks." },
      },
      choices = {
        { text = "Your sister was frightened, not cruel.", next = "home_sister", fx = { align = { light = 1 } } },
        { text = "Then Southshore deserves whatever comes for it.", next = "home_curse", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_sister = {
      lines = {
        { id = "hs_default", text = "Frightened, yes, I've told myself so a hundred times. It doesn't stop me hating every lit window in that town, and there's a fisherman on their jetty who curses this hill every morning, and I find I hate him most of all." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home_curse = {
      lines = {
        { id = "hc_default", text = "Whatever comes, and the apothecaries are working on it. I'll admit there are nights I think of my sister's shutter when they talk about the new plague, and I'm not sure what I'm hoping." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    town = {
      lines = {
        { id = "tw_default", text = "Quieter than Southshore was, and the dead keep better hours. High Executor Darthalia runs it like a barracks, the apothecaries keep to their cellar, and that orc Krusk paces outside the inn as if Durnholde might come to him." },
      },
      choices = {
        { text = "What do you make of Krusk?", next = "town_krusk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_krusk = {
      lines = {
        { id = "tk_default", text = "He's grieving for his brothers, and he buys bandages he can't use, and I sell them to him at a fair price. I'll not say more than that; he's an orc, and I've a long memory." },
      },
      choices = {
        { text = "He's an ally. Treat him as one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your grudge. It's yours, not the Dark Lady's.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xorc = {
      lines = {
        { id = "xo_default", text = "To your face, then. Your people burned my father in his own barn, and I was nine and I watched it from the ditch. I'll sell you thread at a fair price, orc, but don't ask me to call you friend." },
      },
      choices = {
        { text = "I wasn't there. Judge me for what I do.", next = "xorc_judge", fx = { align = { honor = 1 } } },
        { text = "War is war. Your king's men did worse to us.", next = "xorc_war", fx = { align = { honor = -1 } } },
        { text = "And after the war, what did you do?", next = "orcs_camps" },
      },
    },
    xorc_judge = {
      lines = {
        { id = "xoj_default", text = "That's what the Warchief's people always say, and I'll own it's a fair thing to ask. I'll watch what you do, then, but I'll watch it from behind the counter." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xorc_war = {
      lines = {
        { id = "xow_default", text = "Worse, was it? Perhaps, in the camps, and I was there to see some of it. That's an ugly thing to hear from across my own counter, orc, and uglier for being half true." },
      },
      choices = {
        { text = "What did you see in the camps?", next = "orcs_camps" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdead = {
      lines = {
        { id = "xd_default", text = "Then you know, cousin. We came home and the living barred the doors, and the orcs took us in because they needed our apothecaries. Neither one of them sees us, not really." },
      },
      choices = {
        { text = "Then we look after our own and no one else.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "The orcs took us in. That counts for something.", next = "xdead_counts", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdead_counts = {
      lines = {
        { id = "xdc_default", text = "It counts, I suppose, the way a debt counts. You're kinder about them than I can manage, cousin, and I'll not argue with you, because we've both had enough of that from the living." },
      },
      choices = {
        { text = "Why can't you manage it?", next = "orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xkrusk = {
      lines = {
        { id = "xk_default", text = "Tell him? Dark Lady, no. I put an extra roll of linen in his parcel and said nothing about it, and he's been looking at me sideways ever since, which is the most I can manage at present." },
      },
      choices = {
        { text = "It's a start, Christoph.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Southshore cloth-seller, then a dead man in a pit, then a Tarren Mill cloth-seller. I've come down in the world by about a mile and a half." } },
    advice = { { id = "tp_ad", text = "Buy good thread and keep your grudges where you can find them. I'm better at the first." } },
    _none = { { id = "tp_none", text = "I sell cloth, not answers. Innkeeper Shay hears more than I do, and passes most of it along for nothing." } },
  },
}
