-- Darkshire, the rest of the town: Elaine Carevin, the Nethergarde caravan's watchmaster, the
-- Scarlet Raven's barkeep, Madame Eva's granddaughter, a gnome merchant, a frightened
-- lodger and the stable master. Voice: bibles/darkshire_more.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "elaine", id = TODO_NPC("Elaine Carevin"), name = "Elaine Carevin",
  bible = "bibles/darkshire_more.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "steady" }, values = { "devout", "dutiful" },
  notices = { "light", "kit" },

  impression = {
    first = "Elaine Carevin keeps lists: who has been fed, who hasn't been seen, which empty house showed a light. She talks about the Light as something you walk under, not something you wait for.",
    third = "{name} met Elaine Carevin, who keeps the Carevin household's supplies moving and its questions asked.",
  },

  greetings = {
    { id = "g_default", text = "These are bad days for Duskwood, {class}, and they don't seem to end. Is there news from the road?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and in one piece. I'll cross you off the list of people I worry about, for today." },
    { id = "g_sven", when = { questActive = TODO_QUEST("Deliveries to Sven") }, text = "Sven's crate won't carry itself, and his people won't eat until it gets there." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Come in from the dark. The Watch's lamps only reach so far, and the woods know exactly how far." },
  },

  notice = {
    { id = "n_light", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "You carry the Light openly, and that's rarer here than it should be. Most of Darkshire prays with the shutters closed." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's half torn away. Morg Gnarltree will see to your armour before you go out again, and please do go to him first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Elaine Carevin. Jonathan hunts what comes out of the woods, and I keep track of everything else: who needs supplies, who hasn't been seen, and what's moving where it shouldn't." },
        { id = "h_raven_before", when = { questBefore = TODO_QUEST("Raven Hill") },
          text = "Calor swears something is haunting Raven Hill. Two nights he's seen shadows moving in the houses, and the night before that a light in a window, and nobody has lived there in years." },
        { id = "h_raven_active", tags = { "news" }, when = { questActive = TODO_QUEST("Raven Hill") },
          text = "Raven Hill is west, past the cemetery road. Go carefully, because whatever lights a lamp in a dead village either wants to be found or doesn't care who finds it." },
        { id = "h_raven_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Raven Hill"), days = 5 } },
          text = "Jitters? A living man, hiding in Raven Hill all this time? Light keep him, I'd have sent bread long ago if anyone had known." },
        { id = "h_sven_done", when = { questDone = TODO_QUEST("Deliveries to Sven") },
          text = "Sven sent word that the supplies came through. He doesn't say thank you, he says 'more', and from Sven that's the same thing." },
        { id = "h_stitches", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "I sent you up to that shack to ask after an old man's health. I keep thinking about that, and I haven't found a way to stop." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? I've a list, but it can wait a moment." },
        { id = "h_again2", text = "Go on. I'd rather hear it from you than from the woods." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then. Nobody sleeps much in this house anyway." },
      },
      choices = {
        { text = "What's happening at Raven Hill?", next = "raven" },
        { text = "Who is Sven Yorgen?", next = "sven" },
        { text = "You said someone hasn't been seen?", next = "hermit" },
        { text = "What does your family actually do?", next = "family" },
        { text = "You speak of walking under the Light.", next = "light", when = { class = "PRIEST" } },
        { text = "About the hermit you sent me to...", next = "hermit_after", when = { questDone = TODO_QUEST("Translation to Ello") } },
        { text = "I walk under the Light too, with a hammer.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I'll keep my eyes open.", next = "END", fx = { standing = { darkshire = 1 } } },
      },
    },

    raven = {
      lines = {
        { id = "r_default", fx = { learn = { "raven_hill" } },
          text = "It was a village once, west of here, with a cemetery that's grown bigger than the village ever was. Calor saw lights there, and Calor isn't a man who imagines things; he's a man who shoots at them." },
        { id = "r_done", when = { questDone = TODO_QUEST("Raven Hill") },
          text = "A man named Jitters, hiding among the graves and terrified of everything. I'm glad you were the one who went, and not Calor with a crossbow." },
      },
      choices = {
        { text = "Why not send the Night Watch?", next = "raven_watch" },
        { text = "I'll find out what's there.", next = "BACK", when = { questBefore = TODO_QUEST("Raven Hill") }, fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    raven_watch = {
      big = true,
      lines = {
        { id = "rw_default", text = "The Watch can barely hold the lamps in town, and Commander Ebonlocke won't spare a patrol for a light in a window. That's not cowardice, it's arithmetic, but somebody still has to go and look." },
      },
      choices = {
        { text = "The Commander's right. The town comes first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Arithmetic is how Raven Hill was left to rot.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sven = {
      lines = {
        { id = "s_default", fx = { learn = { "carevins" } },
          text = "Sven is as close to a saint as Duskwood has, though he'd hate the word. He and a handful of others camp at the forest's northwest edge, too few to send anyone back to town for food." },
        { id = "s_done", when = { questDone = TODO_QUEST("Deliveries to Sven") },
          text = "You've met him, then, so you know he's not one for company. He watches something out there that he won't name in a letter, and we keep him fed while he does it." },
      },
      choices = {
        { text = "Why does your family supply him?", next = "sven_why" },
        { text = "I'll carry his supplies.", next = "BACK", when = { questBefore = TODO_QUEST("Deliveries to Sven") }, fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sven_why = {
      lines = {
        { id = "sw_default", text = "Because he fights the same dark we do, from the other side of the forest. The Carevins don't ask a man to explain himself when he's standing between us and the dead." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hermit = {
      lines = {
        { id = "he_default", text = "An old man who lives in a shack overlooking the Raven Hill cemetery. He used to come into town for supplies every week or so, and I haven't seen him in a long while." },
        { id = "he_done", when = { questDone = TODO_QUEST("The Hermit") },
          text = "You found him well, you said, only too old for the road now. I'm relieved, though I can't think what an old man needs with so much from town." },
      },
      choices = {
        { text = "What sort of man is he?", next = "hermit_who" },
        { text = "I'll look in on him.", next = "BACK", when = { questBefore = TODO_QUEST("The Hermit") }, fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hermit_who = {
      lines = {
        { id = "hw_default", text = "Polite, a little odd, and always in a hurry to get home before dark, which in Duskwood is the only sensible thing about anyone. He paid in coin and asked after nobody." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hermit_after = {
      big = true,
      lines = {
        { id = "ha_default", text = "Abercrombie. I asked after him like he was somebody's grandfather, and all that time he was stitching the dead together up on that hill. How does anyone keep a list of who to worry about, after that?" },
      },
      choices = {
        { text = "You couldn't have known. Keep caring for people.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Trust less. Darkshire can't afford kindness to strangers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    family = {
      lines = {
        { id = "f_default", fx = { learn = { "carevins" } },
          text = "We fight the dark rather than only guarding against it. Jonathan leads, Calor and a few others hunt with him, and I make sure the hunters and the people who help us have what they need." },
      },
      choices = {
        { text = "The Night Watch doesn't approve?", next = "family_watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_watch = {
      lines = {
        { id = "fw_default", text = "The Watch thinks we're reckless, and we think the Watch is patient past the point of sense. We're both a little right, and we both know it, so we're polite in the square." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },

    light = {
      big = true,
      lines = {
        { id = "l_default", text = "I think the Light stays with those who carry it out the door, and leaves the rest to their prayers. Kneeling isn't walking, {class}; walking is carrying a crate to Sven's camp when the woods are full of wolves." },
      },
      choices = {
        { text = "The Light forsakes no one, Elaine.", next = "light_none", fx = { align = { light = 1 } } },
        { text = "You're right. Faith without deeds is hollow.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Then the Light is a hard master.", next = "BACK", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
    light_none = {
      lines = {
        { id = "ln_default", text = "I hope you're right, I truly do. Say it to the people in this town who've buried children, though, and see if they believe you." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { trait = { pious = 1 } } } },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Then walk it out to the Yorgen farm sometime, because the folk out there haven't seen a friendly face in a month. A hammer's welcome, but it's the walking that matters most." } },
      choices = {
        { text = "I'll walk it.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } },
        { text = "Who's out there?", next = "sven" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I keep the household's lists, so I hear a little of everything that moves in Duskwood. Ask, and I'll tell you what's written down." } },
    background = { { id = "tp_bg", text = "I'm a Carevin, and in this town that's answer enough; the rest of me is mostly lists." } },
    advice = { { id = "tp_ad", text = "If you see a light where nobody lives, tell someone before you go and look, and then go and look." } },
    raven_hill = { { id = "tp_raven", text = "Empty houses and a full cemetery, west of here. Nobody goes there who doesn't have to.", next = "raven" } },
    carevins = { { id = "tp_carevins", text = "We hunt evil instead of waiting for it, and we feed the people who help us. That's the whole creed." } },
    night_watch = { { id = "tp_watch", text = "Good people holding lamps. I'd never say a word against them, though Calor says plenty." } },
    _none = { { id = "tp_none", text = "That isn't on any list of mine, I'm afraid." } },
  },
}

P:NPC {
  key = "sorigal", id = TODO_NPC("Watchmaster Sorigal"), name = "Watchmaster Sorigal",
  bible = "bibles/darkshire_more.md", role = "soldier", tier = "quest",
  communities = { "darkshire" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "class", "travel" },

  impression = {
    first = "Watchmaster Sorigal counts the days a crate can survive the road to Nethergarde the way other men count prayers. He's sure the keep matters, and he's tired of losing wagons to prove it.",
    third = "{name} met Watchmaster Sorigal, who sends Darkshire's supply caravans down the long road to Nethergarde Keep.",
  },

  greetings = {
    { id = "g_default", text = "If you're here about the caravan, it's late. If you're not, it's still late." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good. People I've met twice are worth more to me than wagons." },
    { id = "g_crate", when = { questActive = TODO_QUEST("Supplies for Nethergarde") }, text = "Why are you still here? Those stones are losing their charge while we talk!" },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you'll understand why the Nethergarde lot scream for powerstones the way soldiers scream for bread." },
    { id = "n_travel", cat = "travel", when = { visited = "Nethergarde Keep" },
      text = "You've been down to Nethergarde. Then you've seen the road, and you know why I don't sleep." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Watchmaster Sorigal. Every crate bound for Nethergarde Keep passes through my hands in Darkshire, and too many of them never reach Lungertz at the other end." },
        { id = "h_vital", tags = { "news" }, when = { questActive = TODO_QUEST("Vital Supplies") },
          text = "A letter from Andromath, is it? Then you're the one I've been waiting for, and I've a job that won't keep." },
        { id = "h_crate_active", tags = { "news" }, when = { questActive = TODO_QUEST("Supplies for Nethergarde") },
          text = "East through Deadwind Pass, east again through the Swamp of Sorrows, then south into the Blasted Lands. Don't stop to admire anything, because nothing on that road deserves it." },
        { id = "h_crate_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Supplies for Nethergarde"), days = 7 } },
          text = "Word came back from Lungertz: the stones arrived with their charge still in them. I've marked it in the ledger in red, which I save for miracles." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "No caravans leave after dark, so at night I sit with the ledgers and work out which of the day's wagons I'll be writing off." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly; there's a wagon with a broken axle out front." },
        { id = "h_again2", text = "Go on, I'm listening. I can listen and count crates." },
      },
      choices = {
        { text = "What's so urgent about this crate?", next = "crate" },
        { text = "What's the road to Nethergarde like?", next = "road" },
        { text = "Why does Darkshire supply Nethergarde?", next = "why" },
        { text = "Do you answer to the Night Watch?", next = "watch" },
        { text = "I've walked that road. It's worse than you say.", next = "veteran", when = { questDone = TODO_QUEST("Supplies for Nethergarde") } },
        { text = "Nethergarde's mages. What do they need so badly?", next = "mage", when = { class = "MAGE" } },
        { text = "Safe roads, Watchmaster.", next = "END" },
      },
    },

    crate = {
      lines = {
        { id = "c_default", fx = { learn = { "nethergarde" } },
          text = "Powerstones, for the mages at Nethergarde. They won't hold their power for long, so they can't wait for the next caravan; somebody quick has to run them down there alone." },
      },
      choices = {
        { text = "What do the mages use them for?", next = "crate_mages" },
        { text = "And if they go dark on the way?", next = "crate_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate_mages = {
      lines = {
        { id = "cm_default", text = "Their research on the Dark Portal, and keeping their wards up while they do it; that's what Andromath's letters say, at least. I don't ask further, because the answer usually comes with a longer list." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_portal" } } } },
    },
    crate_fail = {
      lines = {
        { id = "cf_default", text = "Then you've carried a box of very expensive rocks through three of the worst places in the kingdom. So don't let them go dark, {class}." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    road = {
      lines = {
        { id = "r_default", text = "Deadwind Pass first, which is cold, quiet and wrong in a way nobody can put a name to. Then the Swamp of Sorrows, then the Blasted Lands, where the ogres treat a wagon as a meal with handles." },
      },
      choices = {
        { text = "Wrong how, in Deadwind?", next = "road_deadwind" },
        { text = "How many wagons do you lose?", next = "road_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_deadwind = {
      lines = {
        { id = "rd_default", text = "The horses won't look at the tower, and the drivers won't talk about it. I tell them to keep their eyes on the road, and most of them manage." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    road_lost = {
      lines = {
        { id = "rl_default", text = "More than Stormwind wants to hear about. The swamp swallows some, the ogres take some, and some just stop sending word, which is the kind I hate most." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because Darkshire's the last friendly town before the road goes bad. Stormwind sends the goods this far, and from here it's my caravans or nothing, even with Duskwood starving for soldiers of its own." },
      },
      choices = {
        { text = "Nethergarde watches the Portal. It has to come first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Darkshire's own people should come before a distant keep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Does the town resent it?", next = "why_town" },
      },
    },
    why_town = {
      lines = {
        { id = "wt_default", text = "Councilman Millstipe certainly does, loudly and in writing. Most folk just watch the wagons leave full and wish one would stop here instead." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    watch = {
      lines = {
        { id = "wa_default", text = "No, I answer to the caravan and to Nethergarde's quartermaster. The Watch lends me a pike or two when it can spare one, and it never can, so I hire guards and pray they're sober." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },

    veteran = {
      lines = {
        { id = "v_default", text = "Then you're one of very few who can tell me so to my face. Sit a moment and tell me where it went worst, so I can tell the next fool which stretch to run." },
      },
      choices = {
        { text = "The swamp. Don't let them stop there.", next = "BACK", fx = { affinity = 2 } },
        { text = "Everywhere. Pay your drivers more.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
      },
    },
    mage = {
      lines = { { id = "ma_default", text = "You'd know better than me, since you're one of them, more or less. They watch the Dark Portal day and night, and from what the drivers tell me, they burn through reagents like a forge burns coal." } },
      choices = {
        { text = "Then the crate matters. I'll see it there.", next = "crate_mages", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ledgers and roads are what I know, and a good deal about what the road does to both. Pick something." } },
    background = { { id = "tp_bg", text = "A soldier who learned to count, which in the army means they give you wagons instead of a sword." } },
    advice = { { id = "tp_ad", text = "Never stop on the road to Nethergarde; anything that waves you down is either dying or hungry." } },
    nethergarde = { { id = "tp_nethergarde", text = "A keep full of mages at the end of the worst road in the kingdom, and every one of them wants something yesterday.", next = "crate" } },
    dark_portal = { { id = "tp_portal", text = "I've never seen it and I never mean to. I send it powerstones, and that's as close as I like to get." } },
    _none = { { id = "tp_none", text = "That's not something I keep a ledger on. Ask me about crates and wagons instead." } },
  },
}

P:NPC {
  key = "hann", id = TODO_NPC("Barkeep Hann"), name = "Barkeep Hann",
  bible = "bibles/darkshire_more.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "shrewd" }, values = { "practical", "cheerful" },
  notices = { "drink", "class" },

  impression = {
    first = "Barkeep Hann leans across the bar to whisper about his moonshine as if the Night Watch might arrest us both. I suspect half the thrill of the stuff is the whispering.",
    third = "{name} met Barkeep Hann, who serves drinks at Darkshire's Scarlet Raven Tavern and keeps a jug of moonshine under the counter.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, and have something to drink, friend. Darkshire's grim enough without dry throats." },
    { id = "g_psst", text = "Lean in a moment. There's a new jug under the counter, if you take my meaning." },
    { id = "g_back", when = { metBefore = true }, text = "There's a face I remember! That's either a compliment to you or a warning about my memory." },
    { id = "g_dry", when = { questActive = TODO_QUEST("Dry Times") }, text = "Daniels sent you from Lakeshire, didn't he? I can smell a barkeep's errand a mile off." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Someone's been enjoying themselves already! Sit before you fall, and then we'll talk about another." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest at my bar! Don't worry, I won't tell the Cathedral, and the moonshine certainly won't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hann's the name, and drink's the trade. Milk, juice, spring water for the careful folk, and for everyone else, there's the jug under the counter." },
        { id = "h_dry_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dry Times") },
          text = "A bottle of moonshine for Lakeshire, is it? Daniels has good taste and a long road between him and his order, so pay up and I'll wrap it in a rag so it won't clink." },
        { id = "h_dry_done", when = { questDone = TODO_QUEST("Dry Times") },
          text = "I hear my moonshine's sitting on a shelf in Lakeshire now. That's the furthest a bottle of mine has travelled, and I've half a mind to feel proud." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask them over the bar; I don't leave it after dark." },
        { id = "h_again2", text = "Go on. A barkeep's half ears, after all." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What's in this moonshine?", next = "moonshine" },
        { text = "Who drinks here, mostly?", next = "regulars" },
        { text = "Does Darkshire need more drink, or less?", next = "drink" },
        { text = "Should a priest be buying moonshine?", next = "priest", when = { class = "PRIEST" } },
        { text = "Not tonight.", next = "END" },
      },
    },

    moonshine = {
      lines = {
        { id = "m_default", text = "Corn, patience and a secret I'll take to my grave, which in Duskwood isn't the promise it is elsewhere. It burns going down, and then it stops burning, and then you stop worrying about the worgen." },
      },
      choices = {
        { text = "Where does it come from?", next = "moonshine_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonshine_where = {
      lines = {
        { id = "mw_default", text = "From a friend of a friend, who'd be very cross if I said more. Let's say it doesn't come from Stormwind, and Stormwind doesn't ask." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    regulars = {
      lines = {
        { id = "r_default", text = "Watchers coming off shift, mostly, and they drink like men trying to forget the last eight hours. Smitts tells his stories at the other end, and I keep the cups full so nobody notices he's told them before." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },

    drink = {
      big = true,
      lines = {
        { id = "d_default", text = "There's a question! A watcher with a cup in him sleeps through the howling, and a watcher who sleeps is a better watcher, so I call my moonshine a public service." },
      },
      choices = {
        { text = "A drunk watcher gets people killed.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Let them drink. They've earned it.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "p_default", text = "Should a priest be buying anything? I won't tell you yes, because I'd only be selling, but I've watched your sort sit with the dying all night, and I've never once begrudged one of you a cup after." },
      },
      choices = {
        { text = "Then pour me a small one.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "I'll pass, but thank you.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A barkeep hears everything twice: once sober and once with the details improved. Ask me something." } },
    background = { { id = "tp_bg", text = "I pour drinks at the Raven, and that's as much of my story as you'll get without buying something." } },
    advice = { { id = "tp_ad", text = "Never drink moonshine on an empty stomach, and never walk home through the woods after drinking it on a full one." } },
    worgen = { { id = "tp_worgen", text = "They've never once come in for a drink, which is the only good thing I can say about them." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend, but I could pour." } },
  },
}

P:NPC {
  key = "alyssa", id = TODO_NPC("Alyssa Eva"), name = "Alyssa Eva",
  bible = "bibles/darkshire_more.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "warm" }, values = { "practical", "loyal" },
  notices = { "class", "arcane" },

  impression = {
    first = "Alyssa Eva sells reagents a few steps from her grandmother's cards and plainly loves the old woman, though she rolls her eyes at every warning. She thinks fate is mostly a matter of good locks.",
    third = "{name} met Alyssa Eva, Madame Eva's granddaughter, who sells reagents in Darkshire.",
  },

  greetings = {
    { id = "g_default", text = "Reagents, powders, candles and seeds. If it's for a spell, I've likely got it, and if it's for a curse, ask my grandmother." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good, because the candles don't buy themselves, and Grandmother keeps telling me business will pick up." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", minLevel = 48 },
      text = "A priest of your standing goes through holy candles like bread. I keep a box of them aside for exactly your sort." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "Arcane powder, I'd guess, and runes if you're tired of walking. Mages always look faintly impatient, as if the shop's taking too long." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Alyssa, and yes, Madame Eva is my grandmother. She reads the cards and I sell the candles, and between us we keep half of Darkshire's spellcasters in business." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Grandmother's been odd all week, telling me to stay indoors and asking where I've been. If she's put you on one of her errands, please tell me it isn't about me." },
        { id = "h_stalvan_done", when = { questDone = TODO_QUEST("The Legend of Stalvan") },
          text = "Grandmother's stopped telling me to stay indoors. She won't say why, but she looks at me as if I'd survived something, and I'd quite like to know what." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm only counting candles, and they're not going anywhere." },
        { id = "h_again2", text = "Ask away. It's quiet, and quiet in Darkshire makes me nervous." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What's it like, being Madame Eva's granddaughter?", next = "eva" },
        { text = "Do you believe in her cards?", next = "cards" },
        { text = "Who buys reagents in a town like this?", next = "trade" },
        { text = "Was her errand about you?", next = "errand", when = { questDone = TODO_QUEST("The Legend of Stalvan") } },
        { text = "Good day, Alyssa.", next = "END" },
      },
    },

    eva = {
      lines = {
        { id = "e_default", text = "Loud, and a little frightening, and the best person I know. She tells me to stay in after dark and away from strangers, and I tell her that's every girl in Darkshire's whole life already." },
      },
      choices = {
        { text = "She worries because she loves you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cards = {
      big = true,
      lines = {
        { id = "c_default", text = "I believe she sees something, and I believe she's very good at telling people what they already fear. I'd rather trust a good lock and a lamp than a card, but I'd never say so in front of her." },
      },
      choices = {
        { text = "Fate is real. Heed her.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Make your own fate. Locks and lamps.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "What does she see for you?", next = "cards_you" },
      },
    },
    cards_you = {
      lines = {
        { id = "cy_default", text = "She won't read for me, not since I was small. She says family's too close to see properly, which is either very wise or a very good excuse." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trade = {
      lines = {
        { id = "t_default", text = "Priests buying candles to pray over the Watch, mages buying powder, druids after their seeds, and the odd nervous farmer buying anything that sounds holy. Grandmother sends me the ones with the worst cards, and they buy the most." },
      },
      choices = {
        { text = "Do your candles work against the dead?", next = "trade_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_dead = {
      lines = {
        { id = "td_default", text = "A candle is a candle; it's the prayer that matters, so I'm told. Still, I've never seen a ghoul walk toward a lit window, so I sell them with a clear conscience." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    errand = {
      lines = {
        { id = "er_default", text = "You're not going to tell me, are you? Then don't. If she sent someone to make me safe, I'll just say thank you and buy her something nice." },
      },
      choices = {
        { text = "It's done. You're safe.", next = "BACK", fx = { affinity = 2 } },
        { text = "Ask her yourself, someday.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know reagents, and I know my grandmother, which some days is the harder of the two. What did you want?" } },
    background = { { id = "tp_bg", text = "I'm Madame Eva's granddaughter, and in Darkshire that's how everyone introduces me before I can." } },
    advice = { { id = "tp_ad", text = "Buy your candles before you need them; nobody wants to be shopping when the lamps go out." } },
    stalvan = { { id = "tp_stalvan", text = "That name makes Grandmother go quiet, and nothing makes Grandmother go quiet." } },
    _none = { { id = "tp_none", text = "That's one for Grandmother, I'm afraid; ask her and bring coin." } },
  },
}

P:NPC {
  key = "herble", id = TODO_NPC("Herble Baubbletump"), name = "Herble Baubbletump",
  bible = "bibles/darkshire_more.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "chatty" }, values = { "curious", "proud" },
  notices = { "craft", "race" },

  impression = {
    first = "Herble Baubbletump sells engineering parts out of a cramped house on the hill and gives his opinions away for nothing. A gnome in Darkshire, he says, is just an exile who found somewhere darker.",
    third = "{name} met Herble Baubbletump, a gnome who sells engineering and mining supplies on the hill road in Darkshire.",
  },

  greetings = {
    { id = "g_default", text = "Tubes, flux, blasting powder, coal! Mind the shelf, it bites. Well, it falls, which is nearly the same." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning customer! I'll note it down; it's a rare species in these woods." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "One of us! You don't see many of us this far south, not since the city. Come in, come in, and tell me who you were apprenticed to." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! I can tell by the scorch marks. You'll want the bronze tubes, and so does everyone, so be quick about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Herble Baubbletump, purveyor of engineering and mining supplies to the gloomiest town south of the mountains. Finbus teaches the craft down the hall, and I sell the bits he's always running short of." },
        { id = "h_stars", when = { questActive = TODO_QUEST("Look To The Stars") },
          text = "You're after a bronze tube for that stargazer, Viktori? I've a couple left, though they're dear, and I'll give you my opinion of his telescope free of charge." },
      },
      again = {
        { id = "h_again", text = "What else? I've three conversations going in my head already, so one more won't hurt." },
        { id = "h_again2", text = "Ask, ask! Half my mind is on the stars tonight, but the other half is yours." },
      },
      choices = {
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "What's a gnome doing in Darkshire?", next = "why" },
        { text = "What do you think of Viktori's telescope?", next = "viktori" },
        { text = "Do you miss Gnomeregan?", next = "gnomeregan" },
        { text = "I mine. What sells here?", next = "mining", when = { profession = "Mining" } },
        { text = "Mind the shelf. Goodbye.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Well, the city fell, so we all had to be somewhere, and Ironforge was full of cousins. Darkshire has metal on the hills, engineers who need parts, and fog thick enough that nobody notices when something explodes." },
      },
      choices = {
        { text = "Does something often explode?", next = "why_boom" },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    why_boom = {
      lines = {
        { id = "wb_default", text = "Only when Finbus is teaching. The townsfolk thought it was the worgen at first, and now they just shout 'gnomes!' and go back to sleep." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    viktori = {
      lines = {
        { id = "v_default", text = "Lovely fellow, terrible optics. He wants to look at the stars through the thickest fog in the kingdom, and I keep telling him that a tube can't see through weather, but he buys the tubes anyway, so I've stopped telling him." },
      },
      choices = {
        { text = "That's a little dishonest.", next = "viktori_honest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    viktori_honest = {
      lines = {
        { id = "vh_default", text = "Dishonest? I told him six times! At some point a merchant has to accept that a man wants a tube, and sell him a good one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gnomeregan = {
      big = true,
      lines = {
        { id = "gn_default", fx = { learn = { "gnomeregan" } },
          text = "Every day, and every day I build something that would have been easier in my old workshop. Some say we'll take the city back soon, and some say we should build somewhere new and stop looking over our shoulders." },
      },
      choices = {
        { text = "Gnomeregan should be retaken. It's your home.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Build anew. Old homes become graves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you think?", next = "gnomeregan_you" },
      },
    },
    gnomeregan_you = {
      lines = {
        { id = "gy_default", text = "I think I'm a merchant in Darkshire who still keeps his old workshop key on a string. Make of that what you like; I try not to." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mining = {
      lines = {
        { id = "mi_default", text = "Coal's always welcome, and copper and tin for the bronze, because nobody bothers to dig on these hills now that the dead walk them. Bring me ore and I'll not cry about the price." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know gears, ore and every rumour that comes through a gnome's front door, which is all of them. Which shall it be?" } },
    background = { { id = "tp_bg", text = "Gnomeregan born, Ironforge displaced, Darkshire settled, and none of them asked me first." } },
    advice = { { id = "tp_ad", text = "Never trust a bronze tube that rattles, or a gnome who says something's perfectly safe." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "My city, my workshop, my favourite chair, and all of it under the mountain with that traitor's mess.", next = "gnomeregan" } },
    _none = { { id = "tp_none", text = "Fascinating question, and I know nothing whatsoever about it." } },
  },
}

P:NPC {
  key = "farrin", id = TODO_NPC("Farrin Daris"), name = "Farrin Daris",
  bible = "bibles/darkshire_more.md", role = "citizen", tier = "service",
  communities = { "darkshire" }, temper = { "anxious" }, values = { "loving", "cautious" },
  notices = { "soldier", "weary" },

  impression = {
    first = "Farrin Daris paces between his room at the Scarlet Raven and the table outside, asking why Stormwind's guards haven't come. He can't visit his father's grave anymore, and it's eating him alive.",
    third = "{name} met Farrin Daris, a worried Darkshire lodger who can no longer visit his father's grave.",
  },

  greetings = {
    { id = "g_default", text = "Has anyone come yet, anyone at all? The dead walk the roads, and still nobody lifts a finger to stop them." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. I don't suppose you've brought any news, because nobody ever does." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Don't stand near the window. Something bad is on its way here, I can feel it, and I'd rather it didn't see us." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { tabard = true },
      text = "You're wearing colours! Are you from Stormwind, and has the king finally sent soldiers, or is it only you?" },
    { id = "n_weary", cat = "weary", when = { deathsHere = { min = 1 } },
      text = "You've been out there and come back looking worse. That's what happens, and that's why I stay in." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Farrin Daris. I've a room here at the Raven, and I walk from it to this table and back, because there's nowhere else in Darkshire a man can safely walk anymore." },
        { id = "h_watch_done", when = { questDone = TODO_QUEST("The Night Watch") },
          text = "They say someone cleared the cemetery for the Watch. I thought about going to see my father, and then I didn't, but I thought about it, which is more than last month." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm not going anywhere, and I never am these days." },
        { id = "h_again2", text = "Go on, I'd welcome the distraction." },
      },
      choices = {
        { text = "Why can't you go out?", next = "grave" },
        { text = "Why haven't Stormwind's guards come?", next = "guards" },
        { text = "What do you think is coming?", next = "dark" },
        { text = "I could walk you to the cemetery.", next = "escort", when = { minLevel = 25 } },
        { text = "Take care of yourself, Farrin.", next = "END" },
      },
    },

    grave = {
      lines = {
        { id = "gr_default", text = "My father's buried out past the town, and I used to visit him every week with a cloth for the stone. Now I can't go near him without the dead walking about the place like they own it." },
      },
      choices = {
        { text = "Has his grave been disturbed?", next = "grave_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grave_fear = {
      lines = {
        { id = "gf_default", text = "I don't know, and that's the worst of it. I lie awake wondering whether he's still in it, and then I'm ashamed of wondering." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    guards = {
      big = true,
      lines = {
        { id = "gu_default", text = "That's what I keep asking, and nobody answers. We pay our taxes to Stormwind like anyone else, and all we get is the Night Watch, which is our own people with lamps." },
      },
      choices = {
        { text = "Stormwind will come. Keep faith in the crown.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stormwind's forgotten you. Darkshire must save itself.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Have you written to anyone?", next = "guards_letters" },
      },
    },
    guards_letters = {
      lines = {
        { id = "gl_default", text = "Lord Ebonlocke's written more letters than I have, and he's the mayor. If they won't answer him, they won't answer a man who paces." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dark = {
      lines = {
        { id = "d_default", text = "I don't know, only that something is. It feels as if the Light has turned its face from Darkshire, and when the Light leaves a place, something else always moves in." },
      },
      choices = {
        { text = "The Light hasn't left. I'm here.", next = "BACK", when = { class = { "PRIEST", "PALADIN" } }, fx = { affinity = 2, standing = { darkshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    escort = {
      lines = {
        { id = "e_default", text = "Would you? ...No. No, I'd only get you killed and myself as well, and then there'd be two of us out there who'd never been visited. Thank you, though; I won't forget you asked." },
      },
      choices = { { text = "The offer stands.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I only know what people say at the next table, and they mostly say frightening things. Ask, if you like." } },
    background = { { id = "tp_bg", text = "I'm a man with a room at an inn and a father in the ground, and I can't get to him." } },
    advice = { { id = "tp_ad", text = "Stay in after dark, and if you hear the bells, stay in longer." } },
    night_watch = { { id = "tp_watch", text = "Good people, every one, but they're not soldiers, and the things out there know it." } },
    _none = { { id = "tp_none", text = "I wouldn't know. I don't go out much, not anymore." } },
  },
}

P:NPC {
  key = "steven_black", id = TODO_NPC("Steven Black"), name = "Steven Black",
  bible = "bibles/darkshire_more.md", role = "stablemaster", tier = "service",
  communities = { "darkshire" }, temper = { "calm" }, values = { "practical", "gentle" },
  notices = { "pet", "animal" },

  impression = {
    first = "Steven Black keeps the beasts of Darkshire's travellers fed, calm and well away from the treeline. Animals settle when he speaks, and I suspect that's the only reason he does.",
    third = "{name} met Steven Black, Darkshire's stable master, who keeps travellers' animals safe from the woods.",
  },

  greetings = {
    { id = "g_default", text = "Easy, easy. Not you; the horse. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for your companion? They ate well, and slept badly, like everyone here." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} keeps looking at the trees. Good instincts; I'd trust them over most people's in this town." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Steven Black, stable master. I keep your animals behind a stout fence and well away from the trees, which is more than I can do for the people." },
      },
      again = {
        { id = "h_again", text = "Anything else? The feed won't fork itself." },
      },
      choices = {
        { text = "I need the stables.", next = "BUSINESS" },
        { text = "How do the animals take Duskwood?", next = "beasts" },
        { text = "Do you hear the wolves at night?", next = "wolves" },
        { text = "Who else leaves animals with you?", next = "customers" },
        { text = "Can {pet} stay with you while I'm in the woods?", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Good day.", next = "END" },
      },
    },

    beasts = {
      lines = {
        { id = "b_default", text = "Badly. Horses won't settle in the fog, and a hunter's cat will pace the pen all night with its ears back. I sit up with the worst of them and talk until they stop shaking." },
      },
      choices = {
        { text = "What do you talk about?", next = "beasts_talk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_talk = {
      lines = {
        { id = "bt_default", text = "Nothing at all, just the sound of it, steady and low. It works on beasts, and on me, if I'm honest." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    customers = {
      lines = {
        { id = "c_default", text = "Hunters passing through, mostly, and the odd caravan driver of Sorigal's who won't take a good horse past Deadwind Pass. I don't blame him; the horses come back from that road with white round their eyes." },
      },
      choices = {
        { text = "Do the horses ever refuse the road?", next = "customers_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_refuse = {
      lines = {
        { id = "cr_default", text = "Every one of them, at the edge of the pass, and they have to be led on foot. I've never once seen a horse wrong about a road, so I'd take it as advice." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wolves = {
      big = true,
      lines = {
        { id = "w_default", text = "Every night, and some of them aren't wolves. A hunter came through last month and said he'd shoot every beast in the woods if they paid him, and I didn't know whether to cheer or weep." },
      },
      choices = {
        { text = "Some beasts must die so the town can live.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The wolves aren't to blame. Something's twisting them.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "I'll keep {pet} if you ask, and gladly, though it's been watching the treeline since you walked in. Out there a beast like that will warn you sooner than any lamp, so think twice before you leave it behind." } },
      choices = {
        { text = "Good advice. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let me see the stables.", next = "BUSINESS" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know beasts, mostly, and a little of what frightens them, which is most things here. What is it?" } },
    background = { { id = "tp_bg", text = "I keep the stables, and the stables keep me; there's not much more to it than that." } },
    advice = { { id = "tp_ad", text = "If your animal won't go down a road, don't make it. They know things." } },
    worgen = { { id = "tp_worgen", text = "The horses smell them before the Watch sees them. I've learned to watch the horses." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask me about hooves, if you like." } },
  },
}
