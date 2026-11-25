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
  likesTone = "polite",
  notices = { "mage", "warlock", "scholar" },

  impression = {
    first = "He lights up the moment anyone mentions Khadgar.",
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
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come on a good deal since last we spoke. I can see it in how you stand, while the shelves in the east alcove are still leaning like drunkards." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the Quarter spoke well of you this week, which in a district full of mages is very nearly a medal." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've heard you upset someone in the Quarter. I've no time to take sides, so please don't upset me as well." },
  },

  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE", minLevel = 40 },
      text = "You've the steadiness of a mage who has stopped setting things on fire by accident. If you ever want a reading list, I have eleven, sorted by how much they'll frighten you." },
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "I can smell the cellar on you, friend, the Slaughtered Lamb's cellar, and I'll say plainly that most of the books I lock away are locked away from people who go down those stairs." },
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
        { id = "l_default", text = "The Academy's collection, or what the Second War and three fires left of it, which fills four rooms and ought to fill twelve. Histories, treatises, a good many letters from Dalaran, and some volumes I'm not permitted to tell you about, which I've now told you about." },
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
        { text = "Knowledge should be open to anyone who asks.", next = "BACK", reply = "In principle I agree, but in practice the last person who asked took Lord Ebonlocke's atlas to Duskwood and left it in a puddle. Open, yes, but careful.", fx = { align = { order = -1 } } },
        { text = "A library needs rules, or it's just a pile.", next = "BACK", reply = "Thank you! I'll embroider that on a cushion and set it on the reading bench, where the apprentices will ignore it as usual.", fx = { affinity = 1, align = { order = 1 } } },
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
        { text = "Some doors are better left without maps.", next = "BACK", reply = "Khadgar might have agreed with you, in his later years. But a door without a map is only a door you trip through in the dark.", fx = { align = { light = 1 } } },
        { text = "If there's a door, we should understand it.", next = "BACK", reply = "That's the scholar's answer, and the one I'd have given at your age. I still give it, though I lower my voice now when I do.", fx = { affinity = 1, align = { light = -1 } } },
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
        { id = "m_default", text = "A mage of the old sort, posted at Nethergarde to watch the Portal, and the most patient correspondent I have. He writes long letters about the soil and the sky out there, and each one ends by asking if I've forgotten him." },
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
        { text = "The man watching the Portal should come first.", next = "BACK", reply = "That's what I keep saying, but the man watching the Portal doesn't have a seat at court. I'll keep looking for those essays, I promise you.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stormwind's lords keep the city standing. They come first.", next = "BACK", reply = "They keep it standing, I'll grant, and they do love to remind me of it while they wait for their maps. Nethergarde can wait a day, I suppose.", fx = { align = { order = 1 } } },
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
        { text = "He'll come back. Stormwind doesn't lose its kings.", next = "BACK", reply = "I'd like to believe that as much as you do. Until then, his father's histories stay on the front shelf, dusted every morning.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The city can't wait on one man forever.", next = "BACK", reply = "Perhaps not, but a city that stops waiting has given up on more than one man. I'll keep my small hope, if you don't mind.", fx = { align = { order = -1 } } },
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
        { text = "Dalaran should share what it knows with Stormwind.", next = "BACK", reply = "They should, and some of their archmages agree with you in private. In public, their letters are very elegant ways of saying no.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Dalaran keeps its secrets for good reason.", next = "BACK", reply = "Good reason or not, it makes for a lonely library. Still, I've read enough of Khadgar to know what careless sharing can open.", fx = { align = { order = 1 } } },
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
        { text = "Power belongs to those willing to master it.", next = "BACK", reply = "I've heard that before, from people who weren't here a year later to repeat it. The shelf stays locked, and I'll sleep easier for it.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "That's fair. Some things should stay shut.", next = "BACK", reply = "Thank you, truly. It's not often someone with your sort of power agrees with me on that, and it makes my keys feel a little lighter.", fx = { affinity = 1, align = { light = 1 } } },
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

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Oh! Well, that's, yes, thank you, that's very kind indeed. Nobody praises a cataloguer, you understand, so I haven't a reply prepared, and I usually have one prepared for everything." },
        { id = "s2", text = "You noticed the shelving! It took me years, and you're only the second person who's seen that it's sorted at all. Do sit down, if you can find a chair." },
      },
      fail = {
        { id = "f1", text = "That's most generous, but I've read enough courtly letters to recognise the form, and it's generally followed by a request to borrow something. Nothing leaves this room, I'm afraid." },
        { id = "f2", text = "I'm a polite man, so I'll say thank you, but I'd be happier with an honest question about the books. Compliments make me lose my place." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Yes, well, I did go to Goldshire once and came straight home, so I can't call that unfair. You're quicker than most of the Academy's students, and I mean it kindly." },
        { id = "s2", text = "Oh, that's rather good, and I'm writing it down before I forget it. I've been called worse by archmages with less wit, I assure you." },
      },
      fail = {
        { id = "f1", text = "I don't see what's amusing about a man who keeps his books in order. I'll ask you to lower your voice among the shelves, and I'll ask it politely, once." },
        { id = "f2", text = "Mock the stacks if you must, but half of what Stormwind knows about itself is in this room, and I gathered it. I'd thought better of you." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Oh dear, please, there's no call for that, and do mind the stack by the door. I'll tell you what you want to know, only kindly step back from the folios." },
        { id = "s2", text = "I'm a scholar, you understand, and I've never claimed to be brave. Ask your question, and I'll answer it as fully as I can, if you'll stop looking at me like that." },
      },
      fail = {
        { id = "f1", text = "I catalogue works on the Burning Legion before breakfast, so I'm afraid a raised voice doesn't trouble me as it once might have. Sit down, please, before you knock something over." },
        { id = "f2", text = "This room is under the Academy's wards, and they're considerably less polite than I am. I'd advise you to compose yourself." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The Defias have asked after maps of the old city more than once, through other people. I keep telling them the maps are being rebound, and they're starting to sound impatient." },
    { id = "bl2", text = "Gakin the Darkbinder borrows books from this library and returns them late, and some of them come back smelling of sulfur. I've stopped asking which ones." },
    { id = "bl3", text = "Watcher Mahar Ba at Nethergarde writes to me every month, and his letters lately suggest the Dark Portal isn't as quiet as the Keep believes." },
  },
  confides = {
    { id = "cnf_1", text = "The Academy's restricted shelves are locked with a ward, but the ward was set by an apprentice in a hurry and it doesn't cover the ladder. I've reported it four times, and I've given up and started sleeping in the stacks." },
    { id = "cnf_2", text = "Watcher Mahar Ba at Nethergarde Keep will tell an honest visitor more about the Dark Portal in an hour than the Keep has heard in a year. Mention my name and he'll at least offer you tea, which at Nethergarde is a great kindness." },
    { id = "cnf_3", text = "A clerk from the court comes by every few weeks asking for anything we hold on the black dragonflight, and always with a different excuse. I've started lending him the dullest volumes I own." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you're the first person in months who's asked me a question and stayed for the whole answer, which, as you've noticed, can be quite a long time. That alone puts you very high in my estimation." },
      { id = "rg_2", text = "I think you're reliable, {name}, which in my experience is far rarer than brilliance. Brilliant people lose essays in swamps, and reliable people bring them back." },
      { id = "rg_mage", when = { class = "MAGE" }, text = "I think you've a proper respect for what's written down, which is more than I can say for half the Academy. Khadgar always said a mage who won't read is just a candle with ambitions." },
      { id = "rg_light", when = { alignment = { axis = "light", min = 30 } }, text = "There's a sort of calm about you that I don't often meet among people who carry swords. I find I stop fretting for nearly a whole minute when you're in the library." },
      { id = "rg_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "I like you, honestly I do, but you've the look of someone who's read a few books I'd rather keep locked up. Please tell me you haven't, or at least tell me you were careful." },
    },
    confide = {
      { id = "cf_1", text = "The library's caught fire three times since I took it on, and only one of those was the orcs. Another was an apprentice's candle, and the third was a book that burned itself, dedicated to someone's patient master, and I've never been able to bring myself to throw out the ashes." },
      { id = "cf_2", text = "I write to Dalaran every month asking after Khadgar's old papers, and nobody has answered in two years. I keep writing anyway, because one day somebody new will open the post." },
      { id = "cf_3", text = "Acolyte Dellis is the finest cataloguer I've ever had and is now terrified of potted ferns, which is entirely my fault for sending her to the Swamp of Sorrows. I've hidden every plant in the Academy." },
    },
    trust = {
      { id = "tr_1", text = "Adair Gilroy, without question, and Milton Sheaf at the Royal Library, though you'll need a free afternoon. Both of them treat a book as though it had feelings, which is the correct attitude." },
      { id = "tr_2", text = "Watcher Mahar Ba, down at Nethergarde, who says what he sees and not what the Keep wants to hear. I'd trust him with Khadgar's essays, which is the highest trust I've got to give." },
      { id = "tr_3", text = "Not the magisters who visit from the north and ask for our oldest books by shelf number. Anyone who knows exactly what they want from a library usually wants it for something dreadful." },
    },
    watchout = {
      { id = "wo_1", text = "Watch for books that are warm to the touch, or that open to the same page however you drop them. Put them down, step away, and fetch someone like me who'll worry about them properly." },
      { id = "wo_2", text = "Watch the Blasted Lands, {name}, if you ever go that way. The reports from Nethergarde say the Portal's stones are humming again, and stones shouldn't hum." },
      { id = "wo_3", text = "Watch for Gakin the Darkbinder's students if they ever offer to lend you something. Their books come back to me smelling of sulfur, and I shudder to think what they do to people." },
    },
    worries = {
      { id = "wy_1", text = "I worry that something terrible is written down in this library and I've simply not found it yet, and that someone else will find it first. That's the librarian's nightmare, and I have it most nights." },
      { id = "wy_2", text = "I worry that I sent Dellis somewhere dangerous because I was too busy to go myself. She came back, thank the Light, but I'm not sure all of her did." },
      { id = "wy_3", text = "I worry about the Dark Portal, honestly, more than anyone in the Keep seems to. Khadgar wrote that a door once opened is never truly shut, and he was right about nearly everything." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to meet Khadgar one day, though I know it's a foolish hope and he's very likely gone for good. I'd just like to tell him his essays were safe with me, eventually, after a small incident with some swamp plants." },
      { id = "hp_2", text = "I hope to see the Academy's library properly catalogued before I die, every book in its place and every dangerous one in a box with three locks. I estimate I need another forty years." },
      { id = "hp_3", text = "I'd like the Academy to open its doors to ordinary children who want to read, not only to nobles' sons. I learned my letters above a bookbinder's shop, and look how I turned out, which is to say, harried but happy." },
    },
    favor = {
      { id = "fv_1", text = "If you ever travel to Nethergarde, please tell Mahar Ba I'm sorry his request sat so long on my desk. He's too polite to complain, and that only makes it worse." },
      { id = "fv_2", text = "If you find a book anywhere that seems to be watching you, don't open it; bring it to me wrapped in something thick. I'll take it from there, with gloves on." },
    },
    friendship = {
      { id = "fr_1", text = "I do, {name}, very much, and I'm a little embarrassed by how much. Most of my friends are bound in leather and haven't said a word to me in centuries." },
      { id = "fr_2", text = "Of course! You're one of the very few people I'd let into the restricted stacks without a chaperone, which for a librarian is practically a declaration of love." },
      { id = "fr_light", when = { alignment = { axis = "light", min = 40 } }, text = "A dear friend, and one I'd trust with any book in this building, even the ones that bite. That's not a thing I'd say lightly, given what they bite." },
    },
    never_told = {
      { id = "nt_1", text = "I've never actually been to Dalaran, {name}, not once. I've read about every corridor of the Violet Citadel, and I talk as though I've walked them, but I've never been further than Goldshire." },
      { id = "nt_2", text = "I opened one of the forbidden books once, as a young man, just to see. I read a single line, and I've never forgotten it, and I've never told anyone what it said, and I never will." },
    },
    grievance = {
      { id = "gv1", text = "I'm a polite man, and I'm being polite about this, but I'd rather you didn't touch the books. Any of them. Ever again, if possible." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You called the Academy a dusty attic for frightened clerks. Some of us are frightened, yes, but only because we've read what's in here." },
      { id = "gv_values", when = { grudge = "values" }, text = "You want knowledge for what it can do for you, and you don't care what it costs. Khadgar warned about people like that, and I copied out every word." },
      { id = "gv_tone", when = { grudge = "tone" }, text = "You speak to me as though I were a shopkeeper who'd misplaced your order. I am the keeper of this library, and I'd like to be treated as one." },
    },
    amends = {
      { id = "am1", text = "Return something to a library somewhere, anywhere, and on time. You'd be amazed how much that would mean to me." },
      { id = "am_values", when = { grudge = "values" }, text = "Read something for the joy of it, with no purpose at all, and come and tell me about it. Then I might trust you near the shelves." },
    },
    spite = {
      { id = "sp1", text = "I think you're the reason the Academy keeps its best books under lock and key. I think you'd lick your thumb before turning a page, too." },
      { id = "sp_values", when = { grudge = { worst = "values" } }, text = "I think if you ever found a book of real power, you'd use it before you understood it. I've read the histories, and that never ends well." },
    },
    _gated = {
      { id = "gt1", text = "I'm afraid I don't share that with visitors I've only just met. It isn't rudeness, I hope; a careful man keeps some pages closed until he knows his reader." },
      { id = "gt2", text = "I'd rather not say, not yet. Come by again and talk books with me a while, and perhaps I'll feel differently." },
    },
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
