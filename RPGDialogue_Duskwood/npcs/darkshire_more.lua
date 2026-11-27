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
    first = "To her, the Light is something you walk under, not wait for.",
    third = "{name} met Elaine Carevin, who keeps the Carevin household's supplies moving and its questions asked.",
  },

  greetings = {
    { id = "g_default", text = "These are bad days for Duskwood, {class}, and they don't seem to end. Is there news from the road?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and in one piece. I'll cross you off the list of people I worry about, for today." },
    { id = "g_sven", when = { questActive = TODO_QUEST("Deliveries to Sven") }, text = "Sven Yorgen's crate won't carry itself, and his people won't eat until it gets there." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Come in from the dark. The Watch's lamps only reach so far, and the woods know exactly how far." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I kept your name on my list of people to worry about the whole time. I'm glad to cross it off." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in town has been speaking kindly of you, and kind words are scarcer in Darkshire than lamp oil. The Light walks with folk like that." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been helping people in Darkshire these past days. That's one less name on my list of the forgotten, and I thank you for it." },
  },

  notice = {
    { id = "n_light", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "You wear the Light openly, and that's rarer here than it should be. Most of Darkshire prays with the shutters closed." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's half torn away. Morg Gnarltree will see to your armour before you go out again, and please do go to him first." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It's enough if we walk in it, not sit and wait. Your spirits might walk the same way." } },
      choices = {
        { text = "Walk in the Light and do good. I agree, Elaine.", next = "BACK", reply = "Then we'll walk it together, as far as the road allows. There's a crate for Sven's camp by the door if your arms are free.", fx = { align = { light = 1 } } },
        { text = "The Light is too slow here. I'll trust my spirits.", next = "BACK", reply = "Trust what gets you up the road, then, and I'll not quarrel with you over the name. Just make sure it walks with somebody else besides you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "More than they'd admit, since half of what comes out of these woods was made by somebody who studied, and the Watch only knows how to shoot it. If you've a fire in your hands, burn the bodies on the cemetery road, and I'll cross a few more names off the list of things that might get up again." },
      },
      choices = {
        { text = "I'll burn them, Elaine, and say a word over each.", next = "BACK", reply = "Then you've a kinder fire than most, and I'll add the words to my list of things done right. Thank you.", fx = { align = { light = 1 } } },
        { text = "Fire is fire. I'll leave the words to you.", next = "BACK", reply = "That's fair, and I'll say them for you, gladly. Every body you burn is one fewer coming back up the road.", fx = { align = { light = -1 } } },
        { text = "Something else, Elaine.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The road past Raven Hill, where the dead come up thickest at night, and the farmers out west who won't leave their homes. The Light walks with anyone who stands between them and harm, and I'd like that to be you." } },
      choices = {
        { text = "Then I'll stand there, under the Light, with the farmers.", next = "BACK", reply = "Then the farmers have one more reason to stay, and I'll add your name to the good list. Thank you.", fx = { align = { light = 1 } } },
        { text = "I'll fight where the dead are. The farmers can come to town.", next = "BACK", reply = "They won't come, and that's the trouble, but I'll not stop you fighting where you're needed. Mind the cemetery road.", fx = { align = { light = -1 } } },
        { text = "Something else, Elaine.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Anything that's changed: a worg den where there wasn't one, spiders in a house that was empty last week, tracks heading toward town. Jonathan hunts what I write down, so the better your eyes, the safer we all are." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Anything that's changed: a new worg den, spiders in a house that was empty last week, tracks heading toward town. Your {pet} would make a fine scout for that, {class}, because animals notice things long before people do." },
      },
      choices = {
        { text = "I'll report everything I see. Your list keeps people alive.", next = "BACK", reply = "Then my lists will be better for it, and so will the town. Bring me what you see, whatever it is.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt what I find. Reports are for the Watch.", next = "BACK", reply = "That's your right, but if you see something strange, tell somebody, even if it isn't me. That's all I ask.", fx = { align = { honor = -1 } } },
        { text = "Something else, Elaine.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "That would be a kindness, because I've been sending the Carevin boys and they clatter like a cart full of pans. Write down what you see, not what you think, and bring it back to me." } },
      choices = {
        { text = "I'll report what I see, and nothing more.", next = "BACK", reply = "That's all I could want, and more than the Carevin boys manage. Thank you, truly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If there's anything worth taking, I'll take it.", next = "BACK", reply = "Then you'll take it, and I'll not know, and I'll be the poorer for not knowing. Write it down anyway, please.", fx = { align = { honor = -1 } } },
        { text = "What's moving where it shouldn't, lately?", next = "raven" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I know, and I'll not lecture you, because Jonathan does enough of that for the whole house. But I keep lists of the fed and the missing, and if your walking keeps one name off the second list, I'll be glad of you." } },
      choices = {
        { text = "My path serves the living too.", next = "BACK", reply = "Then I'll be glad of you, and I'll not ask what it costs you. The second list is long enough.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My path is my own, not the town's.", next = "BACK", reply = "It is, and I'll not pretend otherwise. But the town is walking the same path, whether you like it or not.", fx = { align = { light = -1 } } },
        { text = "Tell me about your family.", next = "family" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A woodcutter's boy who went for kindling down by the river two days ago, and nobody's seen him since. The Watch stops looking after three days, so if you can follow a trail, follow his first." } },
      choices = {
        { text = "I'll look for him, and I won't stop at three days.", next = "BACK", reply = "Thank you, and Light keep you while you look. He's small, and he's frightened, and his mother hasn't slept.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Two days in this forest? He's gone, Elaine.", next = "BACK", reply = "Maybe he is, and maybe he isn't, and I'll not stop looking until I know. Someone has to.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Jonathan will be glad of you, and so am I, because I keep the list of who hasn't come back and I'd like it shorter." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be out in the wood longer than most, so do come back and tell me what you see moving where it shouldn't." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll put you on my list of folk passing through, if you'll tell me where you're headed and when you'll be back." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Good, because I need someone who can read the sort of papers Jonathan leaves lying about and doesn't understand." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Here, the Light is something we walk under, not something we wait for, so tell me, do your spirits see it the same way?" },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? I've a list, but it can wait a moment." },
        { id = "h_again2", text = "Go on. I'd rather hear it from you than from the woods." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then. Nobody sleeps much in this house anyway." },
      },
      choices = {
        { text = "What's moving where it shouldn't, lately?", next = "raven" },
        { text = "Who needs supplies most these days?", next = "sven" },
        { text = "You said someone hasn't been seen in a while.", next = "hermit" },
        { text = "Your family seems to have a hand in everything in Darkshire.", next = "family" },
        { text = "Do you walk under the Light, Elaine?", next = "light", when = { class = "PRIEST" } },
        { text = "About the hermit you sent me to...", next = "hermit_after", when = { questDone = TODO_QUEST("Translation to Ello") } },
        { text = "I walk under the Light, with a hammer.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I can check those empty houses without being seen.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Which part of the wood needs a warrior most, Elaine?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter report back to you, Elaine?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Darkshire walks under the Light, Elaine. I walk elsewhere.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I can follow a scent. Is anyone missing that I might find?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The Night Watch could surely use a mage, Elaine.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'm not sure the Light is enough in Duskwood, Elaine.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep my eyes open.", next = "END", fx = { standing = { darkshire = 1 } } },
      },
    },

    raven = {
      lines = {
        { id = "r_default", fx = { learn = { "raven_hill" } },
          text = "Raven Hill was a village once, west of here, with a cemetery that's grown bigger than the village ever was. Calor saw lights there, and Calor isn't a man who imagines things; he's a man who shoots at them." },
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
        { text = "The Commander's right. The town comes first.", next = "BACK", reply = "It does, and I know it, and I hate it all the same. I'll go myself if nobody else will.", fx = { align = { order = 1 } } },
        { text = "Arithmetic is how Raven Hill was left to rot.", next = "BACK", reply = "It is, and I've said so to the Commander, more politely. Somebody has to go and look.", fx = { align = { order = -1 }, affinity = 1 } },
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
        { text = "You couldn't have known. Keep caring for people.", next = "BACK", reply = "Thank you, and I'll try, though I'll ask more questions now. The Light doesn't ask me to be a fool.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Trust less, Elaine. Kindness to strangers is how this happened.", next = "BACK", reply = "Then we'd be no better than the woods. I'll keep caring, and I'll keep my eyes open too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    family = {
      lines = {
        { id = "f_default", fx = { learn = { "carevins" } },
          text = "We fight the dark rather than only guarding against it. Jonathan leads, Calor and a few others hunt with him, and I make sure the hunters and the people who help us have what they need." },
      },
      choices = {
        { text = "I'd guess the Night Watch doesn't approve.", next = "family_watch" },
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
        { text = "You're right. Prayer's no use if nobody carries the crates.", next = "BACK", reply = "Then pick up a crate, {class}, and walk with me. The Light won't mind if we pray on the way.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Then the Light is a hard master.", next = "BACK", reply = "Hard, maybe, but honest. It asks for your hands, not just your knees.", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
    light_none = {
      lines = {
        { id = "ln_default", text = "I hope you're right, I do. Say it to the people in this town who've buried children, though, and see if they believe you." },
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
    dark_riders = { { id = "tp_dark_riders", text = "The household keeps a list of every sighting of the Dark Riders, and it gets longer every month. I write each one down, and I try not to count." } },
    scourge = { { id = "tp_scourge", text = "The Carevins had kin in Lordaeron, and their letters stopped when the plague came. I keep their names on a list of my own now." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn has written to Master Carevin twice asking for help in the north. I keep their letters filed under 'answer later', which is a list that never gets shorter." } },
  },
}

P:NPC {
  key = "sorigal", id = TODO_NPC("Watchmaster Sorigal"), name = "Watchmaster Sorigal",
  bible = "bibles/darkshire_more.md", role = "soldier", tier = "quest",
  communities = { "darkshire" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  prejudice = { class = "WARLOCK", amount = 10, why = "Lost drivers and a caravan to felhounds on the road to Nethergarde." },
  notices = { "class", "travel" },

  impression = {
    first = "He is tired of losing wagons to prove Nethergarde matters.",
    third = "{name} met Watchmaster Sorigal, who sends Darkshire's supply caravans down the long road to Nethergarde Keep.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "The last time I saw a felhound, it was eating one of my drivers on the road to Nethergarde. You'll forgive me if I don't shake your hand." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Nethergarde stands where it stands to keep your sort of friends on the far side of the Portal. If you've business, say it." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've carried my crates without losing one, which is more than I expected. I still don't like what walks with you." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every crate that arrives is a small miracle. Your spirits might protect the wagons, if they're willing." } },
      choices = {
        { text = "Then I'll help guard the wagons, Watchmaster.", next = "BACK", reply = "Then you've done more for the keep than half of Stormwind. The next wagon leaves at dawn.", fx = { align = { order = 1 } } },
        { text = "The keep's not worth the losses. Stop sending them.", next = "BACK", reply = "Then the Portal stands unwatched, and you'll see what that costs. I'll keep sending them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Safer, at least, which is more than I can say now. The road east runs through Deadwind Pass, past things I'd rather not name, and every crate that arrives keeps Quartermaster Lungertz's soldiers fed and armed against the Dark Portal." } },
      choices = {
        { text = "I'll guard the road. Nethergarde needs those supplies.", next = "BACK", reply = "That's what I like to hear, and Lungertz will thank you, though he'll never know your name. Watch the pass.", fx = { align = { order = 1 } } },
        { text = "Nethergarde's a long way. I'll fight closer to home.", next = "BACK", reply = "Fair enough, and Duskwood needs fighting too. But if the keep falls, home won't be home much longer.", fx = { align = { order = -1 } } },
        { text = "Something else, Watchmaster.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Worgs along the eastern stretch, and spiders that string webs across the road at night as neat as a toll gate. A hunter clearing the road ahead of my wagons would save me more crates than any guard." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Worgs along the eastern stretch, and spiders that string webs across the road at night as neat as a toll gate. That {pet} would keep my oxen nervous, {class}, but I'd rather nervous oxen than dead drivers, so walk it ahead of the wagons." },
      },
      choices = {
        { text = "I'll clear the road ahead of your wagons.", next = "BACK", reply = "Then I'll lose fewer crates, and Nethergarde will eat better. Thank you.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt there if it pays. Supply runs aren't my trade.", next = "BACK", reply = "It pays in gratitude, mostly, and in soldiers who live to see another month. Think on it, all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else, Watchmaster.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Worgen, ogres and something in Deadwind Pass that leaves no tracks, though I'd not rule out plain thieves either. If you can find out where my crates go, Nethergarde might eat this month." } },
      choices = {
        { text = "I'll find the thieves and bring the crates back.", next = "BACK", reply = "That's what I need, and I'll write you up to Lungertz myself. Bring me what you find.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find them, and keep whatever's useful.", next = "BACK", reply = "Then you'd be a thief stealing from thieves, and I'll not ask. Just bring me something.", fx = { align = { honor = -1 } } },
        { text = "What's on the road to Deadwind?", next = "road_deadwind" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Then you'll know why the keep matters, and why I lose sleep over every wagon that doesn't arrive. The Portal's dead, they say, but the Kirin Tor didn't build a keep at its feet for nothing." } },
      choices = {
        { text = "Then I'll help keep it that way.", next = "BACK", reply = "Good, and I'll sleep easier knowing someone understands. Keep it that way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power that strong deserves study, not just a wall.", next = "BACK", reply = "Study it from a long way off, if you must. Nethergarde's mages would have something to say about that.", fx = { align = { light = -1 } } },
        { text = "Why does the keep matter so much?", next = "why" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Comfort, mostly, since the men on that wall stare at the Dark Portal all day and the mages tell me it gets into their sleep. I send what crates I can, but you can't crate a blessing." } },
      choices = {
        { text = "Then one day I'll carry my prayers to Nethergarde myself.", next = "BACK", reply = "They'd be glad of it, believe me. Pack warm; it's colder there than you'd think.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Men who guard the Portal knew the risk they took.", next = "BACK", reply = "They did, and they stand anyway, which is more than most do. But a blessing wouldn't hurt.", fx = { align = { light = -1 } } },
        { text = "Something else, Watchmaster.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nobody worth the name, since every soldier I can find is already on Nethergarde's wall. I send my drivers with a spear each and a prayer, and I write off one wagon in five, which Lungertz says is better than that road deserves." } },
      choices = {
        { text = "Then I'll ride with your next wagon east.", next = "BACK", reply = "You would? Then that wagon will get through, I'd wager, and the drivers will thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "One wagon in five sounds a fair price, Watchmaster.", next = "BACK", reply = "It's not fair, it's just arithmetic, and Lungertz agrees. I'll keep paying it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Watchmaster.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because it watches the Blasted Lands, and the last time nobody was watching, the Horde came marching up through this very forest. People here think the dead are the worst of it, and I'd like to keep it that way." } },
      choices = {
        { text = "Supply the keep first. If the Portal goes unwatched, we all pay.", next = "BACK", reply = "That's the way of it, and I'm glad you see it. The realm's bigger than Duskwood.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Darkshire's own dead matter more than an old fortress.", next = "BACK", reply = "They matter, and I'll not say they don't. But if the Portal opens, there won't be any Darkshire.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Nethergarde asks for bandages as often as it asks for stone, and I've never once had enough of either." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, and you'll want to know why Nethergarde needs so much. I'll tell you, if you'll carry a crate while I do." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "Nethergarde's there to watch for the demons you call friends, and I've lost drivers to them on the road. Say your business, and don't expect a smile." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've hauled for Nethergarde and the wagons came back whole. I'll hear you out." },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, because my wagons need escorts and I've run out of men who'll walk the road to Deadwind Pass twice." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The beasts that hit my wagons don't steal much, but they spook the oxen, and a bolted ox loses a whole load in the trees." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. If you can travel faster than a wagon, which I'm told you can, I've crates for Nethergarde and no one quick enough to carry them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I count the days a crate can survive the road to Nethergarde. Can your spirits keep the wagons safe?" },
      },
      again = {
        { id = "h_again", text = "What else? Quickly; there's a wagon with a broken axle out front." },
        { id = "h_again2", text = "Go on, I'm listening. I can listen and count crates." },
      },
      choices = {
        { text = "What's so urgent about this crate?", next = "crate" },
        { text = "What's the road to Nethergarde like?", next = "road" },
        { text = "Why does Darkshire supply Nethergarde?", next = "why" },
        { text = "I'd guessed you answered to the Night Watch.", next = "watch" },
        { text = "I've walked that road. It's worse than you say.", next = "veteran", when = { questDone = TODO_QUEST("Supplies for Nethergarde") } },
        { text = "Nethergarde's mages. What do they need so badly?", next = "mage", when = { class = "MAGE" } },
        { text = "Your crates go missing on the road. Who's taking them?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "An escort would see your crates safely to Nethergarde, Watchmaster.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Something must trouble your wagons on that road, Watchmaster.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Nethergarde watches the Portal. Some of us still feel its pull.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does Nethergarde need that a priest could give?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Your wagons don't seem well guarded, Watchmaster.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why does Nethergarde matter so much to Duskwood?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "They say the road to Nethergarde is deadly, Watchmaster.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "You must lose a good many wagons on that road.", next = "road_lost" },
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
        { text = "Nethergarde watches the Portal. It has to come first.", next = "BACK", reply = "It does, and it always will while I'm watchmaster. Thank you for understanding.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Darkshire's own people should come before a distant keep.", next = "BACK", reply = "They should, and they will, once Nethergarde's fed. I'll not apologise for it.", fx = { align = { order = -1 } } },
        { text = "I'd guess the town resents it.", next = "why_town" },
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
    nethergarde = { { id = "tp_nethergarde", text = "A keep full of mages at the end of the worst road in the kingdom, and each of those mages wants his crate yesterday.", next = "crate" } },
    dark_portal = { { id = "tp_portal", text = "I've never seen it and I never mean to. I send it powerstones, and that's as close as I like to get." } },
    _none = { { id = "tp_none", text = "That's not something I keep a ledger on. Ask me about crates and wagons instead." } },
    raven_hill = { { id = "tp_raven_hill", text = "I won't send a wagon down the road past Raven Hill without guards. The dead don't rob carts, but they frighten the horses, and that's worse." } },
    dark_riders = { { id = "tp_dark_riders", text = "The Dark Riders cross my road toward Deadwind Pass, and they never stop and never look at the wagons. I find that more frightening than if they did." } },
    second_war = { { id = "tp_second_war", text = "I counted wagons for the Alliance in the Second War, and I learned that wars are won by whoever runs out of bread last. Nethergarde is running low, by the way." } },
    burning_legion = { { id = "tp_burning_legion", text = "Nethergarde's mages say the Portal is quiet but the things beyond it aren't, and they speak of the Legion in a way I don't like. I just count their supplies and send them south." } },
  },
}

P:NPC {
  key = "hann", id = TODO_NPC("Barkeep Hann"), name = "Barkeep Hann",
  bible = "bibles/darkshire_more.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "shrewd" }, values = { "practical", "cheerful" },
  notices = { "drink", "class" },

  impression = {
    first = "He whispers about his moonshine, and whispering is most of the thrill.",
    third = "{name} met Barkeep Hann, who serves drinks at Darkshire's Scarlet Raven Tavern and keeps a jug of moonshine under the counter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Strong enough to see spirits without being a shaman, and the whispering's part of the flavour, so lean in close and try a sip!" } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'll give it a fair try, Hann, and keep your secret.", next = "BACK", reply = "Honest and quiet, that's the way, friend! Here's a wee taste, if you'll pay the copper for it.", fx = { align = { honor = 1 } } },
        { text = "I'm telling the Watch, Hann. Moonshine's nothing but trouble.", next = "BACK", reply = "Tell the Watch? They're my best customers! You'll get no moonshine, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Improve it, you say! The jug under the counter is the only thing in Darkshire that's never once disappointed anybody, and I'll not have it frozen, sparkled or made to taste of cinnamon. A Dalaran fellow tried that on his way through once, years back, and the Watch still laugh about what it did to his eyebrows." },
      },
      choices = {
        { text = "Then I'll drink it the way it's made, and wince.", next = "BACK", reply = "That's the spirit, and the only honest way to drink it. Mind your tongue on the way down.", fx = { align = { honor = 1 } } },
        { text = "A pinch of frost would hide how bad it is.", next = "BACK", reply = "Hide it? I'd sooner hide my mother. Out you go.", fx = { align = { honor = -1 } } },
        { text = "Something else, Hann.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Steady? No, friend, it does the opposite, but it makes you care a good deal less about the shaking. The Watch swear by a nip before a patrol, though I'd not tell the Commander that." } },
      choices = {
        { text = "I'll fight sober. The dead deserve a clear eye.", next = "BACK", reply = "Then you'll be the only sober one out there, and the dead will thank you. Mind yourself.", fx = { align = { order = 1 } } },
        { text = "Pour me one, Hann. I'll take my courage where I find it.", next = "BACK", reply = "That's the spirit! Silver on the counter, and I'll pour it quick.", fx = { align = { order = -1 } } },
        { text = "Something else, Hann.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not me, I'm drink and drink only, but Grual in the kitchen will take a good haunch off your hands. Most of what runs out there now isn't fit to eat, though, so bring him something that was healthy when you shot it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can have the water bowl, {class}, but not the jug. I tried that once with a stray dog and it never walked straight again." },
      },
      choices = {
        { text = "I'll hunt only the clean game. Grual's customers deserve it.", next = "BACK", reply = "That's sense, and Grual will thank you for it. The rot's been bad this year.", fx = { align = { honor = 1 } } },
        { text = "Meat is meat. Grual can cook the rot out.", next = "BACK", reply = "He can't, friend, and he'll tell you so with a ladle. Bring him something clean.", fx = { align = { honor = -1 } } },
        { text = "Something else, Hann.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Hush! Smugglers is a word the Night Watch can hear through walls, friend. Keep it between us, and if you want a bottle, you'll buy it like everyone else, with silver and a wink." } },
      choices = {
        { text = "Silver and a wink, then. Fair dealing.", next = "BACK", reply = "That's the way of it, and I'll pour with pleasure. Not a word to the Watch.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Smugglers pay better than winks, Hann.", next = "BACK", reply = "They do, friend, but I'm a barkeep, not a smuggler. Silver and a wink, as I said.", fx = { align = { honor = -1 } } },
        { text = "Where does the moonshine come from?", next = "moonshine_where" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Ha! I'll put that on a sign, if Althea lets me. Mind you don't drink it near a candle, because I've seen a man lose his eyebrows and he didn't even have your sort of help." } },
      choices = {
        { text = "I'll keep my fire out of your bottles.", next = "BACK", reply = "Thank you, friend, and so do the bottles. They've enough fire in them already.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A little extra fire never hurt moonshine.", next = "BACK", reply = "It never hurt the moonshine, but it hurt the drinker plenty. No strange fires in my jugs, please.", fx = { align = { light = -1 } } },
        { text = "Who drinks here?", next = "regulars" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It keeps them warm, and some nights warm is the same as standing. The Commander would rather I didn't sell it to them, but she's never once sent a bottle back." } },
      choices = {
        { text = "A watcher on duty should be sober, Hann.", next = "BACK", reply = "They should be, and they're not, and I'll not be the one to tell them. Sorry, paladin.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them drink. They've earned it, out there.", next = "BACK", reply = "They have, and I'll keep pouring. Somebody has to keep them warm.", fx = { align = { order = -1 } } },
        { text = "Something else, Hann.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Corn from the Yorgen farm, from before the dead came, and a little something I won't name in case the Watch is listening. It'll strip the bark off a tree, so mind you don't spill it near your friends outside." } },
      choices = {
        { text = "Pour it out. Darkshire needs clear heads at night.", next = "BACK", reply = "Pour it out? I'd sooner pour out my own blood. Clear heads are overrated.", fx = { align = { order = 1 } } },
        { text = "Sell it openly, Hann. The Watch has worse to worry about.", next = "BACK", reply = "Openly? Then it'd lose all its charm, friend. Half the joy is the whispering.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_eliza_hann", when = { killed = { name = "Eliza" } },
          text = "Word in the corner is that the Embalmer's bride won't be rising from her grave again, and somebody had to put her back in it. Have a nip of the moonshine, quietly, because a deed like that deserves something strong." },

        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I'll pour you spring water and say nothing, though the jug under the counter is there if the Light ever looks away." },
        { id = "h_default", text = "Hann's the name, and drink's the trade. Milk, juice, spring water for the careful folk, and for everyone else, there's the jug under the counter." },
        { id = "h_dry_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dry Times") },
          text = "A bottle of moonshine for Lakeshire, is it? Daniels has good taste and a long road between him and his order, so pay up and I'll wrap it in a rag so it won't clink." },
        { id = "h_dry_done", when = { questDone = TODO_QUEST("Dry Times") },
          text = "I hear my moonshine's sitting on a shelf in Lakeshire now. That's the furthest a bottle of mine has travelled, and I've half a mind to feel proud." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll be wanting something from under the counter, then; nobody fights the dead in this wood on spring water." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've a jug of juice for you and a bowl of water for the beast, and if either of you wants something stronger, ask quietly." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Now, I'd wager your folk know a thing or two about what berries do when you leave them in a jar, eh?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Don't go chilling my moonshine with your tricks, it's meant to be drunk warm and regretted cold." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Lean in, because my moonshine might wake your spirits up, and don't tell the Watch." },
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
        { text = "A priest probably shouldn't be buying moonshine.", next = "priest", when = { class = "PRIEST" } },
        { text = "I know a few smugglers who'd love your moonshine.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "They say your moonshine steadies a warrior's hand, Hann.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you buy game for the bar, Hann.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your moonshine is the only thing here that burns hotter than me.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does your moonshine keep the Night Watch on their feet, Hann?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What goes into that jug under the counter, Hann?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a mage improve your moonshine, Hann?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your moonshine smells strong enough to strip paint, Hann.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "A drunk watcher gets people killed.", next = "BACK", reply = "Maybe, maybe, but a sober watcher doesn't sleep at all. I'll keep pouring.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Let them drink. They've earned it.", next = "BACK", reply = "Ha! A watcher's friend, I see. Pull up a stool and I'll pour you one.", fx = { align = { order = -1 }, affinity = 2 } },
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
    raven_hill = { { id = "tp_raven_hill", text = "Three different men have told me at this bar that they saw their grandfathers walking at Raven Hill. I pour them another and don't ask questions." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay rum is the only thing stronger than our moonshine, and I keep a bottle for medicinal purposes, mine mostly." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire never comes to Duskwood, so I tell my customers this bar is the Faire, with fewer jugglers and more crying." } },
    dark_riders = { { id = "tp_dark_riders", text = "Nobody talks about the riders in here above a whisper, and nobody sits by the window when they do. Ask someone else, friend, and ask them outside." } },
  },
}

P:NPC {
  key = "alyssa", id = TODO_NPC("Alyssa Eva"), name = "Alyssa Eva",
  bible = "bibles/darkshire_more.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "warm" }, values = { "practical", "loyal" },
  notices = { "class", "arcane" },

  impression = {
    first = "She thinks fate is mostly a matter of good locks.",
    third = "{name} met Alyssa Eva, Madame Eva's granddaughter, who sells reagents in Darkshire.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I roll my eyes at every warning, but I love her. Your spirits might agree with her more than I do." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Love her and listen. That's honest, Alyssa.", next = "BACK", reply = "That's what I try to do, mostly. She's right sometimes, which is the annoying part.", fx = { align = { honor = 1 } } },
        { text = "Ignore her warnings and buy a better lock.", next = "BACK", reply = "That's what I tell her, and she laughs at me. Good locks never fail me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The good ones do, and I bought the good ones after a quiet sort like you walked off with a box of Gran's best candles last spring. Gran's cards said it would happen, which is the kind of thing she says after it's happened, but I'd still rather you used the door like everyone else." },
      },
      choices = {
        { text = "I'll use the door, Alyssa, and pay for what I take.", next = "BACK", reply = "Thank you, and I'll believe you, mostly. The candles are back on the shelf.", fx = { align = { honor = 1 } } },
        { text = "Good locks only tell me where the good things are.", next = "BACK", reply = "Then you're exactly the kind of customer Gran warned me about. I'll check them twice tonight.", fx = { align = { honor = -1 } } },
        { text = "Something else, Alyssa.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not much, I'm afraid, unless you want a candle for your bedside so you can see what's coming through the window. Gran insists warriors need fortune most of all, but I think they mostly need a good lock and a better shield." } },
      choices = {
        { text = "Then I'll trust my shield and leave fortune to your gran.", next = "BACK", reply = "That's my thinking, and Gran will be scandalised. I'll not tell her.", fx = { align = { honor = 1 } } },
        { text = "I'll take a reading. A warrior should know what's coming.", next = "BACK", reply = "Then you'll make her day, and I'll never hear the end of it. She's just up the stairs.", fx = { align = { honor = -1 } } },
        { text = "Something else, Alyssa.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not much, I'm afraid, because my shelves are mostly for mages and priests. If you need arrows, though, the fletchers in Lakeshire do good work, and the road there is only half as bad as the one to anywhere else." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not much, I'm afraid, because my shelves are mostly for mages and priests, so try the fletchers in Lakeshire for arrows. And your {pet} is sniffing my reagents, {class}, which I'd rather it didn't, because some of those powders make beasts sneeze fire." },
      },
      choices = {
        { text = "I'll keep it outside. Your shop isn't a kennel.", next = "BACK", reply = "Thank you, and the candles will stay unchewed. It's a small shop.", fx = { align = { honor = 1 } } },
        { text = "It goes where I go. You'll get used to it.", next = "BACK", reply = "Then I'll get used to it, and I'll move the candles higher. Mind the shelves.", fx = { align = { honor = -1 } } },
        { text = "Something else, Alyssa.", next = "BACK" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "They would, and I'll sell them to you, though Grandmother will turn up a card about it before you've reached the door. Fate's mostly a matter of good locks, I tell her, and so far nobody's broken mine." } },
      choices = {
        { text = "Good locks keep bad things out. Keep yours.", next = "BACK", reply = "That's what I tell Gran, and it's nice to hear someone agree. I'll keep mine.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some locks are meant to be opened.", next = "BACK", reply = "Not mine, they aren't. Gran's cards will have something to say about you.", fx = { align = { light = -1 } } },
        { text = "What do your grandmother's cards say?", next = "cards" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "For prayer, for wards, for reading the cards, and for plain old lighting the room, since a candle never asks what it's for. The Night Watch buys the most, though, and they never say a word over them." } },
      choices = {
        { text = "Then I'll say a word over a few of them.", next = "BACK", reply = "That'd be lovely, and the Watch would never know. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A candle's a candle. Prayer won't make it burn longer.", next = "BACK", reply = "No, but it makes the room feel warmer. Gran would disagree with you.", fx = { align = { light = -1 } } },
        { text = "Something else, Alyssa.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Constantly, and I don't blame them, but Gran's never cursed a soul, whatever people say. She reads cards and frightens people into staying indoors, and in Duskwood, frightening people indoors is a mercy." } },
      choices = {
        { text = "The Church should look into her trade, all the same.", next = "BACK", reply = "Let them look, then, and they'll find an old woman with cards. She'll make them stay indoors too.", fx = { align = { order = 1 } } },
        { text = "Her cards are her own business, Alyssa.", next = "BACK", reply = "That's what I say, and thank you for saying it. She means no harm.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Alyssa.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Mostly mages and the Watch, but I keep maple seeds and wild thornroot for the odd druid who drifts through, since your lot go through a pouch of them every time the wolves come close. Grandmother says that means one of you is coming soon, which is what she says about everything." } },
      choices = {
        { text = "Fate is real, Alyssa. Heed your grandmother's cards.", next = "BACK", reply = "Oh, don't encourage her, please. She'll be impossible tonight.", fx = { align = { order = 1 } } },
        { text = "You're right to doubt. We make our own fate.", next = "BACK", reply = "That's what I think, and it's nice to hear it out loud. Thank you.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Gran's cards say holy folk always arrive in pairs, so I suppose I'll be watching the door for your friend." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in a reagent shop! You'll want the candles, I suppose, since everything else in here makes your sort frown." },
        { id = "h_default", text = "I'm Alyssa, and yes, Madame Eva is my grandmother. She reads the cards and I sell the candles, and between us we keep half of Darkshire's spellcasters in business." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Grandmother's been odd all week, telling me to stay indoors and asking where I've been. If she's put you on one of her errands, please tell me it isn't about me." },
        { id = "h_stalvan_done", when = { questDone = TODO_QUEST("The Legend of Stalvan") },
          text = "Grandmother's stopped telling me to stay indoors. She won't say why, but she looks at me as if I'd survived something, and I'd quite like to know what." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior? Gran would say the cards foretold you, but I'll just say you look like someone who never buys a single candle." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, with a beast, in my shop full of breakable glass. Please, for the love of the Light, tell it to sit." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Grandmother will want to read your cards, and I'll warn you now that she always finds a tree in a druid's spread." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You came in so quiet the bell didn't even ring, and Gran would call that an omen. I call it a reason to oil the bell." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My grandmother would be delighted, since she reads cards and you read spirits, though I still say fate's mostly a matter of good locks." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm only counting candles, and they're not going anywhere." },
        { id = "h_again2", text = "Ask away. It's quiet, and quiet in Darkshire makes me nervous." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Being Madame Eva's granddaughter can't be easy.", next = "eva" },
        { text = "Your grandmother's cards seem to frighten half the town.", next = "cards" },
        { text = "I'd not have thought a town like this bought many reagents.", next = "trade" },
        { text = "Was her errand about you?", next = "errand", when = { questDone = TODO_QUEST("The Legend of Stalvan") } },
        { text = "Your reagents would suit my work too, Alyssa.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I don't see much here a warrior could use, Alyssa.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you sell anything for a hunter, Alyssa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do Darkshire's folk buy candles for prayer as well, Alyssa?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does your grandmother's trade trouble the faithful, Alyssa?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you sell much to druids, Alyssa, or only to mages?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your locks keep out people like me, Alyssa?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You don't seem to believe your grandmother's cards, Alyssa.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Fate is real, Alyssa. Listen to your gran.", next = "BACK", reply = "You sound like her, and that's a little frightening. I'll heed her, mostly.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Make your own fate with good locks and lamps.", next = "BACK", reply = "Exactly, and Gran will never forgive you for agreeing with me. Thank you.", fx = { align = { order = -1 }, affinity = 1 } },
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
        { text = "I doubt a candle frightens the dead much.", next = "trade_dead" },
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
        { text = "It's taken care of. You're safe now.", next = "BACK", fx = { affinity = 2 } },
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
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire once offered my grandmother a tent, and she's never forgiven them for thinking she'd work for anyone else. She calls their fortune teller a fraud, with real feeling." } },
    holy_light = { { id = "tp_holy_light", text = "Grandmother says the cards and the Light both tell the truth, only the cards are cheaper. I sell candles to both kinds of customer, so I don't argue." } },
    raven_hill = { { id = "tp_raven_hill", text = "Grave dust from Raven Hill would sell better than anything on my shelves, and I won't stock it. Grandmother calls me squeamish, and she's right." } },
  },
}

P:NPC {
  key = "herble", id = TODO_NPC("Herble Baubbletump"), name = "Herble Baubbletump",
  bible = "bibles/darkshire_more.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "chatty" }, values = { "curious", "proud" },
  notices = { "craft", "race", "lock_shards" },

  impression = {
    first = "He calls a Darkshire gnome an exile who found somewhere darker.",
    third = "{name} met Herble Baubbletump, a gnome who sells engineering and mining supplies on the hill road in Darkshire.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_default", text = "Tubes, flux, blasting powder, coal! Mind the shelf, it bites. Well, it falls, which is nearly the same." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning customer! I'll note it down; it's a rare species in these woods." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "One of us! You don't see many of us this far south, not since the city. Come in, come in, and tell me who you were apprenticed to." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! I can tell by the scorch marks. You'll want the bronze tubes, and so does everyone, so be quick about it." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "Those shards are resonating at roughly a third of an octave below middle C, and every spring in my shop has started humming along. I won't ask to open one, as that's precisely the sort of curiosity that costs a gnome his eyebrows." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We understand gears and powder, mostly, and spirits are messy. Still, anyone who comes to Darkshire must have courage, and courage I understand." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Courage and good order, Herble. They go together.", next = "BACK", reply = "They do, they do, and you've just described my workshop! Messy, but orderly.", fx = { align = { order = 1 } } },
        { text = "Messy is fine. Not everything needs gears.", next = "BACK", reply = "Oh, you sound like Finbus, and he's usually wrong. But I'll grant you a point.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I've thought about it, because an imp is really just a very small furnace with opinions, and I'd love to put one in a boiler. But every gnome I've known who tried that sort of thing ended up with no eyebrows and a very angry boiler, so I've decided to stay a coward about it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I've thought about it, and I'll admit your {pet} has me thinking again, because it's practically radiating heat and it isn't even trying. But every gnome I've known who tried that sort of thing ended up with no eyebrows and a very angry boiler, so I'll admire it from over here, thank you." },
      },
      choices = {
        { text = "Wise of you, Herble. Some things shouldn't be bolted down.", next = "BACK", reply = "That's my thinking, exactly. Eyebrows are hard to grow back.", fx = { align = { order = 1 } } },
        { text = "A furnace with opinions? Bind it properly and it obeys.", next = "BACK", reply = "Obeys, maybe, but resents it, and resentful furnaces explode. I'll stick to coal.", fx = { align = { order = -1 } } },
        { text = "Something else, Herble.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Could it? A good flash-bang will blind a ghoul for a moment, and a moment is all a sword arm like yours needs! Finbus could teach you to make one, if you've the patience to sit still for an afternoon." } },
      choices = {
        { text = "A sword's honest. I'll leave gadgets to gnomes.", next = "BACK", reply = "Honest, and slower, but I'll not argue with a sword arm. Finbus will sulk, mind; he's been itching to test the new batch.", fx = { align = { honor = 1 } } },
        { text = "If it wins the fight, I'll try any trick you've got.", next = "BACK", reply = "That's the spirit! A flash-bang and a sword arm, and the ghouls won't know which way to shamble, so ask Finbus about the recipe.", fx = { align = { honor = -1 } } },
        { text = "Something else, Herble.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scopes, mostly, and good dwarven ones, though Finbus would argue gnomish lenses are better, and Finbus is wrong. A scope that lets you see a worg before it sees you is worth every copper in this dark wood." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Scopes, mostly, and good dwarven ones, because a scope that shows you a worg before it sees you is worth every copper. That {pet} has got its nose in my crate of springs, {class}, and if it swallows one I'll want it back, if you follow." },
      },
      choices = {
        { text = "I'll trust my eyes. A scope's a crutch.", next = "BACK", reply = "A crutch that keeps you alive is still a fine crutch, friend. Suit yourself, but the worgs see in the dark and you don't.", fx = { align = { honor = 1 } } },
        { text = "Give me the best scope you have. Every edge counts.", next = "BACK", reply = "Now you're talking! Dwarven, of course, whatever Finbus says.", fx = { align = { honor = -1 } } },
        { text = "Something else, Herble.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Oh, I know they would, and I know which alley, because half my stock passed through it on the way here. But I'm a respectable exile now, and respectable exiles sell at the front door." } },
      choices = {
        { text = "Respectable it is, Herble. I'll use the front door.", next = "BACK", reply = "That's the spirit, and the front door's a lovely door. Welcome in.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Back alleys pay better, Herble.", next = "BACK", reply = "They do, but they also pay in knives. Front door, please.", fx = { align = { honor = -1 } } },
        { text = "Why Darkshire, of all places?", next = "why" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "We agree on one thing, which is that the other lot will blow something up, and we're both usually right. I'll sell you a fuse if you promise not to light it with your finger." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Another gnome who chose spells over spanners! My mother would have despaired of you, and she despaired of me too, so we've that in common already. Promise you won't light my fuses with your fingertip." },
      },
      choices = {
        { text = "Precise work and careful fuses. Agreed.", next = "BACK", reply = "Agreed, and you'll be the first mage who's kept that promise. Mind the fuse.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Lighting things with my finger is half the fun.", next = "BACK", reply = "Then you'll be the first mage I bury, friend. Mind the fuse anyway.", fx = { align = { order = -1 } } },
        { text = "Tell me about Gnomeregan.", next = "gnomeregan" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "We have a few, and good ones, though most of my folk would rather tinker with a problem than pray over it. I've been praying over a cracked bronze tube all week, for what it's worth, and the crack's grown two millimetres." } },
      choices = {
        { text = "Prayer and tinkering can work together, Herble.", next = "BACK", reply = "That's what I keep hoping, and the tube keeps disagreeing. Thank you, though.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep tinkering. Prayer won't fix a cracked tube.", next = "BACK", reply = "You're right, and I'll keep at it. Prayer and a wrench, maybe.", fx = { align = { light = -1 } } },
        { text = "Something else, Herble.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I've a lamp that never goes out and a flare that lights half the wood, and neither one has blown up in at least a week. The trouble's parts, since everything I need comes down the road from Stormwind and a good third of it never arrives, by my count." } },
      choices = {
        { text = "Test them properly before the Watch carries one.", next = "BACK", reply = "I will, I will, and they'll be as safe as houses, or at least as safe as houses in Duskwood, which I admit isn't saying much.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hand the Watch your flares now. We'll learn as we go.", next = "BACK", reply = "That's the gnomish spirit! I'll hand them out tomorrow, and we'll see what happens.", fx = { align = { order = -1 } } },
        { text = "Something else, Herble.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only when Finbus forgets to bank the forge, and then it's mostly the shed that suffers. I'll admit Gnomeregan didn't do the hills around it any favours, though, so I understand why your people look at a smokestack the way they do." } },
      choices = {
        { text = "Machines need rules. Build with care for the land.", next = "BACK", reply = "They do, and I'll try, though Finbus never banks the forge. Thank you for saying so.", fx = { align = { order = 1 } } },
        { text = "Invent freely. The land recovers, given time.", next = "BACK", reply = "That's what I've always said, and Gnomeregan proves it, mostly. Or disproves it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I'm told prayer works wonders, but I've never managed to fit one into a gadget, and believe me, I've tried." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! All that armour, and not a single gear in it, which is a crime I could fix in an afternoon." },
        { id = "h_default", text = "Herble Baubbletump, purveyor of engineering and mining supplies to the gloomiest town south of the mountains. Finbus teaches the craft down the hall, and I sell the bits he's always running short of." },
        { id = "h_stars", when = { questActive = TODO_QUEST("Look To The Stars") },
          text = "You're after a bronze tube for that stargazer, Viktori? I've a couple left, though they're dear, and I'll give you my opinion of his telescope free of charge." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, eh? Big, strong, likely to hit things, and I sell parts for gadgets that don't need any of that, so you're in the wrong house!" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now, a gnome who sells gun parts likes a hunter, because hunters like guns, and guns like parts!" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Your people and mine haven't much in common, I'd guess, except that we've both lost a home lately and ended up somewhere damp." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh, hello! I don't suppose that little red fellow of yours could tell me why it smells of burnt gears whenever it's near my shop?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman in Darkshire! I'm an exile from Gnomeregan who found somewhere even darker, and I'd guess you've wandered a long way from home too." },
      },
      again = {
        { id = "h_again", text = "What else? I've three conversations going in my head already, so one more won't hurt." },
        { id = "h_again2", text = "Ask, ask! I've one eye on the stars tonight, but the other's all yours." },
      },
      choices = {
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "What's a gnome doing in Darkshire?", next = "why" },
        { text = "Who buys your tubes, out here?", next = "viktori" },
        { text = "You must miss Gnomeregan.", next = "gnomeregan" },
        { text = "I do a bit of mining. What sells here?", next = "mining", when = { profession = "Mining" } },
        { text = "Your parts would sell well in Stormwind's back alleys.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Mages and engineers rarely agree, I've found.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could an engineer's gadget help a warrior in this wood, Herble?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you sell parts for a hunter's rifle, Herble?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the gnomes of Gnomeregan keep priests, Herble?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could your gadgets help hold Darkshire against the dead?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your machines can't be good for the forest, Herble.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Has an engineer ever harnessed something with horns, Herble?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I doubt gnomes would understand shamanism, Herble.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll mind the shelf on my way out. Goodbye.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Well, the city fell, so we all had to be somewhere, and Ironforge was full of cousins. Darkshire has metal on the hills, engineers who need parts, and fog thick enough that nobody notices when something explodes." },
      },
      choices = {
        { text = "Something in this town seems to explode fairly often.", next = "why_boom" },
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
        { id = "v_default", text = "That's Viktori, the stargazer up the hill, a lovely fellow with terrible optics. He wants to look at the stars through the thickest fog in the kingdom, and I keep telling him that a tube can't see through weather, but he buys the tubes anyway, so I've stopped telling him." },
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
        { text = "Gnomeregan should be retaken. It's your home.", next = "BACK", reply = "Retaken, yes, someday, when we've enough of us left to do it. I'll be first through the gates, or second.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Build anew. Old homes become graves.", next = "BACK", reply = "Graves, aye, and Thermaplugg's sitting on mine. Maybe you're right; Darkshire's dark, but it's mine now.", fx = { align = { order = -1 } } },
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
    gnomeregan = { { id = "tp_gnomeregan", text = "My city, my workshop, my favourite chair, and all of it under the mountain with that traitor Thermaplugg's mess.", next = "gnomeregan" } },
    _none = { { id = "tp_none", text = "Fascinating question, and I know nothing whatsoever about it." } },
    magni = { { id = "tp_magni", text = "King Magni gave us gnomes a roof after Gnomeregan fell, and I'll always be grateful, but there's only so much rock a gnome can stare at. I came to Darkshire for a change of scenery, and I certainly got one." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire has a gnome who builds clockwork toys, and I've studied his work from a careful distance. It's very good, and I hate him a little for it." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are stirring in Khaz Modan again, I hear, and Ironforge is very nervous about it. Darkshire has its own troubles, so I sleep better here, in a manner of speaking." } },
  },
}

P:NPC {
  key = "farrin", id = TODO_NPC("Farrin Daris"), name = "Farrin Daris",
  bible = "bibles/darkshire_more.md", role = "citizen", tier = "service",
  communities = { "darkshire" }, temper = { "anxious" }, values = { "loving", "cautious" },
  notices = { "soldier", "weary", "lock_soulstone" },

  impression = {
    first = "He can't visit his father's grave anymore, and it's eating him alive.",
    third = "{name} met Farrin Daris, a worried Darkshire lodger who can no longer visit his father's grave.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
    { id = "g_default", text = "Has anyone come yet, anyone at all? The dead walk the roads, and still nobody lifts a finger to stop them." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. I don't suppose you've brought any news, because nobody ever does." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Don't stand near the window. Something bad is on its way here, I can feel it, and I don't want it seeing us through the glass." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { tabard = true },
      text = "You're wearing colours! Are you from Stormwind, and has Stormwind finally sent soldiers, or is it only you?" },
    { id = "n_weary", cat = "weary", when = { deathsHere = { min = 1 } },
      text = "You've been out there and come back looking worse. That's what happens, and that's why I stay in." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Someone's tied your soul to a stone so you can come back if you fall, and out here, where the dead get up on their own, I'm not sure that comforts me. Mind you come back as yourself, if it comes to it." },
  },

  start = "hello",
  nodes = {
    dd_farrin_s = {
      lines = {
        { id = "dd_farrin_s_a", text = "Then I'll ask you plainly, because nobody else will tell me: is his grave still whole? My father was laid in the east corner by the old oak, and every night I dream it's empty." },
      },
      choices = {
        { text = "I didn't see an empty grave by the oak.", next = "dd_farrin_s2", fx = { align = { light = 1 } } },
        { text = "I won't lie to you. Many graves there are empty.", next = "dd_farrin_s2", fx = { align = { light = -1, honor = 1 } } },
      },
    },
    dd_farrin_s2 = {
      lines = {
        { id = "dd_farrin_s2a", text = "Either way, you've given me more than the guards ever did, which is an answer. I'll go out with the Watch next week and see for myself, and I'll bring flowers, whatever I find." },
      },
      choices = { { text = "I hope you find peace there. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The dead walk there now, so I pace and wait. If your spirits could tell my father I'm still here, it'd be something." } },
      choices = {
        { text = "I'll help you visit him, Farrin. Honour matters.", next = "BACK", reply = "Would you? Then I'll walk with you, as far as my legs will go. Thank you.", fx = { align = { honor = 1 } } },
        { text = "The dead are dead. Let your father rest.", next = "BACK", reply = "Rest? He can't, not with the dead walking round him. That's the whole trouble.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'm afraid of most things lately, so you're in good company, but I'll tell you plainly what frightens me most. Somebody is raising the dead out there, and you're the first person I've met who might understand how, which makes me wonder whether you'd stop it or take notes." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'm afraid of most things lately, so you're in good company, though that creature at your side is doing nothing to help. Somebody is raising the dead out there, and you're the first person I've met who might understand how, which makes me wonder whether you'd stop it or take notes." },
      },
      choices = {
        { text = "I'd stop it, Farrin. Raising your father isn't my work.", next = "BACK", reply = "Then you're the first I've trusted with it. Thank you, truly.", fx = { align = { light = 1 } } },
        { text = "Both. It's worth knowing how it's done.", next = "BACK", reply = "Both? Then I'll not ask you to help me. Good night to you.", fx = { align = { light = -1 } } },
        { text = "Something else, Farrin.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the dead are walking the Raven Hill cemetery, and every time I go near, something with my neighbour's face comes shambling out. I don't want to fight them, I only want to stand at the stone and say what I never got to say." } },
      choices = {
        { text = "I'll clear the gardens. Your father deserves a visit.", next = "BACK", reply = "You'd do that? Then I'll be ready, whenever you say. Thank you.", fx = { align = { light = 1 } } },
        { text = "The dead are everywhere. Grieve from here, Farrin.", next = "BACK", reply = "From here? I've tried, and it doesn't work. I'll keep pacing.", fx = { align = { light = -1 } } },
        { text = "Something else, Farrin.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Wolves, as big as ponies some of them, and spiders that hang in the trees by the cemetery. My father used to walk this wood to fish the Darkened Bank, and now I can't walk to the end of the street." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Wolves as big as ponies, some of them, and spiders that hang in the trees by the cemetery. Your {pet} would see the dead coming before they reached you, {class}; I'd buy a dog myself, but there's none left in Darkshire." },
      },
      choices = {
        { text = "I'll clear the way to the cemetery for you.", next = "BACK", reply = "Then I'll be in your debt for the rest of my life. Thank you.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt the wolves. You'll have to brave the dead yourself.", next = "BACK", reply = "I'll try, I will, but my legs aren't brave. Thank you anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else, Farrin.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Would you? I can't ask it, not with ghouls walking the Raven Hill paths, but I can't stop thinking about the stone. If you go, just tell me whether it's still standing." } },
      choices = {
        { text = "I'll look, and touch nothing.", next = "BACK", reply = "Thank you, and tell me whether it's still standing. That's all I want.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The dead won't miss a trinket or two.", next = "BACK", reply = "Then I'll not tell you where it is. Leave him be.", fx = { align = { honor = -1 } } },
        { text = "Where is your father buried?", next = "grave" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Would it? The Watch keeps telling me lamps don't scare ghouls, and Stormwind keeps sending no guards at all. If you can do what they won't, then at least somebody in this town will have tried." } },
      choices = {
        { text = "You should petition the watch properly for an escort.", next = "BACK", reply = "I have, again and again, and the Watch has no men. I'll ask again.", fx = { align = { order = 1 } } },
        { text = "Forget the guards, Farrin. Waiting is killing you.", next = "BACK", reply = "It is, and you're right, and I'm still afraid. I'll try.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Who should be guarding the graves?", next = "guards" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'd like it more than I can say, and I'd like to be standing there when you do, though I don't know that my legs would carry me. If you go, tell me after whether it's still tidy, because he was always a tidy man." } },
      choices = {
        { text = "I'll go, and I'll tell you how it looks.", next = "BACK", reply = "Thank you, and tell me everything. He'd like to know someone visited.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need prayers, Farrin. You need courage.", next = "BACK", reply = "I know it, and I'm working on it. Your words will help, maybe.", fx = { align = { light = -1 } } },
        { text = "Something else, Farrin.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I've asked myself that every night since you walked in, and the answer keeps changing. With you beside me, perhaps, but I'd want to go in daylight, if Duskwood still has any." } },
      choices = {
        { text = "In daylight, then. I'll come back for you.", next = "BACK", reply = "Then I'll wait, and I'll have my good coat brushed. He always liked that coat.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If you won't walk alone, you'll never really walk.", next = "BACK", reply = "You're right, and I hate that you're right. I'll try.", fx = { align = { honor = -1 } } },
        { text = "Something else, Farrin.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I don't know, and that's what eats at me, because the last time I went the earth one row over had been turned from beneath. I planted a rowan at his head when we buried him, so if the tree's still standing, I'll take that as a sign." } },
      choices = {
        { text = "I'll look for the rowan and tell you exactly what I find.", next = "BACK", reply = "Thank you, and tell me the truth, whatever it is. I'd rather know.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Better not to know. Let him and the question rest.", next = "BACK", reply = "Maybe, but I'll keep wondering. I can't help it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_skel_farrin", tags = { "news" }, when = { killed = { name = "Skeletal", min = 30 } },
          text = "They say someone's been breaking up the skeletons around Raven Hill, and that it's you. If that's true, I might be able to stand at my father's grave again before the summer's out, and I can't tell you what that means." },

        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My father's grave hasn't had a prayer said over it since the dead started walking, and I've been too frightened to go myself." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. They say the dead give way when your kind walk among them, and I've always wanted to see that, from a safe distance." },
        { id = "h_default", text = "Farrin Daris. I've a room here at the Raven, and I walk from it to this table and back, because there's nowhere else in Darkshire a man can safely walk anymore, not even to my father's grave." },
        { id = "h_watch_done", when = { questDone = TODO_QUEST("The Night Watch") },
          text = "They say someone cleared the cemetery for the Watch. I thought about going to see my father, and then I didn't, but I thought about it, which is more than last month." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. If you're half what you look like, you could walk me to my father's grave and back, and I'd owe you more than I could ever pay." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll have seen the woods, then, and you'll know there's nothing out there a man like me can face alone." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Your people speak to the land, I've heard, so perhaps you'd know whether the dead in it, my father among them, are resting or not." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've a cold about you, stranger, and I've felt enough of that walking past the cemetery." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Can your spirits visit my father's grave? I can't, and Stormwind's guards haven't come." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm not going anywhere, and I never am these days." },
        { id = "h_again2", text = "Go on, I'd welcome the distraction." },
      },
      choices = {
        { text = "I've been clearing the dead around Raven Hill.", next = "dd_farrin_s", when = { killed = { name = "Skeletal", min = 30 } } },

        { text = "Why can't you go out?", next = "grave" },
        { text = "Why haven't Stormwind's guards come?", next = "guards" },
        { text = "You talk as if something's coming.", next = "dark" },
        { text = "I could walk you to the cemetery.", next = "escort", when = { minLevel = 25 } },
        { text = "I could slip past the dead to your father's grave.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A light spell would hold the dead back from the graves.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why can't you reach your father's grave, Farrin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's out there besides the dead, Farrin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would you like me to pray at your father's grave, Farrin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you walk out with me, if I kept the dead off you?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you know if your father's grave is still whole?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You seem afraid of what I am, Farrin.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Something keeps you from your father's grave, Farrin.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Stormwind will come. Keep faith in the crown.", next = "BACK", reply = "I'll try, though it's hard. Thank you for the hope.", fx = { align = { order = 1 } } },
        { text = "Stormwind's forgotten you. Darkshire must save itself.", next = "BACK", reply = "Then I'll pace, and wait, and maybe I'll learn to fight. Thank you.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Someone ought to write to Stormwind about this.", next = "guards_letters" },
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
    raven_hill = { { id = "tp_raven_hill", text = "My father's buried at Raven Hill, and I can't get to him for the dead walking the rows. I'd only like to lay some flowers, that's all." } },
    scourge = { { id = "tp_scourge", text = "They say in Lordaeron the dead get up and walk away from their graves for good. Here they get up and stay, which is worse, if you've somebody buried there." } },
    holy_light = { { id = "tp_holy_light", text = "I pray to the Light for my father every night, and I hope he's resting, wherever the rest of him is." } },
  },
}

P:NPC {
  key = "steven_black", id = TODO_NPC("Steven Black"), name = "Steven Black",
  bible = "bibles/darkshire_more.md", role = "stablemaster", tier = "service",
  communities = { "darkshire" }, temper = { "calm" }, values = { "practical", "gentle" },
  notices = { "pet", "animal" },

  impression = {
    first = "Animals settle when he speaks, which I suspect is why he does.",
    third = "{name} met Steven Black, Darkshire's stable master, who keeps travellers' animals safe from the woods.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
    { id = "g_default", text = "Easy, easy. Not you; the horse. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for your companion? They ate well, and slept badly, like everyone here." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} keeps looking at the trees. Good instincts; I'd trust them over most people's in this town." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They fear what's in it, and I keep them calm with my voice. Your spirits might help them sleep." } },
      choices = {
        { text = "Then keep them calm and safe, Steven.", next = "BACK", reply = "I will, and they'll be glad of it. Good night.", fx = { align = { order = 1 } } },
        { text = "Beasts fear what they should. Let them.", next = "BACK", reply = "They do, and I'll calm them anyway. It's what I'm for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They mind the flash and the crackle, but they get over it, which is more than they ever do with the howling from the woods. What they really hate is a rider who's frightened, so if you're going to light a fire in your hand on the road to Raven Hill, at least don't look surprised when you do it." },
      },
      choices = {
        { text = "I'll keep calm on the road and spare the horses.", next = "BACK", reply = "That's all I ask, and the horses will thank you. Keep your face calm.", fx = { align = { order = 1 } } },
        { text = "If a horse can't stand a spark, it's no use here.", next = "BACK", reply = "Then they'd all be useless, friend, and you'd be walking. Mind your sparks.", fx = { align = { order = -1 } } },
        { text = "Something else, Steven.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They fare as well as their riders, which is to say badly. A horse can smell a worg before you can see it, and if you'd listen to your mount instead of spurring it on, you'd both live longer." } },
      choices = {
        { text = "I'll listen to my mount. It's earned that much.", next = "BACK", reply = "Good, and you'll both come home. That's the way of it.", fx = { align = { honor = 1 } } },
        { text = "A horse goes where it's pointed. That's its job.", next = "BACK", reply = "It is, until it throws you in a ditch. Listen to it, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else, Steven.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "They do, and they leave the same way, full, because a stablemaster who steals soon has an empty stable. The beasts know who's honest, and they'd tell me if they could." } },
      choices = {
        { text = "Honest hands for honest beasts.", next = "BACK", reply = "That's it exactly, and the beasts will know you. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Beasts can't talk, Steven. Lucky for some.", next = "BACK", reply = "They can't, but they remember. Mind that.", fx = { align = { honor = -1 } } },
        { text = "Do the beasts talk to you?", next = "beasts_talk" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "No, they don't, and I'll ask you to stand by the gate, because the grey mare's already pulling at her rope. It isn't personal, friend; they smell the woods on you, and something worse under it." } },
      choices = {
        { text = "I'll stay by the gate. They've suffered enough.", next = "BACK", reply = "Thank you, and the grey mare thanks you. They'll calm in time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear's a good teacher, even for horses.", next = "BACK", reply = "It is, and they've learned enough already. By the gate, please.", fx = { align = { light = -1 } } },
        { text = "What spooks them most?", next = "wolves" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They know before I do, every time, and they go quiet in a way I don't like. The horses turn their heads toward the cemetery road at dusk, and I've learned to bar the doors when they do." } },
      choices = {
        { text = "Then let me say a blessing over your stable.", next = "BACK", reply = "That'd be welcome, and the horses might settle for it. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts are skittish, Steven. Don't read omens into it.", next = "BACK", reply = "Maybe, but they're right more often than I'd like. I'll keep the doors barred.", fx = { align = { light = -1 } } },
        { text = "Something else, Steven.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It'll carry you, but it won't like it, and a frightened horse throws its rider at the worst moment. Walk the dark stretches and ride the road, and keep a firm hand on the reins when the wolves start." } },
      choices = {
        { text = "I'll walk the dark stretches, then. Better safe.", next = "BACK", reply = "That's wise, and your horse will thank you. Firm on the reins.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ride hard and trust my horse to keep up.", next = "BACK", reply = "Then hold on tight, friend, because the horse will decide for you. Good luck.", fx = { align = { order = -1 } } },
        { text = "Something else, Steven.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They smell the worgen long before we hear them, and they go stiff at the dead in a way they never do for wolves. The worst nights are when they go stiff and nothing comes, because then I don't know what they smelled." } },
      choices = {
        { text = "Keep them drilled and calm. Fear spreads through a stable.", next = "BACK", reply = "I'll do my best, though fear spreads faster than calm. Thank you.", fx = { align = { order = 1 } } },
        { text = "Trust their senses over your own. They know this wood.", next = "BACK", reply = "That's what I do, and they've kept me alive. Thank you for understanding.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The animals settle a little when your sort walk through, and I've never worked out why." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your horse will be a well-bred sort, I'd guess, and well-bred horses hate this wood worst of all, because they can smell the graves." },
        { id = "h_default", text = "Steven Black, stable master. I keep your animals behind a stout fence and well away from the trees, which is more than I can do for the people." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Your horse will thank me for the rest, I'd wager, since I doubt you ever let it stop long enough to drink." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The horses went to the back of their stalls when you came in, and the gryphons stretched their necks, so I'll let them argue about you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Steady, now, and no flashes near the stalls, because the horses spook easy enough in this wood without help." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The beasts are calm around you; that's good. Keep them away from the treeline." },
      },
      again = {
        { id = "h_again", text = "Anything else? The feed won't fork itself." },
      },
      choices = {
        { text = "I need the stables.", next = "BUSINESS" },
        { text = "The animals here look as nervous as the people.", next = "beasts" },
        { text = "You must hear the wolves every night out here.", next = "wolves" },
        { text = "Who else leaves animals with you?", next = "customers" },
        { text = "Can {pet} stay with you while I'm in the woods?", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Travellers' saddlebags must pass through your hands, Steven.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors' mounts fare well in this wood, Steven?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Your animals don't like me.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'd wager the animals sense the dead before we do, Steven.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will a horse carry me through Duskwood at night, Steven?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do your animals sense in these woods that people don't?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Your animals seem uneasy around magic, Steven.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The beasts here seem to fear the forest itself, Steven.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },

    beasts = {
      lines = {
        { id = "b_default", text = "They take it badly. Horses won't settle in the fog, and a hunter's cat will pace the pen all night with its ears back. I sit up with the worst of them and talk until they stop shaking." },
      },
      choices = {
        { text = "What do you talk about?", next = "beasts_talk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_talk = {
      lines = {
        { id = "bt_default", text = "Nothing at all, just the sound of it, steady and low. It works on beasts, and on me too, most nights." },
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
        { id = "cr_default", text = "All of them, right at the edge of the pass, and they have to be led on foot. I've never once seen a horse wrong about a road, so I'd take it as advice." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wolves = {
      big = true,
      lines = {
        { id = "w_default", text = "Every night, and some of them aren't wolves. A hunter came through last month and said he'd shoot every beast in the woods if they paid him, and I didn't know whether to cheer or weep." },
      },
      choices = {
        { text = "Some beasts must die so the town can live.", next = "BACK", reply = "Maybe, but I'll not cheer it. Some of those beasts were friends once.", fx = { align = { order = 1 } } },
        { text = "The wolves aren't to blame. Something's twisting them.", next = "BACK", reply = "That's what I think too, and it's good to hear someone else say it. Thank you.", fx = { align = { order = -1 }, affinity = 1 } },
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
    dark_riders = { { id = "tp_dark_riders", text = "Their horses aren't right, friend; I've seen them pass, and every animal in my stable kicked its stall. No living horse makes mine do that." } },
    raven_hill = { { id = "tp_raven_hill", text = "My horses won't take the west road past Raven Hill, not for oats and not for the whip. I've learned to trust them." } },
    wildhammer = { { id = "tp_wildhammer", text = "I've heard the Wildhammer up in the Hinterlands keep gryphons the way I keep horses, and I'd give a week's wages to see their stables. Felicia, who keeps the gryphons here, says they have worse tempers than any horse." } },
  },
}
