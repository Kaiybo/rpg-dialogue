-- Ironforge's great and learned: the High Tinker, the Royal Historian, the Explorers' League,
-- a senator in the quarry, and the man who keeps the Stonefire's kegs.
-- Voice: bibles/ironforge_court.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mekkatorque", id = TODO_NPC("High Tinker Mekkatorque"), name = "High Tinker Mekkatorque",
  bible = "bibles/ironforge_court.md", role = "noble", tier = "major",
  communities = { "ironforge" }, temper = { "quick" }, values = { "inventive", "compassionate" },
  notices = { "craft", "kin" },

  impression = {
    first = "High Tinker Mekkatorque speaks fast, worries about whether people are eating, and has more ideas than he can test. Leading his people from someone else's city weighs on him more than he lets on.",
    third = "{name} met High Tinker Gelbin Mekkatorque, the elected leader of the gnomes, who works from Ironforge while Gnomeregan cannot be lived in.",
  },

  greetings = {
    { id = "g_tinker", text = "Hello, hello! Mind the floor, there's a gear loose somewhere; there's always a gear loose somewhere." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome! Good, good. Are you eating properly, and sleeping? Someone has to ask, and it may as well be me." },
    { id = "g_back", when = { metBefore = true }, text = "Splendid, you came back! I've had four ideas since you left, and only three of them were terrible." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}! I've had eleven ideas since then, and at least two of them worked, so I've been meaning to tell somebody." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "My, you've grown capable since we last spoke, and I mean that with great admiration. If Gnomeregan had a hundred like you, we'd have it back by spring." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the city has been saying lovely things about you, and I couldn't be happier to hear it. We guests in Ironforge need all the goodwill we can get!" },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear somebody in the city believed a story of yours that wasn't strictly true. Do be careful, because we gnomes are living on Ironforge's good graces." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! No, don't tell me what you're working on, let me guess: something that explodes. Everyone starts with something that explodes." },
    { id = "n_gnome_rad", cat = "kin", when = { race = "Gnome", deed = "dungeon:Gnomeregan" },
      text = "You've seen the city, haven't you, our city. It's there in your face; I know that look, because I see it in the mirror most mornings." },
    { id = "n_texts", cat = "origin", when = { origin = "gnome_forbidden_texts" },
      text = "Do you know, the archivists tell me a few volumes never made it out of the old library, the locked shelf, the ones with the clasps. I'm sure you wouldn't know anything about that, being so busy, but if you did, I'd only ask that you read them very carefully." },
  },

  start = "hello",
  nodes = {
    opn_gnomeregan = {
      lines = {
        { id = "opn_gnomeregan_q", text = "Half my council says we must go home, and the other half says we ought to build somewhere new and let the old city keep its ghosts. I'm the High Tinker, so I'm obliged to say 'home', but you're not obliged to anything. What would you do?" },
      },
      choices = {
        { text = "Take it back. A people needs its home.", next = "opn_gnomeregan_r_retake", fx = { affinity = 1, align = { honor = 1 }, opinion = { gnomeregan = "retake" } } },
        { text = "Build somewhere new. Gnomeregan is a grave now.", next = "opn_gnomeregan_r_abandon", fx = { align = { honor = -1 }, trait = { practical = 1 }, opinion = { gnomeregan = "abandon" } } },
        { text = "Seal it and let the dwarves guard the door.", next = "opn_gnomeregan_r_seal", fx = { affinity = -1, trait = { stern = 1 }, opinion = { gnomeregan = "seal" } } },
        { text = "I want to go home, High Tinker. That's all.", next = "opn_gnomeregan_r_retake", when = { race = "Gnome" }, fx = { affinity = 2, opinion = { gnomeregan = "retake" } } },
        { text = "Ironforge has room. Your people can stay as long as they like.", next = "opn_gnomeregan_r_welcome", when = { race = "Dwarf" }, fx = { affinity = 1, opinion = { gnomes = "welcome" } } },
        { text = "That's not mine to say, High Tinker.", next = "BACK" },
      },
    },
    opn_gnomeregan_r = {
      lines = {
        { id = "opn_gnomeregan_r_default", text = "Then I'll do the deciding, which is what they elected me for, and you can tell me afterwards whether I got it right." },
      },
      choices = {
        { text = "Something else, High Tinker.", next = "BACK" },
      },
    },
    opn_gnomeregan_r_retake = {
      lines = {
        { id = "opn_gnomeregan_r_retake", text = "Yes! Oh, good, I hoped you'd say that, and I'm going to write it down, because I need something cheerful in the file for the next council meeting." },
      },
      choices = {
        { text = "Something else, High Tinker.", next = "BACK" },
      },
    },
    opn_gnomeregan_r_abandon = {
      lines = {
        { id = "opn_gnomeregan_r_abandon", text = "Ah. Well, that's honest, and honesty's a useful measurement even when it's not the one you wanted. I'll keep it on the bench, but I'm still going home." },
      },
      choices = {
        { text = "Something else, High Tinker.", next = "BACK" },
      },
    },
    opn_gnomeregan_r_seal = {
      lines = {
        { id = "opn_gnomeregan_r_seal", text = "Seal it with our own people still inside? No, no, I can't, and I'd thank you not to say that in Tinker Town, because they'd take it rather badly." },
      },
      choices = {
        { text = "Something else, High Tinker.", next = "BACK" },
      },
    },
    opn_gnomeregan_r_welcome = {
      lines = {
        { id = "opn_gnomeregan_r_welcome", text = "That's very kind, and I'll tell the King you said so, though he'd say it himself. We'll try not to blow up too much of it while we're here." },
      },
      choices = {
        { text = "Something else, High Tinker.", next = "BACK" },
      },
    },
    xpt_mekkatorque = {
      big = true,
      lines = { { id = "xpt_mekkatorque_default", text = "Because we've nowhere else to be, I'm sorry to say, since Gnomeregan fell, and a gnome without a workshop will make one out of whatever company will have them. Your friend is carrying a city on their back, you know, so do help them carry it." } },
      choices = {
        { text = "We'll help them take Gnomeregan back, High Tinker.", next = "BACK", reply = "Thank you, truly, and I'll hold your company to that, because a gnome with friends at his back walks into the dark a great deal more bravely.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Gnomeregan is gone. Better to build something new elsewhere.", next = "BACK", reply = "Perhaps, and some of my engineers say the same, but I can't leave our people down there in the dark, not while there's any chance at all.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A puzzle, and a welcome one. If you can really hear the stone, you might hear what's happening under Gnomeregan without anyone walking back into that radiation. I'd never ask you to go, of course, but I'd dearly like to know what the earth says about the troggs, and about whoever let them in." } },
      choices = {
        { text = "I'll listen for Gnomeregan, High Tinker. I owe your people that.", next = "BACK", reply = "Thank you! Every scrap of news from below is worth more than a dozen of my own guesses, and I've been guessing for far too long.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The earth isn't a listening device for gnome engineers.", next = "BACK", reply = "No, it isn't, you're quite right, and I'm sorry if I made it sound that way, because I'm afraid I see everything as a device when I'm tired.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd welcome any help, but the radiation is a gnomish poison of our own making, and I'm not sure the green can mend what we broke. We'll take Gnomeregan back with our own hands first, and then I'll gladly ask your people what grows best in a clean tunnel." } },
      choices = {
        { text = "Mend it yourselves first. That's the right order of things.", next = "BACK", reply = "That's my thinking exactly. It's our mess, and a gnome cleans up after his own experiments, even the radioactive ones.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Pride won't clean a tunnel. Ask the kaldorei now.", next = "BACK", reply = "Oh dear, that's a very fair point, and pride has cost us a great deal already, so perhaps I'll write to Darnassus after all.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, enormously, for the troggs that poured out of the deep have spread all over Dun Morogh, and someone has to watch where they go. A hunter who could track them back to the city's outer tunnels would save my engineers a great many dangerous guesses." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet}! Splendid creature; I once designed a mechanical one, but it kept trying to fetch the furniture." },
      },
      choices = {
        { text = "I'll track them and report every tunnel, High Tinker.", next = "BACK", reply = "Splendid! Mark every tunnel you find, and I'll have it on the big map by morning, with a little red pin.", fx = { align = { order = 1 } } },
        { text = "I'll track them, but I'll deal with them my own way.", next = "BACK", reply = "Your own way is fine, so long as you write down where they came from, because knowing the tunnels matters more than the troggs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Patience, mostly, which I know is a terrible thing to ask of someone in plate. When we go back into Gnomeregan, and we will, I want the sick ones down there brought out, not cut down, because they're still my people, whatever the radiation's done to them." } },
      choices = {
        { text = "Then I'll bring them out alive. Mercy first, always.", next = "BACK", reply = "Thank you, oh, thank you, because those sick gnomes were our neighbours once, and I'd like them to have a chance to be again.", fx = { align = { light = 1 } } },
        { text = "If they attack, I'll defend myself. I can't promise more.", next = "BACK", reply = "That's fair, and I wouldn't ask you to die for it, but if you can, please try a little harder than you think you should.", fx = { align = { light = -1 } } },
        { text = "Something else, High Tinker.", next = "BACK" },
      },
    },
    xcl_gnome = {
      big = true,
      lines = { { id = "xcl_gnome_default", text = "And you came back up, which is more than the radiation lets most of us do! With Thermaplugg gone, the poor sick gnomes down there have nobody left giving them orders, and some of them were my neighbours once, so I'd like to think a few still remember their names." } },
      choices = {
        { text = "Then we go back for them. Nobody should be left behind.", next = "BACK", reply = "Exactly, that's exactly it! I'll start planning at once, though I'll need more engineers, and a great deal more lead shielding than we have.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The ones still down there are lost, High Tinker. Seal it and start over.", next = "BACK", reply = "I know some say so, and some nights I think it too, but I can't seal our own people away and still call myself their High Tinker.", fx = { align = { light = -1 } } },
        { text = "Could Gnomeregan ever be taken back now?", next = "xcl_gnome2" },
      },
    },
    xcl_gnome2 = {
      lines = { { id = "xcl_gnome2_default", text = "Not this year, and not the next, I'm afraid, because the radiation's soaked into the very bolts. But a city without Thermaplugg in it is a city that can be planned for, and planning is the one thing gnomes have never been short of." } },
      choices = {
        { text = "Then plan well, High Tinker. I'd like to see it.", next = "BACK" },
      },
    },
    xalt_mekkatorque = {
      big = true,
      lines = { { id = "xalt_mekkatorque_default", text = "{alt}! A {altrace} {altclass}, and very reliable about standing exactly where I asked, which in my experience is rarer than a working teleporter. I've pencilled that name onto my list for the return to Gnomeregan, and I'd be delighted to pencil yours in beside it." } },
      choices = {
        { text = "Count me in for Gnomeregan, High Tinker.", next = "BACK", fx = { affinity = 1 } },
        { text = "Standing still for your tests sounds dangerous, High Tinker.", next = "BACK" },
        { text = "Something else, High Tinker.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_gnome", when = { alt = { race = "Gnome" }, metBefore = false },
          text = "Have we met? No, no, I'm thinking of {alt}, a splendid gnome {altclass} who helped me test a pressure valve, and you have exactly the same posture of someone ready to dive for cover. I take that as a mark of good sense!" },
        { id = "h_alt_back", when = { alt = { days = 14 }, metBefore = true }, cooldown = "5d",
          text = "Ah, splendid, you're back! I was only just telling {alt} about my new pressure regulator, and the poor {altclass} nodded through all of it, which I've decided to count as enthusiasm." },
        { id = "o_gnomeregan_retake", tags = { "news" }, when = { opinion = { topic = "gnomeregan", stance = "retake" } },
          text = "There's my optimist! I put your answer in the council file, you know, right at the top, under a drawing of a very determined mechanostrider." },
        { id = "h_pt_mekkatorque", tags = { "news" }, when = { party = { race = "Gnome" } },
          text = "Is that a gnome in your company? Splendid! {companion} will be the one who fixes everything, I expect, and you'll be the one who explains to everybody else why it's now on fire." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Splendid, splendid, because I've a great many plans for Gnomeregan and each one has a little box marked 'someone very brave goes first'." },
        { id = "h_cl_gnome", tags = { "news" }, when = { cleared = "Gnomeregan", faction = "Alliance" },
          text = "Word is you went all the way down to the Engineering Labs and Thermaplugg won't be ruling anyone again. I drew up a plan to celebrate, and then I put it in the drawer, because there are still a great many gnomes down there." },
        { id = "h_default", key = true,
          text = "Gelbin Mekkatorque, High Tinker of Gnomeregan, and elected, I'll have you know. Gnomeregan isn't fit to live in just now, not since my advisor Thermaplugg betrayed us, so we tinker in Ironforge, by the King's kindness." },
        { id = "h_betrayal", tags = { "news" }, when = { questActive = TODO_QUEST("The Grand Betrayal") },
          text = "Thermaplugg, my own advisor, is down in the city still, ruling the poor sick souls we left behind. I sentenced him, and now someone has to carry the sentence down there." },
        { id = "h_betrayal_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Grand Betrayal") },
          text = "So Thermaplugg is finished. I expected to feel lighter, and instead I mostly feel tired, but thank you all the same." },
        { id = "h_gnomeregan_resolved", tags = { "news" }, when = { thread = { id = "gnomeregan_lost", state = "resolved" } },
          text = "I read it out at the assembly, every word, with Thermaplugg's old lenses on my nose. Nobody threw anything, which in Tinker Town is a standing ovation, and Gnoarn has stopped holding meetings and started holding planning sessions, which are louder." },
        { id = "h_gnomeregan_soured", when = { thread = { id = "gnomeregan_lost", state = "soured" } },
          text = "I gave them Thermaplugg, as you said, and they cheered, and I went home early. It was the right speech for them, I expect, and I've filed it in the drawer with the others I'm not proud of." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A people whose island the winds carried into the sky! I have so many questions, about winds and loads and whether the islands creak. Do they creak?" },
        { id = "h_refugee", when = { origin = "gnome_gnomeregan_refugee" },
          text = "You got out. I say it to everyone who did: you got out, and I'm glad. The rest we'll sort out together." },
        { id = "h_firstaltar", when = { origin = "gnome_first_altar" },
          text = "Ah, our priest! Rohan writes me the kindest notes about you, which is more than he writes about my engineers, and I keep meaning to come down to the Hall and see what all the fuss over the Light is about. Perhaps you'll explain it with diagrams." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, splendid! Gnomes never kept priests of our own, we kept wrenches, so the dwarves in the Hall of Mysteries have had to be very patient with us." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Oh, splendid, it's you! Mind the coil there, it bites, and do sit down, because I've a hundred things to show you and time for about four." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Do you eat properly out there? I only ask because my people forget to, and you look as though you'd forget too." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A kaldorei druid! Your people know more about living with the land than we gnomes ever learned, and after Gnomeregan, I'm humble enough to say so." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! My engineers have argued about your sort for weeks. Sixty percent think you're picking up seismic vibrations, and the rest think you're simply very sensitive." },
      },
      again = {
        { id = "h_again", text = "Where were we? I've lost the thread again; I lose a lot of threads, so I keep them in a drawer." },
        { id = "h_again2", text = "Ask away, while the brain's still warm." },
      },
      choices = {
        { text = "What happened to Gnomeregan?", next = "fall" },
        { text = "What are you building?", next = "build" },
        { text = "Tell me about Thermaplugg.", next = "thermaplugg" },
        { text = "Gnomes seem to manage well enough in Ironforge.", next = "exiles" },
        { text = "Can the Light do anything for your people?", next = "light", when = { class = "PRIEST" } },
        { text = "Will we ever go home, High Tinker?", next = "home_q", when = { race = "Gnome" } },
        { text = "I'm an engineer myself.", next = "eng", when = { profession = "Engineering" } },
        { text = "I studied what Gnomeregan sealed away, High Tinker.", next = "lock", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "I studied magic in Gnomeregan, before.", next = "mage", when = { race = "Gnome", class = "MAGE" } },
        { text = "I've been back down into the city, High Tinker.", next = "rogue", when = { race = "Gnome", class = "ROGUE" } },
        { text = "I held the line when we ran.", next = "rear", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "Could a hunter be of any use to Gnomeregan, High Tinker?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you ask of a paladin, High Tinker?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a druid help cleanse the poison from Gnomeregan?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does Gnomeregan make of dwarven shamans, High Tinker?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been to the bottom of Gnomeregan, High Tinker.", next = "xcl_gnome", when = { cleared = "Gnomeregan", faction = "Alliance" } },
        { text = "Why do gnomes make such good companions on the road?", next = "xpt_mekkatorque", when = { party = { race = "Gnome" } } },
        { text = "I held the rearguard, High Tinker. Then the radiation came.", next = "xorig_rear", when = { origin = "gnome_rearguard" } },
        { text = "I've heard Tinker Town arguing over who lost Gnomeregan.", next = "gnomeregan_word",
          when = { thread = { id = "gnomeregan_lost", beat = "b5_mekkatorque", state = { "stirring", "unfolding" } } } },
        { text = "Who's this other helper of yours, High Tinker?", next = "xalt_mekkatorque", when = { alt = true } },
        { text = "I kept Thermaplugg's ledgers, High Tinker. I saw where the money went.", next = "xorig_ledger", when = { origin = "gnome_thermaplugg_clerk" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    gnomeregan_word = {
      big = true,
      lines = { { id = "gw_default", text = "Then you know how it sounds from the outside, which is more than I can manage from in here. When I stand up in front of them, do I tell them the order was mine as well as his, or do I let them have Thermaplugg, who's earned every bit of it?" } },
      again = { { id = "gw_again", text = "So, what do I tell them at the assembly? I've drafted both speeches, and I hate them equally." } },
      choices = {
        { text = "Tell them it was your hand too. They'll follow you further for it.", next = "gnomeregan_own",
          fx = { thread = { id = "gnomeregan_lost", state = "resolved" }, affinity = 3, align = { honor = 1 }, standing = { ironforge = 2 } },
          journal = { first = "Told Mekkatorque to tell Tinker Town the order was his as well as Thermaplugg's. He said he'd read it out with Thermaplugg's lenses on.",
                      third = "{name} counselled High Tinker Mekkatorque to own his part in Gnomeregan's fall before his people." } },
        { text = "Give them Thermaplugg. Your people need hope, not a second villain.", next = "gnomeregan_his",
          fx = { thread = { id = "gnomeregan_lost", state = "soured" }, affinity = -1, align = { honor = -1 }, trait = { skeptical = 1 } },
          journal = { first = "Told Mekkatorque to let Thermaplugg carry the blame alone. He agreed, and didn't look as though it helped.",
                      third = "{name} counselled High Tinker Mekkatorque to let Thermaplugg carry the blame for Gnomeregan alone." } },
        { text = "What would Thermaplugg tell them?", next = "gnomeregan_thermaplugg" },
      },
    },
    gnomeregan_thermaplugg = {
      lines = { { id = "gt_default", text = "That it was my signature, of course, and he'd be quite right, which was always the irritating thing about him. He was right about all the small things, and that's how he got close enough to be wrong about the big one." } },
      choices = { { text = "Then I'll give you an answer.", next = "gnomeregan_word" } },
    },
    gnomeregan_own = {
      lines = { { id = "go_default", text = "That's what I was afraid you'd say, and what I was hoping you'd say, which I suppose means it's the right answer. I'll write it down before I lose my nerve, and I'll read it out wearing his lenses, because I'd like them to see I've stopped hiding behind them." } },
      choices = { { text = "Good luck, High Tinker.", next = "END" } },
    },
    gnomeregan_his = {
      lines = { { id = "gh_default", text = "Perhaps you're right, and they'll sleep better for it. I'll say his name and leave mine off the page, and I expect I'll be the one gnome in Tinker Town who doesn't sleep better at all." } },
      choices = { { text = "...", next = "END" } },
    },
    xorig_ledger = {
      lines = {
        { id = "xoledger_default", text = "You did? Then you saw what I didn't, which is a sentence I've had to say far too often since the fall. I'd very much like to see those payments, every one, and I'd like to ask what you did with the books they bought, though I suspect I know. Will you tell me, or must I guess?" },
      },
      choices = {
        { text = "I'll write down every payment I remember.", next = "BACK", fx = { affinity = 2, trait = { honest = 1 } } },
        { text = "The books were forbidden. I read them anyway.", next = "BACK", fx = { affinity = -1, trait = { proud = 1 } } },
        { text = "Some things are better left unsaid, High Tinker.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    xorig_rear = {
      lines = {
        { id = "xor_default", text = "The rearguard. Oh, my dear, I've read every name on that roster and I still read it most nights, because the radiation was my decision, made to drive out the troggs, and it drove out a great many of my own people with them. You held while the others ran, and then you had to run from me." },
      },
      choices = {
        { text = "You did what you thought would save the city.", next = "xorig_rear2", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "It cost us everything. I haven't forgiven it.", next = "xorig_rear2", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "What happened to the others in my corridor?", next = "xorig_rear2" },
      },
    },
    xorig_rear2 = {
      lines = {
        { id = "xor2_default", text = "Some came up after you, and some we're still waiting for, and I can't say which is which until we're back inside. When we go home, and we will, I'd like the rearguard at the front this time, if you'll have the honour." },
      },
      choices = {
        { text = "I'll be there, High Tinker.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fall = {
      big = true,
      lines = {
        { id = "f_default", text = "Troggs came up from below, and we fought them in secret for years. Then a plan to flush them out went wrong, and the poison found our homes instead. Most of my people died in a day." },
      },
      choices = {
        { text = "I'm sorry.", next = "sorry", fx = { affinity = 2, trait = { kind = 1 }, learn = { "gnomeregan" } } },
        { text = "Whose plan was it?", next = "whose", fx = { learn = { "gnomeregan" } } },
        { text = "Why fight them in secret?", next = "secret" },
      },
    },
    sorry = {
      lines = { { id = "s_default", text = "So am I, every morning. Then I get up and draw something, and the drawing helps; gnomes are built to fix things, even the things we broke." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    whose = {
      lines = { { id = "w_default", text = "Thermaplugg proposed it, and I approved it. Both of those things are true, and I'll thank you not to let anyone tell you only one of them." } },
      choices = {
        { text = "That's a heavy thing to carry.", next = "BACK", fx = { affinity = 2 } },
        { text = "Then you share the blame.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Did he know it would fail?", next = "thermaplugg" },
        { text = "What keeps you up at night, High Tinker?", tag = "Persuade", next = "whose_list",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Gnome" }, { class = "PRIEST" } } } },
          fail = { next = "whose_busy", fx = { affinity = -1 } } },
      },
    },
    secret = {
      lines = {
        { id = "sc_default", text = "Lordaeron was burning, and the Alliance had cries for help enough, so we didn't cry. We held the troggs off ourselves, for five long years." },
      },
      choices = {
        { text = "That was brave.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That was proud.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Where did the troggs come from?", next = "troggs" },
      },
    },
    troggs = {
      lines = {
        { id = "tg_default", text = "Dwarven digs at Uldaman woke them, and our machines drew them like moths to a lamp. It was nobody's fault, and it became everybody's problem." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } } },
    },

    build = {
      lines = { { id = "b_default", text = "A way home, or bits of one, anyway: filters, suits, a better tram car. The tram was mine too, you know, and that one went rather well." } },
      choices = {
        { text = "How did you build the tram?", next = "tram" },
        { text = "How do filters get you home?", next = "home_plan" },
        { text = "It's a marvel.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tram = {
      lines = {
        { id = "tm_default", text = "Magni wanted a faster road to Stormwind, and my first model of it was made of pie tins. The real one had rats in it for a month, and we don't talk about the rats." },
      },
      choices = {
        { text = "Tell me about the rats.", next = "rats" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rats = {
      lines = {
        { id = "ra_default", text = "Large ones! I had to report them to General Turalyon himself, four pages with diagrams, and I like to think he read them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    home_plan = {
      lines = {
        { id = "hp_default", text = "Suits that keep the poison out, and filters that scrub the air. Then we need enough gnomes alive and willing to walk back in, and that last part is the hard one." },
      },
      choices = {
        { text = "Should Gnomeregan be retaken at all, High Tinker?", next = "opn_gnomeregan" },
        { text = "I'd walk in with you.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thermaplugg = {
      lines = {
        { id = "th_default", text = "He was my best friend, once. We graduated together, and he gave me these lenses; then he became my chief advisor, and he wanted my chair more than anything." },
      },
      choices = {
        { text = "Why keep the lenses?", next = "lenses" },
        { text = "Where is he now?", next = "thermaplugg_now" },
      },
    },
    lenses = {
      lines = {
        { id = "le_default", text = "Because they're very good lenses, and because I'd like to remember that I didn't see it coming. That's the useful part to remember." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thermaplugg_now = {
      lines = {
        { id = "tn_default", text = "Down in the city, ruling the ones we couldn't save. They're sick and he's mad, and he calls himself king of it, the king of nothing." },
        { id = "tn_done", when = { questDone = TODO_QUEST("The Grand Betrayal") },
          text = "Gone, thanks to you. I keep waiting to feel something tidy about it, because engineers like things tidy." },
      },
      choices = {
        { text = "I'll go down there.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    exiles = {
      lines = {
        { id = "ex_default", text = "Very well, mostly. The dwarves stare, and then they lend you a hammer, and Tinker Town is ours by the King's kindness, so we try to be worth the room." },
      },
      choices = {
        { text = "The stares must bother you.", next = "stares" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stares = {
      lines = {
        { id = "st_default", text = "Less than the cold. A gnome in Ironforge learns to be twice as clever and half as loud. I'm still working on the half as loud." },
      },
      choices = {
        { text = "Ha. Keep working on it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    light = {
      lines = {
        { id = "lt_default", text = "Can it? I'd dearly love to know. The priests in the Hall of Mysteries pray over the sick while I take readings, and neither of us has cured anyone yet." },
      },
      choices = {
        { text = "Then let me try.", next = "light_try" },
        { text = "Faith and readings can work together.", next = "BACK", reply = "They can, and I'd like them to, so I'll keep taking my readings and let the priests keep praying, and perhaps we'll meet in the middle.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Your readings will cure the plague long before prayers do.", next = "BACK", reply = "I hope so, I truly do, but I'd still rather have both, because when you're desperate you don't turn away any kind of help.", fx = { align = { light = -1 } } },
      },
    },
    light_try = {
      lines = {
        { id = "lr_default", text = "Then try, and tell me what you find, good or bad, and especially bad, because bad results are the ones that teach you something." },
      },
      choices = {
        { text = "I will.", next = "BACK", reply = "Splendid! I'll be waiting with my notebook, and if it fails, well, a failure written down is still data.", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "If it fails, I'll trust your readings instead.", next = "BACK", reply = "That's very kind, and I'll take the help, though I'll also take your report on the Light, because bad results are still results.", fx = { align = { light = -1 } } },
      },
    },

    home_q = {
      big = true,
      lines = {
        { id = "hq_default", text = "Yes. I don't know when, and I won't lie to you about how, but yes, so hold on to your tools." },
      },
      choices = {
        { text = "I'll be ready.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I've stopped hoping.", next = "home_q2" },
      },
    },
    home_q2 = {
      lines = {
        { id = "hq2_default", text = "Then let me do the hoping for a while; that's what you elected me for, that and the mechanostrider." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    eng = {
      lines = {
        { id = "en_default", text = "Then you know the rule: measure twice, and keep your eyebrows somewhere safe. What are you building?" },
      },
      choices = {
        { text = "Something that explodes.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something that helps people.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Nothing that works yet.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    whose_list = {
      big = true,
      lines = {
        { id = "wl_default", text = "A list. I made it on the tram platform with a borrowed pencil, every gnome who came out of Gnomeregan alive, and it's ever so much shorter than any list I've written before or since." },
        { id = "wl_after", text = "I read it every night, front to back and then back to front, looking for a name I missed, because some nights I'm quite certain someone came out after I stopped writing. I haven't found one yet, but I'm very thorough, and I'll keep looking." },
        { id = "wl_gnome", when = { race = "Gnome" }, text = "Your name's on it, I expect, or your family's, so you know exactly which list I mean. Don't tell the apprentices; they think I'm up late inventing things." },
      },
      choices = {
        { text = "That list is why we'll go home.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "You can't carry all of them, High Tinker.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    whose_busy = {
      lines = {
        { id = "wb_default", text = "Oh, gears, mostly, and the occasional sprocket! Nothing that would interest you, I promise, and I really must get back to this housing before it cools." },
        { id = "wb_default2", text = "Up at night? I sleep like a well-oiled flywheel, thank you, which is to say not at all and very efficiently. Shall we talk about the tram?" },
      },
      choices = {
        { text = "Of course, High Tinker.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      big = true,
      lines = {
        { id = "lk_default", text = "Ah. Yes. I'd heard some of our people had taken up the darker sort of study, and I'd hoped it was a rumor I could file under rumors. I don't like it, but I'd like to understand it, if you'll explain." },
        { id = "lk_texts", when = { origin = "gnome_forbidden_texts" },
          text = "The sealed stacks, the ones the Assembly voted to lock and then forgot the vote on? Oh dear, I signed that order myself, I think, and now here you are, reading what I locked." },
      },
      choices = {
        { text = "Our people need every weapon now, High Tinker.", next = "BACK", reply = "Perhaps they do, and I can't argue with the need, but I'd like to understand it before I decide, so we'll talk again soon.", fx = { align = { light = -1 } } },
        { text = "I keep it leashed. I know what it costs.", next = "BACK", reply = "I'm glad to hear it. Gnomeregan has had quite enough of things that were supposed to stay leashed.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Why lock the books at all?", next = "lock_why" },
      },
    },
    lock_why = {
      lines = {
        { id = "lw_default", text = "Because a book's a very tempting machine with no safety catch, and gnomes pull levers to find out what they do. I trusted the wrong advisor once already, so I'm in no hurry to trust a demon." },
      },
      choices = {
        { text = "That's fair, High Tinker.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = {
        { id = "mg_default", text = "Then you're one of the few who got out with their spellbooks, and I'd guess you left half your class behind. Bink, our mage trainer, keeps a list in the Hall of Mysteries of every student who made it to the surface, and it's a short list." },
        { id = "mg_last", when = { origin = "gnome_last_student" },
          text = "The last one up from the lecture halls, I'm told, still carrying a satchel of notes nobody else lived to read. I'm so sorry, and I'm so glad you're here, both at once." },
      },
      choices = {
        { text = "Magic will rebuild Gnomeregan, High Tinker.", next = "BACK", reply = "It will help, I'm sure of it, and Bink will be glad to hear you said so, though she'll want your name on her list too.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I don't study for Gnomeregan anymore. I study for me.", next = "BACK", reply = "That's fair, and nobody could blame you after what we've lost, but I hope one day you'll come back and study for both.", fx = { align = { order = -1 } } },
        { text = "Surely magic could clear the radiation.", next = "mage_rad" },
      },
    },
    mage_rad = {
      lines = {
        { id = "mr_default", text = "I've asked the Kirin Tor, very politely and at some length, and they wrote back that it's an interesting problem. When a Dalaran mage calls something interesting, it means they haven't the faintest idea either." },
      },
      choices = {
        { text = "Then we'll find the answer ourselves.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      big = true,
      lines = {
        { id = "ro_default", text = "Back down? Into the city, past the troggs and the leper gnomes, without an expedition or a permit? I ought to scold you, and instead I want to know whether my workshop on the fourth tier is still standing." },
        { id = "ro_scav", when = { origin = "gnome_scavenger" },
          text = "Oh, you're one of the ones who slips down for parts and sells them in Tinker Town. Master Mechanic Castpipe complains about you weekly, and weekly I tell him to buy what you bring." },
      },
      choices = {
        { text = "Your workshop's picked clean, High Tinker. I'm sorry.", next = "rogue_shop" },
        { text = "What's left down there belongs to whoever can carry it.", next = "BACK", reply = "Then you'd better bring it to me first, so I can decide what belongs to whom, because I'd hate for my workshop to end up in the market.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Everything I bring up goes back to our people.", next = "BACK", reply = "Oh, that's wonderful! I'll forgive the missing permit entirely; every scrap you bring up is a little piece of home.", fx = { align = { order = 1 }, affinity = 2 } },
      },
    },
    rogue_shop = {
      lines = {
        { id = "rs_default", text = "Well, it was a workshop, not a shrine, and I'd sooner the parts kept somebody warm than rusted in the dark. Only, if you ever find a little brass bird with a bent wing, bring it up, would you?" },
      },
      choices = {
        { text = "I'll keep an eye out.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rear = {
      big = true,
      lines = {
        { id = "re_default", text = "Then you were one of the gnomes standing between the troggs and the ones running, while I was at the front of the line giving orders. I've never known quite how to thank people like you, so I'll just say it badly: thank you." },
        { id = "re_guard", when = { origin = "gnome_rearguard" },
          text = "The rearguard, at the last gate. I read every name on that roster, and there were more names than there were gnomes coming out, and you're one of the ones who came out." },
      },
      choices = {
        { text = "You gave the order to vent the city.", next = "rear_vent" },
        { text = "Somebody had to hold. I'm glad it was me.", next = "BACK", reply = "And I'm glad too, more than I can say, because there are gnomes in Tinker Town today who'd not be there without you.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "I held because there was no way out behind me.", next = "BACK", reply = "That's honest, and honesty is a rare thing in a hero, but you held all the same, and I'll never forget that you did.", fx = { align = { honor = -1 } } },
      },
    },
    rear_vent = {
      lines = {
        { id = "rv_default", text = "I did, on my advisor's urging, and you heard it from the wrong side of the door. Thermaplugg pressed for it, but it was my hand that signed it, and I've never once let myself forget that." },
      },
      choices = {
        { text = "It was the right order, High Tinker.", next = "BACK", reply = "You're kind to say it, and perhaps it was. It still doesn't help me sleep.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "It cost too much. You know that.", next = "BACK", reply = "I know it, every single day. I'd rather be reminded than forget, even once, what it cost.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Oh, that's very kind of you, and I'll admit it's nice to hear, because most of what I hear all day is what's broken. I'd say my spirits are up a good twelve percent." },
        { id = "s2", text = "You noticed the work! Hardly anyone does, they only notice when it stops working, so thank you, truly." },
      },
      fail = {
        { id = "f1", text = "That's generous, but I'm the gnome who lost Gnomeregan, and I've learned to weigh praise carefully since then. Yours came out rather light on the scale, I'm afraid." },
        { id = "f2", text = "Hm, I've run the numbers on that compliment, and about ninety percent of it is grease. I use a great deal of grease, friend, so I do know it when I see it." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Yes, well, I've been called worse by my own apprentices, and usually while something was on fire. You're quite right to poke at me, since a tinker who can't be laughed at stops checking his sums." },
        { id = "s2", text = "Oh, very good, I'm writing that one down. If you can needle a High Tinker and make him laugh, you ought to meet my engineers, who've been trying for years." },
      },
      fail = {
        { id = "f1", text = "I can take a joke about my height, my goggles or my inventions, but that one was aimed at my people, and they've lost enough. I'd thank you not to try it again." },
        { id = "f2", text = "I've heard that sort of thing before, generally from people who've never built anything. It doesn't make me angry so much as tired, and I haven't the hours to spare for being tired." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "He takes half a step back and nearly trips over a loose gear.", text = "All right, all right, there's no need for that, because I'm a tinker and not a soldier. You've made me nervous enough to drop a perfectly good spanner, so let's talk sensibly." },
        { id = "s2", text = "Goodness, you do loom, don't you? I've no wish to quarrel with anyone in Tinker Town, so say what you need and I'll see whether it can be managed." },
      },
      fail = {
        { id = "f1", text = "I walked out of Gnomeregan with radiation in the air and troggs behind me, so I'm afraid a hard look doesn't register on any gauge I own. Do try asking nicely, since it has a much better success rate." },
        { id = "f2", text = "You're standing in a dwarven city full of gnomes who'd take that very personally, and half of them carry wrenches. I'd reconsider your approach, friend, purely as a matter of engineering." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "I'd rather not go into that with someone I've only just met, if it's all the same to you. Some things I keep in the locked drawer, and you haven't got the key yet." },
      { id = "gt2", text = "That's a subject I'm careful with, and I don't know you well enough to be careless. Ask me again when we've a little more history between us." },
    },
    knows = {
      { id = "tp_knows", text = "I've a head full of schematics and only a little room left over for everything else, but I'll share what's in there. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "Gearshaft University, then the mechanostrider, then a great many awards, until my apprentices made me build a trophy case. I keep spare parts in it." } },
    advice = { { id = "tp_ad", text = "Test it before you trust it. I learned that one the most expensive way there is.", next = "fall" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our home, and radiant now, though not in a good way, with troggs in the halls and worse in the deep workshops. We'll go back; I've already drawn the plans." } },
    dark_iron = { { id = "tp_dark_iron", text = "That's Magni's business, and he carries it heavily. I'd lend him every gnome I have if he asked, but he hasn't asked." } },
    explorers_league = { { id = "tp_league", text = "Wonderful people, and they write everything down, which I wish we had done. We'd lost half our records before we even knew what we'd lost." } },
    uldaman = { { id = "tp_uldaman", text = "That's where the troggs first woke, I'm told, and I've no plans to visit, because I've met enough troggs for one lifetime." } },
    troggs = { { id = "tp_troggs", text = "They came up under our city first, and whatever they are, they're not finished yet.", next = "troggs" } },
    dalaran = { { id = "tp_dalaran", text = "Gnomes and Dalaran go together like gears and grease! A great share of the city's best spellwork has gnomish hands in it, and I'm delighted they're rebuilding, though I do wish someone would answer my letters about the mana conduits." } },
    booty_bay = { { id = "tp_booty_bay", text = "Goblins, goblins and more goblins, all building things too fast and charging too much for them. I admire their speed and deplore their safety margins, which, coming from me, I realize is saying something." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "A goblin town in the middle of a desert, with water pumped up from who knows how deep! I'd love a look at their pumps, though I suspect they'd charge me for the look." } },
    scourge = { { id = "tp_scourge", text = "A plague that walks, and it doesn't care whether you're a gnome or a giant. I keep wondering whether it could be cured like any other contamination, and then I remember Gnomeregan and stop wondering quite so loudly." } },
    magni = { { id = "tp_magni", text = "King Magni took in a whole people with nowhere to go, and he's never once made us feel like guests. I owe him more than any machine could repay, and I tell him so, and he tells me to stop." } },
    thrall = { { id = "tp_thrall", text = "An orc who freed his people and made peace where he could, by all accounts, and a clever one. I'd love to know how they build those spiked towers, though I'm not sure I'd love to be invited in to see." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Silas Darkmoon's carnival has some of the finest steam-driven contraptions I've ever seen at a fair, and some of the worst. I sent an apprentice to study them and he came back with a goldfish and no notes." } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid. I have only the one department, and it's on fire." } },
  },
}

P:NPC {
  key = "archesonus", id = TODO_NPC("Royal Historian Archesonus"), name = "Royal Historian Archesonus",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "curious", "honest" },
  notices = { "lore" },

  impression = {
    first = "Royal Historian Archesonus learned my voice before she learned my name, since her eyes went long ago. Her memory has more than made up for it.",
    third = "{name} spoke with Royal Historian Archesonus, the blind keeper of Ironforge's history who knows her visitors by their voices.",
  },

  greetings = {
    { id = "g_voice", text = "That's a step I don't know. Come closer and speak, so I can learn yer voice, for that's how I keep my visitors." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I know that voice. Sit, sit, and tell me where we left off." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "Ye've read The Seven Kingdoms; I can hear it in how ye say 'Khaz Modan', proper-like. Good for you, because most don't bother." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The ones who held, not the ones who charged, for a hero who charges alone only earns a nicer tombstone. In the War o' the Three Hammers it was a shield line that turned the Dark Irons back from our gates, and I may be the last who still reads its captains' names." } },
      choices = {
        { text = "A shield line deserves more honour than any hero.", next = "BACK", reply = "Ye've a historian's heart for sayin' it. The books are full o' heroes an' nearly empty o' shield lines, an' I've spent forty years tryin' tae fix that.", fx = { align = { order = 1 } } },
        { text = "Lines hold, but it's heroes who win wars.", next = "BACK", reply = "Some wars, maybe, but I've read a great many o' them, an' I've yet tae find a hero who won one wi'out a line behind him.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, for the first rams ever ridden in Khaz Modan were tamed by hunters in the high snows, long before the Three Hammers fell out. A hunter with a rifle on a ram's back is as old an Ironforge picture as a smith at the Forge, whatever the smiths tell ye." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, for the first rams ever ridden in Khaz Modan were tamed by hunters in the high snows. An' I can hear yer {pet} breathin' at yer heel, slow an' easy, which tells me it trusts ye." },
      },
      choices = {
        { text = "Then I'll carry that tradition with pride.", next = "BACK", reply = "Good. It's an old an' proud one, an' the hunters o' the high snows would be glad tae know it's in good hands.", fx = { align = { order = 1 } } },
        { text = "Old traditions don't hunt for me. My own way does.", next = "BACK", reply = "Fair enough, but every tradition started wi' somebody doin' it their own way, so ye might be startin' one yerself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than the heroes would like tae admit, for half o' what we know about the Dark Iron came from dwarves who crept intae Thaurissan's halls an' crept back out. Their names are seldom written down, which is the price o' that sort o' work." } },
      choices = {
        { text = "Then I'll serve the same way, and never ask for a name.", next = "BACK", reply = "That's a rare thing tae hear in this hall. I'll keep a page for ye in my heart, if no' in my books.", fx = { align = { honor = 1 } } },
        { text = "Then I'll make sure my name gets written down, Historian.", next = "BACK", reply = "Ha, then I'll write it, but ye'll have tae earn it first, an' I'll be listenin' very closely tae what ye do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That a sorcerer-thane who thinks he's master o' a fire is usually its servant before the night's out. Thaurissan called Ragnaros intae the world tae win a war, an' the Searing Gorge is what's left o' his victory." } },
      choices = {
        { text = "Power must be held in check, or it burns the holder.", next = "BACK", reply = "It must. The Searing Gorge is a very large reminder o' what happens when it isnae, an' it's still smokin'.", fx = { align = { order = 1 } } },
        { text = "Thaurissan simply wasn't strong enough. A greater mage might have managed.", next = "BACK", reply = "That's what Thaurissan thought, an' it's what every sorcerer since has thought, an' I've a very long shelf o' their mistakes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Very little, I'm ashamed tae say, mostly that a demigod named Cenarius taught the night elves an' that they slept away the centuries in their dreams. It makes poor history but a fine story." } },
      choices = {
        { text = "It's no story. Our order guards the world still.", next = "BACK", reply = "Then sit an' tell it, for I've a great many gaps tae fill, an' my quill's been dry all week.", fx = { align = { light = 1 } } },
        { text = "Old tales are best left to the old.", next = "BACK", reply = "Maybe they are, but an old historian's the right person tae leave them tae, an' I'll be waitin' when ye change yer mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That they came late an' stayed long, for it took Lordaeron's priests a good while to convince a dwarf the Light could do anything a good hammer couldnae. Once convinced, they were stubborn about it, which is the dwarven way, an' they stood with Uther's companies through the worst of the Second War." } },
      choices = {
        { text = "Then I'll be as stubborn in my oaths as they were.", next = "BACK", reply = "That's the spirit! Stubbornness in a good cause is the best thing a dwarf has tae offer the world, an' ye've plenty.", fx = { align = { order = 1 } } },
        { text = "Stubbornness lost Lordaeron. A paladin should know when to bend.", next = "BACK", reply = "Did it, now? In my reading, bendin' has lost more kingdoms than stubbornness ever has.", fx = { align = { order = -1 } } },
        { text = "Tell me something else, Historian.", next = "BACK" },
      },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then ye've closed a book that opened with his ancestor, the sorcerer-thane who called up Ragnaros in the War of the Three Hammers and burned his own people's land to cinders. Every emperor since has served the Firelord and none ever found the courage to stop, so I'll not pretend to mourn this one." } },
      choices = {
        { text = "Even Thaurissan was a dwarf once. I take no joy in it.", next = "BACK", reply = "That's a kind thought. Most who come back from that mountain only want tae boast, so I'll write yours down.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He made his choice, Historian, and he got what he earned.", next = "BACK", reply = "Maybe he did. I'll still write his name in the book, for even a villain deserves tae be remembered rightly.", fx = { align = { light = -1 } } },
        { text = "Who rules the Dark Iron now?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "I can't say, and that's what worries me. A people who've knelt to fire for more than two hundred years don't learn to stand in a day, and whoever picks up that crown will have Ragnaros breathing down his neck." } },
      choices = {
        { text = "Then your histories have another chapter coming.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin; I can hear the plate, an' the way ye stand when ye stop. The Silver Hand has a chapter in my histories, an' it's not a short one." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths", faction = "Alliance" },
          text = "They tell me Emperor Thaurissan is dead, slain on his own throne in the Depths. I've kept his family's story most of my life, and I never thought I'd live to hear the end of it." },
        { id = "h_default", text = "Archesonus, historian to the King. My eyes went long ago, but my memory didn't, so ask me anything about Ironforge and I'll tell ye more than ye wanted." },
        { id = "h_thaurissan", tags = { "news" }, when = { questActive = TODO_QUEST("The Smoldering Ruins of Thaurissan") },
          text = "Sit, and I'll tell ye of Thaurissan, the Dark Iron city that stood where the Burning Steppes are now. Mind, it's not a short story, and it doesn't end well for anyone." },
        { id = "h_books", when = { metBefore = true },
          text = "I wrote on the fall of Lordaeron, ye know, and on plagues and curses, or dictated it, rather. My scribe has the patience of a mountain." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Now there's a voice I can't place, elven but with wind in it. There's nothing about yer folk in my books, so come back and tell me things, and there will be." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest; I can hear the vestments. I wrote a book on plagues and curses, and priests either thank me for it or argue with it, and I enjoy both." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "The Cenarion Circle, here in the court! I've read o' yer order in the old accounts o' the War o' the Ancients, though I confess the details are hazy." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye walked in so softly I nearly missed ye, an' a historian should miss nothin'. Have ye come tae read, or tae listen at doors?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at my door! I hope ye've come tae ask about Thaurissan, for there's no better lesson in what happens when power is summoned carelessly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior; I can hear it in the way ye stand, all weight and no hurry." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, by the smell o' the hills on ye; my nose has grown sharp since my eyes went." },
      },
      again = {
        { id = "h_again", text = "Where were we? Ah, I remember; I always remember." },
        { id = "h_again2", text = "Go on, ask me what ye like. I've nowhere to be, for I'm a historian, an' the mountain's not going anywhere either." },
      },
      choices = {
        { text = "What do dwarven records say about druids?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me the Dark Iron's history, Historian.", next = "thaurissan" },
        { text = "The Dark Iron seem busier than usual these days.", next = "now" },
        { text = "What have you written?", next = "books" },
        { text = "How did Ironforge begin?", next = "three_hammers" },
        { text = "I was there when Lordaeron fell.", next = "witness", when = { origin = "human_lordaeron_refugee" } },
        { text = "Your plague book. Did the Light help anyone?", next = "plague_light", when = { class = "PRIEST" } },
        { text = "Have you written on curses? I've studied a few myself.", next = "curses", when = { class = "WARLOCK" } },
        { text = "What do your histories say of the Wildhammer?", next = "wildhammer", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Have spies ever served the history of Ironforge?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What does Thaurissan teach a mage, Historian?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which warriors does Ironforge's history remember best, Historian?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the histories speak of dwarven hunters, Historian?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do your histories say of the Silver Hand's dwarves?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I was there when Thaurissan fell, Historian.", next = "xcl_brd", when = { cleared = "Blackrock Depths", faction = "Alliance" } },
        { text = "Another time.", next = "END" },
      },
    },

    thaurissan = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "The dwarven clans were at war with each other then. The Dark Iron city burned in one great blast, an' the land round it turned to ash, and what crawled out o' the ash went into the mountain and built again, stubborn as any dwarf." },
      },
      choices = {
        { text = "What made the blast?", next = "burn" },
        { text = "What did they build?", next = "build", fx = { learn = { "dark_iron" } } },
        { text = "A dark story.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } },
      },
    },
    burn = {
      lines = {
        { id = "bu_default", text = "We do not know, {g:lad|lass}, and I've asked every book in the mountain. Every account I've read stops at the same place, like a tunnel that ends at bare rock." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    build = {
      lines = { { id = "b_default", text = "Blackrock Spire, and fortresses in the Searing Gorge: a whole kingdom under the ash. Some say something old and hot sits beneath them all, giving the orders, and I record that it's said." } },
      choices = {
        { text = "Something old and hot?", next = "old_evil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old_evil = {
      lines = {
        { id = "oe_default", text = "I record what's said, and I don't record what I can't confirm. Go into that mountain and find out, if ye're ever able, and I'll write it down properly." },
      },
      choices = {
        { text = "Maybe one day.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Some things are better unconfirmed.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    now = {
      lines = { { id = "n_default", text = "Busier than they've been in a long while. Forts in the Badlands, diggers in Uldaman, and they struck the dam at Loch Modan. Ye don't do all that without a plan." } },
      choices = {
        { text = "Why the dam?", next = "dam" },
        { text = "Thank you, Historian.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron", "uldaman" } } },
      },
    },
    dam = {
      lines = {
        { id = "d_default", key = true,
          text = "Perhaps because they think it's theirs. The stonewrought method of building came from a Dark Iron architect, one Franclorn Forgewright, so draw yer own conclusions about the Stonewrought Dam." },
      },
      choices = {
        { text = "I doubt the dam's keepers like that story.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },

    books = {
      lines = {
        { id = "bk_default", text = "The Fall of Lordaeron and the Scouring of the Eastweald, and after it On Plagues, Curses, and Blights. Neither one gets read aloud at weddings." },
      },
      choices = {
        { text = "Why write about Lordaeron?", next = "books_lordaeron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books_lordaeron = {
      lines = {
        { id = "bl_default", text = "Because somebody had to, before the people who saw it stopped talking. Grief makes poor witnesses and worse historians, and I tried to be neither." },
      },
      choices = {
        { text = "That's a hard thing to write.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    three_hammers = {
      lines = {
        { id = "th_default", text = "There were three clans under one high king, Modimus Anvilmar, and when he died the Bronzebeards, Wildhammers and Dark Irons fought for his throne. We kept the mountain, but nobody kept the peace." },
      },
      choices = {
        { text = "What became of the Anvilmars?", next = "anvilmar" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    anvilmar = {
      lines = {
        { id = "an_default", text = "Madoran Bronzebeard gave them a seat in the Senate for good, so they'd never turn enemy. A beaten family with a chair argues instead of fights." },
      },
      choices = {
        { text = "Clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    witness = {
      big = true,
      lines = {
        { id = "wi_default", text = "Then sit, and tell me. Not the battles, for I have those; tell me what people carried when they ran, because nobody ever writes that down." },
      },
      choices = {
        { text = "Bread, their children, and the holy books. Nothing else mattered.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "I'd rather not remember.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    plague_light = {
      lines = {
        { id = "pl_default", text = "From what I gathered, the Light eased the dying better than it stopped the dying. The plague came in the grain, and the grain kept coming." },
      },
      choices = {
        { text = "Then we must be quicker next time.", next = "BACK", reply = "We must. I'll write that down, for the next plague will come in the grain too, if nobody's watchin' the granaries.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then the Light's no cure, and we'd best look elsewhere.", next = "BACK", reply = "Maybe so. But the Light eased a great many deaths, an' I'll no' have that left out o' my history.", fx = { align = { light = -1 } } },
        { text = "That's grim, Historian.", next = "BACK" },
      },
    },
    curses = {
      lines = {
        { id = "cu_default", text = "Have ye, now? I can hear it in yer voice, a sort of smoke at the back of it. I wrote that book so folk would know what to fear, and I'd hate to think it served as a primer instead." },
      },
      choices = {
        { text = "Knowing a curse is how you break one.", next = "BACK", reply = "It is. I wrote that book tae break curses, no' tae make them, an' I'd like it used that way.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A primer was exactly what I needed.", next = "BACK", reply = "Then I'll be keepin' an ear on ye, for a book I wrote tae warn folk is no' meant tae be a primer for anybody.", fx = { align = { light = -1 }, affinity = -2 } },
        { text = "Something else, historian.", next = "BACK" },
      },
    },
    wildhammer = {
      lines = {
        { id = "wh_default", text = "That they kept the old ways when we went down into the stone, and spoke with the storm while we spoke with the forge. Now here's a Bronzebeard voice asking about it, which I'll be writing down, by yer leave." },
        { id = "wh_kin", when = { origin = "dwarf_wildhammer_kin" },
          text = "Ah, and some Wildhammer blood in ye besides, I'd wager, from the burr. Then ye've heard the War of the Three Hammers told from the other side, and I'd dearly like to hear it." },
      },
      choices = {
        { text = "The old ways were never lost. Only ignored.", next = "BACK", reply = "Ignored is the right word. An' it's good tae hear a Bronzebeard admit it, for the Wildhammer have been sayin' it for centuries.", fx = { align = { order = -1 } } },
        { text = "Bronzebeard and Wildhammer should keep to their own roads.", next = "BACK", reply = "Maybe they should, an' they have for a long while, but I've always thought we'd both be stronger if we walked together.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've spent my life on the histories o' this mountain, an' now I have them read tae me, which is slower but no less thorough. Ask me about any o' these." },
    },
    background = { { id = "tp_bg", text = "I'm historian to the King. My eyes went but my memory didn't, an' a patient scribe chisels down what I say, so between us we've filled a shelf." } },
    advice = { { id = "tp_ad", text = "Write down what ye saw on the day ye saw it. By the next day ye'll have improved it." } },
    dark_iron = { { id = "tp_dark_iron", text = "They were our kin once, and our enemies for far longer. History doesn't forgive, but it remembers both.", next = "thaurissan" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes kept poor records and lost the rest, so I've offered my scribe to Mekkatorque. He's still thinking about it." } },
    explorers_league = { { id = "tp_league", text = "They dig it up and I write it down, and High Explorer Magellas and I argue about which is the harder job. I'm right, of course." } },
    stonewrought_dam = { { id = "tp_dam", text = "A wonder of the world, built by a method its keepers would rather not trace.", next = "dam" } },
    second_war = { { id = "tp_second_war", text = "I was on these walls when the Horde came through Dun Morogh, and I heard the guns of Ironforge for weeks on end. The mountain held because we held it, and every dwarf who stood there has a name in my books." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer left Ironforge before the Three Hammers war and made their home at Grim Batol, and when that was cursed they took to the Hinterlands and the open sky. They kept the old shamanic ways we let go of, and they're proud of it." } },
    grim_batol = { { id = "tp_grim_batol", text = "Khardros Wildhammer broke the Dark Iron army at Grim Batol, and the sorceress Modgud's death left a curse on the place. The Wildhammer called it home after, until it soured beneath them, and nobody has lived there gladly since." } },
    magni = { { id = "tp_magni", text = "I taught him his letters when he was a beard-less lad who would rather have been at the anvil. He's a better king than he believes, and a worse reader than he admits." } },
    thaurissan = { { id = "tp_thaurissan", text = "Sorcerer-Thane Thaurissan called up the Firelord in his madness, and the mountain itself answered. Everything that's gone wrong in the Searing Gorge since started with that one proud dwarf." } },
    uldaman = { { id = "tp_uldaman", text = "Old titan vaults in the Badlands, older than Ironforge itself. What they hold may tell us where dwarves came from, which is a question I'd like answered before my memory goes the way of my eyes." } },
    alterac = { { id = "tp_alterac", text = "Lord Perenolde sold the Alliance to the Horde in the Second War, and Alterac was dissolved for it. His heirs make the Syndicate now, and they still think they're nobility." } },
    _none = { { id = "tp_none", text = "Not in my memory, and my memory's longer than most beards in this city." } },
  },
}

P:NPC {
  key = "magellas", id = TODO_NPC("High Explorer Magellas"), name = "High Explorer Magellas",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "eager" }, values = { "curious", "serious" },
  notices = { "lore", "travel" },

  impression = {
    first = "High Explorer Magellas warned me not to touch anything with a label, or without one. His Prospectors do the digging, he says, and he does the worrying, and he's good at it.",
    third = "{name} met High Explorer Muninn Magellas in the Hall of Explorers, who leads the Explorers' League from Ironforge.",
  },

  greetings = {
    { id = "g_league", text = "This is the Hall o' Explorers, so touch nothing with a label on it, and nothing without one either, until ye've asked." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, ye've come back! Have ye seen anything worth writing down, or digging up?" },
  },

  notice = {
    { id = "n_far", cat = "travel", when = { visited = "Darkshire" },
      text = "You've been south, past the forest! Did ye write anything down while ye were there? Nobody ever writes anything down, by my beard." },
    { id = "n_miner", cat = "lore", when = { profession = "Mining" },
      text = "A miner! If you ever break into a hall that isn't on any map, stop swinging and send for us, please." },
  },

  start = "hello",
  nodes = {
    opn_league = {
      lines = {
        { id = "opn_league_q", text = "Some do, and some of them sit in the Senate and say it every season. The troggs came up out of our digs, I'll grant them that much, but I'd like to hear it from someone who isn't counting the coin. What do you make of the League?" },
      },
      choices = {
        { text = "A people that forgets its past is lost. Keep digging.", next = "opn_league_r_admire", fx = { affinity = 2, align = { order = -1 }, opinion = { explorers_league = "admire" } } },
        { text = "Some things were buried for a reason, High Explorer.", next = "opn_league_r_dangerous", fx = { affinity = -1, align = { order = 1 }, trait = { careful = 1 }, opinion = { explorers_league = "dangerous" } } },
        { text = "Your maps keep soldiers alive. That's reason enough.", next = "opn_league_r_useful", fx = { trait = { practical = 1 }, opinion = { explorers_league = "useful" } } },
        { text = "Your diggers in Darkshore disturb our dead.", next = "opn_league_r_intrusive", when = { race = "NightElf" }, fx = { affinity = -1, opinion = { explorers_league = "intrusive" } } },
        { text = "I'd rather hear about the finds.", next = "BACK" },
      },
    },
    opn_league_r = {
      lines = {
        { id = "opn_league_r_default", text = "Well, you've given it some thought, which is more than the Senate does." },
      },
      choices = {
        { text = "Something else, High Explorer.", next = "BACK" },
      },
    },
    opn_league_r_admire = {
      lines = {
        { id = "opn_league_r_admire", text = "Now that's a thing I'd like carved over the door! Come back whenever you like, and I'll find you something old to hold." },
      },
      choices = {
        { text = "Something else, High Explorer.", next = "BACK" },
      },
    },
    opn_league_r_dangerous = {
      lines = {
        { id = "opn_league_r_dangerous", text = "Hmph. You sound like Senator Stonehallow, and he's a League man himself, which makes it worse. A reason, maybe, but nobody's told me what it was." },
      },
      choices = {
        { text = "Something else, High Explorer.", next = "BACK" },
      },
    },
    opn_league_r_useful = {
      lines = {
        { id = "opn_league_r_useful", text = "They do, and the Mountaineers say so when they remember to. I'd rather we were loved for the halls than the maps, but I'll take thanks where I find it." },
      },
      choices = {
        { text = "Something else, High Explorer.", next = "BACK" },
      },
    },
    opn_league_r_intrusive = {
      lines = {
        { id = "opn_league_r_intrusive", text = "That's fair, and I've heard it from your Sentinels in sharper words. I've told my diggers to ask before they lift anything, and to put it back if the answer's no." },
      },
      choices = {
        { text = "Something else, High Explorer.", next = "BACK" },
      },
    },
    xpt_magellas = {
      big = true,
      lines = { { id = "xpt_magellas_default", text = "One who can read the old runes, one who can fight the troggs, and one who knows when to stop digging, and that last one is the rarest. I've lost more crews to curiosity than to anything with teeth." } },
      choices = {
        { text = "Better to stop in time and bring the crew home.", next = "BACK", reply = "Exactly, and you've just described the rarest crewman of all, so I'll put you down as a candidate if you'd like the job.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to dig deeper and learn the truth, whatever it costs.", next = "BACK", reply = "That's the spirit of the League, and I love it, but I've also lost good dwarves to it, so I'd ask you to dig carefully.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "All of them, and I worry about each one, for the Badlands have troggs, Loch Modan has troggs, and Uldaman has things worse than troggs. A warrior at a dig lets my Prospectors dig instead of looking over their shoulders, and lets me sleep, occasionally." } },
      choices = {
        { text = "I'll guard a dig site, if the League asks it.", next = "BACK", reply = "Splendid! My Prospectors will be grateful too, since they're much better at digging than at running.", fx = { align = { honor = 1 } } },
        { text = "Guarding scholars is dull work. I'll need good pay.", next = "BACK", reply = "Dull, yes, until something comes out of the ground, and then it's very exciting indeed, but I'll see what the League can pay.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We've hired worse, an' some o' my Prospectors are no' above pocketin' a relic for themselves. If ye scout for the League, ye bring what ye find back tae the Hall o' Explorers, an' ye'll be paid fair for it." } },
      choices = {
        { text = "Everything I find goes to the Hall, High Explorer.", next = "BACK", reply = "The Hall thanks you, and so do I. A scout with honest hands is worth a dozen with quick ones, and I've hired both kinds.", fx = { align = { honor = 1 } } },
        { text = "A finder's fee is fair, but a finder's keep is fairer.", next = "BACK", reply = "A finder's keep, eh? Well, the League doesn't see it that way, and neither do I, so we'll need to talk about that carefully.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "More every season, from Uldaman especially, where the titans left more than stone behind. I'd rather a mage tell me a thing is safe than find out when the shelf catches fire." } },
      choices = {
        { text = "I'll study them carefully, and report everything I find.", next = "BACK", reply = "Wonderful! I'll give you a desk, a lamp and a very large fire bucket, just in case one of them takes offence.", fx = { align = { order = 1 } } },
        { text = "If they're powerful, they're wasted on a shelf.", next = "BACK", reply = "Wasted? Oh no, they're safe, which is very different, and I'd much rather have a safe tablet than a powerful mage with one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "One o' the Uldaman tablets went cold as ice the last time a warlock walked past it, an' I'd like tae know why before it happens again. Until I do, I'll ask ye tae stand on the far side o' the rope." } },
      choices = {
        { text = "I'll stand back, High Explorer. Your relics come first.", next = "BACK", reply = "That's very gracious of you. I'll let you know if I ever work out why it did that, assuming it doesn't do it again first.", fx = { align = { light = 1 } } },
        { text = "Perhaps the tablet recognised a stronger power than yours.", next = "BACK", reply = "Perhaps it did, and that's precisely what worries me, so I'll ask you to stand back a little further, if you'd be so kind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "We try, though I'll admit some o' our lads get more excited about the find than the ground it's buried in. Uldaman's been turned over like a garden bed." } },
      choices = {
        { text = "Dig, but leave the land whole behind you.", next = "BACK", reply = "That's the right way. I'll tell my Prospectors you said so, though they'll probably dig a little faster just to spite you.", fx = { align = { order = 1 } } },
        { text = "Some places should never be dug at all.", next = "BACK", reply = "Perhaps there are, and I'd like to know which ones before my lads find out the hard way, so tell me if you ever learn.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, though I'd never say so in front of the Prospectors, because they'd stop telling me things. Some of what comes out of Uldaman is older than Ironforge, and some of it doesn't like being moved, and I've had to send more than one box to the Mystic Ward with a polite note." } },
      choices = {
        { text = "Some things should stay buried. The League should know when to stop.", next = "BACK", reply = "That's a wise thing to say, and I'll keep it in mind, though I'll admit the League has never once known when to stop.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Knowledge is worth the risk. Dig, and let the priests clean up.", next = "BACK", reply = "That's the League's motto, nearly, and I'll tell the priests you said so, though they may want a word with you about the cleaning up.", fx = { align = { light = -1 } } },
        { text = "Tell me about the League's work instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Uldaman, without question, for the Shadowforge are digging there too and they don't play by anyone's rules. Ironband's dig in Loch Modan has its troubles as well, but Uldaman is where the League's people are dying, and I'd like that to stop." } },
      choices = {
        { text = "Then I'll stand guard at Uldaman, as long as it takes.", next = "BACK", reply = "The Prospectors there will be very glad of you. The Shadowforge don't fight fair, and they don't fight small.", fx = { align = { honor = 1 } } },
        { text = "The League chose to dig there. They knew the risks.", next = "BACK", reply = "They did. But they're still my lads, and I'd like them home safe whatever risks they chose.", fx = { align = { honor = -1 } } },
        { text = "Good luck with your work.", next = "BACK" },
      },
    },
    xcl_ulda = {
      big = true,
      lines = { { id = "xcl_ulda_default", text = "Then you've stood where the titans' own keeper stood guard, and you've seen more of where we come from than any Prospector of mine. The discs say the earthen were shaped from stone and that we dwarves are their children, and there are those in this city who'd rather not hear it, but I'd rather know." } },
      choices = {
        { text = "The League should share what the discs say, whoever it upsets.", next = "BACK", reply = "Perhaps it should, and I've argued the same, but the King must hear it first, and then the Senate, and then we'll see.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some truths should wait until the King decides how to tell them.", next = "BACK", reply = "That's the King's view as well, and I'll keep the discs in my study until he's ready, though it's very hard to keep quiet about them.", fx = { align = { order = 1 } } },
        { text = "Did Archaedas guard the place, or just sleep there?", next = "xcl_ulda2" },
      },
    },
    xcl_ulda2 = {
      lines = { { id = "xcl_ulda2_default", text = "Both, I think, and that frightens me a little. He woke when the vault was disturbed and raised the stone keepers around him, so whatever the titans left in Uldaman was meant to be found only by someone they'd have approved of." } },
      choices = {
        { text = "I hope they'd have approved of me.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_magellas", tags = { "news" }, when = { party = { size = { min = 2 } } },
          text = "A full digging crew, by the look of you! If any of your friends knows a pick from a trowel, send them up to me, because the League always needs more hands in the Badlands and more eyes in Uldaman." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in the Hall of Explorers! Do mind the cases, and if you could tell me whether that relic on my desk is cursed, I'd sleep much better." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Excellent, because my Prospectors keep running into Dark Irons and troggs at the dig sites, and they'd much rather run into you." },
        { id = "h_cl_ulda", tags = { "news" }, when = { cleared = "Uldaman", faction = "Alliance" },
          text = "You've been to the bottom of Uldaman, past Archaedas himself, I'm told! Sit down, please, because I want every detail, and I want them in order." },
        { id = "h_default", key = true,
          text = "Muninn Magellas, High Explorer of the Explorers' League. We map the world, catalogue what lives in it and dig up what used to, and while my Prospectors swing the picks, I do the worrying." },
        { id = "h_discs", tags = { "news" }, when = { questActive = TODO_QUEST("The Platinum Discs") },
          text = "Discs from Uldaman, and they speak? Do you understand what this might mean, where we came from and what we really are? Let me sit down." },
        { id = "h_brann", key = true, when = { minLevel = 30 },
          text = "Brann Bronzebeard should be here to see the League's work, but he's been gone too long in the field, even for Brann. I keep a chair for him all the same." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "We have no entry for you, none at all! An entire people, and the League's never written a line about you, so please sit and let me fix that." },
        { id = "h_prism", tags = { "news" }, when = { questRecent = { TODO_QUEST("Prehistoric Prism"), days = 7 } },
          text = "The relic from the Wetlands dig, with titan marks on it, unmistakable. It's been on my desk three days and I keep finding excuses to touch it." },
        { id = "h_apprentice", when = { origin = "dwarf_explorers_league" },
          text = "One of ours! Don't tell me which Prospector you trained under; let me guess from the state of your boots." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! The Explorers' League could use someone who can talk tae the beasts in the places we dig, because they're rarely pleased tae see us." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "One o' those light-footed sorts! The League could use a scout who can creep past a trogg camp wi'out bein' eaten, so come here an' let me look at ye." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! My Prospectors keep bringin' home relics that hum, an' I'd dearly love someone who can tell me whether they're dangerous before I put them on a shelf." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in the Hall o' Explorers? I'll ask ye no' tae touch anythin', for some o' these relics have opinions about yer sort o' magic." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Don't touch anything with a label, please, and especially don't lean on it; that case has stood since before yer grandsire's beard came in." },
      },
      again = {
        { id = "h_again", text = "What else? The catalogue can wait, as it always does, like a seam o' ore that isnae going anywhere." },
        { id = "h_again2", text = "Go on, then. Questions are the one thing we never run short of here, after dust." },
      },
      choices = {
        { text = "Does the League respect the places it digs?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What does the League do?", next = "league" },
        { text = "What are you hoping to find?", next = "hope" },
        { text = "I don't see Brann about the hall.", next = "brann" },
        { text = "Where are your people digging now?", next = "sites" },
        { text = "I trained with the League, High Explorer.", next = "apprentice", when = { origin = "dwarf_explorers_league" } },
        { text = "About that relic from the Wetlands...", next = "prism", when = { questDone = TODO_QUEST("Prehistoric Prism") } },
        { text = "The League could use a hunter's eye in the field.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The stone in Uldaman spoke to me, High Explorer.", next = "stone", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Would the Explorers' League hire someone like me?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your Prospectors must find enchanted relics now and then.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do relics really react to warlocks, High Explorer?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your Prospectors need warriors out in the field?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You seem to worry about what the League digs up.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Which dig needs protecting most, High Explorer?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I stood in Archaedas's chamber in Uldaman, High Explorer.", next = "xcl_ulda", when = { cleared = "Uldaman", faction = "Alliance" } },
        { text = "What makes a good crew for the Explorers' League?", next = "xpt_magellas", when = { party = true } },
        { text = "Good luck with your work.", next = "END" },
      },
    },

    league = {
      lines = { { id = "l_default", text = "Everything nobody else has time for: ruins, relics, beasts and maps. If it's old, odd or underground, someone o' ours has a notebook out and a pick in the other hand." } },
      choices = {
        { text = "Some say the League digs up more trouble than history.", next = "opn_league" },
        { text = "Who started it?", next = "league_start" },
        { text = "Sounds like my kind of work.", next = "BACK", fx = { affinity = 1, learn = { "explorers_league" } } },
      },
    },
    league_start = {
      lines = {
        { id = "ls_default", text = "The King founded it, when our miners broke into halls older than Ironforge. He told a kingdom o' miners to start digging for answers instead of ore, and we've been at it ever since." },
      },
      choices = {
        { text = "Did the League go north, too?", next = "northrend" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    northrend = {
      big = true,
      lines = {
        { id = "nr_default", text = "Muradin Bronzebeard himself led an expedition of ours to Northrend before the war. We lost him there, and we never heard from most of the others again." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hope = {
      big = true,
      lines = {
        { id = "h2_default", text = "Where the dwarves came from, before there were clans or kings or even beards worth the name. There are halls in the old places that weren't built to our size, and I want to know whose they were." },
      },
      choices = {
        { text = "I hope you find out.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things should stay buried.", next = "buried" },
      },
    },
    buried = {
      lines = { { id = "b_default", text = "Spoken like someone who's never held a thing older than their kingdom in their hands. Do that once, and then tell me again." } },
      choices = {
        { text = "Maybe I will, someday.", next = "BACK", fx = { affinity = 1 } },
        { text = "I stand by it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    brann = {
      lines = {
        { id = "bn_default", text = "Gone for months without a letter, and Brann writes letters the way other dwarves drink. The King's stopped hoping, but I keep the chair, which isn't hope exactly so much as tidiness." },
      },
      choices = {
        { text = "Where was he last?", next = "brann_last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brann_last = {
      lines = {
        { id = "bl_default", text = "With Brann, 'last' is a big word, since his letters used to arrive from three places at once. Now they don't arrive at all." },
      },
      choices = {
        { text = "He'll write.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sites = {
      lines = {
        { id = "si_default", text = "Prospector Ironband's dig by Thelsamar, slower than I'd like, and Gol'Bolar, and Uldaman, where the troggs and the Dark Irons got in first. And Darkshore, of all places." },
      },
      choices = {
        { text = "Ironband's dig sounds like slow going.", next = "sites_ironband" },
        { text = "Darkshore? My people's shore.", next = "sites_darkshore", when = { race = "NightElf" } },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman", "explorers_league" } } },
      },
    },
    sites_ironband = {
      lines = {
        { id = "sb_default", text = "Troggs came up through his trench right after his crew lifted a cache of carved idols. Ironband thinks the idols stirred them, and I'm inclined to agree." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sites_darkshore = {
      lines = {
        { id = "sd_default", text = "Ruins your people left, older than ours. Your Sentinels watch our diggers like hawks, and that's fair; I'd watch us too." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    apprentice = {
      lines = {
        { id = "ap_default", text = "Then what have you found so far? Don't be modest about it, because modest explorers never get their next expedition paid for." },
      },
      choices = {
        { text = "Nothing yet.", next = "BACK", fx = { affinity = 1 } },
        { text = "A few pots and a great deal of dirt.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    prism = {
      lines = {
        { id = "pr_default", text = "A titan relic, carried here whole and by hand! Do you know how rare that is? Most of our finds arrive in pieces, and so does the Prospector." },
      },
      choices = {
        { text = "What will it tell you?", next = "prism_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prism_what = {
      lines = {
        { id = "pw_default", text = "Who made the old halls, if I'm right, and something stranger if I'm wrong. I'd settle for stranger." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "It could, it certainly could! Half my Prospectors couldn't tell a raptor's track from a basilisk's, and they find out the difference when something bites them. The Badlands camp and the Wetlands digs are always short of someone who can read the ground." },
        { id = "hu_bear", when = { origin = "dwarf_bear_tracker" },
          text = "A tracker out of the high snows, too, if I read that coat right. Ironband's men lose their way between the loch and the dig every winter, and they'd follow you anywhere." },
      },
      choices = {
        { text = "I hunt for food and safety, not for your catalogue.", next = "BACK", reply = "Fair enough; the catalogue will survive without you. I'll still pester you about any strange tracks, though.", fx = { align = { order = -1 } } },
        { text = "Put me on the League's rolls, then.", next = "BACK", reply = "Splendid, I'll put your name down at once, and the Badlands crew will be delighted to have someone who knows a basilisk when it bites them.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Where's the League short most?", next = "sites" },
      },
    },
    stone = {
      big = true,
      lines = {
        { id = "st_default", text = "Spoke to you? The stone itself, in Uldaman, where the discs were? Oh, please, sit down, and tell me exactly what it said, and I'll take it all down word for word, however strange." },
      },
      choices = {
        { text = "It said we were made, not born.", next = "stone_made" },
        { text = "Some things the stone tells me aren't for books.", next = "BACK", reply = "That's a very fair answer, and I'll respect it, though I'll confess it makes me want to know even more.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Write it down. The League should know.", next = "BACK", reply = "Oh, thank you! I'll write every word exactly as you say it and send it straight up to the King.", fx = { align = { order = 1 }, affinity = 2 } },
      },
    },
    stone_made = {
      lines = {
        { id = "sm_default", text = "That's what the discs suggest, and I've had sleepless nights over it. If the stone and the Titans' discs say the same thing, then I've some very uncomfortable letters to write to the Senate." },
      },
      choices = {
        { text = "Something else, High Explorer.", next = "BACK", fx = { affinity = 1, learn = { "uldaman" } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The League's charted more o' this world than any king's cartographer, an' I've read every report. Ask me about any o' this, an' pull up a chair." },
    },
    background = { { id = "tp_bg", text = "Curious since I could crawl, and paying for it since I could read. Now I steer the League and answer all its letters, which is a deal more ink than stone." } },
    advice = { { id = "tp_ad", text = "Write it down: dates, places, who was with ye. Memory is a liar with very good manners, and stone is the only honest witness." } },
    explorers_league = { { id = "tp_league", text = "Mine to steer, for my sins, with hundreds of Prospectors across the world, and all of them write to me at once.", next = "league" } },
    dark_iron = { { id = "tp_dark_iron", text = "They're digging in Uldaman, and they're not digging for history. That frightens me more than their axes." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We sent a team to chart the outer halls, and they came back with maps and a terrible cough." } },
    uldaman = { { id = "tp_uldaman", text = "Ours first, then the troggs', then the Dark Irons'. One day it'll be ours again, and I'd like to be alive for it." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "A troll city in the Tanaris sands, and the goblins of Gadgetzan won't stop writing to tell me how dangerous it is. That's exactly the sort of place the League ought to have a look at, though I'll be the one doing the worrying." } },
    maraudon = { { id = "tp_maraudon", text = "A cave in Desolace the centaur call sacred, and full of crystals and worse. I'd send a team tomorrow if I could be sure the centaur would let them walk back out." } },
    dire_maul = { { id = "tp_dire_maul", text = "An elven city in Feralas, half ogre den and half library, and the library half is the one keeping me awake. Imagine what the Highborne wrote down and nobody has read for ten thousand years!" } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The trolls of the Swamp of Sorrows sank a whole temple to stop a blood god, and it's down there yet. The League has notes on it, and none of them are reassuring." } },
    _none = { { id = "tp_none", text = "That's not catalogued yet. Write it down for me, would ye, with dates and places, and sketches if ye can manage them." } },
  },
}

P:NPC {
  key = "stormpike_p", id = TODO_NPC("Prospector Stormpike"), name = "Prospector Stormpike",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "hot" }, values = { "proud" },
  notices = { "craft" },

  impression = {
    first = "Prospector Stormpike looked up from his reading just long enough to make clear I'd interrupted. He isn't unkind, only spare with his words and his time.",
    third = "{name} interrupted Prospector Stormpike's reading in the Hall of Explorers, and the dwarf made plain he had little time for chat.",
  },

  greetings = {
    { id = "g_busy", text = "What is it? I'm reading, I'm always reading, so make it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Fine, then, say what ye came tae say." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner. At least ye know which end o' the pick goes in the rock. Most o' the folk who come in here couldnae tell ye." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some say ye're the best tool we've ever had for findin' a buried hall. Others say ye'll make the earth uneasy an' we'll lose diggers for it. I say if ye can tell me which wall's about tae fall, I'll take ye on a dig, an' if ye cannae, ye can carry a shovel like everyone else." } },
      choices = {
        { text = "I'll carry a shovel like anyone. No special treatment.", next = "BACK", reply = "The diggers will respect ye more for it. A shaman who'll pick up a shovel is a shaman worth listenin' tae.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My gift beats a shovel. Value it accordingly.", next = "BACK", reply = "Then ye'll be valued, an' ye'll be watched, for the earth's a fickle partner, an' I've lost diggers tae its moods before.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "History's no' a grave, it's a record, an' a record's no use buried. Ye'll have yer views, an' I've work tae do." } },
      choices = {
        { text = "Records should be studied, carefully and properly.", next = "BACK", reply = "That's the right of it, an' I never expected tae hear it from a druid. Yer lot usually lecture me about ghosts.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some things are buried because they should stay buried.", next = "BACK", reply = "Maybe some are, an' I'll grant ye the point, but I'd rather know which ones before I decide, an' that means diggin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Enough. Troggs in Loch Modan, Dark Irons in the Badlands, an' I've scars from both, though I'll no' be showin' them. If ye're offerin' tae guard a dig, speak tae High Explorer Magellas, for I've no time tae hire anyone." } },
      choices = {
        { text = "I'll offer my axe to the League properly, then.", next = "BACK", reply = "Magellas will be glad o' ye. He's always short o' warriors an' long on Prospectors wi' sore heads.", fx = { align = { order = 1 } } },
        { text = "I don't need a ledger to guard a dig.", next = "BACK", reply = "Fair enough, but ye'll need one tae get paid, an' I'll no' be the one tellin' Magellas ye've been guardin' for free.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye. Ye'd read the ground, see the troggs comin' an' bring down supper when the rations run out, which is three uses more than most o' the folk Magellas sends me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Aye. Ye'd read the ground, see the troggs comin' an' bring down supper when the rations run out. An' that {pet} looks like it'd dig as fast as my crew, which isnae sayin' much." },
      },
      choices = {
        { text = "I'll scout for the League, and gladly.", next = "BACK", reply = "Good! I'll make sure Magellas knows ye're the useful sort, which is more than I can say for my last scout.", fx = { align = { honor = 1 } } },
        { text = "I'll scout, if the finds are shared with me.", next = "BACK", reply = "Shared, eh? Well, the League shares what it learns, but no' what it digs, so ye'll get knowledge an' no' a single relic.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Circles burned intae the floor, an' bones arranged in ways nobody honest would arrange them. I'll grant there's warlocks in the Alliance who fight on our side, but I've learned tae watch what's under my boots." } },
      choices = {
        { text = "Those circles belong to the Horde's warlocks, not mine.", next = "BACK", reply = "I'll take ye at yer word. I'll still be checkin' the bones for any new arrangements after ye leave, mind.", fx = { align = { light = 1 } } },
        { text = "Old circles still have power. Someone ought to use it.", next = "BACK", reply = "Aye, an' that's exactly why I'm worried, for old circles in the wrong hands make new trouble in the right places.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Holy? No. Old, aye, an' some of it with runes I'd rather no' read aloud, so I send those tae the Mystic Ward an' let them worry. The League digs for knowledge, an' I'll leave the prayin' tae those who've the time for it." } },
      choices = {
        { text = "Prayer and study both have their place. Neither should be scorned.", next = "BACK", reply = "They do. The Mystic Ward's done good work on runes I couldnae make head nor tail of.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Knowledge first, then. The prayers can wait.", next = "BACK", reply = "That's the League's way. I'll still send the strange ones tae the Mystic Ward, just in case they bite.", fx = { align = { light = -1 } } },
        { text = "I'll leave you to your reading.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They need a great many things, an' protection's near the top, for Ironband's lads in Loch Modan are diggin' wi' one hand an' holdin' off troggs wi' the other. If ye're goin' that way, take his supplies an' a sharp hammer, an' I'll call it even." } },
      choices = {
        { text = "I'll guard them. Diggers shouldn't have to fight for their lives.", next = "BACK", reply = "Thank ye. They've been diggin' wi' a shovel in one hand an' an axe in the other for too long.", fx = { align = { honor = 1 } } },
        { text = "They chose the dig. A guard costs money; pay for one.", next = "BACK", reply = "They'd pay for one if they could, but the League's purse is thin, so they're payin' in blood instead, an' that's no' fair either.", fx = { align = { honor = -1 } } },
        { text = "Sorry to bother you.", next = "BACK" },
      },
    },
    xcl_ulda = {
      big = true,
      lines = { { id = "xcl_ulda_default", text = "So I hear, an' I'll want it written down, for the League doesnae run on hearsay. There's carvin's in that vault I've only ever seen in rubbin's, an' if ye remember even half o' them right, ye've saved me a year o' squintin'." } },
      choices = {
        { text = "I'll write it all down properly for the League.", next = "BACK", reply = "I'll want every carvin', every rune an' every crack in the floor. The League runs on details.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I went down there to fight, Prospector, not to take notes.", next = "BACK", reply = "Fair enough, but if ye remember anythin' at all, I'll want it, for even a fighter's memory is better than a rubbin'.", fx = { align = { order = -1 } } },
        { text = "What's in those carvings that matters so much?", next = "xcl_ulda2" },
      },
    },
    xcl_ulda2 = {
      lines = { { id = "xcl_ulda2_default", text = "The old titan script, an' the dwarven runes that came after it, cut intae the same wall. Put the two together an' ye've a key tae every ruin in Khaz Modan, so I've no time for chat." } },
      choices = {
        { text = "Then I'll leave you to your ciphers.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Ye'll no' be wantin' tae bless my books, I hope, for I'm busy, an' they're fine as they are." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Ye'll be wantin' somethin', I expect, so say it quick, for I've three ciphers on my desk an' none o' them are readin' themselves." },
        { id = "h_cl_ulda", tags = { "news" }, when = { cleared = "Uldaman", faction = "Alliance" },
          text = "Ye've been down tae Archaedas an' back, I hear. Good; now Baelog's lot can stop askin' me what's at the bottom." },
        { id = "h_default", key = true, text = "Stormpike, Prospector, of the Explorers' League. That's my name, my job an' my lodge, an' that's all the chat ye're gettin' today." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Ironforge") },
          text = "A report, is it? About time; hand it here, an' don't read it tae me, for I can read." },
        { id = "h_powder", when = { questActive = TODO_QUEST("Powder to Ironband") },
          text = "Those are Ironband's supplies, so get them tae his dig in Loch Modan in one piece, an' don't dawdle." },
        { id = "h_uldaman", tags = { "news" }, when = { questActive = TODO_QUEST("Stormpike's Deciphering") },
          text = "Somethin' out o' Uldaman that needs readin'. Bring it here an' leave me be for a week." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Letter to Stormpike") },
          text = "A cipher from Loremaster Dibbs, is it? Hand it here, then. Hm, somebody clever wrote this, though no' clever enough." },
        { id = "h_chamber", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Hidden Chamber"), days = 7 } },
          text = "So ye saw Khaz'mul's chamber. Baelog was right an' I had my doubts, but don't repeat that tae him." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a warlock's look about ye, an' I've seen what yer kind left behind in some o' the old ruins. Mind yerself in the Hall." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. State yer business; I've a page tae finish." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Fine; mind yer beast doesnae chew the maps." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid. The League's turned up a few kaldorei relics in the hills, an' I suppose ye'll want tae tell me they're no' mine." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The League's got opinions about ye, an' so have I, an' I'll keep mine tae myself today." },
      },
      again = {
        { id = "h_again", text = "What is it now, then?" },
        { id = "h_again2", text = "Still here? Fine, but be quick about it." },
      },
      choices = {
        { text = "That looks like something worth reading.", next = "reading" },
        { text = "I hear Ironband's short of blastpowder.", next = "powder", when = { any = { { questActive = TODO_QUEST("Powder to Ironband") }, { questDone = TODO_QUEST("Powder to Ironband") } } } },
        { text = "They say you can read any cipher.", next = "cipher" },
        { text = "What happened at Uldaman?", next = "uldaman" },
        { text = "I met a Mountaineer Stormpike at Algaz.", next = "clan", when = { questDone = TODO_QUEST("Mountaineer Stormpike's Task") } },
        { text = "Mages read ciphers too, Prospector.", next = "mage", when = { class = "MAGE" } },
        { text = "What have you seen warlocks leave in the ruins?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Have you seen much fighting on your digs, Prospector?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter be of use on a League dig?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you found anything holy in the old dig sites, Prospector?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the League's diggers need protecting, Prospector?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Should the League be digging up kaldorei history at all?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What are the League's opinions about dwarf shamans, Prospector?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been to the bottom of Uldaman, Prospector.", next = "xcl_ulda", when = { cleared = "Uldaman", faction = "Alliance" } },
        { text = "Sorry to bother you.", next = "END" },
      },
    },

    reading = {
      lines = { { id = "r_default", text = "That's Prospector business, which is tae say none o' yours, so off ye go." } },
      choices = {
        { text = "Charming.", next = "charm" },
        { text = "Going.", next = "END" },
      },
    },
    charm = {
      lines = { { id = "c_default", text = "Charm doesnae dig tunnels. Come back when ye've something for me to read." } },
      choices = { { text = "Fine. Something else, then.", next = "BACK" } },
    },

    powder = {
      lines = {
        { id = "pw_default", text = "I sent that man a load o' blastpowder weeks ago, an' his report doesnae mention it. So either Ironband's lyin' or somebody's stealin', an' Ironband cannae lie." },
      },
      choices = {
        { text = "Only a fool would steal blastpowder.", next = "powder_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_who = {
      lines = {
        { id = "pd_default", text = "Somebody who wants a hole where it shouldnae be. Dark Irons, if ye want my guess. My guesses are usually better than other folks' facts." },
        { id = "pd_saean", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "A porter called Saean, near a year on our payroll an' sellin' us tae the Dark Irons the whole time. I'm readin' every name on that payroll twice now." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    cipher = {
      lines = {
        { id = "ci_default", text = "Codes, ciphers, the scrawl o' men who think they're clever. Loremaster Dibbs in Southshore sends me half his work an' none o' his gratitude." },
      },
      choices = {
        { text = "Teach me?", next = "cipher_teach" },
        { text = "I've broken a cipher or two myself.", next = "BACK", when = { class = "ROGUE" }, fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cipher_teach = {
      lines = {
        { id = "ct_default", text = "No, but here's the first lesson free: every cipher's written by somebody lazy, so find where they got lazy." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    uldaman = {
      lines = {
        { id = "ul_default", text = "It was ours once, a dig full o' things older than the mountain. Then the troggs came up so fast we left people behind, Baelog an' his lads among 'em." },
      },
      choices = {
        { text = "I hope they're still alive.", next = "uldaman_baelog" },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    uldaman_baelog = {
      lines = {
        { id = "ub_default", text = "If anyone's stubborn enough tae outlive troggs, it's Baelog. Find him, if ye're ever strong enough tae walk in there." },
        { id = "ub_found", when = { questDone = TODO_QUEST("The Lost Dwarves") },
          text = "Alive, an' bettin' wi' Olaf about the length o' his beard. Of course he is." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    clan = {
      lines = {
        { id = "cl_default", text = "There's Stormpikes all over Khaz Modan, a proud clan an' a rich one, an' we never let anybody forget either. Did he send ye south for a Longbeard shield?" },
      },
      choices = {
        { text = "He did.", next = "BACK", fx = { affinity = 1 } },
        { text = "Proud and rich, aye. I'd noticed.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "mg_default", text = "Aye, an' they read them wrong, wi' all the confidence in the world. I've had a Dalaran man tell me a rune meant 'beware' when it meant 'storeroom', so I do my own readin' now." },
      },
      choices = {
        { text = "Then let's compare readings sometime.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "I'll trust your reading, then. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Prospector, League, Stormpike; I told ye that already, an' ye weren't listenin'." } },
    advice = { { id = "tp_ad", text = "Read it twice before ye act on it. Then read it again, because ye skimmed." } },
    explorers_league = { { id = "tp_league", text = "Magellas runs it an' I do the work. That's no' a complaint, it's a description." } },
    dark_iron = { { id = "tp_dark_iron", text = "Diggin' where they've no business diggin'. If they find what they're after before we do, we'll all hear about it." } },
    uldaman = { { id = "tp_uldaman", text = "We'll have it back, an' then I'll have the readin' o' it, an' no one'll bother me for a year.", next = "uldaman" } },
    thandol_span = { { id = "tp_thandol_span", text = "The Dark Irons blew the middle out o' it, an' I'd wager they've a reason beyond spite. Arathi's cut off from the south till it's mended, an' Ironforge feels it." } },
    alterac = { { id = "tp_alterac", text = "My brother Vanndar leads the Stormpike in Alterac Valley, an' I'd sooner he wrote more often. The Frostwolves have held that valley a long while, an' they'll no' give it up easy." } },
    grim_batol = { { id = "tp_grim_batol", text = "Cursed, an' crawlin' wi' Dragonmaw, an' best left alone. I've read every report the League has on it, an' none o' them recommend a visit." } },
    scourge = { { id = "tp_scourge", text = "The dead hold the north o' Lordaeron, an' they're no' standin' still. Read the Argent Dawn's dispatches an' ye'll see the lines creepin' south every season." } },
    _none = { { id = "tp_none", text = "That's no' my business. I deal in Prospector business only." } },
  },
}

P:NPC {
  key = "stonehallow", id = TODO_NPC("Senator Mehr Stonehallow"), name = "Senator Mehr Stonehallow",
  prejudice = { race = "NightElf", amount = 10, why = "Ironforge bled in the Second War while the Kaldorei never knew it happened; he keeps the ledger." },
  bible = "bibles/ironforge_court.md", role = "noble", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "kit", "greenness" },

  impression = {
    first = "Senator Mehr Stonehallow could be debating somewhere warm and is counting troggs in a quarry instead. He seems proud of that, and rightly.",
    third = "{name} met Senator Mehr Stonehallow, who left the warmth of the Senate to hold the Gol'Bolar Quarry against the troggs.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A night elf in the High Seat. Say your piece quickly, if you please; the senate sits within the hour, and I'll not keep it waiting on ten thousand years of manners." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ah, you. I've told the senate twice now that at least one Kaldorei knows how to pull their weight, and they look at me as though I've grown a second beard." },
    { id = "g_quarry", text = "Watch yer footing, for the troggs come up out o' the quarry like water from a cracked pipe." },
    { id = "g_back", when = { metBefore = true }, text = "There are fewer o' the troggs since ye were last here, I'll grant ye, though no' none, mind." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Ye're young yet, which is good, because the troggs are no' much older. Ye'll learn on each other." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I trust what I can count. Ironforge bled through the Second War while your people slept in their forests and never sent a single archer, and now Darnassus wants dwarven rifles at Auberdine and calls it friendship." } },
      choices = {
        { text = "We never knew your war existed. We're here now, aren't we?", next = "prej_a", fx = { align = { honor = 1 } } },
        { text = "You're right. Darnassus owes Ironforge more than polite words.", next = "prej_b", fx = { align = { honor = -1 } } },
        { text = "What would earn your trust, Senator?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Didn't know, or didn't look? Either way, being here now is a start, and I'll write it in the minutes that one of you said so to my face." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Well! A night elf who can do sums. Don't let your priestesses hear you say that, or you'll be pruning hedges in Darnassus for a century." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Work, and the time to watch it done. Bring me something from Auberdine or Ashenvale besides promises, and I'll remember who carried it." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    opn_senate = {
      lines = {
        { id = "opn_senate_q", text = "Ye'd ask a senator that? Well, I'll tell ye it's slow an' it's quarrelsome, an' it's kept more than one bad idea from the King's ear. But ye've been listenin' tae the city, so go on, what does an outsider make of us?" },
      },
      choices = {
        { text = "A king needs someone to tell him no. Keep at it.", next = "opn_senate_r_respect", fx = { affinity = 1, align = { order = 1 }, opinion = { ironforge_senate = "respect" } } },
        { text = "A room full of talkers while the troggs dig.", next = "opn_senate_r_useless", fx = { affinity = -1, align = { order = -1 }, opinion = { ironforge_senate = "useless" } } },
        { text = "I'd look harder at who's sitting in it, Senator.", next = "opn_senate_r_corrupt", fx = { trait = { skeptical = 1 }, opinion = { ironforge_senate = "corrupt" } } },
        { text = "The King's word should be enough for any dwarf.", next = "opn_senate_r_useless", when = { race = "Dwarf" }, fx = { align = { order = 1 }, opinion = { ironforge_senate = "useless", magni = "loyal" } } },
        { text = "I don't follow politics, Senator.", next = "BACK" },
      },
    },
    opn_senate_r = {
      lines = {
        { id = "opn_senate_r_default", text = "Then ye're luckier than me, an' ye'll sleep better for it." },
      },
      choices = {
        { text = "Something else, Senator.", next = "BACK" },
      },
    },
    opn_senate_r_respect = {
      lines = {
        { id = "opn_senate_r_respect", text = "Ha! I'll have that read intae the minutes, if I can find a clerk who's awake. It's no' often anyone thanks us for sayin' no." },
      },
      choices = {
        { text = "Something else, Senator.", next = "BACK" },
      },
    },
    opn_senate_r_useless = {
      lines = {
        { id = "opn_senate_r_useless", text = "Aye, well, ye're no' the first tae say it, an' some days I'm the second. But the talkin's what keeps the King from sendin' every axe he's got south at once." },
      },
      choices = {
        { text = "Something else, Senator.", next = "BACK" },
      },
    },
    opn_senate_r_corrupt = {
      lines = {
        { id = "opn_senate_r_corrupt", text = "Keep yer voice down. I've seen soot on beards that came from no forge o' ours, an' I've said so, an' they laugh at me for it. Ye're the first who hasnae." },
      },
      choices = {
        { text = "Something else, Senator.", next = "BACK" },
      },
    },
    xpt_stonehallow = {
      big = true,
      lines = { { id = "xpt_stonehallow_default", text = "Because the Senate prefers tae argue about the quarry from a warm room in the High Seat, an' I prefer tae be cold an' right. If it weren't for wanderin' companies like yers, Gol'Bolar would've been lost tae the troggs a season ago." } },
      choices = {
        { text = "The Senate should send soldiers. That's what it's for.", next = "BACK", reply = "Aye, it should, an' I've said so in the Senate till I'm hoarse, but it'll send soldiers when it's finished arguin', which is never.", fx = { align = { order = 1 } } },
        { text = "Companies like ours get it done faster than any Senate.", next = "BACK", reply = "They do. I'll still be makin' my report, though, for somebody has tae tell the Senate what ye've done for them.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Today, curiosity, an' I'll hear about it from my colleagues. The old Senate families think the Titans shaped the stone an' left it tae us, so it's ours tae carve an' no' ours tae chat with. The League's seen too much in Uldaman an' the deep places tae be so sure, an' I'm no' sure o' anything anymore, which makes me a poor senator." } },
      choices = {
        { text = "The Senate's caution has kept Ironforge standing, Senator.", next = "BACK", reply = "Maybe it has. It's also kept the Senate warm an' the quarry cold, an' I've had my fill o' both.", fx = { align = { order = 1 } } },
        { text = "Curiosity is exactly what the Senate's been missing.", next = "BACK", reply = "Say that again, louder! I've been arguin' that very point in the Senate for twenty years.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too many, an' risin' every time I count, for they've dug up from somewhere deep under the quarry an' they're no' stoppin'. The Senate wants a report, but I'd sooner send them a quarry wi' no troggs in it, an' that's where ye come in." } },
      choices = {
        { text = "I'll clear them, and the Senate can have the credit.", next = "BACK", reply = "They'll take it; they always do. But I'll put yer name in the margin where the clerks can see it.", fx = { align = { honor = 1 } } },
        { text = "Mention my name in that report, Senator.", next = "BACK", reply = "Ha, I'll mention it, an' I'll underline it, for a warrior who clears the quarry deserves more than a line in the minutes.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Better than a clerk, for ye'll know the difference between a trogg's track an' a bear's, an' my clerks wouldnae. Tell me where they go at night, an' I'll tell the Senate somethin' worth hearin' for once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} could flush them out o' the rocks, I imagine, which would make the countin' twice as quick." },
      },
      choices = {
        { text = "I'll give you an honest count, Senator.", next = "BACK", reply = "Thank ye. An honest count is worth more than a big one, an' the Senate has had enough exaggeration from me already.", fx = { align = { honor = 1 } } },
        { text = "A bigger number will get the Senate moving faster.", next = "BACK", reply = "Bigger, aye, an' then they'll send a committee tae count it again, an' we'll lose another month, so keep it honest.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every government does, an' anyone who tells ye otherwise is either a fool or one o' them. Stormwind has its SI:7, an' we've our own ways, but I'll no' discuss them in a hall wi' this many echoes." } },
      choices = {
        { text = "Unsung work in the King's service is still honourable.", next = "BACK", reply = "It is. I'll no' say more in a hallway, but the right people will know yer name if ye do it well.", fx = { align = { order = 1 } } },
        { text = "Secret work pays best when it serves nobody's flag.", next = "BACK", reply = "It does pay best, I'll grant ye. But a dwarf who serves nobody's flag soon finds nobody's flag will shelter him either.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some o' it, an' every year the gnomes ask for more, for they lost everythin' in Gnomeregan an' the Ward is all they have left. I argue for them, mostly, though the Senate likes tae know what it's payin' for." } },
      choices = {
        { text = "The Ward should be accountable to the Senate. That's fair.", next = "BACK", reply = "I'll say so in the Senate. The gnomes will grumble, an' I'll have tae buy them a round after, but I'll say it.", fx = { align = { order = 1 } } },
        { text = "Magic shouldn't need a senator's blessing to be studied.", next = "BACK", reply = "That's what the gnomes say too. But the Senate pays for the Ward, an' whoever pays wants a say.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the Alliance needs every weapon it can get, an' because a warlock trained under our eye is safer than one trained in a cave. I vote tae keep ye, but I'll no' vote twice if ye give me cause." } },
      choices = {
        { text = "I'll give the Senate no cause, Senator. My word on it.", next = "BACK", reply = "I'll hold ye tae it. My vote's on the line every time a warlock does somethin' daft in this city.", fx = { align = { light = 1 } } },
        { text = "Banning us would only send us underground. They know it.", next = "BACK", reply = "Aye, they know it, an' that's why they've no' done it, but dinnae give them a reason tae try it anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because the kaldorei will no' see their trees fed tae our forges, an' I cannae say I blame them. The Senate thinks yer people are stubborn, an' they think the same o' us." } },
      choices = {
        { text = "Ashenvale isn't Ironforge's to cut.", next = "BACK", reply = "No, it isnae. I'll tell the Senate ye said so, an' they'll grumble about cold forges for a week.", fx = { align = { order = -1 } } },
        { text = "A fair treaty could serve both peoples.", next = "BACK", reply = "It could, an' I've drafted one, but the Senate an' Darnassus are both too stubborn tae read it, so it sits on my desk.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Three this season, an' I've written their names into my next speech, for the Senate should hear them read out at least once. I could use a healer more than I could use another letter, an' I've said so in writin', for all the good it's done." } },
      choices = {
        { text = "Then I'll stay a while and tend to the wounded.", next = "BACK", reply = "Bless ye, an' the diggers will be glad o' it, for they've been patchin' each other wi' linen an' prayers for months.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Speeches won't save diggers. Send soldiers, not names.", next = "BACK", reply = "Aye, an' I've asked for both, but the Senate sends names back faster than soldiers, so I'll read the names an' hope.", fx = { align = { light = -1 } } },
        { text = "Back to the troggs, Senator.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It should, an' it will, eventually, once it's debated the matter an' sent it tae a committee. In the meantime, I'd take one paladin who'll stay a week over a promise o' a company that'll come next spring." } },
      choices = {
        { text = "The Senate's way is slow but lawful. I'll stay till they act.", next = "BACK", reply = "Lawful an' slow, aye, an' ye've the patience o' a saint. The diggers will be glad ye're here in the meantime.", fx = { align = { order = 1 } } },
        { text = "Committees won't stop troggs. I'll do what needs doing now.", next = "BACK", reply = "That's the spirit! I'll no' report it, for the Senate would only form a committee tae decide whether tae thank ye.", fx = { align = { order = -1 } } },
        { text = "Something else, Senator.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_league_dangerous", tags = { "news" }, when = { gossip = { topic = "explorers_league", stance = "dangerous" } },
          text = "I hear ye told High Explorer Magellas his diggin' wakes things best left asleep. Ye're no' wrong, an' I've said the same in the Senate till they stopped listenin'." },
        { id = "h_pt_stonehallow", tags = { "news" }, when = { party = true },
          text = "Ye've brought friends tae the quarry, which is more than the Senate ever does. If any o' them can swing an axe, the troggs are on the lower shelf, an' I'll no' complain if ye thin them out on yer way through." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in my quarry! Well, ye'll find plenty tae mend, for the troggs bite an' my diggers bleed, an' the Senate sends nothin' but letters." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's somethin' the Senate never sends me, though I've asked, in writin', three times." },
        { id = "h_default", text = "Senator Mehr Stonehallow, o' Ironforge's Senate, an' a League man besides. I could be debatin' in the warm, but instead I'm countin' heads in a quarry, because someone has to, an' the troggs keep spoilin' the count." },
        { id = "h_public", tags = { "news" }, when = { questActive = TODO_QUEST("The Public Servant") },
          text = "There's Rockjaw troggs all over Gol'Bolar, so thin the brutes out for me. The Senate'll thank ye eventually, in writin', for that's how the Senate does things." },
        { id = "h_public_done", when = { questDone = TODO_QUEST("The Public Servant") },
          text = "That's a quieter quarry than I've seen in months. I'll mention ye in my next speech, briefly, for they're long speeches." },
        { id = "h_campfire", when = { questActive = TODO_QUEST("A Visitor to Dun Morogh") },
          text = "A campfire on the ridge above my quarry? I saw it, an' I took it for troggs learnin' fire. Go an' look, then, for I'm busy." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid in the Senate halls is a rare sight, so I'll be brief, friend: Ironforge wants timber rights in Ashenvale, an' Darnassus doesnae care tae grant them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "The Senate has its own sort o' quiet folk, an' I'd guess ye know a few o' them. Speak softly in this hall; the walls have long ears." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, an' I'll wager ye've an opinion about the Mystic Ward's funding. Everyone does, an' every one o' them comes tae me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll be plain, warlock, for I've no' the time tae be anythin' else: there's members o' this Senate who'd like yer kind banned from the city." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Good; I've plenty o' troggs tae count, an' I'd rather ye helped reduce the number." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll know how tae count a herd, an' the Senate's clerks cannae count past their own fingers." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. As a senator I'm told tae disapprove o' ye, an' as a League man I'd like tae know what ye've heard in the quarry. I've no' decided which o' me is talkin'." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Quick, now, for the troggs don't take recess." },
        { id = "h_again2", text = "Go on. I've a speech tae write, an' I'd welcome the delay." },
      },
      choices = {
        { text = "You don't trust my people, Senator.", next = "prej", when = { prejudiced = true } },
        { text = "Why won't Darnassus grant the timber rights?", next = "druid_q", when = { class = "DRUID" } },
        { text = "This sounds like a job for the guards.", next = "why" },
        { text = "Where did the troggs come from?", next = "troggs" },
        { text = "What does the Senate do, exactly?", next = "senate" },
        { text = "The quarry must keep the whole city in stone.", next = "quarry" },
        { text = "I grew up in the mines under the mountain.", next = "miner", when = { origin = "dwarf_ironforge_miner" } },
        { text = "A Wildhammer's camped above your quarry.", next = "farsen", when = { questDone = TODO_QUEST("Farsen's Watch") } },
        { text = "Send me after the troggs, Senator. I'm a warrior.", next = "warrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'm a gnome, Senator. These troggs took my city.", next = "gnome", when = { race = "Gnome" } },
        { text = "The Senate must use spies, Senator.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Senate fund the Mystic Ward, Senator?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why does Ironforge still train warlocks at all?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How many troggs are in the quarry, Senator?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can a hunter help you count the troggs, Senator?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have your diggers lost many to the troggs, Senator?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Senate send soldiers to Gol'Bolar, Senator?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Which wins, Senator: the Senate's caution or the League's curiosity?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Why doesn't the Senate send help to the quarry?", next = "xpt_stonehallow", when = { party = true } },
        { text = "I was foreman at Gol'Bolar, Senator, when the troggs broke through.", next = "xorig_foreman", when = { origin = "dwarf_quarry_foreman" } },
        { text = "Good luck, Senator.", next = "END" },
      },
    },
    xorig_foreman = {
      lines = {
        { id = "xoforeman_default", text = "Then ye'll know better than me what's under this quarry, an' better than the whole Senate put together. I read yer report about yer three lads, foreman, an' it was the only report the Senate ever sent me that I read twice. Will ye help me take back the deep cuts?" },
      },
      choices = {
        { text = "For my lads, aye, I will.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I've buried enough men here, Senator.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "The guards are on the walls, an' the walls are where they belong. A senator who won't get his boots dirty for his own district isn't worth the chair." } },
      choices = {
        { text = "Respect.", next = "BACK", reply = "Respect! It's no' often a senator hears that word. I'll take it intae the next debate an' wave it about.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "And it wins votes.", next = "BACK", reply = "Aye, it does, an' I'll no' pretend otherwise, for a senator who cannae win a vote cannae help anybody. But I'd be out here wi' the troggs even if nae one in the district ever heard of it.", fx = { affinity = -1, trait = { witty = 1 }, align = { honor = -1 } } },
      },
    },
    troggs = {
      lines = {
        { id = "tg_default", text = "Out o' the ground. We dug deep, an' they poured out an' smashed every tool they found, an' nobody knows what wakes 'em, though everybody has an opinion." },
      },
      choices = {
        { text = "What's yours?", next = "troggs_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs_think = {
      lines = {
        { id = "tt_default", text = "Diggin', our own. I'm a League man, an' I'll say it in the Senate: we dig where we shouldnae an' then act surprised, an' that doesnae mean we stop." },
      },
      choices = {
        { text = "Honest of you.", next = "BACK", reply = "It's the only kind o' talk worth doin' out here, for the troggs dinnae care about speeches, an' the quarry doesnae either.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Maybe you should stop.", next = "BACK", reply = "Stop diggin'? Ye might as well ask a dwarf tae stop breathin', friend. We'll dig, an' we'll pay for it, an' we'll learn tae dig a wee bit smarter next time, which is the best I can promise the Senate.", fx = { trait = { cautious = 1 }, align = { order = -1 } } },
      },
    },
    senate = {
      lines = {
        { id = "se_default", text = "It looks into threats, keeps the mines producin' an' sets coin aside for defense, an' then it argues, mostly. Some senators think the Dark Irons are a bedtime story." },
      },
      choices = {
        { text = "Is the Senate any good for Ironforge?", next = "opn_senate" },
        { text = "Do you?", next = "senate_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    senate_dark = {
      lines = {
        { id = "sd_default", text = "I've seen soot on a few beards that came from no forge o' ours, an' I say so. They tell me I've been in the quarry too long, an' maybe I have." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    quarry = {
      lines = {
        { id = "qu_default", text = "Stone for the city an' ore for the forges. When it's runnin', a hundred miners eat. When it's not, they drink at the Stonefire an' blame the Senate." },
      },
      choices = {
        { text = "Then let's get them back to work.", next = "BACK", fx = { affinity = 1, standing = { ironforge = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    miner = {
      lines = {
        { id = "mi_default", text = "Then ye know what it is when the work stops. Help me make liars o' the troggs, an' the miners'll be back in by spring." },
      },
      choices = { { text = "Count on it.", next = "BACK", fx = { affinity = 2, standing = { ironforge = 1 } } } },
    },
    farsen = {
      lines = {
        { id = "fa_default", text = "A Wildhammer, watchin' over my quarry wi' wind-magic? Well, as long as it's the Dark Irons he's watchin' an' no' my miners, he can stay." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "That's what I like tae hear, an' it's more than I hear in the Senate in a month o' sittings. Mind ye, the Rockjaw come up in threes, an' the third one's always behind ye." },
        { id = "wa_ward", when = { origin = "dwarf_military_ward" },
          text = "Ward-trained, are ye? Then ye'll know the drill better than my diggers, who swing a pick at a trogg as if it were a seam o' copper." },
      },
      choices = {
        { text = "I'll clear your quarry, Senator.", next = "BACK", fx = { affinity = 2, standing = { ironforge = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Aye, an' I'm sorry for it; I'd no' wish those brutes on anyone. They came up through yer city first an' through my quarry second, so ye an' I have the same enemy, an' that's a start." },
      },
      choices = {
        { text = "The Senate should have helped us sooner.", next = "BACK", reply = "It should have. We were slow, an' I'll carry that shame intae every debate until we make it right.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Ironforge took us in. We can't ask for more.", next = "BACK", reply = "That's a generous thing tae say, an' a rare one, but ye can ask for more, for allies should give each other everythin' they can.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Something else, Senator.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Senate concerns itself wi' every matter that touches Khaz Modan, an' I make it my business tae know them all. Ask me about any o' these." },
    },
    background = { { id = "tp_bg", text = "I'm a senator an' a League member, an' the only one o' either with boots this muddy." } },
    advice = { { id = "tp_ad", text = "If a job's worth a speech, do the job first, for the speech goes better after." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The troggs came up through the gnomes first, an' now they're comin' up through us. Draw yer own conclusions." } },
    explorers_league = { { id = "tp_league", text = "I'm a member. I pay my dues an' dig my own holes, some o' them in quarries." } },
    troggs = { { id = "tp_troggs", text = "Here they're Rockjaw: stupid, strong, an' bad for business.", next = "troggs" } },
    magni = { { id = "tp_magni", text = "The King sits the throne an' the Senate sits around it, an' we each think the other's slow. That's how ye know it's workin'." } },
    thandol_span = { { id = "tp_thandol_span", text = "The Senate's argued about the Span's repair more times than I can count, an' it's still broken. The Dark Irons blew it, an' we'll mend it, an' then we'll argue about who pays." } },
    stromgarde = { { id = "tp_stromgarde", text = "Stromgarde's a broken shell wi' a brave captain an' too few soldiers. The Senate sends what it can, which is less than I'd like an' more than some would." } },
    wildhammer = { { id = "tp_wildhammer", text = "Rough cousins, but true ones when it counts, an' I'd say that in the Senate if anyone else would listen. They came when the Horde did, an' that's all I need tae know." } },
    _none = { { id = "tp_none", text = "Raise it in the Senate, an' bring a cushion, for it'll be a while." } },
  },
}

P:NPC {
  key = "firebrew", id = TODO_NPC("Innkeeper Firebrew"), name = "Innkeeper Firebrew",
  bible = "bibles/ironforge_court.md", role = "innkeeper", tier = "service",
  communities = { "ironforge" }, temper = { "jolly" }, values = { "generous" },
  notices = { "drink", "weary" },

  impression = {
    first = "Innkeeper Firebrew keeps the Stonefire loud, warm and full of stories that grow as the kegs empty. He likes anyone who'll add to the noise.",
    third = "{name} took a stool at the Stonefire Tavern, where Innkeeper Firebrew keeps the beer strong and the stories tall.",
  },

  greetings = {
    { id = "g_tavern", text = "Welcome tae the Stonefire! Grab a stool, grab a mug, an' if ye've a story, grab the room's attention." },
    { id = "g_home", when = { homeInn = { "Ironforge", "Stonefire Tavern" } }, text = "There ye are! Yer bed's warm, as is everythin' in Ironforge, thanks tae the forges." },
    { id = "g_away", when = { away = 14 }, text = "Look who's back after {away}! Grab a stool, an' I hope ye've brought a story big enough tae make up fer the wait." },
    { id = "g_away_long", when = { away = 60 }, text = "By my beard, {away} away, an' the regulars swore ye'd been eaten by somethin' fierce! Sit down an' prove 'em wrong over a mug." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody's been tellin' the whole tavern what a grand sort ye are! Now I'll want the story from yer own mouth, mind." },
    { id = "g_word_caught", when = { word = "caughtLying" }, text = "Word round the kegs is someone caught ye spinnin' a lie. A tall tale's welcome in the Stonefire, friend, but a lie's another thing entirely." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye're well on yer way, an' good, for that's what the place is for. Sit down before ye do it by accident." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Ye've had a hard road. Sit by the fire an' let the mountain hold ye a while, for it's good at that." },
  },

  start = "hello",
  nodes = {
    xpt_firebrew = {
      big = true,
      lines = { { id = "xpt_firebrew_default", text = "A band o' four once swore tae me they'd routed a whole Dark Iron war party wi' a single keg o' Thunderbrew an' a lit candle, an' the worst of it is I half believe them. The second best was a gnome who said he'd been swallowed by a basilisk an' complained that it was borin'." } },
      choices = {
        { text = "Stick to what happened. The truth is story enough.", next = "BACK", reply = "Maybe it is. But the truth rarely gets a round bought for it in the Stonefire.", fx = { align = { honor = 1 } } },
        { text = "A good story beats the truth in a tavern.", next = "BACK", reply = "Ha, that's the spirit o' the Stonefire, an' ye'll fit right in, so long as ye buy a round when yer tale's done.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A mountaineer once swore he held the Algaz pass alone against a hundred Dragonmaw wi' nothin' but a fryin' pan an' a bad temper. By the third keg it was two hundred, an' by closin' time the fryin' pan was enchanted." } },
      choices = {
        { text = "The truth is better than tall tales, to my mind.", next = "BACK", reply = "Suit yerself. A true tale gets a quieter cheer in here than a tall one, mind.", fx = { align = { honor = 1 } } },
        { text = "Give me a keg, and I'll top it.", next = "BACK", reply = "Ha, now that's what I like tae hear, an' I'll pour it, an' we'll see if ye can beat a fryin' pan an' two hundred Dragonmaw.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The loudest, anyway, for every bear grows a foot taller wi' every pint, an' I've heard o' rams that could leap the Great Forge. I like a hunter's story, though, for there's usually a true one hidin' underneath." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The loudest, anyway, for every bear grows a foot taller wi' every pint, though there's usually a true story hidin' underneath. An' I'll wager yer {pet} has a story or two o' its own, if only it could talk an' drink." },
      },
      choices = {
        { text = "My stories stay the size they were.", next = "BACK", reply = "That's rare in the Stonefire. The regulars might call ye a bore by the second keg, but I'll respect it.", fx = { align = { honor = 1 } } },
        { text = "Pour another, and the bear grows another foot.", next = "BACK", reply = "Ha, that's the spirit, an' by the end o' the night it'll be the size o' the Great Forge, an' twice as hot.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ever since the Hidden Circle started usin' my back room tae talk business, aye. I've told them tae take it elsewhere, but they tip well, an' I've a tavern tae keep." } },
      choices = {
        { text = "Then I'll keep my hands to myself in your tavern.", next = "BACK", reply = "Thank ye. The Hidden Circle tips well, but it doesnae make up for a regular's lost purse.", fx = { align = { honor = 1 } } },
        { text = "A full tavern's a full purse, Innkeeper. Some of it falls loose.", next = "BACK", reply = "It does, aye, an' it'll stay tight in their pockets while I'm watchin', so keep yer hands on yer mug, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every few weeks a young gnome from the Mystic Ward wants tae show off, an' I end up wi' a blue fire that smells o' copper. The patrons like it, but the stew doesnae." } },
      choices = {
        { text = "I'll leave your hearth as it is. It's your tavern.", next = "BACK", reply = "Thank ye, an' the stew thanks ye too. It'll be nice tae have a fire that smells like a fire for once.", fx = { align = { order = 1 } } },
        { text = "A blue fire's good for business. You should keep it.", next = "BACK", reply = "Good for business, aye, but bad for the stew, an' I've had three patrons complain it tastes like a copper pipe.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "A few, aye, an' one o' them slept the night in the shape of a great bear by the hearth. The regulars still talk about it, an' they've decided it was good luck." } },
      choices = {
        { text = "Then I'll keep the tradition and take a bear's nap.", next = "BACK", reply = "Ha, the regulars will love it, an' I'll put a blanket by the hearth for ye, for a good luck bear deserves a warm spot.", fx = { align = { honor = -1 } } },
        { text = "I'll take a proper bed, like a decent guest.", next = "BACK", reply = "Proper bed it is, an' I'll make it up nice, though the regulars will be sorely disappointed tae miss another bear.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Often enough, though they ask it wi' a mug in hand an' call it a story. Most o' the soldiers in here lost somebody at the Thandol Span or the Second War, an' a priest who'll sit an' listen does more good than one who preaches." } },
      choices = {
        { text = "Then I'll listen. Sometimes that's the best prayer there is.", next = "BACK", reply = "It is. I'll keep a quiet corner for ye, for half my regulars need an ear more than an ale.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Ale and stories won't heal grief. They need proper counsel.", next = "BACK", reply = "Maybe they willnae, but ale an' stories are what they'll come for, so ye'll find more grief in here than in any chapel.", fx = { align = { light = -1 } } },
        { text = "Tell me a story instead, Firebrew.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Half true, for a paladin will never lie, but he'll leave out the bits where he was frightened. I like those best o' all, mind, the ones where somebody admits they were scared an' did it anyway." } },
      choices = {
        { text = "A true story should include the fear. That's honest.", next = "BACK", reply = "That's my thinkin' too. Let's hear yer story, fear an' all, for those are the ones worth tellin'.", fx = { align = { honor = 1 } } },
        { text = "A soldier's fear is nobody's business. Leave it out.", next = "BACK", reply = "Fair enough, but I've always found the frightened bits make the brave bits braver, so ye might change yer mind by the third pint.", fx = { align = { honor = -1 } } },
        { text = "Something else, Firebrew.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Some do, an' they mutter into their mugs, but the Stonefire's had worse at the bar, includin' a Dark Iron spy we didnae catch till he'd drunk half a barrel. Tell us a good story an' they'll forget what ye are by the third round." },
      },
      choices = {
        { text = "I'll tell the truth, even if it frightens them.", next = "BACK", reply = "The regulars might grumble, but they'll respect it. An honest, frightenin' story beats a dull, friendly one any night.", fx = { align = { honor = 1 } } },
        { text = "I'll tell them whatever keeps them friendly.", next = "BACK", reply = "That's sense, an' the Stonefire likes a friendly tale, but mind ye dinnae make it too sweet, or they'll know ye're lyin'.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    dd_fb_balloo = {
      lines = {
        { id = "dd_fb_balloo1", text = "Aye, for every family in the Military Ward has somebody who never came home, an' none o' them can get a letter past the clerks. When the King heard her out, it was as if he'd heard all o' them, an' I sold more ale that night than on the first night o' Winter Veil." },
      },
      choices = {
        { text = "The King should hear every family that asks.", next = "BACK", reply = "He should, aye, an' maybe now he will. Ye've set a fine example for the clerks.", fx = { align = { order = -1 } } },
        { text = "The clerks are there for a reason. This was special.", next = "BACK", reply = "Spoken like a clerk! But ye're no' wrong, for the King cannae hear everyone at once.", fx = { align = { order = 1 } } },
        { text = "Something else, Firebrew.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "Ye'll be after a room like {alt} was, I expect, for ye've the same tired boots an' the same thirsty look. That one told a story about a wendigo at my hearth that I've been repeatin' ever since, an' badly." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "Ye just missed {alt}, near enough, for that one sat by the big hearth only a few nights back. If ye're no' related ye should be, for ye drink the same an' ye argue the same." },
        { id = "o_warchief_gossip", tags = { "news" }, when = { gossip = { topic = "warchief", stance = "trust" } },
          text = "Word from the High Seat is ye told the King tae trust the orc warchief! Brave thing tae say in that room, an' braver tae say in mine, so keep it quiet by the fire." },
        { id = "o_senate_corrupt", tags = { "news" }, when = { gossip = { topic = "ironforge_senate", stance = "corrupt" } },
          text = "They're sayin' ye told Senator Stonehallow there's rot in the Senate. Ye'll no' find a senator drinkin' at the Stonefire tonight, I'll tell ye that." },
        { id = "h_pt_firebrew", tags = { "news" }, when = { party = { size = 4 } },
          text = "Five o' ye! Now that's a proper party, an' the Stonefire's the place for it. Sit yerselves down by the big hearth, an' the first one who tells a lie about a dragon has tae tell a better one after." },
        { id = "h_pt_firebrew2", tags = { "news" }, when = { party = { size = { min = 1, max = 3 } } },
          text = "Brought some friends, have ye? Good, the Stonefire's too quiet wi' only the regulars, an' they've told all their stories twice." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at the Stonefire! Ye'll forgive the noise, I hope, for my patrons sing louder than any choir, an' worse." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's somebody who'll add tae the noise, for yer sort always tell the best war stories, an' they're half true, which is better than most." },
        { id = "h_brewer", when = { origin = "dwarf_brewer" },
          text = "A brewer's youngest, out in the world! I can always tell, for ye taste my ale like ye're markin' it out o' ten. Go on, then, give us the number, an' I'll pretend I don't care." },
        { id = "h_default", text = "Firebrew, an' I keep the Stonefire. The beer's strong an' the fire's stronger, an' the stories get taller as the kegs get lighter." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Well now, an elf from the clouds, in my tavern! Sit near the fire, for ye'll be cold up here, or down here, or under here, wherever this is tae you." },
        { id = "h_druidclall", when = { minLevel = 47 },
          text = "Word's come from Darnassus: Arch Druid Staghelm wants seasoned hands for some research o' his. If ye go, wipe yer boots before ye come back in." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at the Stonefire! I've no oats an' no fresh berries, I'm afraid, but there's honest bread an' a fire tae warm yer paws, if ye've got paws today." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "If ye're here tae lighten anyone's purse, ye'll find the patrons o' the Stonefire Tavern drink wi' one hand on their coin." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I'll have ye know the hearth in the Stonefire burns on good coal, so ye'll no' need tae add anythin' fancy tae it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Grab a stool, then, for every warrior in the Stonefire has a tale, an' I'm sure ye've a taller one." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? The Stonefire's full o' fish stories, but a good bear story beats them all, if ye've got one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock at the Stonefire! Pull up a stool, an' tell yer servant there's no' a keg in this tavern it's allowed tae set alight, however much it begs." },
        { id = "dd_balloo", tags = { "news" }, when = { questDone = TODO_QUEST("A King's Tribute") },
          text = "The whole tavern's heard ye carried Sara Balloo's plea all the way tae the King's own ear. That lass has been tryin' tae get word tae the throne since her brother fell, an' half o' Ironforge cheered when they heard." },
        { id = "dd_exalted", when = { reputation = { faction = "Ironforge", min = "exalted" } },
          text = "There's no' a dwarf in this city who doesnae know yer name now, an' I've heard it toasted at my own bar more nights than I can count." },
      },
      again = {
        { id = "h_again", text = "Another? Story or ale, ye're welcome either way." },
        { id = "h_again2", text = "What else? The kegs aren't goin' anywhere, which is the trouble." },
      },
      choices = {
        { text = "Half of Ironforge cheered for Sara Balloo?", next = "dd_fb_balloo", when = { questDone = TODO_QUEST("A King's Tribute") } },
        { text = "Have you had druids here before?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Tell me a story.", next = "story" },
        { text = "This tavern seems to draw a mixed crowd.", next = "regulars" },
        { text = "A shaman's toast: to the fire under the mountain.", next = "shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Do the Stonefire's patrons watch their purses that closely?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do mages often try to improve your hearth?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's the tallest warrior's tale you've heard, Firebrew?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters tell the best stories in the Stonefire?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your patrons must ask a priest for comfort sometimes.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you like paladins' stories, Firebrew? Are they ever true?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your regulars mind a warlock at the bar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What's the best story a company ever told in here?", next = "xpt_firebrew", when = { party = true } },
        { text = "Just a drink.", next = "END" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Ye want a story, ye tell one first. That's the rule o' the Stonefire. Then the old greybeard by the fire'll tell ye about the time he arm-wrestled a gryphon." } },
      choices = { { text = "Did he win?", next = "won" }, { text = "Maybe later.", next = "BACK" } },
    },
    won = {
      lines = { { id = "w_default", text = "Depends which night ye ask him. Twice he's won, an' once he's lost an arm, an' he's still got both his arms." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Miners off shift, the King's guard after theirs, an' gnomes from Tinker Town drinkin' half-measures. An' John Turner, nursin' a water an' askin' for coin for orphans." },
      },
      choices = {
        { text = "I'd guess nobody gives him coin.", next = "regulars_john" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_john = {
      lines = {
        { id = "rj_default", text = "More than ye'd think, for a dwarf cannae stand bein' asked twice in front o' his friends. John knows it, too; he's a clever man." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Ha! I'll drink tae that, an' so will the fire, by the way it's crackin'. One old miner swears ye shamans are Wildhammers in disguise, but the rest o' my regulars just want ye tae make the hearth burn hotter." },
      },
      choices = {
        { text = "The fire burns how it likes, Firebrew.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every dwarf in Ironforge drinks at the Stonefire sooner or later, an' every one o' them talks. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I've kept the Stonefire's kegs longer than some o' my regulars have had beards, an' longer than some o' the beards have had regulars." } },
    advice = { { id = "tp_ad", text = "Never drink wi' a gnome engineer who's brought his work along, for somethin' always goes off." } },
    dark_iron = { { id = "tp_dark_iron", text = "Don't say that name loud in here. The lads get worked up, an' worked-up dwarves break furniture." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our little friends drink half-measures an' tip double. I'll no' hear a word against them." } },
    magni = { { id = "tp_magni", text = "The King drinks here when he can slip his guards, which is less often than he'd like. He tips like a king an' sings like a miner, an' I'll no' say which is louder." } },
    wildhammer = { { id = "tp_wildhammer", text = "They come down from Aerie Peak now an' then an' drink like they've a grudge against my kegs. I like them fine, though I keep the good stuff behind the bar when they're in." } },
    booty_bay = { { id = "tp_booty_bay", text = "Every sailor who's been tae Booty Bay comes back wi' a story about a pirate an' a goblin, an' it's always the goblin that robbed him. I believe every word." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's ale is a sin against honest brewin', an' I've told Silas Darkmoon so tae his face. He laughed an' offered me a ride on his wheel." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Folk who come back from that troll arena in Stranglethorn have the best scars an' the worst manners. They drink well, though, an' they pay in gold." } },
    everlook = { { id = "tp_everlook", text = "A goblin town in the snows o' Winterspring, an' they've the nerve tae charge for heat. Any dwarf could tell them ye just stand closer tae the fire." } },
    _none = { { id = "tp_none", text = "Ask the room. Someone in here'll know, an' three more'll argue with him." } },
  },
}
