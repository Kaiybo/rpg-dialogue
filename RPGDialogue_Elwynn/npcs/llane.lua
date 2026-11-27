-- Llane Beshere, warrior trainer, Hall of Arms, Northshire Abbey. Voice: bibles/llane.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "llane", id = TODO_NPC("Llane Beshere"), name = "Llane Beshere",
  bible = "bibles/llane.md", role = "trainer", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Second War veteran who watched a warlock's demon walk through his shield line." },
  notices = { "fitness", "stance", "lock_armor" },
  impression = {
    first = "He corrected my stance before he asked what I wanted.",
    third = "{name} met Llane Beshere, Northshire's warrior trainer, who teaches a proper stance as if it were scripture.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, recruit. Come, I'll show you a guard stance that'll save your life someday." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll train you, because that's my duty, but I don't have to like it." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I stood in a shield line in the Second War and watched a demon walk through it like it was paper. Don't bring one into my yard." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "You let something else bleed for you, and then you call it fighting. I've no respect for that, and I'll not pretend I have." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've stood your own ground a time or two, I'll grant you. I still don't care for your creature, but you've earned a word." },
    { id = "g_feet", text = "Feet apart, recruit, and shield arm up, even while you're talking to me. Now, what do you need?" },
    { id = "g_drills", when = { class = "WARRIOR" }, text = "Back for more drills, are you? Good, because the dummies have been missing you." },
  },

  notice = {
    { id = "n_ressick", cat = "fitness", place = "before", when = { resSick = true },
      text = "You died recently, and I can see it in how you stand, so sit down on that bench before you fall down again." },
    { id = "n_naked", cat = "fitness", when = { nearlyNaked = true, class = "WARRIOR" },
      text = "A warrior without armour is only a target with opinions, recruit, so go and find something to put on before the kobolds hear about you." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That's a ward of demon hide crawling up your arms, isn't it? My recruits wear honest mail and earn every dent in it, so mind you don't stand where they can see you better armoured than they are." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Anyone can, if they get back up. Your spirits might lift you, but your legs still have to stand." } },
      choices = {
        { text = "I'll get back up every time, Llane. That's a promise.", next = "BACK", reply = "Good, and I'll test that promise in the yard tomorrow. Bring your shield.", fx = { align = { honor = 1 } } },
        { text = "My spirits will carry me. I'll skip the knocks.", next = "BACK", reply = "Then your spirits had better be quick, because the kobolds won't wait for them. Come back when your legs are ready.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "He could learn everything, if he's paying attention, because a bear never fights with half its weight and never stops until the fight's done. I tell the recruits to fight like that, and then they go out and fight like scarecrows." } },
      choices = {
        { text = "A bear lets a beaten foe go, too. Teach them that.", next = "BACK", reply = "That's fair, and I'll add it to the lesson, though the recruits won't believe a druid said it. I'll tell them it was my idea.", fx = { align = { honor = 1 } } },
        { text = "A bear finishes what it starts. Teach them that instead.", next = "BACK", reply = "That's what I've been telling them, and they still fight like scarecrows. Maybe they'll listen to you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That you win fights before they start, and I'll grant you that's smart. But one day the wolf gets past the beast and the arrow, and then you'll wish you'd stood in my yard a week and learned to take a hit." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That you win fights before they start, and I'll grant you that's smart. That {pet} of yours takes the hits for you, I see, so look after it, because it's doing my job." },
      },
      choices = {
        { text = "I'll learn to stand my ground when it comes to that.", next = "BACK", reply = "That's all I ask, and you'll be glad of it when the day comes. My yard's always open.", fx = { align = { order = 1 } } },
        { text = "If it comes to that, I've already lost. I'll stay back.", next = "BACK", reply = "Then make sure you stay back, because I'll not be there to pick you up. Good luck to you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd train anyone who can stand up again after I knock them down, and rogues get knocked down a lot, by my reckoning. You'll never block like a warrior, but you'll learn when to run, and that's won more fights than any parry." } },
      choices = {
        { text = "I'll stand and take your drills like anyone else.", next = "BACK", reply = "Good, and you'll take them better than most. I'll not go easy on you.", fx = { align = { honor = 1 } } },
        { text = "I'll learn to run, Llane. Standing's for fools.", next = "BACK", reply = "Running's half the fight, aye, but the other half catches up eventually. Come back when it does.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They respect what a mage can do, but not that you can't take a punch, and I've told them that's exactly why you need them. Learn to stand behind a shield wall and you'll live long enough to burn whatever's in front of it." } },
      choices = {
        { text = "I'll respect your shield wall, Llane, and stand where I'm told.", next = "BACK", reply = "That's all I'd ask, and you'll live longer for it. My warriors will thank you.", fx = { align = { honor = 1 } } },
        { text = "Your warriors should be grateful for what I can do.", next = "BACK", reply = "They are, when you're standing behind them, and not before. Earn it first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It's happened twice, and once it was a little horned thing that set the straw alight while the recruit beside it was still swinging. I'd sooner my warriors learn to fight on dummies than on whatever Drusilla La Salle lets out of the graveyard." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It's happened twice, and once the straw went up while the recruit beside it was still swinging. I'll ask you to keep that creature away from my dummies, because my recruits have stopped swinging altogether to watch it, and I'd sooner they learned to fight than to stare." },
      },
      choices = {
        { text = "I'll keep what follows me leashed and away from your recruits.", next = "BACK", reply = "Good, and the straw will thank you. Find a dummy on the far end.", fx = { align = { light = 1 } } },
        { text = "Your recruits could do with a real fight now and then.", next = "BACK", reply = "Real fights come soon enough, and I'd rather they lived to see them. Leave my recruits alone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "To stay standing when the Light goes quiet, because one day it will, and you'll still have a gnoll in front of you. Brother Sammuel teaches you to pray and I teach you to take a hit, and you'll need both before you're through." } },
      choices = {
        { text = "I'll learn both. Duty asks it of me.", next = "BACK", reply = "Good, and you'll learn them in that order, I hope. My yard's open.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light won't go quiet for me. I'll trust it.", next = "BACK", reply = "I hope it doesn't, paladin, I truly do. But I'll teach you to take a hit anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in my hall. You've a priest's heart and a warrior's arms, so let's see if you've a warrior's legs." },
        { id = "h_default", key = true, text = "Llane Beshere, and this is the Hall of Arms. Warriors are made here, not born, and mostly they're made by getting knocked down and standing back up again." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Simple Letter"), days = 1 } },
          text = "So you read the letter and found your way to me, which is the first test passed. Now let's see if you can stand." },
        { id = "h_warrior_blooded", when = { class = "WARRIOR", band = "Blooded" },
          text = "You've put on some muscle since I saw you last, but you're still dropping your guard on the left, and the kobolds have noticed even if you haven't." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, always trying to win a fight from across the field. Come in, then, and I'll show you what happens when the field runs out." },
        { id = "h_other", when = { ["not"] = { class = { "WARRIOR", "HUNTER" } } },
          text = "You're not my student, but the drills wouldn't kill you, and I've seen them save a few who thought they never needed them." },
        { id = "h_bruise", when = { metBefore = true, class = "WARRIOR" }, text = "You're standing straighter, and the bruises are in better places. That's progress, recruit." },
        { id = "h_dawn", when = { metBefore = true }, text = "The recruits ran the yard twice this morning. One cried and one laughed, and the one who laughed is the one I'm worried about." },
        { id = "h_ten", tags = { "news" }, when = { class = "WARRIOR", minLevel = 10, maxLevel = 14 },
          text = "You've outgrown my yard, recruit, and it's time you went down the road to Goldshire. Ask me about it before you go, because there's a test waiting that I'll not spoil." },
        { id = "h_old", when = { class = "WARRIOR", minLevel = 50 },
          text = "Light above, look at you in that plate. I'd salute, but my recruits would never let me forget it, so come and stand where they can see what they might become." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 20 },
          text = "Look at the scars on you. Somebody's been earning them properly, so stand there and let me see if the left guard ever got fixed." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my yard. You'll want to run the drills with my recruits, I expect, or else you're here to steal the practice swords." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in the practice yard. Stand at the back, recruit, because my warriors swing wide." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in my yard, and don't think I can't tell. Keep that creature off my training dummies, because they're hard enough to replace as it is." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "A warlock in my yard, and you know I can tell. I've seen what your kind calls up, so keep it off my dummies and away from my recruits." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You again. You've never let that creature near my recruits, and that counts for something here, even if it's not much." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you stand like someone who's never been knocked down by anything but weather. We'll see about that." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and your stance is wrong, spirits or not, so you'll be knocked down in my yard like everyone else. Then you'll get back up, and that's the whole lesson." },
      },
      again = {
        { id = "h_again", text = "Anything else, recruit? Ask while you stretch; you'll want the breath later." },
        { id = "h_again2", text = "Go on, and quickly; the yard doesn't run itself." },
        { id = "h_again3", when = { class = "WARRIOR" }, text = "What else? Ask it from a proper stance, and I'll answer it properly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Have you any advice for me, Llane?", next = "advice" },
        { text = "Why charge in, when I could walk up careful?", next = "charge", when = { class = "WARRIOR", maxLevel = 9 } },
        { text = "Rend, Thunder Clap, Hamstring. Which matters most?", next = "kit", when = { class = "WARRIOR", minLevel = 4, maxLevel = 14 } },
        { text = "Where do I go when I've outgrown this yard?", next = "goldshire", when = { class = "WARRIOR", minLevel = 8, maxLevel = 19 } },
        { text = "My father fought in the Second War too.", next = "father", when = { class = "WARRIOR", race = "Human" } },
        { text = "How do I stop getting knocked down?", next = "stance", when = { class = "WARRIOR", maxLevel = 12 } },
        { text = "I've fought a long way from this hall since.", next = "veteran", when = { class = "WARRIOR", minLevel = 20 } },
        { text = "Anything for a priest to learn in here?", next = "priest", when = { class = "PRIEST" } },
        { text = "Do you train dwarves the same as humans?", next = "dwarf", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "I doubt a gnome can learn your stance.", next = "gnome", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "What do you think of the other trainers here?", next = "trainers" },
        { text = "Would you train a rogue alongside your warriors?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your warriors don't seem to respect the mages here.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your dummies look like something with claws has been at them.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does a warrior trainer think of hunters?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What can a warrior teach a paladin, Llane?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A warrior could learn a lot from watching a bear fight.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a shaman learn to fight like a warrior, Llane?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to the recruits.", next = "END" },
      },
    },
    charge = {
      lines = {
        { id = "ch_default", text = "Because walking up careful gives the kobold time to think, and the one thing a kobold does well is think about running. Charge closes the distance before it's decided, and it fills you with the first bit of rage you'll need to do anything else." },
      },
      choices = {
        { text = "Then I'll charge every time and never wait.", next = "BACK", reply = "Bold, and the kobolds will learn to fear you, or you'll learn to count them first.", fx = { align = { order = -1 } } },
        { text = "I'll pick my moment, then charge.", next = "BACK", reply = "Good, because a moment picked well is worth three charged in blind.", fx = { align = { order = 1 } } },
        { text = "What if there's more than one?", next = "charge_wait" },
        { text = "Where does the rage come from?", next = "charge_rage" },
      },
    },
    charge_wait = {
      lines = { { id = "cw_default", text = "Then you mind you never charge into three when you meant to charge into one, because the Hall of Arms has buried recruits who learned that the hard way at Echo Ridge." } },
      choices = { { text = "One at a time. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    charge_rage = {
      lines = { { id = "cr_default", text = "From being hit and from hitting, and from the charge itself, and it drains away when you stand about with nothing to do. The brothers say it's anger and they pray against it, but in my yard it's fuel, and I'll not apologise for that." } },
      choices = { { text = "Fuel, then. Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    kit = {
      big = true,
      lines = {
        { id = "kit_default", text = "Rend, because it keeps working while you do something else, and that's the beginning of thinking like a warrior. Thunder Clap's for when the kobolds come in a pack, and Hamstring's for the one that tries to run off and fetch its friends." },
      },
      choices = {
        { text = "I'll hamstring every one that runs. None get away.", next = "BACK", reply = "Hard, but right, because the one that gets away comes back with six more.", fx = { align = { honor = -1 } } },
        { text = "If it runs, I'll let it go. It's beaten.", next = "BACK", reply = "Merciful, and I'll not fault you for it, but count its friends when it comes back.", fx = { align = { honor = 1 } } },
        { text = "Something else, Llane.", next = "BACK" },
      },
    },
    goldshire = {
      lines = {
        { id = "gs_default", text = "Down the road to Goldshire, where Lyria Du Lac teaches at the Lion's Pride. She'll send you on to an old soldier in Stormwind called Harry Burlguard, and what he does with you there is a test I'll not spoil, except to say you'll want your fists more than your sword." },
        { id = "gs_dwarf", when = { race = { "Dwarf", "Gnome" } }, text = "Lyria Du Lac in Goldshire can take you on for now, but your own people keep a test for you in Ironforge, with Muren Stormpike in the Hall of Arms. Go and see him when you're ready, because Defensive Stance is earned there, not handed out." },
      },
      choices = {
        { text = "What's this test, then?", next = "goldshire_test" },
        { text = "I'll miss the dents in your floor.", next = "BACK", reply = "You'll add to someone else's floor now. Write if you remember how.", fx = { affinity = 1 } },
        { text = "I'll be on my way, then.", next = "BACK" },
      },
    },
    goldshire_test = {
      lines = { { id = "gt_default", text = "It's the day you learn your second stance, the one for holding rather than hitting, and every warrior who's worth anything remembers it. I won't say more, except that you should go to it sober, because the other fellow won't be." } },
      choices = { { text = "Sober it is. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    father = {
      lines = { { id = "fa_default", text = "Then you'll have heard what I heard, about orcs that hit like falling trees and a mountain that burned for days. Mine came home from Blackrock Spire and never talked about it but once, and that once is why I teach shields." } },
      choices = {
        { text = "Mine never came home.", next = "father_lost" },
        { text = "Mine talks about nothing else.", next = "BACK", reply = "Then listen anyway, even the tenth time, because one day you'll want to and he'll be gone.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_lost = {
      lines = { { id = "fl_default", text = "I'm sorry, recruit, truly, and there are more of you in this yard than you'd think. Learn to hold the shield the way he did, and some of what he was comes home in you." } },
      choices = {
        { text = "I'll fight the way he would have.", next = "BACK", reply = "Then he'd be proud, and so will I. Go on.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll fight my own way, not his.", next = "BACK", reply = "Fair enough, and it's your right. Just keep the shield up, whatever way you fight.", fx = { align = { honor = -1 } } },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Hit first and hit hard, and don't stop until it stops moving, because a fight you leave half-finished has a habit of following you home." },
        { id = "a_green", when = { class = "WARRIOR", band = "Greenhorn" },
          text = "Charge in, then keep them close. A warrior at range is a corpse with good intentions." },
      },
      choices = {
        { text = "And if it doesn't stop moving?", next = "advice_more" },
        { text = "Understood, Llane. Hit first and keep hitting.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "That sounds simple enough.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    advice_more = {
      lines = {
        { id = "am_default", text = "Then you were fighting the wrong thing, or fighting it wrong. Walk away, find out which, and come back, because pride makes a poor shield." },
      },
      choices = { { text = "Walk away and come back smarter. I'll remember that.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } } },
    },
    stance = {
      lines = {
        { id = "s_default", text = "Keep your weight low and your feet wider than you like, and your shield arm doesn't drop just because you're tired. Everyone's tired, kobolds especially." },
      },
      choices = {
        { text = "Show me.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Standing wider seems too simple.", next = "stance_more" },
      },
    },
    stance_more = {
      lines = {
        { id = "sm_default", text = "It is that simple, and you do it a thousand times until you do it asleep. Then I'll show you the second thing, though most never get that far." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    veteran = {
      lines = {
        { id = "v_default", text = "I can tell, because you walked in here like the door owed you something. Tell me one thing the road taught you that I didn't, and I'll pass it on to the new ones." },
        { id = "v_plate", when = { minLevel = 40 }, text = "I can tell, because you came in wearing plate and didn't clank once, which takes years. Tell me one thing the road taught you that I didn't, and I'll pass it on to the new ones." },
      },
      choices = {
        { text = "That nobody fights fair, Llane.", next = "veteran_fair", fx = { affinity = 1 } },
        { text = "When to run.", next = "veteran_run", fx = { trait = { cautious = 1 }, affinity = 2 } },
        { text = "That the berserker's stance is worth the cost.", next = "veteran_berserk", when = { minLevel = 30 } },
      },
    },
    veteran_fair = {
      lines = { { id = "vf_default", text = "I told you that on your first morning, and you didn't believe me, but nobody does until it costs them a tooth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran_run = {
      lines = { { id = "vr_default", text = "That's a good answer, and a better one than mine, so I'll be telling the new ones and taking the credit for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran_berserk = {
      lines = { { id = "vb_default", text = "Is it, now? I never learned it, because I was a shield man to the end, and Wu Shen in Stormwind will tell you I was right. Tell my recruits about it when they're older, and not one day sooner, or I'll have them charging the kobolds bare-chested." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "One thing: stand behind me, not beside me and not in front of me. If you're ever in front, I've failed, and so have you." },
      },
      choices = {
        { text = "Behind you, then, and I'll keep you standing.", next = "BACK", reply = "Good, that's the arrangement, and I'll hold my end of it. You hold yours.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll stand where I'm needed, not where I'm told.", next = "BACK", reply = "Then you'll be in front when it matters, and I'll have failed you. I'd rather you listened.", fx = { align = { order = -1 } } },
        { text = "And if I'd rather fight?", next = "priest_fight" },
      },
    },
    priest_fight = {
      lines = { { id = "pf_default", text = "Then you'll fight and heal yourself, and nobody will heal me, which is a poor bargain for both of us. Pick a job and do it well." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    dwarf = {
      lines = { { id = "dwarf_l", text = "No. I train humans to plant their feet, and I train dwarves to lift theirs now and then, because a dwarf who never steps gets surrounded. They make different mistakes, but they end up with the same bruises." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Learn it? I've changed it for you. Lower, wider and angry, because a kobold your size is a fair fight, and you'll get in under anything bigger." } },
      choices = { { text = "Lower, wider and angry. I can manage angry.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    trainers = {
      lines = { { id = "trainers_l", text = "Priestess Anetta mends what I break, Khelden Bremen keeps his mages out of my yard, and Jorik Kerridan behind the stables thinks I can't hear him laughing at my drills. I can, and I'm keeping count." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You've the makings of a real soldier, and I've seen enough to know the difference." },
    },
    grievance = {
      { id = "dp_gv", text = "You've shown me little discipline, and discipline is the only thing that holds a shield line." },
    },
    background = { { id = "tp_bg", text = "I train recruits in the Hall of Arms, and before that I was one, and that's all the story a trainer needs." } },
    advice = { { id = "tp_ad", text = "Your shield arm will want to drop, and you mustn't let it. That's the whole lesson, and nobody learns it the first time." } },
    northshire_abbey = { { id = "tp_abbey", text = "The brothers have the halls with books in them, and I have the one with the dents in the floor. We each think ours is the more useful." } },
    kobolds = { { id = "t_kobolds", text = "They're small and fast and cowardly, which makes them perfect practice for a recruit who's all three." } },
    _none = { { id = "t_none", text = "Do I look like a librarian to you? Ask Brother Sammuel, or ask me about shields." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "I send recruits to Echo Ridge when they think they're ready, and the kobolds tell them otherwise. The ones who come back humble are the ones worth training." } },
    second_war = { { id = "tp_second_war", text = "My father fought at Blackrock Spire in the Second War, and he said the orcs hit like falling trees. I teach shields because of him." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The brothers pray and I drill, and between us the recruits leave here able to stand up in a fight and kneel after one. It's a good arrangement." } },
    scourge = { { id = "tp_scourge", text = "If you're ever sent north against the dead, keep your shield up even after they stop moving, because sometimes they don't stay stopped." } },
  },
}
