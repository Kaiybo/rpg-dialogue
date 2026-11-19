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
  },
} }

P:Pool { id = "grudges_guard", role = "guard", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "My problem is that I've got my eye on you, and I don't like what I see." },
    { id = "g_town", when = { grudge = "town" }, text = "Half the complaints I hear this week have your name in them. That's my problem." },
  },
  amends = {
    { id = "a1", text = "Keep the peace, keep your blade sheathed, and keep out of my way. Do that long enough and we'll be square." },
  },
  spite = {
    { id = "s1", text = "I think you're one wrong step from a cell, and I'd like to be the one who turns the key." },
  },
} }

P:Pool { id = "grudges_innkeeper", role = "innkeeper", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "You've been trouble under my roof, and I can't afford trouble. That's all there is to it." },
  },
  amends = {
    { id = "a1", text = "Pay what you owe, drink quietly, and don't start anything in my common room. That's how." },
  },
  spite = {
    { id = "s1", text = "I think I'd sooner rent your bed to a kobold. At least it'd only steal the candles." },
  },
} }

-- A fresh copy per role: each pool indexes its own lines.
local function tradeGrudges() return {
  grievance = {
    { id = "g1", text = "Your coin's as good as anyone's, so I'll take it. That doesn't mean I have to like you." },
  },
  amends = {
    { id = "a1", text = "Be a good customer for a while. Polite, quick and no haggling over every copper." },
  },
  spite = {
    { id = "s1", text = "I think I'd charge you double if the guild would let me, and I'd sleep soundly after." },
  },
} end
for _, role in ipairs({ "vendor", "blacksmith", "auctioneer", "banker" }) do
  P:Pool { id = "grudges_" .. role, role = role, askOnly = true, topics = tradeGrudges() }
end

P:Pool { id = "grudges_trainer", role = "trainer", askOnly = true, topics = {
  grievance = {
    { id = "g1", text = "I teach because it's my duty, not because I enjoy your company. Don't mistake the one for the other." },
  },
  amends = {
    { id = "a1", text = "Show me you deserve what I teach you. Use it well, and use it for the right reasons." },
  },
  spite = {
    { id = "s1", text = "I think teaching you was a mistake, and I'll be answering for it long after you're gone." },
  },
} }
