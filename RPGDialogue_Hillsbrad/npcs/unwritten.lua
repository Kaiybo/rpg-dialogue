-- Hillsbrad and Alterac folk no earlier pass reached: Tarren Mill's Delia Verana and Vinna Wayne, Deathstalker
-- Lesh at Southpoint Tower, Southshore's Sergeant Hartman, Caretaker Smithers and the crier, the Winter Veil
-- goblins at the Alterac Valley gates, Voggah Deathgrip, and the guards and odd figures of the mountains.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Delia Verana: Tarren Mill.
P:NPC {
  key = "hb_delia_verana", id = TODO_NPC("Delia Verana"), name = "Delia Verana", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "tarren_mill" }, temper = { "wry", "cold" }, values = { "practical" },
  impression = {
    first = "Delia Verana sits on the steps of a Tarren Mill house as though she owned it, which, before the plague, she did.",
    third = "{name} met Delia Verana, a Forsaken who lived in Tarren Mill before it fell and lives there still.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Tarren Mill, {class}. Mind the fences; I built that one, and it's the only thing in town that hasn't fallen down." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Delia Verana. This was my house, and that was my garden, and now it's a Deathguard billet, but they let me sit on my own steps." } },
      again = { { id = "h_again", text = "Something else? I've all day." } },
      choices = {
        { text = "Do you remember your neighbours?", next = "xneigh" },
        { text = "What do you think of the Deathguard here?", next = "xguard" },
        { text = "You built fences. Were you a carpenter?", next = "xcarp" },
        { text = "You still live here, among the living?", next = "xliving", when = { race = "Human" } },
        { text = "What was Tarren Mill like before?", next = "before" },
        { text = "Southshore's only a few miles down the road.", next = "southshore" },
        { text = "I'll leave you to your steps.", next = "END" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "A quiet mill town in the foothills, with good apples and nosy neighbours. When the plague came, half of them fled to Southshore and the other half are standing around the square with me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    southshore = {
      lines = { { id = "s_default", text = "So it is, and some of my old neighbours live there now, behind the walls with the Alliance. They'd shoot me on sight, and I can't decide whether that makes me sad or only tired." } },
      choices = {
        { text = "They're your enemies now. Forget them.", next = "BACK", reply = "That's what the Executor says, and he says it more kindly than you.", fx = { align = { honor = -1 } } },
        { text = "Maybe one day there'll be peace between you.", next = "BACK", reply = "Maybe, {class}. I'll sit on these steps and wait for it.", fx = { align = { honor = 1 } } },
      },
    },
    xneigh = {
      lines = {
        { id = "xn1", text = "Every one of them, and that's the trouble. Old Hiram with the cider press, the Tollers and their six boys, the widow who sold honey and gossip in equal measure. Some of them are standing in the square with me, and some are in Southshore cursing my name, and I'm not sure which ones I miss more." },
      },
      choices = {
        { text = "Do the ones in Southshore hate you?", next = "xhate" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xhate = {
      lines = {
        { id = "xh1", text = "They hate what I am, and I can't blame them for it. I'd have hated me too, before. They bring their soldiers up the hill and set fire to the houses we used to share Midsummer suppers in." },
      },
      choices = {
        { text = "They're the enemy now. Let them burn.", next = "BACK", reply = "Spoken like a Deathguard. Some days I agree with you.", fx = { align = { light = -1 } } },
        { text = "They're still your neighbours, whatever's happened.", next = "BACK", reply = "That's a soft thing to say, and I don't know whether to thank you for it.", fx = { align = { light = 1 } } },
      },
    },
    xguard = {
      lines = {
        { id = "xg1", text = "They're not unkind, for corpses with swords. They let me keep the garden, though nothing in it grows, and they don't ask me to fight, which suits me because I never could. High Executor Darthalia means business, though. She'd burn every farm between here and the sea if the Dark Lady asked it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcarp = {
      lines = {
        { id = "xc1", text = "My husband was, and I held the boards while he swore at them. When he died I took up the hammer, and I learned the swearing too, and I'll admit I enjoyed that part more." },
      },
      choices = {
        { text = "What happened to him?", next = "xhusband" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhusband = {
      lines = {
        { id = "xhu1", text = "Fever, two winters before the plague, and so he was buried properly in the churchyard, and he stayed buried. I've never been so grateful for a death in my life." },
      },
      choices = {
        { text = "I'm sorry. Something else.", next = "BACK" },
      },
    },
    xliving = {
      lines = {
        { id = "xl1", text = "Among the dead, {class}, though I'm still in my own house, and you're the one who's out of place. Mind yourself in Tarren Mill; the Deathguard aren't as polite as I am." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK" },
      },
    },
  },
  topics = {
    southshore = { { id = "xtp_ss", text = "Half my old neighbours are down there. They'd hang me from the docks if they could." } },
    darthalia = { { id = "xtp_da", text = "The High Executor. She doesn't blink, and I suppose she can't." } },
    _none = { { id = "tp_none", text = "Ask the Deathguard. I only know my own street." } },
  },
}

-- Vinna Wayne: Tarren Mill.
P:NPC {
  key = "hb_vinna_wayne", id = TODO_NPC("Vinna Wayne"), name = "Vinna Wayne", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "tarren_mill" }, temper = { "brisk", "dry" }, values = { "dutiful" },
  impression = {
    first = "Vinna Wayne carries buckets between the apothecaries' cauldrons and the well, and she does it with the stoic efficiency of someone who has carried buckets her whole life and her whole death.",
    third = "{name} met Vinna Wayne, a Forsaken who works around Tarren Mill.",
  },
  greetings = {
    { id = "g_default", text = "Out of the way, {class}, unless you'd like to carry one of these. No? Then out of the way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Vinna Wayne. I fetch and carry for the apothecaries, which is not glamorous, but somebody has to keep Lydon's cauldrons full." } },
      again = { { id = "h_again", text = "Quickly now, this bucket's heavy." } },
      choices = {
        { text = "Who is Apothecary Lydon?", next = "xlydon" },
        { text = "Who were you, before?", next = "xbefore" },
        { text = "I'll carry a bucket. Where to?", next = "xcarry" },
        { text = "What's in the buckets?", next = "buckets" },
        { text = "You work hard for a dead woman.", next = "work" },
        { text = "Carry on.", next = "END" },
      },
    },
    buckets = {
      lines = { { id = "b_default", text = "Water, mostly, though Apothecary Lydon has me fetch other things from the farms that I won't name. The less I know about his recipes, the better I sleep, or would, if I slept." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "I worked hard for a living woman too, and I wasn't paid any better then. At least now my back doesn't ache, and the Deathguard say please, now and then." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlydon = {
      lines = {
        { id = "xl1", text = "Lydon runs the alchemy in Tarren Mill for the Royal Apothecary Society, and he answers to Putress and the Undercity, or says he does. He's clever, and cold, and he hums while he works, which is worse. Whatever he brews in those vats is meant for Southshore, and nobody will tell me more than that." },
      },
      choices = {
        { text = "Does that trouble you?", next = "xtrouble" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xtrouble = {
      lines = {
        { id = "xt1", text = "It ought to, I suppose. I carried water for a baker once, and now I carry it for plague. But the living tried to burn me twice, and it's hard to weep for them." },
      },
      choices = {
        { text = "The living brought this on themselves.", next = "BACK", reply = "That's what Lydon says, between hums.", fx = { align = { light = -1 } } },
        { text = "Plague is a coward's weapon, whoever uses it.", next = "BACK", reply = "Maybe so. Don't let the apothecaries hear you say it.", fx = { align = { light = 1 } } },
      },
    },
    xbefore = {
      lines = {
        { id = "xb1", text = "A baker's girl in Hillsbrad, up before dawn with flour to my elbows and a bad habit of eating the crusts. The plague came in the grain, and we baked it into every loaf we sold." },
      },
      choices = {
        { text = "That's a cruel irony.", next = "xirony" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xirony = {
      lines = {
        { id = "xi1", text = "Irony is a word for people who still laugh at things. I just fetch the water now, and I don't bake anything at all." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcarry = {
      lines = {
        { id = "xc1", text = "Ha! The well's in the square and the vats are in the cellar, and Lydon will shout if you spill. On second thought, give it back, because I'll get the blame either way." },
      },
      choices = {
        { text = "Suit yourself.", next = "BACK" },
      },
    },
  },
  topics = {
    apothecary = { { id = "xtp_ap", text = "The Royal Apothecary Society. They pay in coin and in looks you don't want to see twice." } },
    southshore = { { id = "xtp_ss", text = "I sold bread there once. They'd stone me now." } },
    _none = { { id = "tp_none", text = "Couldn't say. I fetch things; I don't learn them." } },
  },
}

-- Deathstalker Lesh: Southpoint Tower, watching Hillsbrad Fields.
P:NPC {
  key = "hb_deathstalker_lesh", id = TODO_NPC("Deathstalker Lesh"), name = "Deathstalker Lesh", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "tarren_mill" }, temper = { "cold", "sharp" }, values = { "loyal", "duty" },
  impression = {
    first = "Deathstalker Lesh crouches in the shadow of Southpoint Tower, watching the fields below with the stillness of a cat at a mousehole.",
    third = "{name} met Deathstalker Lesh, a Forsaken scout who watches Hillsbrad Fields from Southpoint Tower.",
  },
  greetings = {
    { id = "g_default", text = "Keep low, {class}. The farmers below have keen eyes and keener pitchforks, and I've been at this post too long to be spotted now." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathstalker Lesh, a scout for High Executor Darthalia. I watch Hillsbrad Fields and report on every cart and soldier that moves through them." } },
      again = { { id = "h_again", text = "Quietly. What else?" } },
      choices = {
        { text = "What have you seen lately?", next = "xseen" },
        { text = "Do you ever miss being one of them?", next = "xmiss" },
        { text = "I'm a rogue as well.", next = "xrogue", when = { class = "ROGUE" } },
        { text = { normal = "What have you seen in the fields?", polite = "What have you observed in the fields, Deathstalker?", blunt = "What's down there?" }, next = "fields" },
        { text = "You've been here a long time.", next = "long" },
        { text = "Is it time to strike?", next = "strike", when = { questActive = TODO_QUEST("Time To Strike") } },
        { text = "I'll leave you to watch.", next = "END" },
      },
    },
    fields = {
      lines = { { id = "f_default", text = "Farmers and the Hillsbrad militia, and Farmer Ray's orchards, and the Alliance's supplies heading into Southshore. They grow food for the soldiers who march on Tarren Mill, which makes every field a target." } },
      choices = {
        { text = "Farmers aren't soldiers.", next = "farmers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmers = {
      lines = { { id = "fa_default", text = "Then they shouldn't feed soldiers. The Executor doesn't ask me to weigh their innocence, only to count them." } },
      choices = {
        { text = "Every enemy supply line should be cut.", next = "BACK", reply = "Spoken like a Deathstalker. Darthalia would like you.", fx = { align = { honor = -1 } } },
        { text = "There's no honour in burning farms.", next = "BACK", reply = "Honour is a luxury of the living, {class}.", fx = { align = { honor = 1 } } },
      },
    },
    long = {
      lines = { { id = "l_default", text = "Long enough to know which farmer whistles and which one coughs. The dead make good scouts because we don't need to eat, sleep or warm our hands, and the living never think to look for us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strike = {
      lines = { { id = "s_default", text = "It is. Go down into the fields and do what the Executor wants done, while I watch the road for the militia. Come back to Tarren Mill when it's finished, and I'll make my report." } },
      choices = {
        { text = "What exactly does she want done?", next = "orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      lines = { { id = "o_default", text = "Their strength broken, so they can't send more to Southshore. Darthalia will give you the particulars; I only tell you when the moment's right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xseen = {
      lines = {
        { id = "xs1", text = "More soldiers coming up from Southshore than last month, and a mage in purple counting the fences, which means Dalaran's taken an interest. Farmer Ray's sons have started sleeping in the orchard with crossbows. None of it means an attack yet, but all of it means one is coming." },
      },
      choices = {
        { text = "Will Darthalia strike first?", next = "xfirst" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xfirst = {
      lines = {
        { id = "xf1", text = "If I tell her what I think I'll tell her, she will. The question is whether we hit the fields before the harvest goes south, or wait and let them grow fat." },
      },
      choices = {
        { text = "Strike now. Burn the fields before the harvest.", next = "BACK", reply = "Ruthless, and probably right. I'll put it in the report.", fx = { align = { light = -1 } } },
        { text = "Burning food won't win this. Hit the soldiers.", next = "BACK", reply = "An honest answer, and a costlier one. Darthalia may not agree.", fx = { align = { light = 1 } } },
      },
    },
    xmiss = {
      lines = {
        { id = "xm1", text = "I watch them shell peas on their porches and argue about the weather, and I remember doing exactly that, in a house not two miles from here. I don't miss it, but I remember it, which is worse." },
        { id = "xm2", when = { race = "Scourge" }, text = "You'll understand. You remember too, don't you, whatever you tell the others?" },
      },
      choices = {
        { text = "I remember. I don't dwell on it.", next = "BACK", reply = "Good. Dwelling makes the hands shake." },
      },
    },
    xrogue = {
      lines = {
        { id = "xr1", text = "Then you know the trick: stand still, breathe slow, and wait until the dog stops looking. Of course, I don't need to breathe, which makes it a good deal easier." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darthalia = { { id = "xtp_da", text = "She reads every word of my reports, and then she asks why I didn't write more." } },
    southshore = { { id = "xtp_ss", text = "A town that thinks walls will save it. Walls didn't save Lordaeron." } },
    _none = { { id = "tp_none", text = "I watch the fields, not the gossip." } },
  },
}

-- Sergeant Hartman: Southshore, at Hallow's End.
P:NPC {
  key = "hb_sergeant_hartman", id = TODO_NPC("Sergeant Hartman"), name = "Sergeant Hartman", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "southshore" }, temper = { "gruff", "steady" }, values = { "duty", "brave" },
  impression = {
    first = "Sergeant Hartman paces the Southshore green with a bucket at his feet, looking north toward Tirisfal like a man who expects to see smoke.",
    third = "{name} met Sergeant Hartman, the Southshore soldier who sends volunteers to spoil the Forsaken's Hallow's End festival.",
  },
  greetings = {
    { id = "g_default", text = "Ah, {class}, you've a sturdy look about you. Hallow's End is here, and the Forsaken are up to their old tricks in Tirisfal." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You're a long way from friends, Horde. Move along, before I call the guard." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Sergeant Hartman, of the Southshore garrison. Every Hallow's End the undead raise a great burning figure outside their city, and every year I send someone to spoil it." } },
      again = { { id = "h_again", text = "Anything else, soldier?" }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = { normal = "What are the Forsaken celebrating?", polite = "What is it the Forsaken celebrate, Sergeant?", blunt = "What do the Forsaken celebrate?" }, next = "celebrate" },
        { text = "How do I spoil it?", next = "spoil" },
        { text = "What's this about pine?", next = "pine", when = { questActive = TODO_QUEST("The Power of Pine") } },
        { text = "How does the garrison fare these days?", next = "garrison" },
        { text = "My family fled Lordaeron too. I understand you.", next = "refugee", when = { race = "Human" } },
        { text = "I'll think on it.", next = "END" },
      },
    },
    celebrate = {
      lines = { { id = "c_default", text = "Their freedom from the Lich King, so they say, and they burn a wicker giant to mark it. It was our festival first, and I don't care for the way they've twisted it." } },
      choices = {
        { text = "They've as much right to it as we have.", next = "BACK", reply = "Have they? Tell that to the folk they drove out of Tarren Mill.", fx = { align = { order = -1 } } },
        { text = "It's an insult to Lordaeron's memory.", next = "BACK", reply = "Exactly my feeling, {class}, and I'm glad someone shares it.", fx = { align = { order = 1 } } },
      },
    },
    spoil = {
      lines = { { id = "s_default", text = "Go north into Tirisfal, near the Undercity, and douse their Wickerman with a bucket. It's guarded by abominations, mind, so you'll need to be quick, and quicker still getting out." } },
      choices = {
        { text = "That sounds like a good way to die.", next = "die" },
        { text = "Something else.", next = "BACK" },
      },
    },
    die = {
      lines = { { id = "d_default", text = "It does, and nobody's died of it yet that I know of, though a few came back smelling of pitch. Call it a tradition, and a little poke in the eye for the Dark Lady." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pine = {
      lines = { { id = "p_default", text = "Wickerman ash gets everywhere, and it carries a stink that isn't natural. Pine resin cuts through it, so bring me what I asked for, and I'll see you're properly cleaned." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    garrison = {
      lines = { { id = "ga_default", text = "Stretched thin, if I'm honest, with Tarren Mill's dead to the north and the Syndicate creeping down out of Alterac. We hold Southshore, and we hold it well, but holding is all we've managed since the plague." } },
      choices = {
        { text = "What happened at Tarren Mill?", next = "tarren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tarren = {
      narr = "He turns his head north and is quiet for a moment.",
      lines = { { id = "ta_default", text = "It was a living town once, with a mill and a smithy and a fair every harvest, and now it's the Forsaken's, every stone of it. Some of the folk walking its streets were neighbours of ours, and that's the part none of us can talk about for long." } },
      choices = {
        { text = "Then we take it back, one day.", next = "BACK", reply = "One day, aye, when Stormwind sends us more than letters.", fx = { align = { order = 1 } } },
        { text = "Let the dead keep it. Look after the living.", next = "BACK", reply = "Spoken like someone who never lived there, but you may be right.", fx = { align = { order = -1 } } },
      },
    },
    refugee = {
      lines = { { id = "re_default", text = "Then you know what it is to watch home burn and still find yourself setting a table for the people you lost. Hallow's End was ours before it was theirs, and I'll keep it that way while I've breath." } },
      choices = { { text = "Then I'll douse their fire for you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my business, {class}. Ask the Magistrate." } },
  },
}

-- Caretaker Smithers: the Southshore graveyard.
P:NPC {
  key = "hb_caretaker_smithers", id = TODO_NPC("Caretaker Smithers"), name = "Caretaker Smithers", title = "Caretaker", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "southshore" }, temper = { "gentle", "anxious" }, values = { "dutiful", "kind" },
  impression = {
    first = "Caretaker Smithers leans on a spade at the edge of the Southshore graveyard, glancing up the north road every few minutes.",
    third = "{name} met Caretaker Smithers, who tends the Southshore graveyard.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you, {class}. Mind the fresh ground, please; the dead deserve a little peace." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Smithers, caretaker of this yard. I dig the graves and keep them tidy, and these days I keep an eye on them too." } },
      again = { { id = "h_again", text = "Anything else? I've a grave half dug." } },
      choices = {
        { text = "How many graves have you dug since the plague?", next = "xcount" },
        { text = "Has anything ever risen in your yard?", next = "xrisen" },
        { text = "I am one of the dead you worry about.", next = "xdead", when = { race = "Scourge" } },
        { text = "I could bless these graves, if you'd like.", next = "xbless", when = { class = "PRIEST" } },
        { text = "Why keep an eye on graves?", next = "eye" },
        { text = "You look worried.", next = "worried" },
        { text = "Rest easy, caretaker.", next = "END" },
      },
    },
    eye = {
      lines = { { id = "e_default", text = "Because in Lordaeron the dead don't always stay put. The plague is cured here, I'm told, but I've seen what walks out of Tarren Mill, and I'll not have it walking out of my yard." } },
      choices = {
        { text = "Burn the bodies, then.", next = "BACK", reply = "Burn them? These are Southshore's fathers and mothers, {class}. I'll not burn them.", fx = { align = { light = -1 } } },
        { text = "The Light will keep them in their graves.", next = "BACK", reply = "I pray you're right. I bless each one as I bury it.", fx = { align = { light = 1 } } },
      },
    },
    worried = {
      lines = { { id = "w_default", text = "Who in Southshore isn't? The Forsaken sit up the road in Tarren Mill, the Syndicate creeps out of Alterac, and every month I dig more graves for the militia." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcount = {
      lines = {
        { id = "xc1", text = "I stopped counting at three hundred, {class}, because the numbers started to keep me up at night. Refugees from the north, mostly, who made it as far as Southshore and no further. Some had no names, so I carved what I could, a trade or a town, so at least the stone says something." },
      },
      choices = {
        { text = "That's a kind thing to do.", next = "xkind" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xkind = {
      lines = {
        { id = "xk1", text = "Kindness is cheap with a chisel. The hard part is the families who come looking, years after, and I have to walk them along the rows guessing which stone is theirs." },
      },
      choices = {
        { text = "The dead should be burned, not buried, in times like these.", next = "BACK", reply = "Maybe they should, but I'll not be the one to tell a widow so.", fx = { align = { light = -1 } } },
        { text = "Buried with a name, they rest. That matters.", next = "BACK", reply = "Aye, that's what I tell myself every morning I pick up the shovel.", fx = { align = { light = 1 } } },
      },
    },
    xrisen = {
      lines = {
        { id = "xr1", text = "Once, last winter, the ground over a fresh grave was turned up from beneath. I sat with a lantern and an axe for three nights, and nothing came out, but I've not slept right since. The guards laughed, but they don't walk past at night either, I notice." },
      },
      choices = {
        { text = "Did you tell anyone in Southshore?", next = "xtold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtold = {
      lines = {
        { id = "xt1", text = "I told Magistrate Maltory, and he told me to keep it quiet so as not to frighten folk. So I'm telling you instead, quietly, and now it's your worry too." },
      },
      choices = {
        { text = "I'll keep an eye out.", next = "BACK" },
      },
    },
    xdead = {
      lines = {
        { id = "xd1", text = "You speak, and you're polite about it, which is more than the things from Tarren Mill manage. Still, I'd thank you to keep your feet off the fresh ground, and your hands where I can see them." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    xbless = {
      lines = {
        { id = "xb1", text = "Would you? The Southshore chaplain is too busy with the living to say words over the old rows. Say them quietly, though; I'd rather the dead didn't hear their names called too loudly." },
      },
      choices = {
        { text = "I'll do it before I leave.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "xtp_fs", text = "They say the Forsaken are free of the Lich King. I say a corpse is a corpse, and I bury them deep." } },
    tarren_mill = { { id = "xtp_tm", text = "I had a cousin in Tarren Mill. I don't ask what became of him." } },
    _none = { { id = "tp_none", text = "I'm only the caretaker, {class}. Ask the Magistrate." } },
  },
}

-- Southshore Crier: runs into town warning of assassins.
P:NPC {
  key = "hb_southshore_crier", id = TODO_NPC("Southshore Crier"), name = "Southshore Crier", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "southshore" }, temper = { "anxious", "loud" }, values = { "dutiful" },
  impression = {
    first = "The Southshore crier stumbles into town red-faced and gasping, bell in hand, shouting warnings at anyone who will listen.",
    third = "{name} met the Southshore crier, who brings warnings of assassins to the town.",
  },
  greetings = {
    { id = "g_default", text = "Hear ye, hear ye! Oh, Light, give me a moment to breathe, {class}, because assassins are on their way to Southshore!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I ran all the way down from the hills, and I saw them, cloaked figures moving through the trees toward town. They must be after Magistrate Maltory again, and I've got to warn the guards!" } },
      again = { { id = "h_again", text = "Quickly, {class}, there's no time!" } },
      choices = {
        { text = "Calm down. Who are you, exactly?", next = "xwho" },
        { text = "Why does anyone want Maltory dead?", next = "xmaltory" },
        { text = "You're making a lot of noise for a warning.", next = "xnoise" },
        { text = "Who would want the Magistrate dead?", next = "who" },
        { text = "Where did you see them?", next = "where" },
        { text = "I'll guard the town.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The Syndicate, I'd wager, out of Alterac, because they've been trying to get at him for months. Or the Forsaken, but they'd use plague, not knives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    where = {
      lines = { { id = "wh_default", text = "In the hills north of the town, coming down from every direction at once. Guards to your posts, I say, and you too, if you've a weapon!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwho = {
      lines = {
        { id = "xw1", text = "I carry word between the farms and the town, and when there's trouble I'm the one who runs. My legs aren't what they were, {class}, but they're faster than anybody else's in Southshore. Usually it's a lost cow or a fire in a hayloft, and I'll admit assassins are a new one for me." },
      },
      choices = {
        { text = "Has it always been this bad?", next = "xbad" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xbad = {
      lines = {
        { id = "xb1", text = "Before the plague, the worst news I ever carried was the price of wool. Now it's Forsaken in the fields, Syndicate on the roads, and something in the hills that kills the sheep and leaves no tracks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmaltory = {
      lines = {
        { id = "xm1", text = "He's the magistrate, so he's the one who signs the bounties on Syndicate heads, and he's signed a great many. The Syndicate don't like paper with their names on it. There's talk he's been hard on the refugees too, and turned some away from the town gates, though I'd never say that to his face." },
      },
      choices = {
        { text = "A hard man keeps a town safe.", next = "xhard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhard = {
      lines = {
        { id = "xh1", text = "Maybe so. He's kept the gates shut and the walls manned, and Southshore still stands while Tarren Mill doesn't. But I carried a frozen child to the chapel last winter because the gate stayed shut." },
      },
      choices = {
        { text = "Then Maltory had no right to turn them away.", next = "BACK", reply = "I'd agree, if anyone asked a crier, and nobody does.", fx = { align = { order = -1 } } },
        { text = "He can't save everyone. The gates must hold.", next = "BACK", reply = "That's what the guards said, too, and they're probably right, Light help us.", fx = { align = { order = 1 } } },
      },
    },
    xnoise = {
      lines = {
        { id = "xn1", text = "If I whisper, nobody listens, and if I shout, at least the assassins know they've been seen. A man who's been seen is a man who might turn around and go home." },
      },
      choices = {
        { text = "That's cleverer than it sounds.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "xtp_sy", text = "Alterac's lords, gone bad, and their sons gone worse. They want Hillsbrad back, and they don't care who's in it." } },
    ravenholdt = { { id = "xtp_rv", text = "There's a manor up in the hills nobody talks about. I don't run messages up there, and I never will." } },
    _none = { { id = "tp_none", text = "No time for that now! Assassins!" } },
  },
}

-- Hillsbrad Tailor: cloth vendors in Hillsbrad Fields.
P:NPC {
  key = "hb_hillsbrad_tailor", id = TODO_NPC("Hillsbrad Tailor"), name = "Hillsbrad Tailor",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "anxious", "practical" }, values = { "craft" },
  impression = {
    first = "The Hillsbrad tailor works at a table in the shade of a barn, stitching linen shirts for the farmhands and glancing nervously north toward Tarren Mill.",
    third = "{name} met a tailor selling cloth in Hillsbrad Fields.",
  },
  greetings = {
    { id = "g_default", text = "Looking for cloth, {class}? I've shirts and robes for honest work, and a few for less honest work, if you don't ask questions." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I sew for the farms of Hillsbrad Fields, mostly work shirts and the odd wedding dress, though there haven't been many weddings since the plague." } },
      again = { { id = "h_again", text = "Anything else? I've a seam to finish." } },
      choices = {
        { text = "Less honest work? What do you mean?", next = "xhonest" },
        { text = "Who taught you the trade?", next = "xtaught" },
        { text = "I sew a little myself.", next = "xsew", when = { class = "MAGE" } },
        { text = "Business must be hard here.", next = "hard" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Who buys your shirts these days?", next = "buyers" },
        { text = "I'm a tailor myself. Your stitching is fine work.", next = "craft", when = { profession = "Tailoring" } },
        { text = "Good day.", next = "END" },
      },
    },
    hard = {
      lines = { { id = "h2_default", text = "Hard as stone. The Forsaken raid the fields, the farmers can barely pay, and half my thread comes up from Southshore on carts that don't always arrive." } },
      choices = {
        { text = "Why not move to Southshore?", next = "move" },
        { text = "Something else.", next = "BACK" },
      },
    },
    move = {
      lines = { { id = "m_default", text = "Because my grandmother sewed in this barn, and her mother before her. If the dead want it, they'll have to take it from me needle by needle." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The farmhands, when they're paid, and the Southshore militia, who tear through sleeves faster than I can mend them. A few adventurers too, though most of you want silk and I've only linen and wool." } },
      choices = { { text = "Linen will do. Something else.", next = "BACK" } },
    },
    craft = {
      lines = { { id = "cr_default", text = "Kind of you to say, and rarer than you'd think out here, where folk only notice a seam when it splits. My grandmother taught me a double stitch for work shirts, and it hasn't failed me yet." } },
      choices = { { text = "I'll try it. Something else.", next = "BACK" } },
    },
    xhonest = {
      lines = {
        { id = "xh1", text = "Dark cloaks, soft-soled boots, a hood that hides a face. A traveller asks, and I don't ask why, because a tailor who asks questions in these hills ends up with fewer customers and more enemies. There's Syndicate up in Alterac and assassins at Ravenholdt, and every one of them needs a hem fixed now and then." },
      },
      choices = {
        { text = "You sell to the Syndicate?", next = "xsynd" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xsynd = {
      lines = {
        { id = "xsy1", text = "I sell to whoever walks in with coin and wipes their boots. If that's a Syndicate cutthroat once a season, well, he pays more than the farmers do." },
      },
      choices = {
        { text = "Trade is trade. You've got to eat.", next = "BACK", reply = "My thoughts exactly, and you can't eat principles in winter.", fx = { align = { order = -1 } } },
        { text = "You're dressing the men who rob your neighbours.", next = "BACK", reply = "Maybe I am. Don't think I don't lie awake over it.", fx = { align = { order = 1 } } },
      },
    },
    xtaught = {
      lines = {
        { id = "xt1", text = "My mother, at the kitchen table in Hillsbrad, with a candle and a basket of my father's torn shirts. She could hem a sleeve in the time it took him to tear the other one. She went south to Stormwind with my sisters after the plague, and I stayed with the shop, because somebody had to." },
      },
      choices = {
        { text = "Do you hear from them?", next = "xletters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xletters = {
      lines = {
        { id = "xl1", text = "A letter every few months, when a ship comes into Southshore. They say Stormwind's crowded and dear, and my sister's taken up with a guard from the Mage Quarter, which my mother does not approve of." },
      },
      choices = {
        { text = "I hope they're well. Something else.", next = "BACK" },
      },
    },
    xsew = {
      lines = {
        { id = "xse1", text = "A mage who sews! Most of your kind think cloth comes out of the air with a word. Mageweave holds a stitch better than linen, if you're ever lucky enough to find some." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "xtp_sy", text = "They pay in silver and they never haggle, which frightens me more than if they did." } },
    forsaken = { { id = "xtp_fs", text = "They burned the Durnes' barn last month. I sewed the shroud for the old man myself." } },
    _none = { { id = "tp_none", text = "I only know cloth and the weather, {class}." } },
  },
}

-- Dillord Copperpinch: Smokywood Pastures, by the Horde entrance to Alterac Valley.
P:NPC {
  key = "hb_dillord_copperpinch", id = TODO_NPC("Dillord Copperpinch"), name = "Dillord Copperpinch", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "loud", "cheerful" }, values = { "ambitious" },
  impression = {
    first = "Dillord Copperpinch has set up a food stall in the snow outside Alterac Valley, wrapped in three scarves and selling hot drinks at mountain prices.",
    third = "{name} met Dillord Copperpinch, a Smokywood Pastures goblin selling food at the Horde entrance to Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Hey, pal, you look frozen! Hot food, warm drinks, and a price that'll warm ya even faster, 'cause I'm practically givin' it away." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Dillord Copperpinch, Smokywood Pastures, mountain branch. Soldiers come out of that valley half frozen and starving, and a goblin with a stove is a goblin with a customer base." } },
      again = { { id = "h_again", text = "Anything else, buddy? My fingers are freezin' here." } },
      choices = {
        { text = "What did you bet, to lose this badly?", next = "xbet" },
        { text = "Do the orcs give you trouble?", next = "xorcs" },
        { text = "Mirvyna says she's your competitor.", next = "xmirv" },
        { text = "Aren't you related to the other Copperpinches?", next = "family" },
        { text = "Selling food at a war seems risky.", next = "risky" },
        { text = "Show me the food.", next = "BUSINESS" },
        { text = "Stay warm.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "Cousins, the whole lot of 'em, and every one of us sellin' somethin' somewhere. Nardstrum and Jaycrue got the cozy city gig, and I got the snowdrift, 'cause I lost a bet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    risky = {
      lines = { { id = "r_default", text = "Risky? Listen, kid, the Frostwolves and the Stormpikes both get hungry, and nobody shoots the cook. That's the first rule of wartime catering, and I'd put it on a sign if I could spare the paint." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbet = {
      lines = {
        { id = "xb1", text = "Whoa, whoa, low blow, pal. I bet Nardstrum I could out-sell him at the Ironforge Winter Veil, and I would've, too, if the cart hadn't blown up three days in. Fuse on the cider warmer, very unfortunate, lost the cart, the stock and half my eyebrows, and the loser takes the snowdrift, so here I am." },
      },
      choices = {
        { text = "Do you like it out here?", next = "xlike" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xlike = {
      lines = {
        { id = "xl1", text = "Like it? I'm freezin' my ears off and I've had three wolves try to eat my sausages. But the profit's real, and a goblin can learn to love anything with a margin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xorcs = {
      lines = {
        { id = "xo1", text = "Trouble? Naw, the Frostwolves are the best customers I ever had, chum, because they pay up front and they never haggle. Sometimes they growl, but a growl's free and so's my smile." },
        { id = "xo2", when = { race = "Orc" }, text = "Throm-ka, friend! Frostwolf, huh? Ya want the usual?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmirv = {
      lines = {
        { id = "xm1", text = "Mirvyna? Ha! She's got the Stormpike side and a nice stove, I'll give her that. But her pies are three parts gravy and one part guesswork, and my roast is the real deal, ask anybody. Between you and me, we split the delivery wagon and keep each other honest, but don't tell her I said so." },
      },
      choices = {
        { text = "Competition keeps you both sharp. Good for her.", next = "BACK", reply = "Hah, yeah, that's what the Cartel says too, while it takes a cut.", fx = { align = { order = -1 } } },
        { text = "You two should just let the Cartel set the prices.", next = "BACK", reply = "Hey, now, that's the sensible answer, and I hate it.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    frostwolf = { { id = "xtp_fw", text = "Fine folks, terrible table manners, great tippers." } },
    smokywood = { { id = "xtp_sw", text = "Smokywood Pastures, finest seasonal goods in Azeroth, and I'm their loneliest employee." } },
    _none = { { id = "tp_none", text = "Dunno, pal, but I got hot cider that don't care either." } },
  },
}

-- Mirvyna Jinglepocket: Smokywood Pastures, by the Alliance entrance to Alterac Valley.
P:NPC {
  key = "hb_mirvyna_jinglepocket", id = TODO_NPC("Mirvyna Jinglepocket"), name = "Mirvyna Jinglepocket", title = "Smokywood Pastures", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "cheerful", "brisk" }, values = { "ambitious" },
  impression = {
    first = "Mirvyna Jinglepocket runs a food stall on the Headland by the Alliance side of Alterac Valley, ringing a little bell every time someone walks past.",
    third = "{name} met Mirvyna Jinglepocket, a goblin selling food at the Alliance entrance to Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Ding-a-ling, sweetheart! Hot pies, cold ale, and a warm smile at no extra charge, which is the only free thing on this stall." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mirvyna Jinglepocket, Smokywood Pastures, valley concession. The Stormpike dwarves eat like starved bears, and I've the only stove on this side of the mountain." } },
      again = { { id = "h_again", text = "Anything else? Bell's gettin' cold." } },
      choices = {
        { text = "What's selling best this winter?", next = "xsell" },
        { text = "Isn't a war a strange place for a pie stall?", next = "xwar" },
        { text = "You'll sell to anyone, won't you?", next = "xanyone" },
        { text = "Do you sell to the Horde too?", next = "horde" },
        { text = "What's with the bell?", next = "bell" },
        { text = "Let me see the food.", next = "BUSINESS" },
        { text = "Goodbye.", next = "END" },
      },
    },
    horde = {
      lines = { { id = "h2_default", text = "Not me personally, but my competitor Dillord's got the other gate, and the Cartel takes a cut from both of us. Business is business, and a war is just a very hungry customer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bell = {
      lines = { { id = "b_default", text = "It jingles, and it gets attention, and attention turns into coin. Plus the dwarves think it's festive, so they buy an extra pie, which is the whole point, sugar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xsell = {
      lines = {
        { id = "xs1", text = "Spiced meat pies, sweetheart, by a mile, because a dwarf'll pay double for anything with gravy in it. Second is the hot cider, third is bandages, which I don't officially sell, so you didn't hear it from me." },
      },
      choices = {
        { text = "Where do you get the ingredients?", next = "xingr" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xingr = {
      lines = {
        { id = "xi1", text = "Supply wagon up from Southshore, which costs, plus the Cartel's cut, which costs more, plus the guard I pay to keep the yetis off the wagon, which costs most of all. Margins are thin as ice, pal, but the volume's beautiful." },
      },
      choices = {
        { text = "Sounds like hard work. Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = {
        { id = "xw1", text = "Strange? It's the best spot on the continent! Hungry soldiers, no competition, and a winter that sells cider all by itself. My cousin in Booty Bay would give an eye for a location like this, and he's only got the one left. The trick is keeping the stall standing when the shooting starts, and so far I've only lost two awnings and a very expensive kettle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xanyone = {
      lines = {
        { id = "xa1", text = "Anybody with coin, friend, and I don't check colours. The Stormpike buy pies on this side, the Frostwolves buy cider off Dillord on the other, and the Cartel gets rich off both. Some folks call that wicked. I call it keeping everybody fed, which is more than either general's managed." },
      },
      choices = {
        { text = "Feeding both sides is the honest thing to do.", next = "BACK", reply = "See, you get it! I knew you were a smart one.", fx = { align = { honor = 1 } } },
        { text = "You're profiting from people dying out there.", next = "BACK", reply = "Somebody's gonna profit, sweetheart. Might as well be someone who bakes.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    frostwolf = { { id = "xtp_fw", text = "Big tippers, the orcs, when they've had a good day. Don't ask what a good day means." } },
    stormpike = { { id = "xtp_sp", text = "Dwarves. They complain about the price and order seconds every time." } },
    _none = { { id = "tp_none", text = "No idea, but I'd sell it to you if I had it." } },
  },
}

-- Voggah Deathgrip: Frostwolf, by the Horde entrance to Alterac Valley.
P:NPC {
  key = "hb_voggah_deathgrip", id = TODO_NPC("Voggah Deathgrip"), name = "Voggah Deathgrip", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "tarren_mill" }, temper = { "gruff", "proud" }, values = { "honor", "loyal" },
  impression = {
    first = "Voggah Deathgrip stands at the mouth of the Alterac Valley road in Frostwolf furs, watching every newcomer with the measuring look of a clan elder.",
    third = "{name} met Voggah Deathgrip of the Frostwolf clan, who calls warriors to defend Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka, {class}. You come to the gates of Frostwolf country, and the Frostwolves will judge whether you belong." },
    { id = "g_orc", when = { race = "Orc" }, text = "Lok'tar, brother. Frostwolf blood or not, an orc is welcome at these gates." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Voggah Deathgrip of the Frostwolf clan. Drek'Thar sent me to stand at the gate and gather those willing to fight for our home." } },
      again = { { id = "h_again", text = "What else, warrior?" }, { id = "h_again2", text = "Speak plainly." } },
      choices = {
        { text = { normal = "Why do the Frostwolves need help?", polite = "How may I help the Frostwolves, elder?", blunt = "What's the trouble?" }, next = "help" },
        { text = "Tell me about Drek'Thar.", next = "drekthar" },
        { text = "I'm loyal to the Frostwolves.", next = "loyalty", when = { questActive = TODO_QUEST("Matters of Loyalty") } },
        { text = "The spirits are loud in these mountains.", next = "spirits", when = { class = "SHAMAN" } },
        { text = "I was born in an internment camp, not these hills.", next = "camps", when = { race = "Orc" } },
        { text = "I'll return when I'm ready.", next = "END" },
      },
    },
    help = {
      lines = { { id = "he_default", text = "The Stormpike dwarves dig in our valley, and they guard their diggings with a fortress. They want the iron and the relics; we want only our home back." } },
      choices = {
        { text = "Who are these Stormpike?", next = "stormpike" },
        { text = "What should I do first?", next = "first" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Prove yourself to the clan, and the clan will trust you with more. Bring what I ask, and fight in the valley, and your name will be known among us." } },
      choices = {
        { text = "I'll crush the Stormpike for you.", next = "BACK", reply = "Bold words. Back them with your axe.", fx = { align = { honor = -1 } } },
        { text = "I'll fight with honour, as Durotan did.", next = "BACK", reply = "You know our history. Good; that matters.", fx = { align = { honor = 1 } } },
      },
    },
    drekthar = {
      lines = { { id = "d_default", text = "Our elder shaman, blind and wise, who sheltered Thrall when he was a boy. Drek'Thar sees more with his spirit than most see with two eyes." } },
      choices = {
        { text = "Thrall came here as a runaway?", next = "thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loyalty = {
      lines = { { id = "l_default", text = "Then show it. Loyalty is spoken in deeds among the Frostwolves, and I will remember yours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stormpike = {
      lines = { { id = "sp_default", text = "Dwarves of Ironforge who call themselves an expedition and dig like they mean to stay. They raised Dun Baldar in our valley and they hunt our wolves for sport, and the clan will not forget either." } },
      choices = { { text = "Then they'll answer for it. Something else.", next = "BACK" } },
    },
    thrall = {
      narr = "Voggah touches the wolf-tooth hanging at his throat.",
      lines = { { id = "th_default", text = "He came through the snow half dead, a slave's boy with a human's manners, and Drek'Thar saw his father's blood in him. Durotan's son learned the old ways here before he ever led the Horde, and that is why this valley is sacred to us." } },
      choices = {
        { text = "Then it's worth any price to hold.", next = "BACK", reply = "Any price the clan can pay with honour, yes.", fx = { align = { honor = -1 } } },
        { text = "Then it must be held with honour.", next = "BACK", reply = "That is what Durotan would have said. Good.", fx = { align = { honor = 1 } } },
      },
    },
    spirits = {
      lines = { { id = "sh_default", text = "They are, shaman, because these peaks remember the old clan and the wolves who ran with it. Drek'Thar listens to them every night, and lately they speak of iron and digging." } },
      choices = { { text = "I'll listen too. Something else.", next = "BACK" } },
    },
    camps = {
      lines = { { id = "ca_default", text = "Many were, brother, and no shame in it, because the shame belongs to the humans who built the camps. Thrall freed you, and Thrall learned freedom here, so in a way you were born in Frostwolf country after all." } },
      choices = { { text = "Lok'tar. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask the clan, not me. I speak for the gate." } },
  },
}

-- Ravenholdt Assassin: near Ravenholdt Manor.
P:NPC {
  key = "hb_ravenholdt_assassin", id = TODO_NPC("Ravenholdt Assassin"), name = "Ravenholdt Assassin",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "ravenholdt" }, temper = { "cold", "quiet" }, values = { "loyal" },
  impression = {
    first = "The Ravenholdt assassin stands so still against the trees that you nearly walk past without noticing, which you suspect is the point.",
    third = "{name} met an assassin of Ravenholdt in the hills of Alterac.",
  },
  greetings = {
    { id = "g_default", text = "You walk loudly, {class}. Ravenholdt hears everything that comes up this road." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of us, or near enough. You may pass, but quietly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I guard the road to the manor. Lord Ravenholdt receives only those he chooses, and I decide whether he's chosen you." } },
      again = { { id = "h_again", text = "Speak quickly." } },
      choices = {
        { text = "Who is Lord Ravenholdt?", next = "xlord" },
        { text = "Why do you hunt the Syndicate?", next = "xsyndicate" },
        { text = "I'm a rogue. Does that earn me anything?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What is Ravenholdt?", next = "what" },
        { text = "What happens to uninvited guests?", next = "guests" },
        { text = "I'll turn back.", next = "END" },
      },
    },
    what = {
      lines = { { id = "w_default", text = "A house of the Assassins' League, who hunt the Syndicate and anyone else who dishonours the trade. More than that, you'd need to earn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guests = {
      lines = { { id = "guests_default", text = "They leave quickly, or they don't leave. Most choose the first option, and I recommend it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlord = {
      lines = {
        { id = "xl1", text = "A man who prefers his name be spoken softly, if at all. He built this house so that those who practise the quiet arts would answer to someone besides their own greed. You'll meet him if he wishes it, and you'll know that he wishes it because you'll be standing in his hall without remembering how you got there." },
      },
      choices = {
        { text = "That sounds like a threat.", next = "xthreat" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xthreat = {
      lines = {
        { id = "xt1", text = "It's a description. Ravenholdt does not threaten, because threats are noise, and noise is for amateurs and the Syndicate." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xsyndicate = {
      lines = {
        { id = "xs1", text = "The Syndicate were Alterac's nobles once, and when their kingdom was pulled down for treason they took up the knife and called it a cause. They kill for coin and cut throats in their sleep, and they give the trade a bad name." },
      },
      choices = {
        { text = "A knife is a knife. You're no better.", next = "xbetter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbetter = {
      lines = {
        { id = "xb1", text = "We choose our contracts, and we keep our word once given, and we do not murder farmers for their boots. Whether that makes us better is for priests to argue." },
      },
      choices = {
        { text = "A code is a code, even among killers. I respect it.", next = "BACK", reply = "Then perhaps you'll understand this house better than most.", fx = { align = { honor = 1 } } },
        { text = "Killing is killing. Your code is a pretty lie.", next = "BACK", reply = "Say that again inside the manor, and see who answers you.", fx = { align = { honor = -1 } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xr1", text = "It earns you a second look, and that's more than most get. Show the manor you can keep a secret and finish what you start, and the door may open, though not today." },
        { id = "xr2", when = { class = "ROGUE" }, text = "A trained one, too, by the way you stand. Who taught you to put your weight on the back foot like that?" },
      },
      choices = {
        { text = "Someone who'd rather I didn't say.", next = "BACK", reply = "Good answer. Keep giving it." },
      },
    },
  },
  topics = {
    syndicate = { { id = "xtp_sy", text = "Vermin in velvet. The manor will see them gone." } },
    alterac = { { id = "xtp_al", text = "A kingdom that sold itself to the Horde, and has been paying for it ever since." } },
    _none = { { id = "tp_none", text = "Not your concern, or mine." } },
  },
}

-- Stormpike Battleguard: the cave to the Alliance entrance of Alterac Valley.
P:NPC {
  key = "hb_stormpike_battleguard", id = TODO_NPC("Stormpike Battleguard"), name = "Stormpike Battleguard",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "southshore" }, temper = { "gruff", "loud" }, values = { "duty" },
  impression = {
    first = "The Stormpike battleguard blocks the cave mouth with a hammer on his shoulder and a beard full of frost.",
    third = "{name} met a Stormpike battleguard guarding the Alliance road into Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Halt there, {g:lad|lass}. This cave leads to Stormpike country, and nae one passes without the Stormpike's say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep this cave for Vanndar Stormpike. On the far side is the valley, Dun Baldar and the Frostwolves, and ye'll want a stout heart before ye go through." } },
      again = { { id = "h_again", text = "Aye? What else?" } },
      choices = {
        { text = "What's Dun Baldar like?", next = "xbaldar" },
        { text = "Have you fought the Frostwolves yourself?", next = "xfought" },
        { text = "I'm a dwarf too. I'd join you.", next = "xjoin", when = { race = "Dwarf" } },
        { text = "What are the Stormpike digging for?", next = "dig" },
        { text = "How bad are the Frostwolves?", next = "frostwolf" },
        { text = "I'll pass on.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "d_default", text = "Iron and old relics, the finest ye ever saw, and the Expedition means to have them. The orcs claim the valley, but we dwarves were digging these mountains long before they came." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    frostwolf = {
      lines = { { id = "f_default", text = "Tough as the mountain, I'll grant them that, and led by a blind shaman who sees too much. Ye'll not beat them by being careless, so keep yer wits about ye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbaldar = {
      lines = {
        { id = "xb1", text = "Dun Baldar is the Stormpike's fortress at the north end o' the valley, carved straight intae the mountain like a proper hold. Cold as a troll's heart, mind, but the ale's warm. Vanndar holds court there, an' his officers argue o'er maps all night while the rest of us freeze on the walls." },
      },
      choices = {
        { text = "Who are the Stormpike, exactly?", next = "xclan" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xclan = {
      lines = {
        { id = "xc1", text = "An expedition out o' Ironforge, sent tae dig an' to claim what's under these mountains. We're Bronzebeard's folk, though we've grown a wee bit independent out here, an' Vanndar likes it that way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfought = {
      lines = {
        { id = "xf1", text = "Aye, more times than I've had hot meals this winter. The Frostwolf orcs ride great white wolves an' they fight like they've nae fear o' dying, which I'll grudgingly respect. Their shaman, Drek'Thar, is blind as a stone, they say, an' sees more than any o' us." },
      },
      choices = {
        { text = "You respect them?", next = "xrespect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrespect = {
      lines = {
        { id = "xr1", text = "I respect any foe that stands his ground in the snow. Doesnae mean I won't take his mine." },
      },
      choices = {
        { text = "Respect them, then drive them out. That's war.", next = "BACK", reply = "Aye, that's the dwarven way, an' it's served us well.", fx = { align = { honor = -1 } } },
        { text = "If you respect them, you could share the valley.", next = "BACK", reply = "Share? Ye've a soft heart, {g:lad|lass}, an' Vanndar would laugh ye out o' the hall.", fx = { align = { honor = 1 } } },
      },
    },
    xjoin = {
      lines = {
        { id = "xj1", text = "Ha! That's the spirit, an' Ironforge blood besides. Speak tae the officers inside, an' bring a thick cloak, because the valley has teeth an' they're made o' ice." },
      },
      choices = {
        { text = "I'll come prepared.", next = "BACK" },
      },
    },
  },
  topics = {
    frostwolf = { { id = "xtp_fw", text = "Wolf-riders an' storm-callers. Tough as old boots, an' twice as smelly." } },
    ironforge = { { id = "xtp_if", text = "Home. I miss the forges an' the Stonefire Tavern, an' I'll see them again when the valley's ours." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask at Dun Baldar." } },
  },
}

-- Veteran Legionnaire: Frostwolf soldiers in the valley.
P:NPC {
  key = "hb_veteran_legionnaire", id = TODO_NPC("Veteran Legionnaire"), name = "Veteran Legionnaire",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "tarren_mill" }, temper = { "gruff", "steady" }, values = { "honor", "loyal" },
  impression = {
    first = "The veteran legionnaire wears Frostwolf red and has the scars of a dozen skirmishes in the valley, each one earned the hard way.",
    third = "{name} met a veteran Frostwolf legionnaire in the snows of Alterac.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka, {class}. The valley is cold, but the fighting keeps us warm." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I've fought the Stormpike since they first came into the valley. My blade has seen more dwarves than my mother has seen grandchildren." } },
      again = { { id = "h_again", text = "Something else, warrior?" } },
      choices = {
        { text = "Why do the Frostwolves fight for this valley?", next = "xwhy" },
        { text = "Tell me of Drek'Thar.", next = "xdrek" },
        { text = "I am Horde. Tell me how to help.", next = "xhelp", when = { faction = "Horde" } },
        { text = "I'm Alliance, and I'm just passing through.", next = "xally", when = { faction = "Alliance" } },
        { text = "What have you learned in all that fighting?", next = "learned" },
        { text = "Are the Frostwolves winning?", next = "winning" },
        { text = "Lok'tar.", next = "END" },
      },
    },
    learned = {
      lines = { { id = "l_default", text = "That dwarves are hard to kill and harder to frighten. Hit them low and fast, and never let them dig in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    winning = {
      lines = { { id = "w_default", text = "Some days, and some days the dwarves are. As long as the Frostwolves stand, the valley is ours, whoever holds the field that night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwhy = {
      lines = {
        { id = "xw1", text = "Because it is our home, {class}. When Gul'dan's madness tore through the clans, Durotan's father led the Frostwolves here in exile, and these mountains took us in when no one else would. Now the dwarves come with their picks and their banners, and they call it a claim. We call it a theft." },
      },
      choices = {
        { text = "The dwarves say they were here first.", next = "xfirst" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xfirst = {
      lines = {
        { id = "xf1", text = "Dwarves say that of every mountain in the world. Maybe some old dwarf dug a hole here once, but we bled into this snow and raised our children in it." },
      },
      choices = {
        { text = "Blood earns a claim. The valley is yours.", next = "BACK", reply = "Lok'tar! You speak like a Frostwolf.", fx = { align = { honor = 1 } } },
        { text = "The strongest side will hold it, whatever the claim.", next = "BACK", reply = "Then we will be stronger. It is that simple.", fx = { align = { honor = -1 } } },
      },
    },
    xdrek = {
      lines = {
        { id = "xd1", text = "Drek'Thar is our elder shaman, and he walked beside Durotan when the clan was young. His eyes are gone, but the spirits of the mountain speak to him, and he has never been wrong about a storm or a battle. He kept the clan together in exile and taught Thrall the ways of the elements, and every Frostwolf owes him that." },
      },
      choices = {
        { text = "Thrall learned from him?", next = "xthrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xthrall = {
      lines = {
        { id = "xt1", text = "When Thrall escaped the humans' camps, he came here and found his father's people. Drek'Thar knew him by the cloth he was wrapped in as a babe, and that is how the son of Durotan came home." },
      },
      choices = {
        { text = "A good story. Something else.", next = "BACK" },
      },
    },
    xhelp = {
      lines = {
        { id = "xh1", text = "Go into the valley and speak to the captains at Frostwolf Keep. Fight hard, kill the dwarves' officers, and never fight alone, because the Stormpike are clever with their towers." },
      },
      choices = {
        { text = "Lok'tar. Something else.", next = "BACK" },
      },
    },
    xally = {
      lines = {
        { id = "xa1", text = "Then pass quickly, and pray we do not meet in the snow. Here I will let you walk, because there is no honor in killing a traveller at a road." },
      },
      choices = {
        { text = "I'll keep walking.", next = "END" },
      },
    },
  },
  topics = {
    stormpike = { { id = "xtp_sp", text = "Dwarves with too many picks and too few manners." } },
    thrall = { { id = "xtp_th", text = "The son of Durotan. The Frostwolves gave him back to the Horde, and he gave the Horde back its freedom." } },
    _none = { { id = "tp_none", text = "Ask Drek'Thar. I only fight." } },
  },
}

-- Strange Snowman: outside Growless Cave at Winter Veil; a frozen Smokywood agent named Sacks.
P:NPC {
  key = "hb_strange_snowman", id = TODO_NPC("Strange Snowman"), name = "Strange Snowman",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "alterac" }, temper = { "anxious", "loud" }, values = { "ambitious" },
  impression = {
    first = "The snowman outside Growless Cave has a goblin's nose poking out of its face and is, quite unmistakably, muttering.",
    third = "{name} met a strange snowman in the Alterac Mountains, who turned out to be a goblin frozen in snow.",
  },
  greetings = {
    { id = "g_default", text = "Psst! Hey, pal, yeah, you, the one with legs that work! Don't scream, I'm not a snowman, I just play one in a crisis." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Name's Sacks, Smokywood Pastures, field agent. I came up here lookin' for a missin' shipment of Winter Veil treats, and somethin' big and green and grumpy buried me in a snowdrift." } },
      again = { { id = "h_again", text = "Quick, before my nose freezes off!" }, { id = "h_again2", text = "Talk faster, pal, I'm losin' feelin' in places." } },
      choices = {
        { text = { normal = "What buried you?", polite = "What buried you, if you don't mind me asking?", blunt = "What did this?" }, next = "greench" },
        { text = "What shipment?", next = "shipment" },
        { text = "I've dealt with the Greench.", next = "done", when = { questDone = TODO_QUEST("You're a Mean One...") } },
        { text = "That is the worst disguise I've ever seen.", next = "disguise", when = { class = "ROGUE" } },
        { text = "Dwarves don't hate dry kegs. We mourn them.", next = "keg", when = { race = "Dwarf" } },
        { text = "Good luck with that.", next = "END" },
      },
    },
    greench = {
      lines = { { id = "greench_default", text = "The Abominable Greench, a big ugly brute who hates Winter Veil more than a dwarf hates a dry keg. He lives up in Growless Cave with all the stolen treats, and he don't share." } },
      choices = {
        { text = "I'll handle the Greench.", next = "handle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    handle = {
      lines = { { id = "h2_default", text = "That's the spirit, buddy, and I'll owe ya one, which in goblin terms is a big deal. Bring back the treats, and Smokywood will make it worth your while." } },
      choices = {
        { text = "I'll do it for the holiday spirit.", next = "BACK", reply = "Aw, a sentimental type. Bless ya, pal.", fx = { align = { light = 1 } } },
        { text = "I'll do it for the reward.", next = "BACK", reply = "Now you're talkin' my language, friend.", fx = { align = { light = -1 } } },
      },
    },
    shipment = {
      lines = { { id = "s_default", text = "Cookies, cocoa, gift wrap, the works, all bound for Smokywood's stalls across the cities. The whole season's margin was in those crates, and I ain't goin' home without it." } },
      choices = {
        { text = "Who's Smokywood Pastures, then?", next = "smokywood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    done = {
      lines = { { id = "d_default", text = "You did? Sparks and sprockets, you're a hero! Now dig me out of here, 'cause I've been a snowman so long I'm startin' to like carrots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smokywood = {
      lines = { { id = "sm_default", text = "Only the finest seasonal goods outfit from here to Booty Bay, pal, sellin' to the Alliance and the Horde both, because cocoa don't care whose army you march in. Wulmort in Ironforge runs the show, and if I come back empty-handed he'll dock it from my wages till next Veil." } },
      choices = {
        { text = "Would he really dock a frozen goblin's pay?", next = "docked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    docked = {
      lines = { { id = "dk_default", text = "Would he? Buddy, he docked my cousin for the eyebrows he lost when a firework went off in the warehouse, on account of the eyebrows bein' company time. Lovely fella, Wulmort, but he reads the small print in his sleep." } },
      choices = { { text = "Then let's get you paid. Something else.", next = "BACK" } },
    },
    disguise = {
      lines = { { id = "di_default", text = "Hey, it fooled the Greench, didn't it, and he lives in a cave full of snow, so he's practically an expert. You sneaky types are hard to please, I'll tell ya that for free." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
    keg = {
      lines = { { id = "kg_default", text = "Mourn 'em, huh? Well, put that on the list of things the Greench'll answer for, pal, because I'm pretty sure he drank the whole crate of Winter Veil brew we had bound for Ironforge." } },
      choices = { { text = "Now it's personal. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, pal, I've been a snowman all week." } },
  },
}

-- Captain Armando Ossex: Stormpike Guard captain in the cave at the Alterac Valley entrance.
P:NPC {
  key = "hb_armando_ossex", id = 16392, name = "Captain Armando Ossex", gender = "male",
  role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "watchful", "proud" }, values = { "duty", "order" },
  notices = { "faction" },
  impression = {
    first = "A human captain in Stormpike colors, pacing the cave mouth like a man waiting for an order.",
    third = "{name} met Captain Armando Ossex of the Stormpike Guard at the gates of Alterac Valley.",
  },
  greetings = {
    { id = "g_default", text = "Halt and state your business. If it's the valley, Vanndar needs every blade he can get." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You're a long way from the Frostwolves' side, and I'd advise you to keep walking." },
  },
  notice = {
    { id = "n_dwarf", cat = "faction", when = { race = "Dwarf" },
      text = "A dwarf. The Stormpike will be glad of you; they say a human can't hold a line in the snow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Captain Armando Ossex, Stormpike Guard. I hold this cave so the Horde doesn't come through it, and so our reinforcements can." } },
      again = { { id = "h_again", text = "Something else, soldier?" } },
      choices = {
        { text = "Tell me about Vanndar Stormpike.", next = "xvann" },
        { text = "You don't look like you miss Southshore.", next = "xsouth" },
        { text = "I'm Horde, Captain. I'm only passing.", next = "xhorde", when = { faction = "Horde" } },
        { text = "What's happening in the valley?", next = "valley" },
        { text = "Why is a human with the Stormpike?", next = "human" },
        { text = "Carry on, Captain.", next = "END" },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "The Stormpike dig for iron and the Frostwolf orcs say the valley is theirs. Neither side will give an inch, and the snow is red enough to prove it." } },
      choices = {
        { text = "Has anyone tried a truce?", next = "truce" },
        { text = "Something else.", next = "BACK" },
      },
    },
    truce = {
      lines = { { id = "t_default", text = "Not that I've heard of. Vanndar wants the mines and Drek'Thar wants his home, and both are stubborn as mules." } },
      choices = {
        { text = "The orcs were there first. They have a claim.", next = "BACK", reply = "Maybe so, but my orders don't mention claims.", fx = { align = { honor = 1 } } },
        { text = "The Alliance needs that iron. Take it.", next = "BACK", reply = "That's how Vanndar sees it, and I serve Vanndar.", fx = { align = { honor = -1 } } },
      },
    },
    human = {
      lines = { { id = "h2_default", text = "The Stormpike pay well and fight hard, and I'd had enough of guarding Southshore against nothing. A soldier goes where there's a war." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    xvann = {
      lines = {
        { id = "xv1", text = "General Vanndar is a dwarf who has never lost an argument, mostly because he refuses to stop having it. He holds Dun Baldar like it's the gate of Ironforge itself. He's fair with his soldiers, I'll give him that, and he pays them the same whether they've a beard or not." },
      },
      choices = {
        { text = "What does he want with the valley?", next = "xwant" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xwant = {
      lines = {
        { id = "xw1", text = "Iron, he says, and the old relics under the mountain, and a valley to call the Stormpike's own. Between you and me, I think the Frostwolves insulted his grandfather and he's never forgotten it." },
      },
      choices = {
        { text = "A war over a grudge is still a war worth winning.", next = "BACK", reply = "Spoken like a Stormpike. Vanndar would buy you a drink.", fx = { align = { honor = -1 } } },
        { text = "Men shouldn't bleed in the snow for an old grudge.", next = "BACK", reply = "No, they shouldn't, and yet here we all are, bleeding.", fx = { align = { honor = 1 } } },
      },
    },
    xsouth = {
      lines = {
        { id = "xs1", text = "Southshore is a fine town if you like fish, damp, and Magistrate Maltory's speeches. I stood a gate there for six years and the worst I saw was a drunk fisherman. Then the Forsaken took Tarren Mill and suddenly the gate mattered, and I found I'd rather fight where the fighting's honest." },
      },
      choices = {
        { text = "Isn't Tarren Mill honest fighting?", next = "xmill" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmill = {
      lines = {
        { id = "xm1", text = "Tarren Mill is plague and poisoned wells and rotting men who used to be our neighbours. Here at least the enemy bleeds red and looks you in the eye before he swings." },
        { id = "xm2", when = { race = "Scourge" }, text = "You'll forgive me, but I'd rather not have one of you at my back. Nothing personal; I've buried too many friends who trusted the dead." },
      },
      choices = {
        { text = "I understand, Captain.", next = "BACK" },
      },
    },
    xhorde = {
      lines = {
        { id = "xh1", text = "Passing is fine, so long as you keep passing. Out in the valley I'd have to kill you, and here I'd only have to watch you, so let's keep it to watching." },
      },
      choices = {
        { text = "Fair terms. Something else.", next = "BACK" },
        { text = "Then I'll be on my way.", next = "END" },
      },
    },
  },
  topics = {
    frostwolf = { { id = "xtp_fw", text = "Drek'Thar's orcs. Old, stubborn, and they fight like the mountain itself is on their side." } },
    stormpike = { { id = "xtp_sp", text = "The Stormpike Guard pays a human the same as a dwarf, which is more than I can say for Southshore." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask in the valley." } },
  },
}

-- Hillsbrad Foreman: overseers of the miners at Azurelode Mine.
P:NPC {
  key = "hb_hillsbrad_foreman", id = 2503, name = "Hillsbrad Foreman", gender = "male",
  role = "worker", tier = "service",
  communities = { "hillsbrad" }, temper = { "harried", "gruff" }, values = { "work", "practical" },
  notices = { "faction" },
  impression = {
    first = "A soot-smeared foreman with a ledger under one arm and a pick under the other.",
    third = "{name} spoke with a Hillsbrad foreman at the Azurelode Mine.",
  },
  greetings = {
    { id = "g_default", text = "If you're not here to dig, you're in the way. Unless you're here to guard; then stand over there." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Forsaken! To arms, lads, the dead are at the mine again!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I run the crews at Azurelode. Copper and tin, mostly, and the odd vein of something better when the Light smiles." } },
      again = { { id = "h_again", text = "Make it quick; the lads slack off when I'm not looking." } },
      choices = {
        { text = "What do the miners say about all this?", next = "xmen" },
        { text = "The Forsaken took Tarren Mill. Why stay?", next = "xstay" },
        { text = "I know my way around a pick.", next = "xpick", when = { race = "Dwarf" } },
        { text = "Is the mine safe?", next = "safe" },
        { text = "How's the work going?", next = "work" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Not since the Forsaken took Tarren Mill. They raid us when they please, and the militia's stretched thin as it is." } },
      choices = {
        { text = "Then arm your miners and fight back.", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "They've picks, haven't they? Half of them fought in the Second War. But a miner's no soldier." } },
      choices = {
        { text = "Every man should defend his own home.", next = "BACK", reply = "Aye, and they will, if it comes to that.", fx = { align = { order = -1 } } },
        { text = "Southshore should send proper guards.", next = "BACK", reply = "Tell Magistrate Henry that. I've tried.", fx = { align = { order = 1 } } },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Slow. Every load of ore goes to Southshore, and Southshore sends us back half what it's worth. But a wage is a wage." } },
      choices = { { text = "That's the way of it. Something else.", next = "BACK" } },
    },
    xmen = {
      lines = {
        { id = "xm1", text = "They grumble, same as miners anywhere, but they grumble louder since the raids started. Two of my best lads went to Southshore to enlist and haven't come back to the seam. The rest dig with one eye on the tunnel mouth, which is no way to swing a pick and keep your toes." },
      },
      choices = {
        { text = "Has the militia sent anyone?", next = "xmil" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmil = {
      lines = {
        { id = "xmi1", text = "A sergeant came up from Hillsbrad Fields once, looked at the tunnels, and said he'd send men. That was last spring, and I've had a lot of time to admire the empty road since." },
      },
      choices = {
        { text = "The crown should protect its miners.", next = "BACK", reply = "Aye, and the crown should do a lot of things. Lordaeron's crown is in a grave now.", fx = { align = { order = 1 } } },
        { text = "Arm the miners yourselves and stop waiting.", next = "BACK", reply = "I've been thinking the same, and the lads would rather swing at a ghoul than wait for one.", fx = { align = { order = -1 } } },
      },
    },
    xstay = {
      lines = {
        { id = "xs1", text = "Because Southshore needs copper for arrowheads and tin for bronze, and nobody else is fool enough to dig it out. Somebody pays for the ore, and that somebody pays my men. And where would we go? Half of Lordaeron already went south, and Stormwind doesn't want more refugees cluttering its gates." },
      },
      choices = {
        { text = "You sound bitter about Stormwind.", next = "xstorm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstorm = {
      lines = {
        { id = "xst1", text = "Bitter? I'm a foreman, so I'm bitter by trade. Stormwind sent us soldiers in the last war and taxes after it, and the taxes arrived more reliably." },
      },
      choices = {
        { text = "That's fair. Something else.", next = "BACK" },
      },
    },
    xpick = {
      lines = {
        { id = "xp1", text = "A dwarf, offering to dig! I'd hire you on the spot if I had the silver, because your lot can follow a vein through solid granite. Mind the timbers in the east shaft, they're older than me." },
      },
      choices = {
        { text = "I'll keep it in mind.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "xtp_fs", text = "Dead men raiding a copper mine. If you'd told me that ten years ago I'd have called you drunk." } },
    southshore = { { id = "xtp_ss", text = "They buy our ore and complain about the price. That's Southshore all over." } },
    _none = { { id = "tp_none", text = "Ask in Southshore. I only know rocks." } },
  },
}
