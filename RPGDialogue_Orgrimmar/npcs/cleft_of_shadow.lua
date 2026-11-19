-- The Cleft of Shadow: the rogues' master, a warlock trainer, the demon trainer,
-- and the two merchants who sell poison and reagents beside Ragefire Chasm.
-- Voices: bibles/<key>.md for each. Zevrost and Neeru are in their own files.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Shenthul: the rogue trainer who watches the whole Cleft.
---------------------------------------------------------------------------
P:NPC {
  key = "shenthul", id = TODO_NPC("Shenthul"), name = "Shenthul", title = "Rogue Trainer",
  bible = "bibles/shenthul.md", role = "trainer", tier = "quest",
  communities = { "orgrimmar" }, temper = { "sharp", "smooth" }, values = { "cunning", "loyal" },
  notices = { "stealth", "class" },
  impression = {
    first = "The soft, friendly voice somehow makes it more unsettling.",
    third = "{name} met Shenthul, the rogue trainer who watches over the Cleft of Shadow in Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Come in out of the light, {class}. Nobody in the Cleft likes being looked at too closely, not even the orcs who built it." },
    { id = "g_back", when = { metBefore = true }, text = "You found your way back down here, and without a guide this time. I'm almost proud of you." },
    { id = "g_stealth", when = { stealthed = true }, text = "I can hear you breathing, you know. Come out and talk properly." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear someone in the city caught you in a lie, which is careless. A good lie is never caught, only forgotten." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true }, place = "before",
      text = "Your left boot squeaks when you step on it, and I heard you coming from the top of the ramp. Fix that before you try it on anyone who matters." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior in the Cleft, clanking like a pot cart. Don't worry, nobody here will stab you unless you ask for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Shenthul, and I train those who work in the shadows for the Horde. Not every war is fought with banners and war drums, and the Warchief knows that better than the grunts who shout Lok'tar in his name." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Shenthul, and you're one of mine, by the look of your boots and the way you watched the exits when you came in. Good habits, so keep them." },
        { id = "h_rfc", when = { questActive = TODO_QUEST("Hidden Enemies") }, text = "Shenthul, and you've been asking about Ragefire, I hear. The Warchief has good reason to worry about what's festering down there, so keep your blade close when you go." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I have all the time in the world, and none to waste." },
        { id = "h_again2", text = "Go on. Nobody's listening, I've made sure of it." },
      },
      choices = {
        { text = "What do rogues do for the Horde?", next = "work" },
        { text = "Tell me about the Cleft of Shadow.", next = "cleft" },
        { text = "I'd guess the Warchief doesn't trust your kind.", next = "trust" },
        { text = "I'm ready for my next lesson.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What would you have of a Forsaken rogue?", next = "forsaken", when = { race = "Scourge", class = "ROGUE" } },
        { text = "Farewell, Shenthul.", next = "END" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "We listen at doors in Theramore, we count the soldiers on the walls of Southshore, and now and then we make sure a Kolkar raid leader doesn't wake up. The grunts win the battles, but we choose which battles they fight." } },
      choices = {
        { text = "Choosing a man's death in his sleep is cowardly.", next = "work_honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_honor = {
      big = true,
      lines = { { id = "wh_default", text = "Is it? One knife in the dark saves a hundred grunts from dying on a pike wall, and I've never met a grunt who'd rather die honorably than live. Grezz Ragefist, who trains the warriors, disagrees with me loudly, but Grezz has never seen what we prevent." } },
      choices = {
        { text = "A hundred lives saved is worth any shame.", next = "BACK", reply = "There it is, and you'll do well down here. Grezz can shout all he likes, but the grunts live.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Some victories aren't worth having. Grezz is right.", next = "BACK", reply = "Then you're Grezz's kind, and the Horde needs that too. But don't come to me when the pike wall falls.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cleft = {
      lines = { { id = "cl_default", text = "The warlocks keep to one side and the rogues to the other, the poison and the reagents get sold in the middle, and everyone pretends not to watch everyone else. Down at the bottom is Ragefire Chasm, which is where the real trouble lives." } },
      choices = {
        { text = "What's in Ragefire Chasm?", next = "ragefire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ragefire = {
      lines = { { id = "rf_default", text = "Troggs, fire and worse, and cultists of the Searing Blade who think the old ways of demons and blood were better. They're orcs, friend, from inside our own city, which is what troubles the Warchief more than any of it." } },
      choices = {
        { text = "Cultists shouldn't be able to get into Orgrimmar.", next = "ragefire_how" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    ragefire_how = {
      big = true,
      lines = { { id = "rh_default", text = "The same way anything gets anywhere, by walking through the gate and smiling at the guards. Some of them were grunts in good standing last season, so now I watch the faces in the Drag a little more closely than I used to." } },
      choices = {
        { text = "Then root them out. Every last one.", next = "BACK", reply = "Every one, aye, but quietly, so they don't know we're watching. Patience catches more rats than shouting.", fx = { align = { order = 1 } } },
        { text = "Watch, but don't make the city afraid of itself.", next = "BACK", reply = "That's the wiser course, and the harder one. Watch, then, and don't let the city see you watching.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "He trusts that we're useful, which is better than being trusted, if you ask me. Trust can be broken, but usefulness only runs out, and I don't intend to let mine run out." } },
      choices = { { text = "Something else, Shenthul.", next = "BACK" } },
    },
    forsaken = {
      big = true,
      lines = { { id = "fo_default", text = "You walk without breathing and nobody hears your heartbeat, because you haven't got one. I'd have you in Lordaeron, listening to the humans who still think they can take it back, and you'd hear more than any of my orcs ever could." } },
      choices = {
        { text = "I'll go wherever I'm most useful to the Horde.", next = "BACK", reply = "Then go north. Lordaeron's full of secrets, and the Undercity has more ears than it has walls.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I serve the Dark Lady first, and you second.", next = "BACK", reply = "Fair enough, and I'll take second. The Dark Lady and I want the same humans dead anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Where I come from doesn't matter, and nobody who knows is going to tell you. That's rather the point." } },
    advice = { { id = "tp_ad", text = "Never stand in a doorway, never sit with your back to one, and never trust anyone who says they have nothing to hide." } },
    _none = { { id = "tp_none", text = "I don't know, and now I'll wonder why you're asking, the way I wonder about anyone who asks." } },
  },
}

---------------------------------------------------------------------------
-- Mirket: warlock trainer, and much more honest about it than Zevrost.
---------------------------------------------------------------------------
P:NPC {
  key = "mirket", id = TODO_NPC("Mirket"), name = "Mirket", title = "Warlock Trainer",
  bible = "bibles/mirket.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "sharp" }, values = { "ambitious", "practical" },
  notices = { "fel", "class" },
  impression = {
    first = "Demons get only dry contempt from someone who has bound so many.",
    third = "{name} met Mirket, a warlock trainer in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "If you've come to stare at the warlocks, there's a better view from the top of the ramp." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Another one for the Cleft. Your imp's been talking about you, and none of it was flattering." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and on time, which already puts you ahead of most of my students." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "A Forsaken, and I'd wager you brought your own chalk from Undercity. Your people draw neater circles than any orc in this Cleft, which I find deeply irritating." },
  },
  notice = {
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp's grinning at me again. Tell it that if it sets fire to my robes, I'll send it home in pieces." },
    { id = "n_felhunter", cat = "fel", when = { class = "WARLOCK", pet = { family = "Felhunter" } },
      text = "Your felhunter keeps sniffing at my sleeve, because I've a ward stitched into the cuff. Call it off before it eats a week of my work." },
    { id = "n_taint", cat = "fel", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "You've been spending more of yourself than you've earned back. I can count it in the hollows under your eyes, and I'm rarely wrong about sums." },
  },
  start = "hello",
  nodes = {
    xorig_bdef = {
      lines = { { id = "xbd_default", text = "Then you know what I spend half my lessons warning against, which is a demon you serve instead of one that serves you. The Blade doesn't forgive deserters, so tell me, do you sleep with your back to the wall these days?" } },
      choices = {
        { text = "Always, and with a knife under my pillow.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Let them come. I know their tricks now.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Mirket, and I teach warlocks. The rest of the city remembers the blood curse and would rather we didn't exist, but it's glad enough of us when the Alliance comes over the hill." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "I'm Mirket, and you're a shaman, so you'll be wanting to tell me the spirits disapprove of me. Save your breath, because Kardris up in the Valley of Wisdom has already said it twice this season." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "I'm Mirket, and you're one of mine, so show me your hands. Chalk under the nails means you've been practising, and clean nails mean you've been lying to me." },
        { id = "h_lock40", when = { class = "WARLOCK", minLevel = 40 }, text = "I'm Mirket, and you've lasted long enough that I've stopped keeping a grave dug for you. Show me your hands anyway, because old habits keep old warlocks alive." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, because my next student's late." },
        { id = "h_again2", text = "Go on, then. I keep a tally of wasted minutes, and I've started a new column for you." },
        { id = "h_again3", text = "Ask. You've used four minutes so far, which is about average for someone who hasn't been bitten yet." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What's a healthstone really worth?", next = "stones", when = { class = "WARLOCK", minLevel = 10, maxLevel = 49 } },
        { text = "I'm ready to ride a felsteed.", next = "steed", when = { class = "WARLOCK", minLevel = 40, maxLevel = 59 } },
        { text = "Tell me about the Ritual of Doom.", next = "doom", when = { class = "WARLOCK", minLevel = 60 } },
        { text = "I lost my grip on my voidwalker once.", next = "lock_slip", when = { class = "WARLOCK" } },
        { text = "Why does the city tolerate warlocks?", next = "tolerate" },
        { text = "Demons nearly destroyed the orcs.", next = "demons" },
        { text = "What's the worst mistake your students make?", next = "circle" },
        { text = "What do you make of Zevrost?", next = "zevrost" },
        { text = "What do you look for in a student?", next = "student" },
        { text = "The spirits truly don't approve of you.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "My father drank the blood, and it nearly killed him.", next = "orc_blood", when = { race = "Orc" } },
        { text = "I wore the Burning Blade's mark once, Mirket.", next = "xorig_bdef", when = { origin = "orc_blade_defector" } },
        { text = "Farewell, Mirket.", next = "END" },
      },
    },
    tolerate = {
      lines = { { id = "to_default", text = "Because the Warchief is practical, whatever the shaman whisper in his ear. Every warlock in the Cleft is one the Horde can watch, and one the Searing Blade didn't get to first." } },
      choices = {
        { text = "Who are the Searing Blade?", next = "searing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    searing = {
      narr = "She jabs a chalky finger at the dark mouth of Ragefire Chasm behind the vendors.",
      lines = { { id = "se_default", text = "The Burning Blade's cellar dwellers, living right under our feet in Ragefire Chasm with Taragaman the Hungerer and whatever else they've called up down there. Every orc they recruit is one more reason the city glares at this Cleft, and I resent them for that more than for the demons." } },
      choices = {
        { text = "Then why not clear them out yourself?", next = "searing2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    searing2 = {
      lines = { { id = "se2_default", text = "Because if a warlock goes into Ragefire and comes out again, half the city will wonder what she agreed to while she was down there. I send my students in with a warrior and a shaman beside them, so there are witnesses, and I've found that works better than any amount of honesty." } },
      choices = { { text = "Witnesses. That's clever.", next = "BACK", reply = "It's arithmetic. A warlock alone is a suspect, and a warlock in a party is a weapon." } },
    },
    demons = {
      lines = { { id = "de_default", text = "They did, because our fathers bowed to them and drank what they were offered. A warlock doesn't bow, a warlock holds the leash, and if you can't tell the difference you shouldn't be standing in the Cleft." } },
      choices = {
        { text = "What if the leash breaks?", next = "leash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leash = {
      big = true,
      lines = { { id = "le_default", text = "Then the warlock dies, and usually the warlock deserved it for being careless. I've buried three students who thought they were stronger than they were, and I'll bury more, because the Horde needs the power whether or not it likes the price." } },
      choices = {
        { text = "Power the Horde needs is worth the risk.", next = "BACK", reply = "You understand it, then. Most who come down that ramp pretend they don't.", fx = { align = { light = -1 } } },
        { text = "No power is worth bargaining with demons.", next = "BACK", reply = "Then you're in the wrong trade and the wrong part of the city, so go back up the ramp.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    circle = {
      lines = { { id = "ci_default", text = "It's sloppy circles, every time. Most of my students draw a binding circle the way a grunt signs his name, crooked and in a hurry, and a gap the width of a hair lets the imp stroll out smiling, so I make them draw a hundred before they're allowed to draw one that matters." } },
      choices = {
        { text = "A hundred circles? That seems excessive.", next = "circle_hundred" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_hundred = {
      lines = { { id = "ch_default", text = "Excessive is digging a grave behind Ragefire, which I've done three times now. Every one of those students drew a circle that was good enough, and I'll tell you, {class}, that 'good enough' is the most expensive phrase in the Cleft." } },
      choices = { { text = "I'll remember that. Let's move on.", next = "BACK" } },
    },
    zevrost = {
      lines = { { id = "ze_default", text = "Zevrost whispers, wears black and stands in the darkest corner of the Cleft as though the shadows hired him. He's capable, I'll grant him that, but half of what he teaches is theatre, and no demon was ever impressed by theatre." } },
      choices = {
        { text = "And what are you, if not theatre?", next = "zevrost_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zevrost_me = {
      big = true,
      lines = { { id = "zm_default", text = "I'm arithmetic, {class}. I know what a demon wants, what it can take from me and how long my will holds, and I've never needed a cloak to explain any of it." } },
      choices = {
        { text = "Cold discipline beats mystery. You're right.", next = "BACK", reply = "It does. Zevrost's robes and whispers are for warlocks who can't do the sums.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear is a weapon too. Zevrost knows it.", next = "BACK", reply = "Fear is a weapon, I'll grant, and he wields it well, but arithmetic never fails you when a demon tests you.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    student = {
      big = true,
      lines = { { id = "st_default", text = "Honesty, which is rarer down here than talent. So I'll ask you what I ask every pupil who comes down these steps: why would anyone want a power that can eat them alive?" } },
      choices = {
        { text = "To protect the Horde, whatever it costs me.", next = "st_protect", fx = { trait = { brave = 1 }, align = { honor = 1 } } },
        { text = "Because I want it, and I'm not ashamed of that.", next = "st_want", fx = { affinity = 1, trait = { honest = 1 }, align = { honor = -1 } } },
        { text = "I don't want it. I'm only curious.", next = "st_curious", fx = { trait = { curious = 1 } } },
      },
    },
    st_protect = {
      lines = { { id = "sp_default", text = "Everyone says that, and about half of them mean it. Mean it a little longer than the others did, and you might outlive them." } },
      choices = { { text = "I intend to.", next = "BACK" } },
    },
    st_want = {
      lines = { { id = "sw_default", text = "That's an honest answer at last. Wanting power is no sin in the Cleft, but needing it is how the leash ends up around your own neck." } },
      choices = { { text = "Wanting, not needing. I'll mind the difference.", next = "BACK" } },
    },
    st_curious = {
      lines = { { id = "sc_default", text = "Curiosity dug most of my graves for me, so be curious somewhere else, and from a sensible distance." } },
      choices = { { text = "Fair enough. Something else, then.", next = "BACK" } },
    },
    lock_slip = {
      lines = { { id = "ls_default", text = "Once is a lesson and twice is a funeral, so tell me you drew a fresh circle afterward instead of shouting at it. The void doesn't care how loud you are, only how sure." } },
      choices = {
        { text = "I drew a fresh one, and bound it again.", next = "BACK", reply = "Then you'll do. Most of them run to Kurgul crying instead, and Kurgul feeds them tea." },
        { text = "I shouted at it, honestly.", next = "BACK", reply = "Of course you did. Draw a hundred circles tonight, and don't come back until your wrist aches." },
      },
    },
    stones = {
      lines = { { id = "hs_default", text = "One shard and a moment's work, and in exchange a grunt's life when he's down to his last breath. I make my students hand them out to every party they travel with, because nothing teaches the Horde to tolerate us faster than being saved by us." } },
      choices = {
        { text = "And the soulstone?", next = "stones2" },
        { text = "Back to the other questions.", next = "BACK" },
      },
    },
    stones2 = {
      lines = { { id = "hs2_default", text = "That costs the same shard and buys something much rarer, which is a second chance for whoever carries it. Give it to your healer, never to yourself, because a warlock who comes back alone is only a warlock who dies twice." } },
      choices = { { text = "The healer gets it. Understood.", next = "BACK", reply = "Good. You'd be amazed how many of them have to be told." } },
    },
    steed = {
      lines = { { id = "fs_default", text = "Then pay for the lesson and stop telling me about it, because the felsteed is the one demon in the Cleft that's glad to be called. It wants to run, and it will run you straight into a Scarlet patrol if you let it, so hold the reins harder than you think you need to." } },
      choices = {
        { text = "Glad to be called? Why that one?", next = "steed2" },
        { text = "Show me the lesson, then.", next = "BUSINESS" },
      },
    },
    steed2 = {
      lines = { { id = "fs2_default", text = "Because it was bred in the Nether to carry Legion riders to war, and carrying you is the nearest thing to war it can find. Don't mistake its eagerness for loyalty; it would carry a doomguard just as happily, and probably faster." } },
      choices = { { text = "Let's talk about something else.", next = "BACK" } },
    },
    doom = {
      narr = "She stops counting on her fingers for the first time, and her hand stays closed.",
      lines = { { id = "do_default", text = "The ritual takes you and four others, a demonic figurine from Hagrus and every scrap of nerve you own. It calls a doomguard, and the price is one of the five, chosen by the Nether and not by you, so before you start you'd better be at peace with whichever one it takes." } },
      choices = {
        { text = "That's not arithmetic. That's dice.", next = "doom2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doom2 = {
      big = true,
      lines = { { id = "do2_default", text = "It's arithmetic with a die in the middle, which is the worst kind. A doomguard can break a line that would kill twenty grunts, and the ritual costs one warlock, and I've never once been able to make those numbers feel right. What would you do?" } },
      choices = {
        { text = "One life for twenty is a fair trade.", next = "BACK", reply = "The sums agree with you. I'm only telling you the sums won't help you sleep.", fx = { align = { light = -1 } } },
        { text = "I won't ask friends to stand in that circle.", next = "BACK", reply = "Then you'll never call one, and the Horde may pay for your scruples one day. I'm not sure that's wrong.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    shaman = {
      big = true,
      lines = { { id = "sh_default", text = "Then the spirits can take their complaint to Kardris, who'll carry it down the ramp personally, as usual. Your elements bargain with you and my demons obey me, and I'm not convinced yours is the safer arrangement." } },
      choices = {
        { text = "The elements are partners, not slaves. That's the difference.", next = "BACK", reply = "They're partners who leave when they're angry. I'll take obedience, shaman, and you can keep your bargains.", fx = { align = { light = 1 } } },
        { text = "Obedience is cleaner than bargaining, I'll admit.", next = "BACK", reply = "At last, a shaman with sense. Don't tell Kardris you said so.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's leave the spirits out of it.", next = "BACK" },
      },
    },
    orc_blood = {
      lines = { { id = "ob_default", text = "Then he bowed to the demons, and Grom Hellscream paid with his life in Ashenvale to undo it. I'm sorry for your father, but I won't apologise for the Cleft, because nobody here has bowed to anything." } },
      choices = {
        { text = "He'd say you're walking the same road.", next = "orc_blood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc_blood2 = {
      lines = { { id = "ob2_default", text = "He'd be wrong, and he'd have earned the right to say it. Your father drank because a warlock told him it was strength; I teach my students to read the bottle before they lift it, and to put it down." } },
      choices = { { text = "I'll tell him that, if he'll listen.", next = "BACK", reply = "He won't, and I wouldn't either, in his place. Tell him anyway." } },
    },
  },
  topics = {
    burning_blade = { { id = "tp_blade", text = "They're the reason every warlock in Orgrimmar gets looked at sideways. I'd count that against them even if they'd never summoned a thing." } },
    thrall = { { id = "tp_thrall", text = "The Warchief keeps us where he can see us, and I'd do the same in his place. I'd also want the ledgers, and I suspect he has them." } },
    _none = { { id = "tp_none", text = "That isn't worth the chalk it would take to write down. Ask me about binding demons, or go and bother a grunt." } },
  },
}

---------------------------------------------------------------------------
-- Kurgul: the demon trainer, who sells grimoires and knows every imp's name.
---------------------------------------------------------------------------
P:NPC {
  key = "kurgul", id = TODO_NPC("Kurgul"), name = "Kurgul", title = "Demon Trainer",
  bible = "bibles/kurgul.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "patient", "curious" },
  notices = { "fel" },
  impression = {
    first = "Such fondness for imps and voidwalkers is a strange thing to see.",
    third = "{name} met Kurgul, the demon trainer in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Bring me your demon, and let's see what we can teach it this time." },
    { id = "g_imp", when = { pet = { family = "Imp" } }, text = "Oh, you've brought an imp, and it's pulling faces at me already. Hello, little one, and do stop that." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, because I keep a list of demons who owe me an apology, and yours is near the top." },
    { id = "g_succ", when = { pet = { family = "Succubus" } }, text = "Put the whip away, my dear. I've heard every one of your compliments before and believed none of them." },
    { id = "g_fh", when = { pet = { family = "Felhunter" } }, text = "Sit, and stop nosing at my grimoires. Your felhunter has better manners than most, {name}, but it's still hungry for every spell in this room." },
  },
  notice = {
    { id = "n_void", cat = "fel", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker's drifting a little to the left. They do that when they're bored, so give it something to hit soon." },
    { id = "n_nopet", cat = "fel", when = { class = "WARLOCK", ["not"] = { pet = true } },
      text = "You've come down without a demon at your heel. Either you dismissed it to talk to me in private, or you've lost it, and I'd like to know which." },
  },
  start = "hello",
  nodes = {
    xorig_hex = {
      lines = { { id = "xhx_default", text = "A troll learning a demon's tricks to break a troll's curse, and Vol'jin pretends not to see you coming and going from the Cleft. Tell me, what will you do when your imp starts to enjoy the work?" } },
      choices = {
        { text = "Remind it who holds the leash.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Send it back before it does.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kurgul, and I sell the grimoires that teach your demons new ways to serve. Our grandfathers served the demons and paid in blood, and my books make sure the demons serve us now." },
        { id = "h_void", when = { pet = { family = "Voidwalker" } }, text = "I'm Kurgul, and I sell the grimoires that teach demons like your sulky voidwalker new ways to serve. They never say thank you, but they remember who was kind to them, in their way." },
        { id = "h_felhunter", when = { pet = { family = "Felhunter" } }, text = "I'm Kurgul, and your felhunter has been sniffing at my grimoires since you came down the ramp. Keep it on your side of the counter, please, because it eats magic the way a wolf eats mutton." },
        { id = "h_succ", when = { pet = { family = "Succubus" } }, text = "I'm Kurgul, and your succubus has already told me three lies about you and one about herself. I believed the one about herself, because it was the least flattering." },
      },
      again = {
        { id = "h_again", text = "Anything else? My grimoires don't like being left open." },
        { id = "h_again2", text = "Go on, I'm listening, and so is your demon, though it'll pretend it isn't." },
        { id = "h_again3", text = "Ask away. The Duke of Ashes used to interrupt at this point, but he's not here, thank the ancestors." },
      },
      choices = {
        { text = "Show me your grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "My imp won't stop setting fire to things.", next = "imp_fire", when = { class = "WARLOCK", pet = { family = "Imp" } } },
        { text = "My succubus mocks me when no one's looking.", next = "succ", when = { class = "WARLOCK", pet = { family = "Succubus" } } },
        { text = "What should I feed a felhunter's hunger?", next = "fh", when = { class = "WARLOCK", pet = { family = "Felhunter" } } },
        { text = "Do demons have personalities?", next = "personal" },
        { text = "Where do the grimoires come from?", next = "books" },
        { text = "Do you really know every demon's name?", next = "names" },
        { text = "What does Mirket think of your methods?", next = "mirket" },
        { text = "What's the worst thing a warlock can do?", next = "peeve" },
        { text = "Demons seem uneasy around me.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I learned your craft to break Zalazane's hexes, Kurgul.", next = "xorig_hex", when = { origin = "troll_hex_breaker" } },
        { text = "Farewell, Kurgul.", next = "END" },
      },
    },
    personal = {
      lines = { { id = "pe_default", text = "They very much do, and none of them are nice. Imps are vain and spiteful, voidwalkers are quiet and sulky, felhunters are hungry dogs with too many teeth, and succubi will try to talk you out of your own name if you let them." } },
      choices = {
        { text = "I almost pity them.", next = "pity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pity = {
      big = true,
      lines = { { id = "pi_default", text = "Pity a demon? They'd burn this city to the ground and laugh about it, so pity comes hard to me. But I don't torment them more than I need to, because a tormented demon is a dangerous one." } },
      choices = {
        { text = "They're tools. Use them however works.", next = "BACK", reply = "Spoken like Mirket, and she'd agree. Use them, then, but don't come to me when they bite.", fx = { align = { light = -1 } } },
        { text = "Even a demon shouldn't be tormented for sport.", next = "BACK", reply = "Then we agree, which is rarer down here than you'd think. A tormented imp spends the rest of its binding plotting your death.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    books = {
      lines = { { id = "bo_default", text = "Some were copied from the old Shadow Council's books, the ones that weren't burned, and some I wrote myself after years of watching. I'd rather not say which ones are which, because people get nervous." } },
      choices = {
        { text = "The Shadow Council's books? Here, in Orgrimmar?", next = "books2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books2 = {
      narr = "Kurgul lays a broad hand flat on the nearest grimoire, the way you'd steady a restless hound.",
      lines = { { id = "bo2_default", text = "Copies of copies, and I took out everything that wasn't about the demons themselves. Gul'dan's lot wrote down how to make a demon obey and, in the same hand, how to make an orc obey, and I've burned every page of the second kind I ever found." } },
      choices = {
        { text = "You burned Shadow Council lore? Thrall would approve.", next = "BACK", reply = "The Warchief has never asked, and I've never offered. Some kindnesses are best done quietly." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "na_default", text = "All of them, and each one gave me a false name first. There was an imp down here last spring who called himself the Duke of Ashes, and he stole my good quill and ate it in front of me, very slowly." } },
      choices = {
        { text = "Why bother remembering their names?", next = "names_why" },
        { text = "What became of the Duke of Ashes?", next = "duke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    names_why = {
      lines = { { id = "nw_default", text = "Because a demon whose name you remember behaves a little better, the way a whelp does when you know its mother. They hate it, of course, which is half the reason I do it." } },
      choices = { { text = "Back to the other questions.", next = "BACK" } },
    },
    duke = {
      lines = { { id = "du_default", text = "His warlock went out to the Barrens and came back without him, and I'm told he set fire to a centaur's tent on the way out of this world, which I find I can't hold against him. I kept his name on my list anyway, and if he's ever called again, I'll want my quill back." } },
      choices = { { text = "You miss him, don't you?", next = "BACK", reply = "Don't be absurd. I miss the quill." } },
    },
    mirket = {
      lines = { { id = "mi_default", text = "Mirket thinks I'm soft and says so every time we pass on the ramp. She holds the leash and I keep the kennel, though I'll point out that my imps bite fewer students than hers do." } },
      choices = {
        { text = "Which of you is right?", next = "mirket_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mirket_who = {
      big = true,
      lines = { { id = "mw_default", text = "Both of us, which neither of us will ever admit. A leash without care makes a demon spiteful and care without a leash gets you eaten, so I suppose the Cleft needs the pair of us bickering." } },
      choices = {
        { text = "A firm hand works better than kindness.", next = "BACK", reply = "That's Mirket's way, and it works, mostly. The demons she leashes hate her for it, though.", fx = { align = { order = 1 } } },
        { text = "Care keeps a demon steadier than fear does.", next = "BACK", reply = "It does, and I'm glad to hear someone else say it. Mirket thinks I'm soft, but my demons don't bite.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    peeve = {
      lines = { { id = "pv_default", text = "Ignoring their demon, if you ask me. Some warlocks go years without saying a word to their voidwalker, and then they're shocked when it drifts off in the middle of a fight." } },
      choices = {
        { text = "You expect me to chat with a demon?", next = "peeve_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peeve_ask = {
      lines = { { id = "pa_default", text = "I expect you to try, so let me ask you plainly. If a demon followed you about all day, what would you say to it?" } },
      choices = {
        { text = "Good morning, and please don't eat anyone.", next = "pa_joke", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'd ask what it wants, and listen carefully.", next = "pa_listen", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Nothing at all. It's a weapon, not a companion.", next = "pa_silent", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    pa_joke = {
      lines = { { id = "pj_default", text = "Ha! That's kinder than anything the warlocks say to theirs. Say it every day, and mean the second part." } },
      choices = { { text = "Every morning, then.", next = "BACK" } },
    },
    pa_listen = {
      lines = { { id = "pl_default", text = "Listening carefully is right, and believing what it tells you is wrong. You'll make a decent warlock, or a very interesting corpse." } },
      choices = { { text = "I'd rather be the warlock.", next = "BACK" } },
    },
    pa_silent = {
      lines = { { id = "ps_default", text = "Then it'll serve you like a weapon, which is to say until it breaks. Don't come crying to me when it does, because I'll be taking its side." } },
      choices = { { text = "Let's talk about something else.", next = "BACK" } },
    },
    imp_fire = {
      lines = { { id = "if_default", text = "Of course it won't, because it's bored and it wants you to look at it. Give it something to burn on purpose, a quilboar or a centaur, and it'll leave your bedroll alone." } },
      choices = { { text = "Something to burn on purpose. Got it.", next = "BACK" } },
    },
    succ = {
      lines = { { id = "su_default", text = "She mocks you because she's measuring you, and every little cut tells her where you bleed. Lash of Pain and Soothing Kiss are in my books, and Seduction after that, but the thing that keeps her in hand isn't in any book at all." } },
      choices = {
        { text = "Then what keeps her in hand?", next = "succ2" },
        { text = "Show me the books, then.", next = "BUSINESS" },
      },
    },
    succ2 = {
      big = true,
      lines = { { id = "su2_default", text = "Not caring what she thinks of you, which is harder than it sounds for most of the young ones. Gan'rul says you must be firm with her; I say you must be bored by her. Which do you think suits you better?" } },
      choices = {
        { text = "Firm. She'll learn who rules.", next = "BACK", reply = "Gan'rul will be pleased. She'll fight you for it, every day, but she'll lose.", fx = { align = { order = 1 } } },
        { text = "Bored. Let her talk to the wall.", next = "BACK", reply = "Oh, I like that. Nothing wounds a succubus like a master who yawns.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    fh = {
      lines = { { id = "fh_default", text = "Magic, and as much of it as you can find. Turn it loose on a mage's shield or a priest's blessing and let Devour Magic do its work, and save Spell Lock for the caster you can't afford to let finish a sentence." } },
      choices = {
        { text = "Does it ever turn on me?", next = "fh2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fh2 = {
      lines = { { id = "fh2_default", text = "It sniffs at you every day, because you're full of the very magic it craves. Strahad Farsan will have told you it's loyal to the hand that feeds it; I'd say feed it often, and never let it go hungry near you." } },
      choices = { { text = "Feed it often. Understood.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "They would be, because they can't smell any fear on you, and fear is how a demon reads a mortal. A voidwalker beside a Forsaken looks almost lost, which I find rather sweet." } },
      choices = { { text = "Sweet isn't a word I hear often.", next = "BACK", reply = "Down here it isn't heard at all, so treasure it." } },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "Every demon I've ever trained came from the Legion's kennels first. I like to think mine are happier, though they'd never say so." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, but I'll ask my imp. It lies, but sometimes it lies interestingly." } },
  },
}

---------------------------------------------------------------------------
-- Rekkul and Hagrus: poisons and reagents.
---------------------------------------------------------------------------
P:NPC {
  key = "rekkul", id = TODO_NPC("Rekkul"), name = "Rekkul", title = "Poison Supplier",
  bible = "bibles/rekkul.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "That is too much smiling for someone who sells poison.",
    third = "{name} met Rekkul, who sells poisons in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Don't touch the jars, please, or at least wash your hands before you eat anything." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you still have all your fingers. Good, that means you've been reading the labels." },
    { id = "g_cough", text = "Pardon the cough, friend, it's only the fumes, and it's been only the fumes for six years now. What can I find for you?" },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear! Then you'll know the smell in here, because it's the same as every witch doctor's hut I ever stood in." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Your blade's coating has gone dull, you know. A poison loses its bite after a few days in the sun." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rekkul, and I sell the makings of poisons to those who are trained to use them. I can't sell you a full jar of anything, but I'll sell you all the pieces, and you can make it yourself." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Rekkul, and you're a rogue, so you know the routine by now. Crippling for the ones who run, instant for the ones who don't, and washed hands for everybody." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the green jar, it's in a mood today." },
        { id = "h_again2", text = "Anything else, friend? Keep your hands where I can see them, for your sake rather than mine." },
      },
      choices = {
        { text = "Who buys poisons in Orgrimmar?", next = "who" },
        { text = "Poison seems a dishonorable way to fight.", next = "honor" },
        { text = "Why are your labels in a script nobody can read?", next = "labels" },
        { text = "Do you ask your buyers what it's for?", next = "ask_for" },
        { text = "What do you make of Hagrus next door?", next = "hagrus" },
        { text = "That cough doesn't sound like nothing.", next = "cough" },
        { text = "I'm an alchemist myself. What do you make of the trade?", next = "alchemist", when = { profession = "Alchemy" } },
        { text = "The Apothecaries in Undercity could teach you a thing or two.", next = "apothecary", when = { race = "Scourge" } },
        { text = "Which witch doctor taught you?", next = "witchdoctor", when = { race = "Troll" } },
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Farewell, Rekkul.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Rogues, of course, but you'd be surprised how many hunters and apothecaries come down here too. Even a grunt or two, who'd die before admitting it to the Valley of Honor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    honor = {
      big = true,
      lines = { { id = "ho_default", text = "So is dying, friend, and the Alliance doesn't send their soldiers home just because ours fight fair. A poisoned blade ends a fight quicker, and quicker means fewer orcs coming home on a stretcher." } },
      choices = {
        { text = "A quick end is a mercy to both sides.", next = "BACK", reply = "It is, and you see it plainer than most grunts do. Fewer stretchers for everybody.", fx = { align = { honor = -1 } } },
        { text = "I'd rather win clean or not at all.", next = "BACK", reply = "Then you'll win less often and bury more grunts. I've never found honor much comfort at a graveside.", fx = { align = { honor = 1 } } },
        { text = "Who taught you poisons?", next = "teacher" },
      },
    },
    teacher = {
      lines = { { id = "te_default", text = "A Darkspear witch doctor taught me which mushrooms kill and which ones only make you wish you were dead. The rest I learned by breathing the wrong smoke, and I've had this cough ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    labels = {
      lines = { { id = "la_default", text = "That's my own hand, friend, which I learned from nobody and teach to nobody. A thief who helps himself to my shelves has to guess what's in the jar, and guessing, as I'm fond of saying, is how you poison yourself." } },
      choices = {
        { text = "Isn't that dangerous for your customers?", next = "labels_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    labels_more = {
      lines = { { id = "lm_default", text = "Not for my customers, because I hand every jar across myself and tell them what's in it twice. It's only dangerous for the sort who don't ask, and I sleep very soundly about them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ask_for = {
      big = true,
      lines = { { id = "af_default", text = "Always, because it's polite, and I like to know who I'm helping. So tell me, friend, who would you use a poison on?" } },
      choices = {
        { text = "Alliance soldiers, and I wouldn't lose sleep over it.", next = "af_alliance", fx = { align = { honor = -1 } } },
        { text = "No one. I'd rather fight without it.", next = "af_none", fx = { trait = { honest = 1 }, align = { honor = 1 } } },
        { text = "That's my business, not yours.", next = "af_discreet", fx = { affinity = 1, trait = { discreet = 1 } } },
      },
    },
    af_alliance = {
      lines = { { id = "aa_default", text = "Then you'll want something quick, because the Alliance wears thick plate and runs to its priests. Come back when you know the job, and I'll have the pieces waiting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    af_none = {
      lines = { { id = "an_default", text = "Then I hope you never need me, friend, and I mean that kindly. If the day ever comes, you'll find me down here, and I won't say I told you so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    af_discreet = {
      lines = { { id = "ad_default", text = "Oh, I do like you. The ones who tell me everything are usually the ones I hear about later, from the guards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hagrus = {
      lines = { { id = "hg_default", text = "Hagrus tells everyone my stall makes the Cleft smell like a swamp, which is rich from someone who sells sulfur by the scoop. We've argued about it since the day he moved down here, and I'd miss it terribly if we ever stopped." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cough = {
      lines = { { id = "co_default", text = "It's nothing, only the fumes, and it's been nothing for years. The witch doctor who taught me used to say a poisoner who never coughs isn't working hard enough, and I've chosen to find that comforting." } },
      choices = {
        { text = "You should have a healer look at it.", next = "cough_healer", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cough_healer = {
      lines = { { id = "cl_default", text = "That's kind of you, and I'll certainly think about it, which is what I've told everyone who's asked for six years. Now, was there anything you wanted that won't make you cough?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alchemist = {
      lines = { { id = "al_default", text = "Then you know already that the difference between a cure and a poison is mostly how much you pour. Don't let anyone in the Drag tell you otherwise, because they've never had to measure anything that bites back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    apothecary = {
      lines = { { id = "ap_default", text = "I've heard they keep their jars in rooms with locked doors and no windows, which seems excessive even to me. I'd happily trade notes with them, friend, though I'd want to wash my hands twice afterward." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    witchdoctor = {
      lines = { { id = "wd_default", text = "One who'd curse me for naming her, so I won't. If you're ever home in Sen'jin Village, ask after the one who keeps a jar of scorpid tails by her door, and give her my regards from a safe distance." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know that, and I won't guess. Guessing is how you poison yourself, and I've got a cough already." } },
  },
}

P:NPC {
  key = "hagrus", id = TODO_NPC("Hagrus"), name = "Hagrus", title = "Reagent Vendor",
  bible = "bibles/hagrus.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "honest" },
  notices = { "class" },
  impression = {
    first = "Every customer gets complained about, and that seems the real pleasure.",
    third = "{name} met Hagrus, who sells reagents to the spellcasters of Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Reagents, yes, and no, I don't have anything stronger, so don't ask." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You burn through powders faster than a mage in a bad temper." },
    { id = "g_count", text = "Hold on, I'm counting, forty-one, forty-two, and now I've lost it, so you'd better be buying something." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "A rogue at my counter, so keep your hands on top where I can see them. Don't take it personally, because I say it to all of you." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, so you'll need powder for those portals, and you'll have run out at the worst moment, I expect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Hagrus, and I sell reagents. Mages want powder, shamans want ankhs, warlocks want soul shards they think I keep under the counter, and I sell what I've got and argue about the rest like any honest orc." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Hagrus, and you're a shaman, so you'll be wanting an ankh. Everybody dies sometime, and your kind just plan for it better." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "Hagrus, and before you ask, no, I don't sell soul shards. I don't keep them under the counter either, and I never have, so you can stop looking at it." },
      },
      again = {
        { id = "h_again", text = "What else? I've got stock to count." },
        { id = "h_again2", text = "Still here? Then ask, and be quick about it, because my powder doesn't count itself." },
      },
      choices = {
        { text = "Why sell reagents down here in the Cleft?", next = "cleft" },
        { text = "Who's your worst customer?", next = "worst" },
        { text = "Why are you always counting?", next = "count" },
        { text = "What do you think of Rekkul?", next = "rekkul" },
        { text = "You seem to enjoy complaining.", next = "complain" },
        { text = "I need teleport runes, and I need them now.", next = "mage_rush", when = { class = "MAGE" } },
        { text = "I'm not here to steal anything, I promise.", next = "rogue_promise", when = { class = "ROGUE" } },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Farewell, Hagrus.", next = "END" },
      },
    },
    cleft = {
      lines = { { id = "cl_default", text = "Because nobody in the Drag wanted me next to their stall, with the smell of the powders. Down here everybody smells odd anyway, so I fit in nicely." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worst = {
      lines = { { id = "wo_default", text = "The warlocks, always the warlocks, asking for things I don't sell and wouldn't sell if I could. I tell them I sell powders, not souls, and they look at me like I'm the strange one." } },
      choices = {
        { text = "I'd guess you'd sell them if you could.", next = "souls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    souls = {
      big = true,
      lines = { { id = "so_default", text = "Never, and I don't care how much gold they offer. A trader has to draw the line somewhere, and I draw mine at anything that used to be alive and still might be." } },
      choices = {
        { text = "Good. Some trades shouldn't be made.", next = "BACK", reply = "They shouldn't. I've turned away a Burning Blade buyer twice this month, and I'll turn him away a third time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Gold is gold. You're leaving money on the table.", next = "BACK", reply = "Leaving it, aye, and I'll keep leaving it. Gold from the wrong hand buys you a knife in the back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    count = {
      lines = { { id = "ct_default", text = "Because the Cleft has more light fingers than anywhere in Orgrimmar, and half of Shenthul's students practice on my counter. I've never shorted a customer by a single grain, and I'll be cursed before I let anyone short me." } },
      choices = {
        { text = "Have you told Shenthul?", next = "count_shenthul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    count_shenthul = {
      lines = { { id = "cs_default", text = "I told him once, and he smiled that smile of his, and the next morning every missing pouch was back on my counter with a copper on top. I still don't know if that was an apology or a warning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rekkul = {
      lines = { { id = "rk_default", text = "Rekkul smiles at everybody, and I don't trust anyone who smiles that much in the Cleft of Shadow. Besides, that one coughs all day over jars of swamp water and then tells me my sulfur stinks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    complain = {
      lines = { { id = "cp_default", text = "Enjoy it? I'm good at it, which is a different thing. Go on, then, tell me what's wrong with my stall, because everybody else does sooner or later." } },
      choices = {
        { text = "Your prices are fair. Your manners aren't.", next = "cp_honest", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "It smells like a sulfur pit, frankly.", next = "cp_blunt", fx = { trait = { blunt = 1 } } },
        { text = "Nothing at all. It's the finest stall in Orgrimmar.", next = "cp_flatter", fx = { affinity = -1 } },
      },
    },
    cp_honest = {
      lines = { { id = "ch_default", text = "Ha! Somebody honest at last, and I'll take that over a compliment any day. My manners stay where they are, though, because they keep the warlocks from lingering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cp_blunt = {
      lines = { { id = "cb_default", text = "It does, because it's a reagent stall and sulfur is a reagent. You'd be more worried if it smelled of flowers, believe me, because down here a sweet smell usually means poison." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cp_flatter = {
      lines = { { id = "cf_default", text = "Liar, and a poor one, because you haven't even looked at my shelves. Save the honey for the Drag, they like that sort of thing up there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage_rush = {
      lines = { { id = "mr_default", text = "Everybody needs them now, and none of you ever buys two when one will do. Then you're stuck on the wrong side of the sea, and it's somehow my fault for not reminding you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue_promise = {
      lines = { { id = "rp_default", text = "Everybody promises, and then I find my flash powder in some Shenthul pupil's pocket. Keep yours, and you'll be the first customer this month who did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, and I'm not paid to find out. Buy something or move along, there's people waiting behind you." } },
  },
}
