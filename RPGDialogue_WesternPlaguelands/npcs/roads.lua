-- Between the towns: a hag on Sorrow Hill, and a very strange gnome in Andorhal. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "myranda", id = TODO_NPC("Myranda the Hag"), name = "Myranda the Hag",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "sorrow_hill" }, temper = { "sly" }, values = { "cunning", "proud" },
  notices = { "class" },
  impression = {
    first = "Myranda the Hag keeps a hovel on Sorrow Hill and a smile she does not mean. She learned her first spells from the Scarlet Crusade's priests, and now she uses what they taught her to fool them.",
    third = "{name} met Myranda the Hag, who works illusions from her hut on Sorrow Hill.",
  },

  greetings = {
    { id = "g_hut", text = "Come in, come in, and mind the bones by the door; they're nobody you'd know." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon, dearie? Either my work pleased you or it frightened you, and I'm not sure which I'd prefer." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. I sat at the feet of priests once, in red robes, and I learned more from them than they ever meant to teach." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The beasts are harder, dearie, for they smell what you are under what you look like. Men, on the other hand, believe their eyes, and that's the only reason I've lived so long out here." } },
      choices = {
        { text = "A seeming is a lie. I'll stick to the truth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Deceiving the dead is fair. Teach me, then.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Myranda.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "With the right tabard and a little of my work, dearie, the guards at Hearthglen would salute you. It's all in the swagger, for a Crusader walks as if the Light owes him money, and you've the shoulders for it already." } },
      choices = {
        { text = "I'd rather walk in under my own colours and fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A disguise wins more fights than a charge. I'll take it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Myranda.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Never, dearie, and that's the one thing I can't mend. A Crusader's eyes believe what they're shown, but a hound believes what it smells, so if the Crusade ever learns to keep dogs at the gate, old Myranda's out of work." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} knows exactly what I am, dearie, just look at its hackles. Beasts always do, and I've never held it against them." },
      },
      choices = {
        { text = "Then I'll trust my beast's nose over any seeming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Good to know. I'll keep my disguises downwind of their dogs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Myranda.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They're honest things, your spirits, and they don't care for anything that wears a face it wasn't born with. But a seeming hurts nobody who isn't fooled by it, and the folk I fool these days wear red tabards and burn villages, so I sleep well enough, dearie, whatever the wind says." } },
      choices = {
        { text = "A lie that stops a zealot is no great sin.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Deceit is deceit, Myranda, whoever it fools.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Myranda.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Myranda, they call me, and the Hag behind my back, though not to my face more than once. I trade in seemings, dearie, the art of looking like what you're not." },
        { id = "h_tirion", tags = { "news" }, when = { questActive = TODO_QUEST("Find Myranda") },
          text = "The old exile by the river sent you, did he? Then you'll want to walk into Hearthglen wearing a Crusader's face, and I can give you one, for a little while." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, dearie, with the smell of the Nether on your sleeve. Don't bring your little friend in here, for my cauldron has a temper of its own." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Illusions, is it, {class}? The Kirin Tor have their tricks and I have mine, and mine have fooled more priests than theirs ever did." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, dearie, I can always tell. You wear your face like a mask already, so you'll need very little help from old Myranda." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, dearie, with a jaw like a castle gate. You'd make a lovely Scarlet Crusader with the right seeming, {class}, and they'd never guess you'd come to knock their teeth in." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, dearie. Mind your beasts don't sniff at my cauldron, for the last one that did walks on its hind legs now and won't stop talking." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, dearie, and what a seeming you wear! I could teach you a few of mine, though I suspect you've a few of your own." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, dearie, and you'll be wanting to scold me, I expect, for twisting what's real into what isn't. The spirits always did think me a bit of a liar." },
      },
      choices = {
        { text = "I serve the Light. Your craft makes my skin crawl.", next = "paladin", when = { class = "PALADIN" } },
        { text = "You seem to know the Crusade very well.", next = "crusade" },
        { text = "How does your illusion work?", next = "illusion" },
        { text = "Why help anyone against the Crusade?", next = "tirion" },
        { text = "What do you know of shadow magic, Myranda?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Someone must have taught you to work illusions, Myranda.", next = "xmage", when = { class = "MAGE" } },
        { text = "What's the difference between your seemings and a good disguise?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I doubt your seeming could pass me off as a Crusader.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Can your seemings fool a beast's nose, Myranda?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do your seemings deceive the beasts as well as people?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do the spirits really dislike your seemings, Myranda?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I've no use for witchcraft.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something more? The kettle's on, though I wouldn't drink from it." },
        { id = "h_again2", text = "Speak, dearie. I've nowhere to be, and no one to be it with." },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A disguise fools the eyes, dearie, and a seeming fools the heart, which is where the Crusade keep their judgement. The priests taught me that, though they'd burn me for saying so, and I find that very funny." } },
      choices = {
        { text = "Deceiving zealots is fair game.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Lies catch up with everyone, even yours.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Clever. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Crusade's own priests, before they decided I was a witch, and they weren't wrong, only late. A mage learns illusion from a book, but I learned it watching holy men lie to themselves every morning." } },
      choices = {
        { text = "Magic learned from liars is still magic.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Magic should be studied properly, not stolen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Enough to stay out of it, dearie, for every warlock I've known paid eventually, and the price was never coin. Seemings are safer, since the worst a bad illusion ever does is show you your own face." } },
      choices = {
        { text = "I'll stop before the price comes due.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I know the price, and I'll pay it gladly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of seemings instead.", next = "BACK" },
      },
    },
    crusade = {
      lines = {
        { id = "cr_default", text = "I studied with their priests, back when they still pretended they were saving people. They taught me to see the dark in others, and I found I was rather better at using it." },
      },
      choices = { { text = "You must have had reason to leave them.", next = "crusade_left" } },
    },
    crusade_left = {
      lines = {
        { id = "cl_default", text = "They burned a village on a rumour, and I asked a question about it. In the Crusade, dearie, a question is the first step toward a pyre, so I walked out before they could build mine." },
      },
      choices = {
        { text = "They earned your hatred. Use it against them.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Dark arts won't heal what they broke.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    illusion = {
      lines = {
        { id = "il_default", text = "A seeming is only a story the eye tells the mind, and I tell it very convincingly. It won't fool a hound or a clever child, and it won't last long, so do your business in Hearthglen quickly." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    tirion = {
      lines = {
        { id = "ti_default", text = "Because old Tirion Fordring's son sits at the Crusade's table in Hearthglen, and anything that hurts the Crusade pleases me. That the old man's heart might mend a little is, well, a pleasant accident." },
      },
      choices = { { text = "That's kinder than you let on.", next = "BACK", fx = { affinity = 1 } } },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Then don't touch anything, dearie, and you can scrub yourself raw afterwards. You'll still need my seeming to get into Hearthglen, Light or no Light." } },
      choices = { { text = "Just do the work.", next = "BACK", fx = { affinity = -1 } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Red robes, white knuckles, and a fire for every question. I know them far too well." } },
    scarlet_monastery = { { id = "tp_scarlet_monastery", text = "The Crusade taught me my first spells at their monastery, and they taught me well. They never imagined I'd use those lessons to walk among them wearing a borrowed face." } },
    holy_light = { { id = "tp_holy_light", text = "The Crusade's priests say the Light shows them who is pure and who is damned. I've stood in their halls wearing a stranger's skin, and the Light didn't say a word." } },
    scourge = { { id = "tp_scourge", text = "The Scourge has no interest in an old woman on a hill, and I've given it no reason to. I'm much more interested in the Crusade." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are a sour lot, but they pay well for what I know about the Crusade. I'm not particular about my customers." } },
    _none = { { id = "tp_none", text = "Ask the bones by the door, dearie. They're better listeners than talkers." } },
  },
}

P:NPC {
  key = "chromie", id = TODO_NPC("Chromie"), name = "Chromie",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "andorhal" }, temper = { "cheerful" }, values = { "curious", "kind" },
  notices = { "race" },
  impression = {
    first = "Chromie is a gnome standing alone in the ruins of Andorhal, which is strange enough, and she seems to know what you are going to say a moment before you say it, which is stranger.",
    third = "{name} met Chromie, a peculiar gnome among the ruins of Andorhal who takes a great interest in the fall of Darrowshire.",
  },

  greetings = {
    { id = "g_ruin", text = "Oh, there you are! Right on time, or perhaps a little early; it's so hard to tell from in here." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! How lovely. You'll forgive me if I don't talk about Gnomeregan; I find it all very sad, and I'm told it isn't over yet." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of them want to rest, and some of them want to be remembered first, and telling which is which takes longer than you'd think. I'm helping the ones who want remembering, and I think your people would understand that." } },
      choices = {
        { text = "Help them remember. Then let them rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The past is past. Let them all rest now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Chromie.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Long enough for some of the townsfolk to get away, though not nearly long enough for all of them. Captain Redpath held the square to the very end, and what became of him afterwards is a sadder story, which I'd rather tell properly or not at all." } },
      choices = {
        { text = "Holding the square to the last is a warrior's whole duty.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better to fall back and live to fight another day.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Chromie.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, the shape of things that happened, and where they went afterwards, and whether anyone remembers them rightly. You read a trail in the mud and know a stag passed an hour ago, and I read Andorhal and know a great deal passed a good while ago." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} knows I'm odd, doesn't it? Beasts always notice, {class}, because they never assume tomorrow will look like today." },
      },
      choices = {
        { text = "The past deserves the truth, Chromie, however sad it is.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some trails are kinder left muddied. Let the past lie.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Chromie.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He died defending Darrowshire, and what he died as is more complicated, because the Scourge took him afterwards and made him something else. I'd like to think a man is remembered for the stand he made and not for what was done to him later." } },
      choices = {
        { text = "Then remember the stand. His honour is still his.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What he became matters too. Truth over comfort.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "There wasn't time, you see, because the town fell in a single night and everyone who could have said the words was busy dying. Some of them still don't know it's over, and a few kind words at the right moment can do a great deal for a spirit like that." } },
      choices = {
        { text = "Then I'll say the words for every one of them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead have waited this long. The living come first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because remembering properly matters, and the ground was here for all of it, before Andorhal and before the plague, and it'll be here after. I like to think the spirits keep a sort of history of their own, and that every brave thing done at Darrowshire is still written in it somewhere." } },
      choices = {
        { text = "Then we honour the dead by remembering them as they were.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The past is gone, Chromie. Only today matters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Chromie.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Oh, I read a great deal, and I've always been good at guessing how stories end. The ones about people who bargain with things from beyond tend to end badly, though not always, and I'd very much like yours to be one of the exceptions, if you'll let it." } },
      choices = {
        { text = "I'll keep my bargains in check, Chromie. I promise.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My story's mine to write. I'll take the risk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Chromie.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Chromie, and I'm very interested in Darrowshire, the town in the east where so many brave people fell. Things that happened there want to be remembered properly, and I'd like to help them." },
        { id = "h_ring", tags = { "news" }, when = { questActive = TODO_QUEST("A Strange Historian") },
          text = "Joseph Redpath's ring! Marlene sent you, didn't she? Hold onto it a moment; there's something it still wants to do." },
        { id = "h_annals", when = { questActive = TODO_QUEST("The Annals of Darrowshire") },
          text = "The Annals are somewhere in Andorhal's old town hall, among a great many books that aren't the Annals. Look for the one that looks like it's been waiting for you." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Oh, a mage! You've the look of someone who reads the last page of a book first, {class}, and I can't say I blame you." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You came up so quietly I nearly missed you, {class}, and I very rarely miss anything. That's quite a compliment, you know." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You must be the one who'll say the words properly at Darrowshire, because I've always thought the people there deserve a better farewell than the one they got." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Joseph Redpath wore a tabard just like yours once, and I think he'd have liked to see a knight walking through Andorhal again, even if the town isn't much to look at now." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Darrowshire had warriors too, you know, {class}, and they held the town square longer than anyone thought they could, which I'd very much like people to remember." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You follow things that have already passed by, {class}, which is a little like what I do, only with footprints." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Oh, a druid! You know what it is to watch something grow over a very long time, so I think you'll understand why I care about Darrowshire." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, I'd love to know what the spirits remember about this place, {class}, because people forget so quickly, but I've always suspected the ground doesn't." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock in Andorhal. Do be careful, {class}, for the Cult here dabbles in the same dark places you do, and it hasn't done them a bit of good in the long run." },
      },
      choices = {
        { text = "Fellow gnome, you're hiding something.", next = "gnome", when = { race = "Gnome" } },
        { text = "What happened at Darrowshire?", next = "darrowshire" },
        { text = "There's more to you than you let on.", next = "who" },
        { text = "Why stay in Andorhal of all places?", next = "andorhal" },
        { text = "You talk like someone who's studied time, Chromie.", next = "xmage", when = { class = "MAGE" } },
        { text = "Few people catch me coming. How did you?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Were the dead of Darrowshire never given proper rites?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did Joseph Redpath die a knight of the Silver Hand?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Darrowshire's defenders must have held as long as they could.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You seem to be tracking something, Chromie.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Should the dead of Darrowshire be left to rest?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why do you care what the ground remembers, Chromie?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How do you know what's good for anyone in the long run?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye, Chromie.", next = "END" },
      },
      again = { { id = "h_again", text = "Yes? You were about to ask something, I'm almost certain of it." } },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oh, I'm always a moment ahead of where people expect, which is a habit and not a trick, I promise. Besides, the dead in Andorhal walk loudly, so anyone quiet stands out like a lantern." } },
      choices = {
        { text = "That's honest enough. I'll take your word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A habit, is it? You're hiding something.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about Darrowshire.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Do I? How very odd of me, for I'm only a gnome with an interest in history, and history is just time that has stopped wriggling. Darrowshire is the history I care about today, so ask me about that, and I'll pretend you didn't notice anything." } },
      choices = {
        { text = "Some secrets are worth keeping. I'll leave yours.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets like that have a way of coming out.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Very well. Something else, then.", next = "BACK" },
      },
    },
    darrowshire = {
      lines = {
        { id = "da_default", text = "The Scourge came, and the town's defenders stood, and Joseph Redpath was the bravest of them right up until he wasn't himself anymore. His brother Carlin survived, and he's at Light's Hope Chapel, and he would very much like to know how it really ended." },
      },
      choices = { { text = "How could you know how it really ended?", next = "darrowshire_know" } },
    },
    darrowshire_know = {
      lines = {
        { id = "dk_default", text = "Books, mostly, and a good memory, and an ear for things nobody else is listening to. Bring me the Annals, and I'll show Carlin something worth the long walk." },
      },
      choices = {
        { text = "Some stories are kinder left unfinished.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The dead deserve the true account.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = "darrowshire" } },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "A gnome with a keen interest in history, and a keener interest in history going where it ought to. Let's leave it at that, shall we? It's tidier." },
      },
      choices = { { text = "Tidier for you, anyway.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    andorhal = {
      lines = {
        { id = "an_default", text = "Because Andorhal remembers everything, even the parts it would like to forget. The Scourge doesn't bother me much; I'm terribly uninteresting to them, you see." },
      },
      choices = { { text = "Something else, Chromie.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Everyone's hiding something, cousin, and mine is only bigger than most. Help me with Darrowshire, and perhaps one day I'll tell you over tea." } },
      choices = { { text = "I'll hold you to the tea.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    darrowshire = { { id = "tp_darrowshire", text = "A brave little town, and a terrible day, and a story with one more chapter in it." } },
    andorhal = { { id = "tp_andorhal", text = "Andorhal was the busiest grain town in the north, and the Cult of the Damned shipped its plague out through these very streets. I like to stand here and remember how it was, and how it is, both at once." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is a city with a very bad day stuck in it, and the day hasn't ended for some of its people. I'd rather not talk about it, which is unusual for me." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is everywhere in Andorhal, and they never notice me. I'm very small, and I'm very good at being somewhere they aren't." } },
    _none = { { id = "tp_none", text = "I could tell you, but then it wouldn't be a surprise later." } },
  },
}
