-- Darnassus, folk the roster scan found missing (3 of 3): the Cenarion Enclave, the Temple and its
-- gardens, the Warrior's Terrace, and those who walk the city's paths. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Alaindia: wandering reagent vendor (Temple of the Moon, the Temple Gardens).
P:NPC {
  key = "dar_alaindia", id = TODO_NPC("Alaindia"), name = "Alaindia", title = "Reagents", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "serene", "wandering" }, values = { "devotion", "service" },
  notices = { "class" },
  impression = {
    first = "Alaindia carries her reagents in a satchel and walks the paths between the Temple of the Moon and its gardens. She never keeps a stall, on the grounds that those who need her are seldom standing still either.",
    third = "{name} met Alaindia, who wanders the Temple Gardens of Darnassus selling reagents.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, {class}. You have found me, which is the difficult part, so tell me what you need." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again, and on a different path. What have you run short of this time?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ishnu-alah. The gardens are at their best under the moon, and I am glad you have come to see them so." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You are bound for the Temple, I think, or have just come from it. I keep what a priest needs nearest the top of my bag." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid would look for Cyroen in the Enclave, as a rule. But I have seeds and thorns as well, if I am the nearer of the two." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Alaindia. I sell the small things that prayers and spells consume, and I walk while I do it, because a priestess who finds herself short of a candle should not have to cross the whole city for one." } },
      again = { { id = "h_again_x", text = "I am still walking, but I am listening." },
        { id = "h_again", text = "What else, before the path takes me on?" },
        { id = "h_again2", text = "Yes? Walk with me a little, if you like." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Why do you never stay in one place?", next = "walk" },
        { text = "Tell me about the Temple Gardens.", next = "gardens" },
        { text = "Who buys from you most?", next = "x_buy" },
        { text = "Priestesses shouldn't have to sell anything.", next = "x_st" },
        { text = "I've come to pray at the Temple.", next = "x_pr", when = { class = "PRIEST" } },
        { text = "Do mages buy from you?", next = "x_mg", when = { class = "MAGE" } },
        { text = "Goddess go with you.", next = "END" },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "I served in the Temple once, and I found that I prayed best with my feet moving. The High Priestess was kind enough to say that Elune hears a walking prayer as well as a kneeling one, so I walk still, and I have made myself useful along the way." } },
      choices = {
        { text = "What do you pray for?", next = "pray" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = { { id = "p_default", text = "For the tree to grow well, and for the young ones who leave it to come home. I say the second prayer more often of late, because so many more of them are leaving than once did." } },
      choices = { { text = "May they all come home. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gardens = {
      lines = { { id = "gardens_default", text = "They lie around the Temple of the Moon like a held breath. Voloren sells fishing lines by the water and Talaelar sells what is caught, and otherwise there is little but the lake and the light on it, which is how the Sisters wish it to be." } },
      choices = { { text = "A peaceful place. Something else.", next = "BACK" } },
    },
    x_buy = {
      lines = {
        { id = "xb1", text = "The priestesses of the Temple, mostly, and the novices who forget their candles. Then the druids from the Enclave, who swear they need nothing and come to me before every long journey." },
      },
      choices = {
        { text = "What do the druids buy?", next = "x_buy2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_buy2 = {
      lines = {
        { id = "xb2", text = "Wild thornroot for their blessings of the wild, and maple seed for the spell that calls a fallen friend back. They are proud about it, but Elune does not mind them needing a little help." },
      },
      choices = {
        { text = "Have you been to Moonglade yourself?", next = "x_buy3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_buy3 = {
      lines = {
        { id = "xb3", text = "Once, long ago, with my mother. Nighthaven is quiet in a way even this city is not, and I remember thinking the moon looked closer there. You should go, if the druids will show you the path." },
      },
      choices = {
        { text = "Perhaps I will. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "I have heard that said by kinder hearts than yours, and by harder ones. But the Temple asks no coin for prayer, only for candles and incense, and somebody must carry those." },
      },
      choices = {
        { text = "The goddess's servants should be provided for, not paid.", next = "BACK", reply = "A gentle thought, {name}. Darnassus is not yet so rich as that.", fx = { align = { order = 1 } } },
        { text = "Honest trade is no shame, even for a priestess.", next = "BACK", reply = "So I tell myself on the long walk home each evening.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_pr = {
      lines = {
        { id = "xp1", text = "Then you will want candles, and you will want to go in quietly. The high priestess is often at the moonwell in the evening, and the Sisters do not like to be hurried while she is there." },
      },
      choices = {
        { text = "I'll go gently. Something else.", next = "BACK" },
      },
    },
    x_mg = {
      lines = {
        { id = "xm1", text = "Now and then, and they look at the Temple as if it might bite them. I sell them their powders without a word, because Elune turns no one from her light, whatever they did at the Well long ago." },
      },
      choices = {
        { text = "That is generous. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    elune = { { id = "tp_elune", text = "Elune watches over the walkers and the wanderers. I would know, since I am both of them." } },
    background = { { id = "tp_bg", text = "I was a novice of the Temple, long ago. Now I carry a satchel around it, and I am content." } },
    sisterhood_of_elune = { { id = "tp_sis", text = "I serve the Sisters still, in my fashion. Somebody must keep them in candles." } },
    _none = { { id = "tp_none", text = "I do not know, {class}. Ask at the Temple, where the Sisters know a great deal more than I do." } },
  },
}

-- Corand: a quiet tracker who keeps to the Cenarion Enclave.
P:NPC {
  key = "dar_corand", id = TODO_NPC("Corand"), name = "Corand", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "quiet", "watchful" }, values = { "patience", "nature" },
  notices = { "class" },
  impression = {
    first = "Corand keeps to the Cenarion Enclave and looks at the ground more than at the people who walk on it. He can say who passed an hour ago, and which of them was limping.",
    third = "{name} met Corand, a quiet tracker in the Cenarion Enclave.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You favour your left foot a little, so I would guess at a long road and a poor boot." },
    { id = "g_back", when = { metBefore = true }, text = "I knew your step before you spoke. Welcome back to the Enclave." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter reads the ground as I do, or ought to. Tell me, what crossed this path before you, and how long ago?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "My name is Corand. I track, which means only that I pay attention to what everybody else steps over, and the Enclave is a good place to practise, since so many who pass through it have four feet for half the day." } },
      again = { { id = "h_again_x", text = "I am still watching the ground. Ask away." },
        { id = "h_again", text = "Ask what you will." },
        { id = "h_again2", text = "Yes? I am listening, and looking." },
      },
      choices = {
        { text = "What can you tell from a track?", next = "track" },
        { text = "Do you hunt, then?", next = "hunt" },
        { text = "Who taught you to track?", next = "x_who" },
        { text = "Trackers should hunt the orcs, not watch the Enclave.", next = "x_st" },
        { text = "My pet leaves tracks too. What do they say?", next = "x_hu", when = { class = "HUNTER" } },
        { text = "You'd hate following my paws.", next = "x_dr", when = { class = "DRUID" } },
        { text = "I'll leave you to your watching.", next = "END" },
      },
    },
    track = {
      lines = { { id = "t_default", text = "I can tell the weight, the haste and the mood, if the ground is soft. A frightened creature digs in its toes, a hunting one sets each foot down as though it were made of glass, and a druid in bear shape forgets and walks like someone with somewhere to be." } },
      choices = {
        { text = "What is the strangest track you've found here?", next = "strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "Gnome prints, the first time I saw them, because I took them for a child's and could not understand why a child was carrying so much iron. I have learned better since, and the gnome in question has forgiven me." } },
      choices = { { text = "An easy mistake. Something else.", next = "BACK" } },
    },
    hunt = {
      lines = {
        { id = "hu_hunter", when = { class = "HUNTER" }, text = "Seldom, these days. I find the creature and then I leave it be, which you may think is half a hunt, but I have had my fill of the other half." },
        { id = "hu_default", text = "I did once. Now I follow a trail to its end, look at what made it, and go home, and I find that I am as satisfied as I ever was with a kill." },
      },
      choices = { { text = "There's a peace in that. Something else.", next = "BACK" } },
    },
    x_who = {
      lines = {
        { id = "xw1", text = "An old Sentinel who scouted Ashenvale before the orcs ever came. She would set a feather on a trail and make me find it again by morning, and if I failed she said nothing at all, which was worse." },
      },
      choices = {
        { text = "Is she still in Ashenvale?", next = "x_who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who2 = {
      lines = {
        { id = "xw2", text = "She fell near the Warsong camps, two winters past. They found her by her own trail, which she would have thought fitting, because she always said a good tracker leaves one clear path for her friends." },
      },
      choices = {
        { text = "And the orcs who killed her?", next = "x_who3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who3 = {
      lines = {
        { id = "xw3", text = "They are still cutting trees, I expect. I do not hunt them for her sake, because she would call that a waste of good eyes. I watch here instead, and I teach anyone who asks." },
      },
      choices = {
        { text = "She'd be proud of that. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "You are not wrong that Ashenvale needs eyes. But the Enclave is where the druids sleep and where the wounded come, and someone must notice the stranger who walks in quietly." },
      },
      choices = {
        { text = "Then guard the Enclave. Vengeance helps no one.", next = "BACK", reply = "That is what she taught me, and I am glad someone agrees.", fx = { align = { honor = 1 } } },
        { text = "Every orc you could track is another living axe.", next = "BACK", reply = "Perhaps. I will think on that longer than you might like.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hu = {
      lines = {
        { id = "xh1", text = "That your companion trusts you, mostly. The prints run close to yours and never stray, except once by the lake, where something with a fish smell drew it off for a moment." },
      },
      choices = {
        { text = "That sounds right. Something else.", next = "BACK" },
      },
    },
    x_dr = {
      lines = {
        { id = "xd1", text = "I would, and the Enclave druids know it, so they change shape on stone where I cannot follow them. A cat's print that suddenly becomes an elf's is a very poor joke to play on a tracker." },
      },
      choices = {
        { text = "I'll try to be kinder. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cenarion_circle = { { id = "tp_cc", text = "The Circle's druids walk soft, but they still walk. I have learned all their steps by now." } },
    background = { { id = "tp_bg", text = "I track, and I keep to the Enclave. There is not much else to tell about me." } },
    _none = { { id = "tp_none", text = "That has left no trail that I can follow, friend." } },
  },
}

-- Crildor: walks slowly between the Cenarion Enclave and the Temple Gardens, and sits by the lake.
P:NPC {
  key = "dar_crildor", id = TODO_NPC("Crildor"), name = "Crildor", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "gentle", "content" }, values = { "peace", "fellowship" },
  notices = { "weary" },
  impression = {
    first = "Crildor walks slowly between the Cenarion Enclave and the Temple Gardens and stops to sit by the lake whenever it pleases him. He has the air of someone with nowhere he would rather be.",
    third = "{name} met Crildor, who walks the quiet paths of Darnassus and rests beside the lake.",
  },
  greetings = {
    { id = "g_default", text = "Well met, friend. There is no need to hurry on my account, since I never do." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it is you again. Sit a while, if the road will let you." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune-adore. The moon is on the water tonight, and I was only just thinking that somebody ought to share it." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { minLevel = 40 },
      text = "You have travelled a long way, and I can see it in how you stand. The lake is a good place to set all of that down for a moment." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Crildor. I walk from the Enclave to the gardens and back again, and when my legs have had enough I sit by the water and watch people go past, which is a finer occupation than it sounds." } },
      again = { { id = "h_again_x", text = "Sit a while if you like, and ask." },
        { id = "h_again", text = "What else shall we talk of?" },
        { id = "h_again2", text = "Go on, friend. I have the time." },
      },
      choices = {
        { text = "What do you see, watching people?", next = "see" },
        { text = "Do you never tire of the same path?", next = "path" },
        { text = "Why the lake, of all places?", next = "x_lake" },
        { text = "You seem very content. Most here are anxious.", next = "x_st" },
        { text = "I've walked a long way from Stormwind.", next = "x_hm", when = { race = "Human" } },
        { text = "Teldrassil is home to me too.", next = "x_ne", when = { race = "NightElf" } },
        { text = "Rest well, Crildor.", next = "END" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "I see travellers from everywhere, all of them in a great hurry and most of them kind underneath it. They come in small companies, strangers who met on a road and decided to look after one another, and I never grow tired of seeing that." } },
      choices = {
        { text = "You think well of strangers.", next = "strangers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strangers = {
      lines = { { id = "st_default", text = "I have found that it is usually warranted, friend. Most people will share a fire and a tale if you only ask them, and those who gather others around them leave more behind than they ever know." } },
      choices = { { text = "I'll remember that at my next fire. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    path = {
      lines = { { id = "p_default", text = "It is never the same path twice. The light changes, the faces change, and now and then a druid forgets himself and goes by as a cat, and I would be sorry to have missed any of it by wanting to be elsewhere." } },
      choices = { { text = "A good way to see it. Something else.", next = "BACK" } },
    },
    x_lake = {
      lines = {
        { id = "xl1", text = "Because it stays still while everything else in this city is forever being tended, pruned or argued over. I like to watch the moon on it and think of nothing at all." },
      },
      choices = {
        { text = "Do you ever think of the old forests?", next = "x_lake2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_lake2 = {
      lines = {
        { id = "xl2", text = "Of Hyjal, yes, and the long years before the tree. I was there when the Burning Legion came again, and I saw what the World Tree gave of itself for us. Now I prefer still water." },
      },
      choices = {
        { text = "You fought at Hyjal?", next = "x_lake3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_lake3 = {
      lines = {
        { id = "xl3", text = "I carried water and bound wounds, which is fighting of a sort. I will not tell it as a song, because it was not one, but I will say the orcs and humans stood with us, and I have not forgotten." },
      },
      choices = {
        { text = "I'm glad you haven't. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Anxious? Some are, about the new tree and the Archdruid's choices and the war in Ashenvale. I have seen too much to fret over every season, though I do not ask others to share my ease." },
      },
      choices = {
        { text = "Fretting changes nothing. Your peace is wise.", next = "BACK", reply = "Kind of you, though the young ones call it laziness.", fx = { align = { order = -1 } } },
        { text = "Someone must worry, or nothing is ever mended.", next = "BACK", reply = "True enough. Let them worry, and I will sit and listen to them.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hm = {
      lines = {
        { id = "xh1", text = "Then you have walked further than most of my people would, and I honour it. Sit down for a moment, because the walkways here are kind to elven legs and cruel to everyone else's." },
      },
      choices = {
        { text = "Thank you, I will. Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Then you will learn to love the slow paths, given a few centuries. The young always hurry about Darnassus as though the tree might fall, and it will not, whatever the old ones whisper." },
      },
      choices = {
        { text = "I'll try to slow down. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    teldrassil = { { id = "tp_tel", text = "It is a fine tree. Whether it is a blessed one, I leave to wiser heads than mine." } },
    background = { { id = "tp_bg", text = "I walk, and I sit by the lake, and I am glad of the company that passes." } },
    _none = { { id = "tp_none", text = "I could not tell you, friend. Sit down a moment anyway, for it may come to one of us." } },
  },
}

-- Faelyssa: nimble-fingered, keeps to the Cenarion Enclave near the rogue trainers.
P:NPC {
  key = "dar_faelyssa", id = TODO_NPC("Faelyssa"), name = "Faelyssa", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "sly", "amused" }, values = { "cleverness", "patience" },
  notices = { "class" },
  impression = {
    first = "Faelyssa idles in the Cenarion Enclave turning a bent sliver of metal over and over in her fingers. She looked at the clasp on my pack for one moment longer than was polite.",
    third = "{name} met Faelyssa, a clever-fingered night elf in the Cenarion Enclave.",
  },
  greetings = {
    { id = "g_default", text = "Well met. That is a sturdy lock on your pack, and I mean that only as a compliment." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, and you have changed the clasp, which is wise of you if a little hurtful." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You carry picks in your left sleeve, where a careful person would. I would move them an inch higher, because they clink when you bow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Faelyssa. I have no stall and no students, only an interest in the things people fasten shut and what they believe that fastening is worth." } },
      again = { { id = "h_again_x", text = "Ask, and keep your pack closed." },
        { id = "h_again", text = "Something else? I am not going anywhere." },
        { id = "h_again2", text = "Ask, and I may even answer." },
      },
      choices = {
        { text = "You pick locks.", next = "locks" },
        { text = "What keeps you in the Enclave?", next = "enclave" },
        { text = "Who taught you locks?", next = "x_who" },
        { text = "Locks protect honest people.", next = "x_st" },
        { text = "Show me a trick of the trade.", next = "x_ro", when = { class = "ROGUE" } },
        { text = "Gnomish locks must vex you.", next = "x_gn", when = { race = "Gnome" } },
        { text = "I'll keep a hand on my pack.", next = "END" },
      },
    },
    locks = {
      lines = {
        { id = "l_rogue", when = { class = "ROGUE" }, text = "I open them, which is a politer word, and you know as well as I do that the whole of the art is patience. Practise on your own strongbox until your fingers know the pins without your eyes." },
        { id = "l_default", text = "I open them, which is a politer word. A lock is a small riddle that somebody was certain nobody could answer, and I have always found that kind of certainty hard to leave alone." },
      },
      choices = {
        { text = "And what do you take, once it's open?", next = "take" },
        { text = "Something else.", next = "BACK" },
      },
    },
    take = {
      lines = { { id = "t_default", text = "Nothing at all, which disappoints everybody who asks. I close it again and go away knowing something that its owner does not, and I find that worth more to me than whatever was in the box." } },
      choices = { { text = "A strange sort of honesty. Something else.", next = "BACK" } },
    },
    enclave = {
      lines = { { id = "e_default", text = "I have friends in the hollow below, where Syurna and Anishar teach. They do not ask me what I am doing, and I do not ask them, and so it is the most restful company in Darnassus." } },
      choices = { { text = "I can believe it. Something else.", next = "BACK" } },
    },
    x_who = {
      lines = {
        { id = "xw1", text = "A human sailor in Auberdine, who owed me money and paid it in lessons instead. He said every lock in Stormwind was made by the same three families, and I believed him for a year." },
      },
      choices = {
        { text = "Were they?", next = "x_who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who2 = {
      lines = {
        { id = "xw2", text = "No, but Stormwind locks are lazy, and the sailor was right about that much. Darnassus has almost none, which is why I am bored, and dwarven locks are honest work, which is why I respect them." },
      },
      choices = {
        { text = "And the sailor?", next = "x_who3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who3 = {
      lines = {
        { id = "xw3", text = "He sailed for Menethil Harbor and never came back to Darkshore. I like to think he picked a lock in some harbour tavern and found something better than me behind it." },
      },
      choices = {
        { text = "A sad story. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "They protect people who think they are honest, which is not the same thing. A lock tells a thief exactly where the good things are. Do you truly believe it keeps anything safe?" },
      },
      choices = {
        { text = "Doors keep honest folk honest. That is enough.", next = "BACK", reply = "Then we will never agree, and I like you a little better for it.", fx = { align = { order = 1 } } },
        { text = "Locks only keep out the timid. You're right.", next = "BACK", reply = "At last, someone who understands why I stay bored.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ro = {
      lines = {
        { id = "xr1", text = "Never force a pin you can coax. Breathe out before you turn, and listen for the second click, because the first one is always a lie. And never practise on a Sentinel's footlocker." },
      },
      choices = {
        { text = "I'll keep that in mind. Something else.", next = "BACK" },
      },
    },
    x_gn = {
      lines = {
        { id = "xg1", text = "They delight me, which is worse. One I bought in Ironforge sang a little tune when I opened it and then sprayed me with soot. I kept it, because I have never been so fairly beaten." },
      },
      choices = {
        { text = "That sounds like us. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    highborne = { { id = "tp_hb", text = "The Highborne kept the finest locks in Zin-Azshari, or so the old ones say. Much good they did them in the end." } },
    background = { { id = "tp_bg", text = "I open things that are shut. I do it for the pleasure of it, and for nothing else." } },
    _none = { { id = "tp_none", text = "That is one door I have not opened. Try somebody else." } },
  },
}

-- Fyrenna: food & drink on the Warrior's Terrace.
P:NPC {
  key = "dar_fyrenna", id = TODO_NPC("Fyrenna"), name = "Fyrenna", title = "Food & Drink", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "warm", "no-nonsense" }, values = { "care", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "Fyrenna sells food and drink on the Warrior's Terrace and feeds the Sentinels whether or not they remember to ask. She has the manner of someone used to being obeyed about meals.",
    third = "{name} met Fyrenna, who sells food and drink on the Warrior's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Have you eaten today? I mean a real meal, and not whatever you chewed on the road." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and looking thinner than when you left. Sit down, and I will find you something." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You have been at the training ground, by the sweat on you. Drink some water before you ask me for anything stronger." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I shall tell you before you ask that I have moonberry juice and spring water, and that the ale you want is down in Rut'theran, if it is anywhere." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Fyrenna. The warriors train here from moonrise until they drop, and I see to it that they drop onto a full stomach, because nobody ever swung a blade well on an empty one." } },
      again = { { id = "h_again_x", text = "Ask, and then eat something." },
        { id = "h_again", text = "What else, then? Speak, and eat while you do." },
        { id = "h_again2", text = "Go on, I am listening." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Do the Sentinels forget to eat?", next = "forget" },
        { text = "What do night elves eat before a fight?", next = "eat" },
        { text = "Where does the food come from?", next = "x_food" },
        { text = "Warriors should learn to go hungry.", next = "x_st" },
        { text = "You'll like a warrior with a good appetite.", next = "x_wa", when = { class = "WARRIOR" } },
        { text = "Do you have anything for a dwarf?", next = "x_dw", when = { race = "Dwarf" } },
        { text = "My thanks, Fyrenna.", next = "END" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "They forget constantly, because they are proud of how little they need. A Sentinel will stand a watch from dusk to dawn on a handful of berries and call that discipline, and I call it foolishness and send bread up to the walkways." } },
      choices = {
        { text = "Do they thank you for it?", next = "thank" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thank = {
      lines = { { id = "t_default", text = "Sildanair nods to me, which from her is a speech. The young ones thank me properly, though they wait until their captains are not looking." } },
      choices = { { text = "A nod is something. Something else.", next = "BACK" } },
    },
    eat = {
      lines = { { id = "e_default", text = "They eat lightly, and they eat early. Bread, fruit and a little cheese will do, and nothing heavy, since you cannot fight from the trees with a roast boar sitting in you. Afterwards is another matter, and I keep the good things for then." } },
      choices = { { text = "I'll save my appetite. Something else.", next = "BACK" } },
    },
    x_food = {
      lines = {
        { id = "xf1", text = "Most of it from Dolanaar and the glades below the tree, where the farmers keep moonberries and nightsaber milk. The fish come from Rut'theran, and the bread I bake myself, because nobody else here bakes it properly." },
      },
      choices = {
        { text = "Who taught you to bake?", next = "x_food2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_food2 = {
      lines = {
        { id = "xf2", text = "My grandmother, who fed the Sentinels at Astranaar before Darnassus was so much as a seed. She said a warrior fights with her stomach first and her glaive second, and nobody has ever proved her wrong." },
      },
      choices = {
        { text = "Is she still at Astranaar?", next = "x_food3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_food3 = {
      lines = {
        { id = "xf3", text = "She is, and she writes to me that the orcs have made the bread taste of smoke. I send her flour every season, and she sends back the names of the Sentinels who ate it, so I know they were fed." },
      },
      choices = {
        { text = "That is a kind thing to do. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Hungry warriors make mistakes, and a mistake in Ashenvale is a funeral at the Temple. I have heard this nonsense before from captains who never had to carry a fallen Sentinel home." },
      },
      choices = {
        { text = "You're right. Feed them well and bring them home.", next = "BACK", reply = "At last, someone with sense. Take a moonberry tart for that.", fx = { align = { light = 1 } } },
        { text = "Hardship makes better soldiers than tarts do.", next = "BACK", reply = "Then go and tell my grandmother that, and see what happens to you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_wa = {
      lines = {
        { id = "xw1", text = "I do, and I can tell you have trained hard by how you are eyeing my bread. Eat before you spar, not after, and drink twice as much water as you think you need." },
      },
      choices = {
        { text = "I'll take that advice. Something else.", next = "BACK" },
      },
    },
    x_dw = {
      lines = {
        { id = "xd1", text = "I keep a little dark bread for the dwarves of the Wildhammer who visit, though they always look disappointed there is no ale. I do not sell ale, and Elune knows they have asked." },
      },
      choices = {
        { text = "A pity, but I understand. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    elune = { { id = "tp_elune", text = "I thank Elune for every good harvest, and I let the priestesses thank her for the rest." } },
    background = { { id = "tp_bg", text = "I have fed warriors for longer than I care to count. They are no better at feeding themselves than they ever were." } },
    sentinels = { { id = "tp_sen", text = "They are our shield, and half of them are hungry. I do what I can about the second part." } },
    _none = { { id = "tp_none", text = "I do not know about that. Eat something, and then go and ask Sildanair." } },
  },
}

-- Huntress Ravenoak: mounted patrol on the walkways of Darnassus. Brisk.
P:NPC {
  key = "dar_huntress_ravenoak", id = TODO_NPC("Huntress Ravenoak"), name = "Huntress Ravenoak", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "stern" }, values = { "dutiful", "vigilant" },
  notices = { "class" },
  impression = {
    first = "Huntress Ravenoak rides the walkways of Darnassus on patrol and does not slow her nightsaber for conversation. She answers a question in the time it takes the cat to draw two breaths.",
    third = "{name} met Huntress Ravenoak on patrol in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Keep to the side of the walkway, {class}. If you have something to ask, ask it while I ride." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Be brief, for I have the rest of the round still to make." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune-adore. The night watch is the true watch, so say what you need and let me keep it." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your beast close while you are in the city, hunter. My saber does not care for strangers, and I will not have a quarrel on the walkway." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Huntress Ravenoak, of the Sentinels. I ride the walkways of the city from the Warrior's Terrace to the Temple and back, and Huntress Skymane rides them the other way." } },
      again = { { id = "h_again_x", text = "Ask quickly. The walkway is long." },
        { id = "h_again", text = "Anything more? Quickly, now." },
        { id = "h_again2", text = "Speak. I am still riding." },
      },
      choices = {
        { text = "What do you watch for, inside the city?", next = "watch" },
        { text = "Darnassus seems peaceful enough.", next = "peace" },
        { text = "Your saber trusts you completely. How?", next = "hunt_saber", when = { class = "HUNTER" } },
        { text = "How did you earn your saber?", next = "x_earn" },
        { text = "The city should welcome outsiders more warmly.", next = "x_st" },
        { text = "I'm kaldorei. Could I ride with the Sentinels?", next = "x_ne", when = { race = "NightElf" } },
        { text = "Do you trust the Alliance in your city?", next = "x_hm", when = { race = "Human" } },
        { text = "Ride on, Huntress.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "I watch for anyone who walks as if they did not wish to be seen. This city stands in the crown of a tree and has few doors, and the Horde has more than once sent those who believed that made it easy to enter." } },
      choices = {
        { text = "And what became of them?", next = "became" },
        { text = "Something else.", next = "BACK" },
      },
    },
    became = {
      lines = { { id = "b_default", text = "They learned how quickly a nightsaber covers a walkway, and those who lived carried the lesson home with them. I would rather be feared for a patrol than mourned for a lapse." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    peace = {
      lines = { { id = "p_default", text = "It is peaceful because somebody rides this round every hour of the day and the night. Enjoy it, {class}, and do not mistake it for something that happens without being kept." } },
      choices = { { text = "Then I thank you for keeping it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunt_saber = {
      lines = {
        { id = "hsb_default", text = "I raised her from a cub, and she has never once gone hungry while I ate. That is the whole of it, hunter, and you know it already if your own companion is worth anything." },
      },
      choices = { { text = "Fed first, always. Something else.", next = "BACK" } },
    },
    x_earn = {
      lines = {
        { id = "xe1", text = "By raising her from a cub in Ashenvale and feeding her before myself through one hard winter. A Sentinel's saber is not given, it is grown, and she remembers every meal I went without." },
      },
      choices = {
        { text = "What do you call her?", next = "x_earn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_earn2 = {
      lines = {
        { id = "xe2", text = "I call her nothing aloud, because she knows when I mean her. The other Sentinels think it strange, but names are for the ones who cannot hear what you mean without them." },
      },
      choices = {
        { text = "Will she stay with you always?", next = "x_earn3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_earn3 = {
      lines = {
        { id = "xe3", text = "Until one of us falls, and I have promised her it will not be her first. That is the only promise I have made since I took my oath to the High Priestess, and I mean to keep both." },
      },
      choices = {
        { text = "Then may you both last long. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Warmly? We let them through our gates and into our temple, which is more than the elders would have done a century ago. Some of them still drop axes on our walkways." },
      },
      choices = {
        { text = "Then teach them, and they'll learn your ways.", next = "BACK", reply = "Perhaps, though not quickly. Some of them never stop chopping things.", fx = { align = { order = -1 } } },
        { text = "Caution keeps a city safe. You're right to hold back.", next = "BACK", reply = "Yes. Watching costs nothing, and trust can cost everything.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Then go to the Warrior's Terrace and ask for a captain, and be ready to walk for years before you ride. Most who ask never finish the walking, but the ones who do never regret it." },
      },
      choices = {
        { text = "I'll think on it. Something else.", next = "BACK" },
      },
    },
    x_hm = {
      lines = {
        { id = "xh1", text = "I trust Stormwind's word, because the High Priestess does. I trust Stormwind's soldiers when I have watched them a season, and not an hour before. That is not unkindness, only patrol." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    tyrande = { { id = "tp_ty", text = "I took my oath at the High Priestess's own hands. I do not speak of her lightly, and neither should you." } },
    background = { { id = "tp_bg", text = "I am a huntress of the Sentinels, and this patrol is my post. That is all you need to know of me." } },
    sentinels = { { id = "tp_sen", text = "We guard what remains to our people. We do it mounted, and we do not sleep on watch." } },
    _none = { { id = "tp_none", text = "That is no matter for the patrol. Ask at the Warrior's Terrace." } },
  },
}

-- Huntress Skymane: the other mounted patrol; a shade warmer than Ravenoak.
P:NPC {
  key = "dar_huntress_skymane", id = TODO_NPC("Huntress Skymane"), name = "Huntress Skymane", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "proud" }, values = { "dutiful", "loyal" },
  notices = { "race" },
  impression = {
    first = "Huntress Skymane patrols the walkways of Darnassus on a great nightsaber, and one of her hands is always in its ruff. She is brisk with people, and noticeably gentler with the cat.",
    third = "{name} met Huntress Skymane on her patrol of Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. Walk beside us if you must speak, for the patrol does not stop." },
    { id = "g_back", when = { metBefore = true }, text = "I know your face. Say what you need while the saber is in a patient mood." },
  },
  notice = {
    { id = "n_outlander", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You are a guest of Darnassus, and you will be treated as one. Stay on the walkways, and do not carry open flame beneath the boughs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Huntress Skymane, of the Sentinels. Ravenoak and I ride the city's paths in turn, so that no stretch of walkway goes long without eyes upon it." } },
      again = { { id = "h_again_x", text = "Ask what you like. She is listening too." },
        { id = "h_again", text = "What else? Be quick about it." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "That is a fine nightsaber.", next = "saber" },
        { text = "What is Huntress Ravenoak like?", next = "ravenoak" },
        { text = "Do Sentinel sabers and hunters' cats ever quarrel?", next = "hunt_quarrel", when = { class = "HUNTER" } },
        { text = "Where did you find your saber?", next = "x_find" },
        { text = "Beasts are only tools for war.", next = "x_st" },
        { text = "Could you teach me to ride a saber?", next = "x_ne", when = { race = "NightElf" } },
        { text = "My people ride rams.", next = "x_dw", when = { race = "Dwarf" } },
        { text = "Safe patrol, Huntress.", next = "END" },
      },
    },
    saber = {
      lines = {
        { id = "s_hunter", when = { class = "HUNTER" }, text = "She is, and you have an eye for it, hunter. I raised her from a cub, and she has carried me through things that I would not have ridden into on any other back." },
        { id = "s_default", text = "She is the finest in the city, though every huntress will tell you the same of her own. I raised her from a cub, and we have not been parted for a day since." },
      },
      choices = {
        { text = "May I come closer?", next = "closer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    closer = {
      lines = { { id = "c_default", text = "You may come a little nearer, but keep your hands at your sides. She will bear a stranger near her so long as I am calm, and I am calm so long as nobody reaches for her ears." } },
      choices = { { text = "Hands at my sides, then. Something else.", next = "BACK" } },
    },
    ravenoak = {
      lines = { { id = "r_default", text = "She is sterner than I am, and the better rider, though I will deny having said it. We have shared this round for many years, and I have never once found her post empty when I reached it." } },
      choices = { { text = "High praise among Sentinels. Something else.", next = "BACK" } },
    },
    hunt_quarrel = {
      lines = {
        { id = "hqr_default", text = "Only over who gets the sunny stretch of walkway, and the Sentinel cats always win, because they were here first and they know it. Keep yours close on the paths, and nobody needs to lose any fur." },
      },
      choices = { { text = "I'll keep mine close.", next = "BACK" } },
    },
    x_find = {
      lines = {
        { id = "xf1", text = "She found me, truly. I was a novice in the Moonglade groves, and she followed me home three nights running until the druids said it would be rude to send her away." },
      },
      choices = {
        { text = "Why do you think she chose you?", next = "x_find2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_find2 = {
      lines = {
        { id = "xf2", text = "I shared my bread with her the first night, which the druids say was foolish and kind in equal parts. Cats remember kindness longer than any priestess remembers a sermon." },
      },
      choices = {
        { text = "And now she patrols with you.", next = "x_find3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_find3 = {
      lines = {
        { id = "xf3", text = "She patrols, and I am carried. The Sentinels joke that she holds the rank and I hold the reins, and some days they are right. She saw a thief in the gardens last winter before I did." },
      },
      choices = {
        { text = "She's a fine Sentinel. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Tools? You have never sat up through a fever with a cat who would not leave your side. Tell me, would you say that to Ravenoak, or only to me?" },
      },
      choices = {
        { text = "Forgive me. They're comrades, not tools.", next = "BACK", reply = "Better. She heard you, and I think she forgives you.", fx = { align = { light = 1 } } },
        { text = "I'd say it to anyone. War has no room for sentiment.", next = "BACK", reply = "Then I hope you never fight beside a nightsaber, for its sake.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Not on her, she would not have it. Go to Jartsam, who trains riders and the sabers that will bear them. He is kinder than he looks, though not by much." },
      },
      choices = {
        { text = "I'll find him. Something else.", next = "BACK" },
      },
    },
    x_dw = {
      lines = {
        { id = "xd1", text = "Rams! I saw one in Auberdine, and she growled at it for a full hour. It did not seem to care, and I liked it for that, though it smelled like a stable full of beer." },
      },
      choices = {
        { text = "That's about right. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    tyrande = { { id = "tp_ty", text = "The High Priestess rode a white saber into the War of the Ancients, they say. Every Sentinel's cat descends from that story." } },
    background = { { id = "tp_bg", text = "I am a huntress of the Sentinels, and I ride the walkways of Darnassus with my saber." } },
    sentinels = { { id = "tp_sen", text = "We are the watch of the kaldorei, by day and by night. I am proud to ride among them." } },
    _none = { { id = "tp_none", text = "I cannot help you with that, and I cannot stop to try. Ask a Sentinel who is standing still." } },
  },
}

-- Jareth Wildwoods: a young night elf of the city, restless for the forests beyond it.
P:NPC {
  key = "dar_jareth_wildwoods", id = TODO_NPC("Jareth Wildwoods"), name = "Jareth Wildwoods", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "restless", "friendly" }, values = { "freedom", "curiosity" },
  notices = { "class" },
  impression = {
    first = "Jareth Wildwoods is young as night elves go, and he looks past the edge of the city more often than at it. He questions every traveller about the road they came by.",
    third = "{name} met Jareth Wildwoods, a restless young night elf in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Well met! You have come up from Rut'theran, have you not? Tell me, how did the forest look from the shore?" },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Where have you been since, and was it somewhere with a great many trees?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You are a hunter, and you have been out in the wilds, for I can smell pine on your cloak. I envy you more than I can politely say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Jareth Wildwoods, and I know what you are thinking, which is that the name suits somebody who lives in a forest and not in a city. I think so as well, and I remind my family of it often." } },
      again = { { id = "h_again_x", text = "Go on. You've seen more of the world than I have." },
        { id = "h_again", text = "What else can I ask you? I mean, what else can you ask me?" },
        { id = "h_again2", text = "Go on, I like talking with travellers." },
      },
      choices = {
        { text = "Why not leave for the forest, then?", next = "leave" },
        { text = "Darnassus is in a tree. Isn't that enough?", next = "tree" },
        { text = "Who keeps you here?", next = "x_who" },
        { text = "The young should obey their elders.", next = "x_st" },
        { text = "I came here through Ashenvale.", next = "x_ash", when = { race = "NightElf" } },
        { text = "What would you see in Stormwind?", next = "x_sw", when = { race = "Human" } },
        { text = "Good luck to you, Jareth.", next = "END" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "I mean to, as soon as I have finished my training. My mother says Ashenvale is no place for somebody who has never drawn a bow in anger, and she is right, which I find the most annoying thing about her." } },
      choices = {
        { text = "Listen to her. Ashenvale is at war.", next = "war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "I know it, truly, and I know that the Warsong are no tale to frighten children with. But those are our forests they are cutting, and I do not think I can sit in the branches for ever while somebody else defends them.", fx = { learn = { "warsong" } } } },
      choices = { { text = "Then train hard first. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tree = {
      lines = {
        { id = "t_ne", when = { race = "NightElf" }, text = "You must feel it too, surely. It is one tree, however great it is, and one may walk every bough of it in a few days. A forest has no end that you can reach by supper." },
        { id = "t_default", text = "It is one tree, friend, however great it is. I have walked every bough of it, and a forest is something else, because you can walk in one for a year and still not know it." },
      },
      choices = { { text = "I see the difference. Something else.", next = "BACK" } },
    },
    x_who = {
      lines = {
        { id = "xw1", text = "My mother, who serves at the Temple, and who has already lost a brother at the Silverwing outpost in Ashenvale. She says I may go when I am older, which for a night elf could mean anything at all." },
      },
      choices = {
        { text = "What would you do in Ashenvale?", next = "x_who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who2 = {
      lines = {
        { id = "xw2", text = "Join the Silverwing Sentinels, or the druids at Astranaar, or anything that does not involve sweeping the Temple steps. I would like to see the Warsong orcs with my own eyes, though Mother says I would only see them once." },
      },
      choices = {
        { text = "She's not wrong. They're fierce.", next = "x_who3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who3 = {
      lines = {
        { id = "xw3", text = "So everyone tells me, and so I keep asking travellers like you. If enough of you say it, perhaps I will believe it, and perhaps then she will let me go, knowing I believe it." },
      },
      choices = {
        { text = "I hope she does. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "You sound like every priestess on the Temple steps. Is it really so wrong for me to want to choose my own road?" },
      },
      choices = {
        { text = "Your elders have lived longer. Listen to them.", next = "BACK", reply = "I have been listening for two hundred years, and I am still here.", fx = { align = { order = 1 } } },
        { text = "Your life is yours. Choose your road.", next = "BACK", reply = "That is the best thing anyone has said to me all season.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ash = {
      lines = {
        { id = "xa1", text = "Then tell me, is the forest still green near Astranaar? The Sentinels only ever tell me that it is holding, which I have learned is what they say when it is not." },
      },
      choices = {
        { text = "It's holding. Mostly. Something else.", next = "BACK" },
      },
    },
    x_sw = {
      lines = {
        { id = "xs2", text = "The harbour, and the great cathedral with all its bells, and the men who build walls of stone just to feel safe. I would like to know if they feel safe inside them, or only tired." },
      },
      choices = {
        { text = "Both, I think. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    sentinels = { { id = "tp_sen", text = "The Silverwing Sentinels hold Ashenvale. I would give a great deal to stand with them, and Mother would give more to stop me." } },
    background = { { id = "tp_bg", text = "I was raised in Darnassus, and I would like to see something that is not Darnassus." } },
    warsong = { { id = "tp_ws", text = "The orcs in Ashenvale. I have never seen one, and I think about them more than I should." } },
    _none = { { id = "tp_none", text = "I have not heard of that, but then I have never been anywhere. Will you tell me about it?" } },
  },
}

-- Sarin Starlight: a finely dressed night elf of the city who keeps an eye on the stars.
P:NPC {
  key = "dar_sarin_starlight", id = TODO_NPC("Sarin Starlight"), name = "Sarin Starlight", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "courtly", "dreamy" }, values = { "tradition", "wonder" },
  notices = { "race" },
  impression = {
    first = "Sarin Starlight wears a silvered breastplate over a fine robe, as if he had dressed for a council and a battle on the same evening. He looks up through the leaves a great deal, and speaks of the stars as of old acquaintances.",
    third = "{name} met Sarin Starlight, a courtly night elf of Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. You find me counting what I can see of the sky, which through these leaves is never quite enough." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again beneath the same stars, though they have turned a little since." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune-adore. It is a clear night above the boughs, and I am glad of someone to share it with." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You are human, and I am told that your people name the stars differently than we do. I should like to hear one of your names for them, if you know any." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sarin, of the Starlight family. I keep the old habit of watching the heavens, which my people did long before we had a tree to stand in, and I dress for the occasion, as you see." } },
      again = { { id = "h_again_x", text = "The sky is still there. Ask what you will." },
        { id = "h_again", text = "What else would you speak of?" },
        { id = "h_again2", text = "Please, continue. The stars are patient." },
      },
      choices = {
        { text = "Why armor over a robe?", next = "armor" },
        { text = "What do the stars tell you?", next = "stars" },
        { text = "Who taught you to read the stars?", next = "x_who" },
        { text = "Omens are for the timid. A warrior makes his own fate.", next = "x_st" },
        { text = "Do the stars speak of Elune?", next = "x_pr", when = { class = "PRIEST" } },
        { text = "Mages chart the stars too.", next = "x_mg", when = { class = "MAGE" } },
        { text = "Clear skies, Sarin.", next = "END" },
      },
    },
    armor = {
      lines = { { id = "a_default", text = "The robe is for what I should prefer to be doing, and the breastplate is for what the times require. I wore neither for ten thousand years of peace, and I have worn both since the Legion returned, so that I am ready for whichever is wanted." } },
      choices = { { text = "A sign of the age. Something else.", next = "BACK" } },
    },
    stars = {
      lines = { { id = "s_default", text = "They tell me very little that I can use, and a great deal that I am glad to know. They are Elune's own lamps, and I find it steadies me to see that they are still where I left them." } },
      choices = {
        { text = "Have they ever not been?", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = {
        { id = "c_ne", when = { race = "NightElf" }, text = "You know the tale as I do. When the Legion first came, the sky itself burned green, and those of us who saw it have looked up every night since to be sure." },
        { id = "c_default", text = "Once, they were not. When the Burning Legion first came to this world, long before your people's histories begin, the sky burned green, and I have looked up every night since to be sure that it has not happened again." },
      },
      choices = { { text = "May it never. Something else.", next = "BACK" } },
    },
    x_who = {
      lines = {
        { id = "xw1", text = "My father, and his mother before him, who watched the sky from the towers of Suramar before the Sundering. We are an old family, and we have kept the habit, if not the towers." },
      },
      choices = {
        { text = "Suramar was a Highborne city.", next = "x_who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who2 = {
      lines = {
        { id = "xw2", text = "It was, and my family lived in it without being Highborne, which was a quiet distinction in those days and a great one afterwards. We watched the stars and not the Well, and that is why we are still here." },
      },
      choices = {
        { text = "Do you ever regret what was lost?", next = "x_who3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who3 = {
      lines = {
        { id = "xw3", text = "I regret the towers and the libraries, and I do not regret the Queen. The druids taught us to live without the Well's magic, and I keep only this armor to remind me that knowledge must be guarded." },
      },
      choices = {
        { text = "A wise balance. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Many young ones say so, and many of them fell on the slopes of Hyjal. The stars do not command, but they do warn, and only a fool refuses to listen to a warning." },
      },
      choices = {
        { text = "Heed the warnings. Wisdom is not timidity.", next = "BACK", reply = "Spoken like someone who has looked up at least once.", fx = { align = { order = 1 } } },
        { text = "I'd rather trust my own blade than any star.", next = "BACK", reply = "Then may your blade be sharper than your patience.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_pr = {
      lines = {
        { id = "xp1", text = "The moon is hers, and the stars are her lanterns, or so the Sisterhood teaches. I only note when they move, and leave the priestesses to say why." },
      },
      choices = {
        { text = "A gentle answer. Something else.", next = "BACK" },
      },
    },
    x_mg = {
      lines = {
        { id = "xm1", text = "They do, though they chart them for power and we chart them for warning. I do not judge a mage for that, but I watch them closely, as my family watched Suramar's towers long ago." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    highborne = { { id = "tp_hb", text = "My family lived beside the Highborne in Suramar. We watched the sky, and they watched the Well, and only one of us was wise." } },
    background = { { id = "tp_bg", text = "I am of the Starlight family, and I watch the sky. There are worse ways to spend an age." } },
    _none = { { id = "tp_none", text = "I am afraid that is not written anywhere I can read, traveller, above or below." } },
  },
}

-- Sentinel Dalia Sunblade: at the Temple of the Moon; gives Eyes of the Sentinels.
P:NPC {
  key = "dar_dalia_sunblade", id = TODO_NPC("Sentinel Dalia Sunblade"), name = "Sentinel Dalia Sunblade", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "darnassus" }, temper = { "disciplined", "direct" }, values = { "duty", "vigilance" },
  notices = { "class", "race" },
  impression = {
    first = "Sentinel Dalia Sunblade stands her post at the Temple of the Moon, straight as a glaive. She looks at a traveller as a quartermaster looks at a new blade, wondering what use might be made of it.",
    third = "{name} met Sentinel Dalia Sunblade at the Temple of the Moon.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. You stand before the Temple of the Moon, so state your business, and state it truthfully." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. Tell me what you have seen since we last spoke." },
    { id = "g_active", when = { questActive = TODO_QUEST("Eyes of the Sentinels") }, text = "You carry my charge, {class}. Have you a report for me, or do you need the task set out again?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Eyes of the Sentinels") }, text = "Elune-adore. The Sentinels remember those who have served as their eyes, and you are welcome at this post." },
  },
  notice = {
    { id = "n_ne", cat = "race", when = { race = "NightElf" },
      text = "You are kaldorei, and of an age to serve. The Sentinels have need of every one of us, whether or not you wear the armor." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You pass unseen when you choose to, and that is a rarer gift than a strong arm. I could find a use for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_done", when = { questDone = TODO_QUEST("Eyes of the Sentinels") }, text = "You have served as our eyes once already, and served well. The watch does not end, and I will always hear what you have seen on your travels." },
        { id = "h_default", text = "I am Sentinel Dalia Sunblade. I guard this Temple, and I gather word for those who command us, because the Sentinels cannot defend what they cannot see." },
      },
      again = {
        { id = "h_again", text = "What more would you ask, {class}?" },
        { id = "h_again2", text = "Speak. My post allows for a few words." },
        { id = "h_again3", when = { questActive = TODO_QUEST("Eyes of the Sentinels") }, text = "Go on, and then be about the task." },
      },
      choices = {
        { text = "What do the Sentinels need to see?", next = "eyes" },
        { text = "Why do you guard the Temple?", next = "temple" },
        { text = "The Sentinels seem stretched thin.", next = "thin" },
        { text = "I am kaldorei. How may I serve?", next = "serve", when = { race = "NightElf" } },
        { text = "What does a Sentinel gather word about?", next = "ne_word", when = { race = "NightElf" } },
        { text = "Elune keep your watch.", next = "END" },
      },
    },
    eyes = {
      lines = { { id = "e_default", text = "We need to see everything beyond the reach of our own patrols. Our lands are wide and our numbers are not what they once were, so that a Sentinel on a border post knows her own stretch of forest and nothing of the next valley." } },
      choices = {
        { text = "And travellers can fill the gaps?", next = "gaps" },
        { text = "What have your own eyes missed?", next = "missed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gaps = {
      lines = { { id = "gaps_default", text = "They can, if they are willing to look and to report honestly. An adventurer crosses three territories in the time that a patrol holds one, and what you notice in passing may be the warning that some outpost has waited a season to hear.", fx = { learn = { "sentinels" } } } },
      choices = {
        { text = "What makes a report worth hearing?", next = "report" },
        { text = "Something else.", next = "BACK" },
      },
    },
    report = {
      lines = { { id = "r_default", text = "Tell me what you saw, and not what you suppose. Give me numbers, a place and the direction of travel, and leave the guessing to those of us who must answer for it." } },
      choices = { { text = "Plain and exact, then. Something else.", next = "BACK" } },
    },
    missed = {
      lines = { { id = "m_default", text = "We have missed too much. The furbolgs of these woods turned on us before we understood that anything ailed them, and the Warsong had cut deep into Ashenvale before word of their full numbers reached Darnassus.", fx = { learn = { "warsong" } } } },
      choices = { { text = "Late word is costly. Something else.", next = "BACK" } },
    },
    temple = {
      lines = { { id = "t_default", text = "I guard it because it is the heart of our people, and because the High Priestess stands within it. Tyrande Whisperwind led the Sentinels through ten thousand years of watching, and I count it the highest honour to hold the door behind which she serves." } },
      choices = {
        { text = "Has the Temple ever been threatened?", next = "threat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threat = {
      lines = { { id = "th_default", text = "It has not been, in my time at this post, and I intend for it to remain so. I would rather stand ten thousand quiet watches than a single eventful one." } },
      choices = { { text = "May they all be quiet. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    thin = {
      lines = { { id = "tn_default", text = "We are, and I will not insult you by pretending otherwise. We lost many on Hyjal, our druids are only lately woken from the Dream, and our borders now run from Darkshore to the edge of the Barrens." } },
      choices = { { text = "The Alliance stands with you. Something else.", next = "BACK", reply = "So we are told, and so I have begun to see. It is strange to us, after so long alone, but it is not unwelcome." } },
    },
    serve = {
      lines = { { id = "s_default", text = "You may serve by going out and by coming back. See the lands that we hold and the lands that we are losing, and bring what you learn to a Sentinel, for there has been too little of that among our young." } },
      choices = { { text = "I will be your eyes. Something else.", next = "BACK" } },
    },
    ne_word = {
      lines = {
        { id = "nwd_default", text = "Warsong movements in Ashenvale, satyrs in Felwood, the naga on the Darkshore coast who still wear Highborne faces under their scales. The High Priestess wants to know everything that moves near our borders, and I would rather she learn it from me than from a funeral." },
      },
      choices = { { text = "Then I'll bring you word when I have it.", next = "BACK", fx = { affinity = 1, learn = { "queen_azshara" } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Sentinel of the Sunblade family, and my post is the Temple of the Moon. I ask for no other." } },
    sentinels = { { id = "tp_sen", text = "We are the watch of our people, and we see only as far as our eyes reach. That is why I ask travellers to look for us." } },
    warsong = { { id = "tp_ws", text = "They fell our forests in Ashenvale. I would know their numbers better than I do." } },
    _none = { { id = "tp_none", text = "I have no word of that, {class}. If you learn something, bring it to me." } },
  },
}

-- Darnassian Protector: the treants who walk the Cenarion Enclave. Not Sentinels; servants of the
-- forest who answer to the druids. Slow, patient, speaks of seasons and roots. Without this entry the
-- name match ("protector$") put them on the Sentinel guard tree.
P:NPC {
  key = "dar_protector", id = TODO_NPC("Darnassian Protector"), name = "Darnassian Protector", title = "Treant",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "patient", "slow" }, values = { "growth", "the forest" },
  notices = { "class", "race" },
  impression = {
    first = "A treant of the Enclave, who takes a long while to answer and seems to think that is quite fast.",
    third = "{name} spoke with a Darnassian Protector, one of the treants who walk the Cenarion Enclave.",
  },
  greetings = {
    { id = "g_hello", text = "Hroom. A small one, walking very quickly. Hello, little sapling, hello." },
    { id = "g_back", when = { metBefore = true }, text = "Hmmm, you again. You have grown a little, I think, though it is hard to tell with your kind. You grow so fast, and so short." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "Hmmm. You smell of moss and moonlight, druid. The Enclave is glad of you, and so are my roots." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Hrrrm. There is fel on you, little one. My roots draw back from it, and roots are rarely wrong." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Hroom. You carry an axe, dwarf. I will not ask what you use it for, and you will not use it here. No, not here." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hmmm. Hiding among the trees, little one? I am the trees." } },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hroom. Hmmm. I am a protector of this grove, as my kind have been since the forests were young. The druids of the Enclave tend Teldrassil, and I tend the druids. Speak slowly, little one, slowly, and I will listen." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Hmmm. The moon is high, and the sap runs quiet in the branches. It is a good hour for talking, if you do not hurry it. Few things are made better by hurrying." },
      },
      again = {
        { id = "a_more", text = "Hmmm, something more? Take your time, little one. I have a great deal of it, more than I know what to do with." },
      },
      choices = {
        { text = "What are you, exactly?", next = "what" },
        { text = "Who do you answer to?", next = "master" },
        { text = "How does Teldrassil fare?", next = "tree" },
        { text = "Are you a Sentinel too?", next = "sentinel" },
        { text = "I'll leave you to your grove.", next = "END" },
      },
    },
    what = {
      lines = { { id = "wh_default", text = "Hroom. A treant, little one. The druids call us up from the old wood and ask us to keep watch, and we do, season after season, for as long as the wood needs us. Some say we are children of Cenarius. I only know that I woke here, slowly, and that this grove is mine to guard." } },
      choices = {
        { text = "That sounds like a lonely life.", next = "lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lonely = {
      lines = { { id = "lo_default", text = "Lonely? Hmmm, no. There are the birds, and the druids, and the roots of every tree around us, talking softly underground. It is only that your kind talk very fast, and leave very soon." } },
      choices = {
        { text = "Then I'll stay and talk a while longer.", next = "BACK", reply = "Hmmm. Kind of you, little one. Few saplings do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some of us have places to be.", next = "BACK", reply = "Hroom. Yes, you always do. The trees will still be here when you come back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master = {
      lines = { { id = "ma_default", text = "Hmmm. To the Cenarion Circle, and to the Archdruid who leads it from this Enclave. Fandral Staghelm planted Teldrassil himself, and he asks a great deal of her. I do not always understand his hurry, but it is not a tree's place to question the gardener." } },
      choices = {
        { text = "Perhaps it should be. Gardeners make mistakes.", next = "BACK", reply = "Hrrrm. You say a thing I have thought for many seasons, and not said. Speak it softly here.", fx = { align = { order = -1 } } },
        { text = "He made a whole World Tree. Trust him.", next = "BACK", reply = "Hmmm, yes. Trust, and patience. Those are a tree's virtues, after all.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree = {
      lines = { { id = "tr_default", text = "Hmmm. She is young, and she grew too fast, and some of her roots ache. There is a sickness in the lower woods that the druids do not like to name. I feel it most at night, like a cold wind that does not move the leaves." } },
      choices = {
        { text = "Something should be done about it.", next = "BACK", reply = "Hroom. Then you are a sapling with good roots. Tell the druids what you see in the lower woods.", fx = { align = { order = 1 } } },
        { text = "Trees get sick. She'll heal on her own.", next = "BACK", reply = "Hmmm. Perhaps, little one, perhaps. But I am a tree, and I am worried.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinel = {
      lines = { { id = "se_default", text = "Hroom, no. Hmmm. The Sentinels are the daughters of the Temple, with their glaives and their great cats. I have no glaive. If something harms this grove, I simply stand on it, and that tends to be enough." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    cenarius = { { id = "tp_cen", text = "Hmmm. The Lord of the Forest. I have never seen him, but every leaf in this grove knows his name." } },
    fandral = { { id = "tp_fan", text = "Hroom. The Archdruid. He walks quickly, for one so old, and he is always looking up at the branches, never down at the roots." } },
    _none = { { id = "tp_none", text = "Hmmm. I do not know that, little one. Ask a druid; they read books, and I read only rain." } },
  },
}
