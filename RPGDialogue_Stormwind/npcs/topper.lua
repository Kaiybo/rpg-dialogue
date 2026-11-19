-- Topper McNabb: beggar in the Trade District, once a farmer in Elwynn and then Westfall, never short of a story
-- and rarely telling the same one twice. The Topper McNabb patch (Stormwind 1.26.0). Voice: bibles/topper.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "topper", id = TODO_NPC("Topper McNabb"), name = "Topper McNabb",
  bible = "bibles/topper.md", role = "citizen", tier = "major",
  communities = { "stormwind" }, temper = { "dramatic", "warm" }, values = { "hopeful", "generous" },
  notices = { "wealth", "kit", "state", "status", "lock_stones", "lock_shadow" },

  barks = {
    { id = "b_spare", text = "A copper for an honest man! Or a dishonest one, I'm not proud!" },
    { id = "b_shine", text = "Armour shined, two coppers! One copper if you don't look too closely!" },
    { id = "b_blind", text = "Alms for a poor blind farmer! What's that? No, I meant the other kind of blind, the kind that's having a bad day!" },
    { id = "b_miracle", text = "Somebody bless me again, quick, before my eyes go back to how they were!" },
    { id = "b_weather", text = "Lovely weather for giving, friends, lovely weather for it!" },
    { id = "b_tale", text = "A story for a copper, two stories for two, and the third one's free because it's mostly lies!" },
  },

  impression = {
    first = "He says I have a generous face, and likely tells everyone.",
    third = "{name} met Topper McNabb, a cheerful beggar of the Trade District who used to work a farm and tells the story of losing it a different way every time.",
  },

  greetings = {
    { id = "g_coin", text = "Friend! That's a kind face, a generous face. Has anyone ever told you you've a generous face?" },
    { id = "g_back", when = { metBefore = true }, text = "My favourite benefactor returns! I've told everyone about you, though nobody believed me." },
    { id = "g_back_many", when = { timesTalked = { min = 6 } }, text = "There you are again! At this point the guards think you're my nephew, and I've not corrected them, because it's done wonders for my reputation." },
    { id = "g_away", when = { away = 14 }, text = "Well, look who's back after {away}! I kept your spot warm on the step, though in fairness it's my spot, and I keep it warm anyway." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Evening, friend, or morning, or whatever it is when the lamps are lit and the canal smells its worst. Come and talk, because talking keeps me warm." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Oh, my. Now, I'm not going to shout for the guards, friend, because a copper is the same colour whoever drops it, and you look like you've got a few." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear from {source} that you did somebody a good turn in this city. That's the sort of news that makes an old beggar hopeful, and hopeful beggars are terrible for business." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word on the step is you put somebody's back up today. Don't worry, friend, I've been chased out of better places than this, and I always found my way back." },
  },

  notice = {
    { id = "n_rich", cat = "wealth", when = { money = { min = 1000000 } },
      text = "Oh, that purse is heavy, I can hear it from here. It's calling to me, and it's saying 'Topper'." },
    { id = "n_poor", cat = "wealth", when = { money = { max = 100 } },
      text = "Your purse is as quiet as mine, friend, which makes us colleagues. Sit a while, but don't take the good step." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Rough day? I know rough days; I've had nothing but, since the farm. Sit down, though not too close, because you smell like a fight." },
    { id = "n_drunk", cat = "state", when = { drunk = { min = 2 } },
      text = "You've been at the Gilded Rose, I can tell, or the Pig and Whistle if you're braver than you look. I don't judge, friend, I only envy." },
    { id = "n_naked", cat = "state", when = { nearlyNaked = true },
      text = "Light's mercy, friend, where are your clothes? I've been poor six years and I've never once been that poor." },
    { id = "n_mounted", cat = "state", when = { mounted = true },
      text = "Mind the hooves, mind the hooves! I lost a toe to a carthorse in Goldshire once, and I've only the nine left to give." },
    { id = "n_tabard", cat = "status", when = { tabard = true },
      text = "A tabard and everything! You look like you belong to somebody, and nobody's claimed me since the farm went." },
    { id = "n_lock_healthstone", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "That green stone in your pocket is a warlock's healthstone, and I know because one of them pressed one into my hand last winter when I'd stopped feeling my feet. It saved me, and I've never once been warm since." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The pigeons all went up off the cobbles when you came round the corner, friend, and they don't do that for the guards. Not much frightens me anymore, but I'll admit the shadow on you made me pull my blanket closer." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Now where did they go? Twenty years of watching purses, and I still can't see the ones who don't want to be seen." },
  },

  start = "hello",
  nodes = {
    ----------------------------------------------------------------------------------------------
    -- The hub
    ----------------------------------------------------------------------------------------------
    hello = {
      lines = {
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Hold on, I know that face! No, I don't, I knew one just like it, a {altclass} called {alt} who stopped by my corner and was kind to an old farmer, so tell me, is that kin of yours?" },
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "You've the look of somebody with a soft heart, and I'd know, because {alt} had that same look and proved me right. Topper McNabb, friend, and my hat's right here." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} came by my corner the other day, and I told them all about you, though I couldn't swear I had your name right. You city folk come and go so fast I lose track of who's who." },
        { id = "h_default", key = true, text = "Topper McNabb, at your service, and a farmer once. Now I sit here and let the city walk past, and it never stops, but it rarely tips." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, with a generous face if ever I saw one. Spare a blessing for an old farmer, {class}, because it costs you nothing and it warms me through." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I always did think the Silver Hand would come to Westfall one day and put things right, and I'm still sitting here waiting for it." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "Bless me, would you, holy one? Go on, because I've been told I need it, mostly by the guards." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Now, I know that look, friend, because I had it myself in the lean year after the farm. Don't do it, because the Stockade's colder than the street." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Could you conjure me a bit of bread, friend? I hear your lot can make it out of nothing, and nothing's exactly what I have." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, walking by. I've watched a thousand soldiers go past this spot, and you lot always walk a little straighter going out than coming home." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You've the farm look about you, a bit, and I like that. Most of the city lot couldn't find a rabbit in a hutch." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and a kind face too. I had a field once, friend, and I'd have given anything for someone who could make the wheat come up in a dry year." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ah, someone from the Lamb, with a generous face like all the rest. Spare a copper for a farmer, and I'll not ask what's following you about." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A generous face, and a shaman too! Spare a coin for an old farmer? The spirits must favour a giving heart." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf, and you've come all the way down the tram to see me! I'm touched, friend, I'm truly touched, and I'll be more touched if you've a copper about you." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Well, hello down there! Mind the canal, little friend, because it's deeper than it looks and the guards fish things out of it slowly." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "One of the tall folk from over the sea! You'll forgive me staring, friend, because I'd not seen one of you until last spring, and now I can't stop seeing you everywhere." },
        { id = "h_sky", when = { race = "Skyborne" }, text = "Now there's a sight I didn't have on my list for today. You're very welcome, friend, whatever you are, and I hope your people tip." },
        { id = "h_horde", when = { faction = "Horde" }, text = "I ran from your sort once with a pitchfork in my hand, friend, and here we both are in Stormwind, older and poorer. If you're not here to burn anything, I'll talk to you." },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "Oh, you poor thing, you look worse off than I do, and I sleep under a bridge. Sit, sit, before somebody with a sword notices you." },
        { id = "h_vancleef", when = { cleared = "The Deadmines" }, text = "It's you! They're saying in the Trade District that somebody went down into the Deadmines and came back without the Defias, and I've been telling people I know you." },
        { id = "h_exalted", when = { reputation = { faction = "Stormwind", min = "exalted" } }, text = "Here comes Stormwind's favourite, and they let you talk to me anyway! I've seen the nobles nod to you, friend, and they don't nod to anybody." },
        { id = "h_hero", when = { minLevel = 55 }, text = "Now you, friend, you've been places, because I can see it on you the way you see weather on a farmer. Sit a minute and tell me a beggar's worth of it." },
        { id = "h_green", when = { maxLevel = 8 }, text = "Fresh out of Northshire, are you? I can always tell, because you still look at the city like it's going to give you something." },
        { id = "h_generous", when = { trait = "generous" }, text = "There's the generous face I was telling everyone about! It's real, friends, look at it, I didn't make it up!" },
        { id = "h_farmhand", when = { origin = "human_westfall_farmhand" }, text = "Hold on, I know those hands. Those are Westfall hands, friend, all blisters and dust, and I'd know them anywhere because I used to have a pair." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? I've all day, and I've had all day for years." },
        { id = "h_again2", text = "Still here? Wonderful, because company's free." },
        { id = "h_again3", text = "Go on, ask me something else. The auctioneers won't need my opinion until the evening rush." },
        { id = "h_again_night", when = { timeOfDay = "night" }, text = "What else, then? The lamplighter won't be round again for an hour, so it's just you, me and the canal." },
      },
      choices = {
        { text = "What happened to your farm?", next = "farm" },
        { text = "Here's a coin, Topper.", next = "coin", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "How do you get by out here?", next = "living" },
        { text = "Who else lives around here?", next = "district" },
        { text = "You must hear all the word on the street.", next = "news" },
        -- who you are
        { text = "I lost a farm too, to the Defias.", next = "farmer", when = { origin = "human_westfall_farmhand" } },
        { text = "I grew up on these canals, Topper. Remember me?", next = "o_canal", when = { origin = "human_canal_pickpocket" } },
        { text = "My family has lands in Westfall, Topper.", next = "o_noble", when = { origin = "human_minor_noble" } },
        { text = "My father was a stonemason. Did you know the guild?", next = "o_mason", when = { origin = "human_stonemason_child" } },
        { text = "I was born in Lakeshire, Topper.", next = "o_lakeshire", when = { origin = "human_redridge_born" } },
        { text = "I lost my home in Lordaeron. I know how it goes.", next = "o_lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "I lost my home too. Gnomeregan.", next = "o_gnomeregan", when = { origin = "gnome_gnomeregan_refugee" } },
        { text = "VanCleef is dead, Topper. I saw to it myself.", next = "k_vancleef", when = { cleared = "The Deadmines" } },
        { text = "Why talk to me? Most here would call the guards.", next = "k_horde", when = { faction = "Horde" } },
        { text = "You don't flinch at me, Topper. Why not?", next = "k_forsaken", when = { race = "Scourge" } },
        { text = "Do you ever get down to Ironforge, Topper?", next = "k_dwarf", when = { race = "Dwarf", faction = "Alliance" } },
        { text = "There seem to be a lot of gnomes in the city now.", next = "k_gnome", when = { race = "Gnome", faction = "Alliance" } },
        { text = "My people must have seemed strange when we came.", next = "k_nelf", when = { race = "NightElf" } },
        { text = "Have you ever seen anyone like me, Topper?", next = "k_sky", when = { race = "Skyborne" } },
        { text = "You've been staring at my hands, Topper.", next = "k_human", when = { race = "Human", faction = "Alliance" } },
        -- class
        { text = "Did you ever steal, Topper?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Conjured bread can't really fill you up.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You look like you've never carried a sword, Topper.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Did you hunt back on your farm, Topper?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you still pray, Topper, after losing the farm?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have the Silver Hand do for Westfall?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could your Westfall fields still grow again, Topper?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does my sort frighten you, Topper?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do the spirits owe a man like you, Topper?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today, Topper.", next = "END" },
      },
    },

    ----------------------------------------------------------------------------------------------
    -- The farm: a story told four ways, and once truly (sub-hub)
    ----------------------------------------------------------------------------------------------
    farm = {
      hub = true,
      lines = {
        { id = "f_default", text = "Ah, the farm. Now, which version would you like, friend? I've the one with orcs, the one with a dragon and the one with a lord and a wager, and they're all very good." },
        { id = "f_generous", when = { trait = "generous" }, text = "For you, friend, I'll tell any version you like, and I'll even tell it slowly. There's the orcs, the dragon and the lord's wager, so take your pick." },
      },
      again = {
        { id = "f_again", text = "Another version? I'm glad you asked, because I've been polishing them for six years." },
        { id = "f_again2", text = "Which one now? Mind, the dragon one gets bigger every time I tell it." },
      },
      choices = {
        { text = "Tell me the one with the orcs.", next = "f_orcs" },
        { text = "A dragon? Go on, then.", next = "f_dragon" },
        { text = "What wager? Which lord?", next = "f_wager" },
        { text = "Where was the farm, really?", next = "f_where" },
        { text = "Tell me what really happened, Topper. Just once.", tag = "Persuade", next = "f_truth",
          check = { pass = { any = { { disposition = { min = 62 } }, { trait = "generous" }, { origin = "human_westfall_farmhand" }, { timesTalked = { min = 5 } } } } },
          fail = { next = "f_truth_dodge", fx = { affinity = -1 } } },
        { text = "Enough about the farm.", next = "hello" },
      },
    },
    f_orcs = {
      big = true,
      lines = {
        { id = "fo_default", text = "Orcs burned it. Or the army built a guard tower right in front of it and the orcs came for the tower. Either way, I got the fire and the army got a medal." },
        { id = "fo_orc", when = { race = "Orc" }, text = "Your lot burned it, as it happens, or the army built a guard tower in front of it and your lot came for the tower. I got the fire and somebody got a medal, and I've decided not to hold it against you personally." },
      },
      choices = {
        { text = "That's a hard story, Topper.", next = "BACK", fx = { affinity = 1 } },
        { text = "Is any of that true?", next = "truth" },
        { text = "Which war was that, the first or the second?", next = "f_orcs_war" },
      },
    },
    f_orcs_war = {
      lines = { { id = "fow_default", text = "The first, friend, when they came up out of the Black Morass and through Elwynn like a grass fire. That was my father's farm, near Goldshire, and I was the boy holding the pitchfork and running the other way." } },
      choices = {
        { text = "So that was a different farm from Westfall.", next = "f_orcs_two" },
        { text = "Running kept you alive. Something else.", next = "BACK" },
      },
    },
    f_orcs_two = {
      lines = { { id = "fot_default", text = "Two farms, friend, two! The orcs had the first one off me, and after the second war I went west and got another, so I'm either very brave or very slow to learn." },
      },
      choices = {
        { text = "Then what took the Westfall farm?", next = "BACK", fx = { learn = { "westfall" } } },
        { text = "Very slow to learn, I'd say.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    truth = {
      lines = { { id = "t_default", text = "Some of it, depending on who's paying. If you're paying, then it's all true." } },
      choices = { { text = "Tell me another, then.", next = "BACK" } },
    },
    f_dragon = {
      lines = {
        { id = "fd_default", text = "A great black dragon, friend, as big as the Cathedral, came down out of the Redridge in the middle of the harvest and ate my barn whole, cows and all. Then it looked at me and decided I wasn't worth the bother, which hurt my feelings more than losing the barn." },
        { id = "fd_hero", when = { minLevel = 55 }, text = "A great black dragon, friend, came down out of the mountains and ate my barn whole, cows and all. You look like you've met a dragon or two yourself, so you'll know I'm only exaggerating a little bit." },
      },
      choices = {
        { text = "Dragons don't eat barns, Topper.", next = "f_dragon2" },
        { text = "Did anyone else see this dragon?", next = "f_dragon2" },
        { text = "A fine tale. Tell me another.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    f_dragon2 = {
      lines = { { id = "fd2_default", text = "Well, it was a very small barn, and the dragon might have been a lightning storm, and the cows might have wandered off to the Saldeans' on their own. But you've got to admit, friend, it's a better story with a dragon in it." } },
      choices = {
        { text = "A good lie beats a dull truth. I'll allow it.", next = "BACK", reply = "You're a generous soul, friend, and a rare one in this square. The cows thank you too, wherever they wandered.", fx = { align = { honor = -1 } } },
        { text = "A story told for coin should be an honest one.", next = "BACK", reply = "Honest? In the Trade District? You'd have me starve by Thursday, friend, but I'll give you a truer one next time for your trouble.", fx = { align = { honor = 1 } } },
        { text = "Something else, Topper.", next = "BACK" },
      },
    },
    f_wager = {
      lines = { { id = "fw_default", text = "This one's my favourite. A lord of the House of Nobles owned the land under my farm, and one night over cards he wagered all of Westfall's south road on a single hand, and lost it to a man in a red mask." } },
      choices = {
        { text = "A man in a red mask? You mean the Defias.", next = "f_wager2" },
        { text = "Which lord was it?", next = "f_wager_lord" },
        { text = "Nobody wagers a road on cards.", next = "f_wager2" },
      },
    },
    f_wager2 = {
      big = true,
      lines = { { id = "fw2_default", text = "All right, there were no cards. But the lords did leave Westfall to rot when the masons' money went missing, and the masons came back in red masks to take what they were owed, and my farm was standing in between them, so it's true in the way that matters." } },
      choices = {
        { text = "The masons were cheated. I can't blame them for being angry.", next = "BACK", reply = "Nor can I, most days, though I've the ashes of my own barn to argue with. Anger's a fire, friend, and it doesn't care whose roof it's on.", fx = { align = { order = -1 }, opinion = { defias = "masons_wronged" }, learn = { "defias", "stonemasons" } } },
        { text = "Being cheated is no excuse for burning farms.", next = "BACK", reply = "No, it isn't, and I'd tell VanCleef so to his mask if I saw him. But it's an explanation, friend, and explanations are what keep me up at night.", fx = { align = { order = 1 }, learn = { "defias", "stonemasons" } } },
        { text = "Tell me another version.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    f_wager_lord = {
      lines = { { id = "fwl_default", text = "I never knew his name, friend, and that's the truth for once. The rent man came every autumn with a seal I couldn't read, and I paid it to the seal, and I never once saw the face that owned it." } },
      choices = {
        { text = "So you paid rent to a stranger and lost it all.", next = "f_wager2" },
        { text = "Let's leave the lords out of it.", next = "BACK" },
      },
    },
    f_where = {
      lines = { { id = "fwh_default", text = "South of Sentinel Hill, on the road down to Moonbrook, forty acres of wheat and a pumpkin patch that won a ribbon at the Goldshire fair. That bit's true, friend, I'll swear to the pumpkins on anything you like." } },
      choices = {
        { text = "Who were your neighbours down there?", next = "f_neighbours" },
        { text = "Moonbrook? That's Defias country now.", next = "f_moonbrook", fx = { learn = { "moonbrook" } } },
        { text = "A ribbon for a pumpkin. Something else.", next = "BACK" },
      },
    },
    f_neighbours = {
      lines = {
        { id = "fn_default", text = "The Saldeans to the north, who still feed the whole Militia on a good week, and the Furlbrows by the road, with that old horse of theirs that never would pull straight. Good people, the lot of them, and I didn't say goodbye to any of them." },
        { id = "fn_farmhand", when = { origin = "human_westfall_farmhand" }, text = "The Saldeans and the Furlbrows, mostly, and you'll know them better than I do these days. Tell Verna Furlbrow that Topper's alive, if you're ever down that way, and don't tell her where." },
      },
      choices = {
        { text = "Why didn't you say goodbye?", next = "f_goodbye" },
        { text = "I know the Furlbrows. They're still there.", next = "f_furlbrows", when = { questDone = TODO_QUEST("Poor Old Blanchy") } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    f_furlbrows = {
      lines = { { id = "ff_default", text = "Still there, are they, and still in that cart by the road? Then they're braver than me, friend, and I'll drink to them tonight if anyone buys the drink." } },
      choices = { { text = "I'll tell them you asked after them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    f_goodbye = {
      lines = { { id = "fg_default", text = "Because I left in the night, friend, and that's as much of that story as you'll get without a better reason than curiosity. Ask me some other time, when I've had something to eat." } },
      choices = { { text = "I'll ask again another day.", next = "BACK", fx = { affinity = 1 } } },
    },
    f_moonbrook = {
      lines = { { id = "fm_default", text = "It was a market town when I sold my pumpkins there, with a smithy and a mill and a lass who sang outside the tavern on harvest nights. Now I hear the Brotherhood sits in the old houses and the mill grinds nothing, which is a sad thing to know about a place." } },
      choices = {
        { text = "The Militia will take it back one day.", next = "BACK", fx = { affinity = 1, learn = { "people_militia" } } },
        { text = "Some places don't come back.", next = "BACK" },
      },
    },
    f_truth_dodge = {
      lines = { { id = "ftd_default", text = "Really happened? Friend, that's a dreadful question to ask a man with nothing to sell but stories. Come back when you like me better, or I like you better, and we'll see." } },
      choices = { { text = "Fair. Another time, then.", next = "BACK" } },
    },
    f_truth = {
      big = true,
      lines = { { id = "ftr_default", key = true, text = "No orcs, no dragon, no cards. The rent went up and the rain didn't come, and one night men in red masks came and asked for a share of the harvest, and I said no, and they burned the barn to show me what no costs. So I put Elsie in the cart with a sack of seed potatoes and drove out before dawn, and I left the house standing and the gate open, and I never went back." } },
      choices = {
        { text = "You kept your wife alive. That's what mattered.", next = "f_elsie", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "You left your neighbours to face them alone.", next = "f_elsie", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "You keep mentioning Elsie.", next = "f_elsie" },
      },
    },
    f_elsie = {
      big = true,
      lines = { { id = "fe_default", text = "Elsie's my wife, friend, and still my wife, though she's in Lakeshire with her sister these four years. She stayed through two winters on the street with me, and on the third she said she'd wait for me in Redridge when I was a farmer again, and I've not been a farmer since." } },
      choices = {
        { text = "Then go to her, Topper. She said she'd wait.", next = "f_letters" },
        { text = "She may not know where you are.", next = "f_letters" },
        { text = "Redridge isn't safe these days. Is she all right?", next = "n_redridge" },
      },
    },
    f_letters = {
      big = true,
      lines = { { id = "fl_default", key = true, text = "I write to her every Winter Veil, friend, a good long letter, and I keep them all in my coat, because I've never once had anything good to put in one. Six letters, and each one says I'm doing very well in the city." } },
      choices = {
        { text = "Send them anyway. She'd rather have the truth than nothing.", next = "f_letter_read", fx = { affinity = 2, align = { honor = 1 }, letter = "topper_true_letter" } },
        { text = "Keep them. Some things are kinder left unsaid.", next = "f_letter_read", fx = { align = { honor = -1 } } },
        { text = "Would you read me one?", next = "f_letter_read" },
      },
    },
    f_letter_read = {
      lines = {
        { id = "flr_default", text = "Here's the end of last year's, the bit I'm proudest of: 'The city's kind to me, my love, and the King himself has asked my advice about the harvest.' I'm a very good liar on paper, friend; it's only in person that I get the giggles." },
        { id = "flr_lakeshire", when = { origin = "human_redridge_born" }, text = "Here's the end of last year's: 'Tell your sister the city's kind to me, and that I'll be along by the spring.' You're a Lakeshire face yourself, friend, so if you ever see a woman called Elsie McNabb by the lake, you never met me." },
      },
      choices = {
        { text = "I'll carry one to Lakeshire for you, if you like.", next = "f_letter_carry", when = { minLevel = 15 } },
        { text = "That's a good letter, Topper. A sad one, but good.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Let's talk about something lighter.", next = "hello" },
      },
    },
    f_letter_carry = {
      big = true,
      lines = { { id = "flc_default", text = "You'd do that? No, no, friend, put your hand away; I'm not ready, and a letter carried by a hero reads like a letter from a dead man. Ask me again next Winter Veil, and maybe I'll have written a true one by then." } },
      choices = {
        { text = "Next Winter Veil, then. I'll hold you to it.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "You're hiding behind those letters, Topper.", next = "BACK", fx = { affinity = -1, trait = { blunt = 1 } } },
      },
    },

    ----------------------------------------------------------------------------------------------
    -- Coin
    ----------------------------------------------------------------------------------------------
    coin = {
      lines = {
        { id = "c_default", text = "Bless you! I'll spend it wisely, on bread, probably bread, or possibly ale, but bread-adjacent ale." },
        { id = "c_rich", when = { money = { min = 1000000 } }, text = "Bless you, friend! Mind, from a purse that heavy, I'd hardly call it a coin so much as a crumb, but I'm a crumb man, and I'll take it gladly." },
        { id = "c_poor", when = { money = { max = 100 } }, text = "Oh, friend, you can't spare that, I can hear your purse weeping. I'll take it, mind, because I'm not a saint, but I'll think of you while I spend it." },
        { id = "c_generous", when = { trait = "generous" }, text = "Again! You're spoiling me, friend, and I'm letting you, because a beggar who refuses coin is a beggar who's misunderstood the work." },
        { id = "c_horde", when = { faction = "Horde" }, text = "Horde coin, in my hat! I'll have to bite it to be sure it's real, because nobody's going to believe me otherwise." },
      },
      choices = {
        { text = "Spend it on bread, Topper, not ale.", next = "coin_spend", fx = { align = { order = 1 } } },
        { text = "Spend it on ale. You've earned a drink.", next = "coin_spend", fx = { align = { order = -1 } } },
        { text = "A coin for a story, then.", next = "stories" },
        { text = "Your turn. Ask me something.", next = "asks" },
        { text = "What will you spend it on, really?", next = "coin_spend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coin_spend = {
      lines = { { id = "cs_default", text = "Bread, ale or supper for the Duchess, my cat, friend, whichever reaches me first. I'll raise a crust or a cup to you either way, and nobody will know which." } },
      choices = {
        { text = "People can't give you much.", next = "coin_who" },
        { text = "Good enough. Something else.", next = "BACK" },
      },
    },
    coin_who = {
      lines = { { id = "cw_default", text = "The poor give most and the rich give least, friend, and that's the first thing you learn on this step. Dwarves give generously and then tell you how to spend it, and the night elves give as if they're feeding a pigeon, gently and from a distance." } },
      choices = {
        { text = "I'd wager the nobles give the least of all.", next = "coin_nobles" },
        { text = "And adventurers like me?", next = "coin_adv" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coin_nobles = {
      big = true,
      lines = { { id = "cn_default", text = "A noble once gave me a whole silver, friend, and made his footman hand it over so he wouldn't have to touch my palm. I've never decided whether to be grateful or insulted, so most days I'm both." } },
      choices = {
        { text = "Charity from a glove is still charity. Be grateful.", next = "BACK", reply = "Oh, I was grateful, friend, grateful as a cat, and twice as quick about pocketing it. It's only the glove I've never forgiven.", fx = { align = { light = 1 } } },
        { text = "Charity that sneers isn't worth taking.", next = "BACK", reply = "Spoken like someone with supper waiting, friend. A silver's a silver, and I've never yet seen a sneer spoil bread.", fx = { align = { light = -1 } } },
      },
    },
    coin_adv = {
      lines = { { id = "ca_default", text = "Adventurers give in great fits, friend, a gold piece on the way back from somewhere awful, and nothing at all on the way out. So I always say a little prayer for you lot on the way out, because it's good business." } },
      choices = { { text = "Then pray for me next time I leave.", next = "BACK", fx = { affinity = 1 } } },
    },

    ----------------------------------------------------------------------------------------------
    -- Living on the step (sub-hub)
    ----------------------------------------------------------------------------------------------
    living = {
      hub = true,
      lines = {
        { id = "lv_default", text = "Oh, there's an art to it, friend, and I've had six years to learn it. There's the begging, the armour shining, the stories and the occasional miracle, and between them I eat most days." },
        { id = "lv_night", when = { timeOfDay = "night" }, text = "Nights are the hard part, friend, nights and winters. In the day there's the begging and the shining and the stories, and at night there's only the canal and the cat." },
      },
      again = {
        { id = "lv_again", text = "What else would you like to know about the beggar's trade? It's not secret, it's just not popular." },
        { id = "lv_again2", text = "Go on, ask. I've given lessons to cheaper folk than you." },
      },
      choices = {
        { text = "The occasional miracle?", next = "lv_blind" },
        { text = "I can't believe people pay for armour shining.", next = "lv_shine" },
        { text = "Where do you sleep?", next = "lv_sleep" },
        { text = "Do the guards trouble you?", next = "lv_guards" },
        { text = "Why not find honest work?", next = "lv_work" },
        { text = "Tell me one of your stories.", next = "stories" },
        { text = "Let's talk about something else.", next = "hello" },
      },
    },
    lv_blind = {
      lines = { { id = "lb_default", key = true, text = "I sit with a rag over my eyes and ask for alms for a poor blind man, and when a priest comes by and blesses me, I tear it off and shout that I can see. The crowd goes wild, friend, and you'd be amazed what people pay to watch a miracle they think they helped with." } },
      choices = {
        { text = "That's a lie told to kind people.", next = "lv_blind_stance" },
        { text = "Has anyone ever caught you out?", next = "lv_blind_caught" },
        { text = "It can't have worked on a real priest.", next = "lv_blind_priest" },
      },
    },
    lv_blind_stance = {
      big = true,
      lines = { { id = "lbs_default", text = "Is it, though? They give me a copper, they feel blessed, the priest feels holy, and I eat. I'd say that's the most honest bargain struck in the Trade District all week, and I've watched the auction house." } },
      choices = {
        { text = "Lying for coppers is still lying, Topper.", next = "BACK", reply = "Lying? I prefer to call it theatre, friend, and nobody calls the players at the Gilded Rose liars. Still, I'll take your point under my hat.", fx = { align = { honor = 1 } } },
        { text = "Everyone walks away happy. That's a fine trick.", next = "BACK", reply = "That's the spirit! You've a beggar's heart under all that gear, friend, and I mean it kindly.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Let's leave it there.", next = "BACK" },
      },
    },
    lv_blind_caught = {
      lines = { { id = "lbc_default", text = "Once, by a little girl from the orphanage, who walked up and asked why a blind man was counting his coins. I gave her one to keep quiet and she's been my business partner ever since, though she keeps very poor accounts." } },
      choices = {
        { text = "The orphans help you?", next = "d_orphans" },
        { text = "You were bribed by a child. Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    lv_blind_priest = {
      lines = {
        { id = "lbp_default", text = "That's the funny thing, friend. A priest from the Cathedral blessed me once, a proper one with the light coming off his hands, and I've seen sharper ever since, so now I have to squint on purpose to make the act look honest." },
        { id = "lbp_priest", when = { class = "PRIEST" }, text = "That's the funny thing, holy one. One of your lot blessed me once, a proper one with the light coming off his hands, and I've seen sharper ever since, so you'll understand why I'm nervous you'll do it again." },
      },
      choices = {
        { text = "Then let me bless you too, Topper.", next = "BACK", when = { class = { "PRIEST", "PALADIN" } }, fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "So the miracle was real. How about that.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lv_shine = {
      lines = {
        { id = "ls_default", text = "They do, friend, if they've a parade, or a lady to visit, or a sergeant who checks. I've a rag, a tin of goose fat and the patience of a saint, and I can get the mud off a breastplate in the time it takes the owner to complain about the price." },
        { id = "ls_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "They do, friend, and you'd be one of my best customers if you stood still. I've a rag, a tin of goose fat and the patience of a saint, and I can see from here you've got three days of road on those greaves." },
      },
      choices = {
        { text = "Goose fat? On armour?", next = "lv_shine2" },
        { text = "Who's your best customer?", next = "lv_shine_cust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lv_shine2 = {
      lines = { { id = "ls2_default", text = "Keeps the rust off and the rain out, friend, the same as it does on a plough. The smiths in the Dwarven District sell proper oil for ten times the price, but between us, it's goose fat with a dwarf's name on the jar." } },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } } },
    },
    lv_shine_cust = {
      lines = { { id = "lsc_default", text = "A sergeant of the guard, a big fellow who comes by every week before inspection and pays in pie. I've never asked his name, because the pie's better than a name, and I'm afraid he'd stop if we became friends." } },
      choices = {
        { text = "Pie's a fine wage.", next = "BACK" },
        { text = "So the guards treat you well?", next = "lv_guards" },
      },
    },
    lv_sleep = {
      lines = { { id = "lsl_default", text = "Under the arch where the canal goes under the road, friend, with a blanket, a crate and a one-eared cat I call the Duchess. She's no lady and she bites, but she keeps the rats honest, and that's more than the city does." } },
      choices = {
        { text = "Tell me about the Duchess.", next = "lv_duchess" },
        { text = "The winters are hard out here, I'd think.", next = "lv_winter" },
        { text = "Doesn't the Cathedral have beds?", next = "lv_cathedral" },
      },
    },
    lv_duchess = {
      lines = {
        { id = "ldu_default", text = "She turned up the first winter and ate half my supper, and I let her, and she's been eating half my supper ever since. If you see an orange cat with one ear and an opinion, don't feed her, because she's spoiled enough." },
        { id = "ldu_hunter", when = { class = "HUNTER" }, text = "She turned up the first winter and ate half my supper, and she's been doing it since. If your {pet} ever comes down by the canal, friend, tell it to mind its manners, because the Duchess has had bigger than it for breakfast." },
      },
      choices = { { text = "I'll keep an eye out for her.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    lv_winter = {
      lines = { { id = "lw_default", text = "The canal steams in the cold, friend, so it's warmer by the water than up on the street, and the Gilded Rose leaves its kitchen door open while the bread's baking. Still, every winter I count my toes in the spring, and every spring I've got the nine I started with, which is a good year." } },
      choices = {
        { text = "Nine? What happened to the tenth?", next = "lv_toe" },
        { text = "I'm glad you've got through them.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lv_toe = {
      lines = { { id = "lt_default", text = "A carthorse in Goldshire, outside the Lion's Pride, when I was seventeen and courting. The horse stood on it, Elsie laughed, and I married her a year later, so I've always thought it was a fair price for a toe." } },
      choices = {
        { text = "Who's Elsie?", next = "f_elsie", when = { heardLine = "topper.ftr_default" } },
        { text = "A fair price indeed. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lv_cathedral = {
      big = true,
      lines = { { id = "lc_default", text = "There's soup in the Cathedral square of an evening, and a bed for the night if you'll sit through a sermon first, which I do in the worst weeks. But a man likes his own bridge, friend, and a cold roof I picked suits me better than a warm one I was given." } },
      choices = {
        { text = "Pride won't keep you warm. Take the bed.", next = "BACK", reply = "You're probably right, and my back agrees with you. It's only that the sermon's long, and the Light makes me feel very small.", fx = { align = { order = 1 } } },
        { text = "A man should choose his own roof. I understand.", next = "BACK", reply = "Thank you, friend, that's a kindness most don't spare. The canal arches aren't much, but they don't ask me to repent.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lv_guards = {
      lines = {
        { id = "lg_default", text = "They move me along twice a day and I move back once, and that's the arrangement, friend. Most of them are farm boys themselves, and you can always tell the ones whose fathers lost land, because they move me gently." },
        { id = "lg_guard", when = { origin = "human_city_guard" }, text = "You'll know better than me, friend, since you've worn the blue. They move me along twice a day and I move back once, and the ones from farm families do it gently, which I've always appreciated." },
      },
      choices = {
        { text = "Do they ever arrest you?", next = "lv_stockade" },
        { text = "The guards have a job to do. Respect it.", next = "lv_guards_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lv_guards_stance = {
      big = true,
      lines = { { id = "lgs_default", text = "Oh, I do, friend, I respect it no end, especially the part where they don't do it very hard. A city needs its guards and it needs its beggars, because otherwise who would the guards have to chase?" } },
      choices = {
        { text = "Order is what keeps this city standing, Topper.", next = "BACK", reply = "It does, and I'd not want them gone, not with what's down in the Stockade. Only I'd like them to remember I'm part of the city too.", fx = { align = { order = 1 } } },
        { text = "A city that chases its poor has its priorities wrong.", next = "BACK", reply = "That's a sentiment I'll drink to, friend, if you're buying. Not that I'd ask, you understand.", fx = { align = { order = -1 } } },
      },
    },
    lv_stockade = {
      lines = { { id = "lsk_default", text = "Once, for the loaf, and one night in there was enough to cure me of thieving for good. That was before the riots, mind; I hear it's worse now, with Thredd's lot running the inside and the Warden pretending they don't." } },
      choices = {
        { text = "What riots?", next = "n_stockade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lv_work = {
      big = true,
      lines = { { id = "lwk_default", text = "I've tried, friend. I hauled stone for the masons till the masons went west in masks, and I swept the Pig and Whistle till they found a cheaper boy. Now I'm fifty-six with one good knee, and there's not a lot of call for a farmer in a city with no fields." } },
      choices = {
        { text = "A man who can work should keep looking.", next = "lv_work2", fx = { align = { order = 1 } } },
        { text = "This city owes you more than you owe it.", next = "lv_work2", fx = { align = { order = -1 } } },
        { text = "Is there nothing at all for you in this city?", next = "lv_work2" },
        { text = "The People's Militia might take you.", next = "lv_militia" },
      },
    },
    lv_work2 = {
      lines = { { id = "lw2_default", text = "Maybe there is, friend, and I'll think on it in the morning, which is when I do all my thinking. You've a decent way of putting hard things, and I don't meet many folk who bother." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    lv_militia = {
      lines = { { id = "lm_default", text = "Gryan Stoutmantle's lot at Sentinel Hill? They'd have me, I expect, because they take anyone who can hold a stick. But I've seen the red masks up close, friend, and I'm not a stick man, I'm a pumpkin man." } },
      choices = {
        { text = "They need farmers as much as fighters.", next = "BACK", fx = { learn = { "people_militia" } } },
        { text = "A pumpkin man. Fair enough.", next = "BACK", fx = { learn = { "people_militia" } } },
      },
    },

    ----------------------------------------------------------------------------------------------
    -- Stories for a copper (sub-hub)
    ----------------------------------------------------------------------------------------------
    stories = {
      hub = true,
      lines = { { id = "st_default", text = "A story! Now you're speaking my language, friend. I've the kobold and the candle, the murloc who followed me home, the gnoll who wanted my hat, and the day I met King Llane, and each one is at least partly true." } },
      again = {
        { id = "st_again", text = "Another? You're a dangerous audience, friend, because I never know when to stop." },
        { id = "st_again2", text = "Pick another. They get better the more you hear." },
      },
      choices = {
        { text = "The kobold and the candle.", next = "s_kobold" },
        { text = "A murloc followed you home?", next = "s_murloc" },
        { text = "Why did a gnoll want your hat?", next = "s_gnoll" },
        { text = "You met King Llane?", next = "s_llane" },
        { text = "Have you ever ridden the tram?", next = "s_tram" },
        { text = "That's enough stories for now.", next = "hello" },
      },
    },
    s_kobold = {
      lines = { { id = "sk_default", text = "I was hauling timber near the Fargodeep mine, friend, and a kobold jumped out and demanded my candle, and I said I hadn't got one, and he said 'You no take candle,' very sternly. So I gave him my lantern instead, and he was so pleased he went off and didn't come back, and I walked home in the dark." } },
      choices = {
        { text = "You gave a kobold your lantern?", next = "s_kobold2" },
        { text = "Ha! Another one.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    s_kobold2 = {
      lines = { { id = "sk2_default", text = "He wanted it more than I did, friend, and he had a pick. I've always thought a lot of trouble in this world would go away if people gave the kobolds their candles and walked home in the dark." } },
      choices = {
        { text = "Give way to every threat and you'll lose everything.", next = "BACK", reply = "You're likely right, and I've lost a farm and a lantern to prove it. Perhaps I'll stand my ground next time, friend, if the kobold's small.", fx = { align = { honor = 1 } } },
        { text = "Sometimes the lantern's not worth the fight. You were wise.", next = "BACK", reply = "Thank you, friend! You're the first to say so, and it's the best review that story's ever had.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "kobolds" } } },
      },
    },
    s_murloc = {
      lines = { { id = "sm_default", text = "Off the Westfall coast, friend, I was digging for clams and a little murloc came up out of the surf and followed me two miles inland, gurgling the whole way. Elsie wanted to keep it, and I said no, and it sat outside our gate for a week until a gull took a fancy to it." } },
      choices = {
        { text = "That's a sad end for a murloc.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Who's Elsie?", next = "s_murloc_elsie" },
        { text = "Good riddance. Murlocs are vermin.", next = "BACK" },
      },
    },
    s_murloc_elsie = {
      lines = { { id = "sme_default", text = "Oh, did I say Elsie? She's, well, she's my wife, friend, and she's not here, and that's a story that doesn't cost a copper, it costs more than that. Pick another one, won't you?" } },
      choices = { { text = "Another one, then.", next = "BACK" } },
    },
    s_gnoll = {
      lines = { { id = "sg_default", text = "A Riverpaw gnoll, friend, down by the Westfall border, who stopped me on the road and pointed at my hat and barked. I gave it to him, being sensible, and he put it on and looked so proud that I've never begrudged him it, though it was my good hat." } },
      choices = {
        { text = "You gave away your hat to a gnoll?", next = "s_gnoll2" },
        { text = "Is that why you're called Topper?", next = "s_name" },
      },
    },
    s_gnoll2 = {
      lines = { { id = "sg2_default", text = "My second-best hat, friend, the best one I keep for funerals. If you ever kill a gnoll in Redridge wearing a brown felt hat with a pheasant feather in it, would you tell him Topper says it suits him?" } },
      choices = { { text = "I'll pass it on.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    s_name = {
      lines = { { id = "sn_default", text = "No, friend, my mother named me Topper because I was the biggest baby in Elwynn and she said I'd top them all. I've been shrinking ever since, and I'm hoping to be the smallest beggar in Stormwind by the time I'm seventy." } },
      choices = { { text = "Ha! Tell me another one.", next = "BACK", fx = { affinity = 1 } } },
    },
    s_llane = {
      lines = { { id = "sl_default", text = "At the Goldshire harvest fair, friend, the summer before the orcs. King Llane rode through on a white horse and stopped at my father's stall and bought a turnip, and he said, 'That's a fine turnip, young man,' and I've not been so proud of anything since." } },
      choices = {
        { text = "Is that true?", next = "s_llane2" },
        { text = "What was he like?", next = "s_llane2" },
      },
    },
    s_llane2 = {
      big = true,
      lines = { { id = "sl2_default", text = "Tall, friend, and smiling, with a beard like a Westfall hayrick, and kind to a boy with a turnip, which is all I know about kings. Now there's another one off somewhere and a boy on the throne, and I hope somebody's buying that lad turnips." } },
      choices = {
        { text = "King Varian will come home. Stormwind will be whole again.", next = "BACK", reply = "I hope so, friend, truly I do, for the boy's sake as much as anyone's. I'll light a candle for it, if I can find a candle.", fx = { align = { order = 1 }, opinion = { stormwind_mood = "trust_crown" } } },
        { text = "Kings come and go. The city looks after itself.", next = "BACK", reply = "They do, and the city does, and I suppose I'm part of the looking after. A poor part, but a part.", fx = { align = { order = -1 } } },
        { text = "What do you hear about the king?", next = "n_king" },
      },
    },
    s_tram = {
      lines = { { id = "str_default", text = "Once, friend, all the way to Ironforge and back, because a gnome told me it was free and it was. Halfway along I looked out the window and there was a great fish looking back in at me, and I've not eaten fish since, out of respect." } },
      choices = {
        { text = "What did you think of Ironforge?", next = "s_tram2" },
        { text = "A fish, under the sea. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    s_tram2 = {
      lines = { { id = "st2_default", text = "Warm, friend, gloriously warm, with the forge going day and night, and I'd have stayed if the dwarves begged less sternly. A dwarf beggar will lecture you on your posture while he takes your coin, and I couldn't compete." } },
      choices = { { text = "That I believe. Something else.", next = "BACK" } },
    },

    ----------------------------------------------------------------------------------------------
    -- The neighbourhood (sub-hub)
    ----------------------------------------------------------------------------------------------
    district = {
      hub = true,
      lines = { { id = "di_default", text = "Who doesn't! I see the whole Trade District from this step, friend: the auction house, the Gilded Rose, the cheese shop, the canal and the little orphans who rob me. Ask about anyone you like." } },
      again = {
        { id = "di_again", text = "Who else? Everyone passes this step sooner or later, even the ones who pretend they don't see me." },
        { id = "di_again2", text = "Go on, name a door and I'll tell you what goes in and out of it." },
      },
      choices = {
        { text = "The auction house seems to do good business.", next = "d_auction" },
        { text = "There's always the Gilded Rose.", next = "d_rose" },
        { text = "Tell me about the cheese shop.", next = "d_cheese" },
        { text = "What do you see on the canal at night?", next = "d_canal" },
        { text = "The orphans rob you?", next = "d_orphans" },
        { text = "Have you met many gnomes since Gnomeregan fell?", next = "d_gnomes" },
        { text = "Enough about the neighbours.", next = "hello" },
      },
    },
    d_auction = {
      lines = { { id = "da_default", text = "The auctioneers are the only folk in Stormwind who charge you for letting them hold your money, friend, and the only ones who make it sound like a favour. I watched a man put up a sword for forty gold this morning and take home thirty-eight, and he thanked them." } },
      choices = {
        { text = "Do you ever bid on anything?", next = "d_auction2" },
        { text = "They earn their fee. Someone has to keep it honest.", next = "d_auction_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d_auction2 = {
      lines = { { id = "da2_default", text = "Once, friend, on a bolt of wool I'd been eyeing all winter, and I lost it to a gnome who bid one copper higher every time I did. I'm told he sold it again the same afternoon for twice the price, and I'm told he's very rich now." } },
      choices = { { text = "That sounds like a gnome. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    d_auction_stance = {
      big = true,
      lines = { { id = "das_default", text = "Honest, is it? Honest the way a scale is honest, friend, as long as you don't ask who made the weights. I don't begrudge them, mind, they tip better than the nobles." } },
      choices = {
        { text = "Fair trade needs rules. They keep the market straight.", next = "BACK", reply = "They do, friend, and they keep my pockets crooked. Still, I'll grant you the auctioneers don't cheat, they just charge for it.", fx = { align = { order = 1 } } },
        { text = "A market with a toll on every coin is a racket.", next = "BACK", reply = "That's what I said, friend, though not so loud, because one of them throws me a copper on Fridays.", fx = { align = { order = -1 } } },
      },
    },
    d_rose = {
      lines = {
        { id = "dr_default", text = "Allison runs the Gilded Rose, and she's the best thing about the Trade District, friend. She leaves the burnt ends of the loaves on the back step for me and pretends she's feeding the Duchess, and we've both kept the pretence up for five years." },
        { id = "dr_inn", when = { homeInn = { "Stormwind" } }, text = "That's your inn, isn't it? I've seen you go in. Allison leaves the burnt ends of the loaves on the back step for me, so when you sleep there, friend, you're keeping me fed, in a roundabout way." },
      },
      choices = {
        { text = "That's kind of her.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Do you ever go in?", next = "d_rose2" },
      },
    },
    d_rose2 = {
      lines = { { id = "dr2_default", text = "Once a year, friend, on the night of Winter Veil, when somebody always buys the beggar a drink so they can tell their friends they did. I sit by the fire and I don't say a word, and it's the best evening of my year." } },
      choices = { { text = "I hope someone buys you two this year.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    d_cheese = {
      lines = { { id = "dc_default", text = "Trias's place, the cheese shop on the corner. Lovely cheese, friend, but I've noticed that plenty of folk who go in come out without any, and some of them come out by the back door, which isn't how cheese works." } },
      choices = {
        { text = "They sound like trouble to me.", next = "d_cheese2" },
        { text = "Maybe they're just picky about cheese.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    d_cheese2 = {
      big = true,
      lines = {
        { id = "dc2_default", text = "Quiet folk in dark leathers, friend, who walk like they're trying not to be remembered, which is the surest way to be remembered by a man who watches doors for a living. Whatever they're buying in there, it isn't cheddar, and I've decided I'd rather not know." },
        { id = "dc2_rogue", when = { class = "ROGUE" }, text = "Folk who walk the way you walk, friend, quiet and remembering nothing. Whatever they're buying, it isn't cheddar, and I've decided I'd rather not know, so please don't tell me." },
      },
      choices = {
        { text = "Wise. Some secrets keep the city safe.", next = "BACK", reply = "Wise, aye, and I'll keep my nose out of it, friend. A beggar who sees too much doesn't stay a beggar very long.", fx = { align = { order = 1 } } },
        { text = "Secrets in this city usually hide rot.", next = "BACK", reply = "They do, friend, they do, but rot's not my business and breathing is. I'll keep my eyes on the cobbles.", fx = { align = { order = -1 } } },
      },
    },
    d_canal = {
      lines = { { id = "dcn_default", text = "Oh, all sorts, friend, lovers and drunks and smugglers mostly, and they all think a beggar under a bridge is part of the stonework. But there's one thing I've seen three times now that I'd rather not have seen at all." } },
      choices = {
        { text = "What did you see?", next = "d_canal2" },
        { text = "Then keep it to yourself.", next = "BACK" },
      },
    },
    d_canal2 = {
      big = true,
      lines = { { id = "dcn2_default", key = true, text = "A gentleman in a very fine cloak, friend, meeting a man dressed all in black by the water after midnight, and the fine one hands over a purse every time. They talk about Westfall, and they don't sound like men who want it to grow pumpkins again." } },
      choices = {
        { text = "You should tell the guards what you've seen.", next = "d_canal_stance", fx = { align = { order = 1 } } },
        { text = "Keep quiet. Men like that make beggars disappear.", next = "d_canal_stance", fx = { align = { order = -1 } } },
        { text = "I'm with the city watch. Describe the gentleman.", tag = "Deceive", next = "d_canal_who",
          check = { pass = { any = { { class = "ROGUE" }, { tabard = true }, { reputation = { faction = "Stormwind", min = "honored" } }, { disposition = { min = 60 } } } } },
          fail = { next = "d_canal_shut", fx = { affinity = -2 } } },
        { text = "Did you ever tell anyone?", next = "d_canal_stance" },
      },
    },
    d_canal_stance = {
      lines = { { id = "dcs_default", text = "And who'd believe me, friend, a beggar with stories about everything? That's the trouble with being a liar: the one time you see something true, you've already spent all your credit." } },
      choices = {
        { text = "I'd believe you, Topper.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    d_canal_who = {
      lines = { { id = "dcw_default", text = "The watch, is it? Well, then, the gentleman's tall and grey at the temples, friend, and he smells of old books and lavender, and he wears his rings even when he's trying not to be noticed. That's all I know, and I'd be grateful if my name stayed out of your report." } },
      choices = {
        { text = "Old books and lavender. I'll remember that.", next = "BACK", fx = { learn = { "defias" } } },
        { text = "You've done the city a service, Topper.", next = "BACK", fx = { affinity = 1, learn = { "defias" } } },
      },
    },
    d_canal_shut = {
      lines = { { id = "dcsh_default", text = "The watch, are you? Friend, I've sat on this step six years, and I know every face in the watch, and you're not one of them. I didn't see anything, and that's my final story." } },
      choices = { { text = "Fine. Something else, then.", next = "BACK" } },
    },
    d_orphans = {
      lines = {
        { id = "do_default", text = "The orphanage children, friend, the little ones who run errands about the city. They steal my hat on Mondays and bring it back on Tuesdays with something in it, an apple or a button or once a live frog, and I've decided that's a kind of rent." },
        { id = "do_canal", when = { origin = "human_canal_pickpocket" }, text = "You'd know, friend, you were one of them. They still steal my hat on Mondays and bring it back on Tuesdays with something in it, and I've decided that's a kind of rent." },
      },
      choices = {
        { text = "They sound like good children.", next = "d_orphans2" },
        { text = "A live frog?", next = "d_orphans2" },
      },
    },
    d_orphans2 = {
      lines = { { id = "do2_default", text = "The frog was Wednesday's lesson, friend, and it was a lesson about frogs. There are more of them every year, more orphans, I mean, not frogs, what with Westfall and Redridge and the war before that, and the Matron's doing what she can with very little." } },
      choices = {
        { text = "The city should do more for them.", next = "d_orphans_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d_orphans_stance = {
      big = true,
      lines = { { id = "dos_default", text = "The city should do more for a great many people, friend, and I'm at the end of a long queue. But the little ones ought to be at the front of it, and they're not, and that's the one thing on this step that makes me angry." } },
      choices = {
        { text = "The Light asks us to care for them. I'll do my part.", next = "BACK", reply = "Bless you for it, friend. The little ones by the canal will be glad of anything, even a kind word.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The streets make them tough. They'll manage.", next = "BACK", reply = "They do manage, friend, the way I manage, which is to say poorly and with a great deal of practice. Spare them a copper anyway.", fx = { align = { light = -1 } } },
      },
    },
    d_gnomes = {
      lines = {
        { id = "dg_default", text = "Plenty, friend, mostly in the Dwarven District, and some of them sleep rougher than me. One of them sat on my step for a week last winter and built me a little stove out of a pot and a lamp, and it exploded, but it was very warm until it did." },
        { id = "dg_gnome", when = { race = "Gnome" }, text = "Your people, friend, plenty of them, mostly in the Dwarven District. One sat on my step a week last winter and built me a stove out of a pot and a lamp, and it exploded, but it was very warm until it did, so tell your kin I'm grateful." },
      },
      choices = {
        { text = "They lost a whole city. You lost a farm.", next = "d_gnomes2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    d_gnomes2 = {
      lines = { { id = "dg2_default", text = "That's what I told myself, friend, sitting next to him, and it made me feel worse and better at the same time. He'd lost a whole city and he was still building stoves, and I'd lost forty acres and I was still sulking." } },
      choices = { { text = "You're not sulking, Topper. You're surviving.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, learn = { "gnomeregan" } } } },
    },

    ----------------------------------------------------------------------------------------------
    -- News from the street (sub-hub)
    ----------------------------------------------------------------------------------------------
    news = {
      hub = true,
      lines = { { id = "nw_default", text = "Ah, now you've found my real trade, friend, because nobody tells a beggar anything and everybody says it in front of one. Ask me about the king, Westfall, the Stockade, Redridge or the masons, and I'll tell you what the step has heard." } },
      again = {
        { id = "nw_again", text = "More news? It's a busy week on the step, friend." },
        { id = "nw_again2", text = "What else would you like to hear? I've half of what the guards say and all of what the washerwomen say." },
      },
      choices = {
        { text = "People talk about the king a lot, I notice.", next = "n_king" },
        { text = "Westfall seems to be in a bad way.", next = "n_westfall" },
        { text = "What happened at the Stockade?", next = "n_stockade" },
        { text = "What news from Redridge?", next = "n_redridge" },
        { text = "Who were the masons?", next = "n_masons" },
        { text = "And what's your news, Topper? Ask me something.", next = "asks" },
        { text = "That's enough gossip.", next = "hello" },
      },
    },
    n_king = {
      lines = { { id = "nk_default", text = "The king went off on some business of state, friend, and hasn't come home, and nobody in the Keep will say where. Young Anduin sits the throne with Lord Bolvar standing behind him, and the Lady Prestor standing behind Bolvar, and the people standing behind all of them, wondering." } },
      choices = {
        { text = "What do you make of Lady Prestor?", next = "n_prestor" },
        { text = "Bolvar's a good man. The city's in safe hands.", next = "n_king_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    n_prestor = {
      lines = { { id = "np_default", text = "She came through the Trade District once in a carriage, friend, and looked out the window right at me. Most nobles look through a beggar like he's a puddle, but she looked at me the way a cat looks at the Duchess's supper, and I went and sat somewhere else for the afternoon." } },
      choices = {
        { text = "You've an active imagination, Topper.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "I've heard others say something like that.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    n_king_stance = {
      big = true,
      lines = { { id = "nks_default", text = "A good man, yes, and a tired one, friend, and the nobles talk over him in council, or so the footmen tell me when they've had a drink. I'd sooner a tired good man than a rested bad one, but I'd like to see the king home all the same." } },
      choices = {
        { text = "The Crown will hold. Stormwind always holds.", next = "BACK", reply = "It always has, friend, though some years it's held by its fingernails. I'll hope with you.", fx = { align = { order = 1 }, opinion = { stormwind_mood = "trust_crown" } } },
        { text = "The nobles are running this city into the ground.", next = "BACK", reply = "You'll not get an argument from me, friend, though you might from the guard behind you. Mind your voice in the square.", fx = { align = { order = -1 } } },
      },
    },
    n_westfall = {
      big = true,
      lines = {
        { id = "nwf_default", text = "The Defias hold Moonbrook and the mines, the harvest rots in the fields, and the Crown sends letters instead of soldiers. Gryan Stoutmantle's People's Militia does what it can from Sentinel Hill, and every week another family comes up the road with a cart and stops at the gate looking like I looked." },
        { id = "nwf_vc", when = { cleared = "The Deadmines" }, text = "Better than it was, friend, now somebody's gone into the Deadmines and pulled the Brotherhood's head off. The farms are still burned and the harvest's still thin, but the families coming up the road this month say the nights are quieter, and that's a start." },
      },
      choices = {
        { text = "The Crown has abandoned Westfall. It's shameful.", next = "BACK", reply = "It is, and there's a farmer in me who weeps for it. Somebody ought to tell the Keep, and somebody ought to be you, not me.", fx = { align = { order = -1 }, opinion = { westfall = "abandoned" }, learn = { "westfall", "people_militia" } } },
        { text = "The Crown has many fires. Westfall must be patient.", next = "BACK", reply = "Patient? Westfall's been patient till the corn rotted, friend. But I'll grant the Crown's got a great many buckets and only one well.", fx = { align = { order = 1 }, opinion = { westfall = "patience" }, learn = { "westfall", "people_militia" } } },
        { text = "Would you ever go back?", next = "n_goback" },
      },
    },
    n_goback = {
      lines = {
        { id = "ngb_default", text = "Every night, friend, in my head, and every morning I'm still here. It's the gate I left open that keeps me away, I think, because a man who leaves his gate open doesn't get to complain about what wanders in." },
        { id = "ngb_vc", when = { cleared = "The Deadmines" }, text = "Now that VanCleef's gone? Maybe, friend, maybe, and that's the first time I've said maybe out loud. It's the gate I left open that keeps me here, but a gate can be shut again, can't it?" },
      },
      choices = {
        { text = "It's never too late to go home, Topper.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What gate?", next = "farm" },
      },
    },
    n_stockade = {
      lines = { { id = "ns_default", text = "The prisoners took it over, friend, with Bazil Thredd and the Defias' own men at the head of it, and the guards had to wall them up and wait. The Warden says it's all in hand, and he says it loudly and often, which is how you know it isn't." } },
      choices = {
        { text = "Thredd's finished. I saw to it.", next = "n_stockade_done", when = { cleared = "The Stockade" } },
        { text = "Who's Bazil Thredd?", next = "n_thredd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    n_thredd = {
      lines = { { id = "nt_default", text = "A Defias man, friend, caught and locked up and running the place from the inside, or so they say on the step. If you're brave enough to go in after him, ask the Warden, and watch how quickly he changes the subject." } },
      choices = { { text = "I'll keep that in mind.", next = "BACK" } },
    },
    n_stockade_done = {
      lines = { { id = "nsd_default", text = "Did you! Then the Warden owes you a drink and a thank you, friend, and you'll get neither, because he's still telling everyone it was all in hand. I'll tell the step it was you, though, and the step has a long memory." } },
      choices = { { text = "Tell them whatever makes the best story.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    n_redridge = {
      lines = {
        { id = "nr_default", text = "Blackrock orcs over the mountains and gnolls on the river, friend, and the Lakeshire folk building walls with whatever they've got. My Elsie's there with her sister, so I ask every soldier who passes for news, and they tell me it's fine, which soldiers always say." },
        { id = "nr_lake", when = { origin = "human_redridge_born" }, text = "You'd know better than me, friend, being from there. Blackrock orcs over the mountains and gnolls on the river, and my Elsie in Lakeshire with her sister, so tell me straight: is the town holding?" },
      },
      choices = {
        { text = "Lakeshire's holding. The Watch is strong.", next = "n_redridge2", fx = { affinity = 1 } },
        { text = "It's dangerous there. You should go to her.", next = "n_redridge2" },
        { text = "Who's Elsie?", next = "f_elsie", when = { heardLine = "topper.ftr_default" } },
      },
    },
    n_redridge2 = {
      lines = { { id = "nr2_default", text = "Thank you, friend, really, thank you. If you're ever through Lakeshire and you see a grey-haired woman beating a rug as if it owes her money, that's my Elsie, and you can tell her the city's been kind to me." } },
      choices = {
        { text = "And has it been kind to you?", next = "farm" },
        { text = "I'll look for her.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    n_masons = {
      lines = { { id = "nm_default", text = "They rebuilt this whole city after the orcs knocked it down, friend, every wall and bridge you're looking at. Then the nobles wouldn't pay them, and there was a riot, and the masons went west and put on masks, and now they're the Defias, and I sit under a bridge they built and beg from the folk who didn't pay them." } },
      choices = {
        { text = "The masons were wronged. Westfall is the price.", next = "n_masons_stance" },
        { text = "Did you know any of them?", next = "n_masons_knew" },
        { text = "Something else.", next = "BACK", fx = { learn = { "stonemasons" } } },
      },
    },
    n_masons_stance = {
      big = true,
      lines = { { id = "nms_default", text = "Wronged, aye, and then they wronged me, friend, and the farmers next door, so where does the wronging stop? I've thought about it many a night under that bridge, and I've never got further than being cold." } },
      choices = {
        { text = "The nobles started it. The blame is theirs.", next = "BACK", reply = "That's where it started, friend, I'll not argue. I only wish it had ended there instead of at my barn door.", fx = { align = { order = -1 }, opinion = { defias = "masons_wronged" }, learn = { "stonemasons", "defias" } } },
        { text = "Whatever the cause, the Defias are criminals now.", next = "BACK", reply = "They are, friend, criminals and worse, and they took my land to prove it. But I still remember them as masons buying a round.", fx = { align = { order = 1 }, learn = { "stonemasons", "defias" } } },
      },
    },
    n_masons_knew = {
      lines = { { id = "nmk_default", text = "I carried stone for one of their crews the first year, friend, a big quiet fellow who shared his lunch and taught me to lift with my knees. I saw his face once more, at Moonbrook, the night they came for the harvest, and he looked away first." } },
      choices = {
        { text = "He recognised you, then.", next = "BACK", fx = { learn = { "defias" } } },
        { text = "That must have been hard to see.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "defias" } } },
      },
    },

    ----------------------------------------------------------------------------------------------
    -- Topper asks back
    ----------------------------------------------------------------------------------------------
    asks = {
      lines = {
        { id = "as_default", text = "Me ask you? Well, all right: what brings you through Stormwind, friend? Most folk passing this step are going somewhere dangerous or coming back from it, and I like to guess which." },
        { id = "as_hero", when = { minLevel = 50 }, text = "Me ask you? Well, all right: where have you been, friend? You walk like someone who's seen the far side of the map, and I've only ever seen the near side of the canal." },
      },
      choices = {
        { text = "Gold. There's good money in trouble.", next = "asks_gold" },
        { text = "Duty. Stormwind needs defending.", next = "asks_reply", fx = { align = { order = 1 } } },
        { text = "I go where I please, and I please to wander.", next = "asks_reply", fx = { align = { order = -1 } } },
        { text = "I'm looking for something I lost.", next = "asks_lost" },
        { text = "I'd rather keep that to myself.", next = "asks_reply" },
      },
    },
    asks_gold = {
      lines = { { id = "asg_default", text = "Ha! An honest answer, and I've not heard one this week. If you make your fortune, friend, remember the step, and if you don't, remember the step anyway, because there's room on it." } },
      choices = { { text = "I'll remember the step.", next = "BACK", fx = { affinity = 1 } } },
    },
    asks_reply = {
      lines = { { id = "asr_default", text = "Well, friend, whatever it is, you said it like you meant it, and that's a rare thing on this road. Be sure you come back up this road, because I'd like to hear how it went, and I can't make up the ending myself." } },
      choices = { { text = "I'll come back and tell you.", next = "BACK", fx = { affinity = 1 } } },
    },
    asks_lost = {
      lines = { { id = "asl_default", text = "Aren't we all, friend? I lost forty acres and a wife and a good hat, and I'm still looking for all three in the bottom of my cup. I hope yours is easier to find than mine." } },
      choices = {
        { text = "A wife? You've never mentioned a wife.", next = "s_murloc_elsie" },
        { text = "I hope so too, Topper.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    ----------------------------------------------------------------------------------------------
    -- Origins
    ----------------------------------------------------------------------------------------------
    farmer = {
      lines = { { id = "fa_default", text = "Did you! Then you know, because nobody tells it right, the losing of a farm. You tell me yours sometime and I'll tell you mine, though mine's got more orcs." } },
      choices = {
        { text = "Mine's got more thieves.", next = "farmer2", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I'm going back one day to take it back.", next = "farmer_back" },
      },
    },
    farmer2 = {
      lines = { { id = "fa2_default", text = "More thieves, aye, they've had a busy few years down there. Where was yours, friend, near the coast or near the hill? No, don't tell me, because I'll only start crying, and it's bad for business." } },
      choices = { { text = "Near enough to yours, I'd wager.", next = "BACK", fx = { affinity = 1 } } },
    },
    farmer_back = {
      big = true,
      lines = { { id = "fab_default", text = "Are you, now? Then you're braver than me, friend, and younger, and you've a sword, which helps. Go and take it, and when you've ploughed the first furrow, send word to the step, and I'll know there's hope for an old fool too." } },
      choices = {
        { text = "Come with me, Topper. Westfall needs its farmers back.", next = "BACK", reply = "Me? Oh, friend, you'll make an old man weep in front of the auction house. Go on ahead, and I'll follow when my knees are braver.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The Militia will help me. We'll do it properly.", next = "BACK", reply = "Properly, with Gryan's lads, that's the way. Send me word when the first furrow's turned, and I'll drink to it twice.", fx = { affinity = 1, align = { order = 1 }, learn = { "people_militia" } } },
      },
    },
    o_canal = {
      lines = { { id = "oc_default", text = "Remember you? Light's mercy, you were the scrap who stole my hat four Mondays running and brought it back with a dead rat in it! Look at you now, friend, all grown and armed, and I'd still not turn my back on you." } },
      choices = {
        { text = "The rat was a gift, Topper.", next = "o_canal2", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I'm sorry about the hat.", next = "o_canal2", fx = { affinity = 1 } },
      },
    },
    o_canal2 = {
      lines = { { id = "oc2_default", text = "Never mind it, friend, I'd have done the same at your age, if I'd been half as quick. Just promise me you're not still at it, because I'd hate to see you in the Stockade, and I'd hate it more to lose my best story." } },
      choices = {
        { text = "I've left that life behind, Topper.", next = "BACK", reply = "Good, friend, good. The canal's no place to grow old in, and I should know, because I'm doing it.", fx = { align = { honor = 1 } } },
        { text = "Old habits. A purse here and there.", next = "BACK", reply = "Then watch your back, friend, and watch the guards, and watch me most of all, because I've nothing worth taking anyway.", fx = { align = { honor = -1 } } },
      },
    },
    o_noble = {
      big = true,
      lines = { { id = "on_default", text = "Does it, now? Then it's possible, friend, that your family's seal is the one the rent man carried, and that the house I left standing belongs to your cousin. I'll not hold it against you, but you might ask them, next time you dine, what happened to the folk who worked it." } },
      choices = {
        { text = "I'll ask. They should answer for it.", next = "BACK", reply = "You'd do that for me? Then you're a rarer sort of noble than I've met, friend, and I'll believe it when I see the rent man blush.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "My family kept its bargains. The land's still theirs.", next = "BACK", reply = "I'm sure they kept every bargain they wrote, friend. It's only that they wrote all the bargains.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "What was the seal like?", next = "f_wager_lord" },
      },
    },
    o_mason = {
      lines = { { id = "om_default", text = "Knew them? I hauled stone for them, friend, the first year after the farm, and I was the worst hauler they ever had. Your father might have been the big quiet one who taught me to lift with my knees, and if he was, he was kind to me." } },
      choices = {
        { text = "I've heard they became the Defias.", next = "n_masons" },
        { text = "Did he go west, after the riot?", next = "o_mason2" },
      },
    },
    o_mason2 = {
      lines = { { id = "om2_default", text = "Some went west and some stayed and some went to the bottle, friend, and I don't know which your father was. If he stayed, I'm glad, and if he went, I hope he looked away first, the way the one I knew did." } },
      choices = { { text = "Thank you, Topper. Something else.", next = "BACK", fx = { affinity = 1, learn = { "stonemasons" } } } },
    },
    o_lakeshire = {
      lines = { { id = "ol_default", text = "Lakeshire! Oh, friend, sit down, sit right down, because my wife's there and I've not heard a word in a year. Do you know a woman called Elsie McNabb, grey hair, beats her rugs like they owe her money?" } },
      choices = {
        { text = "I think I do. She's well, Topper.", next = "o_lakeshire_lie", tag = "Deceive",
          check = { pass = { any = { { class = "ROGUE" }, { disposition = { min = 55 } } } } },
          fail = { next = "o_lakeshire_caught", fx = { affinity = -1 } } },
        { text = "I'm sorry, I don't. Tell me about her.", next = "f_elsie" },
        { text = "Redridge seems to be in trouble.", next = "n_redridge" },
      },
    },
    o_lakeshire_lie = {
      lines = { { id = "oll_default", text = "Is she! Is she, though? Oh, friend, that's the best thing anyone's said to me since the King's turnip. Don't tell me any more, because I want to keep it just like that." } },
      choices = { { text = "Write to her, Topper.", next = "f_letters" } },
    },
    o_lakeshire_caught = {
      lines = { { id = "olc_default", text = "No, you don't, friend, I can see it in your face, and that's kind of you, but don't. I've told enough of those myself to know one coming the other way." } },
      choices = { { text = "I'm sorry. Tell me about her, then.", next = "f_elsie" } },
    },
    o_lordaeron = {
      lines = { { id = "olo_default", text = "Then you've lost more than me, friend, a whole kingdom where I lost a field. There's a few of your folk on the canal, come down from the north with nothing and talking about the dead walking, and nobody here quite believes them." } },
      choices = {
        { text = "They should believe them. I've seen it.", next = "o_lordaeron2" },
        { text = "Do you help them, out here?", next = "o_lordaeron2" },
      },
    },
    o_lordaeron2 = {
      lines = { { id = "olo2_default", text = "I show them the warm spot by the canal and the back step of the Gilded Rose, friend, which is all the help I've got. And I believe them, for what it's worth, because nobody lies that badly about something that sad." } },
      choices = { { text = "That's more help than most give.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    o_gnomeregan = {
      lines = { { id = "og_default", text = "Then you're one of the stove-builders, friend, and I've a debt to your people, or a burn, depending how you look at it. Do you think you'll ever get it back, your city?" } },
      choices = {
        { text = "We will. Gnomeregan will be ours again.", next = "o_gnomeregan2", fx = { align = { light = 1 } } },
        { text = "No. Some things are gone for good.", next = "o_gnomeregan2", fx = { align = { light = -1 } } },
        { text = "I don't know, Topper. I hope so.", next = "o_gnomeregan2" },
      },
    },
    o_gnomeregan2 = {
      lines = { { id = "og2_default", text = "Well, if a gnome can stand on my step and talk about a whole city like that, an old farmer can talk about forty acres without blubbing. Thank you, friend, that's done me more good than the coin would have, though I'd still take the coin." } },
      choices = { { text = "Here, then.", next = "coin", fx = { affinity = 1, trait = { generous = 1 }, learn = { "gnomeregan" } } } },
    },

    ----------------------------------------------------------------------------------------------
    -- Who you are: race, faction, deeds
    ----------------------------------------------------------------------------------------------
    k_human = {
      lines = { { id = "kh_default", text = "Have I? Forgive me, friend, it's a farmer's habit. You look at a man's hands to see whether he works the land or the sword or the quill, and yours tell me you've left something behind to come here, the same as me." } },
      choices = {
        { text = "I left Elwynn for something bigger.", next = "k_human2" },
        { text = "I'd rather not talk about what I left.", next = "BACK" },
      },
    },
    k_human2 = {
      lines = { { id = "kh2_default", text = "Bigger! That's what I said when I went west, friend, and I got forty acres, which was bigger, for a while. I hope yours is the right sort of bigger, and that it keeps you longer than mine kept me." } },
      choices = { { text = "Thank you, Topper.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_dwarf = {
      lines = { { id = "kd_default", text = "Once, friend, on the tram, and the dwarves were so kind I nearly wept, though they did keep telling me to stand up straight. Your folk have a way of giving you a coin and a lecture together, and I've come to value the lecture." } },
      choices = {
        { text = "Stand up straight, then, Topper.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "What did you think of the tram?", next = "s_tram" },
      },
    },
    k_gnome = {
      lines = { { id = "kg_default", text = "I like them, friend, more than I thought I would, because they lost more than any of us and they're still tinkering. One built me a stove that blew up, and I think of him every time I'm cold, which is fondly, mostly." } },
      choices = {
        { text = "That's very like us. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "Tell me about this stove.", next = "d_gnomes" },
      },
    },
    k_nelf = {
      lines = { { id = "kn_default", text = "I thought you were all very tall and very quiet, friend, and I was right on both counts. One of your Sentinels gave me a silver once without a word and walked on, and I've never felt so blessed and so small at the same time." } },
      choices = {
        { text = "We have known loss too, Topper. Long ago.", next = "k_nelf2" },
        { text = "Our folk give where they see need.", next = "k_nelf2" },
      },
    },
    k_nelf2 = {
      big = true,
      lines = { { id = "kn2_default", text = "Long ago, eh? Then you'll have had time to get over it, which gives me hope, friend, though I'm told your lot live ten thousand years, and I've only got another twenty in me if the winters are kind." } },
      choices = {
        { text = "Loss doesn't fade. You carry it, and walk on.", next = "BACK", reply = "Aye, that's it, friend, that's exactly it. You've the wisdom of ten thousand years, and I've the wisdom of a turnip.", fx = { align = { light = -1 } } },
        { text = "Even long grief heals, given light and time.", next = "BACK", reply = "Light and time, eh? I've a fair bit of time and not much light under the bridge, but I'll take your word for it, friend.", fx = { align = { light = 1 } } },
      },
    },
    k_sky = {
      lines = { { id = "ksk_default", text = "Never, friend, and I've seen all sorts from this step, including a goblin selling a dwarf his own beard. You're the newest thing to come past in years, and I'd very much like to hear where you're from, if it's not a secret." } },
      choices = {
        { text = "From very high up, Topper.", next = "k_sky2" },
        { text = "It's a long story.", next = "k_sky2" },
      },
    },
    k_sky2 = {
      lines = { { id = "ksk2_default", text = "High up and a long story, the two best things a traveller can have. You come back when you've a copper's worth of time, friend, and I'll trade you the dragon and the barn for it." } },
      choices = { { text = "It's a deal, Topper.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_horde = {
      big = true,
      lines = {
        { id = "kho_default", text = "Because I've nothing for you to take, friend, and nothing left to burn. I ran from your sort once, and I've run from my own sort since, and you get tired of running at my age." },
        { id = "kho_orc", when = { race = "Orc" }, text = "Because I've nothing left to burn, friend. I ran from an orc with a pitchfork in my hands in the First War, and now one's standing on my step being polite, and I'd like to see how the story ends." },
      },
      choices = {
        { text = "The old wars were wrong. We are not that Horde now.", next = "k_horde2", fx = { align = { light = 1 } } },
        { text = "War is war. Your people would have done the same.", next = "k_horde2", fx = { align = { light = -1 } } },
        { text = "I'm only passing through, old man.", next = "k_horde2" },
      },
    },
    k_horde2 = {
      lines = { { id = "kho2_default", text = "Maybe so, friend, maybe so, and it's a strange thing to hear in the middle of Stormwind. Now go quietly, and go quickly, because there's a guard coming round the corner who hasn't had my perspective on things." } },
      choices = {
        { text = "Thank you for the warning, old man.", next = "END", fx = { affinity = 2 } },
        { text = "One more thing first.", next = "BACK" },
      },
    },
    k_forsaken = {
      lines = { { id = "kf_default", text = "Because you look the way I feel some mornings, friend, and I've never had the heart to flinch at a mirror. Were you a farmer, before? You've got the shoulders of a man who hauled sacks." } },
      choices = {
        { text = "I was. In Lordaeron, before the plague.", next = "k_forsaken2" },
        { text = "I don't remember what I was.", next = "k_forsaken2" },
      },
    },
    k_forsaken2 = {
      big = true,
      lines = { { id = "kf2_default", text = "Then we're kin of a sort, friend, two men who lost the ground under them and kept walking about on it anyway. I won't tell the guards you were here, and I'll say a little prayer for whoever you used to be." } },
      choices = {
        { text = "Keep your prayers. The Light abandoned us.", next = "BACK", reply = "I'm sorry to hear it, friend, truly. I'll keep praying anyway, out of habit, and you needn't take any of it.", fx = { align = { light = -1 } } },
        { text = "Thank you. Perhaps someone is still listening.", next = "BACK", reply = "Someone is, friend, I'm sure of it. You did, didn't you, and you're not even a priest.", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    k_vancleef = {
      big = true,
      lines = { { id = "kv_default", key = true, text = "You did? You did. Oh, friend, give me a moment, because I've imagined someone saying that to me every night for six years, and in my head I always cheered, and now I find I want to sit down instead." } },
      choices = {
        { text = "He got what he deserved.", next = "k_vancleef2", fx = { align = { light = -1 } } },
        { text = "I take no joy in it. He was wronged once too.", next = "k_vancleef2", fx = { align = { light = 1 } } },
        { text = "Now you can go home, Topper.", next = "k_vancleef2" },
      },
    },
    k_vancleef2 = {
      lines = { { id = "kv2_default", text = "The barn's still burned, friend, and the masks will have new faces under them by spring, I don't doubt. But the man who started it is done, and that means somebody can start something else, and maybe that somebody's a pumpkin farmer with nine toes." } },
      choices = {
        { text = "Go home, Topper. Plant your pumpkins.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Write to Elsie first.", next = "f_letters", when = { heardLine = "topper.fl_default" } },
      },
    },

    ----------------------------------------------------------------------------------------------
    -- Class branches
    ----------------------------------------------------------------------------------------------
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Owe me? Nothing, friend, though I'd take a little rain on my old fields if they're handing it out. The war took the men and the bandits took the land, and here I am in the Trade District, and still there's always someone kind passing by." } },
      choices = {
        { text = "The spirits give to those who honour them.", next = "BACK", reply = "Then I'll honour them, friend, if they'll tell me how. A little rain on Westfall would make an old farmer weep.", fx = { align = { light = 1 } } },
        { text = "The spirits owe no one anything. Neither does the city.", next = "BACK", reply = "No, I suppose they don't, and the city's taught me that well enough. Still, a man can ask the sky for rain.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not much frightens me anymore, friend, after losing the farm and sleeping out here through a Stormwind winter. Your little friend looks like it's eaten better than I have this week, mind, and if it can spare a crust, I'll take it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Not much frightens me anymore, friend, after losing the farm and sleeping out here through a Stormwind winter. I'll say this for your {pet}, it gives off more warmth than my blanket, so if you're stopping a while, I'd not mind it standing a touch closer." },
      },
      choices = {
        { text = "Here's a coin for you, Topper, and nothing for my little friend.", next = "xlock2", fx = { align = { light = 1 } } },
        { text = "My little friend needs feeding more than you do, Topper.", next = "xlock2", fx = { align = { light = -1 } } },
        { text = "Has anyone like me ever offered you a bargain, Topper?", next = "xlock2" },
      },
    },
    xlock2 = {
      lines = { { id = "xl2_default", text = "Not yet, friend, and if that little thing ever offers me a bargain when you're not looking, I'll be saying no, and I'd be grateful if you'd back me up." } },
      choices = { { text = "It won't. You have my word.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They could, if the Defias stopped burning them and the rain remembered where Westfall is. I go back in my head every night and plough the same furrow, and in the morning I'm still in the Trade District." } },
      choices = {
        { text = "Westfall needs the Crown's soldiers before it needs farmers again.", next = "xdruid2", fx = { align = { order = 1 } } },
        { text = "Go back yourself, Topper. Waiting on the Crown won't plough anything.", next = "xdruid2", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What would it take to bring them back?", next = "xdruid2" },
      },
    },
    xdruid2 = {
      lines = { { id = "xd2_default", text = "Rain and peace, friend, and neither's mine to give. Tell me, can you lot really make wheat come up by asking it nicely? Because I asked mine very nicely for three years and it never listened." } },
      choices = {
        { text = "The land listens to those who listen back.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Sometimes the land simply needs rest.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a loaf, and I got caught before I'd eaten half of it, which taught me I was a farmer and not a thief. I've begged ever since, because at least the guards only laugh at a beggar." } },
      choices = {
        { text = "Begging's more honest than thieving, Topper, so you chose well.", next = "xrogue2", fx = { align = { honor = 1 } } },
        { text = "You were only caught once. You could have learned the trade.", next = "xrogue2", fx = { align = { honor = -1 } } },
        { text = "Anything a rogue should know around here?", next = "xrogue2" },
      },
    },
    xrogue2 = {
      lines = { { id = "xr2_default", text = "Well, I'll tell you one thing for nothing, friend, since you're in the trade: the cheese shop on the corner gets a great many visitors who don't care for cheese. I've no idea what that means, and I'd like to keep it that way." } },
      choices = {
        { text = "Wise of you, Topper.", next = "BACK" },
        { text = "Tell me more about these visitors.", next = "d_cheese2" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It's bread, isn't it, and bread's bread, though I've heard it sits in your belly like a promise from the House of Nobles. I'd still take it, because an hour's a long time when you're hungry." } },
      choices = {
        { text = "A hungry man deserves real bread, not a spell.", next = "xmage2", fx = { align = { light = 1 } } },
        { text = "Conjured or not, a meal's a meal, so take what you can.", next = "xmage2", fx = { align = { light = -1 } } },
        { text = "I'd guess a mage has never fed you before.", next = "xmage2" },
      },
    },
    xmage2 = {
      lines = { { id = "xm2_default", text = "A mage gave me a conjured loaf once, friend, and it was gone by morning, the bread I mean, not the mage. I'd eaten it, mind, so I can't say for certain whether it vanished or I did the vanishing, but I was hungry again by noon." } },
      choices = { { text = "That's how conjured bread works, I'm afraid.", next = "BACK", fx = { affinity = 1 } } },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A pitchfork, once, when the orcs came through Elwynn in the First War and we all thought we'd be heroes. I ran, if you want the truth, and I've never been ashamed of it, because I'm still here to sit on this step." } },
      choices = {
        { text = "There's no shame in living, Topper.", next = "xwarcl2", fx = { align = { honor = -1 } } },
        { text = "You don't run while others are still standing, Topper. Not ever.", next = "xwarcl2", fx = { align = { honor = 1 } } },
        { text = "What happened to the others who stood?", next = "xwarcl2" },
      },
    },
    xwarcl2 = {
      lines = { { id = "xw2_default", text = "My father stood, friend, at the gate with a scythe, and he was a braver man than me and a deader one. I think about that more than I'd like, and I've never decided which of us got it right." } },
      choices = {
        { text = "He did what he thought right. So did you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rabbits for the pot and foxes when they came for the hens, and I was never much good at either. My wife was the shot in our house; she could take a pheasant at fifty paces with a borrowed bow." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Rabbits for the pot and foxes when they came for the hens, and I was never much good at either. That's a fine beast, that {pet}. We had a dog once that would have chased it right up a tree and then sat under it barking until supper." },
      },
      choices = {
        { text = "A farm's beasts deserve protecting from the foxes.", next = "xhunt2", fx = { align = { order = 1 } } },
        { text = "The fox is only doing what it was made to do.", next = "xhunt2", fx = { align = { order = -1 } } },
        { text = "Your wife? Tell me about her.", next = "s_murloc_elsie" },
        { text = "Were you ever a good shot yourself?", next = "xhunt2" },
      },
    },
    xhunt2 = {
      lines = { { id = "xhu2_default", text = "I was a terrible shot myself, friend, and the foxes knew it. Keep that beast of yours away from the canal, mind, because the Duchess, my cat, doesn't share." } },
      choices = { { text = "You speak of the Duchess as if she's family.", next = "lv_duchess" }, { text = "Something else.", next = "BACK" } },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, for the crops I'll never see again and the neighbours who stayed when I left. I don't know that anyone's listening, but it's a habit, and an old man needs his habits." } },
      choices = {
        { text = "Someone is listening, Topper. Keep praying.", next = "xapriest2", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If no one answers, maybe it's time to stop asking.", next = "xapriest2", fx = { align = { light = -1 } } },
        { text = "Do you believe anyone is listening?", next = "xapriest2" },
      },
    },
    xapriest2 = {
      lines = { { id = "xap2_default", text = "You know, friend, a priest blessed me once and I could see better after, so perhaps there's something in it. I'll tell you about it some time; it's a good story, and it's the only one I've never had to make up." } },
      choices = { { text = "Tell me now, Topper.", next = "lv_blind_priest" }, { text = "Something else.", next = "BACK" } },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Drive the Defias out of Moonbrook, give the farms back to the folk who worked them, and make the nobles pay what they owe. I know it's not so simple, but you did ask, and an old man's allowed his dreams." } },
      choices = {
        { text = "Westfall deserves justice. I'll go and fight for it.", next = "xapala2", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The People's Militia can handle it. Westfall must save itself.", next = "xapala2", fx = { align = { honor = -1 } } },
        { text = "Is the Silver Hand still welcome in Westfall?", next = "xapala2" },
      },
    },
    xapala2 = {
      lines = { { id = "xpa2_default", text = "The Silver Hand's not what it was, friend, I know, with the north gone and the knights scattered. But a paladin walking down the Westfall road would still make the farmers stand up straighter, and a straight back on a frightened farmer is no small thing." } },
      choices = { { text = "Then I'll walk that road.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Oh, friend, you'll make an old farmer weep, and I've a reputation on this step to keep up. Nobody's said a thing so kind to me since the harvest fair, and that was a good many harvests ago." },
        { id = "s2", text = "Did you hear that, Stormwind? A person of quality, speaking well of Topper McNabb in broad daylight! I'll be dining on that for a week, which is as well, since I've little else." },
      },
      fail = {
        { id = "f1", text = "Now, friend, flattery's my own trade, and you're working my corner with it. I know a soft soaping when I hear one, having given so many." },
        { id = "f2", text = "That's very pretty, but I've been told I've a noble brow by people who then stepped over me. I'll believe the kind words when the kindness turns up with them." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Oh, that's good, that's better than the guards manage, and they've had years of practice on me. You've a wicked tongue, friend, and I like you the more for it." },
        { id = "s2", text = "You wound me, friend, you truly do, and I've not enjoyed a wounding so much since I lost the farm. Come and sit on the step, for there's room for another wit." },
      },
      fail = {
        { id = "f1", text = "There's no sport in kicking a man who's already sitting in the gutter, friend. The Defias took my farm, and I'd thought the city folk might leave me my pride." },
        { id = "f2", text = "I've been laughed at by half of Stormwind, and most of them at least tossed a copper after. You've given me the insult and kept the coin, which is the worst of both." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "He pulls his blanket up to his chin and edges along the step.", text = "Easy, friend, easy! I'm only a poor farmer with nothing worth the taking, and I'll tell you whatever you like if you'll stop looming over me." },
        { id = "s2", text = "There's no need for that, none at all! I bruise easy and I talk easier, so ask your question and you'll have your answer." },
      },
      fail = {
        { id = "f1", text = "Friend, I've slept under a bridge through three winters and been moved along by every guard in the city. You'll need something worse than a scowl to frighten Topper McNabb." },
        { id = "f2", text = "Go on and shout, then, with the whole street watching you bully a beggar. I've nothing left to lose, and you've a good name that you're spending." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "Ah, now, that's a tale I keep for my true friends, and we're not quite there yet, are we? Come by the step a few more times." },
      { id = "gt2", text = "I'll not be telling that one to just anybody, friend. Even a beggar's got a thing or two he doesn't give away." },
    },
    holy_light = { { id = "tp_holy_light", text = "The Light's been kind to me, friend, even if the world hasn't. I get soup from the Cathedral, and a smile from the priests, and I'll take both." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias took my farm, and now they're hiding in the old Moonbrook mines, they say. I'd go and ask for it back if I thought they'd listen." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire comes to Goldshire every so often, and I go and watch the lights from the road. I've never had the copper to go in, but the lights are free." } },
    second_war = { { id = "tp_second_war", text = "I was a farmer before the Second War and a farmer after it, and then the Defias came and I wasn't a farmer at all. The orcs never managed that, and I'll not forgive the Defias for doing what the orcs couldn't." } },
    background = { { id = "tp_bg", text = "Farmer, then not. The middle bit changes depending on who's listening and what they've got in their purse.", next = "farm" } },
    advice = { { id = "tp_ad", text = "Never farm in front of an army's guard tower; that one's free. The rest costs a copper." } },
    defias = { { id = "tp_defias", text = "They asked me to join, once, and I said I'd think about it. I'm still thinking, and it's very restful, thinking." } },
    westfall = { { id = "tp_westfall", text = "Forty acres south of Sentinel Hill and a pumpkin with a ribbon on it, friend. Ask me about the farm and I'll tell you a version.", next = "farm" } },
    stonemasons = { { id = "tp_masons", text = "They built the bridge I sleep under, friend, and never got paid for it, and now they're wearing masks. I try not to think about it when it rains.", next = "n_masons" } },
    stormwind = { { id = "tp_sw", text = "The finest city in the world to be poor in, friend, because at least the bridges are well made. I've tried the others in my head, and none of them have a Gilded Rose." } },
    people_militia = { { id = "tp_militia", text = "Gryan Stoutmantle's farmers with sticks, friend, and braver than me. If you're going down to Sentinel Hill, tell them Topper's thinking of them." } },
    gnomeregan = { { id = "tp_gnomer", text = "A whole city lost, friend, and the gnomes still smiling. It shames an old farmer, it really does." } },
    kobolds = { { id = "tp_kobolds", text = "Give them the candle, friend, and walk home in the dark. That's all the wisdom I have on kobolds." } },
    _none = { { id = "tp_none", text = "I know nothing, friend. But for a copper I'll know something." } },
  },
}
