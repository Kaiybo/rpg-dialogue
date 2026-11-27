-- Missed Orgrimmar folk, part three: two the wiki files under Durotar. Chieftain Earthbind speaks for
-- Thunder Bluff in the Hall of Legends, and Frostwolf Ambassador Rokhstrom recruits for Alterac in the
-- Valley of Strength. Voices: bibles/missed_c.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Chieftain Earthbind: Thunder Bluff's voice among the officers of the Hall of Legends.
P:NPC {
  key = "chieftain_earthbind", id = TODO_NPC("Chieftain Earthbind"), name = "Chieftain Earthbind", gender = "male",
  bible = "bibles/missed_c.md", role = "advisor", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm", "grave" }, values = { "honor", "patient" },
  notices = { "race", "pvp" },
  impression = {
    first = "Chieftain Earthbind stands in the Hall of Legends as still as a totem pole, a tauren elder among officers who are forever pacing. He speaks for the tribes of Thunder Bluff here, and he lets every question settle before he answers it.",
    third = "{name} met Chieftain Earthbind, the tauren who speaks for Thunder Bluff in the Hall of Legends.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Be welcome, friend. There is a place in this hall for you, and it is a good one." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Be welcome in this hall, {class}. There is room in it for you, though not much." },
    { id = "g_default", text = "Be welcome in this hall, {class}. There is room in it for any who have stood between the Horde and its enemies." },
    { id = "g_back", when = { metBefore = true }, text = "The winds carry you back to me, and I am glad to see you walking. Too many who leave this hall for the fronts do not return to it." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "It gladdens me to see one of the shu'halo in this hall. The orcs honour us here, young one, though they forget that we need a higher doorway." },
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "You carry rank, and you carry it quietly, which is how it ought to be carried. The loud ones seldom keep it through a second winter." },
  },
  start = "hello",
  nodes = {
    w2mourn = {
      lines = {
        { id = "w2m_tauren", when = { race = "Tauren" }, text = "Every one of them, and you would too if you had to carry their names home. When I return to Thunder Bluff I stand at the foot of the elder rise and speak each name aloud to the wind, so that the Earth Mother knows who has come back to her." },
        { id = "w2m_default", text = "Every one of them. When I return to Thunder Bluff I speak each name aloud to the wind from the high rises, so that the Earth Mother knows which of her children have come home to her by another road." },
      },
      choices = {
        { text = "Does it ever make you doubt sending them?", next = "w2mourn2" },
        { text = "That is a heavy thing to carry alone.", next = "w2mourn2" },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    w2mourn2 = {
      lines = { { id = "w2m2_default", text = "I do not carry it alone. The mothers carry it, and Cairne carries it, and the officers here carry it too, though they hide it behind their shouting. What I doubt is not the sending, friend, but whether the ones who send them ever walk out to the fields where they fell." } },
      choices = { { text = "Then I will remember them as well. Another matter.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Earthbind, and I speak in this hall for the tribes of Thunder Bluff. Cairne sent me so that when the Horde counts its spears, someone remembers which of them were carried by our braves." },
        { id = "h_default", text = "I am Chieftain Earthbind, and I speak in this hall for the tauren of Thunder Bluff. My people are slow to come to war, friend, but we have never yet left one before our allies did." },
      },
      again = {
        { id = "h_again", text = "Ask what lies on your heart, young one. I have stood in this hall long enough to hear most things twice." },
        { id = "h_again2", text = "Speak, and take your time over it. This hall has stood through longer silences than yours." },
      },
      choices = {
        { text = "What brings a chieftain to Orgrimmar?", next = "why" },
        { text = "This hall seems an odd place for a tauren.", next = "odd" },
        { text = "Who else has the officers' ear?", next = "others" },
        { text = "How did the tauren join the Horde?", next = "xjoin" },
        { text = "Do you trust the orcs, Chieftain?", next = "xtrust" },
        { text = "I am a druid. What would you ask of me?", when = { class = "DRUID" }, next = "xdruid" },
        { text = "Do you mourn the braves who never come back?", next = "w2mourn" },
        { text = "Walk with the Earth Mother, Chieftain.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "A debt, and a gladly paid one. The orcs stood with us against the centaur when we were a hunted people, and Mulgore is ours today because of it, so when Thrall's warriors march, ours march beside them." } },
      choices = {
        { text = "Where do your braves march now?", next = "braves" },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    braves = {
      lines = { { id = "b_default", text = "Into the forests of Ashenvale beside the Warsong, and north into the snows of Alterac, where the Frostwolves hold their valley. It is my task to see that they are sent where their strength is needed, and not merely where an officer wishes to be seen winning.", fx = { learn = { "alterac" } } } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    odd = {
      lines = {
        { id = "o_tauren", when = { race = "Tauren" }, text = "You feel it as I do, then. There is no grass under this roof and no sky above it, and the drums never rest, but a chieftain goes where the herd needs a voice and not where the grazing is sweet." },
        { id = "o_default", text = "It is stone and iron and a great deal of shouting, and I was raised under open sky. Still, the plains teach patience, and patience is the one thing this hall does not forge for itself." },
      },
      choices = {
        { text = "Do the orcs heed a patient voice?", next = "heed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heed = {
      lines = { { id = "hd_default", text = "They heed it when the charge has failed once, which is later than I would like and sooner than it used to be. An orc respects whoever is still standing at the end of the day, and a tauren is usually still standing." } },
      choices = { { text = "I can believe it. Another matter.", next = "BACK", fx = { affinity = 1 } } },
    },
    others = {
      lines = { { id = "ot_default", text = "Advisor Willington speaks for the Forsaken, and he counts the cost of every plan aloud until the warlords growl at him. First Sergeant Hola'mahi keeps the champions' armor, and I have learned that she knows more of how our battles truly went than any report does." } },
      choices = { { text = "Something else, Chieftain.", next = "BACK" } },
    },
    xjoin = {
      lines = {
        { id = "xjoin_default", text = "The centaur hunted us across the Barrens, and Cairne's people were weary and few. The orcs came, and their young Warchief fought beside us, and Cairne swore that our horns would never forget it." },
      },
      choices = {
        { text = "Do the tauren still owe the orcs?", next = "xowe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xowe = {
      lines = {
        { id = "xowe_default", text = "A debt between friends is not counted, young one, it is lived. Yet some of the young braves ask why we march in orc wars far from Mulgore. What would you tell them?" },
      },
      choices = {
        { text = "A promise made is kept, however far it leads.", next = "BACK", reply = "That is what Cairne would say, and what the Earth Mother asks.", fx = { align = { honor = 1 } } },
        { text = "Our first duty is to Mulgore, not to the orcs.", next = "BACK", reply = "A fair answer, and one I hear often. The Grimtotem say it too, which troubles me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrust = {
      lines = {
        { id = "xtrust_default", text = "I trust the Warchief, who listens before he speaks, and I trust the orcs who have bled beside my braves. The rest I am still learning, as they are still learning me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Walk in the Barrens and listen to the land there, because it is sick in places where the oases fail. The Druids of the Fang wander there, and some say they have lost their way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I led my tribe across the Barrens when the centaur still hunted us from water to water. I am too old for that walk now, and so Cairne has given me a hall to stand in." } },
    alterac = { { id = "tp_alt", text = "It is a cold and bitter valley, and the Frostwolves have made their home in it. Rokhstrom, their ambassador, stands in the Valley of Strength, and she can tell you more than I." } },
    thrall = { { id = "tp_x_thrall", text = "A young warchief with an old soul. Cairne trusts him, and I have found no reason not to." } },
    centaur = { { id = "tp_x_centaur", text = "The centaur hunted my people across the Barrens until the orcs stood with us. We have not forgotten." } },
    _none = { { id = "tp_none", text = "I have no wisdom to offer on that, friend. A chieftain who answers every question soon finds that no one trusts his answers." } },
  },
}

-- Frostwolf Ambassador Rokhstrom: sends soldiers of the Horde to Alterac Valley.
P:NPC {
  key = "rokhstrom", id = TODO_NPC("Frostwolf Ambassador Rokhstrom"), name = "Frostwolf Ambassador Rokhstrom", gender = "female",
  bible = "bibles/missed_c.md", role = "ambassador", tier = "quest",
  communities = { "orgrimmar" }, temper = { "proud", "blunt" }, values = { "loyal", "honor" },
  notices = { "race", "class" },
  impression = {
    first = "Frostwolf Ambassador Rokhstrom stands in the Valley of Strength in furs that no sane orc would wear under Durotar's sun, and she does not seem to notice the heat. She has come from Alterac to find fighters for her clan, and she measures everyone who passes.",
    third = "{name} met Frostwolf Ambassador Rokhstrom, who recruits in Orgrimmar for the Frostwolf clan's war in Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Hold a moment, {class}. The Frostwolf clan has need of fighters, and you look as though you could stand a little cold." },
    { id = "g_back", when = { metBefore = true }, text = "You are still in Orgrimmar, I see. The valley has not grown any warmer while you waited, and the dwarves have not grown any fewer." },
    { id = "g_quest", when = { questActive = TODO_QUEST("In Defense of Frostwolf") }, text = "Why do I still see you here? Warmaster Laggrond waits for you in the Alterac Mountains, and he is not a patient orc." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc of the city, by your look. Come north and see how your people lived before there were walls to hide behind." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You walk with the spirits, shaman. Drek'Thar would have a use for you, for the elements of the valley are restless since the dwarves began to dig." },
  },
  start = "hello",
  nodes = {
    w2wolf = {
      lines = {
        { id = "w2w_hunter", when = { class = "HUNTER" }, text = "You would understand it better than most, hunter. Every Frostwolf rider raises a pup from the kennels in the village, and the two of them grow up eating the same meat and sleeping in the same snow, until neither remembers which of them is the beast." },
        { id = "w2w_default", text = "The white wolves of Alterac gave my clan its name, and they are no mounts to be bought in a market. Every rider raises a pup from the kennels in Frostwolf Village, and they grow up sharing meat and snow until neither one would ever leave the other behind." },
      },
      choices = {
        { text = "Could an outsider ever earn one?", next = "w2wolf2" },
        { text = "Our raptors and kodos would be wasted in that snow.", next = "w2wolf2" },
        { text = "Something else, Ambassador.", next = "BACK" },
      },
    },
    w2wolf2 = {
      lines = { { id = "w2w2_default", text = "Fight for the clan until the kennel masters know your face and Drek'Thar speaks your name with something other than suspicion. That is a long road, {class}, and I have seen strong warriors fall off it in their first season. Most who start it are buried in the valley long before they reach the end." } },
      choices = { { text = "Then I'll start walking it. Something else.", next = "BACK" }, { text = "Another matter.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_orc", when = { race = "Orc" }, text = "I am Rokhstrom, and I speak in Orgrimmar for the Frostwolf clan. You know whose clan that is, {class}, and so you know why its valley must not fall to a pack of dwarves with shovels." },
        { id = "h_default", text = "I am Rokhstrom, ambassador of the Frostwolf clan. We have held Alterac Valley since before this city had a name, and now the Stormpike dwarves have marched in to take it from us." },
      },
      again = {
        { id = "h_again", text = "Ask what else you must, and then decide whether you will fight." },
        { id = "h_again2", text = "Speak, {class}. I did not cross half the world to stand in silence." },
      },
      choices = {
        { text = "Who are the Frostwolves?", next = "clan" },
        { text = "What do the dwarves want in your valley?", next = "dwarves" },
        { text = "I will fight for the Frostwolf.", next = "BUSINESS" },
        { text = "Those furs must be a torment in this heat.", next = "furs" },
        { text = "I was born in the internment camps. Would the Frostwolves have me?", next = "camps", when = { race = "Orc" } },
        { text = "Tell me about the wolves your clan rides.", next = "w2wolf" },
        { text = "Not today, Ambassador.", next = "END" },
      },
    },
    clan = {
      lines = { { id = "c_default", text = "We are the clan of Durotan, whose name this land carries, and so we are the Warchief's own blood. We were cast out for refusing the demons' gifts, and we made our home in the snow, and we never drank what the other clans drank." } },
      choices = {
        { text = "Who leads the clan now?", next = "drekthar" },
        { text = "Why didn't the clan follow Thrall here?", next = "stayed" },
        { text = "Something else, Ambassador.", next = "BACK" },
      },
    },
    drekthar = {
      lines = {
        { id = "d_shaman", when = { class = "SHAMAN" }, text = "Drek'Thar leads us, and you of all people should know his name. He is blind and old, and it was he who taught the Warchief to hear the spirits, so every shaman of the new Horde stands somewhere in his shadow." },
        { id = "d_default", text = "Drek'Thar, the far seer, who is blind and old and worth ten generals. He taught Thrall the ways of the shaman when the Warchief was only an escaped slave with a strong arm, and he commands in the valley still." },
      },
      choices = {
        { text = "A blind general seems a risk.", next = "blind" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    blind = {
      lines = { { id = "bl_default", text = "Say that to him, and his wolves will answer you before he does. He sees more through the spirits than you or I see with two good eyes, and the Stormpikes have bled for thinking as you do." } },
      choices = { { text = "Then I spoke too quickly. Something else.", next = "BACK" } },
    },
    stayed = {
      lines = { { id = "s_default", text = "Some did, and you will find them in this city. The rest of us would not leave the graves of our kin or the valley that sheltered us through the years of exile, and Thrall did not ask it of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      lines = { { id = "dw_default", text = "They call themselves an expedition, and they say they came to dig for ore and for the bones of their history. It is our hills they are opening and our hunting grounds they have fenced, and when we told them to go they sent for soldiers.", fx = { learn = { "alterac" } } } },
      choices = {
        { text = "How do I reach the valley?", next = "reach" },
        { text = "Dwarves have always dug where they pleased.", next = "dug" },
        { text = "Something else, Ambassador.", next = "BACK" },
      },
    },
    reach = {
      lines = { { id = "r_default", text = "Take the zeppelin to the Undercity and go south into the Alterac Mountains, above the fields of Hillsbrad. Warmaster Laggrond keeps watch at the mouth of the valley, and he decides who is fit to enter it." } },
      choices = { { text = "I'll remember it. Another matter.", next = "BACK" } },
    },
    dug = {
      lines = { { id = "dg_default", text = "Then let them learn what lives under the snow there. A wolf does not argue with whatever crawls into its den, {class}, and the Frostwolves have never been slow to bite." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camps = {
      lines = { { id = "cp_default", text = "The Warchief himself was raised in human chains, and the clan took him in without asking where he had been. Come north and stand your watch in the snow, and no Frostwolf will care what pen you were born in." } },
      choices = { { text = "Something else, Ambassador.", next = "BACK" } },
    },
    furs = {
      lines = { { id = "f_default", text = "They are, and I will not take them off. I wear what my clan wears so that every orc who walks through this valley of merchants remembers there is a harder place, and kin who are fighting in it." } },
      choices = { { text = "Fairly said. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born in the snow of Alterac, and I have fought there since I could lift an axe. Drek'Thar sent me south because I can talk as well as I fight, or so he says." } },
    alterac = { { id = "tp_alt", text = "It is our home, and the Stormpike dwarves mean to take it. Warmaster Laggrond stands at its mouth, in the mountains above Hillsbrad." } },
    _none = { { id = "tp_none", text = "I know snow, wolves and war, {class}. Ask a city orc about the rest, for they seem to have time for it." } },
  },
}
