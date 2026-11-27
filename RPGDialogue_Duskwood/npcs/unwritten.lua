-- Duskwood folk with no conversation yet: the Night Watch posts across the forest (Blomberg and
-- Hutchins at the crossroads, Corwin in Darkshire, Cutford on the Twilight Grove road, Jordan south
-- of town, and Gelwin, Merant, Sarys, Selkin and Thayer on the road north of the Rotting Orchard,
-- where Stitches walks), and the two Forsaken hiding at Beggar's Haunt, Apothecary Faustin and
-- Deathstalker Zraedus.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Watcher Blomberg: Night Watch at the central crossroads.
P:NPC {
  key = "dusk_watcher_blomberg", id = TODO_NPC("Watcher Blomberg"), name = "Watcher Blomberg", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "gruff", "weary" }, values = { "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "He counts the travellers through the crossroads and the ones who don't return.",
    third = "{name} met Watcher Blomberg of the Night Watch at the Duskwood crossroads.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, and I'll mark you down as still alive with real pleasure, {class}. It's a short list, and you're on it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're back. I'll mark you down, {class}, because that's my job, not because I'm glad." },
    { id = "g_default", text = "Halt, {class}. State your business, and then move along, because this crossing isn't a place to rest." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Good, I'll mark you down as still alive." },
  },
  start = "hello",
  nodes = {
    blo_hope1 = {
      lines = {
        { id = "blo_hope1_1", text = "A girl from Addle's Stead, eleven years old, who went out after a lost sheep two winters ago. Every other name from that season I've crossed out, but I can't bring myself to cross out hers." },
      },
      choices = {
        { text = "Did anyone search?", next = "blo_hope2" },
        { text = "Leave it as it is. Hope costs nothing.", next = "blo_hope2" },
        { text = "Something else, Blomberg.", next = "BACK" },
      },
    },
    blo_hope2 = {
      lines = {
        { id = "blo_hope2_1", text = "Half the Watch, for three days, and they found the sheep and nothing else. Hutchins says I should let her go, and then he asks me about her every winter, so I don't think he means it." },
      },
      choices = {
        { text = "Then neither of you has let her go.", next = "BACK" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    blo_road1 = {
      lines = {
        { id = "blo_road1_1", text = "The road west to Raven Hill and the Westfall border, which surprises people. Adventurers go that way for the necromancer, merchants go that way to dodge the north road prices, and fools go that way because nobody told them not to." },
      },
      choices = {
        { text = "And the fewest?", next = "blo_road2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blo_road2 = {
      lines = {
        { id = "blo_road2_1", text = "The south road toward Stranglethorn, where the Vile Reef sits and the murlocs come up out of the water. Watcher Jordan walks it now, young as he is, and I put his name in the book every time he goes out." },
      },
      choices = {
        { text = "You worry about him.", next = "blo_road3" },
        { text = "Back to other matters.", next = "BACK" },
      },
    },
    blo_road3 = {
      lines = {
        { id = "blo_road3_1", text = "I worry about all of them, but Jordan more, because he goes out like he's daring the road to take him. His brother Daniel went out the same way, and I crossed out that name myself." },
      },
      choices = {
        { text = "I'll keep an eye on him. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Watcher Blomberg, Night Watch. I keep a tally of everyone who passes this crossroads, coming and going, so we know who to look for when they don't come back.", fx = { learn = { "night_watch" } } } },
      again = {
        { id = "h_again", text = "Anything else? I've got names to write." },
        { id = "h_again2", text = "Ask, but keep it quick." },
      },
      choices = {
        { text = "Every missing name in the tally deserves a proper search.", next = "BACK", reply = "That's why I keep it, so somebody knows where to start looking. Most of the searches end at a grave, but at least they end.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strike the missing off quickly; searching just loses more men.", next = "BACK", reply = "That's sense, of a sort, and the Commander says it too. I still keep their names a week longer than I should.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How many don't come back?", next = "tally" },
        { text = "What's the worst thing on these roads?", next = "worst" },
        { text = "Show me how the tally works.", next = "xbook" },
        { text = "Do you know Hutchins well?", next = "xhutch" },
        { text = "Who was the last name you crossed out?", next = "xlast" },
        { text = "Mark me down as a Darkshire friend.", next = "BACK", when = { faction = "Alliance" }, reply = "Done, and I've put a star by it, which I don't do for many. Come back through here so I can mark you home." },
        { text = "Is there a name in your book you still hope for?", next = "blo_hope1" },
        { text = "Which road gets the most travellers?", next = "blo_road1" },
        { text = "Carry on, Watcher.", next = "END" },
      },
    },
    tally = {
      lines = { { id = "t_default", text = "More than I'd like and fewer than you'd think, but every one of them is a name in my book with no mark beside it. I read those names over at night, so I don't forget them." } },
      choices = {
        { text = "Their families deserve to know what happened.", next = "BACK", reply = "They do, and when I can tell them, I do. Most times I can't.", fx = { align = { light = 1 } } },
        { text = "Some people simply aren't meant for the woods.", next = "BACK", reply = "Maybe so, but the woods don't care who's meant for them. Remember that.", fx = { align = { light = -1 } } },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "The dead from Raven Hill, the worgen in the west, and that stitched-together horror from the Rotting Orchard that walks the road whenever it pleases. If you see a thing taller than a man with a cleaver, run toward Darkshire and shout.", fx = { learn = { "raven_hill" } } } },
      choices = { { text = "I'll keep that in mind. Something else.", next = "BACK" } },
    },
    xbook = {
      lines = {
        { id = "xxbook_0", text = "Name, purpose and direction when you pass, and a mark when you return. Three days without a mark and I send word to the commander. Most never get their mark, and I keep the book anyway." },
      },
      choices = {
        { text = "Who reads the book besides you?", next = "xreaders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xreaders = {
      lines = {
        { id = "xxreaders_0", text = "Commander Ebonlocke, once a week, and the families when they come asking. I'd sooner they didn't ask, because the book only ever has bad news or no news." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhutch = {
      lines = {
        { id = "xxhutch_0", text = "Twelve years at my side. He talks enough for both of us, and I count enough for both of us, so the crossroads gets a full watch out of two half-men." },
      },
      choices = {
        { text = "Do his jokes ever wear thin?", next = "xjokes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xjokes = {
      lines = {
        { id = "xxjokes_0", text = "Every day. And every day I'd miss them if they stopped. Don't tell him I said that, or I'll never hear the end of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlast = {
      lines = {
        { id = "xxlast_0", text = "A peddler out of Lakeshire, heading for Raven Hill to sell candles to the dead, he said, as a joke. Two days later the Watch found his cart. Some say travellers should be turned back by force. What say you?" },
      },
      choices = {
        { text = "Turn them back. A life is worth the inconvenience.", next = "BACK", reply = "Commander won't allow it, but I'll whisper the warning louder next time.", fx = { align = { order = 1 } } },
        { text = "Folk have the right to choose their own road.", next = "BACK", reply = "Aye, that's the law. I just wish they chose better.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    night_watch = { { id = "tp_xnight_watch", text = "Darkshire's only real defence. We're thin, we're tired and we're still here." } },
    raven_hill = { { id = "tp_xraven_hill", text = "West of here. Don't go, and if you go, come back past me so I can mark the book." } },
    background = { { id = "tp_bg", text = "I've served the Watch eleven years. Ten of them at this crossroads, and the first one I'd rather forget." } },
    _none = { { id = "tp_none", text = "No idea. Ask in Darkshire, they've more time to think than I do." } },
  },
}

-- Watcher Hutchins: Night Watch at the central crossroads.
P:NPC {
  key = "dusk_watcher_hutchins", id = TODO_NPC("Watcher Hutchins"), name = "Watcher Hutchins", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "jovial", "watchful" }, values = { "dutiful", "brave" },
  notices = { "watch", "kit" },
  impression = {
    first = "He jokes about the dark because he's tired of fearing it.",
    third = "{name} met Watcher Hutchins of the Night Watch at the Duskwood crossroads.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! That's twice now you've chosen our cheerful little forest, {class}, and I'm starting to take it personally, in a good way." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I keep the spirits up around here, {class}, but even I've got my limits." },
    { id = "g_default", text = "Evening, {class}, though it's always evening in Duskwood, so that's an easy guess. What brings you to our cheerful little forest?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You must like it here, which makes you either brave or a bit cracked." },
  },
  notice = {
    { id = "n_priest", cat = "watch", when = { class = { "PRIEST", "PALADIN" } },
      text = "Light-bearer! Stand close for a moment, would you? I could use the glow." },
  },
  start = "hello",
  nodes = {
    hut_yrs1 = {
      lines = {
        { id = "hut_yrs1_1", text = "Everything but the signpost, friend. When I started, half the traffic was farmers going to market, and now it's adventurers going to fight, and the market's a stall at the town hall with three turnips on it." },
      },
      choices = {
        { text = "What about the signpost?", next = "hut_yrs2" },
        { text = "Something else, Hutchins.", next = "BACK" },
      },
    },
    hut_yrs2 = {
      lines = {
        { id = "hut_yrs2_1", text = "Still points to Grand Hamlet, if you can believe it, because nobody's had the heart to repaint it. I've offered twice, and twice Blomberg's told me the old name keeps the hope up, and he's right, the old grump." },
      },
      choices = {
        { text = "Leave it, then. It's a good sign.", next = "hut_yrs3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hut_yrs3 = {
      lines = {
        { id = "hut_yrs3_1", text = "A good sign, ha! I'll have that one, friend, and I'll use it on Blomberg tonight and he won't laugh at it either. That's how I know it's a good one, because he tries hardest not to laugh at the good ones." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hut_blo1 = {
      lines = {
        { id = "hut_blo1_1", text = "He does, you know, only on the inside where nobody can see it. You can tell by his left ear, which goes red, and I've been watching that ear for twelve years like a farmer watches the weather." },
      },
      choices = {
        { text = "I'll watch the ear next time.", next = "hut_blo2" },
        { text = "A gnome would build you a laugh meter.", next = "hut_blo2", when = { race = "Gnome" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut_blo2 = {
      lines = {
        { id = "hut_blo2_1", text = "Do, and you'll see what I mean, though don't let him catch you at it. A watcher who's been caught smiling never hears the end of it at the Raven, and he's got a reputation to keep up as the grimmest man in Duskwood." },
      },
      choices = {
        { text = "Your secret's safe with me. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Watcher Hutchins, at your service. Blomberg keeps the tally, and I keep the spirits up, which is the harder job, believe me." } },
      again = {
        { id = "h_again", text = "What else? I've jokes to spare, if nothing else." },
        { id = "h_again2", text = "Go on, I'm listening. The trees certainly aren't." },
      },
      choices = {
        { text = "Make your jokes, but never at the families' expense.", next = "BACK", reply = "Never, not once. You laugh with the folk here, not at them, or they'd have every right to throw you to the wolves.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A cruel joke still gets a laugh, and laughs are scarce here.", next = "BACK", reply = "Scarce, aye, but not that scarce. I'd sooner stand here in silence than get a laugh out of somebody's grief.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How do you keep laughing in a place like this?", next = "laugh" },
        { text = "Why is it always dark here?", next = "dark" },
        { text = "Tell me your best joke.", next = "xjoke" },
        { text = "What does Blomberg really think of you?", next = "xblom" },
        { text = "Do you ever get scared?", next = "xscared" },
        { text = "Do dwarves tell good jokes, you think?", next = "BACK", when = { race = "Dwarf" }, reply = "The best, friend, though half of them are about beer and the other half are about beards. I'd trade jokes with you any night." },
        { text = "Twelve years at the crossroads. What's changed?", next = "hut_yrs1" },
        { text = "Blomberg never laughs at your jokes.", next = "hut_blo1" },
        { text = "Take care, Hutchins.", next = "END" },
      },
    },
    laugh = {
      lines = { { id = "l_default", text = "Because the alternative is weeping, and I tried that my first winter in the Watch. It didn't scare off a single ghoul, so I switched to jokes, and the ghouls don't laugh either, but I feel better." } },
      choices = {
        { text = "Laughter's a kind of courage.", next = "BACK", reply = "That's what I tell Blomberg, and he tells me to keep quiet.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark = {
      lines = { { id = "d_default", text = "Nobody's sure, and everyone's got a theory. The old folk blame the tower of Karazhan off to the east, the priests blame some curse, and Madame Eva just smiles and says nothing, which is worse." } },
      choices = {
        { text = "A curse, surely. Something unnatural did this.", next = "BACK", reply = "Could be, and if so, I'd like a word with whoever cast it.", fx = { align = { light = 1 } } },
        { text = "Dark is just dark. Fear does the rest.", next = "BACK", reply = "Easy to say in daylight, friend. Come back at midnight and tell me again.", fx = { align = { light = -1 } } },
      },
    },
    xjoke = {
      lines = {
        { id = "xxjoke_0", text = "What's the difference between a ghoul and a tax collector? A ghoul only takes what's left of you. Blomberg doesn't laugh at that one, but he's never paid taxes in Stormwind." },
      },
      choices = {
        { text = "That's grim.", next = "xgrim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgrim = {
      lines = {
        { id = "xxgrim_0", text = "Everything's grim in Duskwood, friend! The trick is to be grim on purpose, so the forest doesn't get the satisfaction." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xblom = {
      lines = {
        { id = "xxblom_0", text = "That I talk too much and work too little, and he's right on both counts. But he'd go mad on that crossroads without me, and he knows it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xscared = {
      lines = {
        { id = "xxscared_0", text = "Every night, friend. Some say a watcher should never show fear, so the town stays calm. Others say you're a fool if you don't. What do you think?" },
      },
      choices = {
        { text = "Show courage, even if you don't feel it.", next = "BACK", reply = "That's what the jokes are for. A mask with a grin on it.", fx = { align = { light = 1 } } },
        { text = "Fear keeps you alive. Don't hide it.", next = "BACK", reply = "Aye, and it keeps my feet quick. I won't pretend otherwise.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    blomberg = { { id = "tp_xblomberg", text = "My oldest friend and my worst audience." } },
    darkshire = { { id = "tp_xdarkshire", text = "Home, for better or worse, and lately mostly worse." } },
    background = { { id = "tp_bg", text = "Born in Darkshire, joined the Watch at sixteen. Haven't seen the sun properly since." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, but I could tell you a joke instead, if you like." } },
  },
}

-- Watcher Corwin: Night Watch posted in Darkshire.
P:NPC {
  key = "dusk_watcher_corwin", id = TODO_NPC("Watcher Corwin"), name = "Watcher Corwin", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "stern", "watchful" }, values = { "dutiful", "family" },
  notices = { "watch" },
  impression = {
    first = "He guards the town his family has lived in for generations.",
    third = "{name} met Watcher Corwin of the Night Watch, posted in Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back in town, and I remember your face well, {class}. You're welcome on my streets at any hour of the night." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I remember your face, {class}, and that's not a compliment. Keep to the lamplight where I can watch you." },
    { id = "g_default", text = "Welcome to Darkshire, {class}. Keep to the lamplight, and if you hear a howl, come inside." },
    { id = "g_back", when = { metBefore = true }, text = "Back in town, I see. Good, the streets are safer with more blades in them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Corwin. I keep the streets of Darkshire, which means I see every face that comes in and remember most of them." } },
      again = {
        { id = "h_again", text = "Anything else you need?" },
        { id = "h_again2", text = "Go on. The town's quiet, for once." },
      },
      choices = {
        { text = "A watcher should treat strangers fairly, same as his own kin.", next = "BACK", reply = "My grandfather walked these streets saying the same thing. I do my best by it, though Darkshire folk always come first in my heart.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Look after your own; strangers can fend for themselves.", next = "BACK", reply = "That's the easy road, and I've been tempted by it. But strangers have bled for this town too, and they're owed the same.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who's in charge here?", next = "ebonlocke" },
        { text = "What troubles the town most?", next = "trouble" },
        { text = "Tell me about your grandfather.", next = "xgrand" },
        { text = "Who are the strangest folk in town?", next = "xodd" },
        { text = "Do you ever leave Darkshire?", next = "xleave" },
        { text = "I'm a paladin. Can I help the town?", next = "BACK", when = { class = "PALADIN" }, reply = "Bless you, aye. Go and see Commander Ebonlocke, and maybe stand a while by the church door. Folk sleep better seeing the Light about." },
        { text = "Good night, Watcher.", next = "END" },
      },
    },
    ebonlocke = {
      lines = { { id = "e_default", text = "Commander Althea Ebonlocke leads the Watch from the town hall, and Lord Ello Ebonlocke, her father, is the town's lord. She gives orders, and he gives speeches, and between them the town mostly holds together." } },
      choices = {
        { text = "You don't sound fond of the lord.", next = "lord" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lord = {
      lines = { { id = "lo_default", text = "I'll not speak against him, he's done right by us in his way. But it's the commander who walks the roads at night and the commander who buries the Watch, and I know which Ebonlocke I'd follow into the woods." } },
      choices = {
        { text = "A leader belongs on the front line.", next = "BACK", reply = "Aye, and that's where she is. More's the pity for the lord.", fx = { align = { honor = 1 } } },
        { text = "Lords must keep their distance to rule.", next = "BACK", reply = "Maybe so in Stormwind. Out here distance just looks like hiding.", fx = { align = { honor = -1 } } },
      },
    },
    trouble = {
      lines = { { id = "t_default", text = "Fear, mostly, because fear makes people leave, and every family that goes leaves the rest weaker. The undead and the worgen are bad, but empty houses are what keep me up at night." } },
      choices = { { text = "Then I'll help where I can. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xgrand = {
      lines = {
        { id = "xxgrand_0", text = "He was a carpenter when this was Grand Hamlet, a bright place with a fair every autumn. He cut the beams for the town hall himself, and the roof's never leaked in sixty years." },
      },
      choices = {
        { text = "Why did the name change?", next = "xname" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xname = {
      lines = {
        { id = "xxname_0", text = "When the woods went dark, folk started calling it Darkshire, half as a joke. Then the joke stuck, and nobody laughs about it now." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xodd = {
      lines = {
        { id = "xxodd_0", text = "Madame Eva, the fortune teller, who knows more than she tells. And old Abercrombie out by Raven Hill, who comes in for supplies and leaves with things I'd not want to see unwrapped." },
      },
      choices = {
        { text = "Should the Watch look into him?", next = "xabe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xabe = {
      lines = {
        { id = "xxabe_0", text = "The commander says we've no proof, and you can't arrest a man for odd shopping. I say a few questions never hurt anyone. Where do you stand on it?" },
      },
      choices = {
        { text = "Without proof, leave the man be.", next = "BACK", reply = "That's the lawful way, and I'll respect it, for now.", fx = { align = { order = 1 } } },
        { text = "Search his shack. Better safe than sorry.", next = "BACK", reply = "Quiet, now. Don't let the commander hear you say that, though I agree.", fx = { align = { order = -1 } } },
      },
    },
    xleave = {
      lines = {
        { id = "xxleave_0", text = "Once a year, to Stormwind, to petition for more soldiers. They give me a meal, a letter and a polite no, and I walk home again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darkshire = { { id = "tp_xdarkshire", text = "My town. Small, scared and stubborn, and I'll not have a word said against it." } },
    madame_eva = { { id = "tp_xmadame_eva", text = "She told my fortune once. I didn't like it, and it came true anyway." } },
    background = { { id = "tp_bg", text = "My grandfather built half these houses, back when it was Grand Hamlet. I'll not see them empty." } },
    _none = { { id = "tp_none", text = "Don't know. Clerk Daltry at the town hall keeps records of everything." } },
  },
}

-- Watcher Cutford: patrols the main road from Darkshire toward Twilight Grove.
P:NPC {
  key = "dusk_watcher_cutford", id = TODO_NPC("Watcher Cutford"), name = "Watcher Cutford", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "brisk", "wary" }, values = { "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "He patrols toward the grove and trusts nothing that glows there.",
    third = "{name} met Watcher Cutford of the Night Watch on the road toward Twilight Grove.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and still in one piece after the grove. The Light keep you, {class}, because you've the nerve I haven't." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Still heading for the grove? Go on, then, and I'll not walk you to the edge." },
    { id = "g_default", text = "Hold, {class}. You're on the grove road, and I'd advise you to turn back unless you've business with the dragons." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still heading for the grove? Light help you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Cutford. I walk the road from Darkshire toward the Twilight Grove, and I turn back before I reach it, because I'm not a fool." } },
      again = {
        { id = "h_again", text = "What else? Talk fast; I keep moving." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "If you won't go to the grove, say so plainly.", next = "BACK", reply = "I say it every day, {class}, loud enough for the Commander to hear. I'm not ashamed of turning back, only of lying about it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Tell the Commander you patrolled the grove; who's going to check?", next = "BACK", reply = "The dragons, maybe, and I'd rather not meet the ones who'd tell him. No, I'll go as far as I go and say exactly where that is.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's in the Twilight Grove?", next = "grove" },
        { text = "What else walks this road?", next = "road" },
        { text = "Have you ever seen the dragons?", next = "xseen" },
        { text = "Do the night elves come here?", next = "xelves" },
        { text = "Why do you turn back before the grove?", next = "xturn" },
        { text = "I'm a druid. The grove calls to me.", next = "BACK", when = { class = "DRUID" }, reply = "Then go with my blessing, but please, don't wake anything on my road. I've a long walk home." },
        { text = "What happened when you walked into the grove?", next = "y_inside" },
        { text = "Do you have family in Darkshire?", next = "y_family" },
        { text = "Safe walking, Cutford.", next = "END" },
      },
    },
    grove = {
      lines = { { id = "grove_default", text = "Green dragons, sleeping or something like it, and the trees there glow like nothing natural should. The night elves say it's a holy place, and I'll take their word for it from a good long way off.", fx = { learn = { "green_dragons" } } } },
      choices = {
        { text = "Holy places deserve respect, not fear.", next = "BACK", reply = "Then you go and respect it. I'll stand here and fear it.", fx = { align = { light = 1 } } },
        { text = "Dragons are dragons. Kill them before they wake.", next = "BACK", reply = "You first, friend. I've seen what one sneeze from those beasts does.", fx = { align = { light = -1 } } },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Ghouls out of the Raven Hill cemetery, spiders from the deep woods, and now and then an ogre down from the hills to the east. I've walked it a thousand times, and it's never once been boring." } },
      choices = { { text = "I'd prefer boring. Something else.", next = "BACK" } },
    },
    xseen = {
      lines = {
        { id = "xxseen_0", text = "Once, from the ridge, curled in the trees like a hill of green scales. It didn't move, but the air around it shimmered like summer heat, and I could have sworn I heard it dreaming." },
      },
      choices = {
        { text = "Dreaming?", next = "xdream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdream = {
      lines = {
        { id = "xxdream_0", text = "A sound like a lullaby, just under hearing. The night elves would know what it means. I only know I didn't sleep well for a week." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xelves = {
      lines = {
        { id = "xxelves_0", text = "A few, in robes and antlers, walking soft as cats. They don't speak much to us, and they'd prefer we stayed out of the grove entirely. Should we respect that, or is it our land?" },
      },
      choices = {
        { text = "Respect their wishes. They know the grove best.", next = "BACK", reply = "Easy for me, I'm staying out anyway.", fx = { align = { honor = 1 } } },
        { text = "It's Stormwind land. They don't make the rules.", next = "BACK", reply = "Tell them that, friend. I'll be over here.", fx = { align = { honor = -1 } } },
      },
    },
    xturn = {
      lines = {
        { id = "xxturn_0", text = "Because I walked in once, three years ago. I woke up on the road at dawn with leaves in my hair and no memory of the night. Some things you don't do twice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_inside = {
      lines = {
        { id = "y_inside_d", text = "I don't know, and that's the worst part. I remember the trees turning silver, and a voice singing. Then dawn, and the road, and three days gone. My wife thought I'd deserted." },
        { id = "y_inside_ne", when = { race = "NightElf" }, text = "I remember silver trees and a voice singing, the kind your people might understand. Then dawn on the road and three days gone. Do you know what dreams in there, friend?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_family = {
      lines = { { id = "y_family_d", text = "A wife who wants me to leave the Watch, and a daughter who wants to join it. I don't know which one scares me more. My daughter's been sneaking toward the grove at night." } },
      choices = {
        { text = "Stop her. The grove is dangerous.", next = "BACK", reply = "Aye. I'll lock the door if I must.", fx = { align = { order = 1 } } },
        { text = "Let her see it. She'll learn.", next = "BACK", reply = "You sound like her. Light help me, maybe you're right.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    twilight_grove = { { id = "tp_xtwilight_grove", text = "Pretty from afar. I keep it that way." } },
    night_elves = { { id = "tp_xnight_elves", text = "Quiet folk. They seem to know something about the grove we don't." } },
    background = { { id = "tp_bg", text = "Darkshire born, Watch sworn. Not much more to it than that." } },
    darkshire = { { id = "y_tp_ds", text = "Darkshire's grim and grey, but it's ours. The Watch keeps it standing." } },
    green_dragons = { { id = "y_tp_gd", text = "Green dragons sleep in the grove. Let them sleep, I say, and I say it quietly." } },
    _none = { { id = "tp_none", text = "Don't know it, and I've a road to walk. Ask in town." } },
  },
}

-- Watcher Jordan: patrols the road south of Darkshire.
P:NPC {
  key = "dusk_watcher_jordan", id = TODO_NPC("Watcher Jordan"), name = "Watcher Jordan", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "earnest", "brave" }, values = { "brave", "dutiful" },
  notices = { "watch", "kit" },
  impression = {
    first = "He is young, eager, and too sure of his own luck.",
    third = "{name} met Watcher Jordan of the Night Watch on the road south of Darkshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! I put down another ghoul since you left, {class}, and I was hoping you'd come by so I could tell somebody." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I don't need help with the south road, {class}, and I don't need yours especially." },
    { id = "g_default", text = "Well met, {class}! You look like you can handle yourself, and that's a rare sight on this road." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Seen anything worth fighting out there?" },
  },
  start = "hello",
  nodes = {
    jor_reef1 = {
      lines = {
        { id = "jor_reef1_1", text = "Murlocs, mostly, a whole village of them along the shore, and they come up in a rush if you stand too long near the water. Further out there's a wreck where the fishermen say something bigger lives, though nobody I know has been to look." },
      },
      choices = {
        { text = "Something bigger than a murloc?", next = "jor_reef2" },
        { text = "Something else, Jordan.", next = "BACK" },
      },
    },
    jor_reef2 = {
      lines = {
        { id = "jor_reef2_1", text = "That's the story, a thing with too many arms that pulled a whole boat under. The Commander says it's fishermen's talk, but she's ordered nobody to swim out to the wreck, which is an odd order if it's just talk." },
      },
      choices = {
        { text = "Then don't be the first to test it.", next = "jor_reef3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    jor_reef3 = {
      lines = {
        { id = "jor_reef3_1", text = "I won't, I swear, and you're the fourth person to tell me today. It's funny how everyone in Darkshire thinks I'm going to do something foolish, when I've only done three foolish things all year." },
      },
      choices = {
        { text = "Three is plenty. Something else.", next = "BACK" },
      },
    },
    jor_th1 = {
      lines = {
        { id = "jor_th1_1", text = "Thayer's hard on everyone, but aye, harder on me, because I'm the youngest and I talk back. He was my brother's sergeant, and I think he sees Daniel when he looks at me and doesn't care for it." },
      },
      choices = {
        { text = "He's afraid of losing you the same way.", next = "jor_th2" },
        { text = "You remind him of a loss. That's hard on both.", next = "jor_th2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jor_th2 = {
      lines = {
        { id = "jor_th2_1", text = "I hadn't thought of it like that. I'll try not to answer him back tomorrow, though I'm not making any promises if he says my lamp's crooked again." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Watcher Jordan, newest in the Watch, though I've already put down three ghouls and a spider the size of a cart. The south road's mine to walk, and I'll keep it clear." } },
      again = {
        { id = "h_again", text = "What else? I've plenty of stories, if you've time." },
        { id = "h_again2", text = "Go on, ask me anything about the road." },
      },
      choices = {
        { text = "Fight them head-on, and let them see you coming.", next = "BACK", reply = "That's how I do it! Three ghouls and a spider, and every one of them saw me coming and couldn't stop me.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Bait them into a pit; glory means nothing when you're dead.", next = "BACK", reply = "A pit? That's how the Defias fight, not the Watch. Still, I suppose a dead ghoul's a dead ghoul, however it gets that way.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why did you join the Watch?", next = "join" },
        { text = "What's down the south road?", next = "south" },
        { text = "Don't get too bold out there.", next = "bold" },
        { text = "What were your three ghouls like?", next = "xghouls" },
        { text = "Tell me about your brother.", next = "xbrother" },
        { text = "What do you think of the commander?", next = "xcmdr" },
        { text = "I'm a warrior. Any advice for the south road?", next = "BACK", when = { class = "WARRIOR" }, reply = "Keep your shield up near the reef, because the murlocs come in a rush. And don't chase them into the water, I learned that one wet." },
        { text = "What do you know about the Vile Reef?", next = "jor_reef1" },
        { text = "Thayer's been hard on you, by the sound of it.", next = "jor_th1" },
        { text = "Good luck, Jordan.", next = "END" },
      },
    },
    join = {
      lines = { { id = "j_default", text = "My older brother served before me, until the worgen took him near the Hushed Bank. I joined the week after we buried his boots, because that's all they found, and I mean to finish what he started." } },
      choices = {
        { text = "Vengeance won't bring him back.", next = "BACK", reply = "I know that. But it might stop them taking someone else's brother.", fx = { align = { light = 1 } } },
        { text = "Make them pay for every drop.", next = "BACK", reply = "That's the plan, friend. Every last one of them.", fx = { align = { light = -1 } } },
      },
    },
    south = {
      lines = { { id = "s_default", text = "The Vile Reef along the coast, murlocs and worse, and further on, the road into Stranglethorn. It's quieter than the west, but quiet isn't the same as safe." } },
      choices = { { text = "Wise words for a new watcher. Something else.", next = "BACK" } },
    },
    bold = {
      lines = { { id = "b_default", text = "The commander says the same thing, and so does my mother. I'll be careful, I promise, but somebody has to walk toward the trouble instead of away." } },
      choices = { { text = "Then walk carefully. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xghouls = {
      lines = {
        { id = "xxghouls_0", text = "Slow, stupid and stinking, but they don't stop until you take the head off. The first one nearly had me because I aimed for the heart. Now I aim higher." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbrother = {
      lines = {
        { id = "xxbrother_0", text = "Daniel was his name. He laughed at everything and was never afraid, and I'm trying to be him, though I'm not sure it suits me." },
      },
      choices = {
        { text = "Do you think you should be yourself instead?", next = "xself" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xself = {
      lines = {
        { id = "xxself_0", text = "Mother says I should. Thayer says I should be sharper. Which do you think a watcher needs more, to be himself or to be hard?" },
      },
      choices = {
        { text = "Be yourself. That's the only courage that lasts.", next = "BACK", reply = "Mother would like you. Maybe you're right.", fx = { align = { order = -1 } } },
        { text = "Be hard. The forest doesn't care who you are.", next = "BACK", reply = "Aye, Thayer says the same, word for word.", fx = { align = { order = 1 } } },
      },
    },
    xcmdr = {
      lines = {
        { id = "xxcmdr_0", text = "The best leader Darkshire's ever had, and I'd walk into the Rotting Orchard if she asked. She came to Daniel's burial herself, and she remembered his name." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ebonlocke = { { id = "tp_xebonlocke", text = "Commander Althea's a hero, plain and simple." } },
    worgen = { { id = "tp_xworgen", text = "They took my brother. I'll not say more than that." } },
    background = { { id = "tp_bg", text = "Darkshire lad, youngest of four. The Watch is the only family business we've got left." } },
    _none = { { id = "tp_none", text = "Don't know that one, but I'd love to hear about it sometime." } },
  },
}

-- Watcher Gelwin: posted on the road north of the Rotting Orchard, along Stitches' route.
P:NPC {
  key = "dusk_watcher_gelwin", id = TODO_NPC("Watcher Gelwin"), name = "Watcher Gelwin", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "stern", "weary" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "He stands where Stitches walks and doesn't pretend to be calm.",
    third = "{name} met Watcher Gelwin of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back on this road, and I don't mind admitting I feel a good deal better with you on it, {class}." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're back on this road. Fine, {class}, but if Stitches comes, I won't be counting on you." },
    { id = "g_default", text = "Keep your blade loose, {class}. This stretch of road is where the abomination walks." },
    { id = "g_back", when = { metBefore = true }, text = "Back on this road? Then you're braver than me, and I'm paid to be here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Gelwin. The commander posted a line of us along this road north of the Rotting Orchard, so if Stitches comes this way, it has to go through all of us first." } },
      again = { { id = "h_again", text = "What else? Keep your voice down; sound carries." } },
      choices = {
        { text = "If Stitches comes, stand your ground with the others on the line.", next = "BACK", reply = "That's the order, and I'll keep to it, though my knees won't. I'd not leave the others to face it alone.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If the abomination comes, run; let someone braver hold the line.", next = "BACK", reply = "I've thought it every night, {class}, and I hate myself a little each time. I'm still here, though, so that has to count for something.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What is Stitches?", next = "stitches" },
        { text = "Can a handful of watchers stop it?", next = "stop" },
        { text = "How many are on this line?", next = "xline" },
        { text = "What did Stitches do last time?", next = "xlasttime" },
        { text = "I'm a priest. Should I pray for the line?", next = "BACK", when = { class = "PRIEST" }, reply = "Pray loud, then, and pray close. Light knows we need it more than the cathedral does." },
        { text = "Did you know the Wilkins boy?", next = "y_wilkins" },
        { text = "Stand fast, Gelwin.", next = "END" },
      },
    },
    stitches = {
      lines = { { id = "s_default", text = "An abomination, stitched together from the dead by some madman out in the Raven Hill country. It walks the road toward Darkshire with a cleaver and a hunger, and the last time it came, it cut down a whole patrol." } },
      choices = { { text = "Who made such a thing?", next = "maker" }, { text = "Something else.", next = "BACK" } },
    },
    maker = {
      lines = { { id = "m_default", text = "Some say a hermit named Abercrombie, out in a shack near the cemetery, though he seems a harmless old man. Commander Ebonlocke has her suspicions, and so do I." } },
      choices = { { text = "I'll look into it. Something else.", next = "BACK" } },
    },
    stop = {
      lines = { { id = "st_default", text = "Not alone, no. But we can slow it, and every moment we hold it is a moment for the town to bar the doors and for someone like you to come and finish it." } },
      choices = {
        { text = "No one should die just to buy time.", next = "BACK", reply = "Tell that to Stitches. We do what the Watch must.", fx = { align = { order = -1 } } },
        { text = "That's duty. The Watch knows its job.", next = "BACK", reply = "Aye, it does, and we'll do it, whatever it costs.", fx = { align = { order = 1 } } },
      },
    },
    xline = {
      lines = {
        { id = "xxline_0", text = "Six of us, strung down the road like beads: Merant, Sarys, Selkin, Thayer, myself and a couple of new lads when the commander can spare them. It looks fine on a map." },
      },
      choices = {
        { text = "And off the map?", next = "xoffmap" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xoffmap = {
      lines = {
        { id = "xxoffmap_0", text = "Off the map, we're tired men with spears, standing too far apart to help each other. But the commander knows that, and she's got no one else to send." },
      },
      choices = {
        { text = "Should she ask Stormwind for help?", next = "xask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xask = {
      lines = {
        { id = "xxask_0", text = "She's asked. Lord Ello wants to keep asking politely. Some of us want her to stop asking and start shouting. Which is it to be?" },
      },
      choices = {
        { text = "Keep asking properly. Stormwind will listen eventually.", next = "BACK", reply = "Maybe. If any of us live long enough to hear the answer.", fx = { align = { order = 1 } } },
        { text = "Stop asking. Hire mercenaries if you have to.", next = "BACK", reply = "Can't afford them, friend. But I like the spirit.", fx = { align = { order = -1 } } },
      },
    },
    xlasttime = {
      lines = {
        { id = "xxlasttime_0", text = "It came up the road at dusk and took the Wilkins boy and two of the Watch before anyone could raise a horn. The commander chased it back with torches, and it went, laughing, if that's the word." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_wilkins = {
      lines = {
        { id = "y_wilkins_d", text = "Tommy Wilkins. He brought us bread on the night shift, every night, from his mother's oven. I was on the line when Stitches came, and I didn't reach him in time. I hear the cart wheels in my sleep." },
        { id = "y_wilkins_pr", when = { class = "PRIEST" }, text = "Tommy Wilkins. He brought us bread every night. I didn't reach him in time. You're a priest. Tell me the Light forgives a man who was too slow." },
      },
      choices = {
        { text = "You couldn't have saved him.", next = "y_couldnt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_couldnt = {
      lines = { { id = "y_couldnt_d", text = "Maybe. His mother wants Abercrombie dragged from his shack and hanged, proof or no. Half the Watch agrees with her. Should we wait for proof, or act on what we all believe?" } },
      choices = {
        { text = "Wait for proof. Justice needs it.", next = "BACK", reply = "Aye. That's what the commander says too.", fx = { align = { order = 1 } } },
        { text = "Act. Everyone knows he made it.", next = "BACK", reply = "Careful saying that loud, friend. But I hear you.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    stitches = { { id = "tp_xstitches", text = "An abomination with a cleaver. If you hear it laugh, run." } },
    abercrombie = { { id = "tp_xabercrombie", text = "A hermit, they say. I say hermits don't need that many corpses." } },
    background = { { id = "tp_bg", text = "Watch veteran. I've seen too many friends' names go on the stone." } },
    raven_hill = { { id = "y_tp_rh", text = "Raven Hill is a cemetery with a village attached. The dead outnumber the living there." } },
    rotting_orchard = { { id = "y_tp_ro", text = "The Rotting Orchard is south of the line. Nothing good grows there anymore." } },
    _none = { { id = "tp_none", text = "Not now, friend. My eyes are on the road." } },
  },
}

-- Watcher Merant: posted on the road north of the Rotting Orchard.
P:NPC {
  key = "dusk_watcher_merant", id = TODO_NPC("Watcher Merant"), name = "Watcher Merant", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "wry", "weary" }, values = { "practical" },
  notices = { "watch", "kit" },
  impression = {
    first = "He has drawn lots for this post three times and lost each time.",
    third = "{name} met Watcher Merant of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again! Come to keep me company on the worst post in the Watch? Bless you, {class}, I mean that." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The short straw was bad enough, {class}, without you on top of it." },
    { id = "g_default", text = "Evening, {class}. Welcome to the worst post in the Watch, which I won fair and square by drawing the short straw." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Come to keep me company? I'd welcome it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Merant. We draw straws in the barracks to see who stands on this road, and I've drawn short three times running, so I'm starting to think somebody's cheating." } },
      again = { { id = "h_again", text = "Anything else? I've nothing to do but watch and worry." } },
      choices = {
        { text = "Draw straws fairly, even when you lose three times running.", next = "BACK", reply = "I do, and I'll keep doing it, though I've started watching the others' hands very closely. Fair's fair, even when it stings.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Next time, palm the long straw; you've earned it by now.", next = "BACK", reply = "Tempting, {class}, very tempting. But then I'd be the one somebody suspects, and I'd deserve it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's so bad about this post?", next = "post" },
        { text = "Have you ever seen the abomination?", next = "seen" },
        { text = "Who do you think rigs the straws?", next = "xrig" },
        { text = "What would you do instead of this post?", next = "xinstead" },
        { text = "Tell me about Darkshire's barracks.", next = "xbarracks" },
        { text = "I'm a rogue. I could rig the draw.", next = "BACK", when = { class = "ROGUE" }, reply = "Could you? No, don't tell me. If I'm asked, I want to look honestly surprised." },
        { text = "Why do you really stay in the Watch?", next = "y_stay" },
        { text = "Has the post ever gone quiet?", next = "y_quiet" },
        { text = "Better luck next draw.", next = "END" },
      },
    },
    post = {
      lines = { { id = "p_default", text = "The Rotting Orchard to the south, full of ghouls and rotting fruit, and the thing called Stitches that walks this way when it pleases. If you smell something worse than the orchard, it's coming." } },
      choices = {
        { text = "Then someone should rig the draw for you.", next = "BACK", reply = "I like the way you think, friend. Shall we go talk to the quartermaster?", fx = { align = { honor = -1 } } },
        { text = "Fair is fair. Someone has to stand here.", next = "BACK", reply = "Aye, I know, I know. Doesn't mean I have to like it.", fx = { align = { honor = 1 } } },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "Once, from far off, lurching up the road with its cleaver dragging behind. I've never run so fast in my life, and I'm not ashamed to say it, because the ones who stood are on the wall at the town hall now." } },
      choices = { { text = "Running was the sensible choice. Something else.", next = "BACK" } },
    },
    xrig = {
      lines = {
        { id = "xxrig_0", text = "Thayer, most likely, because he wants this post and doesn't want to look like he wants it. Or the quartermaster, who doesn't like my singing." },
      },
      choices = {
        { text = "Is your singing that bad?", next = "xsing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsing = {
      lines = {
        { id = "xxsing_0", text = "Worse. But a man's got to have something to keep the dark away, and it's that or prayer, and I don't know the words." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xinstead = {
      lines = {
        { id = "xxinstead_0", text = "Stand guard in Goldshire, where the worst thing is a drunk at the Lion's Pride. Some say a soldier goes where he's posted and keeps his mouth shut. Do you agree?" },
      },
      choices = {
        { text = "Aye. A watchman goes where he's sent.", next = "BACK", reply = "You sound like the commander. Fine, fine, I'm going nowhere.", fx = { align = { order = 1 } } },
        { text = "Ask for a transfer. You've earned it.", next = "BACK", reply = "I've asked three times, friend. They lost the letters, apparently.", fx = { align = { order = -1 } } },
      },
    },
    xbarracks = {
      lines = {
        { id = "xxbarracks_0", text = "Cold, damp and full of snoring. Selkin writes letters by candlelight, Sarys sleeps with her boots on, and Thayer sharpens that blade till dawn." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stay = {
      lines = {
        { id = "y_stay_d", text = "Truthfully? My sister lives in Darkshire with three little ones, and if this road fails, the town fails. I complain because it keeps me from thinking about that too much." },
        { id = "y_stay_hu", when = { race = "Human" }, text = "My sister's in Darkshire with three little ones. You've probably got family somewhere behind a line like this one. I complain so I don't have to think about it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_quiet = {
      lines = { { id = "y_quiet_d", text = "Last week, for two whole nights. No ghouls, no howls, nothing. Thayer said it was a mercy. I think something big scared off the little things. I haven't reported it, because I'd sound mad." } },
      choices = {
        { text = "Report it. The commander should know.", next = "BACK", reply = "Fine. If she laughs, I'm blaming you.", fx = { align = { order = 1 } } },
        { text = "Keep it to yourself for now.", next = "BACK", reply = "Aye, no sense starting a panic over a quiet night.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    stitches = { { id = "tp_xstitches", text = "The less said, the better. I've only seen it once, and that was once too many." } },
    goldshire = { { id = "tp_xgoldshire", text = "Lovely place. Sunlight and pies. I miss it like a lost tooth." } },
    background = { { id = "tp_bg", text = "Joined the Watch for the steady pay. Nobody told me about the straws." } },
    darkshire = { { id = "y_tp_ds", text = "Darkshire is grey, wet and full of folk who'd rather not talk about what's in the woods." } },
    thayer = { { id = "y_tp_thayer", text = "Thayer wants this post more than any sane man should. I've stopped asking why." } },
    straws = { { id = "y_tp_straws", text = "The straws are rigged. I can't prove it, but I've drawn short three times running." } },
    _none = { { id = "tp_none", text = "Don't know. Ask someone who drew a better post." } },
  },
}

-- Watcher Sarys: posted on the road north of the Rotting Orchard.
P:NPC {
  key = "dusk_watcher_sarys", id = TODO_NPC("Watcher Sarys"), name = "Watcher Sarys", title = "The Night Watch", gender = "female",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "brisk", "stern" }, values = { "dutiful", "brave" },
  notices = { "watch" },
  impression = {
    first = "She knows the orchard road by every rut and root.",
    third = "{name} met Watcher Sarys of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and still alive. Good, {class}; I'd taken to watching for you coming up from the orchard." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Move along quickly, {class}, and don't expect me to watch your back." },
    { id = "g_default", text = "Move along quickly, {class}, and stay on the road. The orchard's no place to wander." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still alive, I see. Good." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Sarys. I hold this part of the road against whatever comes up from the Rotting Orchard, and I've done it longer than anyone else on the line." } },
      again = { { id = "h_again", text = "What else? Be quick." } },
      choices = {
        { text = "Hold the road honestly, and never claim kills you didn't make.", next = "BACK", reply = "I never have, and I've the longest service on this line to show for it. A watcher who lies about kills gets careless about counting.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Claim every kill you can; the tally is what the Commander sees.", next = "BACK", reply = "Then the Commander plans by a lie and sends men into the orchard short-handed. No, I count what I kill and not a ghoul more.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What happened to the orchard?", next = "orchard" },
        { text = "How have you lasted so long here?", next = "lasted" },
        { text = "Tell me about your mother.", next = "xmother" },
        { text = "What's the worst you've seen come out?", next = "xworst" },
        { text = "What do you think of Thayer?", next = "xthayer" },
        { text = "A Gilnean once told me of such woods.", next = "BACK", when = { race = "Human" }, reply = "Gilneas has walled itself off, so I'd not trust much that comes over that wall. But woods like these exist, sure enough, and they make the same sort of people." },
        { text = "Did your mother teach you the road?", next = "y_taught" },
        { text = "What do you fear most, Sarys?", next = "y_fear" },
        { text = "Keep the road, Sarys.", next = "END" },
      },
    },
    orchard = {
      lines = { { id = "o_default", text = "It was the finest orchard in the county once, until the dead came up out of the soil and the trees went black. The fruit still grows, but nobody's fool enough to eat it." } },
      choices = { { text = "Can it ever be healed?", next = "healed" }, { text = "Something else.", next = "BACK" } },
    },
    healed = {
      lines = { { id = "h2_default", text = "The priests say yes and the farmers say no, and I've stopped waiting for either to prove it. I'd settle for keeping what's in it from getting out." } },
      choices = {
        { text = "Burn it to the ground, then. Start again.", next = "BACK", reply = "It's been suggested. The Ebonlockes won't hear of it, not yet.", fx = { align = { light = -1 } } },
        { text = "The Light can cleanse even this.", next = "BACK", reply = "I hope you're right. I've seen little sign of it, though.", fx = { align = { light = 1 } } },
      },
    },
    lasted = {
      lines = { { id = "l_default", text = "I listen, I don't wander and I never turn my back on the orchard. Most watchers who fall here make one of those mistakes, and usually the last one." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xmother = {
      lines = {
        { id = "xxmother_0", text = "Watcher Ilse Sarys, held this road twenty years. She died in her bed, of a cough, which in Duskwood is about the finest death a watcher can hope for." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xworst = {
      lines = {
        { id = "xxworst_0", text = "A ghoul with a child's toy still in its hand. It came right up to me before I could make it out. I put it down anyway, because that's the job, but I'll not forget it." },
      },
      choices = {
        { text = "How do you live with that?", next = "xlive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlive = {
      lines = {
        { id = "xxlive_0", text = "You tell yourself it wasn't the child any more. Some say that's a lie we tell to stay sane. Others say it's the truth, and the dead are only dead. Which is it?" },
      },
      choices = {
        { text = "The dead are gone. You only freed the shell.", next = "BACK", reply = "That's what the priests say. Most nights, I believe them.", fx = { align = { light = 1 } } },
        { text = "It doesn't matter. You did what you must.", next = "BACK", reply = "Maybe. Doesn't make it easier, but maybe.", fx = { align = { light = -1 } } },
      },
    },
    xthayer = {
      lines = {
        { id = "xxthayer_0", text = "Brave and foolish, and too sure the next fight will be the last one. I hope he gets his wish one day, and I hope he lives through it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_taught = {
      lines = {
        { id = "y_taught_d", text = "She walked me down it when I was eight, in daylight, and named every root and rut. She said a watcher should know her road better than her own face. I still say the names in my head on night shift." },
        { id = "y_taught_hu", when = { race = "Human" }, text = "When I was eight, in daylight. She named every root and rut, the way a Lordaeron farmer names his fields. I still say the names in my head on night shift." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_fear = {
      lines = { { id = "y_fear_d", text = "Seeing her face on one of those ghouls. Her grave's on Raven Hill, and the dead walk there now. I haven't been to see if she's still in it." } },
      choices = {
        { text = "Go and see. Better to know.", next = "y_grave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_grave = {
      lines = { { id = "y_grave_d", text = "And if the grave's empty? Then I'll know she's out there, and I'll look for her face every night. Should I go, or keep the not-knowing?" } },
      choices = {
        { text = "Go. The truth is better than fear.", next = "BACK", reply = "Aye. On my next free morning, then.", fx = { align = { light = 1 } } },
        { text = "Don't. Some doubts keep you sane.", next = "BACK", reply = "That's what I've been telling myself for a year.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    rotting_orchard = { { id = "tp_xrotting_orchard", text = "Don't eat the apples. That's the most important thing I can tell you." } },
    night_watch = { { id = "tp_xnight_watch", text = "My family business, and my mother's before me." } },
    background = { { id = "tp_bg", text = "Watch-born, Watch-raised. My mother held this road before me." } },
    raven_hill = { { id = "y_tp_rh", text = "My mother's buried on Raven Hill. I don't go there anymore." } },
    _none = { { id = "tp_none", text = "Not my concern. My concern is this road." } },
  },
}

-- Watcher Selkin: posted on the road north of the Rotting Orchard.
P:NPC {
  key = "dusk_watcher_selkin", id = TODO_NPC("Watcher Selkin"), name = "Watcher Selkin", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "earnest", "wary" }, values = { "family", "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "He writes letters home between watches and never sends them.",
    third = "{name} met Watcher Selkin of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you again, and you're a better sight than anything on this road. I wrote about you in my last letter, the one I didn't send." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ah, you again. I'll not be writing home about this, {class}, and that's a kindness to us both." },
    { id = "g_default", text = "Hello, {class}. You're a welcome sight, out here; most faces on this road are dead ones." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Good to see a friendly face." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Selkin. I came to Darkshire from Elwynn when my family moved here for cheap land, and I joined the Watch when I learned why it was cheap." } },
      again = { { id = "h_again", text = "What else? I'm glad of the conversation." } },
      choices = {
        { text = "Send the letters; your family deserves the truth.", next = "BACK", reply = "The truth would have them selling the farm and walking back to Elwynn, and maybe they should. I'll think on it, I promise.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let them believe all is well; what they don't know won't hurt.", next = "BACK", reply = "That's what I tell myself every time I fold a letter away. It hasn't made me feel any better yet.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you regret coming here?", next = "regret" },
        { text = "What's on your mind?", next = "letters" },
        { text = "Tell me about your sister.", next = "xsister" },
        { text = "What was Elwynn like for you?", next = "xelwynn" },
        { text = "Would your family move back?", next = "xmove" },
        { text = "I'm from Elwynn too, Selkin.", next = "BACK", when = { race = "Human" }, reply = "Are you? Then you know the smell of the Eastvale in summer. Lord, I miss it. Tell me you've been there lately." },
        { text = "Why don't you send the letters?", next = "y_why" },
        { text = "Have you heard the worgen?", next = "y_worgen" },
        { text = "Take care, Selkin.", next = "END" },
      },
    },
    regret = {
      lines = { { id = "r_default", text = "Some days, when the howling's close. But my family's here now, and someone has to stand between them and the woods, so I'd rather it was me." } },
      choices = {
        { text = "Then you should take them back to Elwynn.", next = "BACK", reply = "And leave the town to fall? No, friend, we stay. Darkshire's ours now.", fx = { align = { order = -1 } } },
        { text = "A man stands where his duty puts him.", next = "BACK", reply = "Aye, that's what my father said, and I mean to live up to it.", fx = { align = { order = 1 } } },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "I write letters to my sister in Goldshire, telling her all about the Watch, and then I don't send them. I don't want her to worry, and she would, if she knew the half of it." } },
      choices = { { text = "Send one. She'd want to hear from you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xsister = {
      lines = {
        { id = "xxsister_0", text = "Maryanne, keeps the inn's books for the Lion's Pride. She's clever and bright, and she'd come down here in a heartbeat if she knew how bad it was, which is why I don't tell her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xelwynn = {
      lines = {
        { id = "xxelwynn_0", text = "Fields, sun and the occasional kobold. We farmed near the Eastvale until the Defias started burning barns, and we came south because the land was cheap and quiet." },
      },
      choices = {
        { text = "Quiet?", next = "xquiet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xquiet = {
      lines = {
        { id = "xxquiet_0", text = "That's what the agent in Stormwind called it. He didn't mention the dead, the worgen or Stitches. I'd like a word with him someday." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmove = {
      lines = {
        { id = "xxmove_0", text = "Father won't hear of it. He says you don't run from land you've paid for. Mother says you don't stay on land that's trying to eat you. Who's right?" },
      },
      choices = {
        { text = "Your father. Land paid for is worth defending.", next = "BACK", reply = "Aye, and I'll defend it. Mother will just have to forgive us both.", fx = { align = { order = 1 } } },
        { text = "Your mother. No land is worth your family's lives.", next = "BACK", reply = "I've said the same, quietly. Father only shouts louder.", fx = { align = { order = -1 } } },
      },
    },
    y_why = {
      lines = {
        { id = "y_why_d", text = "Because Maryanne would read them and come down here to drag me home, or worse, to stay. I tell her in my sent letters that Darkshire's quiet. The real ones I keep in a box under my bunk." },
        { id = "y_why_hu", when = { race = "Human" }, text = "Because my sister would come and drag me home. You'd do the same for your kin, I think. I send her the quiet letters and keep the true ones in a box." },
      },
      choices = {
        { text = "She deserves the truth.", next = "y_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_truth = {
      lines = { { id = "y_truth_d", text = "If I fall here, she'll get the box, and she'll know I lied to her for a year. Is it kinder to lie, or to frighten her?" } },
      choices = {
        { text = "Tell her. She deserves to know.", next = "BACK", reply = "Aye. I'll send one true letter. Just one.", fx = { align = { light = 1 } } },
        { text = "Keep lying. Spare her the fear.", next = "BACK", reply = "Then the box stays shut. Thank you.", fx = { align = { light = -1 } } },
      },
    },
    y_worgen = {
      lines = { { id = "y_worgen_d", text = "At night, out past Brightwood, howling like no wolf I ever heard in Elwynn. The old hands say they came out of a tower in the Silverpine. I don't sleep well on full moons." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    elwynn = { { id = "tp_xelwynn", text = "Home before home. Sunlit and green, and a long way from here." } },
    darkshire = { { id = "tp_xdarkshire", text = "My family's here now, so it's mine too, I suppose." } },
    background = { { id = "tp_bg", text = "Elwynn farm boy, Darkshire watchman. I'm still not sure which I am more." } },
    goldshire = { { id = "y_tp_gs", text = "My sister keeps the books at the Lion's Pride. Say hello if you pass through." } },
    worgen = { { id = "y_tp_worgen", text = "Worgen howl past Brightwood on full moons. I keep my door barred and my candle lit." } },
    _none = { { id = "tp_none", text = "I don't know, sorry. Ask in town; someone there will." } },
  },
}

-- Watcher Thayer: posted on the road north of the Rotting Orchard.
P:NPC {
  key = "dusk_watcher_thayer", id = TODO_NPC("Watcher Thayer"), name = "Watcher Thayer", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "gruff", "proud" }, values = { "brave" },
  notices = { "kit", "watch" },
  impression = {
    first = "He wants to face Stitches, and thinks the others are cowards.",
    third = "{name} met Watcher Thayer of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, and you've the look of someone who'd stand with me when it comes. That's more than the rest of this line." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're back. If that thing comes, stay out of my way, {class}; I'll not need your help." },
    { id = "g_default", text = "Another blade on the road. Good, {class}, stand with me if that thing comes." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Still waiting for the abomination, are you? So am I." },
  },
  notice = {
    { id = "n_warrior", cat = "kit", when = { class = "WARRIOR" },
      text = "A warrior. Good, you'll know what to do when it comes, which is more than half this line does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Thayer. The others on this line hope Stitches never comes, and I hope it does, so I can put an end to it." } },
      again = { { id = "h_again", text = "What else? I'm not going anywhere." } },
      choices = {
        { text = "Face Stitches openly on the road, blade to blade.", next = "BACK", reply = "That's all I want, a fair stand on open ground where it can see who ends it. Let the others hide behind their lamps.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Lure it into a trap and burn it; fairness is for men.", next = "BACK", reply = "Burn it, aye, I'd not weep over how it falls. But I'd still want to be the one holding the torch.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "You want to fight that thing?", next = "fight" },
        { text = "You think the others are afraid?", next = "others" },
        { text = "Tell me about your patrol partner.", next = "xpartner" },
        { text = "How would you kill Stitches?", next = "xkill" },
        { text = "What will you do if you win?", next = "xafter" },
        { text = "I'm a warrior too. I'll stand with you.", next = "BACK", when = { class = "WARRIOR" }, reply = "Then you're the first on this line to say so. When it comes, stand on my left, and swing for the knees." },
        { text = "What was Rowan like?", next = "y_rowan" },
        { text = "Has the commander warned you?", next = "y_warned" },
        { text = "Tell me about that blade.", next = "y_blade" },
        { text = "Good luck, Thayer.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "It killed my patrol partner last spring, and I've been sharpening this blade ever since. I know it's big and I know it's strong, but it's stupid, and stupid things die." } },
      choices = {
        { text = "Courage is good. Recklessness gets you killed.", next = "BACK", reply = "Maybe so. But nobody ever killed an abomination by being careful.", fx = { align = { order = 1 } } },
        { text = "Then break the line and hunt it down yourself.", next = "BACK", reply = "Don't tempt me. The commander would have my badge, but I'd have its head.", fx = { align = { order = -1 } } },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Afraid, aye, though they've a right to be, I suppose. Merant runs, Selkin writes letters, and Sarys has seen too much to think anything can be won, so somebody's got to want the fight." } },
      choices = { { text = "Maybe they're wiser than you. Something else.", next = "BACK" } },
    },
    xpartner = {
      lines = {
        { id = "xxpartner_0", text = "Watcher Rowan. We joined the same week and walked this road together for nine years. Stitches took his arm first and then the rest. I got there a moment too late." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xkill = {
      lines = {
        { id = "xxkill_0", text = "Fire first, because the stitches burn. Then the legs, so it can't follow. Then the head, slow, for Rowan. Some would call that cruelty. Would you?" },
      },
      choices = {
        { text = "It's a monster. Do what it takes.", next = "BACK", reply = "Exactly. There's no crime in cruelty to a thing like that.", fx = { align = { light = -1 } } },
        { text = "Kill it clean. Vengeance poisons the one who carries it.", next = "BACK", reply = "Spoken like a priest. Maybe. I'll decide when it's in front of me.", fx = { align = { light = 1 } } },
      },
    },
    xafter = {
      lines = {
        { id = "xxafter_0", text = "Sleep, maybe, for the first time in a year. Then I'd hunt whoever made it, because a thing like that doesn't sew itself together." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_rowan = {
      lines = {
        { id = "y_rowan_d", text = "Loud, kind, and the worst cook in the Watch. He'd burn porridge and laugh about it. He had a girl in Darkshire he was going to marry come autumn. I carry his ring now. I haven't been able to give it to her." },
        { id = "y_rowan_war", when = { class = "WARRIOR" }, text = "Loud and kind, and the best shield I ever stood beside. You'll know what that means, losing one. I carry his ring now, meant for a girl in Darkshire, and I haven't given it to her." },
      },
      choices = {
        { text = "You should give her the ring.", next = "y_ring" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ring = {
      lines = { { id = "y_ring_d", text = "When Stitches is dead. Not before. I'll give her the ring and the cleaver both. Is that how a man honours a friend, or am I lying to myself?" } },
      choices = {
        { text = "Give it now. She's waited enough.", next = "BACK", reply = "Hm. Maybe. You're not the first to say it.", fx = { align = { honor = -1 } } },
        { text = "Keep your vow. Finish it first.", next = "BACK", reply = "Aye. That's what Rowan would want.", fx = { align = { honor = 1 } } },
      },
    },
    y_warned = {
      lines = { { id = "y_warned_d", text = "Commander Althea Ebonlocke told me if I break the line to chase Stitches, I'm off the Watch. She's right, and I know it, and I still check the road every hour hoping." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_blade = {
      lines = { { id = "y_blade_d", text = "Rowan's blade, reforged in Darkshire with silver in the edge. The smith said silver won't help against stitched flesh. I don't care. It's his steel, and it'll finish his fight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stitches = { { id = "tp_xstitches", text = "I'll put an end to it. That's all I have to say." } },
    abercrombie = { { id = "tp_xabercrombie", text = "The commander says he's harmless. I say he buys too much thread." } },
    background = { { id = "tp_bg", text = "Twelve years a watcher. I've buried more friends than I can count, and I mean to stop counting." } },
    rowan = { { id = "y_tp_rowan", text = "Rowan was my partner. Stitches took him. That's all I'll say." } },
    night_watch = { { id = "y_tp_nw", text = "The Night Watch holds this town together with spears and stubbornness." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask me about Stitches." } },
  },
}

-- Apothecary Faustin: Forsaken apothecary at Beggar's Haunt, sent south at Varimathras's behest.
P:NPC {
  key = "dusk_apothecary_faustin", id = TODO_NPC("Apothecary Faustin"), name = "Apothecary Faustin", title = "Royal Apothecary Society", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "sly", "cold" }, values = { "clever" },
  notices = { "craft", "wonder" },
  impression = {
    first = "He brews a truth serum and smiles at the word truth.",
    third = "{name} met Apothecary Faustin of the Royal Apothecary Society at Beggar's Haunt.",
  },
  greetings = {
    { id = "g_default", text = "A visitor to our humble haunt, how delightful. Do keep your voice down, the Night Watch has such sensitive ears." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Oh, dear. A living Alliance face in our little corner of Duskwood. I do hope you're lost, because the alternative is so tiresome." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The brew is coming along nicely, thank you for asking." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! How refreshing. Most of the Horde think a potion is something you drink, not something you perfect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Apothecary Faustin, of the Royal Apothecary Society. Zraedus and I were sent south at Varimathras's behest to survey these lands, and I'm making the most of the opportunity.", fx = { learn = { "forsaken" } } } },
      again = {
        { id = "h_again", text = "Something else, my dear? Ask quickly; the brew bubbles." },
        { id = "h_again2", text = "Go on. I always have time for curiosity." },
      },
      choices = {
        { text = "What are you brewing?", next = "serum", when = { faction = "Horde" } },
        { text = "What brings you to Duskwood?", next = "why" },
        { text = "The Society's work makes me uneasy.", next = "society" },
        { text = "Zraedus sent me to help with the serum.", next = "done", when = { questDone = TODO_QUEST("Nothing But The Truth") } },
        { text = "You were a physician in Lordaeron?", next = "y_physician" },
        { text = "Do you trust Zraedus?", next = "y_zraedus" },
        { text = "Who is the spy you're brewing for?", next = "y_spy" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    serum = {
      lines = { { id = "s_default", text = "A truth serum, for a human spy the orcs of Stonard are holding. He saw our camp, you see, and the orcs would so like to know what he saw, so we're being helpful allies." } },
      choices = {
        { text = "Helpful? That sounds like poison.", next = "poison" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison = {
      lines = { { id = "p_default", text = "What a suspicious mind you have, my friend. A truth serum is a truth serum, and if the spy should die of it before he says anything inconvenient, well, chemistry is an inexact science." } },
      choices = {
        { text = "The Horde deserves honesty from its own.", next = "BACK", reply = "Of course, of course. And it shall have all the honesty that's good for it.", fx = { align = { honor = 1 } } },
        { text = "Some secrets are worth keeping.", next = "BACK", reply = "Now you're thinking like an apothecary. The Dark Lady would approve.", fx = { align = { honor = -1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The Society needs ingredients, and these forests grow some of the most marvellous horrors. Shadow panthers, mire lords, deep striders, all of it ripe for study and all of it so conveniently far from prying eyes." } },
      choices = { { text = "Not so far as you think. Something else.", next = "BACK" } },
    },
    society = {
      lines = { { id = "so_default", text = "It should, my dear, and that's rather the point. We're working on something that will change the world, and the world is rarely comfortable while it's being changed.", fx = { learn = { "new_plague" } } } },
      choices = { { text = "That's what worries me. Something else.", next = "BACK" } },
    },
    done = {
      lines = { { id = "d_default", text = "Splendid, a willing pair of hands. Fetch me what the forests grow and the serum will be ready for our friend in Stonard, and do try not to mention to the orcs who brewed it." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    y_physician = {
      lines = {
        { id = "y_physician_d", text = "In Stratholme, my dear, setting bones and bleeding fevers for a city that thought itself immortal. Then the grain came, and the prince, and I learned that a physician's oath does not survive a funeral." },
        { id = "y_physician_sc", when = { race = "Scourge" }, text = "In Stratholme, before the prince's purge. You'll have your own memories of that time, I'm sure, or of not having them. My oath did not survive my funeral. Did yours?" },
      },
      choices = {
        { text = "Do you miss healing?", next = "y_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = { { id = "y_miss_d", text = "I miss being thanked. Healing was tedious. Now I make things that frighten people, and nobody thanks me, but at least they remember my name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_zraedus = {
      lines = { { id = "y_zraedus_d", text = "Zraedus trusts me, which is his mistake, and I watch him, which is my habit. He reports to Varimathras directly. I report to Varimathras through him, and I wonder what he leaves out." } },
      choices = {
        { text = "Why not report to the Dark Lady directly?", next = "y_direct" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_direct = {
      lines = { { id = "y_direct_d", text = "Because the Society reports to the dreadlord, and the dreadlord reports to the Dark Lady, and I am told that is how things are done. Should a loyal servant go around the chain, if he suspects it is rotten?" } },
      choices = {
        { text = "Yes. Loyalty to the queen comes first.", next = "BACK", reply = "How bold. I shall consider which letter to write.", fx = { align = { order = -1 } } },
        { text = "No. The chain exists for a reason.", next = "BACK", reply = "Spoken like a perfect subordinate. Varimathras would adore you.", fx = { align = { order = 1 } } },
      },
    },
    y_spy = {
      lines = { { id = "y_spy_d", text = "The human in Stonard? A Stormwind scout who wandered too close to our tents. He's very brave and very stupid, which is the most useful combination in a test subject." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a physician in Lordaeron, once. Now I'm something much more useful." } },
    stonard = { { id = "y_tp_stonard", text = "Stonard is a swamp full of orcs. Charming, damp and in dire need of a decent alchemist." } },
    varimathras = { { id = "y_tp_vari", text = "Varimathras serves the Dark Lady. Officially. I find officially is the most interesting word in the language." } },
    _none = { { id = "tp_none", text = "How dreary. Ask me about something that can be boiled." } },
  },
}

-- Deathstalker Zraedus: Forsaken deathstalker at Beggar's Haunt, partner to Faustin.
P:NPC {
  key = "dusk_deathstalker_zraedus", id = TODO_NPC("Deathstalker Zraedus"), name = "Deathstalker Zraedus", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "cold", "wary" }, values = { "dutiful", "clever" },
  notices = { "watch", "kit" },
  impression = {
    first = "He speaks of the orcs as allies with a pause each time.",
    third = "{name} met Deathstalker Zraedus at Beggar's Haunt in Duskwood.",
  },
  greetings = {
    { id = "g_default", text = "Quietly, now. Nobody is supposed to know we're here, and I'd like to keep it that way." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "You've wandered somewhere you shouldn't have, living one. Walk away, and we'll both pretend this never happened." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I hope nobody followed you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathstalker Zraedus. I watch over this camp, and over Faustin, who requires more watching than the camp does." } },
      again = {
        { id = "h_again", text = "More questions? Be brief, and be quiet." },
        { id = "h_again2", text = "Go on. I'm listening, and so are the trees." },
      },
      choices = {
        { text = "Who are you hiding from?", next = "hiding" },
        { text = "What happened to the human spy?", next = "spy", when = { faction = "Horde" } },
        { text = "You don't trust the orcs, do you?", next = "orcs" },
        { text = "What is the Society brewing down here?", next = "society" },
        { text = "The Dark Lady's work. I'll keep quiet, cousin.", next = "kin", when = { race = "Scourge" } },
        { text = "Good sightlines. Nobody sees this camp from the road.", next = "watchpost", when = { class = "ROGUE" } },
        { text = "I've no quarrel with you, Forsaken.", next = "truce", when = { faction = "Alliance" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    hiding = {
      lines = { { id = "h2_default", text = "The Night Watch, the Alliance, the odd worgen, and our dear allies in the Horde, who would ask too many questions about what the Society does down here. The fewer who know of Beggar's Haunt, the better." } },
      choices = { { text = "Even the Horde? Something else.", next = "BACK" } },
    },
    spy = {
      lines = { { id = "s_default", text = "A human infiltrator saw our camp, but before I could deal with him, some of our orcish brethren caught him and took him to Stonard. Faustin is preparing something to help them question him, or to stop him talking, whichever comes first." } },
      choices = {
        { text = "Stopping him from talking is the safer choice.", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safer for us, at least. What the orcs never learn, they can never resent, and the Dark Lady values peace among her allies." } },
      choices = {
        { text = "The Horde shouldn't keep secrets from itself.", next = "BACK", reply = "How idealistic. The Horde is many things, and honest has never been one of them.", fx = { align = { honor = 1 } } },
        { text = "Every faction keeps its secrets. Wise of you.", next = "BACK", reply = "Indeed. You understand the Forsaken better than most.", fx = { align = { honor = -1 } } },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "I trust them to be orcs, which is to say loud, proud and useful in a fight. Whether I trust them with the Society's work is another matter, and one I'll keep to myself." } },
      choices = {
        { text = "Stonard isn't far. Do the orcs come calling?", next = "stonard" },
        { text = "Spoken like a true deathstalker. Something else.", next = "BACK" },
      },
    },
    society = {
      lines = { { id = "so_default", text = "Faustin brews for the Royal Apothecary Society, and Duskwood is generous with what he needs: grave dust, worg blood and the odd piece of something that used to walk. I keep the curious away from his cauldron, and his cauldron away from Darkshire's noses." } },
      choices = {
        { text = "Faustin seems to enjoy his work rather too much.", next = "faustin" },
        { text = "I'd rather not know more. Something else.", next = "BACK" },
      },
    },
    faustin = {
      narr = "He glances toward the bubbling cauldron, then back at you, without moving his head.",
      lines = { { id = "fa_default", text = "He was a physician in Lordaeron and he still thinks like one, which is to say he looks at a body and wonders what is inside it. I don't share his enthusiasm, but I share his loyalty, and that will have to be enough." } },
      choices = {
        { text = "Brewing poisons in a haunted wood is foul work.", next = "BACK", reply = "Foul, perhaps, but the Scourge brewed fouler things in our veins, and nobody stopped them.", fx = { align = { light = 1 } } },
        { text = "Necessary work is never foul. Let him brew.", next = "BACK", reply = "A practical answer. Faustin would like you, which is not entirely a compliment.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stonard = {
      lines = { { id = "st_default", text = "Now and then a grunt wanders over from Stonard, across the Swamp of Sorrows, and asks what we are brewing. I tell him it is medicine, which is true enough if you are generous with the word." } },
      choices = { { text = "Generous indeed. Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "Then you know what we owe her and what we would do for her. Keep your hood up when you pass Darkshire, cousin, because the Night Watch burns whatever it doesn't understand." } },
      choices = { { text = "I'll mind the Watch. Something else.", next = "BACK" } },
    },
    watchpost = {
      lines = { { id = "wp_default", text = "You have an eye for it. The road below shows me everything that comes up from Raven Hill, and the trees show nothing of us, which is exactly how a deathstalker likes a camp." } },
      choices = { { text = "I'll remember the spot. Something else.", next = "BACK" } },
    },
    truce = {
      narr = "His hand rests on the hilt at his belt and stays there.",
      lines = { { id = "tr_default", text = "Quarrels are not yours to decline, living one. Still, if you say nothing in Darkshire of what you saw here, I will forget your face as quickly as I can." } },
      choices = {
        { text = "My word is good. I'll say nothing.", next = "BACK", reply = "Words are cheap among the living, but I'll take yours, for now.", fx = { align = { honor = 1 } } },
        { text = "I'll tell the Night Watch whatever I please.", next = "BACK", reply = "Then I will remember your face after all, and so will Faustin.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served the Dark Lady since the day she freed us. I'll serve her until there's nothing left of me to serve." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care to. Ask Faustin; he enjoys talking." } },
  },
}
