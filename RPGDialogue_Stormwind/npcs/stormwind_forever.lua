-- Stormwind folk who exist only in World of Warcraft: Forever: Abigail Lawson (Cathedral Square,
-- Marshal Ryan's betrothed), Gilbert Gray (a fisher on the harbor piers), Idrieth Mossgrove (the
-- kaldorei pier and the boat to Auberdine), Roy Lewells (a reader in the Park), Aendaril Brookshot
-- (a druid in the Valley of Heroes) and Fyrenz Vishonar (the transmogrifier).
-- Voices: bibles/stormwind_forever.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Abigail Lawson: waits in Cathedral Square for news of Marshal Ryan.
---------------------------------------------------------------------------
P:NPC {
  key = "abigail_lawson", id = TODO_NPC("Abigail Lawson"), name = "Abigail Lawson",
  bible = "bibles/stormwind_forever.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "proud", "loyal" },
  notices = { "soldier", "light", "kin" },
  impression = {
    first = "Her marshal chose an old war over her, and she forgives neither.",
    third = "{name} met Abigail Lawson, Marshal Ryan's betrothed, in Cathedral Square.",
  },

  greetings = {
    { id = "g_default", text = "If you're collecting for the orphanage, I've already given this week. If you're not, I can't think what you want with me." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You've a habit of turning up in this square, haven't you?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Delivering Closure") }, text = "You've a look on your face I've seen before, on men at doorsteps. Go on, then, say it." },
    { id = "g_done", when = { questDone = TODO_QUEST("Delivering Closure") }, text = "You came back. I didn't think you would, after the way I took the news." },
  },

  notice = {
    { id = "n_horse", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 36 },
      text = "You've the look of someone who's ridden east lately. If you've been to that keep of theirs, don't tell me about it unless I ask." },
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. I pray in there every morning, and I've stopped asking for anything in particular." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Abigail Lawson. I live with my parents off the square and I come out here most days to sit by the Cathedral, because the house is too quiet and my mother asks too many questions." },
        { id = "h_waiting", when = { ["not"] = { questDone = TODO_QUEST("Delivering Closure") } },
          text = "I suppose it's only a matter of time before someone comes asking about Ryan. I've been rehearsing what I'll say when they do, and none of it is kind." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Delivering Closure") },
          text = "That's his crest in your hand, isn't it? I'd know it anywhere. Demar sent you because he hadn't the courage to come himself." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Delivering Closure"), days = 3 } },
          text = "I keep his crest under my pillow, which is foolish, and I talk to it at night, which is worse. I tell it he was an idiot, and then I cry, and then I tell it again." },
        { id = "h_done", when = { questDone = TODO_QUEST("Delivering Closure") },
          text = "My mother has stopped asking questions now, which is a mercy. I still come to the square, but now I light a candle in the Cathedral before I sit." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be." },
        { id = "h_again2", text = "Ask, then. I'll answer if I feel like it." },
      },
      choices = {
        { text = "Who is Ryan?", next = "ryan", when = { ["not"] = { questActive = TODO_QUEST("Delivering Closure") } } },
        { text = "Why didn't you go with him?", next = "argument" },
        { text = "What do you think of Demar Brant?", next = "demar", when = { any = { { questActive = TODO_QUEST("Delivering Closure") }, { questDone = TODO_QUEST("Delivering Closure") } } } },
        { text = "What's it like, living by the Cathedral?", next = "square" },
        { text = "Ryan's last thoughts were of you, Abigail.", next = "last", when = { questActive = TODO_QUEST("Delivering Closure") } },
        { text = "How are you holding up?", next = "after", when = { questDone = TODO_QUEST("Delivering Closure") } },
        { text = "I have something for you.", next = "BUSINESS", when = { questActive = TODO_QUEST("Delivering Closure") } },
        { text = "Your parents must worry about you, sitting out here.", next = "family" },
        { text = "I've been to Farholde Keep, in the Riverglades.", next = "farholde", when = { minLevel = 36 } },
        { text = "I trained as a squire. I'd have ridden out with him.", next = "xsquire", when = { origin = "human_paladin_squire" } },
        { text = "I lost my own family to the war, up north.", next = "xrefugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "I'm a priest. I could sit with you a while.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What will you do now?", next = "future", when = { questDone = TODO_QUEST("Delivering Closure") } },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },

    ryan = {
      lines = {
        { id = "ry_default", text = "Ryan was my betrothed, a marshal with the Brotherhood of the Horse, out east fighting a war the rest of Stormwind gave up on twenty years ago. We were to marry, once, before he decided the orcs needed him more than I did." },
        { id = "ry_done", when = { questDone = TODO_QUEST("Delivering Closure") }, text = "He was my betrothed, and he died out east in a war Stormwind gave up on long ago. You know the rest; you carried it to me." },
      },
      choices = {
        { text = "Why did he go?", next = "ryan_why" },
        { text = "What's the Brotherhood of the Horse?", next = "brotherhood" },
        { text = "How did the two of you meet?", next = "ryan_meet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ryan_why = {
      lines = {
        { id = "rw_default", text = "When the orcs came in the First War, they killed his family, all of them. Something changed in him after that: it started as duty and it turned into a hatred that ate everything else, me included." },
      },
      choices = {
        { text = "Grief like that is hard to put down.", next = "ryan_grief" },
        { text = "He was right to fight. The orcs owed him blood.", next = "ryan_grief", fx = { align = { light = -1 } } },
        { text = "Hatred like that destroys the one who carries it.", next = "ryan_grief", fx = { align = { light = 1 } } },
      },
    },
    ryan_grief = {
      lines = {
        { id = "rg_default", text = "I asked him to come and live with my parents and me, here, in a city with walls and bread and a Cathedral. He swore he'd stay until he'd purged his home of orcs, and he wouldn't budge an inch, so we parted badly, and we've not spoken since." },
      },
      choices = {
        { text = "Do you regret not going with him?", next = "argument" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood = {
      lines = {
        { id = "bh_default", text = "An old order of Stormwind's knights, older than the First War, and Lothar himself rode with them once. They hold a keep out east and fight for land the kingdom called lost, and they're very proud of it, and very short of men." },
      },
      choices = {
        { text = "They're fighting for what's theirs. That's honourable.", next = "BACK", reply = "Honourable, yes, and Ryan believes it with his whole heart. I only wish honour came with reinforcements.", fx = { align = { order = -1 } } },
        { text = "The crown called the land lost. They should obey.", next = "BACK", reply = "You sound like the court, and the court has never once had to watch a man ride east. Obey whom, exactly?", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    argument = {
      lines = {
        { id = "ar_default", text = "Because I'd buried enough people for one life, and I wasn't going to go out to some damp keep at the edge of the world and wait to bury him too. So we argued, and I said things, and he said things, and he went." },
      },
      choices = {
        { text = "You were right to stay.", next = "argument_right", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A promised bride should follow her betrothed.", next = "argument_right", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "What did you say to him?", next = "argument_said" },
      },
    },
    argument_right = {
      lines = {
        { id = "arr_default", text = "Right or wrong, I'm here and he isn't. I tell myself I was right most days, and on the bad days I tell myself I should have gone and dragged him home by the collar." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    argument_said = {
      lines = {
        { id = "as_default", text = "That he loved his grudge more than he loved me. He didn't deny it, which was worse than if he'd shouted. He just looked at me as though I'd told him something he already knew." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    demar = {
      lines = {
        { id = "de_default", text = "Demar Brant is a coward who wouldn't show his face to me, and a hero, which is the same thing in my experience. That's the thing about heroes: they excel at getting other people killed." },
      },
      choices = {
        { text = "He's holding that keep with almost nothing.", next = "demar_defend" },
        { text = "He sent Ryan to die. You're right to hate him.", next = "demar_defend", fx = { align = { order = -1 } } },
        { text = "Ryan chose to stay. Demar only led him.", next = "demar_defend", fx = { align = { order = 1 } } },
      },
    },
    demar_defend = {
      lines = {
        { id = "dd_default", text = "I know what he's holding, and I know what it costs. If you're going to stay out there and help them, take care of yourself, because I've no wish to hear your name at a doorstep too." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Would you ever go out there, to see where he fell?", next = "demar_grave" },
        { text = "Something else.", next = "BACK" },
      },
    },

    square = {
      lines = {
        { id = "sq_default", text = "Busy and holy, both at once, and loud with it. The priests come and go, the orphans run about under the Matron's eye, and the widows sit on the steps like I do, which I suppose makes me one already." },
      },
      choices = {
        { text = "You're not a widow yet.", next = "square_widow", when = { ["not"] = { questDone = TODO_QUEST("Delivering Closure") } } },
        { text = "Do you still pray, in there?", next = "prayer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    square_widow = {
      lines = {
        { id = "sw_default", text = "No, I'm not anything yet. That's the trouble with waiting for someone; you can't mourn and you can't stop worrying, so you sit in a square and watch the pigeons." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    last = {
      lines = {
        { id = "la_default", text = "Of me? Then he was a bigger fool than I thought, to think of me at the end and not at the start. Did he say anything, or just my name?" },
      },
      choices = {
        { text = "He said he should have come home.", next = "last_home", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "He said he loved you. Only that.", next = "last_love", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    last_home = {
      lines = {
        { id = "lh_default", text = "Should have come home. Twenty years of grudge, and that's what he finds at the bottom of it." },
      },
      choices = {
        { text = "Let me give you his crest.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    last_love = {
      lines = {
        { id = "ll_default", text = "He never said it in his life, not once, so I'll pretend to believe it for your sake. Give me the crest, then, before I change my mind." },
      },
      choices = {
        { text = "Here it is.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "Better than I was. I've stopped rehearsing angry speeches in my head, and started telling him about my day instead, which my mother says is progress and my father says is madness." },
      },
      choices = {
        { text = "Grief takes its own time.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ryan_meet = {
      lines = {
        { id = "rm_default", text = "He came to the city to beg the House of Nobles for soldiers, and he stood in this very square shouting about it to anyone who'd listen. I told him he was frightening the pigeons, and he laughed, and I think that was the only time I ever heard him laugh properly." },
      },
      choices = {
        { text = "What did the nobles say to him?", next = "ryan_nobles" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    ryan_nobles = {
      lines = {
        { id = "rn_default", text = "They gave him a supper and a speech and not a single soldier, because the Riverglades were written off as lost before either of us was grown. I thought he'd give up after that, and instead he gave up on Stormwind." },
        { id = "rn_noble", when = { origin = "human_minor_noble" }, text = "Your sort gave him a supper and a speech and not one soldier, begging your pardon, because the Riverglades were written off long ago. I thought he'd give up after that, and instead he gave up on Stormwind." },
      },
      choices = {
        { text = "The crown can't defend every lost valley. It chose rightly.", next = "BACK", reply = "Rightly, perhaps, by the court's arithmetic. It's a different sum when the valley has someone you love in it.", fx = { align = { order = 1 } } },
        { text = "The crown abandoned its own people out there.", next = "BACK", reply = "It did, and I said so in that very hall, and they looked at me as though I'd spilled the wine.", fx = { align = { order = -1 }, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Did you agree with him, about the nobles?", next = "ryan_agree" },
      },
    },
    ryan_agree = {
      lines = {
        { id = "rag_default", text = "About the nobles, yes, and I'd say so to their faces at any supper they cared to invite me to. Where we parted was what came after, because I thought a man could be angry at the crown and still come home in the evening." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },

    family = {
      lines = {
        { id = "fa_default", text = "My mother means well, and my father says nothing at all, which is his way of meaning well. They lost my brother when the orcs burned the city, so they know a little about waiting for someone who isn't coming back." },
      },
      choices = {
        { text = "Your brother died when Stormwind fell?", next = "family_brother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_brother = {
      lines = {
        { id = "fb_default", text = "He was nineteen and in the city watch, on the gate the morning the Horde came through it. We never found him, so my mother kept his room just as it was for ten years, and I swore I'd never keep a room for anyone." },
      },
      choices = {
        { text = "So that's why you wouldn't follow Ryan east.", next = "family_why" },
        { text = "I'm sorry, Abigail.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    family_why = {
      lines = {
        { id = "fw_default", text = "Yes, if you want it put plainly. I wasn't going to stand on a wall and watch another man I loved run at the orcs, so I stayed, and he ran at them anyway, and now I keep a room after all." },
      },
      choices = {
        { text = "Staying was the braver choice.", next = "BACK", reply = "Was it? I tell myself so on the good days. On the bad ones it only feels like the lonelier choice.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Love means going where they go, whatever it costs.", next = "BACK", reply = "Then you'd have gone east, and I'd have thought you a fool, and I'd have envied you a little.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    prayer = {
      lines = {
        { id = "pr_default", text = "Every morning, on the same pew, which the sexton has started dusting for me. I used to pray he'd come home, and then that he'd write, and now I just sit and let the Light look at me, because I've run out of things to ask it for." },
        { id = "pr_priest", when = { class = "PRIEST" }, text = "Every morning, on the same pew, and you'd know better than I whether what I do there counts as praying. I used to ask for things, and now I just sit and let the Light look at me, because I've run out of asking." },
      },
      choices = {
        { text = "The Light hears you, even when you ask for nothing.", next = "BACK", reply = "I'd like to believe that. The sexton certainly seems to, and he's a man who dusts pews for a living.", fx = { align = { light = 1 } } },
        { text = "The Light didn't bring him home. Don't waste your mornings.", next = "BACK", reply = "Perhaps not, but it gives me somewhere to sit that isn't a window. I'll keep my mornings, thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    demar_grave = {
      lines = {
        { id = "dg_default", text = "And stand in the mud looking at a stone with his name on it, while Demar Brant tells me he died bravely? I've his crest, and that's as near to the Riverglades as I ever mean to get." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },

    farholde = {
      lines = {
        { id = "fh_default", text = "Have you? Then don't tell me it's beautiful, because he wrote that once, and it's the only line of any letter of his I ever burned. Tell me instead whether they're still holding, or whether it's only pride keeping the gates shut." },
      },
      choices = {
        { text = "They hold because they swore to. That counts for something.", next = "farholde_hold", fx = { align = { honor = 1 } } },
        { text = "It's pride. They should give that valley up.", next = "farholde_hold", fx = { align = { honor = -1 } } },
        { text = "Both, I think. And they're short of everything.", next = "farholde_hold", fx = { learn = { "siege_of_farholde" } } },
      },
    },
    farholde_hold = {
      lines = {
        { id = "fhh_default", text = "Then it's what it always was with him, a little honour and a mule's share of stubbornness. I'll not wish them ill, whatever I say about Demar; I only wish they'd stop sending letters home in other people's hands." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xsquire = {
      lines = {
        { id = "xs_default", text = "Of course you would; you've the same light in your eye he had at twenty, the one that thinks a cause is a kind of family. If someone you love ever asks you to come home, promise me you'll at least think before you say no." },
      },
      choices = {
        { text = "Duty comes first. He knew that, and so do I.", next = "BACK", reply = "He did, and I've stopped asking him to choose otherwise. I'd only ask you to write to someone, now and then.", fx = { align = { honor = 1 } } },
        { text = "I'd come home. No cause is worth that.", next = "BACK", reply = "Then you've more sense than either of us, and I hope whoever loves you hears you say it.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll think about it. I promise.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    xrefugee = {
      lines = {
        { id = "xr_default", text = "Then you know the shape of it, the way it sits in your chest when you're trying to eat your supper. Did it make you hate them, the way it did Ryan, or did you find something else to carry?" },
      },
      choices = {
        { text = "I hate them still. I won't pretend otherwise.", next = "xrefugee_after", fx = { align = { light = -1 } } },
        { text = "I put it down. I had to, to go on living.", next = "xrefugee_after", fx = { align = { light = 1 } } },
        { text = "I don't know yet.", next = "xrefugee_after" },
      },
    },
    xrefugee_after = {
      lines = {
        { id = "xra_default", text = "That's more honest than most people manage. Ryan never once in his life said he didn't know something, and I've come to think it was the one thing he most needed to say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xpriest = {
      lines = {
        { id = "xp_default", text = "Sit, if you like, but don't pray at me, because I get enough of that from my mother. You can tell me instead whether the Light minds a woman calling a dead man an idiot every night, since I've been wondering." },
      },
      choices = {
        { text = "The Light minds very little that's honest.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "He was an idiot. The Light agrees.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    future = {
      lines = {
        { id = "fu_default", text = "The Matron has asked me to help with the orphans three mornings a week, and I've said yes, mostly to get out of the house. It turns out I'm good with children who shout, which my mother finds very funny indeed." },
      },
      choices = {
        { text = "That's a fine use for a sharp tongue.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stormwind born, back under my parents' roof, and betrothed to a man who loved a war more than me." } },
    advice = { { id = "tp_ad", text = "If someone you love asks you to come home, go." } },
    _none = { { id = "tp_none", text = "I don't know and I don't much care. Ask one of the priests; they're paid to listen." } },
  },
}

---------------------------------------------------------------------------
-- Gilbert Gray: a fisher on the harbor piers.
---------------------------------------------------------------------------
P:NPC {
  key = "gilbert_gray", id = TODO_NPC("Gilbert Gray"), name = "Gilbert Gray",
  bible = "bibles/stormwind_forever.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "patient", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "He talks about fish endlessly and with total confidence.",
    third = "{name} met Gilbert Gray, an old fisher on the piers of Stormwind Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Shh, don't stamp on the boards. They can hear you through the water, you know." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Pull up a crate. The fish aren't biting, but the company's good." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "Now there's a fisherman, I can see it in the way you look at the water." },
    { id = "g_active", when = { questActive = TODO_QUEST("Fishin' Time") }, text = "How's it going with that little job of mine? No rush; fish don't hurry, and neither do I." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've got a fisher's hands, I can tell by the line burns. Where do you cast, when you get the chance?" },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the tall folk from the far pier. You lot fish with spears, someone told me; is that true, or are they having me on?" },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Gilbert Gray, and this end of the pier's mine, more or less, since nobody else wants it. The harbor's all ships and shouting these days, but the fish don't care about any of that." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Fishin' Time") },
          text = "I've a little job, if you've got the patience for it, and a rod you can spare an hour with. Fishin' time, I call it, and it's the best time there is." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Fishin' Time") },
          text = "You'll get the hang of it. The trick is to stop trying so hard and let the water do the work." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Fishin' Time"), days = 3 } },
          text = "You did well there, better than I did my first summer. We'll make a fisher of you yet." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fishin' Time") },
          text = "There's my fishing partner! Sit down, sit down; I've saved you a crate." },
      },
      again = {
        { id = "h_again", text = "What else? We've all day." },
        { id = "h_again2", text = "Go on, I'm only watching a float." },
      },
      choices = {
        { text = "What's biting in the harbor?", next = "fish" },
        { text = "How long have you fished here?", next = "years" },
        { text = "What do you make of the new harbor?", next = "harbor" },
        { text = "What's this job of yours?", next = "job", when = { ["not"] = { questDone = TODO_QUEST("Fishin' Time") } } },
        { text = "I'll do your job.", next = "BUSINESS", when = { any = { { questBefore = TODO_QUEST("Fishin' Time") }, { questActive = TODO_QUEST("Fishin' Time") } } } },
        { text = "You talk to the fish, don't you?", next = "talk" },
        { text = "You don't think much of Arnold Leland.", next = "arnold" },
        { text = "I'm a fisher myself, when I get the chance.", next = "xfisher", when = { profession = "Fishing" } },
        { text = "I'm from Lordaeron. We came south after the plague.", next = "xrefugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "I grew up in the canals. Never caught a thing.", next = "xcanals", when = { origin = "human_canal_pickpocket" } },
        { text = "We do fish with spears, sometimes.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Loch Modan has fish as long as your arm.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "How's the catch been, since?", next = "partner", when = { questDone = TODO_QUEST("Fishin' Time") } },
        { text = "Good fishing, Gilbert.", next = "END" },
      },
    },

    fish = {
      lines = {
        { id = "fi_default", text = "Not much, in this weather, but the odd fat one comes in with the tide. Fish follow the ships, you know, for what gets thrown overboard, and there's plenty thrown overboard round here." },
      },
      choices = {
        { text = "Any secrets to catching them?", next = "fish_secret" },
        { text = "What sort of fish come in with the tide?", next = "fish_kinds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_secret = {
      lines = {
        { id = "fs_default", text = "Patience, and a bit of bread rolled up tight, and never looking at the float too hard. If you stare at it, it won't move; look away and it'll go under every time." },
        { id = "fs_fisher", when = { profession = "Fishing" }, text = "You know that already, I'd wager. Arnold Leland down by the canals teaches the proper way, but I've never had a lesson in my life, and I've caught more than he has." },
      },
      choices = {
        { text = "Patience, then. I'll remember that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    years = {
      lines = {
        { id = "ye_default", text = "Since I was a lad, before the orcs came, when there was hardly a harbor at all, just old docks and fishing boats. Then the city burned, and we came back, and they built all this, and I'm still here with the same old rod." },
      },
      choices = {
        { text = "You came back after the city burned?", next = "years_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    years_burn = {
      lines = {
        { id = "yb_default", text = "Got out on one of the last boats north with Lothar's lot, and spent the war in Lordaeron gutting fish. When we came back, there was nothing here, so I sat on what was left of the pier and fished until they built a new one around me." },
      },
      choices = {
        { text = "That's a stubborn way to live.", next = "BACK" },
        { text = "What was the voyage north like?", next = "years_voyage" },
        { text = "Something else.", next = "BACK" },
      },
    },

    harbor = {
      lines = {
        { id = "ha_default", text = "Big, and busy, and full of fellows in uniforms telling you where not to stand. The elves have their own pier now, with a boat to Darkshore, and I'll say this for them: they're quiet, and they don't spit on the planks like the sailors do." },
      },
      choices = {
        { text = "Do you like having the elves here?", next = "harbor_elves" },
        { text = "Fellows in uniforms? The harbor guards?", next = "harbor_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harbor_elves = {
      lines = {
        { id = "he_default", text = "Can't complain. They don't scare the fish, and they nod when they pass, which is manners. One of them asked me once what I was catching, and listened to the whole answer, which nobody's done in thirty years." },
      },
      choices = {
        { text = "Good. The Alliance needs them, and they need us.", next = "BACK", reply = "That's what I reckon too, and the fish don't seem to mind either way.", fx = { align = { order = 1 } } },
        { text = "Stormwind should look after its own first.", next = "BACK", reply = "Aye, maybe so, but there's plenty of fish to go round. They can have a few.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    job = {
      lines = {
        { id = "jo_default", text = "Nothing hard, just an hour or two with a rod. I'm not as quick as I was, and there's some catching wants doing that I can't manage by myself anymore." },
      },
      choices = {
        { text = "Why not hire a dockhand?", next = "job_dock" },
        { text = "What exactly needs catching?", next = "job_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_dock = {
      lines = {
        { id = "jd_default", text = "Dockhands want coin, and they talk the whole time, and they don't know a rod from a broom handle. You've got a proper look about you, so I thought I'd ask." },
      },
      choices = {
        { text = "Then I'm your fisher.", next = "BUSINESS", when = { questBefore = TODO_QUEST("Fishin' Time") } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fish_kinds = {
      lines = {
        { id = "fk_default", text = "Mackerel, mostly, and little silver smallfish that aren't worth the bread, and once a year, if I'm lucky, something big enough to argue with. I had a sea turtle on the line one spring that towed me half the length of this pier before I let him go." },
      },
      choices = {
        { text = "You let a catch like that go?", next = "fish_turtle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_turtle = {
      lines = {
        { id = "ft_default", text = "He'd lived longer than me, by the look of his shell, and it seemed a poor way to thank him for the exercise. The lads on the docks still call me the turtle man, and I've decided to take it kindly." },
      },
      choices = {
        { text = "A fish that fights that hard has earned its freedom.", next = "BACK", reply = "That's what I thought, and the lads still laugh at me for it. I'd do it again, mind.", fx = { align = { light = 1 } } },
        { text = "A catch is a catch. That was a week of suppers.", next = "BACK", reply = "A week of suppers and a lifetime of guilt, friend. I'd rather the story than the soup.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    talk = {
      lines = {
        { id = "tk_default", text = "Only the ones that answer back, and those are usually crabs. My wife used to say I'd talk to a bucket if it sat still long enough, and she wasn't wrong, rest her." },
      },
      choices = {
        { text = "You lost your wife?", next = "wife" },
        { text = "Crabs are good listeners.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    wife = {
      lines = {
        { id = "wi_default", text = "Eight winters ago, a fever, quick and quiet the way she was. She never liked fish, not once in forty years, which I've always thought was the cruellest joke the Light ever played on a fisherman's wife." },
      },
      choices = {
        { text = "I'm sorry, Gilbert.", next = "BACK", fx = { affinity = 1 } },
        { text = "What did she cook, then, if not fish?", next = "wife_cook" },
      },
    },
    wife_cook = {
      lines = {
        { id = "wc_default", text = "Mutton pie, every night she could get mutton, and she'd make me a plate of fish on the side with a face like she was handling a dead rat. I'd give my rod and my pier for one more of those faces, and that's the truth." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    arnold = {
      lines = {
        { id = "an_default", text = "Oh, I think plenty of him; he's a fine teacher and a terrible fisherman, and we've been arguing about bait for longer than I'd care to count. He says I'm a stubborn old fool, which is true, and I say he talks the fish to sleep, which is also true." },
      },
      choices = {
        { text = "A proper teacher beats learning by luck.", next = "BACK", reply = "You sound like Arnold, and he'd be very pleased to hear it. Don't tell him I said so.", fx = { align = { order = 1 } } },
        { text = "Nobody can teach patience. You learn it or you don't.", next = "BACK", reply = "That's what I keep telling him, and he keeps not listening, which is a sort of proof.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    years_voyage = {
      lines = {
        { id = "yv_default", text = "Cold, and crowded, and the whole deck crying for people left on the docks. Lothar's men kept order with a word and a look, and I gutted fish for three hundred people with a knife I've still got, that one there on the crate." },
      },
      choices = {
        { text = "And Lordaeron, when you got there?", next = "years_lordaeron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    years_lordaeron = {
      lines = {
        { id = "yl_default", text = "Kind enough at first, and less kind every year the war went on. They fed us and put us in camps along the coast, and I fished their waters until a Lordaeron fisherman threw my rod in the sea, and I threw him in after it." },
        { id = "yl_refugee", when = { origin = "human_lordaeron_refugee" }, text = "Your folk took us in, and fed us, and put us in camps along the coast, and I'll not forget it. I'll not forget the fellow who threw my rod in the sea, either, but I threw him in after it, so we're square." },
      },
      choices = {
        { text = "They had a right to their own waters.", next = "BACK", reply = "They did, and I don't blame them now. A man's waters are his own, and I was only a guest.", fx = { align = { order = 1 } } },
        { text = "You'd lost everything. They should have shared.", next = "BACK", reply = "That's kind of you to say, but grief doesn't share very well, friend. Still, I remember it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    harbor_guards = {
      lines = {
        { id = "hg_default", text = "The harbor watch, and the dockmaster's men, and the navy lads off the warships. They're all very proud of the new piers, and they all walk right past me as though I were part of them, which after all these years I suppose I am." },
      },
      choices = {
        { text = "The guards keep the harbor safe. Let them fuss.", next = "BACK", reply = "Let them, aye, so long as they fuss around me and not through me. I've a line in.", fx = { align = { order = 1 } } },
        { text = "A man should fish his own pier in peace.", next = "BACK", reply = "Too right, friend, and I'll tell the dockmaster you said so next time he moves my bucket.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    job_what = {
      lines = {
        { id = "jw_default", text = "Whatever's biting off the end of the pier, and a good few of them, enough for my supper and the neighbours'. My hands shake a bit in the cold now, and a fish that feels a shaking line won't stay on it." },
      },
      choices = {
        { text = "You feed your neighbours, too?", next = "job_neighbours" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_neighbours = {
      lines = {
        { id = "jn_default", text = "The widow two doors down and her three boys, and the old sailor upstairs who can't manage the stairs anymore. They've never asked, mind, but they've never said no to a fish either." },
      },
      choices = {
        { text = "Feeding others before yourself is a good man's work.", next = "BACK", reply = "It's not much, only fish, but a good man's work it is. Thank you for saying so.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "They should look after themselves. You're getting old.", next = "BACK", reply = "Old I may be, but a full net's heavy and I've only one stomach. They'll have their supper.", fx = { align = { light = -1 } } },
        { text = "I'll help, then.", next = "BUSINESS", when = { questBefore = TODO_QUEST("Fishin' Time") } },
      },
    },

    xfisher = {
      lines = {
        { id = "xf_default", text = "Then you know what I mean about the float. Tell me where the best water you've cast in is, and don't say the canals, because I'll know you're lying." },
      },
      choices = {
        { text = "The lakes of Elwynn, just at dawn.", next = "xfisher_spot" },
        { text = "Off the coast of Westfall, past the lighthouse.", next = "xfisher_spot" },
        { text = "Somewhere I'm keeping to myself.", next = "xfisher_spot", fx = { trait = { discreet = 1 } } },
      },
    },
    xfisher_spot = {
      lines = {
        { id = "xfs_default", text = "Good answer, whatever it was; a fisher who keeps a spot or two quiet is a fisher I can trust. Arnold Leland would tell the whole city his best water for a silver, and now there's nothing left in it but boot leather." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xrefugee = {
      lines = {
        { id = "xr_default", text = "Did you, now? Then it's turned round, hasn't it, because your lot fed mine once, and now we're the ones with the bread. Sit down, and I'll tell you which bakers in the Trade District give honest weight, since it's the least I owe Lordaeron." },
      },
      choices = {
        { text = "Thank you, Gilbert. That's kind.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xcanals = {
      lines = {
        { id = "xc_default", text = "In the canals? Of course you didn't, because there's nothing in there but old boots and cutpurses. I'll teach you, if you like, though I'll keep one eye on my coin purse while I'm doing it." },
      },
      choices = {
        { text = "Wise of you. Old habits.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I've put all that behind me.", next = "BACK" },
      },
    },

    xnelf = {
      lines = {
        { id = "xn_default", text = "I knew it! I told the dockmaster and he laughed at me for a week. I'd dearly love to see it done, though I'd want to know where I'm meant to stand so I don't end up on the end of one." },
      },
      choices = {
        { text = "Behind me, and very still.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdwarf = {
      lines = {
        { id = "xd_default", text = "So I've heard: a whole lake up in the mountains and a great dam holding it in, and fish that fight like dwarves. If I were twenty years younger I'd walk there just to see whether you're telling the truth or just telling it loudly." },
      },
      choices = {
        { text = "Both. That's how dwarves tell everything.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    partner = {
      lines = {
        { id = "pa_default", text = "Better, thanks to you, and I've had my supper off it every night this week, and so has the widow two doors down. You've a share in every fish I land now, by my reckoning, which comes to about half a mackerel." },
      },
      choices = {
        { text = "Keep my half. You've earned it.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born a fisher, fled a fisher, came back a fisher. I've never wanted to be anything else." } },
    advice = { { id = "tp_ad", text = "Stop staring at the float. It'll go under when it's ready." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about fish, I know about fish." } },
  },
}

---------------------------------------------------------------------------
-- Idrieth Mossgrove: keeps the kaldorei pier and the boat to Auberdine.
---------------------------------------------------------------------------
P:NPC {
  key = "idrieth", id = TODO_NPC("Idrieth Mossgrove"), name = "Idrieth Mossgrove",
  bible = "bibles/stormwind_forever.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "patient", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "He studies the humans as closely as they study him.",
    third = "{name} met Idrieth Mossgrove, the night elf who keeps the pier for the boat to Auberdine.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah, friend. The boat to Auberdine is always glad of you, and so am I." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return. The boat goes where it goes, and I would rather you were on it." },
    { id = "g_default", text = "If you seek travel to Auberdine in Darkshore, you have come to the right place." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The boat is due soon, if you mean to travel." },
    { id = "g_nelf", when = { race = "NightElf" }, text = "Ishnu-alah. It is good to see a kaldorei face among so many strangers." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "You will be homesick for the trees soon, if you are not already. The boat goes home whenever you need it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID", ["not"] = { race = "NightElf" } },
      text = "A druid who is not kaldorei? The Cenarion Circle would want to hear of you, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "This dock connects Stormwind to the lands of the kaldorei by way of Auberdine, the port town of Darkshore. Our people welcome any of the Alliance who wish to trade, travel or aid others in our lands." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "You know the way home as well as I do. Auberdine first, then the boat to Rut'theran and the great tree." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I will trade you an answer for something of your human ways." },
        { id = "h_again2", text = "Ask, if there is more; your kind are always in such haste, and I find I do not mind it." },
      },
      choices = {
        { text = "What's in Auberdine?", next = "auberdine" },
        { text = "What do you make of Stormwind?", next = "city" },
        { text = "Why would humans go to your lands?", next = "why" },
        { text = "When does the boat leave?", next = "boat" },
        { text = "Why were you chosen to keep this dock?", next = "self" },
        { text = "I stood watch at Auberdine before I came here.", next = "xwatch", when = { origin = "nightelf_auberdine_watch" } },
        { text = "I've run cargo through Auberdine. Not all of it declared.", next = "xsmuggle", when = { origin = "nightelf_auberdine_smuggler" } },
        { text = "Do you miss home, among all this stone?", next = "xhome", when = { race = "NightElf" } },
        { text = "Would a human be welcome in Darnassus?", next = "xhuman", when = { race = "Human" } },
        { text = "Is there work for a dwarf in Darkshore?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Is there good hunting in Darkshore?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Would Elune's priestesses speak with a priest of the Light?", next = "xpriest", when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "Thank you, Idrieth.", next = "END" },
      },
    },

    auberdine = {
      lines = {
        { id = "au_default", text = "A small town on the coast of Darkshore, with a moonwell and a sentinels' watch and the sea always at its door. From there, a second boat crosses to Teldrassil, if you would see Darnassus." },
      },
      choices = {
        { text = "Is Darkshore safe?", next = "auberdine_safe" },
        { text = "Who should I look for in Auberdine?", next = "auberdine_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    auberdine_safe = {
      lines = {
        { id = "as_default", text = "Safer than Elwynn's roads, perhaps, but not safe. There are furbolgs gone wild in the hills, and strange things washing up from the sea, and the Sentinels have more work than they can do. Hands willing to help are welcome." },
      },
      choices = {
        { text = "Why have the furbolgs gone wild?", next = "furbolg" },
        { text = "What washes up from the sea?", next = "auberdine_sea" },
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "ci_default", text = "Loud, and stone, and very young. Your people build quickly and forget quickly, I think, but they are brave, and generous to strangers, and that matters more than walls." },
      },
      choices = {
        { text = "What has surprised you most about humans?", next = "city_humans" },
        { text = "Humans can learn much from the kaldorei.", next = "BACK", reply = "Perhaps, and the kaldorei could learn something of courage from humans. We are both still learning.", fx = { align = { order = -1 } } },
        { text = "Stormwind's walls have earned their place.", next = "BACK", reply = "They have, and I have seen them hold where forests could not. Earned, yes, though young.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "To trade, to learn, to help, as the Alliance helps us. Our lands are old and full of troubles, and we have learned that we cannot face them all alone, though some of my people are slow to say so." },
      },
      choices = {
        { text = "Some of your people don't want us there, then.", next = "why_slow" },
        { text = "Something else.", next = "BACK" },
      },
    },

    boat = {
      lines = {
        { id = "bo_default", text = "It arrives often, and does not wait long, so stay near the end of the pier. If you miss it, there is always the next one, and the harbor is a pleasant place to wait." },
      },
      choices = {
        { text = "Is the crossing a rough one?", next = "boat_crossing" },
        { text = "Something else.", next = "BACK" },
      },
    },

    auberdine_who = {
      lines = {
        { id = "aw_default", text = "Gershala Nightwhisper, who studies the corruption, and the Sentinels at the watch, and Caylais Moonfeather, who keeps the hippogryphs if you would fly south to Ashenvale. Gershala's brother Argos waits here in the city's Park, I am told, so carry his greetings if you go." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    furbolg = {
      lines = {
        { id = "fu_default", text = "Something sickens them, the Blackwood tribe most of all, and a people who once traded honey and furs with us now fall on anyone who walks the road. It grieves the druids, who remember the furbolgs as friends.", fx = { learn = { "furbolgs" } } },
      },
      choices = {
        { text = "They can still be saved. Someone should find the cause.", next = "BACK", reply = "That is my hope as well. My kin in Darkshore search for it, and I pray they find it soon.", fx = { align = { light = 1 } } },
        { text = "If they attack travellers, they must be put down.", next = "BACK", reply = "It may come to that, and the Sentinels will not hesitate. But I would grieve each one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    auberdine_sea = {
      lines = {
        { id = "se_default", text = "Great beasts of the deep, dead on the sand with no wound anyone can find, and murlocs along every beach, and now and then a piece of something carved that is older than Auberdine. The sea remembers more than we would like." },
      },
      choices = {
        { text = "Older than Auberdine? From before the Sundering?", next = "sundering" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sundering = {
      lines = {
        { id = "su_default", text = "From when the Well of Eternity tore itself apart ten thousand years ago and took our old capital down with it. Some of my people speak of it as a punishment for the Highborne's pride, some as a warning, and a few, still, as a wound.", fx = { learn = { "highborne" } } },
      },
      choices = {
        { text = "Power like that should never be trusted again.", next = "BACK", reply = "Many of my people would agree with you, and they built Teldrassil on that belief. I am less sure.", fx = { align = { order = 1 } } },
        { text = "Power isn't evil. Only those who misused it.", next = "BACK", reply = "That is a dangerous truth, and a true one. I hope you hold it carefully.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city_humans = {
      lines = {
        { id = "chu_default", text = "That they do so much in so short a life, and that they laugh at funerals. I attended one here, by invitation, and the widow told a story about her husband that made the whole room laugh, and I have thought about it ever since." },
      },
      choices = {
        { text = "Laughing is how we bear it.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why_slow = {
      lines = {
        { id = "ws_default", text = "Some of our elders believe the kaldorei should keep to our forests and trust no one who builds in stone, after what the Highborne built. They are not wrong to be wary, but I think they mistake wariness for wisdom." },
      },
      choices = {
        { text = "Your elders are right to be careful with outsiders.", next = "BACK", reply = "They are not wrong, but they are not wholly right either. Careful is not the same as closed.", fx = { align = { order = 1 } } },
        { text = "Hiding in the forest won't keep the world out.", next = "BACK", reply = "No, it will not, and I am here on this pier because I believe the same. Thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    boat_crossing = {
      lines = {
        { id = "bc_default", text = "Long and grey, and rough at the turning of the seasons, for the crew keep well wide of the Maelstrom, where the sea still churns from the Sundering. Bring something warm, and do not lean over the rail at night to look for lights in the water." },
      },
      choices = {
        { text = "Lights in the water?", next = "sundering" },
        { text = "Something else.", next = "BACK" },
      },
    },

    self = {
      lines = {
        { id = "sf_default", text = "I asked for it, which surprised my family. I wanted to understand the people who stood beside us at Mount Hyjal against the Legion, and Stormwind seemed the place to begin." },
      },
      choices = {
        { text = "Have you found what you were looking for?", next = "self_found" },
        { text = "Something else.", next = "BACK" },
      },
    },
    self_found = {
      lines = {
        { id = "sff_default", text = "Some of it. Humans are brave the way a spark is bright, briefly and all at once, and whatever they touch catches; I have not yet decided whether that is a gift or a danger." },
      },
      choices = {
        { text = "A gift. A spark is how every fire starts.", next = "BACK", reply = "That is a kind way to see it, and I hope you are right. My elders would say the same of a forest fire.", fx = { align = { light = 1 } } },
        { text = "A danger. Sparks burn down forests.", next = "BACK", reply = "They do, and I have seen it. But a forest also needs fire, now and then, to grow again.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xwatch = {
      lines = {
        { id = "xw_default", text = "Then you know its harbor better than I do, and you may correct me if I describe it wrongly to the humans. Tell me, does the old sentinel on the north tower still sing to the moon each night?" },
      },
      choices = {
        { text = "She does, and still badly.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Not anymore. The watch has changed.", next = "BACK" },
      },
    },

    xsmuggle = {
      lines = {
        { id = "xsm_default", text = "I will pretend I did not hear that, since I keep a dock and not a ledger. But the Sentinels have long memories, so if you return, come by the front of the pier, as everyone else does." },
      },
      choices = {
        { text = "I'll keep it honest from now on.", next = "BACK", reply = "Then the front of the boat will welcome you. Safe sailing, traveller.", fx = { align = { honor = 1 } } },
        { text = "What the Sentinels don't see harms no one.", next = "BACK", reply = "The Sentinels see more than you think. I would come by the front, if I were you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhome = {
      lines = {
        { id = "xh_default", text = "Every evening, when the moon rises over stone instead of leaves. But I have learned to find her face in the harbor water, between the ships, and most nights that is enough.", fx = { learn = { "elune" } } },
      },
      choices = {
        { text = "Elune shines on stone as well as leaves.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhuman = {
      lines = {
        { id = "xhu_default", text = "Welcome, yes, though you may find it quiet, and the Sentinels will watch you closely until they decide you mean no harm to the trees. Speak softly, cut nothing that grows, and you will be well received." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xdwarf = {
      lines = {
        { id = "xd_default", text = "Your Explorers' League already digs among our old ruins along the coast, and argues with the Sentinels about what may be carried off. If you go, perhaps you can remind them that some things are better left where they were buried." },
      },
      choices = {
        { text = "Knowledge belongs to whoever digs it up.", next = "BACK", reply = "The Explorers' League would agree with you, and the Sentinels would not. I am only a dockkeeper.", fx = { align = { order = -1 } } },
        { text = "It's your land. The kaldorei should decide what leaves it.", next = "BACK", reply = "Thank you. That is what the Sentinels say, and it is good to hear it from outside our forests.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhunter = {
      lines = {
        { id = "xhn_default", text = "Moonstalkers in the hills and thistle bears in the forest, though many of the bears are sick and savage now. Take only what you need, {class}, because the forest is hurting enough already." },
      },
      choices = {
        { text = "I always do.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpriest = {
      lines = {
        { id = "xpr_default", text = "The Sisterhood of Elune welcomes any who honour the Mother Moon, though I think they would find your Light a curious thing. Ask at the Temple of the Moon in Darnassus, and go with questions rather than answers.", fx = { learn = { "sisterhood_of_elune" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Ashenvale's shadow, sent here to keep this dock, and still learning how humans think." } },
    advice = { { id = "tp_ad", text = "Stand near the end of the pier. The boat waits for no one." } },
    _none = { { id = "tp_none", text = "I cannot say. Ask in the city; humans always have an answer, even when they do not know one." } },
  },
}

---------------------------------------------------------------------------
-- Roy Lewells: a reader in the Park.
---------------------------------------------------------------------------
P:NPC {
  key = "roy_lewells", id = TODO_NPC("Roy Lewells"), name = "Roy Lewells",
  bible = "bibles/stormwind_forever.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "curious", "kind" },
  notices = { "class", "race" },
  impression = {
    first = "He keeps losing his place on the page while he talks.",
    third = "{name} met Roy Lewells, a reader who spends his days among the trees in Stormwind's Park.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Sorry, I was miles away. Somewhere around chapter twelve, actually." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've finished that one, and started two more, which my wife says is a sickness." },
    { id = "g_active", when = { questActive = TODO_QUEST("Reading Room") }, text = "Any luck with that errand? No hurry, I've plenty to read while I wait." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! I've always envied your lot your libraries. Is it true the Kirin Tor kept books that read themselves?" },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Your people keep the trees in this Park. I come here to read because it's the only place in the city that smells of anything but smoke." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Roy Lewells. I read, mostly, and the Park's the best place for it: shade, and quiet, and nobody shouting about cheese prices. The night elves look after the trees, and I look after my books." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Reading Room") },
          text = "Actually, you might be just the person. I've a little errand that I can't manage on my own, if you've a moment to hear it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Reading Room") },
          text = "Still at it? Good, good. I'd go myself, but I'm no use away from a bench." },
        { id = "h_shelf", tags = { "news" }, when = { questActive = TODO_QUEST("Shelf Picked") },
          text = "Have you news for me? I've been fretting about it all week, and I've read the same page nine times." },
        { id = "h_done", when = { questDone = TODO_QUEST("Shelf Picked") },
          text = "Thanks to you, things are back where they belong and I can read in peace again. I can't tell you how much that means to a man like me." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've lost my place anyway." },
        { id = "h_again2", text = "Go on. I'm in no hurry to get back to the dull bit." },
      },
      choices = {
        { text = "What are you reading?", next = "reading" },
        { text = "Why read in the Park?", next = "park" },
        { text = "Where do you get your books?", next = "books" },
        { text = "What's this errand?", next = "errand", when = { questBefore = TODO_QUEST("Reading Room") } },
        { text = "About your errand.", next = "BUSINESS", when = { any = { { questBefore = TODO_QUEST("Reading Room") }, { questActive = TODO_QUEST("Shelf Picked") } } } },
        { text = "Your wife sounds like a patient woman.", next = "wife" },
        { text = "What do you do, when you're not reading?", next = "work" },
        { text = "The Mage Quarter has libraries. Have you tried there?", next = "xmage", when = { any = { { class = "MAGE" }, { origin = "human_mage_quarter" } } } },
        { text = "I learned my letters at Northshire Abbey.", next = "xabbey", when = { origin = "human_abbey_novice" } },
        { text = "Gnomeregan had banned books. I read a few.", next = "xgnome", when = { origin = "gnome_forbidden_texts" } },
        { text = "My family keeps a library. A large one.", next = "xnoble", when = { origin = "human_minor_noble" } },
        { text = "I read some unusual books myself.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is the reading room what you hoped?", next = "after", when = { questDone = TODO_QUEST("Shelf Picked") } },
        { text = "Enjoy your book, Roy.", next = "END" },
      },
    },

    reading = {
      lines = {
        { id = "rd_default", text = "A history of the Second War, written by a man who was there and clearly hated every minute. He's terribly rude about the dwarves and terribly kind about his horse." },
        { id = "rd_dwarf", when = { race = "Dwarf" }, text = "A history of the Second War, and, I'm sorry to say, the author's very rude about your people. He's lovely about his horse, though, if that's any comfort." },
      },
      choices = {
        { text = "History should be told honestly, even the ugly parts.", next = "reading_hist", fx = { align = { honor = 1 } } },
        { text = "Some things are better left out of books.", next = "reading_hist", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    reading_hist = {
      lines = {
        { id = "rh_default", text = "That's what I keep saying to my wife. Everybody remembers the war differently, and if you only read one book about it, you'll only know one man's war." },
      },
      choices = {
        { text = "What else do you read?", next = "reading_else" },
        { text = "Who wrote this history of yours?", next = "reading_author" },
        { text = "He's rude about dwarves? What does he say?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    reading_else = {
      lines = {
        { id = "re_default", text = "Anything with words in it! Histories, travels, a dreadful romance about a knight and a dragon. I'll read the labels on the jars at Pestle's shop if I've nothing else." },
      },
      choices = {
        { text = "A knight and a dragon? Go on.", next = "romance" },
        { text = "Something else.", next = "BACK" },
      },
    },

    park = {
      lines = {
        { id = "pk_default", text = "Because it's the only quiet place in the city. The Trade District's all hawkers and the Cathedral's all bells, but here there's only birds, and the elves, who never say anything unless they mean it." },
      },
      choices = {
        { text = "Do you talk with the elves?", next = "park_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    park_elves = {
      lines = {
        { id = "pe_default", text = "Now and then. The druid who teaches here, Sheldras, once told me a story about the trees in his homeland that took him most of an afternoon. I've never been happier." },
      },
      choices = {
        { text = "What was the story about?", next = "park_story" },
        { text = "Something else.", next = "BACK" },
      },
    },

    books = {
      lines = {
        { id = "bk_default", text = "The bookshops, when I can afford them, and borrowed from friends when I can't. There's the Royal Library in the Keep, of course, but they don't let the likes of me take books home." },
      },
      choices = {
        { text = "Books should be free for everyone.", next = "books_free", fx = { align = { order = -1 } } },
        { text = "A library has to protect its books.", next = "books_free", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    books_free = {
      lines = {
        { id = "bf_default", text = "Well, I suppose there's something to be said for both. Old Milton Sheaf up at the Royal Library would rather die than lend a book, but he'd also die before he let one come to harm." },
      },
      choices = {
        { text = "You've met Milton Sheaf, then?", next = "milton" },
        { text = "Something else.", next = "BACK" },
      },
    },

    errand = {
      lines = {
        { id = "er_default", text = "It's about having somewhere proper to read, you see. I've thought about it for a long time, and I can't do it alone, but you look like someone who gets things done." },
      },
      choices = {
        { text = "I'll help.", next = "BUSINESS" },
        { text = "Why can't you manage it alone?", next = "errand_why" },
        { text = "Something else.", next = "BACK" },
      },
    },

    errand_why = {
      lines = {
        { id = "ew_default", text = "Because I'm a clerk, and anything that needs doing away from a desk frightens the life out of me. I tried once, and walked round the Trade District three times, and came home without having asked anyone anything." },
      },
      choices = {
        { text = "Then I'll do the asking.", next = "BUSINESS", when = { questBefore = TODO_QUEST("Reading Room") } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wife = {
      lines = {
        { id = "wf_default", text = "The most patient woman in Stormwind, and she reads the last page of every book first, which I have never quite forgiven. She says I'd have married a book if it could cook, and I tell her I married her because she reads aloud better than anyone alive." },
      },
      choices = {
        { text = "She reads the ending first? That's a crime.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Reading the ending first spares a lot of worry.", next = "BACK", fx = { trait = { practical = 1 } } },
      },
    },

    work = {
      lines = {
        { id = "wk_default", text = "I'm a clerk for a grain merchant in the Trade District, copying out bills of sale, which is reading of a sort, though nobody's ever wept over a bill of sale. Well, the merchant has, once or twice, around tax time." },
      },
      choices = {
        { text = "Do you like the work?", next = "work_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_like = {
      lines = {
        { id = "wl_default", text = "I like that it finishes at four bells and leaves me the rest of the light. The merchant says I've a fine hand and no ambition, and he's right on both counts, and I sleep very well." },
      },
      choices = {
        { text = "Honest work is worth doing, even dull work.", next = "BACK", reply = "It is, and it pays for candles, which is more than ambition ever did for me.", fx = { align = { honor = 1 } } },
        { text = "Life's too short to copy other men's ledgers.", next = "BACK", reply = "It is, but somebody has to copy them, and I'd rather it was someone who reads in the evening.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    reading_author = {
      lines = {
        { id = "ra_default", text = "A captain from Lordaeron who rode with the Alliance through Khaz Modan, and he signs himself only as a soldier of King Terenas. He spends a whole chapter complaining about dwarven ale and another praising his horse, Buttercup.", fx = { learn = { "second_war" } } },
      },
      choices = {
        { text = "An honest man signs his own name.", next = "BACK", reply = "Perhaps, but he'd have been hanged for half of it. I think he chose his own way of being honest.", fx = { align = { honor = 1 } } },
        { text = "He was wise. Truth travels safer without a name.", next = "BACK", reply = "That's how I read it too. A name is a heavy thing to carry into a book like that.", fx = { align = { honor = -1 } } },
        { text = "Buttercup?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    xdwarf = {
      lines = {
        { id = "xd_default", text = "That dwarves fight like badgers and drink like drains, and that they saved his life in the passes of Khaz Modan, which he admits through gritted teeth on page three hundred. I think he liked you all very much and simply couldn't bear to say so." },
      },
      choices = {
        { text = "That sounds about right, aye.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    romance = {
      lines = {
        { id = "ro_default", text = "Sir Somebody rides out to slay a red dragon, and the dragon turns out to be the only sensible character in the book, and by chapter twenty I didn't know who to root for. Don't tell my wife I enjoyed it; she thinks I only read improving books." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    park_story = {
      lines = {
        { id = "ps_default", text = "A tree in Ashenvale that grew round a sword someone had left leaning against it, until the blade was in the heart of the trunk and the tree stood taller than the Cathedral. He said the tree didn't mind, which I think was the point, though I'm still not entirely sure what the point was." },
      },
      choices = {
        { text = "The point is that time heals what war leaves behind.", next = "BACK", reply = "That's a lovely reading, and I'll tell my wife you said so. She thinks it's about patience.", fx = { align = { light = 1 } } },
        { text = "The point is the sword's still in there.", next = "BACK", reply = "Yes, that's the part that keeps me up at night. Time grows round things, but it doesn't take them out.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    milton = {
      lines = {
        { id = "mi_default", text = "The Royal Librarian, in the Keep, a man with a voice like a door closing. I once asked whether I might read there on my half-days, and he looked at my boots for so long that I went home and cleaned them." },
      },
      choices = {
        { text = "Did he let you in, after?", next = "milton_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    milton_after = {
      lines = {
        { id = "ma_default", text = "Twice, under supervision, and he stood behind my chair the whole time, breathing. It was the best afternoon of my life and the most frightening, both at once." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xmage = {
      lines = {
        { id = "xm_default", text = "I have, and a very polite apprentice told me the books there bite, and I've never been sure if he was joking. Do they, {class}? You can tell me; I'm braver than I look, though not by much." },
      },
      choices = {
        { text = "Some of them do. Really.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "No. He was teasing you.", next = "BACK", fx = { trait = { honest = 1 } } },
      },
    },

    xabbey = {
      lines = {
        { id = "xa_default", text = "Did you? The brothers there copy the most beautiful books, all gold leaf in the margins. I walked out to Northshire once just to see the scriptorium, and Brother Neals gave me a cup of something and the worst directions home I've ever had." },
      },
      choices = {
        { text = "That sounds like Brother Neals.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xgnome = {
      lines = {
        { id = "xg_default", text = "Banned? Oh, I'd have given my right arm to see Gnomeregan's libraries before what happened there. What were they banned for, if you don't mind my asking, and were they any good?" },
      },
      choices = {
        { text = "Some knowledge is dangerous. Banning them was right.", next = "BACK", reply = "Perhaps it was, but I'd still give my right arm to know what was in them. The wanting doesn't go away.", fx = { align = { order = 1 } } },
        { text = "Nothing should be banned. Readers can judge for themselves.", next = "BACK", reply = "That's my view exactly, though my wife thinks I'd read anything if it had a binding.", fx = { align = { order = -1 } } },
        { text = "They were very good. That was the trouble.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    xnoble = {
      lines = {
        { id = "xn_default", text = "Has it? I don't suppose... no, I shouldn't ask. Well, if your family ever wanted someone to dust the shelves for nothing but the chance to read them, I'd come with my own rag." },
      },
      choices = {
        { text = "I'll ask them. Books should be read.", next = "BACK", reply = "Would you? Oh, you'd make a poor copyist very happy. I'll bring my own candles.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A family's library isn't for strangers, I'm afraid.", next = "BACK", reply = "No, of course not, I quite understand. I only thought I'd ask, since asking costs nothing.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xlock = {
      lines = {
        { id = "xl_default", text = "Do you? I've an idea what sort, and I'll not ask, because I'd want to read them and then I'd regret it. My wife says curiosity is a door, and I should mind which side of it I'm standing on." },
      },
      choices = {
        { text = "There are no wicked books. Only timid readers.", next = "BACK", reply = "Oh, I like that, I'll write it in my margins. My wife won't like it, though.", fx = { align = { light = -1 } } },
        { text = "Your wife's right. Some books should stay shut.", next = "BACK", reply = "She usually is, and I'll tell her you said so. She'll be insufferable for days.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "Better than I hoped, and nobody's moved a thing since. I sit there an hour after work and read until the lamps want lighting, and I'm a happier man than I was." },
      },
      choices = {
        { text = "Then it was worth it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stormwind born, a clerk by trade, and a reader by every other hour of the day." } },
    advice = { { id = "tp_ad", text = "Read more than one book about anything that matters." } },
    _none = { { id = "tp_none", text = "I haven't read about that, I'm afraid. Yet." } },
  },
}

---------------------------------------------------------------------------
-- Aendaril Brookshot: a kaldorei druid in the Valley of Heroes.
---------------------------------------------------------------------------
P:NPC {
  key = "aendaril", id = TODO_NPC("Aendaril Brookshot"), name = "Aendaril Brookshot",
  bible = "bibles/stormwind_forever.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "patient", "curious" },
  notices = { "race", "class" },
  impression = {
    first = "The city's noise passes around the druid like water around a stone.",
    third = "{name} met Aendaril Brookshot, a night elf druid in the Valley of Heroes.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Elune's light on you again, friend. The statues have kept their watch, and I have kept a place for you beside them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return. The Valley is wide, and I'd ask you to find another corner of it." },
    { id = "g_default", text = "Elune's light on you, stranger. Stand a moment, if you like; the statues are better company than they look." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The statues have not moved, if you were wondering." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A child of the Circle, here among the stones. We are a long way from the moonwells, you and I." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You feel the city too, don't you? All this stone, and the earth still breathing beneath it." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Your people make statues of their heroes. Mine plant trees, and let the trees remember." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Aendaril Brookshot, of the Cenarion Circle, far from home. I came to see how humans remember the people who died for them, and this valley is where they do it." },
      },
      again = {
        { id = "h_again", text = "What else would you know? The trees in this city are poor company." },
        { id = "h_again2", text = "Ask, if you wish. The city rushes past, but I am rooted here a while yet." },
      },
      choices = {
        { text = "Who are these statues?", next = "statues" },
        { text = "Why does a druid care about statues?", next = "why" },
        { text = "What do you think of Stormwind?", next = "city" },
        { text = "What is the Cenarion Circle?", next = "circle" },
        { text = "We make statues because we have so little time.", next = "xhuman", when = { race = "Human" } },
        { text = "Kurdran Wildhammer was lord of my clan.", next = "xwildhammer", when = { origin = "dwarf_wildhammer_kin" } },
        { text = "I'm a druid too. Which forms do you favour?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I was an initiate in Shadowglen, under Mardant.", next = "xinitiate", when = { origin = "nightelf_druid_initiate" } },
        { text = "My kin still sleep in the Dream.", next = "xdreamer", when = { origin = "nightelf_dreamer_kin" } },
        { text = "Turalyon was a paladin. So am I.", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "Khadgar was a mage. So am I.", next = "xmage", when = { class = "MAGE" } },
        { text = "Farewell, Aendaril.", next = "END" },
      },
    },

    statues = {
      lines = {
        { id = "st_default", text = "Heroes who went through the Dark Portal and never came back: Turalyon, Khadgar, Danath, Kurdran, and Alleria Windrunner, an elf of Quel'Thalas. The plaques call them presumed dead.", fx = { learn = { "cenarion_circle" } } },
      },
      choices = {
        { text = "Do you think they're dead?", next = "statues_dead" },
        { text = "Tell me about Turalyon.", next = "st_turalyon" },
        { text = "Tell me about Khadgar.", next = "st_khadgar" },
        { text = "And the dwarf, and the other man?", next = "st_others" },
        { text = "An elf among them? Alleria?", next = "st_alleria" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statues_dead = {
      lines = {
        { id = "sd_default", text = "I do not know. My teachers slept for centuries in the Emerald Dream while the world went on without them, so I have learned not to call anyone dead until I see the grave." },
      },
      choices = {
        { text = "Your teachers slept in the Dream?", next = "dream" },
        { text = "Hope keeps the living going. Keep hoping.", next = "BACK", reply = "I will, though it is hard, even for one of my people. Thank you for the kindness.", fx = { align = { light = 1 } } },
        { text = "Better to mourn them and move on.", next = "BACK", reply = "That is the human way, and perhaps a wise one. I am not yet ready to do it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because memory is a kind of growth. The kaldorei remember everything, and we are slow to change because of it. Humans forget quickly, and so they build, and I want to understand which of us is wiser." },
      },
      choices = {
        { text = "Which do you think is wiser?", next = "why_wiser" },
        { text = "Remembering everything keeps you trapped.", next = "BACK", reply = "Sometimes, yes, and my people know it better than anyone. Still, I would not forget them.", fx = { align = { order = -1 } } },
        { text = "Remembering is how a people avoids making the same mistakes twice.", next = "BACK", reply = "That is my hope, and I am glad to hear it from a human. Your kind forget so quickly.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "ci_default", text = "Loud and young and very busy, like a sapling that has not yet learned it will be a tree. There is a Park with trees in it, which is kind, but the earth under the stones is restless." },
      },
      choices = {
        { text = "Restless? How so?", next = "city_earth" },
        { text = "Do you spend much time in the Park?", next = "city_park" },
        { text = "Something else.", next = "BACK" },
      },
    },

    st_turalyon = {
      lines = {
        { id = "stt_default", text = "A paladin of Lordaeron, who led the Alliance after Lothar fell, and then led it through the Dark Portal to end the orcs' war at its root. I have noticed that the humans who pass bow their heads at this statue more often than at the others.", fx = { learn = { "dark_portal" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    st_khadgar = {
      lines = {
        { id = "stk_default", text = "The young mage who served Medivh, the Guardian, and helped bring him down when the Guardian's mind was no longer his own. The stories call him young, yet the carver has made him old, and no one here has been able to tell me why.", fx = { learn = { "khadgar" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    st_others = {
      lines = {
        { id = "sto_default", text = "Kurdran Wildhammer, who flew a gryphon into the orcs' own skies, and Danath Trollbane of Stromgarde, who led that kingdom's soldiers through the Portal. Two peoples who rarely agree on anything, side by side in stone, which may be the wisest thing in this valley.", fx = { learn = { "wildhammer" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    st_alleria = {
      lines = {
        { id = "sta_default", text = "A ranger of Quel'Thalas, a high elf, and kin to my people ten thousand years removed. The kaldorei do not speak much of the quel'dorei, for we parted badly long ago, but I cannot look at her stone face without feeling something I have no name for.", fx = { learn = { "highborne" } } },
      },
      choices = {
        { text = "Kin is kin. The old quarrel should be let go.", next = "BACK", reply = "Perhaps it should be, and some of us would welcome it. But ten thousand years is long to forgive.", fx = { align = { order = -1 } } },
        { text = "Your people parted from them for good reason.", next = "BACK", reply = "There was, and we have not forgotten it. Still, I pray at Alleria's statue, whatever my elders say.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dream = {
      lines = {
        { id = "dr_default", text = "The druids slept for centuries in the Emerald Dream, walking in the world as it might have been, while their bodies lay in the barrow dens. Malfurion sleeps there still, and the Circle keeps his body and waits.", fx = { learn = { "emerald_dream", "malfurion" } } },
      },
      choices = {
        { text = "Will he wake?", next = "dream_wake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream_wake = {
      lines = {
        { id = "dw_default", text = "When the world needs him most, they say in Darnassus. I only hope the world does not need him too badly before he hears it calling." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    why_wiser = {
      lines = {
        { id = "ww_default", text = "I have not decided, and so I am still standing here. The kaldorei remembered so well that we let ten thousand years pass without changing, and humans forget so fast that they build new walls where their grandfathers burned." },
      },
      choices = {
        { text = "Change is how a people survives.", next = "BACK", reply = "It is how yours survives, and quickly. I am still learning whether it is how mine should.", fx = { align = { order = -1 } } },
        { text = "Tradition is how a people stays itself.", next = "BACK", reply = "It is, and I have seen what it costs when the world changes faster than we do.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city_earth = {
      lines = {
        { id = "ce_default", text = "It is old ground, burned once and built over quickly, and it has not forgotten the fire. A druid feels such things the way you feel weather in a healed bone: it is not a danger, only an ache." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    city_park = {
      lines = {
        { id = "cp_default", text = "Often, and Sheldras Moontree, who teaches the druids there, and I sometimes sit together and say nothing for an hour. The humans who pass think we are meditating, and we let them think so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    circle = {
      lines = {
        { id = "cc_default", text = "The druids who follow Malfurion Stormrage and keep the balance of the wild, from Moonglade to the farthest groves. Most of us are kaldorei, though some of the tauren walk with us too, which surprises those who think the Circle takes sides in your wars.", fx = { learn = { "cenarion_circle" } } },
      },
      choices = {
        { text = "Tauren? The Horde's tauren?", next = "circle_tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_tauren = {
      lines = {
        { id = "ct_default", text = "Yes, the Horde's tauren, and some of them are wiser than I am. The wild wears no tabard, and the Circle tries not to wear one either, though that is harder to keep to than it sounds." },
      },
      choices = {
        { text = "The Alliance must come first, even for druids.", next = "BACK", reply = "Perhaps, for you. But the Circle teaches otherwise, and I cannot unlearn it in Stormwind.", fx = { align = { order = 1 } } },
        { text = "The wild matters more than any banner.", next = "BACK", reply = "Then you understand the Circle better than many of my people. The wild wears no tabard.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhuman = {
      lines = {
        { id = "xh_default", text = "Perhaps that is it. A tree takes a hundred years to remember anything, and you have not got a hundred years, so you carve your memory into stone and hope it holds." },
      },
      choices = {
        { text = "Stone or tree, remembering them is what matters.", next = "BACK", reply = "That is the truest thing anyone has said to me in this city. Thank you.", fx = { align = { light = 1 } } },
        { text = "Statues are for the living. The dead don't care.", next = "BACK", reply = "Perhaps not, but the living need something to stand before. I think that is reason enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xwildhammer = {
      lines = {
        { id = "xwh_default", text = "Then you have a better claim to grieve here than I do. Tell me, do the Wildhammer carve statues of their dead, or do they remember them some other way?" },
      },
      choices = {
        { text = "We sing of them over ale in Aerie Peak.", next = "BACK", fx = { affinity = 1 } },
        { text = "We don't call him dead. Not yet.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },

    xdruid = {
      lines = {
        { id = "xdr_default", text = "The bear, when I must, and the cat when I wish to be left alone, which in Stormwind is often. The guards do not know what to make of a nightsaber walking through the Trade District, so I have stopped doing it." },
      },
      choices = {
        { text = "Let them stare. We are what we are.", next = "BACK", reply = "Yes, and they will grow used to us, slowly. A guard's stare is a small price for being ourselves.", fx = { align = { order = -1 } } },
        { text = "Better to respect their customs while we're here.", next = "BACK", reply = "That is wise, and kind, and I will try to remember it. The nightsaber may not.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xinitiate = {
      lines = {
        { id = "xi_default", text = "Mardant Strongoak is a patient teacher, and you must have tried that patience, if you were anything like I was. I learned under him too, long before your time, and I still hear his voice whenever I lose my temper." },
      },
      choices = {
        { text = "He still says the same things, I expect.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdreamer = {
      lines = {
        { id = "xdm_default", text = "Then you know the waiting better than these humans know their statues. Do you still visit the barrow dens, or have you stopped?" },
      },
      choices = {
        { text = "I still visit, when I'm home.", next = "BACK", fx = { affinity = 1 } },
        { text = "I've stopped. It hurts too much.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    xpaladin = {
      lines = {
        { id = "xpa_default", text = "Then perhaps you can tell me what he would make of all this stone. Would he be pleased to see his face here, or embarrassed, the way the humble ones always seem to be?" },
      },
      choices = {
        { text = "Embarrassed. A true paladin seeks no glory.", next = "BACK", reply = "I think so too, and I think he would be glad of it. The humble ones are easiest to love.", fx = { align = { honor = 1 } } },
        { text = "Pleased. Heroes should be remembered loudly, to inspire others.", next = "BACK", reply = "Perhaps, and perhaps the stone does inspire. Your children certainly stop to look at him.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmage = {
      lines = {
        { id = "xma_default", text = "So I am told. My people distrust the arcane, after what it did to us at the Well of Eternity, so I stand longest at his statue, trying to understand a mage that humans call a hero." },
      },
      choices = {
        { text = "Magic is a tool. It's only as good as its wielder.", next = "BACK", reply = "That is what humans say, and some of them are right. My people learned otherwise.", fx = { align = { order = -1 } } },
        { text = "Your people are right to fear it.", next = "BACK", reply = "Thank you. Few humans say so, and I will not pretend I am not glad to hear it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A druid of the Cenarion Circle, trained in the forests of Ashenvale, and now watching humans for a while." } },
    advice = { { id = "tp_ad", text = "Remember the dead, but do not build your house in their shadow." } },
    _none = { { id = "tp_none", text = "That I do not know. The trees might, but they are slow to tell." } },
  },
}

---------------------------------------------------------------------------
-- Fyrenz Vishonar: weaves glamours that change how a person's gear looks.
---------------------------------------------------------------------------
P:NPC {
  key = "fyrenz", id = TODO_NPC("Fyrenz Vishonar"), name = "Fyrenz Vishonar", title = "Transmogrifier",
  bible = "bibles/stormwind_forever.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "smooth" }, values = { "proud", "curious" },
  notices = { "kit", "class" },
  impression = {
    first = "She studies everyone's clothes the way a jeweller studies stones.",
    third = "{name} met Fyrenz Vishonar, the night elf in Stormwind who changes how armour looks.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, {class}. Your gear has a fine shape to it, and I'd be glad to weave you something new over it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return. I'll weave your glamour, since it's my trade, but I'll not be lavish with my compliments." },
    { id = "g_default", text = "Greetings, {class}. I can show you how to weave magic about yourself to change the appearance of your equipment, if you so desire." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has your armour grown dull in your eyes already?" },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "You come to me wearing almost nothing? There is very little for me to work with, {class}." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue who wants to change their look. I wonder why." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Fyrenz Vishonar. I weave a glamour over your armour so it looks however you wish, while the steel underneath stays exactly what it is. Do you wish to use my services?" },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask, then. I am listening." },
      },
      choices = {
        { text = "A glamour should never hide a flaw that could cost a life.", next = "BACK", reply = "Wisely said. I change how your steel looks, never what it is, and I'll not pretend otherwise.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Glamour cheap gear to look like an officer's and fool the recruits.", next = "BACK", reply = "You could, but the recruits would follow you into battle, and they'd die for it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How does it work?", next = "how" },
        { text = "Why would anyone want this?", next = "why" },
        { text = "What brings you to Stormwind?", next = "here" },
        { text = "Where did a kaldorei learn a craft like this?", next = "teacher" },
        { text = "I need discretion more than style.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "My armour's dented. Can you hide that?", next = "xplate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Can a priest's robes be glamoured?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "You know I could do this myself, with a spell.", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the glamour survive shapeshifting?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Could you glamour my pet?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'm not wearing much. Can you work with it?", next = "xnaked", when = { nearlyNaked = true } },
        { text = "My family's tailors would hate you.", next = "xnoble", when = { origin = "human_minor_noble" } },
        { text = "Our people would call this frivolous.", next = "xnelf", when = { race = "NightElf" } },
        { text = "I'd like to change my look.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },

    how = {
      lines = {
        { id = "hw_default", text = "A thread of magic, laid close over the metal and leather, that shows the eye one thing while the body wears another. It changes nothing but the look, so do not ask me to make your plate lighter." },
      },
      choices = {
        { text = "It's a kind of lie, then.", next = "how_lie" },
        { text = "Can anything be made to look like anything?", next = "how_limits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_lie = {
      lines = {
        { id = "hl_default", text = "A kind one, perhaps. The armour still protects you; only the eye is fooled. If that troubles you, wear what you have and be proud of it." },
      },
      choices = {
        { text = "A warrior should look like what they are.", next = "BACK", reply = "Then wear your own, and wear it proudly. I will not think less of you for it.", fx = { align = { honor = 1 } } },
        { text = "Looking how I like hurts no one.", next = "BACK", reply = "Exactly so, and that is why I keep this little shop. Beauty harms nobody.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because adventurers wear whatever they last pulled off a dead ogre, and most of it clashes terribly. Some want to look like a hero they admire, and some just want to stop being laughed at in the tavern." },
      },
      choices = {
        { text = "What do most people ask for?", next = "why_asks" },
        { text = "What's the strangest thing anyone's asked for?", next = "why_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },

    here = {
      lines = {
        { id = "hr_default", text = "There are more adventurers in this city than in all of Darnassus, and more of them badly dressed. A weaver goes where the work is." },
      },
      choices = {
        { text = "Do you miss Darnassus?", next = "here_miss" },
        { text = "How do the humans treat you?", next = "here_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },

    how_limits = {
      lines = {
        { id = "hli_default", text = "Only like over like: a robe over a robe, a blade over a blade of the same kind, and nothing over a shield that was never a shield. The weave remembers the shape beneath it, and if I stretch it too far it tears like old silk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    teacher = {
      lines = {
        { id = "le_default", text = "From a teacher in Darnassus who learned it from her own teacher, who learned it, she always said, by watching the court of Queen Azshara from the servants' stair. The Highborne wore glamours the way others wear perfume, and only the smallest, safest corner of that art survived.", fx = { learn = { "queen_azshara" } } },
      },
      choices = {
        { text = "Is that allowed, in Darnassus?", next = "teacher_law" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher_law = {
      lines = {
        { id = "ll_default", text = "I call it a weaving, not a spell, and I touch nothing that the old law forbids, which the Sentinels accept and the priestesses do not. It is one of the reasons I find Stormwind's air agrees with me." },
      },
      choices = {
        { text = "If it harms no one, the law shouldn't touch it.", next = "BACK", reply = "That is my view, and I have argued it to the priestesses for many years. They remain unconvinced.", fx = { align = { order = -1 } } },
        { text = "Your people's law exists for good reason. Be careful.", next = "BACK", reply = "I am careful, always, and I thank you for the warning. The priestesses would like you.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why_asks = {
      lines = {
        { id = "wa_default", text = "Warriors want to look like their captains, mages want to look like their teachers, and paladins all want to look like Uther, in white and gold with a hammer. I have made a great many Uthers." },
      },
      choices = {
        { text = "And the rogues?", next = "why_rogues" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_rogues = {
      lines = {
        { id = "wr_default", text = "The rogues want to look like nothing at all, which is the hardest look there is: black on black, and no buckle that catches the light. They pay promptly, too, which I appreciate more than I can say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why_strange = {
      lines = {
        { id = "wst_default", text = "A dwarf who wanted his plate to look like a dress, a fine blue one with lace at the collar, for his wife's birthday. I asked no questions, and he wore it home very proudly, and I hear she laughed for a week." },
      },
      choices = {
        { text = "That's the best thing I've heard all day.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    here_miss = {
      lines = {
        { id = "hm_default", text = "I miss the quiet, and I miss being the strange one only now and then instead of all day long. But in Darnassus everyone wears the same green and silver, so a weaver there is a little like a singer in a house of the deaf." },
      },
      choices = {
        { text = "Your people could stand to dress more boldly.", next = "BACK", reply = "Oh, they could, and I have told them so, very quietly. Nobody listens to a transmogrifier.", fx = { align = { order = -1 } } },
        { text = "There's a beauty in a people who dress alike.", next = "BACK", reply = "There is, and I miss it sometimes. But I would still like to see a little more colour.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    here_humans = {
      lines = {
        { id = "hh_default", text = "Politely, and with enormous curiosity, and one of the guards once asked whether I was a witch. I told him yes, and that he would wake up wearing a pink tabard, and he has been very polite ever since." },
      },
      choices = {
        { text = "Remind me never to annoy you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      lines = {
        { id = "xr_default", text = "Of course. I do not ask what you are hiding from, and I do not remember the faces I dress, which is a lie but a comforting one. Only do not come back next week looking like the drawing on a wanted poster." },
      },
      choices = {
        { text = "I won't use it to fool anyone.", next = "BACK", reply = "Then you are a rarer customer than most. I will dress you honestly, in that case.", fx = { align = { honor = 1 } } },
        { text = "A new look is a rogue's best tool.", next = "BACK", reply = "It is, and I will not ask what you do with it. Only do not come back wearing someone else's face.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xplate = {
      lines = {
        { id = "xp_default", text = "I could, but I would rather not. A dent is a story, {class}, and some of the best-dressed warriors I know keep theirs on purpose." },
      },
      choices = {
        { text = "Let them see the dents. I earned every one.", next = "BACK", reply = "Then wear them proudly, {class}. A warrior's dents are the finest embroidery there is.", fx = { align = { honor = 1 } } },
        { text = "Hide them. Nobody needs to see where I was hit.", next = "BACK", reply = "Very well, I will smooth them, though I will remember them even if you do not.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpriest = {
      lines = {
        { id = "xpr_default", text = "Robes are the easiest of all, and priests the hardest customers, because each of them insists they do not care how they look and then asks for gold trim on the hem." },
      },
      choices = {
        { text = "Just a little gold trim.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I truly don't care how I look.", next = "BACK" },
      },
    },

    xmage = {
      lines = {
        { id = "xm_default", text = "You could try, and many of your kind have, and they come to me afterwards with robes that flicker like a candle in a draught. A glamour wants patience more than power, and mages have never had the patience for anything." },
      },
      choices = {
        { text = "That's fair. I'll leave it to you.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll get it right eventually.", next = "BACK", fx = { trait = { proud = 1 } } },
      },
    },

    xdruid = {
      lines = {
        { id = "xd_default", text = "It sleeps while you wear the bear or the cat, and wakes when you return, the way a cloak waits on its hook. One druid asked me to glamour her bear, and I told her the forest had already done better work than I ever could." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xhunter = {
      lines = {
        { id = "xh_default", text = "No, and please do not ask again, because the last hunter who asked brought me a wolf that ate a whole bolt of silk. Your companion is beautiful exactly as it is, and it would tell you so if it could." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xnaked = {
      lines = {
        { id = "xn_default", text = "I can glamour a belt and a pair of boots, which is not what anyone would call an outfit. Go and buy a shirt, {class}, and come back when there is a canvas." },
      },
      choices = {
        { text = "Fair. I'll be back.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xnoble = {
      lines = {
        { id = "xno_default", text = "Your family's tailors have already been to see me, twice, to ask how it is done and to complain that I have stolen their customers. I have, and I sleep very well." },
      },
      choices = {
        { text = "Good. They overcharge terribly.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xnelf = {
      lines = {
        { id = "xne_default", text = "Our people call everything since the Sundering frivolous, {g:brother|sister}, and yet even Tyrande's Sentinels polish their glaives until they shine. Beauty is not vanity, if it is done with care." },
      },
      choices = {
        { text = "The old ways keep us humble. Don't forget them.", next = "BACK", reply = "I will not forget them, {g:brother|sister}, but I do not think Elune minds a little shine.", fx = { align = { order = 1 } } },
        { text = "We spent too long hiding from beauty.", next = "BACK", reply = "We did, and I am glad you see it. Come back and I will show you what silver can do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned my craft in Darnassus, and then came here, where the work is." } },
    advice = { { id = "tp_ad", text = "Wear what keeps you alive. Let me worry about how it looks." } },
    _none = { { id = "tp_none", text = "That is not my concern. Ask me about how you look, and I will have plenty to say." } },
  },
}
