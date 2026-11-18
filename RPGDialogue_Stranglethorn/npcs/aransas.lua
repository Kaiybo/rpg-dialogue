-- Booty Bay: Captain Aransas, a ship's captain who sails with the Blackwater Raiders. Voice: bibles/aransas.md
-- Neutral ground: she talks to both factions. Rogues free her cook, Wendel Mathers, from Kurzen's Compound.
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_REWARD = TODO_QUEST("Captain Aransas' Reward")

P:NPC {
  key = "aransas", id = TODO_NPC("Captain Aransas"), name = "Captain Aransas",
  bible = "bibles/aransas.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "sharp", "steady" }, values = { "loyal", "brave" },
  notices = { "class", "kit" },

  impression = {
    first = "Captain Aransas wished me good day like she was weighing whether I'd be any use on a rope. She's a plain-spoken woman with salt in her hair and a crew she plainly loves.",
    third = "{name} met Captain Aransas, a human ship's captain who sails out of Booty Bay alongside the Blackwater Raiders and worries over her crew like a hen.",
  },

  greetings = {
    { id = "g_day", text = "Good day to ye, {class}. Mind the ropes on this stretch of the pier, because my lads coil them wherever they please." },
    { id = "g_back", when = { metBefore = true }, text = "Good day to ye again, {class}. Ye've a habit of turning up, and I've decided I don't mind it." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, are ye? The cove's not changed much, save the Bloodsail have grown bolder and the rum's grown dearer." },
    { id = "g_saved", when = { questDone = Q_REWARD }, text = "There's the one who brought Mathers home! Good day to ye, {class}, and ye'll always find a welcome on my deck." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear ye've been doing the Bay some good turns. That's the sort o' talk that gets a sailor a berth, should ye ever want one." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word on the pier is ye were caught telling tales. I'll hear what ye've got to say, but I'll be counting my fingers after." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ye walk like someone who knows where the loose boards are, and I mean that kindly. I've a use for that sort of step." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like ye've been dragged behind a ship and left to dry. Get that gear mended before ye go back into the jungle." },
  },

  react = {
    { id = "r_stealth", on = "stealth", when = { stealthed = true }, text = "I saw the boards creak, so ye needn't bother hiding. Come out where I can see ye, and we'll talk like honest thieves." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Good day to ye, {class}. I'm Captain Aransas, and that's my ship riding at anchor past the Raiders' sloops, the one with the patched foresail." },
        { id = "h_rogue_before", when = { class = "ROGUE", ["not"] = { any = { { questActive = Q_REWARD }, { questDone = Q_REWARD } } } },
          text = "Good day to ye, {class}. I'm Captain Aransas, and I'm a man short, which wouldn't trouble me if I knew he was dead, but I don't." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q_REWARD },
          text = "Have ye been north yet? Wendel's still in Kurzen's Compound for all I know, and every night he spends there is a night I don't sleep." },
        { id = "h_done", tags = { "news" }, when = { questDone = Q_REWARD },
          text = "Mathers is back in my galley and the whole crew's eating like lords again. Ye saved a crewman o' mine, {class}, and I don't forget a thing like that." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Good day to ye, {class}. A Horde face on the pier doesn't trouble me, for this is the Baron's cove and his peace holds here, whatever ye do out at sea." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Good evening, rather, though I keep saying good day out o' habit. The lamps are lit on the Bloodsail ships out past the heads, so I'm watching them while I can." },
      },
      again = {
        { id = "h_again", text = "What else, then? Ask while the tide's slack, for I'll be busy when it turns." },
        { id = "h_again2", text = "Go on, I've time for one more question, and maybe two if ye're quick about it." },
        { id = "h_again_done", when = { questDone = Q_REWARD }, text = "Ask what ye like. Anyone who brought Wendel home can have my ear as long as they want it." },
      },
      choices = {
        { text = "Who are you, Captain, and what's your ship?", next = "who" },
        { text = "Tell me about your crew.", next = "crew" },
        { text = "You seem to sail with the Blackwater Raiders.", next = "raiders" },
        { text = "What do you make of the Bloodsail Buccaneers?", next = "bloodsail" },
        { text = "You keep looking north, Captain. What's there?", next = "kurzen" },
        { text = "I hear you're a man short. Someone who works quietly?", tag = "Rogue", next = "q_offer",
          when = { class = "ROGUE", ["not"] = { any = { { questActive = Q_REWARD }, { questDone = Q_REWARD } } } } },
        { text = "Where in Kurzen's Compound will Mathers be held?", next = "q_where", when = { questActive = Q_REWARD } },
        { text = "How's Mathers settling back in?", next = "q_after", when = { questDone = Q_REWARD } },
        { text = "Does a human captain mind Horde coin?", next = "k_horde", when = { faction = "Horde" } },
        { text = "Another Stormwind face, this far south. You're a long way from home.", next = "k_human", when = { race = "Human" } },
        { text = "Does my face frighten your crew, Captain?", next = "k_undead", when = { race = "Undead" } },
        { text = "My people knew these waters long before your Bay.", next = "k_troll", when = { race = "Troll" } },
        { text = "Your ship could use a few gnomish improvements.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Sailors can't fare well in a boarding fight.", next = "xwar", when = { class = "WARRIOR" } },
        { text = "Has magic ever saved your ship, Captain?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do your sailors pray before a voyage?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Do you ever hunt for the galley along the coast?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "Do you think the sea minds being sailed?", next = "xdruid", when = { class = "DRUID" } },
        { text = "How does an honest captain keep pirate company?", next = "xpala", when = { class = "PALADIN" } },
        { text = "Do your sailors listen to the spirits of the sea?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Would you let a warlock aboard your ship?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Good sailing, Captain.", next = "END" },
      },
    },

    -- Who she is -----------------------------------------------------------
    who = {
      lines = {
        { id = "who_default", text = "Aransas, captain of the Gull's Wager, and ye'll find her the slowest ship in the cove and the last one to sink. I've carried cargo and cannon both, and give me cargo every time, for a crate of rum never fired back at anybody." },
        { id = "who_rogue", when = { class = "ROGUE" }, text = "Aransas, captain of the Gull's Wager, and I'll tell ye straight, since ye'd find out anyway. I've been a smuggler, a privateer and a plain thief in my time, and only the Baron's peace made an honest captain of me." },
      },
      choices = {
        { text = "The Gull's Wager? How did she get that name?", next = "who_ship" },
        { text = "A woman from the north is a long way from home down here.", next = "who_start" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    who_ship = {
      lines = { { id = "ws_default", text = "I won her in a wager with a goblin in Ratchet, who swore a gull could outfly a cannonball, and it couldn't. He's still sore about it, and he still says the gull wasn't trying." } },
      choices = {
        { text = "Winning a ship on a bet is good seamanship.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Swindling a goblin out of his ship? You should give it back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Ha! Did the gull survive?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    who_start = {
      lines = {
        { id = "wst_default", text = "I was a fisherman's daughter from the Westfall coast, and when the Defias came and the farms went bad, there wasn't much to stay for. I followed the fish south, then the coin, and the coin led straight to Booty Bay, as it does for everyone." },
        { id = "wst_human", when = { race = "Human" }, text = "Same as you, by the look of ye: Stormwind stock, from a fishing village on the Westfall coast. When the Defias came and the farms went bad there wasn't much to stay for, so I followed the coin south, and it led straight to Booty Bay." },
      },
      choices = {
        { text = "You were right to leave. Stormwind failed Westfall.", next = "BACK", fx = { align = { order = -1 }, learn = { "defias" } } },
        { text = "Westfall needed people like you to stay and fight.", next = "BACK", fx = { align = { order = 1 }, learn = { "defias" } } },
        { text = "Do you ever think of going back?", next = "who_home" },
      },
    },
    who_home = {
      lines = { { id = "wh_default", text = "Now and again, when the jungle smells too much of rot and not enough of salt. Then I remember there's nothing there but my mother's grave and a Defias camp on the beach, and I stay where my crew is." } },
      choices = { { text = "Something else, Captain.", next = "BACK", fx = { affinity = 1 } } },
    },

    -- Her crew -------------------------------------------------------------
    crew = {
      hub = true,
      lines = {
        { id = "cr_default", text = "Eleven good hands and one bad parrot, and the whole crew would follow me into a storm, though they'd complain the whole way. That's how ye know a crew's sound, when they grumble but still haul." },
        { id = "cr_missing", when = { ["not"] = { questDone = Q_REWARD } }, text = "Ten hands aboard and one missing, which is one too many for my liking. They're good sailors, but they're quiet these days, and a quiet crew is a worried one." },
      },
      again = {
        { id = "cr_again", text = "What else would ye know about my lot? I can talk about them till the tide comes in." },
        { id = "cr_again2", text = "Ask on. They're a rough crowd, but they're mine." },
      },
      choices = {
        { text = "Who's the man that's missing?", next = "crew_mathers", when = { ["not"] = { questDone = Q_REWARD } } },
        { text = "Tell me about your cook.", next = "crew_mathers", when = { questDone = Q_REWARD } },
        { text = "Who else sails with you?", next = "crew_rest" },
        { text = "Do you ever take on new hands?", next = "crew_hire" },
        { text = "That's enough about the crew.", next = "hello" },
      },
    },
    crew_mathers = {
      lines = {
        { id = "cm_default", text = "Wendel Mathers, my cook, and the best man with a pot on any ship in the cove. He went ashore up the coast to buy peppers from a trader, and Kurzen's men took him off the trail and dragged him north." },
        { id = "cm_done", when = { questDone = Q_REWARD }, text = "Wendel Mathers, and he's back where he belongs, stirring his pots and singing badly. Kurzen's men had him for a long while, and he's thinner than he was, but he's already arguing with the bosun about salt." },
      },
      choices = {
        { text = "Is he a fighting man?", next = "mathers_cook" },
        { text = "I can't think why Kurzen would want a cook.", next = "kurzen_how" },
        { text = "Something else about the crew.", next = "BACK" },
      },
    },
    mathers_cook = {
      lines = {
        { id = "mc_default", text = "Wendel? Light, no, he's a poor fighter and always was, and he'd lose a duel to a crab. But he can turn salt pork and weevils into something ye'd thank yer mother for, and a good cook is priceless in this line o' work." },
      },
      choices = {
        { text = "A good cook keeps a crew loyal. You're right to want him back.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Cooks can be replaced. I'd cut my losses, Captain.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "What's his best dish?", next = "mathers_dish" },
      },
    },
    mathers_dish = {
      lines = { { id = "md_default", text = "Turtle stew with Stranglethorn peppers, and it'll take the skin off yer tongue and leave ye begging for more. He makes it every time we round the Cape, and nobody aboard has ever mutinied on a stew night." },
      },
      choices = {
        { text = "I'd sail with any captain who serves that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else about the crew.", next = "BACK" },
      },
    },
    crew_rest = {
      lines = { { id = "crr_default", text = "There's Old Tamsin, my bosun, who's been at sea longer than I've been alive and lets me know it every day. There's a pair of goblin twins who keep the guns, and a parrot named Bilge who bit Fleet Master Seahorn once and has never been punished for it." } },
      choices = {
        { text = "Your parrot bit the Fleet Master?", next = "crew_parrot" },
        { text = "Something else about the crew.", next = "BACK" },
      },
    },
    crew_parrot = {
      lines = { { id = "cp_default", text = "On the thumb, and Seahorn laughed so hard he nearly went off the balcony. He's offered me twenty gold for that bird since, and I'll not take it, because a parrot that bites a tauren is worth more than gold to a crew's morale." } },
      choices = { { text = "Something else about the crew.", next = "BACK", fx = { affinity = 1 } } },
    },
    crew_hire = {
      lines = {
        { id = "chi_default", text = "When I find the right sort, aye, and I'm always looking. Tell me true, {class}: would ye rather sail for coin, or sail because ye like the crew?" },
      },
      choices = {
        { text = "For the crew. Coin comes and goes, but shipmates last.", next = "crew_hire2", fx = { affinity = 1, align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "For coin, Captain. Shipmates die; gold keeps.", next = "crew_hire2", fx = { align = { honor = -1 } } },
        { text = "I haven't decided yet, Captain.", next = "crew_hire2" },
        { text = "I'm no sailor, Captain.", next = "BACK" },
      },
    },
    crew_hire2 = {
      lines = { { id = "chi2_default", text = "Whatever yer answer, I'd rather have it honest than pretty, and that's worth more to me than the answer itself. If ye ever tire of the jungle, come and find the Gull's Wager, though I warn ye, Tamsin makes the new hands scrub the hull." } },
      choices = { { text = "I'll keep it in mind. Something else.", next = "BACK" } },
    },

    -- The Raiders and the Baron --------------------------------------------
    raiders = {
      lines = {
        { id = "rd_default", text = "Alongside them more than under them, which is how I like it. When the Bloodsail come, my guns are the Baron's guns and I take Seahorn's orders, but in fair weather I carry my own cargo and keep my own counsel." },
      },
      choices = {
        { text = "What's Fleet Master Seahorn like to sail with?", next = "raiders_seahorn" },
        { text = "I'd like to hear what you think of Baron Revilgaz.", next = "raiders_baron" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    raiders_seahorn = {
      lines = { { id = "rs_default", text = "Loud, generous and braver than is good for him, and I've never once seen him leave a ship behind. He'd have sent the whole fleet after Wendel if I'd asked, and that's exactly why I didn't ask, because Kurzen's camp is no place for sailors." } },
      choices = {
        { text = "A captain who won't leave anyone behind is worth following.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Asking for help isn't weakness, Captain.", next = "BACK", fx = { affinity = 1 } },
        { text = "Fleets are for show. Better to handle things yourself.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    raiders_baron = {
      lines = {
        { id = "rb_default", text = "The Baron's a goblin, so he'd sell his own balcony if the price were right, but he keeps his bargains and he keeps the peace. In this cove that makes him a better lord than most kings I've heard of." },
      },
      choices = {
        { text = "A lord who keeps his bargains deserves your loyalty.", next = "BACK", fx = { align = { order = 1 }, learn = { "steamwheedle" } } },
        { text = "Lords are lords. I'd trust his ledger, not him.", next = "BACK", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
        { text = "What does he charge you for anchorage?", next = "raiders_dues" },
      },
    },
    raiders_dues = {
      lines = { { id = "rdu_default", text = "A tenth of every cargo and my guns whenever the Bloodsail show their sails, and I pay it gladly. There's no other harbor on this coast where a human and an orc can drink at the same bar without someone getting stabbed, or at least not stabbed often." } },
      choices = { { text = "Something else, Captain.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },

    -- The Bloodsail ----------------------------------------------------------
    bloodsail = {
      big = true,
      lines = {
        { id = "bs_default", text = "Cutthroats with red sails, and I've buried two crewmen on their account. They'd burn this cove to the waterline and call it a victory, and they hate us because we built something here and they never could." },
        { id = "bs_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Ye've read their letters, so ye know what they've planned for this cove. I've buried two crewmen on their account, and I'll see their red sails at the bottom before I'm done." },
      },
      choices = {
        { text = "Then sink them down to the last plank. They earned it.", next = "BACK", fx = { align = { light = -1 }, learn = { "bloodsail" } } },
        { text = "Some of them must be pressed men. Spare those you can.", next = "BACK", fx = { align = { light = 1 }, learn = { "bloodsail" } } },
        { text = "Are they all born pirates, or are some pressed men?", next = "bloodsail_fight" },
        { text = "Who were the two you buried?", next = "bloodsail_buried" },
      },
    },
    bloodsail_fight = {
      lines = { { id = "bf_default", text = "There are pressed men among them, aye, farm boys from Westfall and the like, and I take them aboard when I can. The rest I'd sink without a second thought, and I've never lost a night's sleep over it." } },
      choices = { { text = "Something else, Captain.", next = "BACK", fx = { affinity = 1 } } },
    },
    bloodsail_buried = {
      lines = { { id = "bb_default", text = "A rigger named Pell and a lad called Dory, both taken by a Bloodsail broadside off the Wild Shore last spring. We gave them to the sea proper, and Wendel cooked their favorite meals for a week, which is how a crew grieves when it can't afford to stop working." } },
      choices = {
        { text = "I'm sorry for your losses, Captain.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Kurzen and Mathers ---------------------------------------------------
    kurzen = {
      lines = {
        { id = "kz_default", text = "Kurzen's Compound, up in the northern jungle, where a mad colonel from Stormwind keeps his own little army. His men took one o' my crew, and I look north every morning in the hope I'll see him walking down the road." },
        { id = "kz_done", when = { questDone = Q_REWARD }, text = "Habit, mostly, for I spent so long looking that way for Wendel that I can't stop now. Kurzen's still up there with his camp and his madness, and I hope ye left a few of his men with sore heads." },
      },
      choices = {
        { text = "Who is this Colonel Kurzen?", next = "kurzen_who" },
        { text = "How did Kurzen's men get hold of your man?", next = "kurzen_how" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    kurzen_who = {
      lines = { { id = "kw_default", text = "A Stormwind officer who was sent here to fight trolls and stayed to fight everyone. Half his soldiers walked out on him and set up a camp of their own to the north, and the half who stayed are the worst of the lot." } },
      choices = {
        { text = "Then the rebels should be helped. They chose right.", next = "BACK", fx = { align = { order = -1 }, learn = { "kurzen" } } },
        { text = "Deserters are still deserters, whatever the colonel did.", next = "BACK", fx = { align = { order = 1 }, learn = { "kurzen" } } },
        { text = "Something else, Captain.", next = "BACK", fx = { learn = { "kurzen" } } },
      },
    },
    kurzen_how = {
      lines = {
        { id = "kh_default", text = "Kurzen's men will take anyone off the roads these days, and they need cooks as badly as anyone, so Wendel was a prize to them. I'd have marched up there with my crew, but sailors in a jungle are just noisy meat for the panthers." },
      },
      choices = {
        { text = "Why not pay a mercenary to fetch him?", next = "kurzen_quiet" },
        { text = "Something else, Captain.", next = "BACK", fx = { learn = { "kurzen" } } },
      },
    },
    kurzen_quiet = {
      lines = {
        { id = "kq_default", text = "Because a mercenary with a sword would only get Wendel's throat cut before the gate came down. What that camp needs is somebody quiet, who can slip in by night, open a lock and slip out again, and that sort is harder to find than gold." },
        { id = "kq_rogue", when = { class = "ROGUE", ["not"] = { questDone = Q_REWARD } }, text = "Because a mercenary with a sword would only get Wendel's throat cut before the gate came down. What that camp needs is somebody quiet, and I'll say it plainly, {class}: someone very like you." },
      },
      choices = { { text = "Something else, Captain.", next = "BACK", fx = { learn = { "kurzen" } } } },
    },

    -- Rogue quest: before, during, after -----------------------------------
    q_offer = {
      lines = {
        { id = "qo_default", text = "Ye heard right, and ye've the walk of someone who could do something about it. My cook, Wendel Mathers, is held in Kurzen's Compound, and I need him out without a war being started over it." },
      },
      choices = {
        { text = "Why trust a rogue with your crewman's life?", next = "q_offer2" },
        { text = "I'd want something for my trouble, Captain.", next = "q_pay" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    q_offer2 = {
      big = true,
      lines = { { id = "qo2_default", text = "Because a rogue's the only one who'll come back with him rather than a story about how brave they were. So tell me, {class}, would ye do this for coin, or because a man's in a cage?" } },
      choices = {
        { text = "A man's in a cage. That's reason enough.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "For coin, Captain, and plenty of it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "For the challenge. Kurzen's locks sound interesting.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "For the Bay. A favor owed is worth more than gold.", next = "BACK", fx = { align = { order = 1 }, standing = { booty_bay = 1 } } },
      },
    },
    q_pay = {
      lines = { { id = "qp_default", text = "A sack o' good things from my own hold, and I don't stint on thanks. Beyond that, ye'll have a captain in Booty Bay who owes ye, and in this cove that's a coin ye can spend twice." } },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },
    q_where = {
      lines = {
        { id = "qw_default", text = "Somewhere in the compound proper, where Kurzen keeps the folk he means to put to work. Keep to the shadows, mind the commandos, and don't stop to pick pockets, however tempting they look." },
      },
      choices = {
        { text = "What if he's too weak to walk?", next = "q_where2" },
        { text = "I'll bring him back, Captain.", next = "END", fx = { affinity = 1 } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    q_where2 = {
      lines = { { id = "qw2_default", text = "Then he'll crawl, because Wendel's more stubborn than he looks and he'll not want to be carried. Tell him the captain's waiting with a dry berth and his own pots, and he'll find the strength." } },
      choices = { { text = "Something else, Captain.", next = "BACK", fx = { learn = { "kurzen" } } } },
    },
    q_after = {
      lines = {
        { id = "qa_default", text = "Back at his pots as if he'd never left, though he jumps at shadows now, and I can't blame him. Ye saved a crewman o' mine, {class}, and that's no small thing to a captain." },
      },
      choices = {
        { text = "What did he say about the compound?", next = "q_after2" },
        { text = "It was nothing, Captain. Kurzen's men sleep heavily.", next = "q_after_cook", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It was dangerous work. I trust your sack was worth it.", next = "q_after_cook", fx = { align = { honor = -1 } } },
      },
    },
    q_after2 = {
      lines = { { id = "qa2_default", text = "That they had him cooking for Kurzen's officers, and he put so much pepper in their stew that two of them wept at the table. That's the only fighting Wendel's ever done, and I'm prouder of it than I'd let him know." } },
      choices = {
        { text = "Will he cook for me sometime?", next = "q_after_cook", fx = { learn = { "kurzen" } } },
        { text = "Ha! Something else, Captain.", next = "BACK", fx = { affinity = 1, learn = { "kurzen" } } },
      },
    },
    q_after_cook = {
      lines = { { id = "qac_default", text = "He's a poor fighter, Wendel, and always will be, but he's a good cook, and a good cook is priceless in this line o' work. Come aboard the Gull's Wager on a stew night and ye'll taste what ye saved." } },
      choices = { { text = "I'll hold you to that. Something else.", next = "BACK" } },
    },

    -- Who the player is: race ----------------------------------------------
    k_horde = {
      big = true,
      lines = { { id = "kho_default", text = "Coin's coin, and the Baron's peace makes us all merchants on this pier. My crew don't love orcs, I'll grant ye, but they love the Bloodsail even less, and that makes us friends often enough." } },
      choices = {
        { text = "Then let the peace hold. We share one enemy.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Peace lasts only while it pays. We both know it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    k_human = {
      lines = { { id = "khu_default", text = "Westfall, once, though it's been a long time since I called it home. Ye've a Stormwind look about ye too, so tell me, is the Deadmines still full o' Defias, or has someone finally cleaned it out?" } },
      choices = {
        { text = "VanCleef is dead. I saw to it myself.", next = "BACK", when = { cleared = "The Deadmines" }, fx = { affinity = 2, learn = { "defias" } } },
        { text = "The Defias still hold it, Captain.", next = "BACK", fx = { learn = { "defias" } } },
        { text = "I couldn't say. I left Stormwind long ago.", next = "BACK" },
      },
    },
    k_undead = {
      big = true,
      lines = { { id = "kun_default", text = "Frighten them? Ye'll have every man aboard making the sign against ill luck, for sailors fear the drowned dead above all else. I've seen stranger on this pier, though, so I'll judge ye by what ye do, not by what's left of yer face." } },
      choices = {
        { text = "That's kinder than most living folk manage.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them fear me. Fear keeps fools at a distance.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    k_troll = {
      lines = { { id = "ktr_default", text = "Ye did, and I'll not argue it, for every reef map I own was drawn from what some troll told a goblin a hundred years back. If ye know a safe channel past the Wild Shore, I'd pay ye well to hear it." } },
      choices = {
        { text = "Keep to the deep water near the cape.", next = "BACK", fx = { affinity = 1 } },
        { text = "Some secrets stay with the Darkspear, Captain.", next = "BACK" },
      },
    },
    k_gnome = {
      lines = { { id = "kgn_default", text = "Ha! The last gnome who improved a ship in this cove put a steam engine in a rowboat, and it's still at the bottom o' the harbor. My goblin twins would welcome ye, though, provided ye promise nothing explodes." } },
      choices = {
        { text = "I can promise that nothing explodes on purpose.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },

    -- Who the player is: class ---------------------------------------------
    xwar = {
      big = true,
      lines = { { id = "xwar_default", text = "Badly, unless someone holds the rail, for sailors are brawlers and not soldiers. A warrior with a shield at the gangway is worth five of my lads with cutlasses, and I'd pay double to have one aboard when the Bloodsail come." } },
      choices = {
        { text = "Hold the gangway and keep the line. That wins boardings.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the line. Swing over and take their captain.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, when a mage from Theramore froze a Bloodsail rudder solid and left them turning in circles off the Cape. I paid her passage home and a barrel o' rum besides, and I'd do it again for any mage who could manage the trick." } },
      choices = {
        { text = "Magic should defend the ship, not hunt for profit.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "For a barrel of rum, I'd freeze the whole Bloodsail fleet.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "To anything that'll listen, and most loudly when the clouds turn green. My crew pray to the Light, the tides and a carved fish Tamsin keeps in her pocket, and I've stopped asking which of them does the work." } },
      choices = {
        { text = "The Light hears every sailor's prayer, Captain.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep the fish. Prayer won't patch a hull.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xhunt = {
      big = true,
      lines = {
        { id = "xhunt_default", text = "When we can, for a crew grows sick of salt pork faster than ye'd think. Wendel will cook anything ye drag aboard, though he draws the line at crocolisk and says it tastes of boot." },
        { id = "xhunt_pet", when = { pet = { type = "Beast" } }, text = "When we can, for a crew grows sick of salt pork faster than ye'd think. Keep {pet} away from Bilge, mind, because that parrot has opinions about beasts and isn't shy about them." },
      },
      choices = {
        { text = "I'd hunt for the pot and waste nothing.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I hunt for the sport, Captain. The pot's an afterthought.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think the sea minds everything and forgives nothing, and I've buried enough sailors to respect it for that. If yer kind can talk to it, tell it the Gull's Wager means no harm, and ask it kindly to keep the Bloodsail on the reefs." } },
      choices = {
        { text = "The sea keeps its own balance. I'd not ask favors.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd gladly ask it to drown a few Bloodsail.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = { { id = "xpala_default", text = "By keeping my word and choosing my friends, the same as anyone. I've done things I'll not tell a paladin about, but I've never sold a crewman and never broken a bargain with the Baron." } },
      choices = {
        { text = "Then there's honor in you, Captain, whatever your past.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Kept bargains don't wash a thief clean, Captain.", next = "BACK", fx = { affinity = -1, align = { light = 1, honor = 1 } } },
        { text = "Everyone has secrets. I'll not pry.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    xshaman = {
      big = true,
      lines = { { id = "xshaman_default", text = "They listen to the wind and nothing else, and only when it's about to tear the sails off. If the spirits have anything to say about the weather past the Cape, I'd dearly like to hear it before we sail." } },
      choices = {
        { text = "The spirits deserve respect, not just questions about weather.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The spirits answer whoever asks boldly. Ask them yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Aboard, aye, but not below decks, and ye'll keep yer little friend away from the powder. I've sailed with worse than warlocks, though few that smelled quite so much of brimstone." } },
      choices = {
        { text = "My demon obeys me. Your powder is safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where it pleases, Captain.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Westfall fisherman's daughter who followed the coin south and found a ship at the end of it.", next = "who" } },
    advice = { { id = "tp_ad", text = "Never sail on an empty stomach, never trust a red sail, and never let the cook go ashore alone." } },
    bloodsail = { { id = "tp_bloodsail", text = "They've cost me two good crewmen, and I'll see their red sails sunk before I'm done." } },
    kurzen = { { id = "tp_kurzen", text = "A mad colonel with a jungle camp and a taste for taking folk off the roads. Keep clear of his patrols." } },
    booty_bay = { { id = "tp_booty_bay", text = "It's a goblin town that lets a fisherman's daughter tie up her ship and drink in peace, and I'll take that over Menethil Harbor any day. Just keep a hand on yer purse past the Salty Sailor after dark." } },
    theramore = { { id = "tp_theramore", text = "I've run cargo to Theramore twice, and the harbor's clean and the soldiers are polite, and they still searched my hold like I was a Bloodsail. Proudmoore runs a tidy island." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Some of my crew bet their wages at the Arena every time the chest comes up, and they come back poorer and full of stories. I've never seen the sense in fighting for a box." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls up the coast at Zul'Gurub have been lighting fires at night, and the sailors who pass close say they hear drums. I keep my ship well out from that shore." } },
    second_war = { { id = "tp_second_war", text = "My father talked about the orc ships off the Westfall coast in the Second War, and he never fished north of the Dagger Hills again. I grew up on that story." } },
    _none = { { id = "tp_none", text = "That's beyond me, {class}. Ask somebody who doesn't spend their days counting barrels." } },
  },
}
