-- Stormwind's other powers and comforts: SI:7, the Wizard's Sanctum, the Slaughtered Lamb,
-- and the Gilded Rose. Voices: bibles/city.md (one bible, a section each).
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Master Mathias Shaw: head of SI:7, Old Town. Cynical, loyal to the crown.
P:NPC {
  key = "shaw", id = TODO_NPC("Master Mathias Shaw"), name = "Master Mathias Shaw",
  bible = "bibles/city.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "lawful" },
  notices = { "stealth", "watch" },
  impression = {
    first = "Master Mathias Shaw talks like a man who has already read my file, and he probably has. I couldn't tell whether he approved of me or merely made a note.",
    third = "{name} met Master Mathias Shaw, head of SI:7, who listened to every word I said and gave back almost none.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Sit. I knew you were coming before you did." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "You've wandered into the wrong building. Wander out the same way." },
    { id = "g_si7", when = { questActive = TODO_QUEST("Seek out SI: 7") }, text = "Sylvius sent you, and she thinks you're promising, though she's said that before." },
    { id = "g_back", when = { metBefore = true }, text = "Back already. You took the stairs more quietly this time. Progress." },
    { id = "g_away", when = { away = 14 }, text = "You've been out of the city {away}, and you thought nobody was counting. Somebody in this building always is." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come along since I last saw you, and someone here made a note of it. I haven't decided yet what the note says." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone in the city swallowed a story of yours whole. Tidy work, though if it had been sloppier we'd be having a different conversation." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "One of the city's people caught you in a lie, I'm told. Don't try one on me, because I won't need to catch it." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "The third step from the door creaks, and you stepped on it. Everyone does, the first time, and I had it left that way on purpose." },
    { id = "n_watch", cat = "watch", when = { deed = "dungeon:The Deadmines" },
      text = "You've been under Moonbrook, and I read the reports before you'd washed the mud off. That's my job." },
    { id = "n_beast", cat = "watch", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your animal went straight for the corner where my man's standing, and my recruits take a fortnight to spot him. Call it off, please, before he takes it personally." },
  },

  start = "hello",
  nodes = {
    xpt_shaw = {
      big = true,
      lines = { { id = "xpt_shaw_default", text = "Because trust is how the Defias got into this city in the first place, through masons the nobles were happy to cheat and then forgot about. I don't doubt your friends, {name}; I doubt everyone, which is what the king's coin pays me for." } },
      choices = {
        { text = "I'll keep trusting them. A company without trust breaks first.", next = "BACK", reply = "Then you'll have a strong company, right up until the day you don't. I hope I'm never reading your name in a report.", fx = { align = { honor = 1 } } },
        { text = "You're right. I'll mind what I say around them.", next = "BACK", reply = "Good. You needn't stop trusting them, only stop telling them everything. There's a difference, and it keeps people breathing.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_stocks = {
      big = true,
      lines = { { id = "xcl_stocks_default", text = "Enough to know the Brotherhood's reach goes higher than Westfall, and not enough to name a name in front of the House of Nobles. Prisoners talk when they think they'll live, and Thredd stopped thinking that the day the riot started." } },
      choices = {
        { text = "Next time I'll bring him to you in chains, Shaw.", next = "BACK", reply = "Alive and talkative, if you can manage it. A dead prisoner is the most loyal man the Brotherhood has.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't fight riots on SI:7's schedule, Shaw.", next = "BACK", reply = "No, you fight them on the rioters' schedule, which is worse. I'm only asking you to remember who'd want to know what they said.", fx = { align = { order = -1 } } },
        { text = "How high does the Brotherhood reach, Shaw?", next = "xcl_stocks2" },
      },
    },
    xcl_stocks2 = {
      lines = { { id = "xcl_stocks2_default", text = "High enough that I won't say it in a room with a window, and that's all you'll get from me today. Keep your ears open in the Keep, though, because sooner or later somebody there will say something careless, and I'd like you to be the one who hears it." } },
      choices = {
        { text = "I'll keep listening, Shaw.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "SI:7 keeps a file on everything new, and you are new. The last shamans this kingdom met came in orcish war paint, so call it habit, not malice." } },
      choices = {
        { text = "Keep your file. The kingdom is right to be careful.", next = "BACK", reply = "Thank you. It's an unglamorous habit, but it's kept this city standing more than once.", fx = { align = { order = 1 } } },
        { text = "Your files breed suspicion, Master Shaw. Spend your care elsewhere.", next = "BACK", reply = "My care goes where it's needed, and a new face is where it's needed. Don't take it personally; I don't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "SI:7 keeps a file on everyone who enters this city, and yours is thinner than I'd like. Your Sentinels are courteous and tell me nothing, which I'd admire if it weren't my job to mind." } },
      choices = {
        { text = "Allies owe each other open books. I'll press the Sentinels.", next = "BACK", reply = "I'd be grateful, and so would the Regent, though I suspect your Sentinels will be politely unmoved.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some secrets are older than Stormwind, Master Shaw. Leave them be.", next = "BACK", reply = "Old secrets are the ones that tend to get people killed, in my experience. I'll leave them be until they stop leaving us be.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "When something needs to be broken in a hurry, yes, though we prefer people who can do it without being seen. A warrior who can keep their mouth shut is rarer than one who can swing, and worth more to me." } },
      choices = {
        { text = "I can keep quiet when the kingdom needs it.", next = "BACK", reply = "Then we may have use for you yet. Don't ask how we'll find you; we will.", fx = { align = { order = 1 } } },
        { text = "I don't sneak. If I break something, people will know.", next = "BACK", reply = "Then you're no good to me, but you might be very good to the guard. There's honest work for loud people too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I trust their honesty, which is not the same thing as trusting their judgement. A paladin will tell me exactly what he saw, and then he'll want to arrest everyone in it, which is usually the moment my work ends." } },
      choices = {
        { text = "Justice should be done in the open, Master Shaw.", next = "BACK", reply = "It should, and most days it is. My work is making sure there's an open left to do it in.", fx = { align = { honor = 1 } } },
        { text = "Some work can't be done in daylight. I understand that.", next = "BACK", reply = "Then you're a rarer paladin than most. Keep that to yourself, or the Cathedral will start to worry about you.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "You've never been in this room, but SI:7 already has a file on someone called {alt} who stood where you're standing, a {altrace} {altclass} with your habit of watching the door. I don't believe in coincidences, so I'll assume you know each other until you tell me otherwise." },
        { id = "h_alt_higher", when = { alt = { higher = true }, metBefore = true }, cooldown = "5d",
          text = "{alt}'s file has grown thicker this month, which means that one's been busy in places I'd rather know about. If your paths cross, tell them Shaw is paying attention, and that I mean it kindly." },
        { id = "h_pt_shaw", tags = { "news" }, when = { party = true },
          text = "You travel with company, and company talks, so choose yours carefully. I've had good agents undone by a friend's loose tongue in a Goldshire tavern, and I'd hate to lose you the same way." },
        { id = "h_cl_stocks", tags = { "news" }, when = { cleared = "The Stockade", faction = "Alliance" },
          text = "Thredd's dead and the riot's over, which leaves one less Defias mouth in the Stockade for me to question. Next time you go down there, come to me first, because a living prisoner is worth ten dead ones to SI:7." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The Silver Hand makes poor spies and honest witnesses, and I've a use for honest witnesses now and then." },
        { id = "h_default", key = true, text = "The name's Shaw, and I run SI:7. If you've heard of us, someone's been careless; if you haven't, we're doing our job." },
        { id = "h_si7", tags = { "news" }, when = { questActive = TODO_QUEST("SI:7") },
          text = "So you found the building, which is good, because finding things people would rather you didn't is the whole job. You'll be doing it until your feet ache." },
        { id = "h_defias", when = { topicKnown = "defias", minLevel = 15 },
          text = "The Defias Brotherhood wants Stormwind hollowed out from the inside. Every gang has a weak link, and my people find it; then I decide what to do with it." },
        { id = "h_deadmines", when = { deed = "dungeon:The Deadmines" },
          text = "VanCleef. I trained him once, you know, and I thought he'd come over to us, but he went somewhere else entirely. I don't make that mistake twice." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A Skyborne. My people have a file on yours already, and it's thin, which makes me uneasy about the file, not about you. Don't take it personally." },
        { id = "h_wiley", tags = { "news" }, when = { questActive = TODO_QUEST("The Defias Brotherhood") },
          text = "This is Stoutmantle's Brotherhood business, and the whispers say Stonemasons. He won't like where that road goes, and neither do I." },
        { id = "h_maelik", tags = { "news" }, when = { questActive = TODO_QUEST("Shadow of the Past") },
          text = "This is Alexston's description, and it says Maelik. I know the face, if not that name: he answers to Marzon when it suits him, and he works for a lord." },
        { id = "h_lescovar_done", tags = { "news" }, when = { questActive = TODO_QUEST("Brotherhood's End") },
          text = "Alexston wants a word with you, so tell him everything except whose hand did the work. As for Trias, he doesn't exist, and he never has." },
        { id = "h_kearnen", when = { questActive = TODO_QUEST("Mathias and the Defias") },
          text = "Kearnen's been lying under a tree outside that tower for weeks. Go and relieve her before she takes root." },
        { id = "h_zanzil", when = { questDone = TODO_QUEST("Klaven's Tower") },
          text = "Trolls in Stranglethorn brewing undeath in a pot, and the Venture Company carrying it north. I've read that journal three times. I'd rather have been wrong once." },
        { id = "h_east", when = { questActive = TODO_QUEST("The First and the Last") },
          text = "I sent five agents into the Eastern Plaguelands, and one came back, saying a name over and over until he died in his sleep a few days later. Sit down." },
        { id = "h_dughan", when = { heardLine = "dughan.d_common_thieves" },
          text = "Dughan tells Goldshire they're common thieves, but common thieves don't keep shipping schedules. Let him keep the town calm, and I'll keep the ledger." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Robes, in SI:7's barracks? Either you're lost, or someone has confessed something interesting, and I'll hope for the second." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You again. My people say you keep your word and your mouth shut, which is the highest praise this building gives, so sit down." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "I've read your file, and I didn't care for it. Say what you came to say, and use the same door on your way out." },
        { id = "h_canals", when = { origin = "human_canal_pickpocket" },
          text = "I remember a file about a canal child with quick fingers and no respect for anybody's purse. Osborne asked me to let it go, and I did, and here you are; don't make me regret it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in Old Town, walking past SI:7's door. You're loud, but you're honest about it, and in my line of work that's almost refreshing." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A kaldorei druid walking into SI:7. Your Sentinels keep their own intelligence and share very little of it, and I'd like to know whether you're here to change that." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman in Stormwind. I have a note on you already, of course, but I'd like to hear your own account of who taught you." },
      },
      again = {
        { id = "h_again", text = "Go on. I've ten minutes, and I've already spent two of them on you." },
        { id = "h_again2", text = "What else? Keep it quiet; the walls here are thin on purpose." },
        { id = "h_again3", when = { class = "ROGUE" }, text = "Something else? Ask it as if someone's listening. Someone usually is." },
      },
      choices = {
        { text = "I don't know much about what SI:7 does.", next = "si7" },
        { text = "Even you answer to someone, I expect.", next = "answer" },
        { text = "The Defias seem better organized than common bandits.", next = "defias" },
        { text = "I'm a rogue. Does SI:7 have work?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I doubt a priest is much use to SI:7.", next = "priest", when = { class = "PRIEST" } },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Lescovar is dead.", next = "lescovar", when = { questDone = TODO_QUEST("The Head of the Beast") } },
        { text = "Does SI:7 watch the Slaughtered Lamb?", next = "lamb", when = { class = "WARLOCK" } },
        { text = "I track things for a living. Any use to you?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'd guess you keep a file on the Skyborne.", next = "skyfile", when = { race = "Skyborne" } },
        { text = "The Watchers taught me to move quietly, Master Shaw.", next = "watchers", when = { race = "NightElf", class = "ROGUE" } },
        { text = "Does SI:7 work with the Mage Quarter?", next = "magequarter", when = { class = "MAGE" } },
        { text = "Does SI:7 ever use warriors, Master Shaw?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does SI:7 trust paladins, Master Shaw?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does SI:7 keep a file on the night elves, Master Shaw?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does SI:7 really keep a file on every shaman?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thredd's dead. Did SI:7 get anything out of him first?", next = "xcl_stocks", when = { cleared = "The Stockade", faction = "Alliance" } },
        { text = "My companions are trustworthy, Master Shaw. Why so suspicious?", next = "xpt_shaw", when = { party = true } },
        { text = "I'll go.", next = "END" },
      },
    },

    si7 = {
      lines = { { id = "s_default", text = "We worry so the king doesn't have to, and currently that's a regent and a boy, so we worry twice as hard." } },
      choices = {
        { text = "That's a heavy job.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd like to help, if I can.", next = "help" },
        { text = "And the King himself?", next = "si7_king" },
      },
    },
    help = {
      lines = { { id = "hp_default", text = "You probably can. Keep your eyes open and your mouth shut, and we'll find you when we need you. Don't come looking." } },
      choices = {
        { text = "Understood.", next = "BACK", reply = "Good. You'd be surprised how few people hear the second half of that.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll come looking whenever I please, Shaw.", next = "BACK", reply = "Then you'll find nothing, and you'll find it very slowly. I'd save your boots.", fx = { align = { order = -1 } } },
        { text = "You'll have a hard time finding me.", next = "help_find" },
      },
    },
    help_find = {
      lines = { { id = "hf_default", text = "I'll find you the same way I knew you were coming before you reached the door: someone told me, as someone always does." } },
      choices = {
        { text = "That isn't comforting.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Then I'll be easy to find.", next = "BACK", fx = { affinity = 1, standing = { stormwind = 1 } } },
      },
    },
    si7_king = {
      big = true,
      lines = { { id = "sk_default", text = "Missing, on the road to Theramore. The whole city knows that much. What my people know beyond it stays in this building." } },
      choices = {
        { text = "Then I won't ask.", next = "BACK", reply = "That's the wisest thing anyone's said to me today. Good day.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The city has a right to know where its king is.", next = "BACK", reply = "It has a right to hope, and that's what I'm protecting. Knowing would serve nobody but the Brotherhood.", fx = { align = { order = -1 } } },
        { text = "Do you know more?", next = "si7_know", fx = { trait = { curious = 1 } } },
      },
    },
    si7_know = {
      lines = { { id = "sn_default", text = "Yes, or no; pick whichever answer lets you sleep, because I'll be awake either way." } },
      choices = {
        { text = "Fair. Something else.", next = "BACK" },
        { text = "You can trust me with the rest of it, Shaw.", tag = "Persuade", next = "si7_truth",
          check = { pass = { any = { { disposition = { min = 70 } }, { deed = "dungeon:The Deadmines" }, { questDone = TODO_QUEST("Brotherhood's End") } } } },
          fail = { next = "si7_shut", fx = { affinity = -1 } } },
      },
    },
    si7_truth = {
      big = true,
      lines = {
        { id = "st_default", text = "Then here's the rest: we don't know. His escort never reached Theramore, no ship put in with his banner, and every agent I've sent down that coast has come back with the same nothing." },
        { id = "st_default2", text = "I tell the Regent every week that we're close, because a man who's carrying a kingdom needs to hear it. We're not close. I'd ask you to keep that in this building, where it belongs." },
      },
      choices = {
        { text = "It stays here.", next = "BACK", fx = { affinity = 2 } },
        { text = "Shouldn't Bolvar know the truth?", next = "si7_bolvar" },
      },
    },
    si7_bolvar = {
      lines = {
        { id = "sb_default", text = "Bolvar knows what he needs to keep going, which isn't the same as the truth, though it's close. When I've something better than nothing, he'll have it before the ink's dry." },
        { id = "sb_priest", when = { class = "PRIEST" }, text = "You'd tell a dying man the truth, I suppose, and you'd be right to. The Regent isn't dying, and I need him on his feet." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    si7_shut = {
      lines = {
        { id = "ss_default", text = "Trust isn't something you ask for in this building; it's something I find in a file after a few years of watching you. Yours isn't thick enough yet." },
        { id = "ss_default2", text = "That's a very good try, and I've heard it from better liars than you. The answer is still the one I gave you." },
      },
      choices = {
        { text = "Then I'll give you a few years.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    answer = {
      big = true,
      lines = { { id = "a_default", text = "The House of Wrynn, whoever's sitting in its chair. I serve the crown, not the court, and that difference has kept me alive." } },
      choices = {
        { text = "And the court?", next = "court" },
        { text = "Good answer.", next = "BACK", reply = "I've had a lot of practice giving it. Most people don't bother to listen to the end.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The crown and the court are the same snake, to my eye.", next = "BACK", reply = "Then you've not looked closely, though I'll grant the court has its fangs. Mind who hears you say it.", fx = { align = { order = -1 } } },
      },
    },
    court = {
      lines = { { id = "c_default", text = "The nobles mean well, mostly. Lady Prestor means very well indeed. She's the only one who never asks me for anything." } },
      choices = {
        { text = "That would make me suspicious.", next = "court_prestor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_prestor = {
      lines = { { id = "cp_default", text = "Of her? No. She's never once asked me to look away from something. That's rare enough at court that I've stopped looking for a reason." } },
      choices = {
        { text = "Maybe you should look.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Then she's an ally.", next = "BACK", fx = { affinity = 1, opinion = { prestor = "ally" } } },
      },
    },

    defias = {
      lines = {
        { id = "d_default", text = "That they're no gang, because gangs don't keep shipping schedules, smuggle from Redridge to Westfall, or plant people inside Stormwind. Someone is building something.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Who's building it?", next = "defias_masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias_masons = {
      lines = { { id = "dm_default", text = "The Stonemasons, the guild that rebuilt this city and was never paid. Their guildmaster led a riot and walked out with half of them, and I knew him well." } },
      choices = {
        { text = "Who was their guildmaster?", next = "defias_edwin" },
        { text = "Something else.", next = "BACK", fx = { opinion = { defias = "masons_wronged" } } },
      },
    },
    defias_edwin = {
      big = true,
      lines = { { id = "de_default", text = "Edwin VanCleef. We were boys together, and I taught him to move unseen and hoped he'd work beside me. He chose stone, then this, and some days I think I taught him exactly enough." } },
      choices = {
        { text = "That isn't your fault.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then you know how he thinks.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },

    rogue = {
      lines = { { id = "r_default", text = "Everyone with light fingers wants in, and Renzik decides whether you live long enough. He'll send you to Lucius in Redridge first, so do what Lucius says." } },
      choices = {
        { text = "I could get caught on a job.", next = "rogue_caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_caught = {
      lines = { { id = "rc_default", text = "Then SI:7 has never heard of you, I've never met you, and this conversation was about the weather. Lovely weather, wasn't it?" } },
      choices = {
        { text = "Lovely.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "That's cold.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    priest = {
      lines = { { id = "p_default", text = "People tell priests what they'd never tell me: grief, guilt, a brother home with too much coin. I'd never ask you to repeat a confession, only to listen well." } },
      choices = {
        { text = "I won't spy for you.", next = "priest_refuse", fx = { align = { light = 1, honor = 1 } } },
        { text = "Listening is half my work anyway.", next = "BACK", reply = "Then you'll be good at the other half too. Bring me anything that sounds like coin from nowhere.", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    priest_refuse = {
      lines = { { id = "pr_default", text = "Good, because a priest who'd sell a confession is no use to me either; nobody would confess to them. We understand each other." } },
      choices = { { text = "I suppose we do.", next = "BACK", fx = { affinity = 1 } } },
    },

    noble = {
      lines = { { id = "n_default", text = "Then there's a file on them in this building, and don't go pale, because there's a file on every house. Yours is thinner than most, which is a compliment." } },
      choices = {
        { text = "What's in it?", next = "noble_file" },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble_file = {
      lines = { { id = "nf_default", text = "Debts, mostly. Every noble house in Stormwind owes someone. The interesting question is never how much. It's to whom." } },
      choices = {
        { text = "I'll keep my family's debts in order.", next = "BACK", reply = "See that you do, because I'd hate to find your family's name in one of my files for the wrong reason.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "I'd sooner collect debts than pay them, Shaw.", next = "BACK", reply = "So would everyone, and that's exactly why my files are so thick. Mind which side of the ledger you end on.", fx = { align = { order = -1 } } },
        { text = "Whose debts interest you most?", next = "BACK", fx = { trait = { curious = 1 }, affinity = -1 } },
      },
    },

    lescovar = {
      big = true,
      lines = { { id = "l_default", text = "So I hear, and swiftly done. Remind me never to be the name on your list, and don't offer Trias any thanks, because he won't want them." } },
      choices = {
        { text = "Will the House of Nobles ask questions?", next = "lescovar_house" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lescovar_house = {
      lines = { { id = "lh_default", text = "The House will find a lord dead in his own garden and decide he had enemies, and they'll be right, but they won't ask which." } },
      choices = {
        { text = "A lord who betrays the crown earns his garden grave.", next = "BACK", reply = "Perhaps, though I'd never say so in front of the House. The garden will keep its own counsel.", fx = { align = { order = -1 } } },
        { text = "Even a traitor deserves a trial before the House.", next = "BACK", reply = "And he'll have one, if the House ever asks for one. I suspect it won't, and I suspect you know why.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lamb = {
      big = true,
      lines = {
        { id = "lamb_l", text = "Of course it does. Gakin the Darkbinder knows we watch, I know he knows, and so long as nothing with horns walks up the cellar stairs into the Mage Quarter, the arrangement suits the crown." },
        { id = "lamb_cellar", when = { origin = "human_lamb_cellar" },
          text = "You went down those cellar stairs young, didn't you; your name's in a ledger of mine with a question mark beside it. Gakin knows we watch, and so long as nothing with horns walks up into the Mage Quarter, the arrangement suits the crown." },
      },
      choices = {
        { text = "Then you'll know if I ever lose control.", next = "lamb_control" },
        { text = "Watching warlocks is wise.", next = "BACK", reply = "Someone has to. The trouble is that Gakin knows he's watched, and he watches right back.", fx = { align = { order = 1 } } },
        { text = "What we do in the cellar is our business.", next = "BACK", reply = "Until it walks up the stairs. Then it becomes my business, and I don't enjoy my business.", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    lamb_control = {
      lines = { { id = "lamb_control_l", text = "I'll know, and so will everyone within a street of you, briefly. Keep your bindings tight and your temper tighter, and you'll never meet the people I'd send." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    hunter = {
      lines = { { id = "hunter_l", text = "Perhaps. My agents read people well enough, but they're hopeless in a forest, and the Defias have learned to camp where the roads give out. Someone who can follow a trail through Westfall's hills and keep a beast quiet is worth a conversation." },
        { id = "hunter_woods", when = { origin = "human_eastvale_woodsman" },
          text = "An Eastvale woodsman, by the file, and that's useful; my agents are hopeless in a forest, and the Defias have learned to camp where the roads give out." } },
      choices = {
        { text = "Then point me at a trail.", next = "hunter_trail" },
        { text = "I don't spy, Master Shaw. I hunt.", next = "BACK", reply = "Call it whatever you like, as long as you bring back where the Defias are sleeping.", fx = { align = { honor = 1 } } },
        { text = "I'd track anyone for the crown.", next = "BACK", reply = "Good. The crown will remember, and so will I, which is the more useful of the two.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    hunter_trail = {
      lines = { { id = "hunter_trail_l", text = "Stoutmantle at Sentinel Hill has more trails than men to follow them. Tell him I sent you, or better, don't, and let him think it was his idea." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    skyfile = {
      lines = { { id = "skyfile_l", text = "Very little: where your High Order is housed, which of the Kirin Tor speak for you, and a note in my own hand that says find out more. You could save my agents some walking." } },
      choices = {
        { text = "I'll tell you what I'd tell a friend.", next = "BACK", reply = "Then we may get along better than my file suggests. Come by when you've a moment to spare.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your agents can keep walking.", next = "BACK", reply = "They will, and they'll learn what they learn. You'd have saved us both the trouble.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
        { text = "Why does a thin file worry you?", next = "skyfile_thin" },
      },
    },
    skyfile_thin = {
      lines = { { id = "skyfile_thin_l", text = "Because a thin file is a guess wearing a uniform. I've buried agents who trusted guesses, and I won't bury any of your people on account of one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watchers = {
      lines = { { id = "watchers_l", text = "Did they? Then you'll find Stormwind's shadows rather noisy. The Watchers keep their own people's secrets, I'm told, and keep them from strangers, which is a cleaner job than mine; here the enemy usually went to school with you." } },
      choices = {
        { text = "Then I'll learn your kind of quiet.", next = "BACK", fx = { affinity = 1 } },
        { text = "No secret-keeping is clean, Master Shaw.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    magequarter = {
      lines = { { id = "magequarter_l", text = "When it suits both of us. Jennea Cannon and I trade favours the way merchants trade grain: carefully, and with a long memory of who got the better end." } },
      choices = {
        { text = "One of you must get the better end.", next = "magequarter_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magequarter_end = {
      lines = { { id = "magequarter_end_l", text = "She'd say she does, and I'd let her, which is how I know I do. Don't repeat that in the Sanctum." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    si7 = { { id = "tp_si7", text = "SI:7 is the King's eyes and ears, and in his absence, they're the Regent's. We hear more than we say and say less than we know, which is how it should be." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's riot was not an accident, and it was not entirely the prisoners' idea. I'll say no more than that, except that I'd like the names of the people who've been paying the guards." } },
    deadmines = {
      { id = "tp_deadmines", text = "VanCleef is dug in under Moonbrook with a ship he's built in the mines, and I've known about it for months. Knowing isn't the same as proving, and proving isn't the same as having the men to act." },
      { id = "tp_deadmines2", when = { class = "ROGUE" }, text = "You've the hands for the Deadmines, and the eyes, which matters more down there. If you go, come back and tell me what you saw before you tell Stoutmantle, and we'll call it a professional courtesy." },
    },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate are the fallen nobles of Alterac, playing thieves in the hills and conspiring with anyone who'll pay. They're on my list, a fair way down, because Stormwind has problems closer to home." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt Manor is a fine old house in the Alterac foothills, I'm told, and people tell me most things eventually. If you find it, give them my regards, and don't tell them I sent you." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor has the Regent's ear and the House of Nobles' devotion, and she's done nothing I can point to. I keep files on everyone in the Keep, and hers is very thin, which I find interesting." } },
    varian = { { id = "tp_varian", text = "SI:7 has been searching for the King since the day his ship went missing, and we've not found so much as a boot. That's either very good news or very bad, and I'm paid to assume the second." } },
    thrall = { { id = "tp_thrall", text = "Thrall's orcs keep to Durotar and the Barrens, and his envoys talk peace with Theramore. I don't take talk at face value, and I'd advise you don't either." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay sells to everyone, and that includes people who'd like this city burned. I've a few friends in the port who keep me informed, and they're expensive, and they're worth it." } },
    stromgarde = { { id = "tp_stromgarde", text = "Stromgarde's half in ogre hands and half in the Syndicate's, and its lords are too proud to ask us for help. I watch the Arathi Highlands closely, because whoever holds them holds the road north." } },
    knows = {
      { id = "tp_knows", text = "Knowing things is the whole trade here, though telling them is another matter. I'll give you what I can on any of these, and not a word more." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get very little from me, but I'll hear the question, on these and nothing else." },
    },
    background = { { id = "tp_bg", text = "I run SI:7. Before that I was learning to. That's all the story there is, and more than I tell most people." } },
    advice = { { id = "tp_ad", text = "Count the doors in every room you walk into. Then count the people who know about them." } },
    rumors = { { id = "tp_ru", text = "Rumours are my trade, and I don't hand out samples." } },
    defias = {
      { id = "tp_defias", text = "The Defias are organized, funded and patient, and who funds them is the question I'm working on.", next = "defias_masons" },
      { id = "tp_defias2", text = "They smuggle through Jerod's Landing and Klaven's tower and anywhere else nobody's watching. I'm watching." },
    },
    westfall = { { id = "tp_westfall", text = "Stoutmantle's a good man doing the crown's job without the crown's money. I send him what I can, quietly." } },
    _none = { { id = "tp_none", text = "If SI:7 knew, it wouldn't be my place to say. If we didn't, it wouldn't be my place to admit it." } },
  },
}

-- Jennea Cannon: Wizard's Sanctum, Mage Quarter. Formal, mentoring.
P:NPC {
  key = "jennea", id = TODO_NPC("Jennea Cannon"), name = "Jennea Cannon", title = "Mage Trainer",
  bible = "bibles/city.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "curious", "lawful" },
  notices = { "arcane" },
  impression = {
    first = "Jennea Cannon teaches in the Wizard's Sanctum, where even the floor is warded, and she doesn't hand out compliments lightly. Her praise comes in very small measures, and it seems to be worth earning.",
    third = "{name} met Jennea Cannon of the Wizard's Sanctum, a mage trainer who believes everyone's fundamentals have gaps.",
  },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "The Sanctum. Wipe your boots; the floor wards are sensitive." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Please don't touch the circles; they're not decorative." },
  },

  notice = {
    { id = "n_skyborne", cat = "arcane", when = { race = "Skyborne", class = "MAGE" },
      text = "A High Order mage! I'd like to see what your people kept all those years, but your fundamentals come first, because everyone's fundamentals have gaps." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Utterly. We bind the arcane with study and rule, and you ask the world for favours. I'd call it reckless, though I've seen it work." } },
      choices = {
        { text = "Asking is wiser than binding. The world remembers how it's treated.", next = "BACK", reply = "Perhaps it does, and Dalaran might have fared better listening. I'll admit I'm not entirely sure.", fx = { align = { order = 1 } } },
        { text = "Discipline is safer than favours. I'd learn your way if I could.", next = "BACK", reply = "That's generous of you, but I suspect the spirits wouldn't take kindly to a mage taking notes on them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because they were built to recognise arcane power, and yours is something older that they've no word for. The kaldorei put the arcane aside long ago, I'm told, and the wards seem to know it." } },
      choices = {
        { text = "My people put the arcane aside for good reason, Magus.", next = "BACK", reply = "They did, and I've read the histories of the Highborne. I'd still rather understand a fire than bury it.", fx = { align = { order = 1 } } },
        { text = "Every power has its use. My people were too quick to fear it.", next = "BACK", reply = "That's a rare thing for a kaldorei to say, and I'll remember it. Come to the Sanctum some evening and we'll argue properly.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every year or so, usually someone who's heard a rumour about Dalaran's treasures and has never once read a book. SI:7 returns the books to us afterwards, though rarely in one piece, and I've stopped asking what became of the thief." } },
      choices = {
        { text = "Knowledge should be guarded from those who'd misuse it.", next = "BACK", reply = "Exactly so, which is why I keep the vault locked and SI:7 on good terms. Not all readers are students.", fx = { align = { order = 1 } } },
        { text = "Knowledge locked away does no one any good.", next = "BACK", reply = "It does a great deal of good when it keeps the wrong hands empty. Ask Dalaran what happened when it didn't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not dislike, exactly, but cold iron dulls a ward the way a wet rag dulls a flame. It's why Dalaran's battlemages always fought behind a line of soldiers and never among them." } },
      choices = {
        { text = "Then mages and soldiers belong together, each in their place.", next = "BACK", reply = "Yes, and the best battlemages always knew it. A soldier is the finest ward I've ever met.", fx = { align = { order = 1 } } },
        { text = "Mages should learn to stand on their own, without us.", next = "BACK", reply = "Some of them do, and they die young, usually alone and very proud. I'd rather my students had a line in front.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rarely, though they ought to; a mage who can't read a trail is lost the moment she leaves a road. I learned that in Alterac, where the snow hid everything and the only guide worth having was a hunter from Hillsbrad." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Rarely, though they ought to; a mage who can't read a trail is lost the moment she leaves a road. Your {pet} keeps looking at the arcane focus as if it means to eat it. I'd rather it didn't; the last creature that tried glowed for a week." },
      },
      choices = {
        { text = "Every trade has something to teach the others, Magus.", next = "BACK", reply = "Exactly so. I'd send every apprentice in the Quarter to walk a season with a Hillsbrad hunter, if the Sanctum would let me.", fx = { align = { order = 1 } } },
        { text = "Mages stick to their books. I'll stick to my trails.", next = "BACK", reply = "Then let's hope you never need a ward in the snow. Still, I respect a hunter who knows her trade.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "We respect what works, and your healers work, while some of my students' spells fizzle halfway through the incantation. Where we part ways is whether power must be granted or can be earned by study, and that argument is older than this city." } },
      choices = {
        { text = "Power that's prayed for is humbler than power that's taken.", next = "BACK", reply = "Humbler, perhaps, but not always wiser. I've known proud priests and humble mages, and the reverse.", fx = { align = { light = 1 } } },
        { text = "Study earns more than kneeling ever has, Magus.", next = "BACK", reply = "You'd be welcome in the Sanctum, though I'd ask you not to say that within earshot of the Cathedral.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "To the Kirin Tor in principle, and to their own sense in practice, and so I test my students harshly, for untested power is a danger and I would sooner fail a student than bury one." } },
      choices = {
        { text = "Then magic should answer to law, like everything else.", next = "BACK", reply = "It should, and the Kirin Tor once agreed. I'll keep testing my students until it does again.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A mage's mind is their own. No council should rule it.", next = "BACK", reply = "Kel'Thuzad said much the same, and he said it in very fine robes. Be careful who you agree with.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in the Sanctum. The wards here are indifferent to faith, so I'll ask you to keep your hands to yourself the same as anyone else." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The wards in this hall don't care for plate, so please don't lean on the walls." },
        { id = "h_default", text = "Jennea Cannon, of the Wizard's Sanctum. I teach mages who've outgrown the provinces; some have, though most only think they have." },
        { id = "h_speak", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Jennea") },
          text = "Wefhellt sent you. He'll have said something flattering about me. Ignore it and listen to what I actually say." },
        { id = "h_mirror", when = { questActive = TODO_QUEST("Mirror Lake") },
          text = "Mirror Lake is just outside the city. Bring me what I asked for, and mind your reflection; it's only a reflection, mostly." },
        { id = "h_recluse", when = { questActive = TODO_QUEST("Investigate the Blue Recluse") },
          text = "The Blue Recluse is a tavern, not a laboratory, whatever its regulars think. Find out what they're doing in there." },
        { id = "h_wards", when = { metBefore = true, class = "MAGE" }, text = "Your wards are tidier, though not good yet, only tidier. Good comes later." },
        { id = "h_sleeve", when = { metBefore = true, ["not"] = { class = "MAGE" } }, text = "A student set his sleeve alight last week, then froze it, then cried. Mages learn in that order." },
        { id = "h_marsh", when = { class = "MAGE", minLevel = 38 },
          text = "You've outgrown this room. There's a hermit in Dustwallow Marsh called Tabetha, brilliant, rude and worth the boat fare, so go when you're ready to earn a wand." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "You call on something that answers, priest. We call on something that only obeys. I've never decided which habit is more dangerous." },
        { id = "h_quarter", when = { origin = "human_mage_quarter" },
          text = "One of the Quarter's own apprentices, and I remember your teachers, who never stopped mentioning Dalaran. You've outgrown them; that doesn't mean they were wrong about everything." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the Sanctum. If you've come for a spellbook, the ones worth stealing are warded to bite, and the rest would bore you to tears." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in the Sanctum. You may stand there, by the door, where the wards won't take offence at all that iron." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, with the smell of the woods on you. Stand outside the circles, please, and keep your beast from sniffing the reagents." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in the Sanctum. The wards hum differently around your people, as if they're not quite sure what you are, and I confess I'm not either." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman in the Wizard's Sanctum. Mind the floor, it's warded, and I imagine your spirits won't care for it any more than my students do." },
      },
      again = {
        { id = "h_again", text = "Is there more? Stay outside the circles while you ask." },
        { id = "h_again2", text = "Ask. Precisely, if you can manage it." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "What are you studying these days, Magus?", next = "currents" },
        { text = "Has there been trouble in the Mage Quarter lately?", next = "recluse" },
        { text = "Magic can't be that dangerous.", next = "danger", when = { ["not"] = { class = "MAGE" } } },
        { text = "What should I be practising?", next = "practise", when = { class = "MAGE" } },
        { text = "Should a mage's learning have any limits?", next = "limits", when = { class = "MAGE" } },
        { text = "Gnomeregan's mages studied differently from yours.", next = "gnome_mage", when = { race = "Gnome", class = "MAGE" } },
        { text = "The High Order studied in Dalaran before coming here.", next = "highorder", when = { race = "Skyborne", class = "MAGE" } },
        { text = "You can't think much of the warlocks under the Lamb.", next = "warlocks" },
        { text = "Do thieves really try to rob the Sanctum?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the Sanctum's wards really dislike iron, Magus?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do mages and hunters ever work together, Magus?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Sanctum's mages respect the Church, Magus?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should mages answer to anyone, Magus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would the Sanctum's wards care what a druid is, Magus?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is shamanism so different from your magic, Jennea?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    currents = {
      lines = { { id = "cu_default", text = "The great magical struggles of the last wars tore the old ley currents loose, and Elwynn's flow has shifted. I want to know whether it's seeping into what people drink." } },
      choices = {
        { text = "And if it is?", next = "currents_if" },
        { text = "Something else.", next = "BACK" },
      },
    },
    currents_if = {
      lines = { { id = "ci_default", text = "Then a village drinks from that lake for ten years and nobody knows why its children dream in colours. I'd rather find out first." } },
      choices = { { text = "Better you than them. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    recluse = {
      lines = { { id = "re_default", text = "A mana rift opened in the cellar of the Blue Recluse, a tavern in the middle of the Mage Quarter, and invisible things wandered among the tables. The regulars blamed the ale for a week." } },
      choices = {
        { text = "Where did they come from?", next = "recluse_from" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recluse_from = {
      lines = { { id = "rf_default", text = "That's what I mean to find out, so catch them in the coffers I gave you, and we'll study how they slipped through. Closing the door is easy, but knowing who opened it isn't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "da_default", text = "It is to the untrained, because it burns. I've watched it burn people who were certain they'd be the exception." } },
      choices = {
        { text = "The Light burns the careless too.", next = "danger_light", when = { class = "PRIEST" } },
        { text = "I'll keep my distance.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    danger_light = {
      lines = { { id = "dl_default", text = "Does it? Then we've more in common than your Archbishop would like to admit. Come back and argue about it. I enjoy a good argument." } },
      choices = { { text = "I might. Something else.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Counterspells, and I mean every day. A mage who can only cast is a fire with legs; a mage who can stop someone else's spell is a defence, and the Sanctum needs defences." },
        { id = "practise_old", when = { minLevel = 40 },
          text = "Your timing. You've power enough now, and power never saved anyone who used it a heartbeat late; the mage who freezes at the right moment beats the one who burns at the wrong one, every time." },
      },
      choices = {
        { text = "Fire's more useful than defence.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Then I'll practise until I'm bored of it.", next = "practise_bored" },
      },
    },
    practise_bored = {
      lines = { { id = "practise_bored_l", text = "Good, because bored is when it starts to become instinct. Come back when you've stopped thinking about it, and I'll know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    limits = {
      big = true,
      lines = { { id = "limits_l", text = "Kel'Thuzad was a member of the Kirin Tor, and he thought not. Dalaran is still rebuilding from the rubble because one of its own wanted to learn what death could teach, so yes, I think it should, and I think the line is wherever you'd be ashamed to explain yourself." } },
      choices = {
        { text = "Knowledge itself is never the danger.", next = "BACK", reply = "It never is, until a man decides to learn what lies on the other side of it. That's the danger.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Some doors should stay locked.", next = "BACK", reply = "Thank you. That is the whole lesson, and some days I think I'm the last mage in Stormwind who still teaches it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Someone has to decide where the line is.", next = "limits_who" },
      },
    },
    limits_who = {
      lines = { { id = "limits_who_l", text = "In this building, I do, and in Dalaran, the Council of Six. Beyond that, you do, alone, at night, with the book open; that's the moment every teacher fears." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    gnome_mage = {
      lines = { { id = "gnome_mage_l", text = "Differently and loudly; your people treated spells like engines, all tolerances and measurements. I'll admit some of your measurements were better than ours, and I'll deny I said it." } },
      choices = {
        { text = "Our notes are under a hundred feet of sludge.", next = "gnome_mage_notes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_mage_notes = {
      lines = {
        { id = "gnome_mage_notes_l", text = "Then write them again, from memory, and send me a copy. Knowledge that lives in one head is only a rumour waiting to die." },
        { id = "gnome_mage_student", when = { origin = "gnome_last_student" },
          text = "You're rebuilding them already, aren't you, in some corner of Tinker Town. Send me a copy when you're done; knowledge that lives in one head is only a rumour waiting to die." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },
    highorder = {
      lines = { { id = "highorder_l", text = "And the Kirin Tor have been very quiet about what they found in you. I'd like to know what your High Order kept all those centuries, but I'll settle for seeing how you hold a frostbolt." } },
      choices = {
        { text = "Some of it isn't mine to share.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Watch, then.", next = "highorder_watch" },
      },
    },
    highorder_watch = {
      lines = { { id = "highorder_watch_l", text = "Hm. Old forms, very precise, a little stiff in the wrist. Elsharin would recognise some of that; go and show her, and tell me what she says." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    warlocks = {
      lines = {
        { id = "warlocks_l", text = "I think they're a door this city keeps propped open because it's afraid of the draught. I'd close it, and nobody asks me, and the Lamb keeps pouring." },
        { id = "warlocks_lock", when = { class = "WARLOCK" },
          text = "You're one of Gakin's, and you came up the stairs to ask me that? Then here's the truth of it: you're a door this city keeps propped open because it's afraid of the draught." },
      },
      choices = {
        { text = "The kingdom needs every weapon it can get.", next = "BACK", reply = "Every weapon, perhaps, but not every price. I'd want to know what a weapon costs before I swung it.", fx = { align = { light = -1 } } },
        { text = "I'd close it too.", next = "BACK", reply = "Then there are two of us, and the Lamb keeps pouring anyway. Small comfort, but comfort.", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran is being rebuilt, I'm told, slowly and behind closed gates, and the Kirin Tor have yet to invite anyone back. I trained there once, and I'd go back tomorrow if they'd only answer my letters." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are the finest mages in the world, and they've decided the world can wait while they repair their towers. I understand it, and I'd still like an answer to my letters." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a member of the Kirin Tor, once, before he turned to necromancy and the dead. I've studied his early writings, and they were brilliant, which is the most frightening thing I can say about them." } },
    shadowfang = { { id = "tp_shadowfang", text = "Archmage Arugal took refuge in Shadowfang Keep, and the creatures he summoned to fight the Scourge became worse than the Scourge. Every young mage should study that lesson before they open their first grimoire." } },
    jaina = {
      { id = "tp_jaina", text = "Jaina Proudmoore was the best student Dalaran had in a generation, and she proved it when she led her people across the sea. I envy her, and I admire her, and I'd not want her burdens for anything." },
      { id = "tp_jaina2", when = { class = "MAGE" }, text = "Lady Proudmoore studied under Antonidas himself, and she was the finest of his students. Hold yourself to her measure, and you'll fall short every day, which is exactly how a mage should feel." },
    },
    knows = {
      { id = "tp_knows", text = "The Sanctum keeps careful records, and I keep careful notes on the records. Ask me about any of these, and listen closely." },
    },
    background = { { id = "tp_bg", text = "My history is dull, and I won't waste your lesson on it when the magic is the interesting part, so ask about that." } },
    advice = { { id = "tp_ad", text = "Never cast a spell you couldn't explain to a child. If you can't explain it, you don't understand it, and it will notice." } },
    morganth = { { id = "tp_morganth", text = "Morganth's name is not spoken lightly in this building, because he stole from us, and he will be stopped." } },
    _none = { { id = "tp_none", text = "Not a question for the Sanctum, I'm afraid. Try the library." } },
  },
}

-- Gakin the Darkbinder: the Slaughtered Lamb. Guarded; pays for discretion.
P:NPC {
  key = "gakin", id = TODO_NPC("Gakin the Darkbinder"), name = "Gakin the Darkbinder", title = "Warlock Trainer",
  bible = "bibles/city.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "ambitious" },
  notices = { "pet", "watch" },
  impression = {
    first = "Gakin the Darkbinder teaches beneath the Slaughtered Lamb and values discretion above everything. He spoke as though every word cost him something he meant to be repaid.",
    third = "{name} met Gakin the Darkbinder, the warlock trainer beneath the Slaughtered Lamb, who pays well for silence.",
  },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Close the door behind you, quietly. The people upstairs drink to forget us." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You're lost. Stay lost, somewhere else." },
  },

  notice = {
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker's doing what it's told, which is good. Remember that obedience is a habit, not a nature, and keep it in the habit." },
    { id = "n_watch", cat = "watch", when = { ["not"] = { class = "WARLOCK" }, minLevel = 20 },
      text = "You've a look of someone who reports to someone. Whoever it is, tell them the Lamb is just a tavern." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Only that power changes hands, and those who bargain with the world one day may bargain with something worse the next. I speak from experience." } },
      choices = {
        { text = "I'll keep my bargains clean and my spirits honest.", next = "BACK", reply = "Clean bargains are the hardest to keep, shaman. I'll be curious to see how long yours stay that way.", fx = { align = { order = 1 } } },
        { text = "Every bargain has its price. I'll pay mine as I choose.", next = "BACK", reply = "Then we understand each other better than you might like. Come back if the spirits ever stop answering.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Silence, chiefly, and the occasional errand to places where a robe would draw too much attention. The city's guard ignores my door because it suits them, but SI:7 watches it, and a rogue who keeps both sides happy is worth paying." },
      },
      choices = {
        { text = "I'll keep your secrets and stay clear of SI:7's business.", next = "BACK", reply = "Good. SI:7 and I have an understanding, and I'd hate to have it complicated by a careless guest.", fx = { align = { order = 1 } } },
        { text = "SI:7 pays better than you, Gakin. Remember that.", next = "BACK", reply = "I'll remember, and so will they. Mind which side of this cellar you're standing on when they call.", fx = { align = { order = -1 } } },
        { text = "Something else, Gakin.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only where the careless spill it, and I don't keep careless students for long. The Sanctum asks the same question in a less polite voice and gets the same answer, which is that nothing grows in a cellar anyway." } },
      choices = {
        { text = "Then keep your fel contained, or I'll see it rooted out.", next = "BACK", reply = "Contained it is, druid, and you're welcome to come and sniff for leaks. You'll find none.", fx = { align = { order = 1 } } },
        { text = "What you do in your cellar is your own affair, Gakin.", next = "BACK", reply = "A sensible view. Perhaps you'll mention it to your Sentinels, who seem less convinced.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because we take openly what they only study from a safe distance, and they'd rather not admit the two paths share a door. Every mage who's read too far into a forbidden book knows exactly what waits at the bottom of the stairs." } },
      choices = {
        { text = "Some doors should stay shut, Darkbinder.", next = "BACK", reply = "Then keep them shut, mage, and wonder for the rest of your life what was behind them.", fx = { align = { light = 1 } } },
        { text = "Any door worth having is worth opening, Darkbinder.", next = "BACK", reply = "Now that is a mage I could teach something. Come down whenever you tire of the Sanctum's politeness.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warlock needs something between him and his enemies, and most of us summon it. But a living shield remembers your face afterwards, which is a cost I've learned to weigh." } },
      choices = {
        { text = "I'd stand for anyone who fought on our side.", next = "BACK", reply = "Good. Remember it when the thing standing beside you has horns.", fx = { align = { light = 1 } } },
        { text = "I'd never stand for a warlock. Find your own shield.", next = "BACK", reply = "Then you'll fall alone, warrior, and so will I. At least we'll both know why.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It is and it isn't, because your beast chose to stay and mine had no choice at all. Some of my students sneer at hunters, but I've noticed that a hunter's pet never turns on its master at an awkward moment." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It is and it isn't, because your beast chose to stay and mine had no choice at all. Your {pet} trusts you entirely, I can see that. How very rare, and how very difficult to teach." },
      },
      choices = {
        { text = "A bond freely given is stronger than any chain.", next = "BACK", reply = "Stronger, perhaps, but softer too. A chained beast never betrays you; it only waits.", fx = { align = { light = 1 } } },
        { text = "Will is will. A leash is a leash, however you tie it.", next = "BACK", reply = "You understand the craft better than most of my students. That's either a compliment or a warning.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I respect it the way a careful man respects fire, and I don't let it near my books. The Church calls what we do a sin, but the Church was glad enough of any weapon when the orcs came, and nobody writes that in their hymnals." } },
      choices = {
        { text = "What you bind will consume you. There's still time to turn back.", next = "BACK", reply = "Many have said so, priest, and most of them are still saying it. I'll keep my demon, and you'll keep praying.", fx = { align = { light = 1 } } },
        { text = "Power is power. I won't judge where it comes from.", next = "BACK", reply = "A priest who doesn't judge? Light, the Cathedral must be short of staff. I'll take it gladly.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The crown knows what it chooses to know, and it chooses very carefully. We've been useful to Stormwind more than once, and a kingdom with so many enemies can't afford to throw away a useful weapon." } },
      choices = {
        { text = "The crown's law allows you, so I'll respect it, for now.", next = "BACK", reply = "For now is a fair term. The crown will keep allowing it, as long as we keep being useful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Laws that shelter demon-binders are no laws of mine.", next = "BACK", reply = "Then you'll have a long war ahead of you, paladin, and the crown won't be on your side of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, down here. Either you've lost your way or someone sent you, and in either case I'd suggest you keep your prayers inside your mouth." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in my cellar. I'd ask whether this is a visit or a raid, but I doubt you'd give me an honest answer to either." },
        { id = "h_default", text = "Gakin. I teach those who bind what others fear to name. Discretion is the first lesson and the last, and I pay well for it." },
        { id = "h_summons", tags = { "news" }, when = { questActive = TODO_QUEST("Gakin's Summons") },
          text = "Marcot says you're ready for something from the Void. We'll see. The Void doesn't care what Marcot says." },
        { id = "h_surena", when = { questActive = TODO_QUEST("Surena Caledon") },
          text = "Surena was my student, and she took something of mine and ran. Bring it back; what becomes of her is your business, mostly." },
        { id = "h_incubus", when = { class = "WARLOCK", minLevel = 20 },
          text = "There's a circle prepared in the crypts below. When you're ready to bind a succubus we'll talk, and not before, because they eat the ones who aren't." },
        { id = "h_strahad", when = { class = "WARLOCK", minLevel = 30 },
          text = "Felhunters are beyond what I can teach in this cellar, but Strahad Farsan keeps the means in Ratchet. He's one of ours, and he'll have heard of you." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Vestments, in the Lamb's cellar? Did the Archbishop send you, or did you find the stairs yourself? Either way, lower your voice." },
        { id = "h_lamb", when = { origin = "human_lamb_cellar" },
          text = "You first came down those stairs with your eyes wide and your mouth shut, and I've never had a better pupil for it. Keep both habits." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, in my cellar. The Quarter sends its apprentices down to sneer at us now and then, but they always leave with more questions than sneers." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in my cellar. Bold of you, and I appreciate boldness, though I'd appreciate discretion more." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You bind a beast with patience, and I bind mine with will, and I've always wondered which of us the creature resents less." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, beneath the Slaughtered Lamb. Your kind usually smells the fel on these stairs and turns back, so either you're brave or your nose is failing." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "One of the quiet folk. You keep your secrets as well as my students do, I see, and that alone earns you a word." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I'm told the orcs had shamans before they had warlocks. You might ask yourself which of us your people should fear." },
      },
      again = {
        { id = "h_again", text = "Well? The candles don't last forever, and nor does my patience." },
        { id = "h_again2", text = "Something else? Keep your voice down." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "This place feels like more than a tavern cellar.", next = "lamb" },
        { text = "There are a lot of dwarves and gnomes down here.", next = "khaz" },
        { text = "You spoke of Surena as if she mattered.", next = "surena", when = { questDone = TODO_QUEST("Surena Caledon") } },
        { text = "The Church would shut this place down.", next = "church", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I should be practising something, I suppose.", next = "practise", when = { class = "WARLOCK" } },
        { text = "Who's really the master, the warlock or the demon?", next = "master", when = { class = "WARLOCK" } },
        { text = "Gnomeregan's books taught me more than any cellar.", next = "gnome_lock", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "The other trainers here seem a mixed lot.", next = "others" },
        { text = "Why do the Quarter's mages look down on you?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have warlocks any use for warriors, Gakin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is a hunter's bond anything like a warlock's binding?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you fear holy power, Gakin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the crown know what you teach down here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the fel down here seep into the soil beneath the city, Gakin?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does the Slaughtered Lamb want from someone like me?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do you mean by that, Darkbinder?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    lamb = {
      lines = { { id = "l_default", text = "There's a tavern upstairs and a crypt downstairs. The drinkers upstairs don't ask, and we don't serve drinks, and most of the time that arrangement holds." } },
      choices = {
        { text = "And when it doesn't?", next = "lamb_noble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lamb_noble = {
      lines = { { id = "ln_default", text = "Then a lord with an unpaid bar tab finds out where we are and calls for an inquiry, as Lord Wishock has lately. Zardeth, upstairs, is keeping him busy, and don't ask how." } },
      choices = {
        { text = "I won't ask.", next = "BACK", reply = "Wise. Questions in this cellar have a way of being answered in person.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Blackmail, then.", next = "BACK", reply = "Such an ugly word. I prefer to call it the slow persuasion of a man with too many debts.", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    khaz = {
      lines = { { id = "k_default", text = "Gnomeregan trained the warlocks of Khaz Modan, once. Now Gnomeregan is poison and Ironforge watches its own too closely, so they send them here.",
        fx = { learn = { "gnomeregan" } } } },
      choices = {
        { text = "Is that a problem?", next = "khaz_attention" },
        { text = "Something else.", next = "BACK" },
      },
    },
    khaz_attention = {
      lines = { { id = "ka_default", text = "Crowded gets noticed, and noticed gets an inquiry. I'd rather teach ten students in the dark than forty in the light." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    surena = {
      lines = { { id = "s_default", text = "A good student, better than good, and that's what made it hurt. Don't bring her up again." } },
      choices = {
        { text = "She ran off with a Defias thief.", next = "surena_erlan", fx = { affinity = -1 } },
        { text = "I won't. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    surena_erlan = {
      lines = { { id = "se_default", text = "Erlan Drudgemoor, a thief with good teeth and no talent. I told you not to ask, and now you know why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    church = {
      big = true,
      lines = { { id = "c_default", text = "The Church prays the dark away. We bind it and put it where it can't wander. Ask your Archbishop which of us has fewer demons loose in Elwynn." } },
      choices = {
        { text = "Binding a demon is still using it.", next = "church_use", fx = { align = { light = 1 } } },
        { text = "You have a point.", next = "BACK", reply = "A point is all I need. Come down when you want the rest of the argument.", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    church_use = {
      lines = { { id = "cu_default", text = "Yes. So is a sword, and the Church blesses those. Go home. We'll both keep doing what we do, and the city will keep not asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Saying no to your imp. It'll ask for things, small things, every day, and the warlock who says yes to small things will say yes to large ones without noticing. After that, your curses, because a curse cast in haste lands on the caster." },
        { id = "practise_old", when = { minLevel = 30 },
          text = "Your circles, and your sleep. A tired warlock draws a crooked circle, and a crooked circle is an invitation. I've buried two students who forgot that." },
      },
      choices = {
        { text = "My imp doesn't ask for things.", next = "practise_imp" },
        { text = "I'll keep it short of everything.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    practise_imp = {
      lines = { { id = "practise_imp_l", text = "Then it's asking quietly, which is worse. Listen to it for a day and tell me I'm wrong." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    master = {
      big = true,
      lines = { { id = "master_l", text = "Whoever forgets first. The demon never forgets what it is, so the work is all on your side: remember, every hour, that it hates you, and that it's yours." } },
      choices = {
        { text = "Then I'll never forget.", next = "BACK", reply = "Good. Say it every morning, and you'll outlive most who come through that door.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little freedom makes a demon more useful.", next = "master_free", fx = { align = { order = -1 } } },
        { text = "It might stop hating me one day.", next = "master_hate" },
      },
    },
    master_free = {
      lines = { { id = "master_free_l", text = "That's what Surena said. Go on, then, and when the Watch asks me who taught you, I'll say I never met you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master_hate = {
      lines = { { id = "master_hate_l", text = "Then it's learned to lie better, and you've learned nothing. A demon that seems fond of you is studying you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    gnome_lock = {
      lines = {
        { id = "gnome_lock_l", text = "Then you learned from the books nobody was guarding when the city fell, and the books didn't tell you what they cost their last owners. I'll teach you that part, at least." },
        { id = "gnome_lock_texts", when = { origin = "gnome_forbidden_texts" },
          text = "You took them off the shelves while everyone else was running, I'd guess; I've had three gnomes down here with the same story. The books didn't tell you what they cost their last owners, so I will." },
      },
      choices = {
        { text = "A demon is only a system with inputs.", next = "gnome_lock_sys" },
        { text = "Then teach me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gnome_lock_sys = {
      lines = { { id = "gnome_lock_sys_l", text = "Systems don't want anything, and demons want you. Keep thinking like an engineer if it calms you, but check your gauges twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "others_l", text = "Ursula is stricter than I am and thinks I'm soft, Spackle sells grimoires like sweets, and Jennea Cannon would close this cellar tomorrow if she could. The Cathedral prays for us, which I've never once asked it to do." } },
      choices = {
        { text = "Maybe their prayers help.", next = "BACK", reply = "Perhaps they do, and I'll not tell the Archbishop otherwise. My demons have never minded.", fx = { align = { light = 1 } } },
        { text = "Prayers never bound a demon.", next = "BACK", reply = "No, they never have, though they've comforted a great many people standing behind my wards.", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    burning_legion = {
      { id = "tp_burning_legion", text = "The Burning Legion is the source of all fel magic, and those of us who study it know exactly what we're touching. Respect it, and it may serve you, but forget for an instant and it will devour you whole." },
      { id = "tp_burning_legion2", when = { class = "WARLOCK" }, text = "Never forget that the power you draw comes from the Legion's own fire. Bind it, master it, and never trust the voice that tells you you've mastered it." },
    },
    dark_portal = { { id = "tp_dark_portal", text = "The orcs came through the Dark Portal because a warlock opened it, and that's the reason Stormwind hates my kind. I don't blame them, but I'd note that the city still needed us when the demons came." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad made a bargain with the dead, and he paid for it with his life and his soul. I've made bargains too, but I always read the terms before I sign them." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal summoned beasts he couldn't control and called it a defence against the Scourge. That's the sort of mistake that gives my kind a bad name, and he deserves every word of it." } },
    knows = {
      { id = "tp_knows", text = "I know more than I say, which is the only sensible way to know anything in this cellar. Ask about these, and keep your voice down." },
    },
    background = { { id = "tp_bg", text = "My past is my business. Discretion is the first lesson, remember, and you've just failed it by asking." } },
    advice = { { id = "tp_ad", text = "Whatever a demon offers you, it's lying. Even the things that turn out true. Especially those." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan sent us its warlocks once, and now it sends us its refugees. I take both." } },
    _none = { { id = "tp_none", text = "I don't trade in answers I don't have. I barely trade in the ones I do." } },
  },
}

-- Innkeeper Allison: the Gilded Rose, Trade District.
P:NPC {
  key = "allison", id = TODO_NPC("Innkeeper Allison"), name = "Innkeeper Allison",
  bible = "bibles/city.md", role = "innkeeper", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "guest", "drink" },
  impression = {
    first = "Innkeeper Allison runs the Gilded Rose between the bank and the auction house, so she feeds the newly rich and the newly poor alike. She called me love before she even knew my name.",
    third = "{name} took a room at the Gilded Rose, where Innkeeper Allison keeps the fire lit for every tired traveler.",
  },

  greetings = {
    { id = "g_rose", text = "In you come. The Gilded Rose has a bed for every tired pair of boots." },
    { id = "g_home", when = { homeInn = { "Stormwind City", "Gilded Rose" } }, text = "Welcome home. Your room's aired and the fire's lit." },
    { id = "g_away", when = { away = 14 }, text = "Look who's back! You've been gone {away}, love, and your boots look every mile of it, so sit and I'll bring you something hot." },
    { id = "g_away_long", when = { away = 60 }, text = "Well, I'd half given you up, love, after {away} without a word. Come in and tell me everything over supper." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone was singing your praises at my bar the other night, love, and I told them I'd always known you were a good one." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard you put someone's back up in the city, love. Whatever it was, leave it at the door, because my common room's for resting." },
  },

  notice = {
    { id = "n_away", cat = "guest", when = { homeInn = { "Stormwind City", "Gilded Rose" }, daysSince = { min = 14 } },
      text = "There you are! Two weeks without a word, and I'd started wondering whether to let your room. I didn't, though I nearly did." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Someone's been to the Pig and Whistle first. Sit down, have some water and then some bread, and then we'll talk about wine." },
  },

  start = "hello",
  nodes = {
    dd_allison_h = {
      lines = {
        { id = "dd_allison_h_a", text = "Then you'll hear your own story told back to you before the night's out, and it'll be wrong in three places. The carter swore Hogger stood ten feet tall and spoke Common, which I very much doubt." },
      },
      choices = {
        { text = "Let them tell it however they like. It's done.", next = "dd_allison_h2", fx = { align = { honor = 1 } } },
        { text = "Ten feet tall is about right, actually.", next = "dd_allison_h2", fx = { align = { honor = -1 } } },
      },
    },
    dd_allison_h2 = {
      lines = {
        { id = "dd_allison_h2a", text = "Well, the city loves a story about a gnoll more than it loves the truth about one, and so do I, if I'm honest. Sit down and enjoy being famous for an evening; it won't last past the next fair." },
      },
      choices = { { text = "I'll enjoy it while I can. Something else.", next = "BACK" } },
    },

    xpt_allison = {
      big = true,
      lines = { { id = "xpt_allison_default", text = "Badly, love, and loudly. I've seen friends of ten years stop speaking over a single green ring, and I've seen a dwarf give away a whole sword because his friend looked at it the right way." } },
      choices = {
        { text = "Equal shares, counted fairly. That's the only way.", next = "BACK", reply = "That's how I'd have it, love, and I keep a pair of scales behind the bar for exactly that reason.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let each take what they can. That's how the road works.", next = "BACK", reply = "And that's how I lose a table and three chairs every month, love. Take it outside if you must.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Newly rich, newly poor, and everything between, love. A dwarf who talks to the wind is hardly the strangest, but you might be the politest." } },
      choices = {
        { text = "Then I'll keep up my manners and pay my tab.", next = "BACK", reply = "Then you're welcome back any time, love, and the window table's yours if it's free.", fx = { align = { honor = 1 } } },
        { text = "Strange guests pay double, I'd wager. Charge them for it.", next = "BACK", reply = "Double? I'd lose half my custom. Strange guests pay the same as anyone, so long as they don't break the furniture.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They do, quietly, and they tip well and break nothing, unlike the guests who've just got rich at the auction house and want the whole street to know it. I only ask that nothing comes out of a circle on my floorboards, love, because the last time I had the whole room re-scrubbed and it still smelled of sulphur." },
      },
      choices = {
        { text = "No circles on your floorboards, Allison. You have my word.", next = "BACK", reply = "Then you're welcome here, love, and I'll thank you not to prove me wrong.", fx = { align = { order = 1 } } },
        { text = "Your floorboards will survive, Allison. Probably.", next = "BACK", reply = "Probably, is it? Mind you're right, love, because I'll be checking under the rug in the morning.", fx = { align = { order = -1 } } },
        { text = "Something else, Allison.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'll keep the window open, love, but the shutters stay latched after dark, because this is the Trade District and not your forest. Last time I left one wide, a cat walked in and it turned out to be a guest." } },
      choices = {
        { text = "Your house, your rules, Allison. I'll wipe my boots.", next = "BACK", reply = "That's all I ask, love. The last druid tracked half of Elwynn up my stairs.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then I'll sleep in the Park, where nobody latches the sky.", next = "BACK", reply = "Suit yourself, love, though the sky leaks and my roof doesn't. The bed'll be here if you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They try, love, especially on market days when everyone's just been paid, but I've a nose for them now. I don't call the guards, mostly, because I'd rather pour them a bowl of stew and tell them to come back when they can pay for it." } },
      choices = {
        { text = "Call the guards, Allison, because thieves should answer to the law.", next = "BACK", reply = "Maybe I should, love, but a hungry thief with a full belly doesn't come back hungry. I'll think on it.", fx = { align = { order = 1 } } },
        { text = "A bowl of stew does more good than the Stockade.", next = "BACK", reply = "That's what I keep telling the guard captain, and he keeps telling me I'm soft. Maybe we're both right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The ones from out of town do, waiting on a place in the Sanctum or a word from Dalaran, and they're quiet guests, mostly. They read by candle till all hours, though, and I've lost more candles to the Kirin Tor than to thieves." } },
      choices = {
        { text = "They should pay for every candle they burn.", next = "BACK", reply = "They do, love, and I put the candles on the bill. It's the snoring at midnight I'd like to charge for.", fx = { align = { honor = 1 } } },
        { text = "A few candles are a fair price for clever company.", next = "BACK", reply = "They are, love, and I learn the oddest things from them over breakfast. Last week it was the moon's weight.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Officers, mostly, when they've leave and a bit of coin, and they're always the hungriest folk in the room. The privates drink in Old Town, and I'll admit I envy their stories more than their manners." } },
      choices = {
        { text = "Officers or privates, everyone deserves a good meal and a bed.", next = "BACK", reply = "That's the way I've always kept this house, love, and I'll keep it that way while I'm standing.", fx = { align = { order = 1 } } },
        { text = "Officers earn the better room. Rank has its privileges.", next = "BACK", reply = "Maybe, love, but the privates tip better, and they don't send their stew back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I would and I have, love, and the cook does a venison pie with Elwynn mushrooms that's half the reason anyone stays here. Bring me something fresh and you'll find the price of supper rather friendlier." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I would and I have, love, and the cook does a venison pie with Elwynn mushrooms that's half the reason anyone stays here. And who's this handsome thing? Keep {pet} by the hearth and out of the kitchen, and I'll find it a bone or two." },
      },
      choices = {
        { text = "I'll bring you good meat, cleanly hunted.", next = "BACK", reply = "Then I'll pay you fair and the cook'll be in raptures. Mind it's fresh, love.", fx = { align = { honor = 1 } } },
        { text = "I'll bring whatever I catch. Don't ask where.", next = "BACK", reply = "I never do, love, though if it's still wearing a noble's collar I'll want a word.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everyone who's just been to the auction house, love, and half of those who've been to the bank. Most only want a hot meal and someone to listen, and I do my best, but some of them want more than I've got to give." } },
      choices = {
        { text = "A kind ear is holy work, Allison, whatever you call it.", next = "BACK", reply = "That's a kind thing to say, love. I'll think of it when I'm wiping down the bar at midnight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Most troubles are self-made. A hot meal is plenty.", next = "BACK", reply = "Maybe so, love, but a self-made trouble still keeps you up at night. A hot meal and an ear never hurt.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only the once, when a pair of hard men tried to settle a debt in my common room. The guard came eventually, but it was a big lad from the Silver Hand who stood up first, and I've had a soft spot for your lot ever since." } },
      choices = {
        { text = "Any of us would stand up for your guests, Allison.", next = "BACK", reply = "That's a comfort, love, and you're always welcome at my fire for saying it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "That's the guard's job. A paladin has greater work.", next = "BACK", reply = "Maybe it is, love, but on that night the guard was late and the paladin was here. I'll take whoever's at the door.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_hogger_allison", when = { killed = { name = "Hogger" } },
          text = "A carter from Goldshire was in last week telling everyone that Hogger's finally dead, and he described the one who did it well enough that I think I'm pouring for them. That gnoll's been a fireside story in this city for years, so you've made yourself one too." },
        { id = "dd_deaths_allison", when = { deaths = { min = 20 } },
          text = "You look like a guest who's woken up in the Cathedral more often than in my beds, if you don't mind my saying. Take a room tonight and sleep in it properly, for once." },

        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Well, look at you, love, the spit of {alt}, who had the corner room last time the auction house was busy! Sit down and tell me straight whether you're cousins or I've just been working too long." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} was in only the other week, love, and sat in that very chair, and I swear the two of you must share a tailor. Now, what'll it be?" },
        { id = "h_pt_allison", tags = { "news" }, when = { party = true },
          text = "Oh, a whole party of you, love! Wipe your boots, the lot of you, and if you're going to argue about how to split the takings, do it at the corner table where the bankers can't hear." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, love! Sit down, you look like you've been up with the sick all night, and I've a pot of something hot on." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, love, in the Gilded Rose! Mind the doorframe with that hammer, and don't you go starting any fights with my regulars." },
        { id = "h_default", text = "Allison. The Gilded Rose, between the bank and the auction house, which means everyone who comes in has either just got rich or just got poor. I feed both." },
        { id = "h_new", when = { maxLevel = 12 },
          text = "First time in the city? It's loud, it's big, and the canals are deeper than they look. Stay here and you'll at least get a decent breakfast." },
        { id = "h_staghelm", when = { minLevel = 50 },
          text = "Word for seasoned folk: the Cenarion Circle in Darnassus wants help with some research. Arch Druid Staghelm himself is asking. I only pass it on." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Sit nearer the fire, there's a good soul. The last priest who stayed here blessed the bread, and I swear it rose better for a week." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Between the bank and the auction house, and you've the look of someone who knows exactly why that matters. Keep your hands to yourself in my common room, love." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! The last one of yours who stayed here conjured water for the whole kitchen, and I've been half in love with the Mage Quarter ever since." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Sit down before you fall down, love; you've the look of someone who's walked from Goldshire in full mail." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Wipe your boots, love, and if that's a fresh pelt you're carrying, leave it with the stable boy and not on my bar." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the Gilded Rose, love! I've had your people stay before, and they always ask for the window open and the fire out, which puts the other guests in a fright." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, love? You'll want a room on the back side, then, away from the guests who've just come from the Cathedral." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Hello, love. A shaman! Do your spirits drink? Because the Gilded Rose has a fine ale and no rule against anything that pays." },
      },
      again = {
        { id = "h_again", text = "What else, love? I've bread in the oven." },
        { id = "h_again2", text = "Anything more? The kettle's always on." },
      },
      choices = {
        { text = "I'm the one who killed Hogger, Allison.", next = "dd_allison_h", when = { killed = { name = "Hogger" } } },

        { text = "A room, please.", next = "BUSINESS" },
        { text = "You must hear all sorts in here.", next = "news" },
        { text = "The Gilded Rose sees all sorts, I'd wager.", next = "guests" },
        { text = "I'm from Westfall.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "Do you get many kaldorei at the Gilded Rose?", next = "kaldorei", when = { race = "NightElf" } },
        { text = "Pickpockets must love your common room, Allison.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I've seen a few mages staying at the Gilded Rose.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do many soldiers stay at the Gilded Rose, Allison?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would you cook up venison if a hunter brought it, Allison?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do people bring their troubles to the Gilded Rose, Allison?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Has the Gilded Rose ever needed a paladin, Allison?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you keep a room with the window open for a druid, Allison?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks stay at the Gilded Rose, Allison?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you get many strange guests at the Gilded Rose, Allison?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "How do companies usually split their takings here?", next = "xpt_allison", when = { party = true } },
        { text = "Just passing through.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Bankers complain about the nobles, nobles complain about the Regent, and everybody complains about Westfall. It's a normal week." } },
      choices = {
        { text = "Why does everyone complain about Westfall?", next = "news_westfall" },
        { text = "Ha. Thanks.", next = "BACK" },
      },
    },
    news_westfall = {
      lines = { { id = "nw_default", text = "Because bread costs more every month, and everybody knows where the wheat used to come from. Nobody says it at breakfast; they just butter thinner.",
        fx = { learn = { "westfall" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guests = {
      lines = { { id = "gu_default", text = "Bankers on their lunch, auction folk, and anyone who's just used the mailbox outside. That mailbox brings me more custom than the sign does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    westfall = {
      lines = { { id = "w_default", text = "Then you eat first. That's the rule in this house for anyone from Westfall. Don't argue with me; nobody wins that." } },
      choices = { { text = "I wouldn't dare.", next = "BACK", fx = { affinity = 2 } } },
    },
    kaldorei = {
      lines = { { id = "kaldorei_l", text = "A few, more every month, and they always ask for the room facing the Park. I've started keeping it for them, and I put fresh leaves on the sill now, because the first time I did, one of them thanked me in a language I didn't know." } },
      choices = { { text = "That's kind of you.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay rum is the best in the world, love, and I keep a bottle behind the bar for the ones who've earned it. I'll not say who those are, because they'd all want one." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sends its performers here when they're in the city, and they eat like wolves and tip like kings. I've never had a better week than the one when the fire-eaters stayed." } },
    deadmines = { { id = "tp_deadmines", text = "Most of the young adventurers who stay here are headed for the Deadmines, love, and the ones who come back won't tell what they saw. Some don't come back, and I keep their rooms a week before I let them." } },
    theramore = { { id = "tp_theramore", text = "They say Theramore's a lovely place, love, all sea air and soldiers, and the Lady Proudmoore runs it with a firm hand. I'd go if I didn't have a whole inn to keep, and I've a feeling I never will." } },
    knows = {
      { id = "tp_knows", text = "Lords, guardsmen and mud-booted adventurers all eat breakfast at my tables, and I hear every word over the porridge. Ask me about any of this, love, while the kettle's on." },
    },
    background = { { id = "tp_bg", text = "If I've a story, it happened while I was making breakfast, and I wasn't paying attention. Ask me about the guests instead." } },
    advice = { { id = "tp_ad", text = "Eat before you go out that gate. The road doesn't serve breakfast." } },
    westfall = { { id = "tp_westfall", text = "The farmers who come through from there look ten years older than they are. I feed them first." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I hear everything at breakfast." } },
  },
}
