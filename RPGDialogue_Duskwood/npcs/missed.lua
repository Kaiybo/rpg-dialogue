-- Duskwood folk a roster scan found missing: Benjamin Carevin (the child of the Carevin household),
-- Lohgan Eva (tailoring supplies; Madame Eva's grandson, Alyssa's brother) and Watcher Paige of the
-- Night Watch at the crossroads. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Benjamin Carevin: the boy of the Carevin household in Darkshire.
P:NPC {
  key = "benjamin_carevin", id = TODO_NPC("Benjamin Carevin"), name = "Benjamin Carevin", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "darkshire" }, temper = { "earnest", "watchful" }, values = { "brave", "family" },
  notices = { "kit", "wonder" },
  impression = {
    first = "Benjamin Carevin is the one child in a Darkshire household that hunts the dead, and he has plainly listened at every door in it. He asked what I had fought on the road and nodded gravely at the answer, as though comparing it with a list.",
    third = "{name} met Benjamin Carevin, the boy of the Carevin household in Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Hello. Did you come in by the road? You're supposed to tell somebody what you saw on it, and you can tell me if you like." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, so nothing got you. I told Elaine you would, and she put it on her list." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "I'm meant to be in bed, but nobody in this house sleeps much, so I don't see why I should." },
  },
  notice = {
    { id = "n_holy", cat = "wonder", when = { class = { "PALADIN", "PRIEST" } },
      text = "You've got the Light with you, haven't you? Jonathan says that's worth more than a crossbow against the ones that walk." },
    { id = "n_hunter", cat = "kit", when = { class = "HUNTER" },
      text = "Is that a proper hunting bow? Ours are crossbows, mostly, and I'm not allowed to wind one yet." },
    { id = "n_lock", cat = "wonder", when = { class = "WARLOCK" },
      text = "You smell a bit like the things in Jonathan's books. I don't think I'm supposed to talk to you, but I shan't tell." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Benjamin Carevin. Everybody in my family hunts the things in the woods, except Scott, who sells mushrooms, and me, because I'm not old enough yet.", fx = { learn = { "carevins" } } } },
      again = {
        { id = "h_again", text = "What else did you want to ask? I know lots, from listening." },
        { id = "h_again2", text = "Go on. I won't be called in for a while yet." },
      },
      choices = {
        { text = "What does your family hunt?", next = "hunt" },
        { text = "What do you do while they're out?", next = "wait" },
        { text = "Aren't you frightened here?", next = "frightened" },
        { text = "Has it always been dark in Darkshire?", next = "dark" },
        { text = "Stay near the lamps, Benjamin.", next = "END" },
      },
    },
    hunt = {
      lines = { { id = "hu_default", text = "The dead ones that got up again out by Raven Hill, and the wolf-men, and worse things that Jonathan won't name when I'm in the room. He goes out past the lamps after them, and Elaine writes down where they've been seen so he knows which way to go.", fx = { learn = { "raven_hill" } } } },
      choices = {
        { text = "How do you know about the worse things?", next = "listen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    listen = {
      lines = { { id = "l_default", text = "There's a place on the stairs where you can hear the whole kitchen if you keep still. I'm not being bad, because I'll have to know it all one day anyway, so I'm only starting early." } },
      choices = { { text = "A hunter learns to listen. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wait = {
      lines = { { id = "w_default", text = "I count them out and I count them back in, and I don't go to sleep till the numbers match. Then in the daytime I help Scott sort his mushrooms, which is dull, but he lets me keep the ones that glow." } },
      choices = {
        { text = "Have the numbers ever not matched?", next = "numbers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    numbers = {
      lines = { { id = "n_default", text = "Once, for nearly a whole night, and it was only that Calor had stopped at the inn to wash before he came home. Elaine was very cross with him, and I was as well, and I told him so." } },
      choices = { { text = "He deserved it. Something else.", next = "BACK" } },
    },
    frightened = {
      lines = { { id = "f_default", text = "Sometimes, when the howling's close and the lamp outside goes low. Jonathan says being frightened is only your eyes telling you to keep them open, so I do keep them open, and then it's better." } },
      choices = { { text = "That's good counsel. Something else.", next = "BACK" } },
    },
    dark = {
      lines = { { id = "d_default", text = "Not always, because the grown-ups say it was called something else once and the sun came right down to the square. I can't remember that, and I think they talk about it so much because they're afraid they'll stop remembering it too." } },
      choices = { { text = "The sun will come back. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Carevin, and I live in Darkshire with my family. I'm going to hunt with them as soon as I'm tall enough for a crossbow." } },
    carevins = { { id = "tp_car", text = "That's us. We go after the things nobody else in town will, and I count everyone back in." } },
    raven_hill = { { id = "tp_rh", text = "That's where the dead ones come from, out west. I'm not allowed anywhere near it, and I don't want to be." } },
    _none = { { id = "tp_none", text = "I haven't heard them talk about that one. I'll listen on the stairs tonight, though." } },
  },
}

-- Lohgan Eva: tailoring supplies in Darkshire; Madame Eva's grandson and Alyssa's brother.
P:NPC {
  key = "lohgan_eva", id = TODO_NPC("Lohgan Eva"), name = "Lohgan Eva", title = "Tailoring Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "wry", "patient" }, values = { "family", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Lohgan Eva sells thread, dye and cloth in Darkshire, and has the tired good humour of a man whose grandmother reads the cards and whose sister argues with them. He would rather sell a warm cloak than a prophecy, and he says so.",
    third = "{name} met Lohgan Eva, Madame Eva's grandson, who sells tailoring supplies in Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Good evening, or good morning, whichever it happens to be out there. I've thread, cloth and dyes, though there's small call for the bright ones." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and in one piece. My grandmother said you would be, and I've learned not to bet against her." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew, don't you? Then you'll know that black thread is the only colour that sells in this town, and I've plenty of it." },
    { id = "n_torn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Something in the woods has had a good pull at that sleeve. I can sell you the thread to mend it, and my advice is to mend it indoors." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Lohgan Eva. My grandmother tells this town its future and my sister sells it reagents, so somebody in the family had to sell something as plain as thread." } },
      again = {
        { id = "h_again", text = "What else can I tell you? Custom's slow, as you can see." },
        { id = "h_again2", text = "Go on, I'm in no hurry. Nobody here is, except to be home before the lamps go out." },
      },
      choices = {
        { text = "What's it like, being Madame Eva's grandson?", next = "eva" },
        { text = "What does Darkshire need from a tailor?", next = "need" },
        { text = "A town this grim could use some colour.", next = "colour" },
        { text = "Has she ever read the cards for you?", next = "cards" },
        { text = "Good evening, Lohgan.", next = "END" },
      },
    },
    eva = {
      lines = { { id = "e_default", text = "It means half my customers come in to ask what she said about them, and buy a spool to be polite. She's nearly always right, which makes her a difficult woman to share a supper table with." } },
      choices = {
        { text = "And your sister, Alyssa?", next = "alyssa" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alyssa = {
      lines = { { id = "a_default", text = "Alyssa rolls her eyes at every warning and then checks the door twice, so make of that what you will. I stand between the two of them at the table and pass the salt, and I've come to think that's my place in the family." } },
      choices = { { text = "Every family needs one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    need = {
      lines = { { id = "n_default", text = "Cloaks, before anything else, heavy and dark, for the Night Watch and for anyone fool enough to walk the road. After that it's bandage linen, and after that it's shrouds, which I'd sooner not sell and never run short of orders for.", fx = { learn = { "night_watch" } } } },
      choices = {
        { text = "The Watch buys from you?", next = "watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "When Commander Ebonlocke can find the coin, and often when she can't. I keep a tally, and I don't expect to see it paid, because a watcher in a thin cloak is a watcher we lose by midwinter." } },
      choices = { { text = "The town owes you for that. Something else.", next = "BACK" } },
    },
    colour = {
      lines = { { id = "c_default", text = "I've a shelf of red and gold dye that's been there since before the dark came down, and I can't bring myself to throw it out. Clarise Gnarltree bought a ribbon of the red last spring, and I thought about it for a week." } },
      choices = { { text = "Keep the shelf. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cards = {
      lines = {
        { id = "ca_default", text = "Once, when I was a boy, and she turned up the Needle and laughed until she had to sit down. She's never told me whether the cards have such a thing in them or she slipped it in to make a point." },
        { id = "ca_priest", when = { class = { "PRIEST", "PALADIN" } }, text = "Once, when I was a boy, and she turned up the Needle and laughed. Your Church wouldn't care for her cards, I know, but she's kept more folk in this town from despair than any sermon has." },
      },
      choices = { { text = "Either way, she was right. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an Eva, born in this town when it had another name. I sell what a tailor needs, and I stay because my family does." } },
    night_watch = { { id = "tp_nw", text = "They're all that stands between us and the woods, and they're wearing my cloaks. I wish there were more of both." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask my grandmother; she'll know, and she'll make you regret asking." } },
  },
}

-- Watcher Paige: Night Watch, posted at the crossroads on the Duskwood road.
P:NPC {
  key = "watcher_paige", id = TODO_NPC("Watcher Paige"), name = "Watcher Paige", title = "The Night Watch", gender = "female",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "brisk", "wary" }, values = { "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "Watcher Paige holds the crossroads in the middle of Duskwood with a torch and a short temper for dawdlers. She counted me in, pointed me the right way and had her eyes back on the trees before I'd thanked her.",
    third = "{name} met Watcher Paige of the Night Watch, posted at the crossroads in Duskwood.",
  },
  greetings = {
    { id = "g_default", text = "Hold there, {class}. Tell me where you're bound, and then keep moving, because nobody loiters at this crossing." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, that's one I needn't go looking for." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You've picked a poor hour for the road. Stay in the torchlight while we talk, and keep it short." },
  },
  notice = {
    { id = "n_fighter", cat = "watch", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } },
      text = "You look as if you can fight. Commander Ebonlocke is at the town hall in Darkshire, and she's never turned away a willing hand." },
    { id = "n_low", cat = "travel", when = { maxLevel = 17 },
      text = "You're green for these woods, and I'll say it plainly. Keep to the road and walk fast, and don't follow anything that calls to you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Paige, Night Watch. This is the crossing, and every road in Duskwood meets here, so everything that walks them comes past me sooner or later.", fx = { learn = { "night_watch" } } } },
      again = {
        { id = "h_again", text = "Anything else? Be quick about it." },
        { id = "h_again2", text = "Go on, but I'm watching the trees while you talk." },
      },
      choices = {
        { text = "Where do the roads lead from here?", next = "roads" },
        { text = "What comes past you after dark?", next = "dark" },
        { text = "You hold this crossing alone.", next = "alone" },
        { text = "Stay safe, Watcher.", next = "END" },
      },
    },
    roads = {
      lines = { { id = "r_default", text = "East takes you to Darkshire, and that's the one I'd choose. West goes to Raven Hill and the cemetery, south runs down into Stranglethorn, and north is the bridge to Elwynn, if you've had enough of us already." } },
      choices = {
        { text = "What's wrong with the west road?", next = "west" },
        { text = "Something else.", next = "BACK" },
      },
    },
    west = {
      lines = { { id = "w_default", text = "Raven Hill's been empty of the living for a good while now, and the cemetery beyond it is anything but empty. If you must go that way, go by day, or what passes for it, and don't stop for anyone who's standing still in the road.", fx = { learn = { "raven_hill" } } } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    dark = {
      lines = { { id = "d_default", text = "Worgs on most nights, spiders the size of a calf, and the dead when the wind's from the west. I've a torch, a horn and a sword, and I use them in that order.", fx = { learn = { "worgen" } } } },
      choices = {
        { text = "Does the horn bring help?", next = "horn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horn = {
      lines = { { id = "ho_default", text = "It brings whoever's nearest on the east road, which some nights is two watchers and some nights is nobody. I blow it all the same, because at least Darkshire hears it and knows to bar the doors." } },
      choices = { { text = "That takes nerve, Watcher. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    alone = {
      lines = { { id = "a_default", text = "The Watch hasn't the numbers for two to a post, and this one can't be left empty. Stormwind sent us nothing, so we took up arms ourselves, and you'll find that every watcher out here is somebody's baker or somebody's daughter." } },
      choices = { { text = "Darkshire's well served. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkshire born, and Night Watch since the Commander first called for volunteers. The crossing's been my post ever since." } },
    night_watch = { { id = "tp_nw", text = "We're townsfolk with torches, and we're all Darkshire has. Commander Ebonlocke holds us together." } },
    raven_hill = { { id = "tp_rh", text = "West of here, and given over to the dead. I turn folk back from that road whenever they'll listen." } },
    worgen = { { id = "tp_wg", text = "Wolf-men, and cleverer than wolves. I've heard them and I've seen their tracks, and I'd like to leave it at that." } },
    _none = { { id = "tp_none", text = "I don't know, and I've no time to wonder. Ask in Darkshire." } },
  },
}
