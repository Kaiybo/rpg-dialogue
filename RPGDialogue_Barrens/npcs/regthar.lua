-- Regthar Deathgate, holding the fortified burrow west of the Crossroads against the Kolkar. Voice: bibles/regthar.md
-- A blunt orc commander who runs the Horde's whole war on the centaur from a pig farm and a hole in the ground.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "regthar", id = TODO_NPC("Regthar Deathgate"), name = "Regthar Deathgate",
  bible = "bibles/regthar.md", role = "soldier", tier = "quest",
  temper = { "gruff" }, values = { "dutiful", "loyal" },
  notices = { "class", "kit" },
  impression = {
    first = "He would like the centaur to try something foolish.",
    third = "{name} met Regthar Deathgate at his fortified camp west of the Crossroads, where he directs the Horde's fight against the Kolkar centaur.",
  },

  greetings = {
    { id = "g_duty", text = "We have our duties, {class}. Duties to the Horde." },
    { id = "g_bracers", when = { questActive = TODO_QUEST("Centaur Bracers") }, text = "The Kolkar marauders and stormseers camp around the Lushwater Oasis. Bring me a heap of their bracers as proof of the kills." },
    { id = "g_counter", when = { questActive = TODO_QUEST("Counterattack!") }, text = "The centaur are coming at us from the west. Hold the bunkers and keep killing them until their warlord, Krom'zar, shows his face." },
    { id = "g_won", when = { questDone = TODO_QUEST("Counterattack!") }, text = "Krom'zar's banner hangs in my burrow now. I look at it every morning, and the morning goes better." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Kolkar haven't, so you've some catching up to do." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into a proper killer since you first came to my camp. The centaur have noticed, believe me." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word reached me that you've made somebody angry. Save that temper for the Kolkar, {class}." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior? Good, because the Kolkar respect a heavy blade more than they'll ever respect a treaty." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces. The centaur go for the gaps, so get it mended before you go back out." },
  },

  start = "hello",
  nodes = {
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "I make them soft, and slow, and better at walls than at fighting in the open. Out here the Kolkar would eat a column of Theramore's footmen in an afternoon, and I'd sit on my stockade and watch." },
        { id = "hum_v_troll", when = { race = "Troll" },
          text = "You Darkspear fought them in your jungle, so you know they're better at walls than at open ground. Out here the Kolkar would eat a column of Theramore's footmen in an afternoon, and I'd watch from my stockade." },
      },
      choices = {
        { text = "Soft? They beat the Horde in the Second War.", next = "hu_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "They beat a Horde that was rotten with Gul'dan's treachery and fighting itself, and they'll tell you otherwise in every song they sing. I've fought the centaur for years now, and the centaur fight harder than any knight I faced at Blackrock." },
      },
      choices = {
        { text = "Don't belittle them. That's how warriors die.", next = "BACK", reply = "Hmph. You sound like Belgrom, and I don't say that kindly. Fine, I'll watch for their footmen as closely as I watch the Kolkar.", fx = { align = { honor = 1 }, opinion = { humans = "respect" } } },
        { text = "They needed Gul'dan's help to win. They're nothing.", next = "BACK", reply = "That's how I see it, and the Kolkar agree with me, in their way. Go on and bring me bracers, and we'll talk about humans when there's one worth killing.", fx = { align = { honor = -1 }, opinion = { humans = "contempt" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Regthar Deathgate. I command the Horde's fight against the Kolkar in these lands, and I've scouts at every oasis from here to the Stagnant Pool. If a centaur sneezes in the northern Barrens, I hear of it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Centaur Bracers") },
          text = "The Kolkar leadership relies on a core of trusted warriors to keep the rest in line. Thin those warriors out and the herd has no spine, so I've a bounty for any {class} who'll go hunting." },
        { id = "h_leaders", when = { questActive = TODO_QUEST("Kolkar Leaders") },
          text = "Barak Kodobane camps west of the Forgotten Pools. Bring me his head, and the Kolkar will have one less voice rallying them." },
        { id = "h_verog", when = { questActive = TODO_QUEST("Verog the Dervish") },
          text = "Verog the Dervish rides with the Kolkar at the Stagnant Oasis, and he spins like a dust devil. Don't stand still when you fight him." },
        { id = "h_hezrul", when = { questActive = TODO_QUEST("Hezrul Bloodmark") },
          text = "Hezrul Bloodmark leads the Kolkar from the Lushwater Oasis. Kill him and the rest will start squabbling over who's in charge." },
        { id = "h_counter_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Counterattack!"), days = 3 } },
          text = "You've done it, {name}! Krom'zar is dead and his warband broken, and I'll see the Warchief hears your name. Stand tall, because you do the Horde proud." },
        { id = "h_desolace", when = { questActive = TODO_QUEST("The Kolkar of Desolace") },
          text = "The Kolkar who came at us from the west have kin in Desolace, and the Warchief wants them dealt with. The road is long, so don't dawdle." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Kolkar", min = 40 } }, text = "My scouts are running out of Kolkar to count, and they tell me whose work that is. Keep it up, because the ones you leave alive are the ones who learn." },
        { id = "h_kw_resolved", tags = { "news" }, when = { thread = { id = "kolkar_war", state = "resolved" } },
          text = "My troll Lanti'gah has been insufferable since we let Krom'zar's stragglers go, because the road's been quiet ever since and he won't stop saying so. I'll grant him the quiet, and nothing else." },
        { id = "h_kw_soured", tags = { "news" }, when = { thread = { id = "kolkar_war", state = "soured" } },
          text = "Not one of Krom'zar's riders reached the hills, and my grunts sing about it at night. Lanti'gah, my troll, doesn't sing, and he's taken to walking the perimeter facing west." },
      },
      again = {
        { id = "h_again", text = "What else? I've a war to run, and the Kolkar don't respect talk, only blood." },
        { id = "h_again2", text = "Speak. The centaur don't wait, and neither do I, and my boots are full of sand besides." },
      },
      choices = {
        { text = "What do you make of humans, Regthar?", next = "hu_view" },
        { text = "Who leads the Kolkar?", next = "leaders" },
        { text = "The centaur seem better organized than they used to be.", next = "why" },
        { text = "This is your headquarters? A burrow and a pig farm?", next = "camp" },
        { text = "How do I fight a centaur?", next = "fighting", when = { class = { "WARRIOR", "HUNTER", "ROGUE" } } },
        { text = "Krom'zar's dead. So what comes next?", next = "after", when = { questDone = TODO_QUEST("Counterattack!") } },
        { text = "About Krom'zar's stragglers running west.", next = "stragglers",
          when = { thread = { id = "kolkar_war", beat = "b5_regthar", state = { "stirring", "unfolding" } } } },
        { text = "Give me a task.", next = "BUSINESS" },
        { text = "For the Horde.", next = "END" },
      },
    },
    leaders = {
      lines = { { id = "l_default", text = "Barak Kodobane at the Forgotten Pools, Verog the Dervish at the Stagnant Oasis, and Hezrul Bloodmark over all of them from the Lushwater. Each one's a strand in the same rope, so cut enough strands and the rope snaps." } },
      choices = {
        { text = "Which one first?", next = "first" },
        { text = "Something else, Regthar.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Kodobane, because he's closest and he's loud, and loud ones bring the others running. Then Verog, and then Hezrul once his lieutenants are gone and he's got nobody left to hide behind." } },
      choices = {
        { text = "And when the leaders are dead, it's over.", next = "first_end" },
        { text = "Understood, Regthar. Let me ask something else.", next = "BACK" },
      },
    },
    first_end = {
      big = true,
      lines = { { id = "fe_default", text = "Then the Kolkar either stop their advance or they lash out at us in a foolish strike, and I hope it's the second. A centaur who charges my bunkers is a centaur I don't have to chase across the Barrens." } },
      choices = {
        { text = "Better they stop. Fewer graves on both sides.", next = "BACK", reply = "Fewer graves for us, maybe, but the Kolkar don't count graves the way we do. Still, if they pull back from the oases, I'll take the quiet and keep my blade sharp for when it ends.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Let them charge, and we'll break them on the bunkers.", next = "BACK", reply = "That's the answer I wanted from you, {class}. Let them hit my bunkers head-on, and we'll stack their bracers higher than the pig pens.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The Kolkar used to be a rabble out here, raiding caravans and fighting each other over water. Then new leaders rose among them and started rallying the clans, and now they hold the oases and plan like soldiers." } },
      choices = {
        { text = "Where do the Kolkar come from?", next = "desolace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    desolace = {
      lines = { { id = "d_default", text = "Their homeland is Desolace, west past the Stonetalon peaks, and they've kin there in the thousands. The ones here are an arm of something bigger, and if the arm keeps getting cut off, the body will come looking for us." } },
      choices = {
        { text = "We'll be ready for them, then. Something else.", next = "BACK" },
        { text = "Should the Horde carry the fight to Desolace?", next = "kolkar_op" },
      },
    },
    kolkar_op = {
      lines = { { id = "ko_default", text = "Some of the grunts at the Crossroads say so after a few drinks, and the rest say we've enough enemies already. I've fought centaur longer than most of them have been alive, so I'd like to hear it from you: what would you do?" } },
      choices = {
        { text = "Carry the war to Desolace and finish them.", next = "ko_war", fx = { affinity = 1, align = { light = -1 }, opinion = { centaur = "war" } } },
        { text = "Hold the oases here. Desolace isn't worth the blood.", next = "ko_hold", fx = { align = { light = 1 }, opinion = { centaur = "contain" } } },
        { text = "Let the clans fight each other. They hate each other more.", next = "ko_divide", fx = { trait = { practical = 1 }, opinion = { centaur = "divide" } } },
        { text = "They hunted my people for generations. No mercy.", next = "ko_tauren", when = { race = "Tauren" }, fx = { affinity = 1, opinion = { centaur = "hate" } } },
        { text = "That's for wiser heads than mine, Regthar.", next = "BACK" },
      },
    },
    ko_war = {
      lines = { { id = "kow_default", text = "Spoken like a young grunt, and I was one once. Desolace is a graveyard with five clans living in it, and you'd be fighting all of them at once, but I like your nerve." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ko_hold = {
      lines = { { id = "koh_default", text = "That's my thinking, and it's why I'm sitting in a burrow and not leading a war band west. Keep the water, keep the road, and let them come to us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ko_divide = {
      lines = { { id = "kod_default", text = "Now there's a thought with teeth in it. The Gelkis and the Magram would cut each other's throats for less, and some of our people in Desolace already play them off each other." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ko_tauren = {
      lines = { { id = "kot_default", text = "I've heard the stories from your elders, and I'll not argue with them. Bring that anger to Krom'zar's banner and I'll make sure it lands where it should." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "c_default", text = "A burrow's a fine headquarters, {class}. Centaur can't charge into a hole in the ground, the pigs feed my scouts, and Lanti'gah keeps the place standing when I'm out. I've slept in worse, and so has every orc who fought in the old wars." } },
      choices = {
        { text = "Fair enough. A soldier makes do with what he's given.", next = "BACK", fx = { affinity = 1 } },
        { text = "Who is Lanti'gah?", next = "lantigah" },
      },
    },
    lantigah = {
      lines = { { id = "la_default", text = "He's a troll with sharp eyes and a sharper tongue, and he keeps my camp. He walks the perimeter at night and complains about the pigs, and I've never once had a centaur reach my door, so he can complain all he likes." } },
      choices = { { text = "Something else, Regthar.", next = "BACK" } },
    },
    fighting = {
      lines = { { id = "fi_default", text = "Get close and stay close, because a centaur at range is a centaur with a spear in your gut. They're strong in the charge and clumsy when they have to turn, so make them turn." } },
      choices = {
        { text = "Close and fast, then. I'll remember it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stragglers = {
      big = true,
      lines = { { id = "st_default", text = "Then say your piece, because I've grunts saddling wolves as we speak. A centaur who runs home is a centaur who comes back one day, and I've no wish to meet him twice, whatever Lanti'gah says about sparing them." } },
      choices = {
        { text = "Let them run. Fear will hold the road better than graves.", next = "st_let",
          fx = { thread = { id = "kolkar_war", state = "resolved" }, affinity = -1, align = { light = 1 } },
          journal = { first = "Told Regthar to let Krom'zar's stragglers run home to Desolace. He grumbled, and called his grunts off the wolves.",
                      third = "{name} told Regthar Deathgate to let Krom'zar's stragglers run home, and he called off the hunt." } },
        { text = "Ride them down. Not one of them reaches Desolace.", next = "st_ride",
          fx = { thread = { id = "kolkar_war", state = "soured" }, affinity = 1, align = { light = -1 }, trait = { stern = 1 } },
          journal = { first = "Told Regthar to ride Krom'zar's stragglers down. His grunts were mounted before I'd finished speaking.",
                      third = "{name} told Regthar Deathgate to ride Krom'zar's stragglers down, and his grunts rode out at once." } },
        { text = "Strange that Lanti'gah wants them spared.", next = "st_lanti" },
      },
    },
    st_lanti = {
      lines = { { id = "stl_default", text = "He says a centaur who runs home tells his clan what a Horde bunker costs, and a dead one tells them nothing. He also says he's tired of digging, and I believe that part more." } },
      choices = { { text = "Back to the stragglers, then.", next = "stragglers" } },
    },
    st_let = {
      lines = { { id = "sl_default", text = "Hmph. Lanti'gah will be unbearable, and you'd better be right, {class}. Let them carry it to Desolace, then, and let every Kolkar there hear what my bunkers cost." } },
      choices = { { text = "For the Horde.", next = "END" } },
    },
    st_ride = {
      lines = { { id = "sr_default", text = "That's what I wanted to hear. Mount up, the lot of you, and don't come back while there's a centaur track pointing west!" } },
      choices = { { text = "For the Horde.", next = "END" } },
    },
    after = {
      lines = { { id = "af_default", text = "Now the Kolkar in the Barrens are leaderless, and the ones in Desolace will hear what happened to their kin. If the Warchief sends you west, you'll find out how they took the news." } },
      choices = { { text = "I'll be ready for them.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fought in the old wars, I came to Kalimdor with the Warchief, and now I fight centaur. A soldier's life doesn't need more telling than that." } },
    advice = { { id = "tp_ad", text = "Never fight a centaur on open ground if there's a rock to put your back against. Learn that one cheap, before they teach it to you dear." } },
    centaur = { { id = "tp_centaur", fx = { learn = { "maraudon" } }, text = "The Kolkar are the worst of a bad breed, and the Barrens are full of them. They and their cousins out in Desolace come from some old union of stone and forest, if the shaman are to be believed, and none of it made them any friendlier." } },
    thrall = { { id = "tp_thrall", text = "Thrall gave me this war, and I mean to give it back to him finished. He doesn't need to know the details, just that the roads are safe." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, and I learned how to hold a line against horses. Centaur aren't so different, except they're angrier and the horse half bites." } },
    quilboar = { { id = "tp_quilboar", text = "The Razormane are a nuisance and the Kolkar are a war, and I keep those two separate in my head. If the quilboar get between me and a centaur, though, they're in my way." } },
    _none = { { id = "tp_none", text = "Not my concern. If it isn't Kolkar, ask someone at the Crossroads." } },
  },
}
