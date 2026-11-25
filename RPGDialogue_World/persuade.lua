-- Persuasion (0.85.0): how people answer Admire, Taunt and Intimidate, and how they refuse
-- a topic when they don't think well enough of you yet (DESIGN.md §3.16).
--
-- P:Persuade { id, role, subtitle, faction, zone, subzone, admire|taunt|intimidate = { success, fail } }
-- Sets for a role outrank side and home-city sets, which outrank everyone's. Lines take the
-- usual conditions on the player (race, class, gender, faction, disposition). A named NPC
-- can add their own: persuade = { admire = { success = { lines }, fail = { lines } }, ... }.
-- No bribes, no alignment, no promises the game can't keep.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Everyone
---------------------------------------------------------------------------
P:Persuade { id = "any",
  admire = {
    success = {
      { id = "s1", text = "Well, now. It's not every day a stranger has a kind word for me, and I won't pretend I mind it." },
      { id = "s2", text = "You've a silver tongue, {class}, and I know it, but I'll take the compliment all the same." },
      { id = "s3", text = "That's good of you to say. Most folk only stop to tell me what I've done wrong." },
      { id = "s4", text = "Ha! Flattery, and before noon too. Go on, then, I'm listening." },
      { id = "s5", when = { gender = "female" }, text = "Aren't you sweet? I'd heard adventurers were all elbows and no manners, but you've proved them wrong." },
      { id = "s6", when = { race = "Dwarf" }, text = "Kind words from a dwarf are rare as rubies, so I'll keep that one somewhere safe." },
      { id = "s7", when = { race = "Gnome" }, text = "That's very kind, and very precisely put, as I'd expect from one of your folk." },
      { id = "s8", when = { race = "Tauren" }, text = "When a tauren says a kind thing, you know they mean it. Thank you, friend." },
    },
    fail = {
      { id = "f1", text = "Save your honey for someone who'll swallow it. I know when I'm being buttered up." },
      { id = "f2", text = "If you want something, {class}, ask for it plainly instead of wasting both our time with compliments." },
      { id = "f3", text = "That's very pretty, and I don't believe a word of it." },
      { id = "f4", text = "Flattery's the cheapest coin there is, and you're spending it like you've a cartload." },
      { id = "f5", when = { race = "Scourge" }, text = "A compliment from a corpse. I can't decide if that's charming or just unsettling, and I'm leaning toward the second." },
      { id = "f6", when = { race = "NightElf" }, text = "Your people have had ten thousand years to practise courtesy, and that's the best you could manage?" },
    },
  },
  taunt = {
    success = {
      { id = "s1", text = "Ha! You've got some nerve, {class}, and I'd rather deal with nerve than with simpering any day." },
      { id = "s2", text = "Oh, is that how it is? Well, I like a body who says what they think to my face." },
      { id = "s3", text = "You've a sharp mouth on you. Keep it pointed the right way and we'll get along fine." },
      { id = "s4", when = { class = "WARRIOR" }, text = "Spoken like someone who's taken a few hits and handed back more. All right, I respect that." },
    },
    fail = {
      { id = "f1", text = "I don't know who raised you, but they did a poor job of it. Mind your tongue." },
      { id = "f2", text = "Is that meant to be clever? Go and bother somebody with more patience than I have." },
      { id = "f3", text = "Charming. I'll remember that, {class}, and not fondly." },
      { id = "f4", text = "There's no call to talk to me like that. I've done nothing to you." },
      { id = "f5", when = { race = "Gnome" }, text = "Big words from someone I could put in my coat pocket. Run along." },
      { id = "f6", when = { race = "Troll" }, text = "You can keep that sort of talk for the Echo Isles, troll, because it isn't welcome here." },
    },
  },
  intimidate = {
    success = {
      { id = "s1", text = "All right, all right! There's no need for that, {class}. I'm listening, I promise you." },
      { id = "s2", text = "Easy, easy. I'm sure we can be civil about this, can't we?" },
      { id = "s3", text = "I... yes, of course. Whatever you say. I didn't mean to give offence." },
      { id = "s4", when = { race = "Orc" }, text = "By all that's holy, you're a big one. Fine, fine, I'll mind my manners." },
      { id = "s5", when = { race = "Tauren" }, text = "You needn't loom like that, I can see you perfectly well. Ask what you like, then." },
      { id = "s6", when = { race = "Scourge" }, text = "Keep your distance, please, and I'll tell you anything you like. Just keep your distance." },
    },
    fail = {
      { id = "f1", text = "Are you threatening me? I've stood up to worse than you, and in better boots." },
      { id = "f2", text = "Try that again and I'll have the guards on you before you can blink." },
      { id = "f3", text = "You want to frighten somebody, go and frighten the kobolds. I've no time for bullies." },
      { id = "f4", text = "Big talk. I've seen your sort come and go, and most of them went face down." },
      { id = "f5", when = { power = { "below", "far_below" } }, text = "You? Threaten me? Come back when you've a few more scars, {g:lad|lass}." },
      { id = "f6", when = { race = "Gnome" }, text = "Oh, I'm terribly frightened. Shall I fetch you a crate to stand on while you glower?" },
    },
  },
}

---------------------------------------------------------------------------
-- By side
---------------------------------------------------------------------------
P:Persuade { id = "horde", faction = "Horde",
  admire = {
    success = {
      { id = "s1", text = "Kind words are rare in the Horde, and rarer still when they're true. I'll remember you said them." },
      { id = "s2", text = "You honour me. Strength and good manners in one {class}, and the Alliance still calls us savages." },
    },
    fail = {
      { id = "f1", text = "Sweet talk is for the Alliance's courts. Here, we judge each other by deeds." },
      { id = "f2", text = "Flattery won't fill a belly or win a fight. Keep it." },
    },
  },
  taunt = {
    success = {
      { id = "s1", text = "Ha! There's fire in you. Good; the Horde has no use for the timid." },
    },
    fail = {
      { id = "f1", text = "Watch how you speak to your own. The Horde has enemies enough without you making more inside it." },
    },
  },
  intimidate = {
    success = {
      { id = "s1", text = "Peace, peace. We're all of the Horde here, and there's no need to bare your teeth at me." },
    },
    fail = {
      { id = "f1", text = "You'd threaten one of the Horde, in the Horde's own lands? Thrall would be ashamed of you." },
    },
  },
}

P:Persuade { id = "alliance", faction = "Alliance",
  admire = {
    success = {
      { id = "s1", text = "Why, thank you. It's good to know there's still some courtesy left in the Alliance." },
    },
    fail = {
      { id = "f1", text = "You'll find that sort of talk works better at court than out here, {class}." },
    },
  },
  taunt = {
    success = {
      { id = "s1", text = "Hah! You'd go far in the army with a mouth like that, provided you can back it up." },
    },
    fail = {
      { id = "f1", text = "We're on the same side, or had you forgotten? Save the insults for the Horde." },
    },
  },
  intimidate = {
    success = {
      { id = "s1", text = "Steady, now. We're allies, aren't we? There's no call for that look." },
    },
    fail = {
      { id = "f1", text = "The Alliance has laws, {class}, and threatening honest folk breaks a good many of them." },
    },
  },
}

---------------------------------------------------------------------------
-- Home cities and starting lands: the speaker's own people
---------------------------------------------------------------------------
P:Persuade { id = "orcs", zone = { "Orgrimmar", "Durotar" },
  admire = {
    success = { { id = "s1", text = "You speak well of me. Good; I'll see you're worth the words in battle." } },
    fail = { { id = "f1", text = "An orc doesn't need praise to know his worth. Say something useful or say nothing." } },
  },
  taunt = {
    success = { { id = "s1", text = "Ha! Lok'tar! You've a warrior's tongue, whatever else you are." } },
    fail = { { id = "f1", text = "Careful. In the old days, words like that ended with someone in the dirt." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Hrm. You've the look of one who's spilled blood. Fine, I'll hear you out." } },
    fail = { { id = "f1", text = "You try to frighten an orc? I survived the camps, whelp. You are nothing." } },
  },
}

P:Persuade { id = "trolls", subzone = { "Sen'jin Village", "Echo Isles", "Darkspear Strand" },
  admire = {
    success = { { id = "s1", text = "Ah, you be a sweet talker, mon. I like dat, so long as you don't overdo it." } },
    fail = { { id = "f1", text = "Sweet words from a stranger, dat's how de Darkspear learned to watch their backs." } },
  },
  taunt = {
    success = { { id = "s1", text = "Hah! Dat be a good one. You got some bite to you, mon." } },
    fail = { { id = "f1", text = "Watch your mouth, or de loa might be watching it for you." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Easy, mon, easy. No need for de mean look. What you want?" } },
    fail = { { id = "f1", text = "You don't scare me, mon. I've faced Zalazane's witch doctors, and they be a lot uglier than you." } },
  },
}

P:Persuade { id = "tauren", zone = { "Thunder Bluff", "Mulgore" },
  admire = {
    success = { { id = "s1", text = "Your words are gentle as spring rain. The Earth Mother smiles on kindness, and so do I." } },
    fail = { { id = "f1", text = "Words that come too easily blow away just as easily, young one." } },
  },
  taunt = {
    success = { { id = "s1", text = "Ha. You have the spirit of a young bull, all horns and noise. I can respect that." } },
    fail = { { id = "f1", text = "There is no honour in sharp words for those who have done you no harm. Walk on." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Peace. There's no need to paw the earth at me; I will listen." } },
    fail = { { id = "f1", text = "I have stood before charging kodo, little one. You will have to do far better than that." } },
  },
}

P:Persuade { id = "forsaken", zone = { "Undercity", "Tirisfal Glades" },
  admire = {
    success = { { id = "s1", text = "How quaint. It's been a long while since anyone said something kind to me, and I find it doesn't entirely revolt me." } },
    fail = { { id = "f1", text = "Spare me the pleasantries. My heart stopped beating long ago, and flattery won't restart it." } },
  },
  taunt = {
    success = { { id = "s1", text = "Ha. There's a little venom in you after all. The Dark Lady could use more of that." } },
    fail = { { id = "f1", text = "Insult me again and I'll see how well you take to the apothecaries' newest batch." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Very well, very well. I've no wish to be put in the ground a second time." } },
    fail = { { id = "f1", text = "Threaten me? I've already died once. There's very little left for you to take." } },
  },
}

P:Persuade { id = "dwarves", zone = { "Ironforge", "Dun Morogh" },
  admire = {
    success = { { id = "s1", text = "Och, away with ye! But aye, go on, say it again, I didnae quite catch it." } },
    fail = { { id = "f1", text = "Save yer sweet talk for the elves, {g:lad|lass}. A dwarf wants plain words and a full mug." } },
  },
  taunt = {
    success = { { id = "s1", text = "Ha! Ye've got stones, I'll give ye that. Come and say it again over an ale." } },
    fail = { { id = "f1", text = "Say that again and ye'll be pickin' yer teeth up off the forge floor." } },
  },
  intimidate = {
    success = { { id = "s1", text = "All right, all right, by my beard! Nae need to loom like a Dark Iron at a wake." } },
    fail = { { id = "f1", text = "Ye think ye can scare a dwarf? I've stared down Dark Irons, ye great lump." } },
  },
}

P:Persuade { id = "gnomes", subzone = { "Tinker Town", "Gnomeregan Exiles", "Anvilmar" },
  admire = {
    success = { { id = "s1", text = "Oh! Well, that's very kind, and I'd estimate at least seventy percent sincere, which is better than most." } },
    fail = { { id = "f1", text = "I've built machines that compliment better than that, and they were faulty." } },
  },
  taunt = {
    success = { { id = "s1", text = "Ha! Sharp, very sharp. You'd do well in a design review, you would." } },
    fail = { { id = "f1", text = "Rude! Unnecessarily rude, and I've lost my city, so I've had quite enough of rude today." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Eep! Yes, quite, no need for that, I'll cooperate entirely, fully, completely." } },
    fail = { { id = "f1", text = "I've survived a radiation leak and Thermaplugg's lot. You're a minor inconvenience, statistically speaking." } },
  },
}

P:Persuade { id = "kaldorei", zone = { "Darnassus", "Teldrassil" },
  admire = {
    success = { { id = "s1", text = "Your words are kind, and kindly meant, I think. Elune-adore, traveller." } },
    fail = { { id = "f1", text = "I have heard ten thousand years of honeyed speech. Yours is not the sweetest of it." } },
  },
  taunt = {
    success = { { id = "s1", text = "Bold. The Sentinels would like you, I think, if they didn't arrest you first." } },
    fail = { { id = "f1", text = "Such haste and such rudeness. The young races have a great deal to learn." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Peace, peace. There is no need for this. Speak, and I will answer." } },
    fail = { { id = "f1", text = "I have seen the Legion burn the world. You do not frighten me." } },
  },
}

P:Persuade { id = "humans", zone = { "Stormwind City", "Elwynn Forest" },
  admire = {
    success = { { id = "s1", text = "Well, aren't you a gentle sort! Stormwind could use more folk like you, and fewer tax collectors." } },
    fail = { { id = "f1", text = "I've heard nobles say prettier things than that, and I didn't believe them either." } },
  },
  taunt = {
    success = { { id = "s1", text = "Ha! You'd fit right in down at the Pig and Whistle, and I mean that kindly." } },
    fail = { { id = "f1", text = "There's a city watch for people like you, and it's never far off." } },
  },
  intimidate = {
    success = { { id = "s1", text = "All right, no need for that. I've a family, you know, so let's keep this friendly." } },
    fail = { { id = "f1", text = "Threaten me in the king's own city? Go on, try it, and see where you spend the night." } },
  },
}

---------------------------------------------------------------------------
-- By role
---------------------------------------------------------------------------
P:Persuade { id = "guard", role = { "guard", "soldier", "militia" },
  admire = {
    success = {
      { id = "s1", text = "Kind of you to say. Most folk only notice the guard when they want something or want to complain." },
      { id = "s2", text = "Hmph. Well, I do keep this post well, if I say so myself. Thank you, {class}." },
    },
    fail = {
      { id = "f1", text = "I'm on duty, {class}. Compliments won't get you past me, and they won't get you out of a fine either." },
      { id = "f2", text = "Move along. I've no time for sweet talk while I'm standing watch." },
    },
  },
  taunt = {
    success = {
      { id = "s1", text = "Ha! You've some spine. I'd rather have you beside me in a fight than half the recruits I'm given." },
      { id = "s2", text = "Mouthy, aren't you? Good. A soldier who can't take a ribbing won't last a week on the walls." },
    },
    fail = {
      { id = "f1", text = "One more word like that and you'll spend a night in the stockade to think it over." },
      { id = "f2", text = "I'm the law here, {class}, and the law doesn't take kindly to cheek." },
    },
  },
  intimidate = {
    success = {
      { id = "s1", text = "Easy there. I've a post to keep and a family to go home to, so let's not make trouble." },
    },
    fail = {
      { id = "f1", text = "Threatening a guard? That's a short walk to a long sentence. Try it and see." },
      { id = "f2", text = "I've a whole garrison behind me, {class}. Think very carefully about your next move." },
    },
  },
}

P:Persuade { id = "innkeeper", role = "innkeeper",
  admire = {
    success = {
      { id = "s1", text = "Oh, go on with you! Now I'll be smiling all evening, and the regulars will wonder what's got into me." },
      { id = "s2", text = "Ha! You've a way with words, friend. Sit by the fire a while, it's warmer than the road." },
    },
    fail = {
      { id = "f1", text = "I've heard every line there is across this bar, friend, and that's one of the tired ones." },
    },
  },
  taunt = {
    success = { { id = "s1", text = "Ha! That's the sort of cheek I hear from my best customers. You'll do." } },
    fail = { { id = "f1", text = "Keep that up and you can find somewhere else to drink. I run a respectable house." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Steady on. I don't want trouble in my common room, so let's keep this quiet and friendly." } },
    fail = { { id = "f1", text = "I've thrown out bigger brutes than you, and with a ladle. Settle down or get out." } },
  },
}

P:Persuade { id = "merchant", role = { "vendor", "banker", "auctioneer" },
  admire = {
    success = {
      { id = "s1", text = "Why, thank you! It's not often a customer has anything nice to say before they've seen the prices." },
    },
    fail = {
      { id = "f1", text = "Compliments don't come off the price, friend. I've a family to feed." },
      { id = "f2", text = "Mm-hm. Everyone's very charming right before they ask for credit." },
    },
  },
  taunt = {
    success = { { id = "s1", text = "Ha! You'd make a fine haggler with that tongue. I'll watch my margins around you." } },
    fail = { { id = "f1", text = "Rude customers are still customers, but only just. Mind yourself." } },
  },
  intimidate = {
    success = { { id = "s1", text = "No need for any unpleasantness! I'm sure we can do business like civilised folk." } },
    fail = { { id = "f1", text = "Lean on me all you like. I've dealt with goblin collectors, and you're nothing next to them." } },
  },
}

P:Persuade { id = "smith", role = "blacksmith",
  admire = {
    success = { { id = "s1", text = "Aye, the work's good, isn't it? Nice to have somebody notice it instead of just complaining it's dented." } },
    fail = { { id = "f1", text = "Words are cheap. Steel isn't. Tell me what you need fixed." } },
  },
  taunt = {
    success = { { id = "s1", text = "Ha! You've got a temper like a good forge, and I can work with that." } },
    fail = { { id = "f1", text = "Careful. I've a hammer in my hand and a long day behind me." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Fine, fine. Put the scowl away and I'll hear what you've got to say." } },
    fail = { { id = "f1", text = "You see these arms? I swing a hammer all day. Try me." } },
  },
}

P:Persuade { id = "trainer", role = "trainer",
  admire = {
    success = { { id = "s1", text = "I appreciate that. Teaching is a thankless trade more often than not." } },
    fail = { { id = "f1", text = "Praise won't make you learn any faster, {class}. Practice will." } },
  },
  taunt = {
    success = { { id = "s1", text = "Ha. That's the spirit I like to see in a student, so long as you can take as good as you give." } },
    fail = { { id = "f1", text = "Insult your teacher and you'll find the lessons get a great deal harder." } },
  },
  intimidate = {
    success = { { id = "s1", text = "Very well. Clearly you've learned a few things since you started, and threatening people is one of them." } },
    fail = { { id = "f1", text = "I taught half the people who could beat you. Sit down." } },
  },
}

P:Persuade { id = "warrior_trainer", role = "trainer", subtitle = "warrior",
  taunt = {
    success = {
      { id = "s1", text = "Ha! Now that's how a warrior should talk. Back it up on the training dummies and we'll get on fine." },
      { id = "s2", when = { class = "WARRIOR" }, text = "Good. A warrior who can't bark is a warrior who won't bite. You'll go far." },
    },
  },
}

P:Persuade { id = "peon", role = { "peon", "worker" },
  admire = {
    success = { { id = "s1", text = "Me? Nobody ever say nice things to me. Uh, thanks. Zug zug." } },
    fail = { { id = "f1", text = "You trying to trick me into more work? It won't work. Probably." } },
  },
  taunt = {
    fail = { { id = "f1", text = "Why everybody always mean to me? I'm working, I'm working!" } },
  },
  intimidate = {
    success = {
      { id = "s1", text = "Okay, okay! Don't whip me, I go faster now, see?" },
      { id = "s2", text = "I didn't do it! Whatever it was, it was the other peon." },
    },
  },
}

P:Persuade { id = "flightmaster", role = { "flightmaster", "stablemaster" },
  admire = {
    success = { { id = "s1", text = "Kind of you. The beasts get all the compliments around here, so it's nice to get one myself." } },
    fail = { { id = "f1", text = "Sweet words won't get you there any faster. The beasts fly at their own pace." } },
  },
  taunt = {
    fail = { { id = "f1", text = "Talk to me like that and you can walk to wherever you're going." } },
  },
  intimidate = {
    fail = { { id = "f1", text = "Threaten me in front of the beasts again and they'll be the ones you answer to." } },
  },
}

---------------------------------------------------------------------------
-- Joke (0.87.0): you tell them one, and they laugh or they don't.
---------------------------------------------------------------------------
P:Persuade { id = "joke_any",
  joke = {
    success = {
      { id = "s1", text = "Ha! Oh, that's a good one, {class}. I'll be telling that at supper and passing it off as my own." },
      { id = "s2", text = "Now that did me good. I haven't had a proper laugh since the last caravan came through." },
      { id = "s3", text = "Ha ha! You've missed your calling, friend, because there's a tavern somewhere that would feed you for that." },
      { id = "s4", text = "Oh, stop, you'll have me in stitches, and I've work to finish before dark." },
      { id = "s5", text = "That's terrible, truly terrible, and I'm laughing anyway, so I suppose you win." },
      { id = "s6", when = { race = "Gnome" }, text = "Ha! I didn't expect that from a gnome; I was braced for something about gear ratios." },
      { id = "s7", when = { race = "Dwarf" }, text = "Ha! Trust a dwarf to know a good one. That's a joke with some ale behind it." },
      { id = "s8", when = { race = "Troll" }, text = "Ha! You trolls laugh at the strangest things, and it seems I do too." },
      { id = "s9", when = { race = "Scourge" }, text = "Gallows humour from someone who's been to the gallows and back. I shouldn't laugh, but there it is." },
    },
    fail = {
      { id = "f1", text = "Was that meant to be funny? I'll laugh later, {class}, when I've worked out which part was the joke." },
      { id = "f2", text = "I heard that one from my grandfather, and it was old when he told it." },
      { id = "f3", text = "Hm. I'm sure it's very amusing wherever you come from." },
      { id = "f4", text = "I've had a long day, friend, and that didn't make it any shorter." },
      { id = "f5", text = "You'll forgive me if I don't laugh. There's not been much to laugh about around here lately." },
      { id = "f6", when = { race = "Tauren" }, text = "Perhaps it's funnier in your own tongue. In mine it just sort of lay there, I'm afraid." },
      { id = "f7", when = { race = "NightElf" }, text = "Ten thousand years to polish a jest, and that's the one you chose to bring me?" },
      { id = "f8", when = { race = "Scourge" }, text = "Jokes from the dead, now. I liked it better when your sort only moaned." },
    },
  },
}

P:Persuade { id = "joke_horde", faction = "Horde",
  joke = {
    success = {
      { id = "s1", text = "Ha! Good. A Horde that can't laugh at itself is only an army, and we're meant to be more than that." },
      { id = "s2", text = "Ha, that's a fine one! I'll carry it to the next campfire, {class}." },
    },
    fail = {
      { id = "f1", text = "There's a time for jests, {class}, and it's after the work is done and the dead are counted." },
    },
  },
}

P:Persuade { id = "joke_alliance", faction = "Alliance",
  joke = {
    success = {
      { id = "s1", text = "Ha! Light knows we could all do with a laugh these days. Thank you for that, {class}." },
      { id = "s2", text = "Oh, very good! I shall have to remember that one for the next feast day." },
    },
    fail = {
      { id = "f1", text = "I'm sure that goes down well in the barracks, {class}, but it's wasted on me." },
    },
  },
}

P:Persuade { id = "joke_orcs", zone = { "Orgrimmar", "Durotar" },
  joke = {
    success = { { id = "s1", text = "Ha! Even my old wolf would have laughed at that, and he bites people who smile at him." } },
    fail = { { id = "f1", text = "Orcs laugh after the battle, not instead of it. Bring me a victory, and then your jest." } },
  },
}

P:Persuade { id = "joke_trolls", subzone = { "Sen'jin Village", "Echo Isles", "Darkspear Strand" },
  joke = {
    success = { { id = "s1", text = "Ha ha! Dat's a good one, mon. Even Bwonsamdi be laughin' at dat, and he's heard dem all." } },
    fail = { { id = "f1", text = "Ya tell it like a tax collector, mon. A joke needs a little rhythm, and you got none." } },
  },
}

P:Persuade { id = "joke_tauren", zone = { "Thunder Bluff", "Mulgore" },
  joke = {
    success = { { id = "s1", text = "Ho! The Earth Mother gave us laughter for days like this one. That was well told, friend." } },
    fail = { { id = "f1", text = "I've turned it over twice, as I'd turn a stone, and I still can't find the laughter under it." } },
  },
}

P:Persuade { id = "joke_forsaken", zone = { "Undercity", "Tirisfal Glades" },
  joke = {
    success = { { id = "s1", text = "Ha. I didn't know I could still do that. How unsettling, and how pleasant." } },
    fail = { { id = "f1", text = "I died once already, and that was a livelier affair than your joke." } },
  },
}

P:Persuade { id = "joke_dwarves", zone = { "Ironforge", "Dun Morogh" },
  joke = {
    success = { { id = "s1", text = "Hah! By my beard, that's a good one! Ye'll tell it again at the tavern, and I'll stand there laughin' twice." } },
    fail = { { id = "f1", text = "I've heard funnier from a cracked anvil, {g:lad|lass}. Try it again after an ale or three." } },
  },
}

P:Persuade { id = "joke_gnomes", subzone = { "Tinker Town", "Gnomeregan Exiles", "Anvilmar" },
  joke = {
    success = { { id = "s1", text = "Ha! Oh, that's excellent, and structurally sound too: set-up, misdirection, payoff. I'm writing it down." } },
    fail = { { id = "f1", text = "I see what you were attempting, but the timing was off by at least a second and a half." } },
  },
}

P:Persuade { id = "joke_kaldorei", zone = { "Darnassus", "Teldrassil" },
  joke = {
    success = { { id = "s1", text = "Ha. It has been a long age since an outsider made me laugh, and I thank you for it." } },
    fail = { { id = "f1", text = "The young races laugh so easily. I wonder sometimes what it is you hear that we don't." } },
  },
}

P:Persuade { id = "joke_humans", zone = { "Stormwind City", "Elwynn Forest" },
  joke = {
    success = { { id = "s1", text = "Ha! That's better than anything the criers have had to say all week, I can tell you." } },
    fail = { { id = "f1", text = "I'd keep that one away from the Cathedral Square if I were you, {class}." } },
  },
}

P:Persuade { id = "joke_guard", role = { "guard", "soldier", "militia" },
  joke = {
    success = {
      { id = "s1", text = "Ha! Don't let the captain see me laughing on watch, {class}, but that was worth the risk." },
      { id = "s2", text = "Heh. A long watch goes quicker with a laugh in it, so I'll thank you for that one." },
    },
    fail = {
      { id = "f1", text = "I'm on duty, {class}, and my face is too. Move along." },
      { id = "f2", text = "Very droll. Now stand clear of the road, because you're blocking my view of it." },
    },
  },
}

P:Persuade { id = "joke_innkeeper", role = "innkeeper",
  joke = {
    success = {
      { id = "s1", text = "Ha ha! Now that one's new to me, and I thought I'd heard every joke that ever leaned on this bar." },
      { id = "s2", text = "Oh, that's a keeper! I'll have the whole common room groaning at it by nightfall." },
    },
    fail = {
      { id = "f1", text = "I hear that one every night around closing, friend, and it's never once been funny." },
    },
  },
}

P:Persuade { id = "joke_merchant", role = { "vendor", "banker", "auctioneer" },
  joke = {
    success = { { id = "s1", text = "Ha! Very good. A customer who makes me laugh is a rare thing, and a welcome one." } },
    fail = { { id = "f1", text = "Amusing, I'm sure. Were you going to buy something, or only perform?" } },
  },
}

P:Persuade { id = "joke_smith", role = "blacksmith",
  joke = {
    success = { { id = "s1", text = "Ha! Careful, now, you nearly made me miss the anvil, and that's a costly sort of joke." } },
    fail = { { id = "f1", text = "I can't hear half of what you say over the hammer, and I don't think I've missed much." } },
  },
}

P:Persuade { id = "joke_trainer", role = "trainer",
  joke = {
    success = { { id = "s1", text = "Ha! Good. A student who can laugh will last longer than one who can only scowl." } },
    fail = { { id = "f1", text = "If you put as much work into your training as into your jests, you'd be a master by now." } },
  },
}

P:Persuade { id = "joke_peon", role = { "peon", "worker" },
  joke = {
    success = { { id = "s1", text = "Heh heh! Me like that one. Me tell it to the others, if me can remember the end." } },
    fail = { { id = "f1", text = "Me not get it. Is it about work? Me hope it not about more work." } },
  },
}

P:Persuade { id = "joke_flightmaster", role = { "flightmaster", "stablemaster" },
  joke = {
    success = { { id = "s1", text = "Ha! Even the beasts pricked their ears up at that one, and they've no sense of humour at all." } },
    fail = { { id = "f1", text = "The beasts didn't laugh either, if that's any comfort to you." } },
  },
}

---------------------------------------------------------------------------
-- "I've nothing to say to you about that." When they don't think well enough of you yet.
---------------------------------------------------------------------------
P:Generic { id = "gated", topics = {
  _gated = {
    { id = "g1", text = "I've nothing to say to you about that." },
    { id = "g2", text = "That's not something I discuss with strangers, and you're still a stranger to me." },
    { id = "g3", text = "Why would I tell you that? I barely know you, and what I know I don't much like." },
    { id = "g4", text = "Ask me again when I've a reason to trust you. Today isn't that day." },
    { id = "g5", when = { faction = "Horde" }, text = "You haven't earned that, {class}. Earn it, and then we'll talk." },
    { id = "g6", when = { faction = "Alliance" }, text = "I'll thank you to keep your nose out of that, at least until I know you better." },
    { id = "g7", when = { disposition = { max = 19 } }, text = "Get away from me. I wouldn't tell you the time of day." },
  },
} }

P:Pool { id = "gated_guard", role = "guard", askOnly = true, topics = {
  _gated = {
    { id = "g1", text = "That's guard business, not yours. Move along." },
    { id = "g2", text = "I don't share watch talk with anyone I don't trust, and I don't trust you yet." },
  },
} }

P:Pool { id = "gated_innkeeper", role = "innkeeper", askOnly = true, topics = {
  _gated = {
    { id = "g1", text = "What's said in my house stays in my house, friend, at least until I know who's asking." },
  },
} }

---------------------------------------------------------------------------
-- When they dislike you (0.90.0). Three "ask anyone" topics that only show at Cold or worse
-- ("spite" only at Hostile), answered by what's turning them against you (`grudge`).
---------------------------------------------------------------------------
P:Generic { id = "grudges", topics = {
  -- Advice given in spite: rude, and still true.
  advice = {
    { id = "adv_sour1", when = { disposition = { max = 34 } }, text = "Advice? Fine. Never fight two at once, never pull more than you can kill, and never come back here." },
    { id = "adv_sour2", when = { disposition = { max = 34 } }, text = "Keep your bags full of bandages and your mouth shut. The second one you've plainly never managed." },
    { id = "adv_sour3", when = { disposition = { max = 34 }, maxLevel = 20 }, text = "Train your skills every time you level, whelp. Then at least you'll die for a better reason." },
    { id = "adv_sour4", when = { disposition = { max = 19 } }, text = "Want some advice? The guards here know your face. Stay out of trouble in this town, or they'll make trouble for you." },
    { id = "adv_sour5", when = { disposition = { max = 34 }, faction = "Horde" }, text = "Watch the roads near Alliance towns. Their guards don't ask questions first, and nobody here would miss you." },
    { id = "adv_sour6", when = { disposition = { max = 34 }, faction = "Alliance" }, text = "Stay clear of the Horde's towns. Their guards cut first and ask after, and I'd not lose sleep over it." },
    { id = "adv_sour7", when = { disposition = { max = 34 } }, text = "Learn to bandage yourself. You'll need it often enough, and nobody round here is going to do it for you." },
    { id = "adv_sour8", when = { disposition = { max = 34 } }, text = "Buy a map and use it. You've been wandering about this place like a lost goat all week." },
    { id = "adv_sour9", when = { disposition = { max = 34 }, class = "ROGUE" }, text = "Keep to the shadows, {class}. It's the one place nobody has to look at you." },
    { id = "adv_sour10", when = { disposition = { max = 34 }, class = "WARLOCK" }, text = "Keep that demon of yours on a short leash. If it so much as sniffs at me, I'm calling the guard." },
    { id = "adv_sour11", when = { disposition = { max = 34 }, class = "PALADIN" }, text = "Save your sermons for somebody who asked for one. Nobody here did." },
    { id = "adv_sour12", when = { disposition = { max = 34 }, minLevel = 50 }, text = "Take all that power somewhere it's needed, like Blackrock Mountain, and stay there a good long while." },
    { id = "adv_sour13", when = { disposition = { max = 34 }, class = "HUNTER" }, text = "Feed that animal of yours. It looks hungrier than you do, and twice as likely to bite." },
    { id = "adv_sour14", when = { disposition = { max = 34 }, class = "MAGE" }, text = "Conjure yourself some manners. You've plainly the mana for water and bread, so it can't be that hard." },
    { id = "adv_sour15", when = { disposition = { max = 34 }, class = "PRIEST" }, text = "Heal yourself before you go preaching at the rest of us. You look like you need it more." },
  },
  grievance = {
    { id = "gr1", text = "My problem? I don't like you, and I don't have to explain myself to you." },
    { id = "gr2", text = "You know full well what you did. Don't stand there pretending you don't." },
    { id = "gr_wronged", when = { grudge = "wronged" }, text = "You said what you said to me, and I haven't forgotten a word of it. Neither should you." },
    { id = "gr_wronged2", when = { grudge = { worst = "wronged" } }, text = "I gave you a fair hearing once, and you threw it back in my face. That's my problem." },
    { id = "gr_prej_h", when = { grudge = "prejudice", faction = "Horde" }, text = "Look at you, and then look at the folk who raised me. Some things don't need saying, {class}." },
    { id = "gr_prej_a", when = { grudge = "prejudice", faction = "Alliance" }, text = "I've seen what your kind does when nobody's watching. I'll not pretend otherwise to be polite." },
    { id = "gr_prej", when = { grudge = { worst = "prejudice" } }, text = "It's not what you've done. It's what you are, and I'll not apologise for seeing it plainly." },
    { id = "gr_tone_p", when = { grudge = "tone", tone = "polite" }, text = "All that bowing and scraping. Say what you mean plainly, or don't bother me at all." },
    { id = "gr_tone_b", when = { grudge = "tone", tone = "blunt" }, text = "You talk to me like I'm a dog in the road. Mind your tongue and we'll see." },
    { id = "gr_pers", when = { grudge = "persuade" }, text = "You tried to push me about, and I'm still sore from it. Did you think I'd forget so quickly?" },
    { id = "gr_town", when = { grudge = "town" }, text = "Folk around here talk, and nobody here has a kind word for you. I've no reason to be the first." },
    { id = "gr_rival", when = { grudge = "rival" }, text = "I've seen who you keep company with. A friend of theirs is no friend of mine." },
    { id = "gr_values", when = { grudge = "values" }, text = "I know what sort you are by now. I've watched how you carry yourself, and I don't like it." },
    { id = "gr_temper", when = { grudge = { worst = "temper" } }, text = "Don't flatter yourself. I don't like anybody much, and you're no exception." },
    { id = "gr_enemy", when = { grudge = "enemy" }, text = "You're standing in the wrong town wearing the wrong colours. That's problem enough for anybody." },
    { id = "gr_al_shadow", when = { grudge = "alignment", alignment = { axis = "light", max = -30 } }, text = "There's a darkness on you, {class}. I can feel it from here, and I want no part of it." },
    { id = "gr_al_light", when = { grudge = "alignment", alignment = { axis = "light", min = 30 } }, text = "All that holy shine. I've seen what the righteous do when they're sure they're right." },
    { id = "gr_al_chaos", when = { grudge = "alignment", alignment = { axis = "order", max = -30 } }, text = "You answer to nobody and you're proud of it. Folk like you are why we need walls and laws." },
    { id = "gr_al_order", when = { grudge = "alignment", alignment = { axis = "order", min = 30 } }, text = "You'd follow any order that came with a seal on it. I've no use for that kind of loyalty." },
    { id = "gr_al_liar", when = { grudge = "alignment", alignment = { axis = "honor", max = -30 } }, text = "Every word out of your mouth has a hook in it. I've heard enough to know you lie easily." },
    { id = "gr_al_honor", when = { grudge = "alignment", alignment = { axis = "honor", min = 30 } }, text = "You and your precious honour. It's easy to keep your hands clean when someone else does the dirty work." },
    { id = "gr3", text = "My problem is you walk about as though the rest of us are scenery. We're not, and I've had enough of it." },
    { id = "gr4", text = "I don't owe you an answer, but here's one anyway: I don't trust you, and I've good reason not to." },
    { id = "gr5", text = "You're the sort who's always somewhere else when the bill comes due. I've known plenty, and you're one." },
    { id = "gr6", text = "Every time you come through here, trouble isn't far behind you. I've watched it happen, and I'm tired of it." },
    { id = "gr_wronged3", when = { grudge = "wronged" }, text = "You made a fool of me in front of folk I have to see every day. You'll be gone tomorrow, and I'll still be here." },
    { id = "gr_tone_p2", when = { grudge = "tone", tone = "polite" }, text = "Every word out of you is so sweet it makes my teeth ache, and I don't believe a drop of it." },
    { id = "gr_tone_b2", when = { grudge = "tone", tone = "blunt" }, text = "You bark at people like you're their sergeant. You're not mine, and you never will be." },
    { id = "gr_pers2", when = { grudge = { worst = "persuade" } }, text = "First you tried to talk me round, then you tried to frighten me. Neither worked, and this is what you've got instead." },
    { id = "gr_town2", when = { grudge = { worst = "town" } }, text = "Ask anyone in {town} what they think of you. I'm only saying it to your face, which is more than they'll do." },
    { id = "gr_rival2", when = { grudge = { worst = "rival" } }, text = "You're thick with the very folk who've made my life a misery, and I need no better reason than that." },
    { id = "gr_values2", when = { grudge = { worst = "values" } }, text = "We want different things from this world, and I've seen enough of what you want to know I want none of it." },
    { id = "gr_enemy_h", when = { grudge = "enemy", faction = "Horde" }, text = "Your Horde burned half of Lordaeron in my father's day, and now you want me to smile at you?" },
    { id = "gr_enemy_a", when = { grudge = "enemy", faction = "Alliance" }, text = "Your Alliance kept people in camps for years. Don't come here asking me what my problem is." },
    { id = "gr_al_order2", when = { grudge = "alignment", alignment = { axis = "order", min = 30 } }, text = "You're forever quoting the rules at people. Some of us have to live in the world as it is, not as the law says it is." },
    { id = "gr_al_chaos2", when = { grudge = "alignment", alignment = { axis = "order", max = -30 } }, text = "Every time something goes missing round here I think of you, and I'm not often wrong about these things." },
    { id = "gr_al_light2", when = { grudge = "alignment", alignment = { axis = "light", min = 30 } }, text = "You look at me like a sinner waiting to be saved. I'm not, and I don't want saving by the likes of you." },
    { id = "gr_al_shadow2", when = { grudge = "alignment", alignment = { axis = "light", max = -30 } }, text = "Something about you turns my stomach, {class}. Folk who walk with shadows bring them home to the rest of us." },
    { id = "gr_al_honor2", when = { grudge = "alignment", alignment = { axis = "honor", min = 30 } }, text = "You think you're better than everyone because you keep your word. Plenty of us keep ours without the sermon." },
    { id = "gr_al_liar2", when = { grudge = "alignment", alignment = { axis = "honor", max = -30 } }, text = "I caught you in a lie once, and I've doubted every word you've said since. That's my problem." },
    { id = "gr_low", when = { maxLevel = 15 }, text = "You're a child with a weapon and no sense, poking at things you don't understand. That's my problem." },
    { id = "gr_high", when = { minLevel = 50 }, text = "You've grown so strong you've forgotten what it's like to be one of us, and it shows every time you open your mouth." },
    { id = "gr_orc", when = { grudge = "prejudice", race = "Orc" }, text = "Your people burned half the world not long ago, and you expect me to forget because you've a new warchief?" },
    { id = "gr_human", when = { grudge = "prejudice", race = "Human" }, text = "Your kind think the whole world is Stormwind's to tax and order about. I'm sick of it, and I'm sick of you." },
    { id = "gr_dwarf", when = { grudge = "prejudice", race = "Dwarf" }, text = "Your lot dig too deep and drink too much, and you think shouting is the same thing as being right." },
    { id = "gr_gnome", when = { grudge = "prejudice", race = "Gnome" }, text = "Your people poisoned their own city to save it. Forgive me if I don't want you tinkering anywhere near me." },
    { id = "gr_ne", when = { grudge = "prejudice", race = "NightElf" }, text = "Your people look down on everyone born in the last ten thousand years, and you're no different. I can feel it from here." },
    { id = "gr_troll", when = { grudge = "prejudice", race = "Troll" }, text = "Trolls were eating people within living memory, and some still do. I'll not pretend I've forgotten it." },
    { id = "gr_tauren", when = { grudge = "prejudice", race = "Tauren" }, text = "You're slow and you're huge and you take up the whole road. I know it's petty, but there it is." },
    { id = "gr_scourge", when = { grudge = "prejudice", race = "Scourge" }, text = "You're a corpse that walks and talks. I can't look at you without smelling the grave, and I won't try." },
    { id = "gr_wlk", when = { class = "WARLOCK" }, text = "You deal with demons, {class}. What did you think my problem would be?" },
    { id = "gr_rog", when = { class = "ROGUE" }, text = "You're a thief and a cutthroat by trade, and I count my purse every time you walk past. I'm right to." },
    { id = "gr_pal", when = { class = "PALADIN" }, text = "Your sort march in, judge everyone and march out again. I've had my fill of paladins telling me how to live." },
    { id = "gr_mag", when = { class = "MAGE" }, text = "Mages think the rest of us are children who need everything explained slowly, and you're no exception." },
    { id = "gr_dru", when = { class = "DRUID" }, text = "You turn into a beast whenever it suits you. How am I meant to trust something that won't keep its own shape?" },
    { id = "gr_sha", when = { class = "SHAMAN" }, text = "You talk to things I can't see and swear they talk back. Forgive me if that doesn't sit easy with me." },
    { id = "gr_war", when = { class = "WARRIOR" }, text = "You settle everything with that blade, {class}, and you leave the rest of us to bury what's left." },
    { id = "gr_hun", when = { class = "HUNTER" }, text = "You and that beast trample through everything, and you let it eat whatever it likes. I've lost hens to your sort." },
    { id = "gr_pri", when = { class = "PRIEST" }, text = "You heal whoever's useful to you and pass by everyone else. I've noticed, even if nobody else has." },
  },
  amends = {
    { id = "am1", text = "Leave me be for a while. That would be a start." },
    { id = "am2", text = "Words won't do it. Show me you're better than I think you are, and maybe I'll notice." },
    { id = "am_wronged", when = { grudge = "wronged" }, text = "Talk to me like I'm worth something next time. I'll know it when I hear it." },
    { id = "am_prej", when = { grudge = "prejudice" }, text = "Time, maybe. Prove me wrong often enough and I might stop expecting the worst of you." },
    { id = "am_tone_p", when = { grudge = "tone", tone = "polite" }, text = "Stop dressing every word up in ribbons and just talk to me like a person." },
    { id = "am_tone_b", when = { grudge = "tone", tone = "blunt" }, text = "Learn some manners. A civil word costs you nothing, and it might buy you something." },
    { id = "am_pers", when = { grudge = "persuade" }, text = "Give it a few days and don't try that again. I cool off, but I don't forget twice." },
    { id = "am_town", when = { grudge = "town" }, text = "Do this town some good. When my neighbours start speaking well of you, so might I." },
    { id = "am_rival", when = { grudge = "rival" }, text = "Pick your friends more carefully. Until then, there's nothing to make right." },
    { id = "am_values", when = { grudge = "values" }, text = "Be a different sort of person. I don't expect you will, mind, but that's the price." },
    { id = "am_temper", when = { grudge = { worst = "temper" } }, text = "Make it right? I'm like this with everyone, so don't take it to heart." },
    { id = "am_enemy", when = { grudge = "enemy" }, text = "You can't. Not while you wear those colours, and not in this place." },
    { id = "am_al_shadow", when = { grudge = "alignment", alignment = { axis = "light", max = -30 } }, text = "Turn away from whatever dark thing you've been feeding. Until you do, I'll keep my distance." },
    { id = "am_al_chaos", when = { grudge = "alignment", alignment = { axis = "order", max = -30 } }, text = "Keep your word and keep the law for a while. Show me you can be counted on." },
    { id = "am_al_liar", when = { grudge = "alignment", alignment = { axis = "honor", max = -30 } }, text = "Tell the truth, even when it costs you. Especially then. That's the only way back with me." },
    { id = "am_al", when = { grudge = { worst = "alignment" } }, text = "It's not a thing you can say sorry for. It's who you've chosen to be. Choose differently." },
    { id = "am3", text = "Prove it with what you do, not with what you say. I've heard enough fine words to last me a lifetime." },
    { id = "am4", text = "Come back in a month and see whether I've cooled. Don't expect it any sooner." },
    { id = "am5", text = "You could start by asking how I am for once, instead of what I can do for you." },
    { id = "am6", text = "Do some good where I can see it. I'll not take anybody's word for it, least of all yours." },
    { id = "am7", text = "I don't know that you can. Keeping away from me and mine would be a decent first step, though." },
    { id = "am_wronged2", when = { grudge = { worst = "wronged" } }, text = "Apologise properly, and mean it. Not today, though, because I'd know you were only saying it." },
    { id = "am_town2", when = { grudge = { worst = "town" } }, text = "Help the folk in {town} who've had a hard time of it. They talk, and I listen." },
    { id = "am_rival2", when = { grudge = { worst = "rival" } }, text = "Stop running about with that lot I can't stand, and show me you've a mind of your own." },
    { id = "am_values2", when = { grudge = { worst = "values" } }, text = "Stand up for something decent once, where it costs you something. Then we'll talk." },
    { id = "am_pers2", when = { grudge = { worst = "persuade" } }, text = "Stop trying to win me over with clever talk. Clever talk is what got you into this." },
    { id = "am_enemy2", when = { grudge = { worst = "enemy" } }, text = "Go home to your own side, and when your people stop killing mine, ask me again." },
    { id = "am_prej2", when = { grudge = { worst = "prejudice" } }, text = "Be the first of your kind I've no complaint about. It might take you a while, mind." },
    { id = "am_tone_p2", when = { grudge = "tone", tone = "polite" }, text = "Say one honest, rough thing to me instead of ten sweet ones. Then I'll know you mean it." },
    { id = "am_al_light", when = { grudge = "alignment", alignment = { axis = "light", min = 30 } }, text = "Stop preaching. Help somebody without telling them why the Light wants you to, and I might believe it." },
    { id = "am_al_order", when = { grudge = "alignment", alignment = { axis = "order", min = 30 } }, text = "Bend once, when it's kind to. Show me there's a person under all those rules." },
    { id = "am_al_honor", when = { grudge = "alignment", alignment = { axis = "honor", min = 30 } }, text = "Get your hands dirty for someone else's sake for a change. Your honour's no use to me while it's spotless." },
    { id = "am_low", when = { maxLevel = 15 }, text = "Grow up a bit, {name}. You're young, and young folk get a second chance if they earn it." },
    { id = "am_high", when = { minLevel = 50 }, text = "Remember where you came from. Treat the small folk as if they matter, and I'll stop thinking you've forgotten." },
    { id = "am_wlk", when = { class = "WARLOCK" }, text = "Keep that demon of yours out of my sight, and I might stop flinching every time you walk past." },
    { id = "am_rog", when = { class = "ROGUE" }, text = "Pay for things, openly, with coin, where folk can see you do it. That would be a novelty for you." },
    { id = "am_pal", when = { class = "PALADIN" }, text = "Listen for once instead of judging. The Light gave you two ears and one mouth for a reason." },
    { id = "am_sc", when = { grudge = "prejudice", race = "Scourge" }, text = "I'm not sure you can. I see the grave on you every time, and I don't know how to stop seeing it." },
    { id = "am_orc", when = { grudge = "prejudice", race = "Orc" }, text = "Show me the orc Thrall keeps talking about, the one who builds instead of burns. I've not met many." },
    { id = "am_troll", when = { grudge = "prejudice", race = "Troll" }, text = "Give me time, and give me no reason. That's the only way your kind will ever change my mind." },
  },
  spite = {
    { id = "sp1", text = "You want it to your face? Fine. I think you're trouble, and the sooner you're gone the better I'll sleep." },
    { id = "sp2", text = "I think you're the sort who leaves graves behind and calls it heroism. Now get out of my sight." },
    { id = "sp3", text = "I think the world would be a quieter place without you in it, and I'm not the only one." },
    { id = "sp_wronged", when = { grudge = { worst = "wronged" } }, text = "I think you're cruel and you enjoy it. I've met your sort before, and they always end badly." },
    { id = "sp_prej", when = { grudge = { worst = "prejudice" } }, text = "I think your people are a plague, and you're no different from the rest. There, I've said it." },
    { id = "sp_pers", when = { grudge = "persuade" }, text = "I think you're a bully who's never been hit back. One day you will be, and I hope I'm there." },
    { id = "sp_town", when = { grudge = { worst = "town" } }, text = "I think this town would cheer to see you ride out and never come back. I'd lead the cheering." },
    { id = "sp_enemy_h", when = { grudge = "enemy", faction = "Alliance" }, text = "I think you're an Alliance dog sniffing round our walls, and the guards should've put you down." },
    { id = "sp_enemy_a", when = { grudge = "enemy", faction = "Horde" }, text = "I think you're a savage who got past the gate, and I'm counting the moments till the guard notices." },
    { id = "sp_low", when = { maxLevel = 15 }, text = "I think you're a whelp with a sword who's going to get somebody killed. Probably yourself, if I'm lucky." },
    { id = "sp_high", when = { minLevel = 50 }, text = "I think all that power's gone to your head. You walk about like the world owes you, and it doesn't." },
    { id = "sp_al_shadow", when = { grudge = "alignment", alignment = { axis = "light", max = -50 } }, text = "I think you've given yourself to the dark, and one day it'll come to collect. I hope I'm far away." },
    { id = "sp_al_liar", when = { grudge = "alignment", alignment = { axis = "honor", max = -50 } }, text = "I think you're a liar and a cheat, and you're only charming because it pays." },
    { id = "sp4", text = "I think you're a fraud, and the only one who hasn't noticed is you." },
    { id = "sp5", text = "I think you're everything wrong with the folk who wander through here: loud, greedy and gone before the damage is counted." },
    { id = "sp6", text = "I think you'd sell your own mother for a better sword, and haggle over the price." },
    { id = "sp7", text = "I think you're forgettable, {name}, and I'm looking forward to forgetting you." },
    { id = "sp_wronged2", when = { grudge = "wronged" }, text = "I think you're small, and you make others feel small so you can feel big. I see straight through it." },
    { id = "sp_tone_p", when = { grudge = "tone", tone = "polite" }, text = "I think your fine manners are a mask, and I'd dearly love to see what's behind it the day you're crossed." },
    { id = "sp_tone_b", when = { grudge = "tone", tone = "blunt" }, text = "I think you're a boor and a bully, and the only reason nobody says so is that they're frightened of you." },
    { id = "sp_rival", when = { grudge = "rival" }, text = "I think you're a lapdog for the worst people in this town, and too dim to see they'll drop you the moment it suits them." },
    { id = "sp_values", when = { grudge = { worst = "values" } }, text = "I think you've no principles at all, only appetites, and you dress them up as whatever suits the day." },
    { id = "sp_enemy2", when = { grudge = { worst = "enemy" } }, text = "I think you're a spy or a fool or both, and I hope the guards get round to deciding which." },
    { id = "sp_al_light", when = { grudge = "alignment", alignment = { axis = "light", min = 50 } }, text = "I think you're a smug, sanctimonious prig, and the Light must be very patient to put up with you." },
    { id = "sp_al_order", when = { grudge = "alignment", alignment = { axis = "order", min = 50 } }, text = "I think you'd turn in your own neighbour for breaking curfew and call it your duty." },
    { id = "sp_al_chaos", when = { grudge = "alignment", alignment = { axis = "order", max = -50 } }, text = "I think you're a thief who hasn't been caught yet, and I'll be glad when you are." },
    { id = "sp_al_honor", when = { grudge = "alignment", alignment = { axis = "honor", min = 50 } }, text = "I think you're so proud of your honour you'd let a village burn rather than tell one lie to save it." },
    { id = "sp_wlk", when = { class = "WARLOCK" }, text = "I think one day that demon's going to turn on you, and I hope I'm somewhere I can watch." },
    { id = "sp_rog", when = { class = "ROGUE" }, text = "I think you're a cutpurse in nicer clothes, and that's all you'll ever be." },
    { id = "sp_pal", when = { class = "PALADIN" }, text = "I think you're a bully in shining plate who's found a holy reason to excuse it." },
    { id = "sp_pri", when = { class = "PRIEST" }, text = "I think you heal folk so they'll owe you, and you keep a tally. I've met your sort before." },
    { id = "sp_hun", when = { class = "HUNTER" }, text = "I think your beast is better company than you are, and cleverer too." },
    { id = "sp_mag", when = { class = "MAGE" }, text = "I think you're a bookworm who learned to throw fire, and now you think it makes you somebody." },
    { id = "sp_dru", when = { class = "DRUID" }, text = "I think you'd be happier as a bear for good, and frankly so would the rest of us." },
    { id = "sp_sha", when = { class = "SHAMAN" }, text = "I think the spirits only answer you to make you go away, and I know exactly how they feel." },
    { id = "sp_war", when = { class = "WARRIOR" }, text = "I think you're a brute who solves everything with a sword because you've no wit for anything else." },
    { id = "sp_orc", when = { grudge = "prejudice", race = "Orc" }, text = "I think you're a greenskin wearing manners like borrowed clothes, and they don't fit you." },
    { id = "sp_human", when = { grudge = "prejudice", race = "Human" }, text = "I think you're a soft little human who's never known a hard day, playing at war." },
    { id = "sp_ne", when = { grudge = "prejudice", race = "NightElf" }, text = "I think you're an arrogant tree-hugger who believes ten thousand years made you wise. It only made you old." },
    { id = "sp_dwarf", when = { grudge = "prejudice", race = "Dwarf" }, text = "I think you're a drunk with a beard and a hammer, and that's the whole of you." },
    { id = "sp_gnome", when = { grudge = "prejudice", race = "Gnome" }, text = "I think you're a menace who lost one city and is looking for another one to blow up." },
    { id = "sp_troll", when = { grudge = "prejudice", race = "Troll" }, text = "I think you're a savage with good manners, and I've not forgotten what your kind used to eat." },
    { id = "sp_tauren", when = { grudge = "prejudice", race = "Tauren" }, text = "I think you're a great slow beast who thinks keeping quiet makes you wise." },
    { id = "sp_scourge", when = { grudge = "prejudice", race = "Scourge" }, text = "I think you should have stayed in the ground, and I'd happily help put you back there." },
    { id = "sp_f", when = { gender = "female", maxLevel = 20 }, text = "I think you fancy yourself the heroine of some bard's song, and I promise you nobody is ever going to sing it." },
  },
} }

P:Pool { id = "grudges_guard", role = "guard", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "My problem is that I've got my eye on you, and I don't like what I see." },
    { id = "g_town", when = { grudge = "town" }, text = "Half the complaints I hear this week have your name in them. That's my problem." },
    { id = "g2", text = "You've given the watch nothing but trouble since you got here, and I'd be a poor guard if I didn't mind that." },
    { id = "g3", text = "I've seen your sort before: you swagger in, you start something, you swagger out, and I'm the one left sweeping up." },
    { id = "g_enemy", when = { grudge = "enemy" }, text = "You're the enemy and I'm the guard. Do you truly need it spelled out any plainer than that?" },
  },
  amends = {
    { id = "a1", text = "Keep the peace, keep your blade sheathed, and keep out of my way. Do that long enough and we'll be square." },
    { id = "a2", text = "Keep your nose clean for a good long while, and maybe the watch will forget your face." },
    { id = "a3", text = "Bleed a little for this town instead of making it bleed. Then I'll think again about you." },
    { id = "a_town", when = { grudge = "town" }, text = "Make yourself useful to the folk here instead of a nuisance. They'll tell me when you have, believe me." },
  },
  spite = {
    { id = "s1", text = "I think you're one wrong step from a cell, and I'd like to be the one who turns the key." },
    { id = "s2", text = "I think you're a troublemaker in good armour, and the armour doesn't make you any less of one." },
    { id = "s3", text = "I think the only reason you're walking free is that I haven't caught you at it yet." },
  },
} }

P:Pool { id = "grudges_innkeeper", role = "innkeeper", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You've been trouble under my roof, and I can't afford trouble. That's all there is to it." },
    { id = "g2", text = "You've broken my chairs, frightened off my regulars and complained about the stew. Take your pick." },
    { id = "g3", text = "You treat my staff like your own servants. They're not, and I won't have it in my house." },
    { id = "g_tone", when = { grudge = "tone", tone = "blunt" }, text = "You bark at me like I'm a scullion in your kitchen. Mind your tongue under my roof, or take it elsewhere." },
  },
  amends = {
    { id = "a1", text = "Pay what you owe, drink quietly, and don't start anything in my common room. That's how." },
    { id = "a2", text = "Be civil to my staff and keep your fists to yourself in the common room. That would do for a start." },
    { id = "a3", text = "Come in, sit quietly and pay your way without grumbling. Do that for a month and we'll talk." },
  },
  spite = {
    { id = "s1", text = "I think I'd sooner rent your bed to a kobold. At least it'd only steal the candles." },
    { id = "s2", text = "I think you're the worst guest I've had since the gnome who set my curtains alight, and he at least said sorry." },
    { id = "s3", text = "I think you'd complain about the ale in the Light's own tavern and then slip out without paying for it." },
  },
} }

-- A fresh copy per role: each pool indexes its own lines.
local function tradeGrudges() return {
  grievance = {
    { id = "g1", text = "Your coin's as good as anyone's, so I'll take it. That doesn't mean I have to like you." },
    { id = "g2", text = "You haggle like a goblin and grumble like a dwarf, and you've never once said thank you." },
    { id = "g3", text = "You sold me rubbish once and swore blind it was treasure. I've a long memory for that sort of thing." },
    { id = "g_tone", when = { grudge = "tone", tone = "blunt" }, text = "You talk to me like a servant behind a counter. I'm a merchant, and you'll show me some respect." },
  },
  amends = {
    { id = "a1", text = "Be a good customer for a while. Polite, quick and no haggling over every copper." },
    { id = "a2", text = "Stop trying to sell me junk and expecting me to thank you for the privilege." },
    { id = "a3", text = "Pay what's asked, say please and thank you, and come back again. That's how trust is built in trade." },
  },
  spite = {
    { id = "s1", text = "I think I'd charge you double if the guild would let me, and I'd sleep soundly after." },
    { id = "s2", text = "I think you're the sort of customer who drives honest merchants to drink." },
    { id = "s3", text = "I think your coin's the only thing about you worth having, and I'll take it gladly and forget your face." },
  },
} end
for _, role in ipairs({ "vendor", "blacksmith", "auctioneer", "banker" }) do
  P:Pool { id = "grudges_" .. role, role = role, askOnly = true, topics = tradeGrudges() }
end

P:Pool { id = "grudges_trainer", role = "trainer", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "I teach because it's my duty, not because I enjoy your company. Don't mistake the one for the other." },
    { id = "g2", text = "You learn quickly and you use it badly, and I'm ashamed to have taught you some of it." },
    { id = "g3", text = "You never listen, {class}. You hear me out, and then you do whatever you like anyway." },
  },
  amends = {
    { id = "a1", text = "Show me you deserve what I teach you. Use it well, and use it for the right reasons." },
    { id = "a2", text = "Train harder, listen better, and stop acting as though you know more than I do." },
    { id = "a3", text = "Come back humble, and ask me a question as if you actually want the answer." },
  },
  spite = {
    { id = "s1", text = "I think teaching you was a mistake, and I'll be answering for it long after you're gone." },
    { id = "s2", text = "I think you're the worst student I've ever had, {class}, and I've had a few who set themselves on fire." },
    { id = "s3", text = "I think one day somebody will teach you the lesson I never could, and it won't be gentle." },
  },
} }

P:Pool { id = "grudges_flightmaster", role = "flightmaster", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You're rough with my beasts, and they've let me know it in their own way. That's my problem." },
    { id = "g2", text = "Every time you land, the beast comes in lathered and jumpy, and I'm the one left calming it down." },
    { id = "g3", text = "You shout at the handlers as if the routes were their fault. They're not, and neither is the weather." },
  },
  amends = {
    { id = "a1", text = "Treat the beasts gently. They'll forgive you long before I do, but it's a start." },
    { id = "a2", text = "Stop yanking at the reins and shouting, and the beasts might stop flinching when you walk past." },
    { id = "a3", text = "Thank the handlers now and then. They've kept you alive on every flight you've taken." },
  },
  spite = {
    { id = "s1", text = "I think the beasts would happily drop you in the sea, and I'd not hold it against them." },
    { id = "s2", text = "I think you'd ride a beast into the ground and then demand a fresh one, and never think twice." },
    { id = "s3", text = "I think you're the only rider my beasts have ever refused to carry, and they've good sense." },
  },
} }

P:Pool { id = "grudges_stablemaster", role = "stablemaster", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "Your animal flinches when you lift your hand. That's all I need to know about you." },
    { id = "g2", text = "You leave your beast with me for weeks and never come to see it. Animals pine, even for masters like you." },
    { id = "g3", text = "You treat that creature like a tool you carry about. It's a living thing, and it deserves better." },
  },
  amends = {
    { id = "a1", text = "Be kinder to your beast. That's the only thing I'll ever want from you." },
    { id = "a2", text = "Spend some time with your companion: brush it, feed it properly, talk to it. Then come and talk to me." },
    { id = "a3", text = "Stop working that animal half to death. When it looks happy to see you, I'll know you've changed." },
  },
  spite = {
    { id = "s1", text = "I think your beast deserves a better master, and I'd tell it so if it could understand me." },
    { id = "s2", text = "I think you'd sell your own companion for a faster mount and never look back." },
    { id = "s3", text = "I think the animals in my stable have better manners than you, and some of them bite." },
  },
} }

P:Pool { id = "grudges_peon", role = "peon", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You yell at peon. Peon not deaf, peon just busy." },
    { id = "g2", text = "You kick over peon's bucket and not even say sorry. Peon remember, peon always remember." },
    { id = "g3", text = "You like overseer, always shouting and pointing. Peon has enough overseers already." },
  },
  amends = {
    { id = "a1", text = "Say sorry to peon, then maybe carry one log. Just one log, is not so hard." },
    { id = "a2", text = "Stop shouting at peon, and then peon stop hiding behind woodpile when you come." },
    { id = "a3", text = "Just be nice to peon for a while. Is easy, even for somebody like you." },
  },
  spite = {
    { id = "s1", text = "Peon think you worse than overseer, and overseer is very, very bad." },
    { id = "s2", text = "Peon think you should chop your own wood for one whole day. Then you understand." },
    { id = "s3", text = "Peon would spit in your soup if peon get the chance. Peon only saying." },
  },
} }

P:Pool { id = "grudges_citizen", role = "citizen", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You've been nothing but trouble since you came to town, and the whole street knows it." },
    { id = "g2", text = "You trample through this place like it's yours. It isn't; people live here, and some of us were here first." },
    { id = "g3", text = "My neighbour says you were rude to her old mother, and that's more than enough for me." },
    { id = "g_town", when = { grudge = "town" }, text = "Ask anyone on this street about you and watch their faces. I'm only saying it out loud." },
  },
  amends = {
    { id = "a1", text = "Treat the folk here like they matter. We're not your servants, and we're not your audience either." },
    { id = "a2", text = "Help somebody in this town without being asked, and make sure I see you do it." },
    { id = "a3", text = "Apologise to the people you've upset. There's a list, and you know well enough who's on it." },
  },
  spite = {
    { id = "s1", text = "I think you're the worst thing to happen to this street since the last fire." },
    { id = "s2", text = "I think you'd step over a beggar to get to the auction house quicker." },
    { id = "s3", text = "I think you're a nuisance with a weapon, and I'll be glad to see the back of you." },
  },
} }

P:Pool { id = "grudges_child", role = "child", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You're mean, and you scared my dog, so I don't like you anymore." },
    { id = "g2", text = "Mama says you're trouble, and Mama's always right about everything, even when she's wrong." },
    { id = "g3", text = "I said hello and you didn't say hello back, so now you're not my friend, and that's the rule." },
  },
  amends = {
    { id = "a1", text = "Say sorry to my dog, and to me, but mostly to my dog because he's sadder." },
    { id = "a2", text = "You have to be nice for a whole week, every day, and then I'll think about it." },
    { id = "a3", text = "Say sorry properly, with your hand on your heart like the knights do in stories." },
  },
  spite = {
    { id = "s1", text = "I think you smell like a gnoll, and I'm going to tell everybody so." },
    { id = "s2", text = "I think you're the meanest grown-up in the whole world, even meaner than my aunt." },
    { id = "s3", text = "I think if a dragon came, I'd tell it to eat you first, and I wouldn't even feel bad." },
  },
} }

P:Pool { id = "grudges_worker", role = "worker", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You walk past us like we're part of the scenery. We're not, and we notice every time." },
    { id = "g2", text = "You knocked over a stack I'd spent all morning on and just walked off. I've not forgotten it." },
    { id = "g3", text = "Folk like you get the glory, and folk like me get the bill and the bad back." },
  },
  amends = {
    { id = "a1", text = "Lend a hand once, just once, without expecting anyone to thank you for it." },
    { id = "a2", text = "Learn my name for a start, and use it. Then we'll see about the rest." },
    { id = "a3", text = "Show working folk a bit of respect. We laid every road you've ever walked on." },
  },
  spite = {
    { id = "s1", text = "I think you've never done an honest day's work in your life, and it shows." },
    { id = "s2", text = "I think you'd not last a single week doing what I do, sword or no sword." },
    { id = "s3", text = "I think you're soft hands and a loud mouth, and the world's already got plenty of those." },
  },
} }

P:Pool { id = "grudges_soldier", role = "soldier", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You fight for glory, not for the folk behind you, and I've buried better than you." },
    { id = "g2", text = "You charged in once and left my squad to clean up after you. Two of them didn't walk away from it." },
    { id = "g3", text = "You don't take orders and you don't watch your flanks, which makes you a danger to everyone near you." },
  },
  amends = {
    { id = "a1", text = "Stand a night's watch with us, start to finish, without a word of complaint." },
    { id = "a2", text = "Fight for something besides yourself for once, and do it where I can see you." },
    { id = "a3", text = "Learn to take an order, {class}. Then we can talk about whether I trust you." },
  },
  spite = {
    { id = "s1", text = "I think you're a glory-hound who's going to get good soldiers killed." },
    { id = "s2", text = "I think you'd have deserted your first battle if anybody had ever made you stand in a line." },
    { id = "s3", text = "I think you'd make a poor soldier and a worse comrade, and I'd not want you on my flank." },
  },
} }

P:Pool { id = "grudges_priest", role = "priest", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "I've tried to see the good in you, {name}, and I've found precious little of it." },
    { id = "g2", text = "You've turned your back on people who needed you. I can't pretend that's nothing." },
    { id = "g3", text = "You use people, and I've watched you do it. It grieves me more than it angers me, but it does both." },
  },
  amends = {
    { id = "a1", text = "Help someone in need and tell nobody about it, not even me." },
    { id = "a2", text = "Make your peace with the ones you've hurt first. Then come to me, and we'll see." },
    { id = "a3", text = "Spend a day with the sick and the hungry. You might learn something about yourself there." },
  },
  spite = {
    { id = "s1", text = "I think you've a cold heart, and I pray for it, though I'm not sure prayer is enough." },
    { id = "s2", text = "I think you're exactly the sort of person I'm meant to forgive, and I'm finding it very hard." },
    { id = "s3", text = "I think you'll answer for what you've done someday, and it won't be to me." },
  },
} }

P:Pool { id = "grudges_militia", role = "militia", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You came through our fields and trampled half the crop. Some of us have to eat this winter." },
    { id = "g2", text = "You rode off when the raiders came and left us to it. We remember, every one of us." },
    { id = "g3", text = "You think you're better than us because you've proper armour. We're the ones who stayed." },
  },
  amends = {
    { id = "a1", text = "Stand a watch with us some night. Stand with us, and then we'll see." },
    { id = "a2", text = "Clear the beasts away from the farms. That's worth more to us than any apology." },
    { id = "a3", text = "Stop looking down your nose at us. We're doing what we can with what we've got." },
  },
  spite = {
    { id = "s1", text = "I think you're all swagger and no spine, and the farmers say the same behind your back." },
    { id = "s2", text = "I think you'd run at the first sign of real trouble and leave us holding the spears." },
    { id = "s3", text = "I think we'd be better off with you gone, and so would the crops." },
  },
} }

---------------------------------------------------------------------------
-- When they like you (0.114.0), the mirror of the above. Nine "ask anyone" topics that only
-- show at Warm or better (worries, hopes, favor at Friendly; friendship, never_told at
-- Devoted), answered by what's warming them to you (`fondness`). confide, watchout, favor
-- and never_told let something useful slip after the answer (topics.lua `confides`).
---------------------------------------------------------------------------
P:Generic { id = "fondness", topics = {
  -- Advice from someone who likes you: kinder, and more of it.
  advice = {
    { id = "adv_warm1", when = { disposition = { min = 60 } }, text = "Rest when you can, eat when you can, and never be too proud to run. The proud ones are all buried." },
    { id = "adv_warm2", when = { disposition = { min = 60 } }, text = "Take a hearthstone to an inn you like and keep it there. Knowing where home is matters more than you'd think." },
    { id = "adv_warm3", when = { disposition = { min = 60 }, maxLevel = 20 }, text = "Don't rush, {name}. Everyone your age wants to be a hero by next week, and half of them don't see next week." },
    { id = "adv_warm4", when = { disposition = { min = 75 } }, text = "Find people you trust and fight beside them. Nobody lasts long out there alone, however good they are." },
    { id = "adv_warm5", when = { disposition = { min = 75 }, minLevel = 40 }, text = "You've grown strong. Remember that strength draws eyes, and not all of them wish you well." },
    { id = "adv_warm_war", when = { disposition = { min = 60 }, class = "WARRIOR" }, text = "Keep your shield arm fresh and your armour mended. A warrior who skimps on the smith pays the priest instead." },
    { id = "adv_warm_pal", when = { disposition = { min = 60 }, class = "PALADIN" }, text = "The Light carries you a long way, but it won't mend a cracked breastplate. Look after the plain things too." },
    { id = "adv_warm_hun", when = { disposition = { min = 60 }, class = "HUNTER" }, text = "Feed that beast of yours before you feed yourself. It'll remember, and it'll stand over you when you fall." },
    { id = "adv_warm_rog", when = { disposition = { min = 60 }, class = "ROGUE" }, text = "Keep your poisons fresh and your exits in mind. And never rob anyone who knows your name." },
    { id = "adv_warm_pri", when = { disposition = { min = 60 }, class = "PRIEST" }, text = "Mend yourself as well as the others. A healer who falls first leaves everyone to fall after." },
    { id = "adv_warm_sha", when = { disposition = { min = 60 }, class = "SHAMAN" }, text = "Listen to the elements before you ask anything of them. They answer better when they know you've heard them." },
    { id = "adv_warm_mag", when = { disposition = { min = 60 }, class = "MAGE" }, text = "Conjure your bread before you need it, and never stand still when something big is charging you." },
    { id = "adv_warm_wlk", when = { disposition = { min = 60 }, class = "WARLOCK" }, text = "Keep a firm hand on whatever you've bound. The moment you trust it is the moment it stops being yours." },
    { id = "adv_warm_dru", when = { disposition = { min = 60 }, class = "DRUID" }, text = "You can be anything the wild allows. Don't forget to come back to yourself at the end of the day." },
    { id = "adv_warm6", when = { disposition = { min = 60 } }, text = "Keep a little coin back that you never touch. One day you'll need it badly, and you'll thank me then." },
    { id = "adv_warm7", when = { disposition = { min = 60 } }, text = "Learn a trade alongside the fighting. Swords break and arms tire, but a good trade lasts a lifetime." },
    { id = "adv_warm8", when = { disposition = { min = 60 }, minLevel = 25 }, text = "You're past the beginner's mistakes, so mind the next ones: going one camp too far, and trusting a road you've only walked once." },
    { id = "adv_warm9", when = { disposition = { min = 75 }, minLevel = 55 }, text = "When you go into Blackrock or the Plaguelands, go with people you'd die for, {name}. You might have to." },
    { id = "adv_warm_tau", when = { disposition = { min = 60 }, race = "Tauren" }, text = "Take your time, as your people do. The plains will wait for you, and so will the rest of us." },
    { id = "adv_warm_sc", when = { disposition = { min = 60 }, race = "Scourge" }, text = "Keep your temper cold and your bandages close. You can't feel the wounds the way the living do, so look at them." },
    { id = "adv_warm_gno", when = { disposition = { min = 60 }, race = "Gnome" }, text = "Test everything twice before you trust your life to it. I know your folk say that already, so say it louder." },
    { id = "adv_warm_ne", when = { disposition = { min = 60 }, race = "NightElf" }, text = "Don't let the younger races' hurry rush you. Haste has killed more people than patience ever did." },
    { id = "adv_warm_orc", when = { disposition = { min = 60 }, race = "Orc" }, text = "Pick your fights the way Thrall does, {name}. Strength that knows when to wait is the strongest kind." },
    { id = "adv_warm_tro", when = { disposition = { min = 60 }, race = "Troll" }, text = "Keep that grin of yours, whatever comes. Folk underestimate a troll who laughs, and that's your advantage." },
    { id = "adv_warm_dwa", when = { disposition = { min = 60 }, race = "Dwarf" }, text = "Drink to your victories, by all means, but never the night before a fight. Even dwarven heads have limits." },
    { id = "adv_warm_hum", when = { disposition = { min = 60 }, race = "Human" }, text = "Don't try to carry the whole kingdom on your back. Do your part well and trust others to do theirs." },
  },
  regard = {
    { id = "rg1", text = "I think you're decent, {name}, and there aren't as many decent folk about as there ought to be." },
    { id = "rg2", text = "I think you're the sort I'm glad to see coming up the road. That's rarer than you'd think." },
    { id = "rg3", text = "Honestly? I like you. You listen, and you don't look down your nose at people like me." },
    { id = "rg_earned", when = { fondness = "earned" }, text = "You've been good to me when you didn't have to be. I notice that sort of thing, and I remember it." },
    { id = "rg_earned2", when = { fondness = { best = "earned" } }, text = "I've talked with you enough to know your heart, and I like what I've found there." },
    { id = "rg_town", when = { fondness = "town" }, text = "Folk around {town} speak well of you, and they're not easy to please. I'd sooner trust them than my own eyes." },
    { id = "rg_values", when = { fondness = "values" }, text = "You carry yourself the way a person ought to. I've watched you, and you've not let me down yet." },
    { id = "rg_temper", when = { fondness = { best = "temper" } }, text = "Oh, I like most people, if I'm honest. But I like you more than most, if that helps." },
    { id = "rg_rival", when = { fondness = "rival" }, text = "Anyone who's stood up to the folk I can't abide is all right in my book. You've done that." },
    { id = "rg_tone_p", when = { fondness = "tone", tone = "polite" }, text = "You've manners, and you use them. It does an old heart good to be spoken to properly." },
    { id = "rg_tone_b", when = { fondness = "tone", tone = "blunt" }, text = "You say what you mean and you don't waste my time. I can't ask more of anyone than that." },
    { id = "rg_pers", when = { fondness = "persuade" }, text = "You've a way with words, I'll grant you. You had me smiling the last time, and I've not forgotten it." },
    { id = "rg_al_light", when = { fondness = "alignment", alignment = { axis = "light", min = 30 } }, text = "There's a light in you, {name}. I've felt it every time we've spoken, and it does me good." },
    { id = "rg_al_shadow", when = { fondness = "alignment", alignment = { axis = "light", max = -30 } }, text = "You don't flinch from the dark, and neither do I. Most folk are too frightened to understand that." },
    { id = "rg_al_order", when = { fondness = "alignment", alignment = { axis = "order", min = 30 } }, text = "You keep faith with the law and with your duty. That's rarer than gold these days." },
    { id = "rg_al_chaos", when = { fondness = "alignment", alignment = { axis = "order", max = -30 } }, text = "You go your own way and answer to nobody. I admire that more than I'd tell most people." },
    { id = "rg_al_honor", when = { fondness = "alignment", alignment = { axis = "honor", min = 30 } }, text = "Your word means something. I've heard it said up and down the road, and I believe it." },
    { id = "rg_al_cunning", when = { fondness = "alignment", alignment = { axis = "honor", max = -30 } }, text = "You're clever, and you know when to bend the truth. I respect someone who plays the game well." },
    { id = "rg_low", when = { maxLevel = 15 }, text = "I think you're young yet, but you've a good head on you. Keep it on your shoulders and you'll go far." },
    { id = "rg_high", when = { minLevel = 50 }, text = "I think you've seen more than most of us ever will, and it hasn't made you cruel. That's worth a great deal." },
    { id = "rg_h", when = { faction = "Horde" }, text = "I think you're a credit to the Horde. If more were like you, we'd have less to fear from anyone." },
    { id = "rg_a", when = { faction = "Alliance" }, text = "I think you're what the Alliance is meant to be, when it remembers itself. Don't lose that." },
    { id = "rg4", text = "I think you're better company than most who pass through {town}, and I've seen a great many pass through." },
    { id = "rg5", text = "I think you've a kind face under all that road dust, {name}, and don't let anyone tell you otherwise." },
    { id = "rg6", text = "I think you're steady. When you're about, folk stop fretting quite so much, and I've noticed it." },
    { id = "rg7", text = "I think the world's been hard on you and you've not let it make you hard. I like you for that." },
    { id = "rg_earned3", when = { fondness = "earned" }, text = "You helped me when there was nothing in it for you, and I've not met many who'd do the same. That's what I make of you." },
    { id = "rg_earned4", when = { fondness = { best = "earned" } }, text = "I'll tell you plainly: you've earned every kind word I have for you, and I've a few saved up." },
    { id = "rg_town2", when = { fondness = "town" }, text = "I'd heard about you before you ever spoke to me, and all of it good. You've lived up to it, which most folk don't." },
    { id = "rg_town3", when = { fondness = { best = "town" } }, text = "This town has taken to you, {name}, and so have I. We're slow to warm round here, but we stay warm." },
    { id = "rg_values2", when = { fondness = "values" }, text = "You do the right thing even when nobody's watching. I've seen you do it, and I think the better of you for it." },
    { id = "rg_values3", when = { fondness = { best = "values" } }, text = "We see the world the same way, you and I, and that's a comfort when so few seem to see it at all." },
    { id = "rg_temper2", when = { fondness = "temper" }, text = "I'm easy to please, as folk keep telling me, but you'd please me even if I weren't." },
    { id = "rg_rival2", when = { fondness = { best = "rival" } }, text = "Anyone who's crossed the lot I can't stand has a friend in me, and you've done it more than once." },
    { id = "rg_tone_p2", when = { fondness = "tone", tone = "polite" }, text = "You always ask nicely and you always thank me after. You'd be amazed how few people bother." },
    { id = "rg_tone_b2", when = { fondness = "tone", tone = "blunt" }, text = "No flattery and no fuss, only straight talk. I've grown fond of it, {name}, and of you." },
    { id = "rg_pers2", when = { fondness = { best = "persuade" } }, text = "You talked me round once, and I've been glad of it ever since. Not many can say they've done that." },
    { id = "rg_al_light2", when = { fondness = "alignment", alignment = { axis = "light", min = 30 } }, text = "I think you're good, {name}, plainly good, and I've no fancier word for it than that." },
    { id = "rg_al_shadow2", when = { fondness = "alignment", alignment = { axis = "light", max = -30 } }, text = "I think you know things that would frighten most folk, and you carry them quietly. I respect that." },
    { id = "rg_al_order2", when = { fondness = "alignment", alignment = { axis = "order", min = 30 } }, text = "I think you're dependable. If you say you'll be somewhere, you're there, and that counts for a great deal with me." },
    { id = "rg_al_chaos2", when = { fondness = "alignment", alignment = { axis = "order", max = -30 } }, text = "I think you're a wild one, and the world's a bit livelier with you in it. Don't let anyone tame you." },
    { id = "rg_al_honor2", when = { fondness = "alignment", alignment = { axis = "honor", min = 30 } }, text = "I think you're honest to a fault, and I'd sooner have that fault than any other." },
    { id = "rg_al_cunning2", when = { fondness = "alignment", alignment = { axis = "honor", max = -30 } }, text = "I think you're sharper than you let on, and I like that you don't bother pretending with me." },
    { id = "rg_human", when = { race = "Human" }, text = "I think you've the best of your people in you, {name}: stubborn, hopeful and too foolish to quit." },
    { id = "rg_dwarf", when = { race = "Dwarf" }, text = "I think you're as solid as the mountain you came from, and twice as hard to shift once your mind's made up." },
    { id = "rg_gnome", when = { race = "Gnome" }, text = "I think you're the cleverest person I know, and you've never once made me feel slow for it." },
    { id = "rg_ne", when = { race = "NightElf" }, text = "I think you've seen more years than I'll ever have, and you still bother to listen to me. That means something." },
    { id = "rg_orc", when = { race = "Orc" }, text = "I think you're proof of what your people can be now the old fury's gone out of them, and I'd say so to anyone." },
    { id = "rg_troll", when = { race = "Troll" }, text = "I think you laugh more than anyone I've met, and you mean it every time. The world could use more of that." },
    { id = "rg_tauren", when = { race = "Tauren" }, text = "I think you're the gentlest soul I've ever met who could also knock a door down with your head." },
    { id = "rg_scourge", when = { race = "Scourge" }, text = "I think there's more of the living left in you than you'd ever admit, {name}, and I'm glad of it." },
    { id = "rg_war", when = { class = "WARRIOR" }, text = "I think you're the one I'd want at the front when it all goes wrong, and I'd sleep easier knowing you were there." },
    { id = "rg_pal", when = { class = "PALADIN" }, text = "I think you wear the Light well. Some of your order make it look heavy, but on you it looks as if it belongs." },
    { id = "rg_hun", when = { class = "HUNTER" }, text = "I think anyone that beast of yours trusts must be worth trusting. Animals aren't fooled the way people are." },
    { id = "rg_rog", when = { class = "ROGUE" }, text = "I think you could have robbed me blind a dozen times by now, and you never have. I'd call that friendship." },
    { id = "rg_pri", when = { class = "PRIEST" }, text = "I think you've mended more people than you've ever told me about, and you never once asked for thanks." },
    { id = "rg_sha", when = { class = "SHAMAN" }, text = "I think the spirits must be fond of you, because I certainly am. You've a calm about you that settles a room." },
    { id = "rg_mag", when = { class = "MAGE" }, text = "I think you know more than anyone in {town}, and you've never once been insufferable about it, which is rare in a mage." },
    { id = "rg_wlk", when = { class = "WARLOCK" }, text = "I think folk are wrong about warlocks, or about you at least. Whatever you deal with, there's a good heart under it." },
    { id = "rg_dru", when = { class = "DRUID" }, text = "I think you belong to the wild more than to any town, and the wild is lucky to have you." },
    { id = "rg_f", when = { gender = "female" }, text = "I think you're as fierce as any soldier I've known and kinder than most of them, and anyone who says otherwise can say it to me." },
    { id = "rg_mid", when = { minLevel = 30, maxLevel = 49 }, text = "I think you've come a long way since you first walked through here, and I've enjoyed watching every step of it." },
  },
  confide = {
    { id = "cf1", text = "Most folk only see what's in front of them. You'd be surprised what's said when they think nobody's listening." },
    { id = "cf2", text = "This place looks quiet, but nothing here is ever as quiet as it looks." },
    { id = "cf3", text = "I keep my ears open and my mouth shut, mostly. For you, I'll open it a little." },
    { id = "cf4", text = "There's more going on around here than anyone admits, and I've heard a fair bit of it." },
    { id = "cf5", text = "I've lived here long enough to know when folk are lying, and lately a good few of them are." },
    { id = "cf6", text = "People tell me things because I don't look like I'd repeat them. Mostly I don't, but you're different." },
    { id = "cf7", text = "I hear more than I should, standing where I stand all day, and some of it has stuck with me." },
    { id = "cf8", text = "I don't gossip as a rule, but something's been on my mind, and you're the one I'd tell." },
    { id = "cf9", text = "Nobody asks me what I think, {name}, so I've had a long while to think it." },
    { id = "cf_earned", when = { fondness = { best = "earned" } }, text = "You've done right by me, so I'll do right by you and tell you what I've been hearing." },
    { id = "cf_town", when = { fondness = "town" }, text = "The whole town's fond of you, so you may as well know what the whole town's whispering." },
    { id = "cf_tone_p", when = { fondness = "tone", tone = "polite" }, text = "You asked so kindly that I'd feel a brute keeping it to myself." },
    { id = "cf_tone_b", when = { fondness = "tone", tone = "blunt" }, text = "You like things said straight, so I'll say this straight and spare us both the dancing about." },
    { id = "cf_rival", when = { fondness = "rival" }, text = "You've no love for the folk I can't abide either, so I know this won't find its way back to them." },
    { id = "cf_values", when = { fondness = "values" }, text = "You'd do the right thing with what I tell you, I know that much, so here's something worth knowing." },
    { id = "cf_al_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "You understand that some truths are better kept in the dark, so I'll trust you with one." },
    { id = "cf_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "I know you'll not twist what I tell you, which is more than I can say for most." },
    { id = "cf_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "You'll know what to do with this better than I would, I expect, so here it is." },
    { id = "cf_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "You'll want to know this, being the sort who keeps order. I've been wondering whom to tell." },
    { id = "cf_rog", when = { class = "ROGUE" }, text = "You'd find this out yourself soon enough, the way your sort listens at doors, so I'll save you the trouble." },
    { id = "cf_low", when = { maxLevel = 15 }, text = "You're new around here, so you'd not know it, but this place has its secrets like anywhere else." },
    { id = "cf_h", when = { faction = "Horde" }, text = "The Horde is strong, but it's not without its whispers, and I hear my share of them." },
    { id = "cf_a", when = { faction = "Alliance" }, text = "Folk think the Alliance keeps no secrets from its own. They'd be wrong." },
  },
  trust = {
    { id = "tr1", text = "Trust the ones who give you bad news to your face. It's the smiling ones you watch." },
    { id = "tr2", text = "The guards, mostly, and the innkeeper. Anyone who's selling you something, count your coin twice." },
    { id = "tr3", text = "Trust me, for a start. Beyond that, trust anyone who's bled for this place, and nobody who only talks about it." },
    { id = "tr4", text = "Folk who've been here longest have least to gain from lying to you. Start with them." },
    { id = "tr_h", when = { faction = "Horde" }, text = "Trust those who fought in the old wars and came out honest. Be wary of anyone too eager to tell you about it." },
    { id = "tr_a", when = { faction = "Alliance" }, text = "Trust the soldiers and the clergy, mostly. Nobles and merchants, well, they've their own ledgers to balance." },
    { id = "tr_scourge", when = { race = "Scourge" }, text = "Among your own people? From what I hear, trust the apothecaries least of all, {name}, and the rest only so far." },
    { id = "tr_ne", when = { race = "NightElf" }, text = "The Sentinels keep faith with your people, and so does the Cenarion Circle. I'd start with them, if I were you." },
    { id = "tr_al_light", when = { alignment = { axis = "light", min = 40 } }, text = "Trust the priests, {name}. They'll see the Light in you as plain as I do, and they'll help you." },
    { id = "tr_al_shadow", when = { alignment = { axis = "light", max = -40 } }, text = "Not the priests, not with that shadow on you. Keep to folk who ask fewer questions." },
    { id = "tr5", text = "Trust whoever's still here after a bad winter. The fair-weather sort leave first, and they take your coin with them." },
    { id = "tr6", text = "Trust folk who say they don't know when they don't. The ones who know everything usually know nothing." },
    { id = "tr7", text = "Trust anyone the children aren't afraid of. Little ones can smell a bad heart quicker than any of us." },
    { id = "tr8", text = "Not many, if I'm honest. But the ones I'd trust, I'd trust with my life, and you're one of them." },
    { id = "tr_earned", when = { fondness = { best = "earned" } }, text = "Trust the ones who help you without being asked, the way you helped me. They're the real sort." },
    { id = "tr_town", when = { fondness = "town" }, text = "This town likes you, so most here will treat you straight. It's the strangers passing through you watch." },
    { id = "tr_rival", when = { fondness = "rival" }, text = "Not the lot you've already crossed, that's certain. They've long memories and short tempers." },
    { id = "tr_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "Trust the watch and the law here, {name}. You and they understand one another well enough." },
    { id = "tr_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "Not the officials, not with your habits. Find the folk who live in the cracks and keep their mouths shut." },
    { id = "tr_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "Trust anyone who's kept a promise to you even once. Folk like that are rare, and they'll know you for one of their own." },
    { id = "tr_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "Trust nobody completely, which I suspect you know already. You'd do well to trust me a little, though." },
    { id = "tr_dwarf", when = { race = "Dwarf" }, text = "The Explorers' League, mostly, and any dwarf who's stood you a drink. Your kin take their friendships seriously." },
    { id = "tr_gnome", when = { race = "Gnome" }, text = "Your own folk, the tinkers who lost everything when Gnomeregan fell and still help each other. That's loyalty worth having." },
    { id = "tr_human", when = { race = "Human" }, text = "Trust the clergy and the old soldiers, and be careful with anyone who talks too much about the nobility's business." },
    { id = "tr_orc", when = { race = "Orc" }, text = "Trust anyone who stood with Thrall when he broke the camps open. They know what freedom costs." },
    { id = "tr_troll", when = { race = "Troll" }, text = "Trust the Darkspear. Vol'jin's people keep their word, and they don't forget who stood with them." },
    { id = "tr_tauren", when = { race = "Tauren" }, text = "Trust the Bloodhoof and the Runetotem. Be very careful of the Grimtotem, whatever they tell you about kinship." },
    { id = "tr_hun", when = { class = "HUNTER" }, text = "Trust your beast first. It's never lied to you and it never will, which is more than any of us can say." },
    { id = "tr_pri", when = { class = "PRIEST" }, text = "Trust the ones who come to you hurting. People seldom lie when they're bleeding." },
    { id = "tr_war", when = { class = "WARRIOR" }, text = "Trust whoever's still standing beside you when the fight turns. Everyone's brave before it starts." },
    { id = "tr_wlk", when = { class = "WARLOCK" }, text = "Trust the few who know what you are and still talk to you. Keep the rest from finding out." },
  },
  watchout = {
    { id = "wo1", text = "Watch the roads after dark. Things come out of the trees that don't care whose side you're on." },
    { id = "wo2", text = "Watch who buys you a drink and asks nothing back. Nobody's that generous for no reason." },
    { id = "wo3", text = "Watch your purse in a crowd and your back on a lonely road. That covers most of it." },
    { id = "wo_low", when = { maxLevel = 20 }, text = "Watch anything bigger than you, which is most things yet. There's no shame in walking round a fight." },
    { id = "wo_high", when = { minLevel = 45 }, text = "At your strength? Watch the ones who want to use you. They'll be sweeter than any enemy." },
    { id = "wo_h", when = { faction = "Horde" }, text = "Watch for the Burning Blade, and for anyone who talks too fondly of the old Horde. Some never let it go." },
    { id = "wo_a", when = { faction = "Alliance" }, text = "Watch for the Defias, and the cults that crawl about in cellars. Stormwind's rot starts underground." },
    { id = "wo4", text = "Watch any grain you didn't see harvested yourself. The plague came to Lordaeron in a sack of wheat, and nobody's forgotten." },
    { id = "wo5", text = "Watch anyone who's too quick to call you friend. Friendship takes time, and you of all people should know that." },
    { id = "wo6", text = "Watch the weather if you're heading into the hills. More travellers die of a cold night than of any monster." },
    { id = "wo_earned", when = { fondness = { best = "earned" } }, text = "Watch that good heart of yours. Folk will use it, and you'll let them, because that's who you are." },
    { id = "wo_town", when = { fondness = "town" }, text = "Folk here like you, and some will be jealous of it. Watch the ones who smile too wide when your name comes up." },
    { id = "wo_rival", when = { fondness = "rival" }, text = "Watch the ones you've already crossed. They've not forgotten, and they're the patient sort." },
    { id = "wo_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "Watch for the Scarlet Crusade if you go north. They'll say they share your Light, and then they'll burn someone with it." },
    { id = "wo_al_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "Watch for priests and paladins who can smell what you've been dabbling in. They'll not ask before they act." },
    { id = "wo_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "Watch whom you take orders from. Not every seal on a letter belongs to someone who deserves your loyalty." },
    { id = "wo_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "Watch the guards, {name}. They know your sort, and they're waiting for one slip." },
    { id = "wo_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "Watch that honour of yours doesn't get you killed. Not everyone you fight will fight fair." },
    { id = "wo_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "Watch out for folk cleverer than you. There aren't many, but they'll be playing the same game you are." },
    { id = "wo_war", when = { class = "WARRIOR" }, text = "Watch your temper in a fight. Rage wins battles, but it walks you into ambushes and loses you friends." },
    { id = "wo_mag", when = { class = "MAGE" }, text = "Watch your mana and watch your back. A mage with an empty head and a raptor behind them doesn't last long." },
    { id = "wo_wlk", when = { class = "WARLOCK" }, text = "Watch the thing you've bound, and watch the folk who'd like to see you lose hold of it. There are plenty of both." },
    { id = "wo_pal", when = { class = "PALADIN" }, text = "Watch for the Scarlet Crusade. They'll call you brother, then ask why you're not burning heretics alongside them." },
    { id = "wo_dru", when = { class = "DRUID" }, text = "Watch for poachers and Venture Company crews. They'll see a bear in the woods and never stop to ask who it is." },
    { id = "wo_rog", when = { class = "ROGUE" }, text = "Watch for the Syndicate and the Defias. They don't take kindly to anyone working their roads without leave." },
    { id = "wo_hun", when = { class = "HUNTER" }, text = "Watch for other hunters' traps on the trails. They can't tell your beast from a wild one, and neither can a snare." },
    { id = "wo_scourge", when = { race = "Scourge" }, text = "Watch any town that isn't Horde. The living there won't stop to ask whether you're one of the Scourge before they light the torches." },
    { id = "wo_ne", when = { race = "NightElf" }, text = "Watch the Warsong camps in Ashenvale. The orcs are felling the forest faster than the Sentinels can stop them." },
    { id = "wo_tauren", when = { race = "Tauren" }, text = "Watch the Grimtotem. They'll call you cousin and smile, and they'd see every other tribe off Mulgore if they could." },
    { id = "wo_gnome", when = { race = "Gnome" }, text = "Watch your step near Gnomeregan. What crawls out of that place now isn't anything you'd want to meet in the dark." },
    { id = "wo_dwarf", when = { race = "Dwarf" }, text = "Watch for Dark Iron dwarves in the Searing Gorge and the Burning Steppes. They'd sooner see your beard on a spike than talk." },
    { id = "wo_orc", when = { race = "Orc" }, text = "Watch the Alliance outposts in the Barrens and Ashenvale. They see green skin and remember the old wars first." },
    { id = "wo_troll", when = { race = "Troll" }, text = "Watch the jungle trolls in Stranglethorn. They're no kin of the Darkspear, and they'd as soon eat you as greet you." },
    { id = "wo_human", when = { race = "Human" }, text = "Watch the Syndicate in Alterac and Hillsbrad. They were nobles once, and they've not forgiven anyone for it." },
    { id = "wo_mid", when = { minLevel = 25, maxLevel = 44 }, text = "Watch the places that look easy. At your strength it's the second hill you climb that has the ogres on it." },
  },
  worries = {
    { id = "wy1", text = "Everything, some nights. The war that never quite ends, the things in the dark, whether my work's worth anything." },
    { id = "wy2", text = "I worry I'm getting old in a world that has no patience for old folk. That's the truth of it." },
    { id = "wy3", text = "I worry about the people I've lost touch with. You never know which letter was the last one." },
    { id = "wy4", text = "Money, mostly, if I'm honest. It's not noble, but it keeps a body awake all the same." },
    { id = "wy5", text = "I worry about you lot, out there. I see faces come through here and some of them never come back." },
    { id = "wy_h", when = { faction = "Horde" }, text = "That the peace won't last. We've built so much since the camps, and it all hangs on so little." },
    { id = "wy_a", when = { faction = "Alliance" }, text = "That the kingdom's coming apart while the nobles bicker. The king's a boy, and the court's full of wolves." },
    { id = "wy_scourge", when = { race = "Scourge" }, text = "You, a little. I wonder sometimes how much of who you were is still in there, and whether it hurts to remember." },
    { id = "wy_dwarf", when = { race = "Dwarf" }, text = "Your folk, if I'm honest. Ironforge has lost so many to Gnomeregan and Grim Batol, and dwarves never speak of it." },
    { id = "wy_gnome", when = { race = "Gnome" }, text = "Your people. Every time I see a gnome I think of Gnomeregan, and of all the ones who never came out." },
    { id = "wy_tauren", when = { race = "Tauren" }, text = "The land your people love is sick in too many places. I wonder how much more the Earth Mother can bear." },
    { id = "wy_troll", when = { race = "Troll" }, text = "Your people are so few now, {name}. Every Darkspear lost is a hole nobody can fill, and that weighs on me." },
    { id = "wy6", text = "The harvest, the roads, the price of bread. It's dull, I know, but dull things are what keep a family fed." },
    { id = "wy7", text = "That nobody will remember the people I've buried. Somebody ought to, and I'm getting no younger." },
    { id = "wy8", text = "Some nights I lie awake wondering whether I've been a coward all my life and only called it being careful." },
    { id = "wy9", text = "That I'll make a mistake I can't take back. I've made small ones, and they were bad enough." },
    { id = "wy_earned", when = { fondness = { best = "earned" } }, text = "Truthfully? I worry about you, {name}. You've been good to me, and the good ones go first out there." },
    { id = "wy_town", when = { fondness = "town" }, text = "This town, mostly. Folk here rely on people like you more than they admit, and you can't be everywhere at once." },
    { id = "wy_values", when = { fondness = "values" }, text = "That folk who think the way we do are getting fewer, and the ones who don't are getting louder." },
    { id = "wy_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "That folk with hearts like yours burn out. The world asks so much of the kind ones and gives them so little back." },
    { id = "wy_al_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "That whatever you've been dealing with is dealing with you as well. Be careful, would you?" },
    { id = "wy_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "That you'll cross one too many of the folk who make the rules. I like you free, but I'd like you alive more." },
    { id = "wy_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "That the folk you take orders from don't deserve your loyalty. Not all of them do, you know." },
    { id = "wy_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "That someone will use your good word against you. Honest folk make easy marks for clever liars." },
    { id = "wy_orc", when = { race = "Orc" }, text = "That folk still look at your people and see the old Horde. You've shown me different, but not everyone's been listening." },
    { id = "wy_human", when = { race = "Human" }, text = "That your kingdoms are falling apart in the north while the south looks away. Lordaeron was your people's too." },
    { id = "wy_ne", when = { race = "NightElf" }, text = "That your people are losing their forests to axes and fire. I've seen what Ashenvale looks like now, and it grieves me." },
    { id = "wy_low", when = { maxLevel = 15 }, text = "That you'll go out there before you're ready. I've seen it happen, and I'd not want it to be you." },
    { id = "wy_high", when = { minLevel = 50 }, text = "That the fights you're heading into now are the sort that don't send people home: Blackrock, the Plaguelands, all of it." },
    { id = "wy_h2", when = { faction = "Horde" }, text = "The Alliance in Ashenvale and the Barrens, and the centaur on every side. We're hemmed in, and nobody wants to say it." },
    { id = "wy_a2", when = { faction = "Alliance" }, text = "That the Horde grows stronger every year while we argue over who pays for Stormwind's walls." },
  },
  hopes = {
    { id = "hp1", text = "A quiet year. Just one, with no war and no plague and nobody new to bury. That would do." },
    { id = "hp2", text = "That I'll have done some good, when it's all counted up. Not much, but some." },
    { id = "hp3", text = "To see my family settled and safe. Everything else can go hang, if I have that." },
    { id = "hp4", text = "A little house with a garden and a door that locks. It's not much of a dream, but it's mine." },
    { id = "hp5", text = "That folk like you win in the end. Somebody has to, and I'd rather it were you." },
    { id = "hp_h", when = { faction = "Horde" }, text = "That our children never see the inside of an internment camp. That's all any of us want, really." },
    { id = "hp_a", when = { faction = "Alliance" }, text = "That Lordaeron rises again someday. Maybe not in my time, but someday." },
    { id = "hp_scourge", when = { race = "Scourge" }, text = "That you find some peace, {name}, whatever peace means for the Forsaken. And that the Lich King pays for what he did to you." },
    { id = "hp_ne", when = { race = "NightElf" }, text = "That the forests your people love heal in time, and that you keep faith with the world you nearly lost." },
    { id = "hp_tauren", when = { race = "Tauren" }, text = "That your people see the herds run free across the plains again, and that your elders live to see it." },
    { id = "hp6", text = "That someday I can sit at a window and watch the road without wondering what's coming down it." },
    { id = "hp7", text = "That my children will think me a better person than I was. I'm working at it, slowly." },
    { id = "hp8", text = "To see the sea again. I grew up beside it, and I've not smelled salt air in years." },
    { id = "hp9", text = "That the people I've wronged forgave me in the end, wherever they are now." },
    { id = "hp_earned", when = { fondness = { best = "earned" } }, text = "That you'll still be coming through here years from now, {name}, with a story and a kind word. I'd like that." },
    { id = "hp_town", when = { fondness = "town" }, text = "That this town stays the sort of place that knows a good person when it sees one. It knew you, didn't it?" },
    { id = "hp_values", when = { fondness = "values" }, text = "That the world comes round to our way of seeing things. It might, with enough folk like you pushing it." },
    { id = "hp_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "That the Light keeps you, {name}, and that you keep it in turn. The world needs both of you." },
    { id = "hp_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "That honest folk get the last word for once. You'd be a fine one to give it." },
    { id = "hp_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "That you never have to bow to anyone you don't respect. I've bowed to a few too many myself." },
    { id = "hp_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "That the order you keep so faithfully turns out to be worth keeping. I think it might, with you in it." },
    { id = "hp_al_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "That whatever you've learned in the dark, you bring it back to use for good. I believe you will." },
    { id = "hp_orc", when = { race = "Orc" }, text = "That your people get to be known for what they build and not what they burned. They're well on the way, I think." },
    { id = "hp_dwarf", when = { race = "Dwarf" }, text = "That your folk drive the Dark Irons out of Blackrock someday, and that I'm near enough to hear the cheering in Ironforge." },
    { id = "hp_gnome", when = { race = "Gnome" }, text = "That your people take Gnomeregan back and clean it out properly. I'd dearly love to see the inside of it once." },
    { id = "hp_troll", when = { race = "Troll" }, text = "That the Darkspear take back the Echo Isles from Zalazane, and that there's a great feast when they do." },
    { id = "hp_tauren2", when = { race = "Tauren" }, text = "That your people's plains stay green and quiet, and that the centaur learn at last to leave them be." },
    { id = "hp_scourge2", when = { race = "Scourge" }, text = "That you find some peace, {name}, whatever peace means for your kind. You've earned some." },
    { id = "hp_human", when = { race = "Human" }, text = "That your young king grows up well, and that his father comes home to see it." },
    { id = "hp_ne2", when = { race = "NightElf" }, text = "That Malfurion wakes and finds his people well. Your folk have waited long enough for him, I'd think." },
  },
  favor = {
    { id = "fv1", text = "You've done plenty just asking. But keep yourself alive, would you? I'd miss you." },
    { id = "fv2", text = "Come back now and then and tell me what you've seen. That's all I'd ask." },
    { id = "fv3", text = "If you ever find yourself somewhere with a kind word to say about me, say it. That's enough." },
    { id = "fv4", text = "Look after the young ones you meet on the road. Somebody looked after you once, I'd wager." },
    { id = "fv5", text = "Nothing you can carry. But if you hear of trouble heading my way, send word ahead of it." },
    { id = "fv6", text = "Write me a letter now and then, even if it's only to say you're alive. Nobody writes to me much." },
    { id = "fv7", text = "Bring me a story from somewhere I'll never see. I've lived my whole life within a day's walk of here." },
    { id = "fv8", text = "Just stop by when you're passing. A friendly face does more for me than you'd think." },
    { id = "fv9", text = "Don't do anything foolish for my sake, that's all. I'd rather have you than any favour." },
    { id = "fv_earned", when = { fondness = { best = "earned" } }, text = "You've done enough for me already, {name}. If anything, I'm the one who owes you." },
    { id = "fv_town", when = { fondness = "town" }, text = "Keep looking after this town. Folk speak well of you here, and they'd be lost if you stopped coming round." },
    { id = "fv_values", when = { fondness = "values" }, text = "Keep being who you are, even when it costs you. It does me good to know there's someone like that out there." },
    { id = "fv_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "Say a prayer for me when you're somewhere the Light feels close. I've not been much for praying lately." },
    { id = "fv_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "Keep being the sort whose word holds. When I tell folk about you, I'd like it to stay true." },
    { id = "fv_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "Stay out of the stocks, that's all. I'd hate to have to visit you there." },
    { id = "fv_pri", when = { class = "PRIEST" }, text = "If you're ever at an altar, light a candle for my mother. She'd have liked you, I think." },
    { id = "fv_hun", when = { class = "HUNTER" }, text = "If you're ever out where the big cats roam, bring me back a tale of the biggest one. I collect them." },
    { id = "fv_sha", when = { class = "SHAMAN" }, text = "Ask the spirits to look kindly on this place, if they'll listen to you. They've never listened to me." },
    { id = "fv_dru", when = { class = "DRUID" }, text = "If you pass a sickly grove or a dying stream, do what you can for it. I can't, but you can." },
    { id = "fv_pal", when = { class = "PALADIN" }, text = "If you ever stand in the Plaguelands, say a word for the folk who died there. Somebody should." },
    { id = "fv_war", when = { class = "WARRIOR" }, text = "Stand in front of somebody weaker than you, the next time it counts. That would do me proud." },
    { id = "fv_low", when = { maxLevel = 20 }, text = "Grow up strong and careful, {name}. That's the only favour I'd ask of someone your age." },
    { id = "fv_high", when = { minLevel = 50 }, text = "If you ever have a quiet hour, sit with me and tell me about the places only folk like you go." },
  },
  friendship = {
    { id = "fr1", text = "I do, {name}, and I don't say that lightly. I've few enough friends, and I'm glad of every one." },
    { id = "fr2", text = "You need to ask? I'd stand by you against anyone, and I'd not think twice about it." },
    { id = "fr3", text = "A friend, and more than most of them. If you ever need a place to rest, you've one here." },
    { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "After everything you've done for me? You're the best friend I've made in years." },
    { id = "fr_town", when = { fondness = "town" }, text = "Not just me. Half this town would call you friend, and the other half just hasn't met you yet." },
    { id = "fr_al", when = { fondness = { best = "alignment" } }, text = "We stand on the same ground, you and I. Friends like that are worth more than any other kind." },
    { id = "fr_h", when = { faction = "Horde" }, text = "Friend, and more. Where I come from, we'd call you blood. Lok'tar, {name}." },
    { id = "fr_tauren", when = { race = "Tauren" }, text = "I do, and I'd say the Earth Mother smiles on you, though that's your people's way of putting it, not mine." },
    { id = "fr_dwarf", when = { race = "Dwarf" }, text = "A friend, and near enough kin. I'd share my last keg with you, and I know what that means to a dwarf." },
    { id = "fr4", text = "I do. I couldn't tell you when it happened, but somewhere along the way you stopped being a stranger." },
    { id = "fr5", text = "Of course I do. I think about you when you're gone, and I'm glad when you come back. That's a friend." },
    { id = "fr6", text = "I count you a friend, {name}, and I'd count myself lucky if you said the same of me." },
    { id = "fr7", text = "Aye, a friend, and not the sort you make over one drink. The sort you keep." },
    { id = "fr_values", when = { fondness = "values" }, text = "A friend, and the best sort, because we want the same things from the world." },
    { id = "fr_tone_p", when = { fondness = "tone", tone = "polite" }, text = "You've been kind to me every time we've spoken. How could I count you anything but a friend?" },
    { id = "fr_tone_b", when = { fondness = "tone", tone = "blunt" }, text = "You've never once told me a pretty lie. That's how I know you're a friend and not merely pleasant." },
    { id = "fr_rival", when = { fondness = "rival" }, text = "We've the same enemies and the same good sense, and that makes us friends as far as I'm concerned." },
    { id = "fr_pers", when = { fondness = "persuade" }, text = "You talked your way into my good books, I'll admit, but you've stayed there on your own merit." },
    { id = "fr_temper", when = { fondness = { best = "temper" } }, text = "I make friends easily, everyone says so, but you're one of the few I'd truly miss." },
    { id = "fr_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "A friend, and one I'm proud to have. There's a goodness in you I'd like a little more of in myself." },
    { id = "fr_al_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "A friend, though I'd not say so in front of the priests. Whatever you carry, I'll not turn my back on you." },
    { id = "fr_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "You're as steady a friend as anyone could want, and I always know where I stand with you." },
    { id = "fr_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "You're a friend, you scoundrel, and I'll not hear a word said against you, whatever you get up to." },
    { id = "fr_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "A friend, and an honest one. I'd trust you with my life, and I'd not say that of my own brother." },
    { id = "fr_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "A friend, and a crafty one. I'd hate to be your enemy, so it's lucky for me I'm not." },
    { id = "fr_a", when = { faction = "Alliance" }, text = "A friend, and a comrade besides. We've all got to stand together these days, and I'm glad I stand with you." },
    { id = "fr_human", when = { race = "Human" }, text = "Friend, and as good as any I grew up with. Better than most of them, if I'm honest." },
    { id = "fr_gnome", when = { race = "Gnome" }, text = "A friend, and the cleverest one I've got. I'd climb into any contraption you built, more or less." },
    { id = "fr_ne", when = { race = "NightElf" }, text = "A friend, if you'll have me. Your years are long and mine are short, but I'd like to be remembered kindly." },
    { id = "fr_orc", when = { race = "Orc" }, text = "A friend, and I'm proud to say it. Whatever anyone says about your people, I know better now." },
    { id = "fr_troll", when = { race = "Troll" }, text = "A friend, and a good one. You make me laugh when nothing else does, and that's worth more than gold." },
    { id = "fr_scourge", when = { race = "Scourge" }, text = "A friend, dead or not. I stopped caring about that a long while ago, and I'm glad I did." },
    { id = "fr_rog", when = { class = "ROGUE" }, text = "A friend, and a dangerous one to have. Still, I'd sooner have you on my side than anybody's." },
    { id = "fr_war", when = { class = "WARRIOR" }, text = "A friend and a shield both. I'd stand behind you in any fight and never once worry." },
    { id = "fr_wlk", when = { class = "WARLOCK" }, text = "A friend, whatever company you keep inside that little circle of yours. I've decided not to ask." },
    { id = "fr_mag", when = { class = "MAGE" }, text = "A friend, and the only mage I know who's never once made me feel stupid. I treasure that." },
    { id = "fr_sha", when = { class = "SHAMAN" }, text = "A friend, and the spirits seem to agree, since nothing's struck me by lightning yet." },
    { id = "fr_low", when = { maxLevel = 15 }, text = "You're young yet, but yes, a friend. I'll be glad to say I knew you when you were starting out." },
  },
  never_told = {
    { id = "nt1", text = "I was a coward once, when it mattered. Someone else paid for it. I've been trying to make it right ever since." },
    { id = "nt2", text = "I wanted to be an adventurer, like you. I got as far as the first crossroads and turned back." },
    { id = "nt3", text = "I still talk to someone I lost, some nights, as if they were sitting across the table. Foolish, I know." },
    { id = "nt4", text = "I don't believe half of what I'm told to believe. I just keep my mouth shut and do my work." },
    { id = "nt5", text = "I had a chance to leave all this behind, once. I stayed, and I've never been sure it was right." },
    { id = "nt_scourge", when = { race = "Scourge" }, text = "I'm afraid of your kind, a little, even of you. I've never said that aloud, and I'm ashamed of it." },
    { id = "nt_orc", when = { race = "Orc" }, text = "When I was young, I was taught that your people were monsters. Knowing you has made me ashamed of that." },
    { id = "nt_human", when = { race = "Human" }, text = "I used to envy humans, how quickly you live and how much you squeeze into it. I still do, a little." },
    { id = "nt_ne", when = { race = "NightElf" }, text = "I've always been a little in awe of your people, all those centuries behind your eyes. You make me feel very young." },
    { id = "nt6", text = "I can't read. I've hidden it for years, nodding along at the notices on the board, and you're the first to know." },
    { id = "nt7", text = "I had a sister who ran off to be a soldier. I never wrote to her, and now I don't know where I'd send it." },
    { id = "nt8", text = "When I was young I stole a loaf from a widow. She saw me and let me go, and I've thought of her every day since." },
    { id = "nt9", text = "I'm afraid of the dark. Not of what's in it, only the dark itself, and I'm a grown person afraid of the night." },
    { id = "nt10", text = "I once found a purse full of gold on the road and gave it back, and then I spent a year wishing I hadn't." },
    { id = "nt_earned", when = { fondness = { best = "earned" } }, text = "You're the reason I've not given up on folk. I'd never say that aloud, so don't make me say it twice." },
    { id = "nt_values", when = { fondness = "values" }, text = "I used to be the sort of person you'd have no time for. I changed, and nobody here knows what I was." },
    { id = "nt_al_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "I've had dark thoughts, {name}, darker than anyone knows. I think you'd understand them better than most." },
    { id = "nt_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "I stopped praying after my father died. Being around you makes me think I might start again." },
    { id = "nt_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "I've broken the law more than once, and I'd do it again if it came to it. I've a feeling you understand." },
    { id = "nt_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "I once looked the other way when I should have spoken up, and someone suffered for it. You'd never have done that." },
    { id = "nt_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "I've lied to everyone here about something, small things mostly. You're the only one who'd not judge me for it." },
    { id = "nt_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "I broke a promise once that mattered more than any other. You keep yours, so I knew I could tell you." },
    { id = "nt_tauren", when = { race = "Tauren" }, text = "I once watched one of your people sing to a dying kodo until it passed. I wept like a child, and I've never told a soul." },
    { id = "nt_gnome", when = { race = "Gnome" }, text = "I've always envied your people's cleverness. I built a clockwork bird once, and it caught fire on the first wind." },
    { id = "nt_dwarf", when = { race = "Dwarf" }, text = "I've never been able to hold my ale. Don't tell anyone, {name}, and certainly not your kin." },
    { id = "nt_troll", when = { race = "Troll" }, text = "I used to be frightened of trolls, the whole lot of you. Knowing you cured me of it, and I've never said so." },
    { id = "nt_high", when = { minLevel = 50 }, text = "I tell everyone I'm not afraid of what's in the Plaguelands. I'm terrified, and I'm glad it's you going and not me." },
    { id = "nt_low", when = { maxLevel = 15 }, text = "You remind me of myself at your age, before I learned to be afraid of everything. Don't learn it too quickly." },
  },
} }

P:Pool { id = "fondness_guard", role = "guard", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you're one of the few I don't have to watch. That's a real kindness to a tired guard." },
    { id = "r2", text = "You keep the peace without being asked and you never make my job harder, and I think well of you for it." },
    { id = "r3", text = "I think you're one of the good ones. In this job you learn to tell quickly, and I'm seldom wrong." },
  },
  confide = {
    { id = "c1", text = "Between you and me, we're stretched thinner than anyone admits. Half the watch hasn't slept properly in weeks." },
    { id = "c2", text = "Stand at a gate long enough and the whole town walks past you talking. You'd be surprised what sticks." },
    { id = "c3", text = "The captain tells us less than he ought to, but the watch talks among itself all the same." },
  },
  trust = {
    { id = "t1", text = "Trust the watch, mostly. Not all of us, mind, but the ones who've been at it longest. We know this place." },
    { id = "t2", text = "Trust the old hands on the night watch. They've been fooled once by everything, and they won't be twice." },
    { id = "t3", text = "Trust whoever reports trouble honestly, even when it makes them look bad. That's the rarest sort." },
  },
  watchout = {
    { id = "w1", text = "Pickpockets by the gate, and drunks after dark. And anyone who asks too many questions about patrol times." },
    { id = "w2", text = "Anyone loitering by the stores after dark. We've had thefts lately, and they're getting bolder." },
    { id = "w3", text = "Strangers with good boots and shabby clothes. Folk who dress down on purpose are usually up to something." },
  },
  worries = {
    { id = "y1", text = "That something comes over the wall one night and I'm the one who didn't see it. That's every guard's dream, I think." },
    { id = "y2", text = "That they'll cut the watch again. There are fewer of us every year, and the walls don't get any shorter." },
    { id = "y3", text = "My feet, if I'm honest. Twenty years standing on stone, and they let me know about every one of them." },
  },
  hopes = {
    { id = "h1", text = "A pension and a chair by the fire. Somewhere nobody needs guarding." },
    { id = "h2", text = "One quiet watch from dusk to dawn, with nothing to report but the stars." },
    { id = "h3", text = "That my own children never need a guard to keep them safe. That would mean I'd done my job." },
  },
  favor = {
    { id = "f1", text = "If you see trouble on the road in, warn us before it gets here. That's the best help a guard can get." },
    { id = "f2", text = "Just stay out of brawls inside the walls. You'd be amazed how much that helps the rest of us." },
    { id = "f3", text = "If you catch anyone breaking the peace, call the watch before you draw steel, would you?" },
  },
  friendship = {
    { id = "fr1", text = "Aye, friend. And that means if anyone gives you grief in this town, they'll answer to me." },
    { id = "fr2", text = "A friend, and I'd say so in front of the whole watch and the captain besides." },
    { id = "fr3", text = "You've watched my back out there, so I'll watch yours in here. That's friendship, the way a guard sees it." },
  },
  never_told = {
    { id = "n1", text = "I let a thief go once. A child, starving. I've never regretted it, and I've never told my captain." },
    { id = "n2", text = "I fell asleep on watch once, years ago, and nothing happened. I've stayed awake every night since out of pure fright." },
    { id = "n3", text = "I'm not much good with a sword. I'm good at looking as if I am, and that's most of the job." },
  },
} }

P:Pool { id = "fondness_innkeeper", role = "innkeeper", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you're a good guest and a better friend. Your room's always clean, and that's no accident." },
    { id = "r2", text = "You're the sort of guest who makes the whole room friendlier, and I can't put a price on that." },
    { id = "r3", text = "I think you've a good heart and an honest purse, and I've known plenty with neither." },
  },
  confide = {
    { id = "c1", text = "An innkeeper hears everything, friend. I just don't usually repeat it." },
    { id = "c2", text = "Ale loosens tongues, and I pour a great deal of it. You hear things from behind a bar." },
    { id = "c3", text = "Half the town's secrets get spilled at my tables, usually along with the ale." },
  },
  trust = {
    { id = "t1", text = "The regulars, mostly. Anyone who drinks here every night and still pays their tab is honest enough." },
    { id = "t2", text = "The ones who drink slowly. Folk who gulp their ale are usually running from something." },
    { id = "t3", text = "Trust my cook. He's as mean as a boar, but he's never once lied to anyone about the stew." },
  },
  watchout = {
    { id = "w1", text = "Strangers who pay in gold for cheap ale. They're buying something, and it isn't the drink." },
    { id = "w2", text = "Anyone who sits with their back to the wall and both eyes on the door. They're expecting trouble, and they might bring it." },
    { id = "w3", text = "The dice games in the back corner. Those dice were loaded before I ever bought the place." },
  },
  worries = {
    { id = "y1", text = "Keeping the doors open. Fewer travellers every season, and the ones who come can't always pay." },
    { id = "y2", text = "Fire. One spark from the hearth in the night, and everything I own goes up with it." },
    { id = "y3", text = "That a fight breaks out I can't stop, and somebody doesn't get up after it." },
  },
  hopes = {
    { id = "h1", text = "A full house on a feast night, with nobody fighting. Just once, I'd like to see that." },
    { id = "h2", text = "To hand this place on someday to somebody who'll love it the way I have." },
    { id = "h3", text = "A quiet winter, a full cellar and no adventurers bleeding on my floorboards." },
  },
  favor = {
    { id = "f1", text = "Tell folk where you rest your head. A good word from you fills more beds than any sign." },
    { id = "f2", text = "Wipe your boots when you come in and tell me the news from the road. That's plenty." },
    { id = "f3", text = "Keep an eye on the common room while you're in it. A good guest frightens off the bad ones." },
  },
  friendship = {
    { id = "fr1", text = "Friend? You're the guest I'm gladdest to see walk through that door, and I don't say that to many." },
    { id = "fr2", text = "A friend, and the kind I'd sit up late with once the last guest has gone to bed." },
    { id = "fr3", text = "Aye, and if I ever write down my memoirs, you'll be in one of the kinder chapters." },
  },
  never_told = {
    { id = "n1", text = "I watered the ale for a whole winter once, to keep this place open. I've felt guilty about it since." },
    { id = "n2", text = "I've never once eaten the stew. I can't abide stew, and I've been serving it for twenty years." },
    { id = "n3", text = "I named this place after someone I lost. Nobody's ever asked about it, so I've never said." },
  },
} }

local function tradeFondness() return {
  regard = {
    { id = "r1", text = "I think you're a fine customer and finer company. I'd say that even if you never bought a thing." },
    { id = "r2", text = "You pay fair and you don't haggle me into the ground, and I'd call that a fine sort of person." },
    { id = "r3", text = "I think you're honest, and in my trade honest folk stand out like gold in the gravel." },
  },
  confide = {
    { id = "c1", text = "Prices are going up again soon, so buy what you need now. You didn't hear that from me." },
    { id = "c2", text = "Merchants gossip worse than fishwives. You'd be amazed what gets said across a counter." },
    { id = "c3", text = "Coin changes hands and so does news, and I stand right in the middle of both all day." },
  },
  trust = {
    { id = "t1", text = "Never trust a trader who won't haggle. Somebody's already paying them, and it isn't you." },
    { id = "t2", text = "Trust anyone who tells you a thing's not worth buying. They're losing a sale to keep you honest." },
    { id = "t3", text = "The guild's honest enough as a rule. Its members, well, that varies from one stall to the next." },
  },
  watchout = {
    { id = "w1", text = "Goblin goods with no maker's mark. Half of them fall apart, and the other half explode." },
    { id = "w2", text = "Anyone selling cheap what ought to be dear. It's stolen or it's broken, and either way it's trouble." },
    { id = "w3", text = "The auction house just before closing. That's when the sharks come out to feed." },
  },
  worries = {
    { id = "y1", text = "Supplies, always. One bad road or one burned caravan and I've nothing on my shelves for a month." },
    { id = "y2", text = "The roads. Bandits, beasts and broken wheels all cost me more than I'll ever make back." },
    { id = "y3", text = "That the big trading houses will swallow little folk like me whole and never notice." },
  },
  hopes = {
    { id = "h1", text = "A shop of my own in a big city, with my name above the door in gold letters." },
    { id = "h2", text = "To pay off every debt I have, just once, and sleep a whole night through after." },
    { id = "h3", text = "That my children take on the business someday and make a better job of it than I did." },
  },
  favor = {
    { id = "f1", text = "Send your friends my way, and tell them I'm honest. A good name is worth more than stock." },
    { id = "f2", text = "Keep the roads clear for the caravans when you can. Every wagon that gets through feeds a family." },
    { id = "f3", text = "Tell me what's selling dear in the places you travel. A merchant lives and dies by news." },
  },
  friendship = {
    { id = "fr1", text = "A friend, and a rare one. Most folk see the counter between us, but you've always looked past it." },
    { id = "fr2", text = "A friend, and the best customer I've got, and those two don't often come together." },
    { id = "fr3", text = "Aye, and not only for your coin. I'd be glad to see you if your purse was empty." },
  },
  never_told = {
    { id = "n1", text = "I never wanted this trade. I wanted to paint. My father wanted coin, so here I am." },
    { id = "n2", text = "I've given credit to people I knew would never pay me back. I just couldn't bear to say no." },
    { id = "n3", text = "I can't add up half as fast as I let on. There's a little chart hidden under the counter." },
  },
} end
for _, role in ipairs({ "vendor", "blacksmith", "auctioneer", "banker" }) do
  P:Pool { id = "fondness_" .. role, role = role, askOnly = true, topics = tradeFondness() }
end

P:Pool { id = "fondness_trainer", role = "trainer", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you're the best pupil I've had in a long while. Don't let it go to your head." },
    { id = "r2", text = "I think you've the makings of a master, {class}, so long as you keep your head and your discipline." },
    { id = "r3", text = "I think you listen better than most of my students, and listening is half of learning." },
  },
  confide = {
    { id = "c1", text = "Half of what I teach, I learned by getting it wrong first. The books leave that part out." },
    { id = "c2", text = "Students talk in front of their teachers as if we've gone deaf, and I listen to every word." },
    { id = "c3", text = "The other trainers and I compare notes, and not only about lessons." },
  },
  trust = {
    { id = "t1", text = "Trust your training, and trust whoever taught you to doubt yourself a little. That one cared." },
    { id = "t2", text = "Trust the ones who trained beside you. You've watched each other fail, and that builds trust." },
    { id = "t3", text = "Trust teachers who teach for love of it. The ones who teach for coin only teach what you pay for." },
  },
  watchout = {
    { id = "w1", text = "Pride. It's killed more of my students than any beast or blade. Know when you're beaten." },
    { id = "w2", text = "The day after a new lesson. Everyone thinks they're unbeatable for about a day, and some don't get a second." },
    { id = "w3", text = "Anyone who promises you power quickly. There's always a price, and they never mention it first." },
  },
  worries = {
    { id = "y1", text = "That I've sent too many out the door who weren't ready. I think about them more than I'd like." },
    { id = "y2", text = "That I'm getting too old to keep pace with my own students. You lot learn faster every year." },
    { id = "y3", text = "That everything I know dies with me, if nobody carries it on after." },
  },
  hopes = {
    { id = "h1", text = "That one of my students surpasses me someday. It might even be you." },
    { id = "h2", text = "To see you walk back in here one day and teach me something. That would make an old trainer proud." },
    { id = "h3", text = "That my students live long enough to grow old. That's harder than it sounds." },
  },
  favor = {
    { id = "f1", text = "Use what I've taught you well. That's all a teacher ever really asks." },
    { id = "f2", text = "Pass on what you've learned to someone younger someday. That's how it's always been done." },
    { id = "f3", text = "Come back and tell me how my lessons served you out there, good or bad. I want to know." },
  },
  friendship = {
    { id = "fr1", text = "More than a pupil now. A friend, and a credit to me. I'm proud of you." },
    { id = "fr2", text = "Teacher and student first, but friends now, and I'm glad of the change." },
    { id = "fr3", text = "I've had a great many students and very few friends among them. You're one of the few." },
  },
  never_told = {
    { id = "n1", text = "I almost quit, before you came. Teaching felt pointless. You reminded me why I started." },
    { id = "n2", text = "I failed my own trials the first time. My teacher let me try again, and I've never told a soul." },
    { id = "n3", text = "Some days I teach you things I'm not sure of myself, and I just hope they work out there." },
  },
} }

P:Pool { id = "fondness_flightmaster", role = "flightmaster", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you're the best rider I've sent up in years. My beasts like you, and they don't like many." },
    { id = "r2", text = "I think you've the stomach for flying and the sense to keep your hands on the reins, which is all I ask of anyone." },
  },
  confide = {
    { id = "c1", text = "The beasts can tell who's afraid of heights. They fly a little gentler for them, bless 'em." },
    { id = "c2", text = "Riders talk when they land, still shaking, and I hear the news from every corner of the map." },
  },
  trust = {
    { id = "t1", text = "Trust the beasts. They know the routes better than any map, and they've never once got lost." },
    { id = "t2", text = "Trust the other flight masters along your routes. We look after one another's riders." },
  },
  watchout = {
    { id = "w1", text = "Don't lean out over the side to look down, no matter how pretty it is. I've lost riders that way." },
    { id = "w2", text = "The weather over the mountains. Even the best beast can't fly through a proper storm." },
  },
  worries = {
    { id = "y1", text = "That one of my beasts won't come back one day. I've lost a few, and every one of them hurt." },
    { id = "y2", text = "That somebody will start shooting at riders. The skies used to be the one safe road left." },
  },
  hopes = {
    { id = "h1", text = "To see every route open and safe, from one end of the land to the other." },
    { id = "h2", text = "That my beasts live long, happy lives and fly until they're too old to care." },
  },
  favor = {
    { id = "f1", text = "Be kind to the beasts when you ride. They work harder than any of us." },
    { id = "f2", text = "Tell me if you see anything strange along the routes: a hurt beast, a downed rider, anything at all." },
  },
  friendship = {
    { id = "fr1", text = "A friend and a fine rider both, and I couldn't ask for better." },
    { id = "fr2", text = "Aye, a friend, and the beasts would say the same if they could talk." },
  },
  never_told = {
    { id = "n1", text = "I've never flown myself. Not once. Can't stand heights, and that's the truth." },
    { id = "n2", text = "I sing to the beasts when nobody's about. Terribly, too, but they don't seem to mind it." },
  },
} }

P:Pool { id = "fondness_stablemaster", role = "stablemaster", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you treat your animals well, and that tells me everything I need to know about a person." },
    { id = "r2", text = "You're kind to creatures that can't speak for themselves, and that's the truest kindness there is." },
  },
  confide = {
    { id = "c1", text = "Beasts know more about people than people do. Yours is fond of you, if you were wondering." },
    { id = "c2", text = "Folk talk to their mounts when they think nobody's listening, and I'm usually mucking out the next stall." },
  },
  trust = {
    { id = "t1", text = "Trust anyone their animals trust. A beast can't be fooled by fine words." },
    { id = "t2", text = "Trust the hunters, mostly. They know animals, and they know people better than they let on." },
  },
  watchout = {
    { id = "w1", text = "Anyone who's rough with their beast. They'll be rough with you too, given half a chance." },
    { id = "w2", text = "Sickness in the wild animals. When the beasts fall ill, something's wrong with the land itself." },
  },
  worries = {
    { id = "y1", text = "That one of the animals in my care will sicken and I won't know how to help it." },
    { id = "y2", text = "Feed prices, if I'm honest. Beasts eat a great deal, and coin only stretches so far." },
  },
  hopes = {
    { id = "h1", text = "That every beast I've stabled ends up with a kind master who comes back for it." },
    { id = "h2", text = "A bigger stable with good fields and clean water, and the time to enjoy it." },
  },
  favor = {
    { id = "f1", text = "Take good care of your companion. That's the best favour you could ever do me." },
    { id = "f2", text = "If you come across a beast that's been badly used, don't walk on past it. That's all I ask." },
  },
  friendship = {
    { id = "fr1", text = "A friend, and your beast's a friend of mine too, which counts for more with me than you'd think." },
    { id = "fr2", text = "Aye, you're a friend. Anyone who loves animals the way you do is a friend of mine." },
  },
  never_told = {
    { id = "n1", text = "I talk to the animals more than to folk. They've never once told my secrets." },
    { id = "n2", text = "I wept for a week when my first horse died, and I've never told a living soul." },
  },
} }

P:Pool { id = "fondness_peon", role = "peon", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "You nice to peon, and nobody nice to peon. Peon think you very good, maybe the best." },
    { id = "r2", text = "You never kick peon or yell at peon. Peon remember that, because peon not stupid." },
  },
  confide = {
    { id = "c1", text = "Peon carry wood all day, and everybody talk near peon like peon is tree. Peon hear lots." },
    { id = "c2", text = "Big important orcs not see peon, so peon know many secret things." },
  },
  trust = {
    { id = "t1", text = "Trust peons. Peons too tired to lie to anybody." },
    { id = "t2", text = "Trust overseer when he sleeping. When he awake, not so much." },
  },
  watchout = {
    { id = "w1", text = "Watch for falling tree, and also for overseer, because both hit very hard." },
    { id = "w2", text = "Watch where you walk. Peon dig many holes, and not every hole has a sign." },
  },
  worries = {
    { id = "y1", text = "Peon worry about getting enough soup, and also about new overseer, who is very shouty." },
    { id = "y2", text = "Peon worry somebody put peon back in camp. Thrall say never again, but peon still dream about it." },
  },
  hopes = {
    { id = "h1", text = "Peon hope for one day off, with sun and nap and nobody saying work work." },
    { id = "h2", text = "Peon hope someday be grunt with big axe. Then other peon chop wood for me, maybe." },
  },
  favor = {
    { id = "f1", text = "You tell overseer peon work very hard. Is true, mostly." },
    { id = "f2", text = "Just say hello when you pass by. Most people not even look at peon." },
  },
  friendship = {
    { id = "fr1", text = "Peon never have friend who not also peon. You the first one, and peon very happy. Zug zug!" },
    { id = "fr2", text = "You friend of peon, so peon friend of you. Is simple, like wood." },
  },
  never_told = {
    { id = "n1", text = "Peon not so lazy as overseer think. Peon just very good at napping where nobody look." },
    { id = "n2", text = "Peon say sorry to every tree before peon chop it. Nobody know this, so you not tell." },
  },
} }

P:Pool { id = "fondness_citizen", role = "citizen", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you're the sort of person this town needs more of, and I tell my neighbours so." },
    { id = "r2", text = "You always have time for ordinary folk like me, and I can't say that of many who carry a sword." },
    { id = "r3", text = "I think you're a good sort, {name}. My mother would have liked you, and she liked nobody." },
  },
  confide = {
    { id = "c1", text = "I've lived on this street all my life, and not much happens here that I don't hear about sooner or later." },
    { id = "c2", text = "Folk talk over the fence and at the well, and I'm at both more often than I ought to be." },
  },
  trust = {
    { id = "t1", text = "Trust the old families who've been here since before the war. They've seen every sort come and go." },
    { id = "t2", text = "Trust anyone who'd lend you a cup of flour without asking when you'd pay it back." },
  },
  watchout = {
    { id = "w1", text = "Newcomers who ask too many questions about who lives where. That's never a good sign." },
    { id = "w2", text = "The alleys once the lamps go out. Most nights it's only cats, but not every night." },
  },
  worries = {
    { id = "y1", text = "Taxes, the roads and the price of everything. Ordinary worries, but they're the ones that keep me up." },
    { id = "y2", text = "My children, mostly. The world they're growing up in is harder than the one I had." },
  },
  hopes = {
    { id = "h1", text = "That my little house stays standing and my family stays under its roof. That's enough for anyone." },
    { id = "h2", text = "A quiet life and a long one. I'll leave the glory to folk like you, and gladly." },
  },
  favor = {
    { id = "f1", text = "Just keep doing what you're doing. Folk like me sleep easier knowing folk like you are out there." },
    { id = "f2", text = "If you see my neighbour's boy out on the roads, send him home. He thinks he's a hero, and he isn't yet." },
  },
  friendship = {
    { id = "fr1", text = "Of course I count you a friend. You're the only one of your sort who's ever asked after my family." },
    { id = "fr2", text = "I do, and I'm proud of it. I tell people I know you, and you should see their faces." },
  },
  never_told = {
    { id = "n1", text = "I always wanted to pick up a sword and go out like you do. I never had the courage, and now I'm too old." },
    { id = "n2", text = "I envy you sometimes, coming and going as you please. I've never been further than the next town." },
  },
} }

P:Pool { id = "fondness_child", role = "child", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you're the best adventurer ever, better than the ones in stories, because you actually talk to me!" },
    { id = "r2", text = "You're my favourite grown-up, but that's a secret, so don't tell Mama, because she thinks it's her." },
  },
  confide = {
    { id = "c1", text = "Grown-ups say all sorts of things when they think I'm not listening, but I always am." },
    { id = "c2", text = "I know lots of secrets, because I'm small and I hide under tables and nobody ever looks there." },
  },
  trust = {
    { id = "t1", text = "Trust the lady who gives out sweets, and never trust anybody who says they don't like dogs." },
    { id = "t2", text = "You can trust me! I'm very trustworthy, and I only ever lie about eating my vegetables." },
  },
  watchout = {
    { id = "w1", text = "Watch out for the big dog by the gate. He's friendly, but he jumps, and he knocked me right over once." },
    { id = "w2", text = "Watch out for spiders, big ones and little ones, but mostly the big ones." },
  },
  worries = {
    { id = "y1", text = "I worry there's a monster under my bed, but Papa says there isn't, and I don't think he checked properly." },
    { id = "y2", text = "I worry you'll go away and not come back, like my uncle did. You will come back, won't you?" },
  },
  hopes = {
    { id = "h1", text = "I hope I grow up to be just like you, with a big sword and lots and lots of stories!" },
    { id = "h2", text = "I hope I get a puppy, or a dragon, but a puppy would be fine if there aren't any dragons left." },
  },
  favor = {
    { id = "f1", text = "Can you tell me a story about a dragon sometime? A real one, not a made-up one." },
    { id = "f2", text = "Can you show me how to hold a sword properly? Just with a stick, because Mama won't let me have a real one." },
  },
  friendship = {
    { id = "fr1", text = "You're my best friend in the whole world, and I'm going to tell everybody!" },
    { id = "fr2", text = "Yes! You're my friend and I'm your friend, and that means we have to share things, because those are the rules." },
  },
  never_told = {
    { id = "n1", text = "I broke Mama's good plate and blamed the cat. The cat didn't mind, but I still feel bad about it." },
    { id = "n2", text = "I'm scared of the dark, but I tell everyone I'm not. You won't tell, will you?" },
  },
} }

P:Pool { id = "fondness_worker", role = "worker", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "You've never once looked through me like I'm part of the wall, and I think the world of you for it." },
    { id = "r2", text = "I think you work hard, same as me, only at a different trade, and that makes us alike." },
  },
  confide = {
    { id = "c1", text = "Carrying stone all day, you hear everything the foremen say over your head." },
    { id = "c2", text = "Nobody minds their tongue around the folk doing the lifting, so I've heard a good deal." },
  },
  trust = {
    { id = "t1", text = "Trust anyone with calluses on their hands. Soft hands usually mean somebody else did the work." },
    { id = "t2", text = "Trust the other workers, mostly. We look after our own, because nobody else will." },
  },
  watchout = {
    { id = "w1", text = "Scaffolding, ladders and anything a foreman swears is perfectly safe." },
    { id = "w2", text = "Folk who hire on the cheap and pay late. They'll cheat you the same way they cheat us." },
  },
  worries = {
    { id = "y1", text = "My back, my wages and my family, in that order most days, and the other way round on the bad ones." },
    { id = "y2", text = "That the work dries up. When the building stops, so does the bread." },
  },
  hopes = {
    { id = "h1", text = "That someday I'll build something with my name on it, even if it's only one little stone in a corner." },
    { id = "h2", text = "A roof of my own that I didn't raise for somebody else. That would be a fine thing." },
  },
  favor = {
    { id = "f1", text = "Tell the foreman I do good work, if you ever get the chance. It's the only way anyone gets raised up." },
    { id = "f2", text = "Just keep the roads safe. My mates and I have to walk them every morning before light." },
  },
  friendship = {
    { id = "fr1", text = "A friend, aye, and a good one. You treat folk like me as equals, and I don't forget that." },
    { id = "fr2", text = "I'd call you a mate, and where I come from that means something." },
  },
  never_told = {
    { id = "n1", text = "I laid the stones of a wall that fell down two years later. Nobody was hurt, but I never told anyone it was mine." },
    { id = "n2", text = "I can't swim, and I've worked on the docks for ten years. Every single day I'm a little afraid." },
  },
} }

P:Pool { id = "fondness_soldier", role = "soldier", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you'd make a fine soldier, {name}, though you'd hate the drills. You've the steel for it." },
    { id = "r2", text = "I've served beside a lot of people, and I'd trust you at my side over most of them." },
  },
  confide = {
    { id = "c1", text = "Soldiers talk around the fire, and I've heard plenty the officers wouldn't want spread about." },
    { id = "c2", text = "The ranks know things the generals don't, and the generals know things they never tell the ranks." },
  },
  trust = {
    { id = "t1", text = "Trust the sergeants. Officers come and go, but a good sergeant keeps the whole lot of us alive." },
    { id = "t2", text = "Trust anyone who's stood a night watch beside you and not dozed off." },
  },
  watchout = {
    { id = "w1", text = "Your flanks. Every soldier knows to watch them, and every soldier forgets it once." },
    { id = "w2", text = "Scouts who come back too quickly. Either they never looked properly, or somebody got to them first." },
  },
  worries = {
    { id = "y1", text = "That I'll freeze when it matters. Every soldier worries about it, and the honest ones admit it." },
    { id = "y2", text = "That we're spread too thin, with too few soldiers, too many enemies and too many miles between." },
  },
  hopes = {
    { id = "h1", text = "That I make it home in one piece, and that home's still there when I do." },
    { id = "h2", text = "A medal would be nice, but I'll settle for seeing my whole company alive at the end of the season." },
  },
  favor = {
    { id = "f1", text = "Thin out the beasts on the roads when you're passing. Every one you kill is one we don't have to." },
    { id = "f2", text = "If I fall, write to my mother for me. Tell her I wasn't afraid, even if I was." },
  },
  friendship = {
    { id = "fr1", text = "You're a comrade, and that's better than a friend, because comrades don't leave each other behind." },
    { id = "fr2", text = "Aye, a friend, and I'd take an arrow for you without stopping to think about it." },
  },
  never_told = {
    { id = "n1", text = "I ran from my first battle. I came back before anyone noticed, but I've never forgotten it." },
    { id = "n2", text = "Half the time I don't know what I'm fighting for. I only know who I'm fighting beside." },
  },
} }

P:Pool { id = "fondness_priest", role = "priest", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you have a good soul, {name}, and I've seen enough souls to know one." },
    { id = "r2", text = "You bring a peace with you when you come in here, and I'm more grateful for it than you know." },
    { id = "r_a", when = { faction = "Alliance" }, text = "I see the Light in you as plain as day, and I give thanks for it every time you come through these doors." },
  },
  confide = {
    { id = "c1", text = "Folk tell their priest everything, {name}, and most of it I'll take to my grave. Not quite all of it, though." },
    { id = "c2", text = "People confess more than sins to me, and some of it I've wanted to share with someone I trust." },
  },
  trust = {
    { id = "t1", text = "Trust the ones who are kind when nobody's watching. Faith shows itself in small things." },
    { id = "t2", text = "Trust the healers, whatever side they're on. They've seen too much blood to wish for more of it." },
  },
  watchout = {
    { id = "w1", text = "Those who wear holy symbols and talk of purging. The Scarlet Crusade has twisted a great many good hearts." },
    { id = "w2", text = "Yourself, {name}. The greatest danger to a good person is pride in their own goodness." },
  },
  worries = {
    { id = "y1", text = "That I've no answers for the grieving who come to me. I give what comfort I can, but it's never enough." },
    { id = "y2", text = "That my faith isn't as strong as it should be. I preach it every day, and some nights it feels thin." },
  },
  hopes = {
    { id = "h1", text = "To see an end to the burying. I've said the last words over far too many young faces." },
    { id = "h2", text = "That everyone I've comforted finds their way to peace, even the ones who never came back." },
  },
  favor = {
    { id = "f1", text = "Be kind to someone who doesn't deserve it. That's the hardest prayer there is." },
    { id = "f2", text = "Sit with the sick sometimes. They're lonely, and a visitor heals more than a bandage does." },
  },
  friendship = {
    { id = "fr1", text = "You're a friend and a blessing both, and I don't use that word carelessly." },
    { id = "fr2", text = "I count you a friend, {name}, and I keep you in my prayers, whatever you believe." },
  },
  never_told = {
    { id = "n1", text = "I doubt, {name}. Every priest does and few of us admit it, and you're the first I've told." },
    { id = "n2", text = "I lied at a deathbed once. I told a dying man his son was safe when I didn't know, and I'd do it again." },
  },
} }

P:Pool { id = "fondness_militia", role = "militia", askOnly = true, topics = {
  regard = {
    { id = "r1", text = "I think you're the real thing, {name}. We're farmers with spears, and you're what we're pretending to be." },
    { id = "r2", text = "You've helped us more than any lord or captain ever has, and every one of us out here knows it." },
  },
  confide = {
    { id = "c1", text = "Out here on the edge of things, we hear what the soldiers in town never do." },
    { id = "c2", text = "Standing a night watch gives a body plenty of time to think, and to listen." },
  },
  trust = {
    { id = "t1", text = "Trust the farmers. They've the most to lose, and they don't pretend otherwise." },
    { id = "t2", text = "Trust anyone who stayed when it got bad. The rest went off to the city." },
  },
  watchout = {
    { id = "w1", text = "The treeline at dusk. That's when they come, if they're coming at all." },
    { id = "w2", text = "Bandits and beasts on the back roads. We can't patrol all of them, much as we try." },
  },
  worries = {
    { id = "y1", text = "That we're not enough. If anything real comes, a few spears and pitchforks won't stop it." },
    { id = "y2", text = "My fields. They've gone half wild since I took up the spear, and winter's coming on." },
  },
  hopes = {
    { id = "h1", text = "To put down this spear and pick up a plough again, and never need the spear after." },
    { id = "h2", text = "That somebody in charge remembers we're out here before we have to remind them the hard way." },
  },
  favor = {
    { id = "f1", text = "Keep killing the beasts that come near the farms. That's more help than anyone's sent us." },
    { id = "f2", text = "If you're passing at night, have a look along the fences for us. Every pair of eyes helps." },
  },
  friendship = {
    { id = "fr1", text = "Aye, a friend, and the whole watch would say the same. You stood with us when nobody else would." },
    { id = "fr2", text = "A friend? You're one of us as far as we're concerned, spear or no spear." },
  },
  never_told = {
    { id = "n1", text = "I've never actually fought anything. A year of night watches, and I've not once raised this spear in anger." },
    { id = "n2", text = "I only joined up because my wife told me to. I'm glad of it now, but I didn't want to at the time." },
  },
} }

---------------------------------------------------------------------------
-- Home cities: the speaker's own people. Pools can only be narrowed by role and `zone`, so
-- each city builds one pool per role there (a fresh copy each; pools index their own lines).
-- A zone pool scores 120 to a role pool's 100: priority -20 puts these lines level with the
-- role pools' plain ones, so the two mix. Tinker Town and Sen'jin are subzones: their lines
-- carry `subzone` (+15), so Tinker Town's gnome lines (115) win over Ironforge's dwarf ones,
-- and Sen'jin's take priority -35 to mix with the role lines like the rest.
---------------------------------------------------------------------------
local cityRoles = { "guard", "citizen", "vendor", "blacksmith", "auctioneer", "banker", "trainer",
  "innkeeper", "flightmaster", "stablemaster", "worker", "soldier", "priest", "militia",
  "noble", "scholar", "questgiver", "farmer" }
local function cityFondness(id, zone, priority, build)
  for _, role in ipairs(cityRoles) do
    local topics = build()
    for _, list in pairs(topics) do
      for _, line in ipairs(list) do line.priority = line.priority or priority end
    end
    P:Pool { id = "fondness_" .. id .. "_" .. role, role = role, zone = zone, askOnly = true, topics = topics }
  end
end

cityFondness("orgrimmar", "Orgrimmar", -20, function() return {
  regard = {
    { id = "r_org1", text = "You fight well and you speak plainly, {class}. Among orcs there is no higher praise than that." },
    { id = "r_org2", text = "I have watched you come through the gates of Orgrimmar many times, and each time you stand a little taller. Good." },
    { id = "r_org3", text = "You are Horde in your bones, {name}. I knew it the first day I saw you." },
  },
  confide = {
    { id = "c_org1", text = "The Valley of Strength hears every quarrel in this city, and I hear most of them." },
    { id = "c_org2", text = "Orgrimmar is a young city, and young cities keep more secrets than old ones. I know a few." },
  },
  trust = {
    { id = "t_org1", text = "Trust those who stood with Thrall when he broke the camps open. Their loyalty was forged in fire." },
    { id = "t_org2", text = "Trust the grunts at the gate. They are rough, but no enemy has ever passed while they stood." },
  },
  watchout = {
    { id = "w_org1", text = "Watch the Cleft of Shadow, {name}. Too many there still whisper about the old ways and the power of demons." },
    { id = "w_org2", text = "Watch Ragefire Chasm beneath the city. The Burning Blade crawl through it like maggots in a wound." },
  },
  worries = {
    { id = "y_org1", text = "That the bloodlust never truly left us, and only sleeps. I feel it sometimes when the drums are loud." },
    { id = "y_org2", text = "The Warsong in Ashenvale. Grom's people fight bravely, but every tree they fell makes the night elves hate us more." },
  },
  hopes = {
    { id = "h_org1", text = "That the Horde grows strong enough that no one ever thinks to chain us again, and wise enough not to need war." },
    { id = "h_org2", text = "That I live to see the Horde known for its honour instead of its old crimes. Thrall believes it can be, and so do I." },
  },
  favor = {
    { id = "f_org1", text = "Fight well, and tell me of it after. That is all an old warrior asks of a younger one." },
    { id = "f_org2", text = "Remember Grom Hellscream's sacrifice whenever easy power tempts you. That is the favour I ask." },
  },
  friendship = {
    { id = "fr_org1", text = "You are my friend and my blood, {name}. Lok'tar." },
    { id = "fr_org2", text = "A friend? You are more than that. You are Horde, and you have proven it to me." },
    { id = "fr_org3", text = "I would stand beside you in any battle and never ask why. That is what friendship means to an orc." },
  },
  never_told = {
    { id = "n_org1", text = "I remember the rage of the old Horde, and how good it felt. That is what shames me most, even now." },
    { id = "n_org2", text = "I wept when we left the camps, and not from joy. I had never seen the sky so wide, and it frightened me." },
  },
} end)

cityFondness("thunderbluff", "Thunder Bluff", -20, function() return {
  regard = {
    { id = "r_tb1", text = "You walk with a quiet heart, {name}, and the spirits of the bluff are glad of you. So am I." },
    { id = "r_tb2", text = "I think the Earth Mother smiled on the day our paths crossed, and there are few I would say that of." },
    { id = "r_tb3", text = "You listen before you speak, and you speak with care. That is how a tauren knows a friend." },
  },
  confide = {
    { id = "c_tb1", text = "The winds carry many things up to these bluffs, little one, and I have learned to listen to them." },
    { id = "c_tb2", text = "Thunder Bluff seems peaceful from the lifts, but even here some voices are louder than they should be." },
  },
  trust = {
    { id = "t_tb1", text = "Trust Cairne Bloodhoof as you trust the sun to rise. His word has never failed our people." },
    { id = "t_tb2", text = "Trust the Runetotem druids on Elder Rise. They see far, and they speak only of what they have seen." },
  },
  watchout = {
    { id = "w_tb1", text = "Beware the Grimtotem, friend. Magatha smiles at Cairne's side, but her heart is a stone at the bottom of a river." },
    { id = "w_tb2", text = "Mind the edges of the bluffs at night. The winds are strong up here, and they have taken careless walkers before." },
  },
  worries = {
    { id = "y_tb1", text = "The centaur grow bolder every season, and the quilboar too. Our herds cannot run where the land is full of enemies." },
    { id = "y_tb2", text = "That the young ones forget the old songs. A people who forget their songs soon forget themselves." },
  },
  hopes = {
    { id = "h_tb1", text = "That the great kodo return to the plains in their thousands, as they did when I was a calf." },
    { id = "h_tb2", text = "That An'she shines long on Mulgore, and that our people never have to wander again." },
  },
  favor = {
    { id = "f_tb1", text = "Honour the hunt, take only what you need, and thank the spirit of what you take. That is all I ask." },
    { id = "f_tb2", text = "If you pass a dying kodo on the plains, stay with it a little while. No creature should go to the Earth Mother alone." },
  },
  friendship = {
    { id = "fr_tb1", text = "You are my friend, {name}, and my herd counts you one of its own. Walk with the Earth Mother." },
    { id = "fr_tb2", text = "A friend, yes. The plains are wide, but I am glad they led you here to me." },
    { id = "fr_tb3", text = "As surely as the moon follows the sun, friend. May the eternal sun shine upon you." },
  },
  never_told = {
    { id = "n_tb1", text = "When I was young I longed to leave Mulgore and see the sea, and I was ashamed of it. I still dream of the waves." },
    { id = "n_tb2", text = "I once lost a whole herd to a storm because I was too proud to turn back. The Earth Mother forgave me long before I forgave myself." },
  },
} end)

cityFondness("undercity", "Undercity", -20, function() return {
  regard = {
    { id = "r_uc1", text = "You haven't bored me yet, {name}, which puts you ahead of nearly everyone, living or dead." },
    { id = "r_uc2", text = "I think you're useful and I think you're loyal, and down here those are the two finest things anyone can be." },
    { id = "r_uc3", text = "I've grown almost fond of you. Don't let it go to your head; it's the one part of you that isn't rotting." },
  },
  confide = {
    { id = "c_uc1", text = "The sewers carry whispers as well as filth, and I've learned to listen to both." },
    { id = "c_uc2", text = "Nobody in this city is quite as loyal as they pretend, {name}. I keep a careful tally." },
  },
  trust = {
    { id = "t_uc1", text = "Trust the Dark Lady, and trust her Deathguards because she does. Everyone else, trust as far as you could throw a ghoul." },
    { id = "t_uc2", text = "The apothecaries? Never. Trust the ones who still remember being alive and still mourn it." },
  },
  watchout = {
    { id = "w_uc1", text = "The Scarlet Crusade in Tirisfal. They burn our kind, and they enjoy every moment of it." },
    { id = "w_uc2", text = "The Royal Apothecary Society's little experiments. What they brew for the living rarely stays pointed at the living." },
  },
  worries = {
    { id = "y_uc1", text = "That I'll wake one night and find the Lich King's voice back in my head. We all fear it, whether we admit it or not." },
    { id = "y_uc2", text = "That the living will never let us be. They burned us once already, and they'd happily do it again." },
  },
  hopes = {
    { id = "h_uc1", text = "That the Dark Lady has her revenge on Arthas, and that I'm in the crowd to watch it." },
    { id = "h_uc2", text = "That someday I can walk into a town I once lived in without anybody screaming." },
  },
  favor = {
    { id = "f_uc1", text = "If you pass the Scarlet Monastery, give the Crusade something to remember me by. I'd count it a kindness." },
    { id = "f_uc2", text = "Bring me news of Lordaeron's old towns, whatever's left of them. I'd like to know what became of my street." },
  },
  friendship = {
    { id = "fr_uc1", text = "A friend. A strange thing for a corpse to have, but I find I'm glad of it." },
    { id = "fr_uc2", text = "Yes, {name}, though I'd deny it in front of the apothecaries. Friends are a weakness down here, and you're mine." },
    { id = "fr_uc3", text = "The Scourge took nearly everything from us, but it never took this. Yes, you're my friend." },
  },
  never_told = {
    { id = "n_uc1", text = "I still remember the taste of bread, warm from my mother's oven. I'd give a great deal for one more bite." },
    { id = "n_uc2", text = "When I first woke, I was glad my wife hadn't risen with me. Then I wondered where she'd gone, and I've wondered ever since." },
  },
} end)

cityFondness("ironforge", "Ironforge", -20, function() return {
  regard = {
    { id = "r_if1", text = "Ye've a good heart and a stout arm, {g:lad|lass}, and that's all a dwarf ever asks of anybody." },
    { id = "r_if2", text = "By my beard, ye're the finest sort to come through these gates in many a long season." },
    { id = "r_if3", text = "I think ye're as solid as the mountain, and there's nae higher praise in Ironforge than that." },
  },
  confide = {
    { id = "c_if1", text = "The Great Forge hears every secret in Ironforge, and I've stood by it long enough to hear a fair few." },
    { id = "c_if2", text = "Ironforge looks as steady as stone, but there's more muttering in the Commons than the king would like." },
  },
  trust = {
    { id = "t_if1", text = "Trust King Magni, and any dwarf who's held a shield with the Mountaineers. They'll nae let ye down." },
    { id = "t_if2", text = "The Explorers' League, mostly. They'll talk yer ear off about the titans, but they're honest folk, every one." },
  },
  watchout = {
    { id = "w_if1", text = "Dark Iron spies, {g:lad|lass}. They've been seen in the deep tunnels, and they've nae forgotten the old war." },
    { id = "w_if2", text = "The ale in the Stonefire Tavern, if ye've business in the morning. It's stronger than it tastes, and I'd know." },
  },
  worries = {
    { id = "y_if1", text = "Gnomeregan, still. Our wee friends lost everything, and I fear the troggs'll come up out of the deeps for us next." },
    { id = "y_if2", text = "The Dark Irons, always. Thaurissan's folk have hated us for centuries, and they're nae done with us yet." },
  },
  hopes = {
    { id = "h_if1", text = "That the Explorers' League finds the truth of the titans, and that it proves us dwarves were made of the finest stone." },
    { id = "h_if2", text = "That the Wildhammer and the Bronzebeards sit at one table again, and that I'm there to see who drinks whom under it." },
  },
  favor = {
    { id = "f_if1", text = "Raise a mug to my old da when ye next sit down in a tavern. He'd have liked ye." },
    { id = "f_if2", text = "Bring me a tale from the Badlands or the Wetlands, anywhere our folk are digging. I miss the open road." },
  },
  friendship = {
    { id = "fr_if1", text = "Friend? Ye're near enough clan, {g:lad|lass}, and I'll hear nae argument on it." },
    { id = "fr_if2", text = "Aye, a friend through and through, and that's as solid as Ironforge stone." },
    { id = "fr_if3", text = "By the forge, aye! I'd fight beside ye in the deepest hole in Khaz Modan." },
  },
  never_told = {
    { id = "n_if1", text = "I'm afraid of the deep places. A dwarf afraid of tunnels, can ye credit it? I've never told a soul." },
    { id = "n_if2", text = "When I was a wee bairn I wanted to be a Wildhammer and ride gryphons in the open air. My da would've skinned me." },
  },
} end)

local function tinker() return { subzone = "Tinker Town" } end
cityFondness("tinkertown", "Ironforge", -20, function() return {
  regard = {
    { id = "r_tt1", when = tinker(), text = "I think you're a remarkable person, {name}, statistically speaking, and I've run the numbers twice!" },
    { id = "r_tt2", when = tinker(), text = "You've never once laughed at my inventions, even the one that exploded, which puts you in the top one percent of everyone." },
    { id = "r_tt3", when = tinker(), text = "I'd rate you very highly indeed, at least a nine out of ten, and I don't hand out nines lightly." },
  },
  confide = {
    { id = "c_tt1", when = tinker(), text = "Tinker Town's walls are thin and gnomes talk while they work, so I hear nearly everything whether I want to or not." },
    { id = "c_tt2", when = tinker(), text = "Most folk think gnomes only notice gears, but we notice people too, probably more than they'd like." },
  },
  trust = {
    { id = "t_tt1", when = tinker(), text = "Trust High Tinker Mekkatorque with your life, and the Gnomeregan Exiles with your gear, though the gear sometimes sparks." },
    { id = "t_tt2", when = tinker(), text = "Trust anyone who shows you their failed prototypes. Hiding mistakes is how cities end up full of radiation." },
  },
  watchout = {
    { id = "w_tt1", when = tinker(), text = "Gnomeregan, if you go near it. Thermaplugg's still in there, and the troggs and leper gnomes are no friendlier than he is." },
    { id = "w_tt2", when = tinker(), text = "Anything in Tinker Town with a fuse on it, which is about sixty percent of everything by my last count." },
  },
  worries = {
    { id = "y_tt1", when = tinker(), text = "That we'll never go home. Gnomeregan was the most beautiful city ever built, and we poisoned it ourselves to save it." },
    { id = "y_tt2", when = tinker(), text = "That my sums about the radiation were right. I keep hoping I made an error somewhere, which is not a feeling I enjoy." },
  },
  hopes = {
    { id = "h_tt1", when = tinker(), text = "That we retake Gnomeregan and scrub every last cog of it clean, and that the trams run on time again." },
    { id = "h_tt2", when = tinker(), text = "To build something that doesn't explode, ideally before I'm too old to enjoy it, and I think I'm very close." },
  },
  favor = {
    { id = "f_tt1", when = tinker(), text = "If you're ever near the old city, salvage me a gear or two with the Gnomeregan stamp on it. It's purely sentimental." },
    { id = "f_tt2", when = tinker(), text = "Tell people gnomes aren't only clever but brave, too. We went back into Gnomeregan to bring our people out, you know." },
  },
  friendship = {
    { id = "fr_tt1", when = tinker(), text = "A friend, absolutely, and you're the first one in quite some time who wasn't covered in grease!" },
    { id = "fr_tt2", when = tinker(), text = "Of course! By my calculations we've been friends for exactly as long as you've been kind to me, which is always." },
    { id = "fr_tt3", when = tinker(), text = "Yes, {name}, and I'd trust you to hold the other end of anything, even the end that sparks." },
  },
  never_told = {
    { id = "n_tt1", when = tinker(), text = "I left someone behind in Gnomeregan when the radiation came, and I've told everyone I didn't know them. I did." },
    { id = "n_tt2", when = tinker(), text = "Sometimes I don't understand my own blueprints, so I just nod and keep tinkering and hope nobody asks." },
  },
} end)

cityFondness("darnassus", "Darnassus", -20, function() return {
  regard = {
    { id = "r_dn1", text = "Elune's light is gentle on you, {name}, and I find I trust it. That is not something I say lightly." },
    { id = "r_dn2", text = "You are young, as nearly everyone seems young to me, but you carry yourself with a patience I respect." },
    { id = "r_dn3", text = "I have watched you among the trees, and you walk softly. The forest notices such things, and so do I." },
  },
  confide = {
    { id = "c_dn1", text = "Teldrassil is not so quiet as it seems from below, and I have listened to its whispers for many years." },
    { id = "c_dn2", text = "Among my people a secret may be kept for a thousand years. I will keep rather fewer from you than that." },
  },
  trust = {
    { id = "t_dn1", text = "Trust the Sentinels, and Tyrande Whisperwind above all. She has guarded us since before your kingdoms had names." },
    { id = "t_dn2", text = "Trust the druids of the Cenarion Enclave. They speak slowly, but they speak true." },
  },
  watchout = {
    { id = "w_dn1", text = "Beware the Warsong in Ashenvale, and the satyrs in Felwood. Both are wounds, and both are spreading." },
    { id = "w_dn2", text = "Beware the old Highborne ruins along the coast. Some of their magic still waits there for a careless hand." },
  },
  worries = {
    { id = "y_dn1", text = "We gave up our immortality on Hyjal, and so few of us know how to be mortal. I am not sure I do." },
    { id = "y_dn2", text = "That the World Tree will not heal the world as we hoped. Teldrassil is beautiful, but it does not feel as Nordrassil did." },
  },
  hopes = {
    { id = "h_dn1", text = "That Malfurion wakes from the Emerald Dream and finds his people worthy of him." },
    { id = "h_dn2", text = "That the forests of Ashenvale sing again as they did before the axes came." },
  },
  favor = {
    { id = "f_dn1", text = "Walk gently in the forests, and plant something wherever you take something. That is all Elune asks, and all I ask." },
    { id = "f_dn2", text = "If you go to Ashenvale, stand with the Sentinels for a while. They are few, and the axes are many." },
  },
  friendship = {
    { id = "fr_dn1", text = "I count you a friend, {name}, and among my people such a friendship outlasts your grandchildren's grandchildren." },
    { id = "fr_dn2", text = "Ishnu-alah, friend. Yes, I count you so, and gladly." },
    { id = "fr_dn3", text = "Elune-adore. You are a friend, and I have not given that word to many in a century." },
  },
  never_told = {
    { id = "n_dn1", text = "I fought in the War of the Ancients, and I was afraid every moment of it. Ten thousand years, and I have never said so aloud." },
    { id = "n_dn2", text = "Some nights I envy the Highborne their magic, and then I hate myself for it until dawn." },
  },
} end)

cityFondness("stormwind", "Stormwind City", -20, function() return {
  regard = {
    { id = "r_sw1", text = "I think you're the best of what Stormwind stands for, {name}, and I'd say so to the Highlord himself." },
    { id = "r_sw2", text = "You've been good to the folk of this city, and the city remembers. So do I." },
    { id = "r_sw3", text = "I think you're one of the few out there still fighting for the right reasons." },
  },
  confide = {
    { id = "c_sw1", text = "Stormwind's a big city, and big cities keep big secrets. I've picked up a few in my time." },
    { id = "c_sw2", text = "The nobles think common folk don't listen. We listen to everything, and we talk amongst ourselves." },
  },
  trust = {
    { id = "t_sw1", text = "Trust Highlord Bolvar; he's holding this kingdom together with both hands. As for the court, keep your purse close." },
    { id = "t_sw2", text = "Trust the Cathedral and the City Watch, mostly. Beyond that, ask yourself who's paying whom." },
  },
  watchout = {
    { id = "w_sw1", text = "Anyone who talks about the stonemasons with a grudge in their voice. The Defias were born in this city, remember." },
    { id = "w_sw2", text = "The canals at night, and the cellars under the Mage Quarter. Stormwind's rot starts underground, they say, and they're right." },
  },
  worries = {
    { id = "y_sw1", text = "The king's still missing, and nobody at court will say a word about it. A kingdom can't stay headless forever." },
    { id = "y_sw2", text = "Westfall, mostly. My cousin farms out there, and the Defias don't care whose fields they burn." },
  },
  hopes = {
    { id = "h_sw1", text = "That King Varian comes home, and that Stormwind is a kingdom to be proud of when he does." },
    { id = "h_sw2", text = "That the lad on the throne gets to be a boy a little while longer. He's carrying too much for his age." },
  },
  favor = {
    { id = "f_sw1", text = "Help the farmers out in Westfall when you can. Those people fed this city, and the city's forgotten them." },
    { id = "f_sw2", text = "Light a candle in the Cathedral for the ones we lost in the north. Lordaeron was our sister kingdom, whatever anyone says now." },
  },
  friendship = {
    { id = "fr_sw1", text = "A friend, and a true one. Stormwind's lucky to have you, and so am I." },
    { id = "fr_sw2", text = "Of course I do, {name}. You've stood by me, and I'll stand by you, and that's all there is to it." },
    { id = "fr_sw3", text = "Friend? Aye, and I'd say so out loud in the middle of Cathedral Square." },
  },
  never_told = {
    { id = "n_sw1", text = "I lost my brother in the Second War, and I've never once visited his grave. I tell folk it's too far, but I'm only afraid." },
    { id = "n_sw2", text = "I've never been past Goldshire. I talk as though I've seen the world, but this city's all I know." },
  },
} end)

local function senjin() return { subzone = { "Sen'jin Village", "Echo Isles", "Darkspear Strand" } } end
cityFondness("senjin", "Durotar", -35, function() return {
  regard = {
    { id = "r_sj1", when = senjin(), text = "You be good people, {name}, and de spirits like you, I can tell. Me too, mon." },
    { id = "r_sj2", when = senjin(), text = "Most folk look at a troll and see tusks. You look and see a friend, and dat be rare." },
    { id = "r_sj3", when = senjin(), text = "You got a good laugh and a steady hand, and dat be all a Darkspear wants in a friend." },
  },
  confide = {
    { id = "c_sj1", when = senjin(), text = "Sen'jin be small, but word travels fast between de huts, and I hear plenty of it." },
    { id = "c_sj2", when = senjin(), text = "De spirits whisper, and so do de fishermen. I listen to both, mon." },
  },
  trust = {
    { id = "t_sj1", when = senjin(), text = "Trust Vol'jin and his people. De Darkspear keep faith with Thrall, and with anybody who keeps faith with us." },
    { id = "t_sj2", when = senjin(), text = "Trust de witch doctors, mostly. Not Zalazane, he gone mad, but de rest still know de loa." },
  },
  watchout = {
    { id = "w_sj1", when = senjin(), text = "Watch de Echo Isles. Zalazane took dem with his voodoo, and he be making our own people into his slaves." },
    { id = "w_sj2", when = senjin(), text = "Watch de Kolkar and de Burning Blade out past de village. Dey be hungry, and dey don't care who you be." },
  },
  worries = {
    { id = "y_sj1", when = senjin(), text = "Dat Zalazane keeps taking our people one by one, until de Echo Isles be all hexed and empty." },
    { id = "y_sj2", when = senjin(), text = "Dat de Darkspear forget who we be, living in de Horde's shadow. We owe Thrall, but we be our own people too." },
  },
  hopes = {
    { id = "h_sj1", when = senjin(), text = "Dat we take back de Echo Isles and hang Zalazane's mask up where everybody can see it." },
    { id = "h_sj2", when = senjin(), text = "Dat my little ones grow up loud and laughing, and never know what it be like to run from a sea witch's storm." },
  },
  favor = {
    { id = "f_sj1", when = senjin(), text = "Free some of Zalazane's hexed ones if you pass de isles. It be a mercy, and de spirits will thank you for it." },
    { id = "f_sj2", when = senjin(), text = "Leave a little offering to de loa for my grandmother next time you pass a shrine. She'd like dat, ya." },
  },
  friendship = {
    { id = "fr_sj1", when = senjin(), text = "You be my friend, mon, and more. In my heart you be Darkspear." },
    { id = "fr_sj2", when = senjin(), text = "A friend? Ya, and dat be for always, because trolls don't forget." },
    { id = "fr_sj3", when = senjin(), text = "Friend, ya, and a good one. Stay away from my fishing spot, though, friend or not." },
  },
  never_told = {
    { id = "n_sj1", when = senjin(), text = "I been scared of de sea ever since de witch's storm, and I still be. A troll from de islands who hates boats, can you believe it?" },
    { id = "n_sj2", when = senjin(), text = "I almost followed Zalazane once, back before he went mad. He talked so pretty, and I wanted to believe him." },
  },
} end)
