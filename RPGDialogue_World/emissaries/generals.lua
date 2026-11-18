-- The capital officers who take one mark of honor from each battleground at once
-- ("Concerted Efforts" for the Alliance, "For Great Honor" for the Horde). Name-matched
-- wherever they stand. The Brigadier General sees one war on three fronts and three
-- allies who won't share a map table; the Warbringer sees the Horde proving itself, and
-- has no patience for anyone who stains that with the blood of civilians.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local ALL_MARKS = { all = { { carrying = 20558 }, { carrying = 20559 }, { carrying = 20560 } } }
local ANY_MARK = { carrying = { 20558, 20559, 20560 } }

---------------------------------------------------------------------------
-- Alliance Brigadier General
---------------------------------------------------------------------------
P:NPC {
  key = "emissary_brigadier", id = TODO_NPC("Alliance Brigadier General"), name = "Alliance Brigadier General",
  role = "soldier", tier = "quest",
  temper = { "gruff", "firm" }, values = { "practical", "loyal" },
  notices = { "pvp", "soldier" },

  impression = {
    first = "The Brigadier General is a grey-moustached human officer with ink on his cuffs and three battle reports open at once. He talks about Ashenvale, Arathi and Alterac as if they were one map, and he's plainly tired of being the only one who sees it that way.",
    third = "{name} met the Alliance Brigadier General, the officer who collects marks from all three battlegrounds and grumbles that the Sentinels, the Arathorians and the Stormpike will not fight as one army.",
  },

  greetings = {
    { id = "g_default", text = "Stand easy, soldier. If you've come from the front, I want to hear it, and if you haven't, I want to know why not." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, I see. Which front have you been bleeding on this week?" },
    { id = "g_marks", when = ANY_MARK, text = "Is that a mark of honor in your pack? Good, because a mark in a soldier's pack does the Alliance more good than a speech at a general's desk." },
    { id = "g_allmarks", tags = { "news" }, when = ALL_MARKS, text = "Ashenvale, Arathi and Alterac, all three in one pack! Now that is what I've been asking this army for, soldier." },
    { id = "g_rank", when = { pvpRank = 10 }, text = "{rank} {name}, as I live and breathe. I've signed your name on more commendations this season than my own." },
    { id = "g_young", when = { maxLevel = 19 }, text = "You're a little green for the fields yet, recruit, but the war will keep, I promise you that." },
  },

  notice = {
    { id = "n_rank_mid", cat = "pvp", when = { pvpRank = { min = 6, max = 9 } }, place = "before",
      text = "You wear that rank like you earned it in the mud, and I can tell the difference, believe me. Half the officers in this city earned theirs over dinner." },
    { id = "n_dishonor", cat = "pvp", when = { dishonorKills = { min = 1 } },
      text = "I've a report on my desk that names you in the matter of some dead Horde peddlers and stablehands. Those were not soldiers, and the next time it happens I'll want an explanation in writing." },
    { id = "n_kills", cat = "soldier", when = { honorKills = { min = 500 } },
      text = "You've a lot of Horde blood on your record, soldier, and I'm glad of every drop. Just be sure you're keeping count for the Alliance and not for yourself." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The Horde holds the Warsong Lumber Mill, the Defilers sit at Hammerfall, and the Frostwolves still own half of Alterac, so the Alliance has one war on three fronts. What I need are soldiers who understand that, and I'll take a mark of honor from each front as proof." },
        { id = "h_marks", when = ALL_MARKS, priority = 5,
          text = "A mark from Warsong Gulch, one from Arathi Basin and one from Alterac Valley, all in the same pack. Sit down, soldier, because you're the first person this week who's done what I asked." },
        { id = "h_rank", when = { pvpRank = 10 },
          text = "{rank}, welcome. I'll not waste your time with the speech I give recruits, since you've lived it, so tell me what you need and I'll tell you what the Alliance needs." },
        { id = "h_young", when = { maxLevel = 19 },
          text = "You've not stood in a battleground yet, have you, recruit? Come back when the Silverwing Sentinels will have you in Ashenvale, and we'll talk about the rest of it then." },
        { id = "h_dishonor", when = { dishonorKills = { min = 1 } },
          text = "I know your name, and not for the reasons you'd like. Cutting down Horde soldiers is your duty, but cutting down their cooks and their stable boys makes this army look like the beasts they call us." },
        { id = "h_ironforge", when = { zone = "Ironforge" },
          text = "The dwarves gave me a desk by the forge, and I've been sweating through my uniform ever since. The Stormpike are their kin, so you'd think they'd listen to me about Alterac, but you'd be wrong." },
        { id = "h_darnassus", when = { zone = "Darnassus" },
          text = "The Sentinels let me keep a desk up here among the trees, though I don't think they've ever once read my reports. Warsong Gulch is their fight, they tell me, and Alterac is the dwarves' problem." },
      },
      again = {
        { id = "h_again", text = "What else, soldier? The reports won't read themselves, but they can wait a moment." },
        { id = "h_again2", text = "Go on. I've time for anyone who's been to the front." },
        { id = "h_again3", text = "Ask, then, and I'll answer as straight as an old officer can." },
      },
      choices = {
        { text = "I have all three marks, General.", next = "turnin", when = ALL_MARKS },
        { text = "Why do you want a mark from every battleground?", next = "task" },
        { text = "Three fronts, one war? It doesn't feel that way.", next = "fronts" },
        { text = "This feels more like a bloody game with ranks than a war.", next = "sport" },
        { text = "Tell me about the battlegrounds themselves.", next = "fields" },
        { text = "What do the honor ranks mean to you?", next = "ranks" },
        { text = "I've earned a {rank}'s rank, General. What's next?", next = "k_rank", when = { pvpRank = 10 } },
        { text = "Those were Horde civilians. Why should I care?", next = "k_dishonor", when = { dishonorKills = { min = 1 } } },
        { text = "How old must I be to fight?", next = "k_young", when = { maxLevel = 19 } },
        { text = "The Sentinels don't need your help in Ashenvale.", next = "k_sentinel", when = { race = "NightElf" } },
        { text = "The Stormpike are my kin. Mind what you say.", next = "k_stormpike", when = { race = "Dwarf" } },
        { text = "I carry the flag in Warsong Gulch. Any advice?", next = "x_rogue", when = { class = { "ROGUE", "DRUID" } } },
        { text = "I'll be on my way, General.", next = "END" },
      },
    },

    -- The turn-in
    turnin = {
      big = true,
      lines = {
        { id = "ti_default", text = "Hand them over, then, and know that I'll send word to Silverwing Hold, Refuge Pointe and Dun Baldar that one soldier fought for all three. Tell me, why did you do it, when most folk only fight where the honor comes easiest?" },
      },
      choices = {
        { text = "Because the Alliance is one army, or it's nothing.", next = "BACK", reply = "Well said, soldier, and I'll put those very words in the report, because the generals need reminding of it more than you'd think. An army that fights only for its own valley loses all the others.", fx = { opinion = { alliance = "united" }, align = { order = 1 }, affinity = 1 } },
        { text = "Because I go wherever the best fight is.", next = "BACK", reply = "Ha, I had a sergeant like you once, and she was the best I ever served with, though I spent half my time pulling her out of fights she hadn't been invited to.", fx = { align = { order = -1 } } },
        { text = "The honor, General. I won't lie about it.", next = "BACK", fx = { trait = { honest = 1 } } },
      },
    },

    -- What he wants
    task = {
      lines = {
        { id = "tk_default", text = "Because any fool can win the same fight a hundred times over, and most of them do. A soldier who's carried a flag in Ashenvale, held a mine in Arathi and marched on Dun Baldar knows this war, and I want those soldiers counted." },
        { id = "tk_quest", when = { questActive = TODO_QUEST("Concerted Efforts") }, text = "You've already taken the order, so you know what I'm after: one mark from each field, carried in by the same hands. I want those soldiers counted, because they're the only ones who see the whole war." },
      },
      choices = {
        { text = "Counted by whom? Who reads your reports?", next = "task_reports" },
        { text = "Most soldiers prefer one field, you mean.", next = "task_favorites" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    task_favorites = {
      lines = { { id = "tf_default", text = "Most soldiers find a field they like and never leave it, so I have Warsong veterans who couldn't find the Stables in Arathi with a map, and Alterac men who've never seen a flag. It makes for a lopsided army, and the Horde knows it as well as I do." } },
      choices = {
        { text = "So you're trying to make us all-rounders.", next = "task_reports" },
        { text = "A specialist wins more often than an all-rounder.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    task_reports = {
      lines = { { id = "tr_default", text = "The marshals in Stormwind Keep, in principle, and in practice a clerk who files them under a stair. But the commanders at the three fronts do read who's fought for them, and every mark you bring me tells all three that you're one of theirs." } },
      choices = {
        { text = "Then I'll make sure they hear my name.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "A clerk under a stair. That sounds about right.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    -- The three allies who won't coordinate
    fronts = {
      lines = {
        { id = "fr_default", text = "It doesn't feel that way because nobody's running it that way, soldier. The Sentinels answer to Darnassus, the League of Arathor answers to whatever's left of Stromgarde, and the Stormpike answer to Vanndar and nobody else, so I've three allies and no army." },
      },
      choices = {
        { text = "Have you tried bringing them to one table?", next = "fronts_table" },
        { text = "They don't seem to trust each other much.", next = "fronts_trust" },
        { text = "Does Stormwind's regent back this war, General?", next = "regent" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    fronts_trust = {
      lines = {
        { id = "ft_default", text = "The elves think the dwarves dig too deep, the dwarves think the elves are too proud to ask for help, and the Arathorians think everyone else abandoned them years ago. They're all a little bit right, which is what makes it so hard to argue with them." },
        { id = "ft_human", when = { race = "Human" }, text = "The elves think the dwarves dig too deep, the dwarves think the elves are too proud, and the Arathorians think Stormwind abandoned them after the last war. You and I both know they're not entirely wrong about that last part." },
      },
      choices = {
        { text = "Then who's right?", next = "fronts_table" },
        { text = "Old grudges. Let me ask about something else.", next = "BACK" },
      },
    },
    fronts_table = {
      big = true,
      lines = { { id = "fb_default", text = "I tried, once, and the Sentinel captain spent the evening staring at the dwarf's pipe while the Arathorian asked who was paying for the supper. So I'll ask you instead: should the Alliance put one commander over all three fronts, or let each fight its own way?" } },
      choices = {
        { text = "One commander. An army with three heads loses.", next = "BACK", reply = "You'd have the Sentinels and the Stormpike agreeing for once, which is to say against you, but I've thought the same many nights, and I'll put it in my next letter to Stormwind.", fx = { align = { order = 1 } } },
        { text = "Let each fight its own way. They know their ground.", next = "BACK", reply = "That's the answer the captains themselves would give, and I suspect you're right, because a Sentinel in Ashenvale knows things about those trees that no general in Stormwind ever will.", fx = { align = { order = -1 } } },
        { text = "Who'd you pick to command it?", next = "fronts_who" },
      },
    },
    -- Opinion pass: the general asks what the player thinks of the throne and the war.
    regent = {
      big = true,
      lines = {
        { id = "rg_default", text = "Lord Bolvar signs my requisitions, which is more than the House of Nobles ever did, but he's holding a throne for a missing king and the nobles never let him forget it. Lady Jaina, meanwhile, writes from Theramore asking us not to provoke the Warchief. You've stood on the field, soldier, so tell me: is this war worth fighting?" },
        { id = "rg_peace", when = { opinion = { topic = "peace", stance = { "for", "mixed" } } }, text = "Lord Bolvar signs my requisitions and Lady Jaina writes from Theramore asking us not to provoke the Warchief, and I'm told you've some sympathy with her. Tell me plainly, then, soldier: is this war worth fighting?" },
      },
      choices = {
        { text = "Every inch we hold now is one the Horde can't take later.", next = "regent_war", fx = { opinion = { peace = "against", horde = "hate" }, align = { order = 1 } } },
        { text = "Lady Jaina's right. We're bleeding for fields, not for the Alliance.", next = "regent_peace", fx = { opinion = { peace = "for", jaina = "trust" }, align = { order = -1 } } },
        { text = "Lord Bolvar is a better leader than the nobles deserve.", next = "regent_bolvar", fx = { opinion = { bolvar = "respect" }, affinity = 1 } },
        { text = "Ironforge would have finished this already.", next = "regent_dwarf", when = { race = "Dwarf" }, fx = { opinion = { magni = "admire", stormwind = "slow" } } },
        { text = "I'd rather leave the throne to the people who sit on it.", next = "BACK" },
      },
    },
    regent_war = {
      lines = { { id = "rgw_default", text = "That's the soldier's answer, and I've given it myself to more than one marshal. Just remember that every inch has a name on it, and I'm the one who writes the letters home." } },
      choices = { { text = "Something else, General.", next = "BACK" } },
    },
    regent_peace = {
      lines = { { id = "rgp_default", text = "I'd not say that in Stormwind Keep, but I'll not have you flogged for saying it here. The truth is that I hope she's right, and I fight as though she isn't." } },
      choices = { { text = "Something else, General.", next = "BACK" } },
    },
    regent_bolvar = {
      lines = { { id = "rgb_default", text = "He is, and I'll drink to that in any company. I served under him once, and he learned every one of our names before the week was out." } },
      choices = { { text = "Something else, General.", next = "BACK" } },
    },
    regent_dwarf = {
      lines = { { id = "rgd_default", text = "Ironforge would have dug under it and blown it up, more likely, and called it finished. But the Stormpike are doing their part, and I'll not hear a word against them from anyone but a dwarf." } },
      choices = { { text = "Something else, General.", next = "BACK" } },
    },
    fronts_who = {
      lines = { { id = "fw_default", text = "Not me, if that's what you're asking, because I'm a desk officer and I know it. I'd want someone all three would follow, and the day I find such a person I'll pin every medal I own on their chest." } },
      choices = {
        { text = "Maybe it'll be someone who carries all three marks.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },

    -- War or sport
    sport = {
      big = true,
      lines = {
        { id = "sp_default", text = "I've heard that said in every tavern from Goldshire to Menethil, usually by men who've never stood on the field. The blood's real, the ground's real and the Horde would take every inch of it if we let them, though I admit the tabards and the weekly tallies make it look like a tourney. Which do you think it is?" },
        { id = "sp_rank", when = { pvpRank = 10 }, text = "You've climbed higher in those tallies than nearly anyone, {rank}, so you'd know better than I would. Is it a war you're fighting, or a ladder you're climbing?" },
      },
      choices = {
        { text = "It's a war, and we fight it for the Alliance.", next = "sport_war", fx = { align = { honor = 1 } } },
        { text = "It's a contest, and I mean to win it.", next = "sport_game", fx = { align = { honor = -1 } } },
        { text = "Why have ranks at all, if it's a war?", next = "ranks" },
      },
    },
    sport_war = {
      lines = { { id = "sw_default", text = "Good, because the Warsong are still cutting the forest down around Astranaar, and that's no game to the Sentinels who bury their sisters. Keep remembering that, especially on the day the tallies go your way." } },
      choices = {
        { text = "I'll remember, General.", next = "BACK", fx = { affinity = 1 } },
        { text = "And the Horde's dead? Are they a game?", next = "sport_horde" },
      },
    },
    sport_game = {
      lines = { { id = "sg_default", text = "Then win it, by all means, and I'll write you up for it like anyone else. But a soldier who fights for the tally fights hardest when it's easy, and I've seen too many of that kind vanish the week Alterac turned against us." } },
      choices = {
        { text = "I don't vanish, General.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Fair warning. Let's talk of something else.", next = "BACK" },
      },
    },
    sport_horde = {
      lines = { { id = "sh_default", text = "No, they're not, and I'll thank you not to say so in front of the recruits. An orc who dies holding the Blacksmith in Arathi died as well as any man of mine, and I'll hate him and respect him in the same breath." } },
      choices = { { text = "Then we agree on that much.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    -- The battlegrounds (sub-hub)
    fields = {
      hub = true,
      lines = { { id = "fd_default", text = "Three fields, three allies and three ways of losing, soldier. Which do you want to hear about?" } },
      again = {
        { id = "fd_again", text = "Which other field? I've a report open on each of them." },
        { id = "fd_again2", text = "Pick another and I'll tell you what's going wrong there." },
      },
      choices = {
        { text = "Warsong Gulch.", next = "wsg" },
        { text = "Arathi Basin.", next = "ab" },
        { text = "Alterac Valley.", next = "av" },
        { text = "Enough about the fields.", next = "hello" },
      },
    },
    wsg = {
      lines = { { id = "wsg_default", text = "The Warsong Outriders have a lumber mill in that gulch and the Silverwing Sentinels want it burned, so we raid it for their flag and they raid Silverwing Hold for ours. It's the smallest of the three fields and the angriest, because the elves take every tree personally." } },
      choices = {
        { text = "Why steal a flag? Why not burn the mill?", next = "wsg_flag", fx = { learn = { "warsong" } } },
        { text = "Another field, General.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    wsg_flag = {
      lines = { { id = "wsgf_default", text = "Because the orcs would only build another, and a mill's easy to rebuild while a stolen banner is shame that lasts. Every flag that comes back to Silverwing Hold tells the Warsong their camp isn't safe, and frightened loggers cut fewer trees." } },
      choices = { { text = "Shame as a weapon. I like it.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    ab = {
      lines = { { id = "ab_default", text = "The League of Arathor wants their homeland back, and the Defilers out of Hammerfall want it buried. There are five points in the basin, the Stables, the Gold Mine, the Lumber Mill, the Blacksmith and the Farm, and whoever holds the most of them feeds their army." } },
      choices = {
        { text = "Which point matters most?", next = "ab_point" },
        { text = "The Defilers are Forsaken, aren't they?", next = "ab_defilers" },
        { text = "Another field, General.", next = "BACK" },
      },
    },
    ab_point = {
      lines = { { id = "abp_default", text = "The Blacksmith, if you ask me, since it sits in the middle and sees every road, though the Arathorians swear by the Stables because it's closest to their camp. They'll argue over it all night, so I've stopped asking." } },
      choices = { { text = "Another field, then.", next = "BACK" } },
    },
    ab_defilers = {
      lines = { { id = "abd_default", text = "Forsaken, and the cruellest lot the Horde has sent, from what the Arathorians tell me. They're not out for land so much as for the people on it, and so the League fights that basin like a family defending its own farm." } },
      choices = { { text = "Then I'll fight it the same way.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    av = {
      lines = { { id = "av_default", text = "That's the big one, soldier, a whole valley of it. Vanndar Stormpike's dwarves came to dig at Dun Baldar, Drek'Thar's Frostwolves say the valley was theirs first, and the two of them have been killing each other in the snow ever since." } },
      choices = {
        { text = "Were the Frostwolves there first?", next = "av_first" },
        { text = "Another field, General.", next = "BACK" },
      },
    },
    av_first = {
      big = true,
      lines = { { id = "avf_default", text = "They were, and I'll say it here though I'd not say it in Ironforge. Gul'dan exiled Durotan's clan into those mountains before the First War, and they made a home of it, but the Stormpike are Alliance and Alterac's under Alliance banners now, so what would you have me do with a fact like that?" } },
      choices = {
        { text = "Nothing. Alliance land is Alliance land.", next = "BACK", reply = "That's how Stormwind sees it, and Ironforge too, and I'll not argue with you in front of the men. But I've found it pays to know the enemy's reasons, even when I've no use for them.", fx = { opinion = { alterac_valley = "alliance" }, align = { light = -1 } } },
        { text = "Remember it. Even an enemy can have a just claim.", next = "BACK", reply = "That's a rare thing to hear in a soldier, and I'll admit I've thought it myself on cold nights. A just claim doesn't make the Frostwolves our friends, but it might keep us honest in how we fight them.", fx = { opinion = { alterac_valley = "frostwolf" }, align = { light = 1 } } },
        { text = "Another field.", next = "BACK" },
      },
    },

    -- Ranks
    ranks = {
      lines = {
        { id = "rk_default", text = "The ranks were the marshals' idea, so the army could see who's doing the fighting without reading my reports. Private to Grand Marshal, all of it counted weekly, and I'll tell you plainly, it's made men fight harder and some of them fight worse." },
      },
      choices = {
        { text = "Fight worse? How so?", next = "ranks_worse" },
        { text = "Who decides the standings?", next = "ranks_tally" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    ranks_worse = {
      lines = { { id = "rw_default", text = "They chase kills instead of objectives, soldier, so I've seen a whole squad leave a flag carrier to die because there was a Horde healer to be had down the hill. A rank should be a promise of duty, not a prize for counting heads." } },
      choices = {
        { text = "Then reward the objectives, not the kills.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Kills win wars too, General.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    ranks_tally = {
      lines = { { id = "rt_default", text = "Every week the honor's reckoned and the ranks are set against everyone else's, so a soldier who rests a week can slip down while a keener one climbs past. It's a harsh way to run an army, but it does keep everyone on the field." } },
      choices = { { text = "Harsh and effective. Typical of Stormwind.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    -- Who the player is
    k_rank = {
      big = true,
      lines = { { id = "kr_default", text = "What's next is the hardest part, {rank}, which is staying worthy of it when nobody's watching. The recruits copy everything you do, so tell me: do you lead them, or do you let them find their own way?" } },
      choices = {
        { text = "I lead them. A rank is a duty to the men below.", next = "BACK", reply = "That's the right answer, and the one I'd hope for, because the men below you will forgive a hard order far sooner than they'll forgive an empty saddle in front of them.", fx = { align = { order = 1 } } },
        { text = "They find their own way, as I did.", next = "BACK", reply = "I suppose that worked for you, and you turned out well enough, but not all of them have your luck, and some won't live long enough to learn what you did.", fx = { align = { order = -1 } } },
        { text = "I hadn't thought of it that way.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    k_dishonor = {
      big = true,
      lines = { { id = "kd_default", text = "Because word of each one reaches Orgrimmar, soldier, and the Horde's officers make sure their grunts hear it before every battle. Each dead cook puts another angry orc on the field against us, so do your killing where it does the Alliance some good." } },
      choices = {
        { text = "You're right. I'll keep my blade for soldiers.", next = "BACK", reply = "Good, because the Alliance needs every blade you've got, and I'd rather you spent your anger on men who can fight back than give the Horde another grievance.", fx = { align = { honor = 1 } } },
        { text = "The Horde's all the same to me, armed or not.", next = "BACK", reply = "Then the Horde will be all the same to them about you, soldier, and they'll come for every farmer in Arathi just as you came for their cooks. Think on that before your next battle, I beg you.", fx = { opinion = { horde = "hate" }, align = { honor = -1 } } },
        { text = "They keep a list?", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    k_young = {
      lines = { { id = "ky_default", text = "Warsong Gulch takes recruits the youngest, and the Sentinels will have you sooner than you think. Arathi wants you a little more seasoned, and Alterac wants a veteran, so grow into it, recruit, and don't be in a hurry to see the inside of a graveyard." } },
      choices = {
        { text = "I'll be ready when they call.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'll take my time, General.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    k_sentinel = {
      lines = { { id = "ks_default", text = "The Sentinels don't need my help, no, but they could use a few more warm bodies at Silverwing Hold, and I can send them. I mean no insult to your sisters, friend, but even the finest archers in the world can only hold so many trees." } },
      choices = {
        { text = "Send them, then. We'll make use of them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Ashenvale is ours to defend.", next = "BACK", fx = { trait = { proud = 1 } } },
      },
    },
    k_stormpike = {
      lines = { { id = "kst_default", text = "I mind every word, friend, because Vanndar's dwarves are the finest soldiers in the valley and the worst correspondents I've ever had. If you've any kin at Dun Baldar, ask them to write to me once a season, and I'll stop grumbling about them." } },
      choices = {
        { text = "Dwarves dig. They don't write letters.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'll pass the word along, General.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "Run quiet, run fast and never run alone, because the Outriders guard their flag room like misers. A good carrier with no one at their back is just a dead hero with a banner over their face." },
        { id = "xr_druid", when = { class = "DRUID" }, text = "I've watched druids run that flag as a cheetah would, and it's a wonder to see. But even the fastest carrier dies if there's no one at their back, so bring friends." },
      },
      choices = { { text = "Thank you, General.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    warsong = { { id = "tp_warsong", text = "The Warsong are cutting their way across Ashenvale, and Warsong Gulch is where the Sentinels make them pay for every tree.", next = "wsg" } },
    _none = { { id = "tp_none", text = "That's not on any report I've read, soldier. Ask a quartermaster, or better yet, go and see for yourself." } },
  },
}

---------------------------------------------------------------------------
-- Horde Warbringer
---------------------------------------------------------------------------
P:NPC {
  key = "emissary_warbringer", id = TODO_NPC("Horde Warbringer"), name = "Horde Warbringer",
  role = "soldier", tier = "quest",
  temper = { "gruff", "fierce" }, values = { "honorable", "loyal" },
  notices = { "pvp", "race" },

  impression = {
    first = "The Warbringer is a scarred orc officer who speaks of the battlegrounds as the place where the Horde proves itself to the world. He spoke of Thrall's honor as a law, and I believe he'd break any grunt who stained it.",
    third = "{name} met the Horde Warbringer, an orc who collects marks from all three battlegrounds and holds that the Horde's honor matters as much as its victories.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar, warrior. Tell me where you've fought, and I'll tell you if it was enough." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and you still have both arms. The Alliance must be growing soft." },
    { id = "g_marks", when = ANY_MARK, text = "I can smell the battlefield on you, and I see a mark of honor in your pack. Good, because the Horde remembers those who fight." },
    { id = "g_allmarks", tags = { "news" }, when = ALL_MARKS, text = "Warsong, Arathi and Alterac, all three! You've done what I ask of every warrior, and few ever do it." },
    { id = "g_rank", when = { pvpRank = 10 }, text = "{rank} {name}. The grunts speak your name at the fires, and I'm glad to hear it." },
    { id = "g_dishonor", when = { dishonorKills = { min = 1 } }, text = "I know what you've done to the Alliance's farmers and merchants. Speak quickly, and speak carefully." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Your kind fight as the Defilers in Arathi, and they fight hard, but they forget that the Horde has rules. See that you don't forget them." },
    { id = "n_rank_mid", cat = "pvp", when = { pvpRank = { min = 6, max = 9 } }, place = "before",
      text = "You carry that rank like a warrior who's bled for it. Keep climbing, and keep your honor while you do." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The tauren fight with a calm I envy, though they hit as hard as any orc I've known. Cairne's people do the Horde proud on every field." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The Alliance thinks the Horde is a pack of beasts, and every battleground is a chance to show them they're wrong. Bring me a mark of honor from Warsong Gulch, Arathi Basin and Alterac Valley, and I'll know you've proved it three times over." },
        { id = "h_marks", when = ALL_MARKS, priority = 5,
          text = "All three marks, carried by one warrior! Sit with me a moment, because I want to hear how you earned them." },
        { id = "h_rank", when = { pvpRank = 10 },
          text = "{rank}, it's an honor. You've seen more battles than the officers who dine at the Keep, so speak to me as one veteran to another." },
        { id = "h_young", when = { maxLevel = 19 },
          text = "You're young for the battlegrounds, whelp, but don't be ashamed of it. Everyone I've ever fought beside started where you stand now." },
        { id = "h_dishonor", when = { dishonorKills = { min = 1 } },
          text = "You've killed Alliance farmers and merchants who never raised a weapon, and you've shamed the Horde by it. Thrall did not free us so that we could become what the humans always said we were." },
        { id = "h_undercity", when = { zone = "Undercity" },
          text = "They gave me a corner of these tunnels to stand in, and it stinks of the dead and the apothecaries. Still, the Forsaken fight, and I've stopped asking for a better smell." },
        { id = "h_thunderbluff", when = { zone = "Thunder Bluff" },
          text = "The wind up here is clean, and the tauren listen better than any orc. I hope they're listening to me about Alterac, because the Frostwolves need every warrior they can get." },
      },
      again = {
        { id = "h_again", text = "What else, warrior? Speak, and don't waste time." },
        { id = "h_again2", text = "Go on. I've time for anyone who's fought for the Horde." },
        { id = "h_again3", text = "Ask, then. War doesn't wait, but I can." },
      },
      choices = {
        { text = "I have all three marks, Warbringer.", next = "turnin", when = ALL_MARKS },
        { text = "Why does the Horde need to prove itself?", next = "proof" },
        { text = "Not every battle seems honorable to me.", next = "honor" },
        { text = "Tell me about the battlegrounds.", next = "fields" },
        { text = "Some say this is only a blood sport with ranks.", next = "sport" },
        { text = "I'm a {rank}. What does the Horde want now?", next = "k_rank", when = { pvpRank = 10 } },
        { text = "They were Alliance. Why should I spare them?", next = "k_dishonor", when = { dishonorKills = { min = 1 } } },
        { text = "When can I join the fight?", next = "k_young", when = { maxLevel = 19 } },
        { text = "The Frostwolves are Thrall's own clan, aren't they?", next = "k_frostwolf", when = { race = "Orc" } },
        { text = "The orcs don't trust my people. Why should I fight?", next = "k_forsaken", when = { race = "Scourge" } },
        { text = "Do the spirits favor the Horde in battle?", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "I'll go, Warbringer.", next = "END" },
      },
    },

    -- The turn-in
    turnin = {
      big = true,
      lines = {
        { id = "ti_default", text = "Then I'll send word to the Outriders, the Defilers and the Frostwolves that a warrior of the Horde fought for all of them. But tell me, warrior, what did you fight for?" },
      },
      choices = {
        { text = "For the Horde's honor.", next = "BACK", reply = "Then you fought for the right thing, warrior, and Thrall himself would say so, because the Horde's honor is the only thing that ever set us free.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "For victory. Honor comes after.", next = "BACK", reply = "Hmph, you sound like a grunt who has never had to live with what he did to win, but you are young yet, and the years will teach you otherwise.", fx = { align = { honor = -1 } } },
        { text = "For the warriors beside me.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    -- Proving the Horde
    proof = {
      lines = {
        { id = "pf_default", text = "Because the humans kept us in camps for years and called us monsters, and many of them still believe it. Every fair fight the Horde wins on those fields tells them that we are warriors, not beasts, and that we're not going back in the pens." },
        { id = "pf_tauren", when = { race = "Tauren" }, text = "Because the humans kept us orcs in camps and called us monsters, and some still believe it. Your people never wore those chains, but they chose to stand beside us, and that makes the Horde's name yours to defend too." },
      },
      choices = {
        { text = "Who are we proving it to?", next = "proof_who" },
        { text = "Does the Warchief want this war at all?", next = "chief" },
        { text = "The camps are over. Why still prove anything?", next = "proof_why" },
        { text = "Something else, Warbringer.", next = "BACK" },
      },
    },
    -- Opinion pass: the warbringer asks what the player thinks of the Warchief's peace.
    chief = {
      big = true,
      lines = {
        { id = "ch_default", text = "He wants the Horde to live, which isn't the same thing. He keeps faith with Lady Proudmoore at Theramore, and he lets us fight these battles so the grunts have somewhere to put their anger. Some call that wisdom and some call it weakness. What do you call it?" },
        { id = "ch_soft", when = { opinion = { topic = "warchief", stance = { "soft", "weak" } } }, text = "He wants the Horde to live, which isn't the same thing, and I'm told you think that makes him soft. He keeps faith with Lady Proudmoore and lets us fight here so the grunts have somewhere to put their anger. Say it to my face, then: what do you call it?" },
      },
      choices = {
        { text = "Wisdom. Thrall knows when to fight and when to wait.", next = "chief_trust", fx = { opinion = { warchief = "trust" }, align = { honor = 1 } } },
        { text = "Weakness. The Alliance only respects a raised axe.", next = "chief_soft", fx = { opinion = { warchief = "soft", peace = "against" }, align = { honor = -1 } } },
        { text = "Proudmoore can be trusted. Her king can't.", next = "chief_jaina", fx = { opinion = { jaina = "respect", alliance = "distrust" } } },
        { text = "The Dark Lady has her own wars to fight.", next = "chief_lady", when = { race = "Scourge" }, fx = { opinion = { sylvanas = "loyal" } } },
        { text = "That's for the Warchief to say.", next = "BACK" },
      },
    },
    chief_trust = {
      lines = { { id = "cht_default", text = "Good. I've seen what the Horde becomes when it fights for nothing but the fighting, and I'd not see it again. Bring that sense to the battlegrounds, warrior." } },
      choices = { { text = "Something else, Warbringer.", next = "BACK" } },
    },
    chief_soft = {
      lines = { { id = "chs_default", text = "Plenty of grunts agree with you, and I fought beside some of them. But the last time the Horde raised its axe without thinking, it woke up in chains, so don't confuse the Warchief's patience with fear." } },
      choices = { { text = "Something else, Warbringer.", next = "BACK" } },
    },
    chief_jaina = {
      lines = { { id = "chj_default", text = "Her king is missing, as it happens, and the boy and the regent who sit in his place have no love for us. You're right about her, though; she chose us over her own father, and orcs remember that." } },
      choices = { { text = "Something else, Warbringer.", next = "BACK" } },
    },
    chief_lady = {
      lines = { { id = "chl_default", text = "She does, and she fights them in her own fashion and keeps her own counsel about it. The Warchief trusts her to keep her word, and I trust the Warchief, so we'll leave it there." } },
      choices = { { text = "Something else, Warbringer.", next = "BACK" } },
    },
    proof_why = {
      lines = { { id = "pw_default", text = "Because the Alliance still remembers the orcs who burned Stormwind, not the orcs who broke free and built Durotar. Until they learn the difference, they'll keep sending soldiers into Ashenvale and Alterac to finish what their camps began." } },
      choices = {
        { text = "So who are we proving it to?", next = "proof_who" },
        { text = "Then we'll teach them the difference.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    proof_who = {
      big = true,
      lines = { { id = "pwh_default", text = "To the Alliance, to the world, and to ourselves most of all, warrior, because there are orcs who still remember the bloodlust and want it back. What do you think the Horde should be, when the battle's done?" } },
      choices = {
        { text = "What Thrall says: warriors with honor.", next = "BACK", reply = "Lok'tar, then you understand the Warchief's heart. Fight with honor in every battle, warrior, and the Alliance will one day have nothing to say about orcs that is not grudging respect.", fx = { opinion = { warchief = "trust" }, align = { honor = 1 } } },
        { text = "Strong enough that no one can cage us again.", next = "BACK", reply = "Strength, yes, and no orc who wore the chains will argue with you. But strength without honor is what the demons gave us, warrior, so be strong and be careful what you become.", fx = { opinion = { horde = "strength" }, align = { honor = -1 } } },
        { text = "I don't know yet.", next = "BACK", fx = { trait = { honest = 1 } } },
      },
    },

    -- Honor
    honor = {
      lines = {
        { id = "hn_default", text = "You fight the enemy who can fight back, and you let the farmers, the peddlers and the stablehands live. You don't run from an objective to chase easy kills, and you never let a grunt die alone if you can reach them." },
      },
      choices = {
        { text = "Some must break these rules.", next = "honor_breakers" },
        { text = "Does the Alliance fight with honor?", next = "honor_alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honor_breakers = {
      lines = { { id = "hb_default", text = "They lose rank, as they should, and if they're mine they answer to me. Thrall's Horde doesn't kill farmers, and any orc who does is spitting on everything we fought for in the camps." } },
      choices = { { text = "I understand, Warbringer.", next = "BACK" } },
    },
    honor_alliance = {
      big = true,
      lines = { { id = "ha_default", text = "Some do, and I've seen a human knight let a wounded grunt crawl away in Alterac when she could have finished him. Others hunt our peons and call it war. Should we answer them in kind, or keep to our own laws?" } },
      choices = {
        { text = "Keep to our laws, whatever they do.", next = "BACK", reply = "Then you are the kind of warrior Thrall built the new Horde for, and I would trust you on any field, whatever the Alliance chooses to be.", fx = { align = { honor = 1 } } },
        { text = "Answer them in kind. They started it.", next = "BACK", reply = "I understand the anger, for I have felt it too, but if we fight as the humans' worst fight, then what were the camps and the chains for?", fx = { align = { honor = -1 } } },
        { text = "What happened to the knight?", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    -- War or sport
    sport = {
      big = true,
      lines = {
        { id = "sp_default", text = "I've heard young warriors talk as though it were a game, chasing marks and ranks and fancy tabards. But the orcs who die in Warsong Gulch die for real, and so do the elves, so you tell me: is it war, or something less?" },
      },
      choices = {
        { text = "It's war. The Horde fights for its future there.", next = "sport_war", fx = { align = { order = 1 } } },
        { text = "It's a contest, and the strongest win.", next = "sport_game", fx = { align = { order = -1 } } },
        { text = "Why give ranks, if it's war?", next = "ranks" },
      },
    },
    sport_war = {
      lines = { { id = "sw_default", text = "Good, because the Warsong need lumber to build Orgrimmar, and the night elves would rather see our children cold than spare a tree. Every flag we take keeps the axes swinging in Ashenvale." } },
      choices = { { text = "Then I'll keep taking their flags.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    sport_game = {
      lines = { { id = "sg_default", text = "The strongest do win, warrior, but the strong who fight without honor are only beasts with sharp teeth. Win your contest, but remember who you're fighting for." } },
      choices = { { text = "I'll remember, Warbringer.", next = "BACK" } },
    },

    -- Ranks
    ranks = {
      lines = {
        { id = "rk_default", text = "The ranks show the Horde who fights hardest, from Scout to High Warlord, and they're counted every week. I'll tell you plainly that some warriors chase the ranks more than the victory, and I don't like it." },
      },
      choices = {
        { text = "What's wrong with chasing rank?", next = "ranks_chase" },
        { text = "Something else, Warbringer.", next = "BACK" },
      },
    },
    ranks_chase = {
      lines = { { id = "rc_default", text = "A warrior who chases rank leaves the Gold Mine undefended to hunt a lone priest on the road. We lose the basin, and they gain a little honor, so you see the problem." } },
      choices = { { text = "I see it, Warbringer.", next = "BACK" } },
    },

    -- The battlegrounds (sub-hub)
    fields = {
      hub = true,
      lines = { { id = "fd_default", text = "Three fields, three clans and three enemies, warrior. Which one do you want to hear about?" } },
      again = {
        { id = "fd_again", text = "Which other field, warrior?" },
        { id = "fd_again2", text = "Name another, and I'll tell you what I know." },
      },
      choices = {
        { text = "Warsong Gulch.", next = "wsg" },
        { text = "Arathi Basin.", next = "ab" },
        { text = "Alterac Valley.", next = "av" },
        { text = "Enough about the fields.", next = "hello" },
      },
    },
    wsg = {
      lines = { { id = "wsg_default", text = "The Warsong Outriders guard the lumber mill in that gulch, and the Silverwing Sentinels raid it for our flag. The elves call it murder, but Orgrimmar needs wood, and the Warsong clan has always taken what it needs." } },
      choices = {
        { text = "The elves say we're killing their forest.", next = "wsg_forest", fx = { learn = { "warsong" } } },
        { text = "Another field, Warbringer.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    wsg_forest = {
      big = true,
      lines = { { id = "wsgf_default", text = "They say it, and some of the shamans in Orgrimmar say it too, quietly. But Ashenvale has trees enough for a thousand cities, and the night elves would let us freeze before they'd share one, so tell me, warrior, who's in the right?" } },
      choices = {
        { text = "We are. A people must build to survive.", next = "BACK", reply = "Spoken like an orc who has felt winter in Durotar, and I will not argue, because our children need roofs more than the night elves need another grove.", fx = { align = { light = -1 } } },
        { text = "The shamans. We should take only what we need.", next = "BACK", reply = "The shamans would be glad of you, and maybe you are right, but tell that to the peons who die felling those trees with Sentinel arrows in their backs.", fx = { align = { light = 1 } } },
        { text = "Another field.", next = "BACK" },
      },
    },
    ab = {
      lines = { { id = "ab_default", text = "The Defilers out of Hammerfall fight the League of Arathor for the basin's five points: the Stables, the Gold Mine, the Lumber Mill, the Blacksmith and the Farm. Whoever holds the most feeds their army, so it's a fight for supplies as much as land." } },
      choices = {
        { text = "The Defilers have a grim reputation.", next = "ab_defilers" },
        { text = "Another field.", next = "BACK" },
      },
    },
    ab_defilers = {
      lines = {
        { id = "abd_default", text = "They're Forsaken, and they fight like it, cold and without mercy. I don't like them, but they hold the line in Arathi, and the Horde needs every warrior it can get." },
        { id = "abd_forsaken", when = { race = "Scourge" }, text = "They're your people, and they fight like it, cold and without mercy. I've no love for them, but they hold the line in Arathi, and the Horde needs every warrior it can get." },
      },
      choices = { { text = "Another field, then.", next = "BACK" } },
    },
    av = {
      lines = { { id = "av_default", text = "The Frostwolves under Drek'Thar have lived in that valley since Gul'dan exiled them there, and now the Stormpike dwarves have come to dig up their home. It's the largest of the fields, and the bloodiest." } },
      choices = {
        { text = "Why do the dwarves want the valley?", next = "av_dwarves" },
        { text = "Another field.", next = "BACK" },
      },
    },
    av_dwarves = {
      lines = { { id = "avd_default", text = "They say for the iron and the relics of their ancestors, but they'd take any ground the Frostwolves stand on. Drek'Thar won't give up a single stone, and neither should we." } },
      choices = { { text = "Then we'll hold it for him.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    -- Who the player is
    k_rank = {
      big = true,
      lines = { { id = "kr_default", text = "The Horde wants you to lead, {rank}, because the young warriors watch everything you do. Will you show them how to fight with honor, or how to win at any cost?" } },
      choices = {
        { text = "With honor. The Horde must be better than its enemies.", next = "BACK", reply = "Good, because the young ones are watching, and the Horde was not freed from the camps to become what the demons made of us once.", fx = { align = { honor = 1 } } },
        { text = "To win. Victory is the only lesson that matters.", next = "BACK", reply = "That is how the old Horde thought, before Thrall, and it nearly destroyed us, so do not be surprised if I keep my eye on the grunts you train.", fx = { align = { honor = -1 } } },
        { text = "I'll think on it, Warbringer.", next = "BACK" },
      },
    },
    k_dishonor = {
      lines = { { id = "kd_default", text = "Because Thrall's Horde does not murder farmers, warrior, and if you can't understand that, you don't belong in it. The Alliance tells its children we're monsters, and you've given them proof." } },
      choices = {
        { text = "It won't happen again.", next = "BACK", fx = { trait = { honest = 1 } } },
        { text = "The Alliance kills our peons too.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_young = {
      lines = { { id = "ky_default", text = "Warsong Gulch takes the youngest warriors, so you won't wait long. Grow strong, and when you're ready, the Outriders will have a place for you." } },
      choices = { { text = "I'll be ready, Warbringer.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    k_frostwolf = {
      lines = { { id = "kf_default", text = "They are, warrior, and Thrall's father led them before he was murdered. When I fight in Alterac, I fight for the Warchief's own kin, and that's an honor I wouldn't trade for any rank." } },
      choices = { { text = "Then I'll fight for them too.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    k_forsaken = {
      lines = { { id = "kfs_default", text = "Because the Horde took you in when no one else would, and because the Alliance would put you back in the ground. Fight with honor, and the orcs will learn to trust you, even if it takes longer than you'd like." } },
      choices = {
        { text = "Trust is earned. I'll earn it.", next = "BACK", fx = { affinity = 1 } },
        { text = "I don't need the orcs' trust.", next = "BACK", fx = { trait = { proud = 1 } } },
      },
    },
    x_shaman = {
      lines = { { id = "xs_default", text = "The spirits favor the honorable, shaman, whatever their colors. I've seen the earth itself rise up to protect the Frostwolves in Alterac, but I've also seen it turn its back on orcs who forgot their honor." } },
      choices = { { text = "The spirits guide us, Warbringer.", next = "BACK", fx = { trait = { pious = 1 } } } },
    },
  },

  topics = {
    warsong = { { id = "tp_warsong", text = "The Warsong clan feeds Orgrimmar with Ashenvale's lumber, and Warsong Gulch is where they defend it from the elves.", next = "wsg" } },
    _none = { { id = "tp_none", text = "I'm a warrior, not a scholar. Ask someone else, or go and find out for yourself." } },
  },
}
