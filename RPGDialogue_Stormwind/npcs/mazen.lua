-- Mazen Mac'Nadir, caretaker of the Academy's library, Stormwind. Voice: bibles/mazen.md
-- Quest: Mazen's Behest (Khadgar's Essays on Dimensional Convergence, lost in the Swamp of
-- Sorrows by his assistant Acolyte Dellis, bound for Watcher Mahar Ba at Nethergarde Keep).
-- Both steps share the title, so quest lines fit either step.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q = TODO_QUEST("Mazen's Behest")

P:NPC {
  key = "mazen", id = TODO_NPC("Mazen Mac'Nadir"), name = "Mazen Mac'Nadir", title = "Academy of Arcane Arts and Sciences",
  bible = "bibles/mazen.md", role = "scholar", tier = "major",
  communities = { "stormwind" }, temper = { "eager" }, values = { "curious", "cautious" },
  notices = { "mage", "warlock", "scholar" },

  impression = {
    first = "Mazen Mac'Nadir keeps the Academy's library and looks as though the library has been keeping him: ink on his cuffs, three books under one arm and a list of overdue requests as long as the other. He talks quickly, worries constantly, and lights up the moment anyone mentions Khadgar.",
    third = "{name} met Mazen Mac'Nadir, caretaker of the Academy's library in Stormwind, a harried scholar who guards enchanted books from the wrong hands.",
  },

  greetings = {
    { id = "g_default", text = "Yes, yes, come in, only mind the stack by the door; it's sorted, even if it doesn't look it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again! Sit wherever you can find a chair that hasn't a book on it, which may take some time." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A fellow student of the arcane, and thank the Light for it. You'll know not to lick your thumb before turning a page." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Good day. I'll ask you to keep your hands where I can see them while you're among the shelves, and I'll ask it politely, because I'm a polite man." },
    { id = "g_active", when = { questActive = Q }, text = "Any word of the essays? Please tell me they're not still lying in a bog somewhere with a plant reading them." },
    { id = "g_done", when = { questDone = Q }, text = "My rescuer of Khadgar! Come in, come in; Mahar Ba's letter of thanks arrived, and it ran to six pages, which for him is restraint." },
    { id = "g_away", when = { away = 21, metBefore = true }, text = "You've been gone {away}, and in that time I've received forty-one requests and answered nine. Don't tell anyone that number." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come on a good deal since last we spoke. I can see it in how you stand, which is more than I can say for the shelves in the east alcove." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the Quarter spoke well of you this week, which in a district full of mages is very nearly a medal." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've heard you upset someone in the Quarter. I've no time to take sides, so please don't upset me as well." },
  },

  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE", minLevel = 40 },
      text = "You've the steadiness of a mage who has stopped setting things on fire by accident. If you ever want a reading list, I have eleven, sorted by how much they'll frighten you." },
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "I can smell the cellar on you, friend, the Slaughtered Lamb's cellar, and I'll say plainly that half the books I lock away are locked away from people who go down those stairs." },
    { id = "n_gnome", cat = "scholar", when = { race = "Gnome" },
      text = "A gnome! Your people's library at Gnomeregan held treatises I'd have given a finger to read, and I suppose it's all under the radiation now, which I try not to think about at night." },
    { id = "n_dalaran", cat = "scholar", when = { origin = "human_dalaran_stray" },
      text = "You studied in Dalaran, didn't you? You have the look of someone who learned to read in a room with a ceiling painted with stars. I'd love to know what they've kept behind those gates." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Mazen Mac'Nadir, caretaker of the Academy's library, at your service, insofar as anyone can be at anyone's service when the requests are stacked this high. What can I do for you?" },
        { id = "h_before", when = { questBefore = Q, minLevel = 35 },
          text = "You look like someone who travels, and goodness knows I need one. There's a book that ought to be at Nethergarde Keep by now, and isn't, and the reason is a long and embarrassing story." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q },
          text = "Khadgar's Essays on Dimensional Convergence, in the Swamp of Sorrows, among the plants that chased poor Dellis off. The swamp is no place for a book, and frankly no place for Dellis either." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { Q, days = 7 } },
          text = "The essays reached Watcher Mahar Ba at last, and from his letter he's read them twice and slept never. I count that a success for the library, and a small catastrophe for his health." },
        { id = "h_done", when = { questDone = Q },
          text = "I've told the Academy that you rescued Khadgar's essays from a swamp, and the Academy said, \"Who?\", which is the Academy all over. I remember, though, and so does Mahar Ba." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "If you're here to borrow, you'll need a signed slip, two references and a solemn promise. If you're here to talk, I'll happily skip all three." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One of the kaldorei, in my library! Your people have rather firm views on magic, I'm told, so I'll try not to show you anything that would upset you, which rules out most of the second floor." },
        { id = "h_dwarf", when = { origin = "dwarf_explorers_league" },
          text = "The Explorers' League! Your people send me rubbings of tablets now and then, and they're always smudged in the one place that matters." },
      },
      again = {
        { id = "h_again", text = "What else? I have a moment, possibly two, before someone comes asking for something I've misfiled." },
        { id = "h_again2", text = "Go on, ask away. It's pleasant to be asked something I can actually answer." },
        { id = "h_again3", text = "Anything more? Do say, before I forget what I was doing, which happens more than I'd like." },
      },
      choices = {
        { text = "Tell me about the library.", next = "library" },
        { text = "What's this about Khadgar's essays?", next = "essays" },
        { text = "Who is Dellis?", next = "dellis" },
        { text = "Why guard the books so closely?", next = "danger" },
        { text = "Have there been strange happenings in the city lately?", next = "happenings" },
        { text = "I've studied at Dalaran. What would you ask?", next = "xdalaran", when = { origin = "human_dalaran_stray" } },
        { text = "I trained here in the Quarter, as it happens.", next = "xquarter", when = { origin = "human_mage_quarter" } },
        { text = "I was Gnomeregan's last arcane student.", next = "xgnome", when = { origin = "gnome_last_student" } },
        { text = "Some knowledge shouldn't be locked away, Mazen.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "I took Khadgar's essays to Mahar Ba myself.", next = "xdone", when = { questDone = Q } },
        { text = "Tell me what needs doing.", next = "BUSINESS" },
        { text = "I'll leave you to your shelves.", next = "END" },
      },
    },

    -- The library
    library = {
      lines = {
        { id = "l_default", text = "The Academy's collection, or what the Second War and three fires left of it, which is more than you'd think and less than I'd like. Histories, treatises, a good many letters from Dalaran, and some volumes I'm not permitted to tell you about, which I've now told you about." },
      },
      choices = {
        { text = "Who reads here, mostly?", next = "library_readers" },
        { text = "Three fires? How did that happen?", next = "library_fires" },
        { text = "Something else.", next = "BACK" },
      },
    },
    library_readers = {
      lines = {
        { id = "lr_default", text = "Apprentices from the Sanctum, mostly, who want the answer to their essay question and none of the reasoning. Now and then a noble's secretary wanting a family history that proves something flattering, and once, memorably, a dwarf who wanted to know if any of our books were edible." },
      },
      choices = {
        { text = "Were any of them edible?", next = "library_edible" },
        { text = "Knowledge should be open to anyone who asks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A library needs rules, or it's just a pile.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    library_edible = {
      lines = {
        { id = "le_default", text = "One was bound in pressed rye, a curiosity from Lordaeron, and he ate a corner of it before I could stop him. He said it was stale, and I said it was two hundred years old, and we parted on cool terms." },
      },
      choices = {
        { text = "That's the best thing I've heard all week.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    library_fires = {
      lines = {
        { id = "lf_default", text = "The orcs, when they burned the city, which needs no explaining. Then an apprentice and a candle, which needs very little. The third was a book that set itself alight when the wrong person opened it, which I mention only so you'll understand why I fuss." },
      },
      choices = {
        { text = "A book that burns itself? Where is it now?", next = "danger_where" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The quest
    essays = {
      lines = {
        { id = "e_default", text = "Watcher Mahar Ba at Nethergarde Keep asked for Khadgar's Essays on Dimensional Convergence months ago, and I'm ashamed to say his request sat under a great many others. When I finally sent them, I sent them with Dellis, and that was my second mistake." },
        { id = "e_active", when = { questActive = Q },
          text = "Dellis lost them in the Swamp of Sorrows, to plants, if you can believe it, and came home without his hat. The book is somewhere out there, and I'd sooner it reached Nethergarde than rotted in a bog." },
        { id = "e_done", when = { questDone = Q },
          text = "They're where they belong now, thanks to you, in the hands of the one man in the kingdom who will read every footnote. I'd almost envy him, if he weren't living next to the Dark Portal." },
      },
      choices = {
        { text = "What are the essays about?", next = "essays_what" },
        { text = "Who is Watcher Mahar Ba?", next = "mahar" },
        { text = "Why not keep a copy here?", next = "essays_copy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    essays_what = {
      lines = {
        { id = "ew_default", text = "How one world touches another, put very simply, which Khadgar never did. He wrote them in the years before the Portal was closed, when he'd seen more of the other side than any of us wished to, and they are the closest thing we have to a map of the door.",
          fx = { learn = { "khadgar", "dark_portal" } } },
      },
      choices = {
        { text = "Have you read them yourself?", next = "essays_read" },
        { text = "Some doors are better left without maps.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If there's a door, we should understand it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    essays_read = {
      lines = {
        { id = "er_default", text = "Twice, and I understood perhaps a third, which I'm told is better than most. To glimpse a mind like Khadgar's, even through the keyhole of his handwriting, is the closest I come to excitement these days." },
        { id = "er_mage", when = { class = "MAGE" },
          text = "Twice, and you'd enjoy them, I think, though the chapter on resonance gave me a headache that lasted until the following Tuesday. Khadgar wrote for people cleverer than me, and he never apologised for it." },
      },
      choices = {
        { text = "What was Khadgar like, do you think?", next = "khadgar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    essays_copy = {
      lines = {
        { id = "ec_default", text = "There's only the one, and I wouldn't let an apprentice copy it if he begged, because a careless copy of Khadgar is worse than none. Better it sits with a watcher who'll guard it than with me, who sneezes on things." },
      },
      choices = {
        { text = "A single copy is a risk all of its own.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mahar = {
      lines = {
        { id = "m_default", text = "A mage of the old sort, posted at Nethergarde to watch the Portal, and the most patient correspondent I have. He writes long letters about the soil and the sky out there, and every one of them ends by asking if I've forgotten him." },
      },
      choices = {
        { text = "Had you forgotten him?", next = "mahar_forgot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mahar_forgot = {
      lines = {
        { id = "mf_default", text = "Not forgotten, never that, only buried. Since all these strange happenings began, every lord and captain in Stormwind wants a book, a map or an opinion by Tuesday, and a quiet man at the edge of the world gets pushed to the bottom of the pile." },
      },
      choices = {
        { text = "The man watching the Portal should come first.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stormwind's lords keep the city standing. They come first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What strange happenings?", next = "happenings" },
      },
    },
    khadgar = {
      lines = {
        { id = "k_default", text = "Brilliant, they say, and young when it counted, and older than his years by the end. He was Medivh's apprentice and he outlived his master, which is rather the job of an apprentice, though rarely like that." },
      },
      choices = {
        { text = "Do you think he's still alive?", next = "khadgar_alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    khadgar_alive = {
      lines = {
        { id = "ka_default", text = "He went through the Portal with the others before it closed, and nobody has heard a word since. I'm a librarian, so I don't guess, but I keep his books dusted, and you may draw what conclusion you like from that." },
      },
      choices = {
        { text = "I hope he is. We'd need him.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    dellis = {
      lines = {
        { id = "d_default", text = "Acolyte Dellis, my assistant, and inside these walls the most capable young man I've ever had. He can find any book in the place blindfolded and knows the catalogue better than I do, and outside the city gates he's helpless as a kitten in a rainstorm." },
      },
      choices = {
        { text = "So why send him all the way to Nethergarde?", next = "dellis_why" },
        { text = "What happened to him in the swamp?", next = "dellis_swamp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dellis_why = {
      lines = {
        { id = "dw_default", text = "Because he asked, and because there was nobody else, and because I believed a young man ought to see the world at least once. I've since revised that belief, and Dellis has revised it more firmly than I have." },
      },
      choices = {
        { text = "He'll be better for having tried.", next = "BACK", fx = { affinity = 1 } },
        { text = "You sent a clerk into a swamp. That's on you.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    dellis_swamp = {
      lines = {
        { id = "ds_default", text = "Something with leaves and far too many roots came up out of the water at him, and he dropped the satchel and ran the whole way to Stonard before he remembered Stonard is full of orcs. He ran back again, which I think was the bravest part." },
      },
      choices = {
        { text = "Ran to Stonard? He's lucky to be alive.", next = "dellis_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dellis_now = {
      lines = {
        { id = "dn_default", text = "Very lucky, and he knows it. He's back on the catalogue now, much happier, and he flinches at potted ferns, which has made the Sanctum's window boxes awkward." },
      },
      choices = {
        { text = "Tell him I said he did well to come home.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Dangerous books
    danger = {
      lines = {
        { id = "da_default", text = "Because some of these books aren't books at all, not really; they're spells someone wrote down and bound in leather. In the right hands they're learning, and in the wrong hands they're a fire, or worse, a door." },
        { id = "da_warlock", when = { class = "WARLOCK" },
          text = "You of all people know why, I think. Some of these volumes would teach you things you'd want to know, and that is precisely the trouble with them." },
      },
      choices = {
        { text = "Who are the wrong hands, exactly?", next = "danger_who" },
        { text = "Then burn the dangerous ones and be done with it.", next = "danger_burn", fx = { align = { light = 1 } } },
        { text = "Nothing should be burned. Lock it away, but keep it.", next = "danger_burn", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    danger_who = {
      lines = {
        { id = "dh_default", text = "Anyone who wants a book for what it does rather than what it says. There's a cellar under the Slaughtered Lamb where people read things I'd not keep on my own shelves, and the Defias have been asking after maps, and I hear the odd question from very well-dressed gentlemen at court.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Well-dressed gentlemen at court? Who?", next = "danger_court" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_court = {
      lines = {
        { id = "dc_default", text = "I don't name names, because I'd like to keep my post and my head in that order. Let us say someone's secretary asked for a history of the Black Dragonflight and a census of the city watch in the same week, and I gave him neither." },
      },
      choices = {
        { text = "You should tell someone at the Keep.", next = "danger_tell" },
        { text = "Probably a clerk with odd hobbies.", next = "BACK" },
      },
    },
    danger_tell = {
      lines = {
        { id = "dt_default", text = "Tell them what, that a man asked for two books and didn't get them? They'd laugh me out of the hall, and rightly. I'll keep my eyes open and my ledger honest; it's all a librarian has." },
      },
      choices = {
        { text = "Keep the ledger, then. It may matter someday.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_where = {
      lines = {
        { id = "dwh_default", text = "In an iron box, in a locked room, with a pail of sand beside it and a sign that says DON'T in letters as tall as my hand. I check on it every morning, the way one checks on a sleeping dog one doesn't entirely trust." },
      },
      choices = {
        { text = "What's in it?", next = "danger_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_what = {
      lines = {
        { id = "dwt_default", text = "I've read the first page, which is a dedication to someone called \"my patient master\", in a hand I don't know. The second page is where the fire started, so I've let the matter rest there, and I suggest you do the same." },
      },
      choices = {
        { text = "Then I'll leave it be.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_burn = {
      lines = {
        { id = "db_default", text = "I've had that argument with myself on a great many sleepless nights, and I've lost it from both sides. For now I lock them up and keep the key on a string round my neck, and I take a long time deciding who to show them to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Strange happenings
    happenings = {
      lines = {
        { id = "hp_default", text = "Where to begin? Bandits in Westfall who seem to know the patrol routes, the King gone off to a parley and not come home, and talk of dragons and dark iron and worse to the east. Every one of those sends someone to my door asking for a book about it." },
      },
      choices = {
        { text = "What do they ask for, mostly?", next = "happenings_ask" },
        { text = "Do you think the King's alive?", next = "happenings_king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happenings_ask = {
      lines = {
        { id = "ha_default", text = "Maps of the Burning Steppes, histories of the Black Dragonflight, anything on the Dark Iron dwarves, and a great many pamphlets with titles like \"Signs of the End\", which I'm told sell very well in Old Town. The pamphlets I don't stock; they're spelled terribly." },
      },
      choices = {
        { text = "Maybe the pamphlets are right, for once.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happenings_king = {
      lines = {
        { id = "hk_default", text = "I pray so, and I keep the histories of his father's reign on the front shelf, in case he wants to read them when he's home. It's a small thing, but small things are what I'm good at." },
      },
      choices = {
        { text = "He'll come back. Stormwind doesn't lose its kings.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The city can't wait on one man forever.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    -- Who the player is
    xdalaran = {
      big = true,
      lines = {
        { id = "xd_default", text = "Oh, everything, but chiefly whether the Violet Citadel's library survived. They're rebuilding, I know, and slow to open their gates, and I've written four letters asking that question and had two polite replies that said nothing at all." },
      },
      choices = {
        { text = "It survived. Some of it, at least.", next = "xdalaran_lib" },
        { text = "I couldn't say. They didn't show students much.", next = "xdalaran_lib" },
      },
    },
    xdalaran_lib = {
      lines = {
        { id = "xdl_default", text = "Then there's hope, and hope will have to do until someone in a violet robe deigns to write back. Dalaran was the reason I took up books in the first place; it's strange to love a city you've never been allowed into." },
      },
      choices = {
        { text = "Dalaran should share what it knows with Stormwind.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Dalaran keeps its secrets for good reason.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    xquarter = {
      lines = {
        { id = "xq_default", text = "Did you? Then you've almost certainly borrowed a book from me and returned it late, because everyone in the Quarter has. Don't tell me which; I'd rather keep liking you." },
      },
      choices = {
        { text = "It was a primer on frost. Eight months late.", next = "xquarter_late" },
        { text = "I always returned mine on time.", next = "xquarter_late" },
      },
    },
    xquarter_late = {
      lines = {
        { id = "xql_default", text = "Ha! I'll pretend I didn't hear, though I know exactly which primer, because it came back with a tea ring on chapter four. Welcome home, at any rate, and do come and read when the road lets you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      big = true,
      lines = {
        { id = "xg_default", text = "The last? Light, I'm sorry. Tell me, and forgive me for asking it so bluntly: did anyone save the library, or is everything your people wrote down still lying under that poison?" },
      },
      choices = {
        { text = "We carried out what we could. Not nearly enough.", next = "xgnome_saved", fx = { affinity = 1 } },
        { text = "Books can be rewritten. My people can't.", next = "xgnome_saved", fx = { affinity = 2 } },
      },
    },
    xgnome_saved = {
      lines = {
        { id = "xgs_default", text = "You're right, of course, and I'm ashamed I asked about paper before people. If you ever want to write down what you remember, I'll give you a shelf of your own, and nobody touches it but you." },
      },
      choices = {
        { text = "I may take you up on that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      lines = {
        { id = "xw_default", text = "Perhaps not, and I'm not a jailer by temperament, believe me. But I've seen what one page can do in the wrong hour, and I'd sooner be called a coward by you than be the man who handed over the third fire." },
      },
      choices = {
        { text = "Power belongs to those willing to master it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "That's fair. Some things should stay shut.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    xdone = {
      lines = {
        { id = "xdn_default", text = "You did, and you didn't lose your hat, which already puts you ahead of my last courier. How did Mahar Ba look? His letters are cheerful, but he writes cheerful the way a man whistles in the dark." },
      },
      choices = {
        { text = "Tired, but glad. He'd waited a long time.", next = "xdone_tired" },
        { text = "Lonely. He could use more letters.", next = "xdone_tired", fx = { affinity = 1 } },
      },
    },
    xdone_tired = {
      lines = {
        { id = "xdt_default", text = "Then I'll write him tonight, and I'll send a book he didn't ask for, something with no portals in it at all, perhaps a nice history of Lordaeron's orchards. A man needs something to read that isn't the end of the world." },
      },
      choices = {
        { text = "He'd like that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Stormwind, raised above a bookbinder's, and apprenticed to the Academy at twelve because I read the labels on everything. I've never left, except once to Goldshire, and I didn't care for it." } },
    advice = { { id = "tp_ad", text = "Write everything down, and then write down where you put it. The second part is the one people forget." } },
    khadgar = { { id = "tp_khadgar", text = "The finest mind of his generation, and I've a shelf of his work that I'd save before my own furniture. Ask Watcher Mahar Ba at Nethergarde, if you'd like to hear someone even more excitable about him than I am." } },
    dark_portal = { { id = "tp_portal", text = "I've read everything written about it and never seen it, which suits me perfectly. Mahar Ba sees it every morning, and his letters suggest it doesn't improve with familiarity." } },
    defias = { { id = "tp_defias", text = "They've asked after maps more than once, through other people, and I've said the maps are being rebound. They'll be rebound for a very long time." } },
    burning_legion = { { id = "tp_legion", text = "Khadgar wrote about them in a hand that got smaller and tighter as the pages went on. I've noticed my own does the same when I copy those passages." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "A library I'll never see, and I'm told it was magnificent. I mourn the books, and I'm ashamed I think of the books before the gnomes, but there it is." } },
    _none = { { id = "tp_none", text = "I'm afraid that's not in my catalogue, and if it's not in my catalogue it may not exist. Try the Cathedral's archive, or failing that, a tavern." } },
  },
}
