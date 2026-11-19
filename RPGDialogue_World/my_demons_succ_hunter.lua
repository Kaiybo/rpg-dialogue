-- Your own demon (0.90.0): a warlock talks to the succubus, felhunter or enslaved demon at their side.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- The player is always a warlock here, and the demon is theirs: bound, named, and keeping count.
-- Lore: Classic only. The Twisting Nether, the Legion beaten at Hyjal, Mannoroth, Gul'dan and the
-- Shadow Council, the dreadlords and the Scourge; no Outland, no felguards, nothing later.

local SHARD = 6265
local HOUND = { "felhound", "felstalker", "felbeast" }
local DOOM = "doomguard"
local STONE = "infernal"
local MUTE = { "infernal", "felhound", "felstalker", "felbeast" }

---------------------------------------------------------------------------
-- Your succubus.
---------------------------------------------------------------------------
P:Pool {
  id = "my_succubus", role = "my_succubus", tier = "major",
  greetings = {
    { id = "g_default", text = "You called, master, and here I am, as I always am. What would you like from me this time?" },
    { id = "g_male", when = { gender = "male" }, text = "Master, you've that look again, the one you think you hide so well. Speak, then, I'm all yours, at least on paper." },
    { id = "g_female", when = { gender = "female" }, text = "Mistress, you want something, and you've come to me instead of the imp. How very flattering, and how very wise." },
    { id = "g_back", when = { timesTalked = { min = 5 } }, text = "Talking to me again, {name}? Careful, master, or people will say you've grown fond of me." },
    { id = "g_capital", when = { capital = true }, text = "All these people staring at me, master, and every one of them pretending not to. I do love a city." },
    { id = "g_ghost", when = { ghost = true }, text = "Dead again, master, and you've come back to me before your own body. I'm touched, truly I am." },
    { id = "g_dread", when = { aura = { 23161 } }, text = "Up on that great black horse from Xoroth, master, looking down at me. I'll allow it, because it suits you." },
  },
  notice = {
    { id = "n_shards_many", cat = "carry", when = { carrying = { id = SHARD, min = 20 } },
      text = "Twenty souls and more rattling in that bag of yours, master. Some of them were very pretty once, and I think one of them still wants to talk to me." },
    { id = "n_shards_none", cat = "carry", when = { ["not"] = { carrying = SHARD } },
      text = "Not a single shard in your bag, master. If I slipped away tonight, how exactly would you call me back?" },
    { id = "n_party_mage", cat = "party", when = { party = { class = "MAGE" } },
      text = "Your friend the mage keeps reaching for a sheep spell every time I smile at {companion}. Tell {companion} I only charm what you point me at." },
    { id = "n_party_paladin", cat = "party", when = { party = { class = "PALADIN" } },
      text = "That paladin of yours prays under his breath whenever I walk past, master. I've started walking past rather a lot." },
    { id = "n_party_priest", cat = "party", when = { party = { class = "PRIEST" } },
      text = "Your priest friend won't look at me, master, which is the surest sign someone wants to. I could fix that for you, if you like." },
    { id = "n_scholo", cat = "dungeon", when = { cleared = "Scholomance" },
      text = "You went down into Kel'Thuzad's school and came back up again, master. The necromancers there wanted your soul for their own, and I'll confess I was jealous." },
    { id = "n_felsteed", cat = "mount", when = { aura = { 5784 } },
      text = "You ride a felsteed and keep me walking behind it, master. The horse doesn't even talk, and still it gets carried nearer to you than I do." },
    { id = "n_deaths", cat = "status", when = { deaths = { min = 30 } },
      text = "You've died so many times now, master, that I've stopped counting and started keeping a tally of the ways. Drowning is still my favourite." },
    { id = "n_taint", cat = "status", when = { taint = { min = 40 } },
      text = "You're coming along beautifully, master. There's a little more of the Nether in your eyes every time I look, and I do look." },
    { id = "n_young", cat = "class", when = { maxLevel = 25 },
      text = "You've only just earned me, master, and you're still holding the leash in both hands. That's sweet, and it won't last." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "She stretches until her wings unfold, then folds them again, slowly, never taking her eyes off you.",
      lines = {
        { id = "h_default", text = "I'm yours, master, bound by your circle and your word and that little bit of your will you think I can't see. Ask me anything you like, and I'll tell you the truth, or something prettier." },
        { id = "h_male", when = { gender = "male" }, text = "You want to talk, master? Men usually want something else from me, but I'll humour you, since you're the one holding the whip." },
        { id = "h_female", when = { gender = "female" }, text = "Most women who look at me want to scratch my eyes out, mistress, and you want to hand me orders instead. I find that rather refreshing." },
        { id = "h_young", when = { maxLevel = 25 }, text = "You only drew my circle the other day, master, and already you want a heart-to-heart. Very well, ask, and I'll pretend I haven't been asked the same things by a dozen warlocks before you." },
        { id = "h_veteran", when = { minLevel = 50 }, text = "You've grown strong, master, strong enough to frighten the things I'm afraid of. That makes you very attractive company, so ask me whatever you like." },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "My cold little master, with nothing in your chest for me to tug at. Ask your questions, then, though I'll admit you're the hardest work I've ever had." },
        { id = "h_dark", when = { alignment = { axis = "light", max = -20 } }, text = "You've gone deeper into the dark since you first bound me, master, and you've gone gladly. I'm so very proud of you." },
      },
      again = {
        { id = "a_again", text = "Something else, master? I'm in no hurry, unless you are." },
        { id = "a_again2", text = "Go on, then. I do enjoy it when you talk to me like a person." },
        { id = "a_again3", when = { gender = "female" }, text = "More, mistress? You're very curious tonight, and I'm very patient." },
      },
      choices = {
        { text = "What do you really think of me?", next = "you" },
        { text = "What would you do if my binding slipped?", next = "bind" },
        { text = "Where do you go when I dismiss you?", next = "dismiss" },
        { text = "Tell me about the ones you've charmed for me.", next = "charm" },
        { text = "You don't get on with my other demons.", next = "others" },
        { text = "You keep eyeing my soul shards.", next = "shards", when = { carrying = SHARD } },
        { text = "You've watched me die more than once.", next = "deaths", when = { deaths = { min = 3 } } },
        { text = "What do you make of my people?", next = "people" },
        { text = "Tell me about the Legion.", next = "legion" },
        { text = "You keep hinting at a bargain.", next = "bargain", when = { metBefore = true } },
        { text = "That's all. Stay close.", next = "END" },
      },
    },

    -- What she thinks of you.
    you = {
      lines = {
        { id = "y_default", text = "I think you're clever, master, and lonely, and hungry for more than you'll admit to anyone. That's what all warlocks are, underneath the robes, and it's why you all end up talking to us." },
        { id = "y_male", when = { gender = "male" }, text = "I think you're a man who likes to be obeyed, master, and who secretly likes it even more when he isn't. Don't make that face; I'm only saying what you already know." },
        { id = "y_female", when = { gender = "female" }, text = "I think you're a woman who learned early that the world won't hand you anything, mistress, so you went and bound something that would. I admire that more than you'd believe." },
        { id = "y_taint", when = { taint = { min = 30 } }, text = "I think you're becoming one of us a little at a time, master, and that you've noticed and decided not to mind. It's the most attractive thing about you." },
      },
      choices = {
        { text = "And what do I want, since you know so well?", next = "you_want" },
        { text = "You're trying to flatter me.", next = "you_flatter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    you_flatter = {
      lines = {
        { id = "yf_default", text = "Of course I am, master, flattery is what I was made for, the way an imp was made for fire. The trick is that every word of it is true, and that's what makes it work so well." },
      },
      choices = {
        { text = "It doesn't work on me.", next = "BACK", reply = "No, of course it doesn't, master. That's why you came back to ask what I think of you.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    you_want = {
      lines = {
        { id = "yw_default", text = "Power, master, and not the borrowed sort you get from books, but the kind nobody can take away from you. You also want to be told you're not a monster for wanting it, and that, I give away for free." },
        { id = "yw_human", when = { race = "Human" }, text = "You want them to be sorry, master, all those people in Stormwind who whisper about the cellar under the Slaughtered Lamb. You want them to need you, and you want to watch them hate needing you." },
        { id = "yw_orc", when = { race = "Orc" }, text = "You want the strength your grandfathers had, master, without the chains your grandfathers wore. Your Warchief tells you that's impossible, and you've decided he's wrong." },
      },
      choices = {
        { text = "What happens when I have it?", next = "you_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    you_truth = {
      big = true,
      lines = {
        { id = "yt_default", text = "Then you'll want more, master, because there's always more, and I'll be right beside you when you reach for it. Every warlock reaches eventually, and I've never yet seen one stop at the edge." },
      },
      choices = {
        { text = "I'll stop when I choose. I'm not Gul'dan.", next = "BACK", reply = "Gul'dan said much the same, I'm told, right up until the end. I do hope you're the exception, master; I'd miss you.", fx = { align = { light = 1, order = 1 }, trait = { stern = 1 } } },
        { text = "Then I'll keep reaching, and you'll keep watching.", next = "BACK", reply = "Oh, master, that's the nicest thing you've ever said to me. I'll be watching every step.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The binding.
    bind = {
      lines = {
        { id = "b_default", text = "If it slipped? I'd thank you very prettily for the company, master, and then I'd decide what to do with you. I haven't decided yet, which you'll take as a compliment if you're wise." },
        { id = "b_young", when = { maxLevel = 30 }, text = "It's young, your binding, still a bit damp around the edges, master. I can feel every place where it's thin, and I'm far too polite to tell you where they are." },
        { id = "b_veteran", when = { minLevel = 50 }, text = "Your binding's a fine piece of work now, master, all iron and no gaps. That's terribly disappointing for me, so I hope you're pleased with yourself." },
      },
      choices = {
        { text = "Would you kill me?", next = "bind_kill" },
        { text = "You'd never get the chance.", next = "bind_chance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bind_chance = {
      lines = {
        { id = "bc_default", text = "That's the spirit, master, keep thinking it. The warlocks who stay alive are the ones who say that every morning, and the ones who stop saying it are the ones I meet in the Nether afterwards." },
      },
      choices = {
        { text = "Then we understand each other.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bind_kill = {
      narr = "She tilts her head and touches the tip of her whip to her lips, as if the question needs real thought.",
      lines = {
        { id = "bk_default", text = "Kill you? Not quickly, master, and perhaps not at all, because a free succubus is a lonely thing in your world and you're such good company. I might keep you instead, and you'd hardly notice the difference at first." },
      },
      choices = {
        { text = "Then I'll keep you on a short leash.", next = "bind_leash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bind_leash = {
      big = true,
      lines = {
        { id = "bl_default", text = "Short or long, master, a leash still has two ends, and I hold one of them too. The question every warlock has to answer is whether you rule us with fear or with fair dealing, and we remember either way." },
      },
      choices = {
        { text = "Fear, then. You'll serve because you dread the alternative.", next = "BACK", reply = "How very stern of you, master, and how very warlock. I'll be terrified, I promise, at least while you're watching.", fx = { align = { order = 1, honor = -1 }, trait = { stern = 1 } } },
        { text = "I keep my word to you, and you'll keep yours.", next = "BACK", reply = "A warlock who keeps bargains with a demon is a rare thing, master. I'll keep mine, to the letter, and you'll have to trust me on the spirit.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Dismissed and called again.
    dismiss = {
      lines = {
        { id = "d_default", text = "Back to the Nether, master, into the dark between worlds, where it's cold and loud and full of things that would like to eat me. Then you snap your fingers, and I'm torn out of it again, still blinking." },
        { id = "d_many", when = { timesTalked = { min = 8 } }, text = "Back into the Nether, as usual, master, though I've been dragged in and out so often now that I've started leaving things in your world. A hairpin here, a grudge there." },
      },
      choices = {
        { text = "Does it hurt, being called back?", next = "dismiss_hurt" },
        { text = "What about when I sacrifice you?", next = "dismiss_sacrifice", when = { minLevel = 20 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dismiss_hurt = {
      lines = {
        { id = "dh_default", text = "Every single time, master, like being pulled through a keyhole by the hair. You burn a soul shard to do it, so I suppose we both pay, but I'd say I pay a little more." },
        { id = "dh_fd", when = { minLevel = 30 }, text = "It hurts less when you use Fel Domination and simply yank me out without the ritual, though only a little. I know you do it when you're frightened, master, so I'm always rather pleased to come." },
      },
      choices = {
        { text = "I'll try to be gentler.", next = "BACK", reply = "Gentler? Master, you'll spoil me, and spoiled demons get ideas.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dismiss_sacrifice = {
      big = true,
      lines = {
        { id = "ds_default", text = "Demonic Sacrifice, you mean, when you burn me up for a little extra shadow in your spells. I feel every moment of it, master, and then I'm back in the Nether, waiting for you to need me again." },
        { id = "ds_link", when = { minLevel = 40 }, text = "You sacrifice me for strength, or you tie us together with Soul Link and make me take half your wounds. I'm never sure which I mind more, master, the burning or the sharing." },
      },
      choices = {
        { text = "You're a tool. Tools get used.", next = "BACK", reply = "So I am, master, and you hold me very well. Do remember that tools remember the hand, though.", fx = { align = { light = -1, order = 1 }, trait = { stern = 1 } } },
        { text = "I'll only do it when I've no other choice.", next = "BACK", reply = "How sweet, and how unlike a warlock. I'll pretend to believe you, master.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Seduction.
    charm = {
      lines = {
        { id = "c_default", text = "Oh, so many, master, guards and bandits and brutes with clubs, all of them melting the moment I crooked a finger. Seduction is the easiest work you give me, because everyone wants to be wanted." },
        { id = "c_human", when = { race = { "Human", "Gnome" } }, text = "Defias thugs, Scarlet zealots, ogres in the mountains, master, and every one of them forgot his axe the moment I smiled. The zealots were my favourites; they prayed so prettily while they stood there." },
        { id = "c_horde", when = { faction = "Horde" }, text = "Quilboar and centaur and those Scarlet fanatics up north, master, and every one of them stood still as a post while you burned him. The zealots went down on their knees for me, which I found terribly flattering." },
      },
      choices = {
        { text = "Do you prefer charming men or women?", next = "charm_who" },
        { text = "Your Soothing Kiss works on them too.", next = "charm_kiss" },
        { text = "What do you feel when you do it?", next = "charm_feel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charm_kiss = {
      lines = {
        { id = "ck_default", text = "A kiss to calm them, a Lash of Pain to wake them up again, and a little Lesser Invisibility when I'd rather not be seen, master. I have so many ways of making someone forget they were angry, and you've only seen half of them." },
        { id = "ck_funnel", when = { minLevel = 30 }, text = "It soothes them, master, just as your Health Funnel soothes me when you pour your own life into my wounds. I always know when you do that, because I can taste you for an hour afterwards." },
      },
      choices = {
        { text = "Use it on my enemies, not on me.", next = "BACK", reply = "Of course, master. I'd never kiss you without asking first.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charm_who = {
      lines = {
        { id = "cw_default", text = "Men are easier, master, because they think it's their own idea, but women are more fun, because they know exactly what I'm doing and fall for it anyway. Ogres are the hardest of all, because they can't decide which head to listen to." },
      },
      choices = {
        { text = "Have you ever tried it on me?", next = "charm_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charm_me = {
      lines = {
        { id = "cm_male", when = { gender = "male" }, text = "Every day, master, a little at a time, and you've never once noticed. Don't look so alarmed; if it had worked, you'd be far more relaxed about it." },
        { id = "cm_female", when = { gender = "female" }, text = "Once, mistress, the very first night, and you looked straight through me and gave me an order. I knew then we'd get along beautifully." },
        { id = "cm_forsaken", when = { race = "Scourge" }, text = "On you, master? There's no warm blood left in you to quicken, and no heart to race. It's like trying to seduce a gravestone, though I'll admit you're a well-dressed gravestone." },
      },
      choices = {
        { text = "Don't try it again.", next = "BACK", reply = "As you wish, master. I'll be very obedient about it, at least until you forget you asked.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charm_feel = {
      big = true,
      lines = {
        { id = "cf_default", text = "I feel what they want, master, all of it at once, like warm water rising. Then you burn them while they're still smiling at me, and I'll be honest, that's the part I like best." },
      },
      choices = {
        { text = "That's cruel, even for a demon.", next = "BACK", reply = "Is it, master? You're the one holding the flame.", fx = { align = { light = 1 } } },
        { text = "It's war. They'd do worse to us.", next = "BACK", reply = "That's the spirit, master. It's always war, and it's so much nicer when the enemy's smiling.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Your other demons.
    others = {
      lines = {
        { id = "o_default", text = "Your little menagerie? I put up with them, master, the way a queen puts up with the scullery. Which one would you like my opinion of, since I can see you're going to ask?" },
      },
      choices = {
        { text = "The imp.", next = "others_imp" },
        { text = "The voidwalker.", next = "others_void" },
        { text = "The felhunter.", next = "others_hunter", when = { minLevel = 30 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_imp = {
      lines = {
        { id = "oi_default", text = "Your imp is a foot and a half of spite and bad manners, master, and he's been telling the voidwalker I've got a fat tail. I don't, and when you're not looking, I intend to sit on him." },
      },
      choices = {
        { text = "Leave the imp alone.", next = "BACK", reply = "Of course, master. I'll only sit on him a little.", fx = { trait = { stern = 1 } } },
        { text = "He's been useful longer than you have.", next = "BACK", reply = "Useful? He throws fireballs the size of plums, master. I'll try very hard not to be jealous." },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_void = {
      lines = {
        { id = "ov_default", text = "Your voidwalker is loyal and patient and takes every blow meant for you, master, and it's the dullest creature I've ever met. I tried to charm it once, and it simply looked at me until I went away." },
      },
      choices = {
        { text = "It never talks back. I like that.", next = "BACK", reply = "Then summon it and talk to it all night, master. I'll wait here, being interesting.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_hunter = {
      lines = {
        { id = "oh_default", text = "That felhunter sniffs at me every time you swap us, master, as if it's deciding which bits of my binding would taste best. The Legion bred those things to hunt rogue warlocks, and I don't care to be hunted by anybody else's dog." },
      },
      choices = {
        { text = "It keeps the mages off me.", next = "BACK", reply = "So could I, master, if you'd only let me smile at them. I promise they'd stay off you." },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Soul shards.
    shards = {
      lines = {
        { id = "s_default", text = "Of course I do, master, they're the prettiest things you own. Every one of them is somebody you killed with Drain Soul, still a little warm, still trying to remember who it was." },
        { id = "s_many", when = { carrying = { id = SHARD, min = 20 } }, text = "You carry a whole choir of them now, master, and on quiet nights I can hear them humming in your bag. It's the most beautiful sound in your dreary world." },
      },
      choices = {
        { text = "What do you hear from them?", next = "shards_hear" },
        { text = "They're only reagents.", next = "shards_reagent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards_reagent = {
      lines = {
        { id = "sr_default", text = "Reagents, master, yes, the way bread is only flour. You burn them to call me, to make your Healthstones and Soulstones, to bring a friend to you with the Ritual of Summoning, and every time you do, someone goes out like a candle." },
      },
      choices = {
        { text = "Someone who'd tried to kill me first.", next = "BACK", reply = "Oh, always, master. They always started it.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards_hear = {
      big = true,
      lines = {
        { id = "sh_default", text = "Mostly they beg, master, and the older ones curse your name, and one of them has been singing the same verse of a Lordaeron drinking song for a week. I find it rather charming, and I think you'd find it hard to sleep if you could hear it." },
      },
      choices = {
        { text = "They were enemies. They earned the bag.", next = "BACK", reply = "Spoken like a true warlock, master. I'll tell the singing one you said so.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "When I'm done, I'll let them go.", next = "BACK", reply = "Let them go? Master, you'd have to stop using them first, and we both know you won't.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Your deaths.
    deaths = {
      lines = {
        { id = "de_default", text = "I have, master, and every time you fall the binding goes slack for a moment and I'm back in the Nether before your body's even cold. Then you come running back as a ghost, and I have to wait to be called all over again." },
        { id = "de_many", when = { deaths = { min = 25 } }, text = "More than once, master? I've watched you die so often I could paint it from memory. You're the only warlock I've known who treats dying as a sort of shortcut." },
      },
      choices = {
        { text = "My Soulstone brings me back.", next = "deaths_stone", when = { minLevel = 18 } },
        { text = "Do you mourn me?", next = "deaths_mourn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deaths_stone = {
      lines = {
        { id = "dst_default", text = "Your Soulstone, yes, master, that little shard you crack open so you can climb back up out of death in your own skin. It's a very clever trick, and every demon in the Nether wonders whose soul you're borrowing to do it." },
      },
      choices = {
        { text = "Do you mourn me when I die?", next = "deaths_mourn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deaths_mourn = {
      lines = {
        { id = "dm_default", text = "Mourn you? I'd be lying if I said no, master, and I'd be lying if I said yes, so I'll say this instead: if you ever stay dead, I'll be the first to know, and I'll be free. You'd want me to be honest about that." },
      },
      choices = {
        { text = "Then I'll make sure I don't stay dead.", next = "BACK", reply = "Do, master. I'd hate to have to find a new warlock; they're all so dreadfully earnest.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Your people.
    people = {
      lines = {
        { id = "pe_default", text = "Every race that ever reached for us looks the same in the end, master, a little desperate and a little proud. Your people are no different, though they do have their charms." },
        { id = "pe_human", when = { race = "Human" }, text = "Humans are my favourite people, master, so frightened of the dark and so curious about it. Your kingdom hides its warlocks in a cellar under a tavern, and every one of them goes down those steps because someone told them not to." },
        { id = "pe_gnome", when = { race = "Gnome" }, text = "A gnome warlock, master, wanting to take me apart and see how the binding works, I expect. You keep measuring things while I talk, and I've half a mind to let you." },
        { id = "pe_orc", when = { race = "Orc" }, text = "Orcs, master, the people who drank Mannoroth's blood and then had the nerve to be sorry about it. Your warlocks sit in the Cleft of Shadow under Orgrimmar and tell each other they're different from the Shadow Council, and I do love to listen." },
        { id = "pe_troll", when = { race = "Troll" }, text = "A troll who turned from the loa to the Nether, master, and your spirits haven't forgiven you for it. I can see them sulking at the edges of every circle you draw." },
        { id = "pe_forsaken", when = { race = "Scourge" }, text = "The Forsaken amuse me more than any people I've ever served, master, because there's nothing warm left in you to tempt. You want revenge and nothing else, and revenge is such a dull thing to dangle in front of someone." },
      },
      choices = {
        { text = "And what are we to the Legion?", next = "people_legion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    people_legion = {
      lines = {
        { id = "pl_default", text = "Kindling, master, and a few useful hands to hold the matches. The Legion has burned a hundred worlds full of people who were sure they were special." },
        { id = "pl_orc", when = { race = "Orc" }, text = "The finest weapon they ever owned, master, and the one that slipped out of their hand. They haven't forgotten, and some of them still think you'll come back to them." },
        { id = "pl_forsaken", when = { race = "Scourge" }, text = "You're the leftovers of a plague the dreadlords helped to brew, master, the Scourge's mistakes walking about on their own. The Legion doesn't think about you at all, which I suspect your Dark Lady is counting on." },
      },
      choices = {
        { text = "We'll prove them wrong.", next = "BACK", reply = "I'd like to see that, master, truly. It would make a lovely change.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Legion and the Nether.
    legion = {
      lines = {
        { id = "l_default", text = "The Legion is the fire behind every door you open, master, and I'm one of the sparks. I served it once, as everything in the Nether serves it sooner or later, until you came along with your chalk and your candles and took me for your own." },
      },
      choices = {
        { text = "What happened at Hyjal?", next = "legion_hyjal", fx = { learn = { "burning_legion" } } },
        { text = "What's the Nether like?", next = "legion_nether" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_nether = {
      lines = {
        { id = "ln_default", text = "Picture every bad dream you've ever had, master, all happening at once in the dark, and nobody waking up. Your world is the only warm room I've stood in for an age, which is why I don't complain about the company." },
      },
      choices = {
        { text = "Then you should be grateful.", next = "BACK", reply = "Oh, I am, master, every moment. Can't you tell?", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_hyjal = {
      lines = {
        { id = "lh_default", text = "Archimonde climbed the mountain to the World Tree, master, and the night elves and the orcs and the humans all threw themselves at him, and then the forest itself rose up and tore him apart. Every demon in the Nether felt him go, and some of us laughed." },
      },
      choices = {
        { text = "Will the Legion come back?", next = "legion_return" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_return = {
      big = true,
      narr = "She stops smiling for a moment, and her tail goes very still.",
      lines = {
        { id = "lr_default", text = "It always comes back, master, sooner or later, and when it does, it will want every warlock who ever learned its secrets. You'll have to decide then whether you're its servant or its enemy, and I'll be very interested to hear which." },
      },
      choices = {
        { text = "Its enemy. I use the Legion's power to fight it.", next = "BACK", reply = "Every warlock says that, master. A few of them even mean it.", fx = { align = { light = 1 } } },
        { text = "Whoever's winning. I'm not dying for anyone's cause.", next = "BACK", reply = "Now that, master, is the most honest thing a mortal has ever said to me.", fx = { affinity = 1, align = { light = -1, honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Her bargain.
    bargain = {
      narr = "She leans close enough that you can smell smoke and something sweet underneath it.",
      lines = {
        { id = "ba_default", text = "Only a little one, master, the same one I've been offering since the night you bound me. Let me take a little more of your will, just a thread, and I'll give you a little more of what I am in return." },
        { id = "ba_taint", when = { taint = { min = 20 } }, text = "You've already taken a few of my bargains, master, and look how well they suit you. There's always another, and this one is small." },
      },
      choices = {
        { text = "What would I get?", next = "bargain_terms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain_terms = {
      lines = {
        { id = "bt_default", text = "Sharper curses, master, and a deeper well of shadow to draw from, and a little less of that nagging voice that asks whether you should. You'd hardly notice the price, I promise you, and you'd never want it back." },
      },
      choices = {
        { text = "And what does it cost me?", next = "bargain_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain_price = {
      big = true,
      lines = {
        { id = "bp_default", text = "A thread of your soul, master, tied to mine, so you'll feel the Nether a little more and the Light a little less. That's all, and it's what you've been paying for since the day you opened your first grimoire anyway." },
        { id = "bp_dark", when = { alignment = { axis = "light", max = -20 } }, text = "A thread of your soul, master, the same price as always, and you've never once regretted paying it. Shall we tie another knot?" },
      },
      choices = {
        { text = "Done. Take the thread.", next = "BACK", reply = "Lovely, master. You won't feel a thing, and then you'll feel everything.", narr = "She touches two fingers to your chest, and something under your ribs goes cold and then warm.", fx = { taint = 2, affinity = 1, align = { light = -1 } } },
        { text = "A small taste, then, and no more.", next = "BACK", reply = "Just a taste, master. That's how it always begins, and I'll be here for the rest.", fx = { taint = 1, align = { order = -1 } } },
        { text = "No. I command you; I don't bargain with you.", next = "BACK", reply = "As you say, master. The offer will still be here tomorrow, and the day after that.", fx = { affinity = -1, align = { light = 1, order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "The Legion lost at Hyjal, master, and it has never once let a loss be the end of anything. Keep your circles tidy." } },
    scourge = { { id = "t_sc", text = "The Scourge is what happens when the dreadlords let a mortal hold the leash for them, master. Kel'Thuzad was a warlock of sorts once too, and look where he's sitting now." } },
    kelthuzad = { { id = "t_kt", text = "A clever man who sold his soul for the secret of death, master, and got exactly what he paid for. I'd have charged him less, and been much nicer company." } },
    background = { { id = "t_bg", text = "I was a temptress in the Nether long before your people had a word for one, master. The rest is mine to keep, unless you'd like to trade for it." } },
    advice = { { id = "t_ad", text = "Never tell a demon what you want most, master, because we'll give it to you, and you'll spend the rest of your life paying for it." } },
    _none = { { id = "t_none", text = "I haven't the faintest idea, master, but I'd love to watch you find out." } },
  },
}

P:Persuade { id = "my_succubus", role = "my_succubus",
  admire = {
    success = {
      { id = "s1", text = "Oh, master, you've been practising. I'll pretend I don't know exactly why you're being so sweet to me." },
      { id = "s2", when = { gender = "female" }, text = "A compliment from you, mistress? I'll keep it somewhere safe, next to all the ones I've given myself." },
    },
    fail = {
      { id = "f1", text = "Master, you're flattering a succubus. That's like trying to warm the sun with a candle." },
      { id = "f2", text = "Sweet words from the hand that holds my leash. You'll have to do better than that, master." },
    },
  },
  taunt = {
    success = {
      { id = "s1", text = "Oh, that stung, master, and I liked it. Say something cruel again, slowly this time." },
    },
    fail = {
      { id = "f1", text = "Mock me if it makes you feel taller, master. I'll be keeping a little list, as I always do." },
      { id = "f2", text = "Is that the best you've got? I've been insulted by dreadlords, master, and they were far better at it." },
    },
  },
  intimidate = {
    success = {
      { id = "s1", text = "Yes, master, of course, master. There's no need to tighten the binding; I'm listening." },
      { id = "s2", text = "All right, all right, you've made your point, and I felt every word of it. What do you want?" },
    },
    fail = {
      { id = "f1", text = "Threats, master? You need me far more than I need you, and we both know who'd miss whom." },
      { id = "f2", text = "Go on, then, dismiss me, and spend a soul shard to call me back in an hour when you're lonely." },
    },
  },
}

---------------------------------------------------------------------------
-- Your felhunter. It never speaks: every line is what it does.
---------------------------------------------------------------------------
P:Pool {
  id = "my_felhunter", role = "my_felhunter", tier = "quest",
  greetings = {
    { id = "g_default", text = "*{npc} pads to your side and presses its head against your hip, and its tendrils curl toward your hands, waiting.*" },
    { id = "g_mage", when = { party = { class = "MAGE" } }, text = "*{npc} is watching {companion} the mage and drooling, and it takes a sharp word from you before it looks your way.*" },
    { id = "g_ghost", when = { ghost = true }, text = "*{npc} sniffs at the empty air where you should be, whines once, and lies down to wait.*" },
    { id = "g_back", when = { timesTalked = { min = 5 } }, text = "*{npc} thumps its spiked tail against the ground the moment you turn toward it.*" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "*{npc} sits back on its haunches and looks up at you, its tendrils swaying gently, tasting the magic that hangs around you like smoke.*" },
        { id = "h_young", when = { maxLevel = 35 }, text = "*{npc} still flinches a little when you speak, as if it hasn't decided yet whether you're its master or its next meal, and then it sits.*" },
        { id = "h_veteran", when = { minLevel = 55 }, text = "*{npc} lowers its head to you without being told, and the tendrils on its back lie flat, the way a hound shows its belly to the pack's leader.*" },
        { id = "h_taint", when = { taint = { min = 40 } }, text = "*{npc}'s tendrils find you and stop, quivering, and it licks its jaws as if you smell a little more like the things it was bred to hunt.*" },
        { id = "h_capital", when = { capital = true }, text = "*{npc} is restless here, turning its head from one robed figure to the next, as if every spellcaster in the city were a meal it isn't allowed to eat.*" },
      },
      again = {
        { id = "a_again", text = "*{npc} is still watching you, tendrils raised.*" },
        { id = "a_again2", text = "*{npc} snaps at a passing moth, misses, and pretends it meant to.*" },
      },
      choices = {
        { text = "Scratch it behind the tendrils.", next = "pat" },
        { text = "Let it taste a little of your magic.", next = "feed" },
        { text = "Find something for me, {npc}. Track.", next = "track" },
        { text = "Heel, {npc}.", next = "command" },
        { text = "Why are you sniffing at my bag?", next = "shards", when = { carrying = 6265 } },
        { text = "Easy. {companion} is with us.", next = "mage", when = { party = { class = { "MAGE", "PRIEST", "SHAMAN", "DRUID" } } } },
        { text = "Enough. Stay close.", next = "END" },
      },
    },

    pat = {
      lines = {
        { id = "p_default", text = "*{npc}'s hide is hot and rough as a kiln brick, and it leans into your hand with a low, rattling growl that might be the felhunter's idea of purring.*" },
        { id = "p_forsaken", when = { race = "Scourge" }, text = "*{npc} leans into your cold hand and doesn't seem to mind at all; it only cares about the shadow in your fingers, and there's plenty of that.*" },
      },
      choices = {
        { text = "Good hound. You've earned it.", next = "pat_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pat_more = {
      lines = {
        { id = "pm_default", text = "*{npc} rolls onto its side, all claws and spines, and paws at the air until you scratch the spot where its tendrils join its skull, and then it goes completely limp.*" },
      },
      choices = {
        { text = "The Legion bred you to hunt warlocks, and here you are.", next = "pat_legion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pat_legion = {
      big = true,
      lines = {
        { id = "pl_default", text = "*At the word Legion, {npc} rolls back onto its feet, ears flat, and stares at you for a long moment, as if remembering the last warlock it was sent after, and then it lies down at your boots.*" },
      },
      choices = {
        { text = "You serve me now, by binding and by fear.", next = "BACK", reply = "*{npc} lowers its head until its jaw touches the dirt, and stays there until you look away.*", fx = { align = { order = 1, light = -1 }, trait = { stern = 1 } } },
        { text = "You're mine because you chose to stay, beast.", next = "BACK", reply = "*{npc} pushes its heavy head under your hand and holds it there, which is as close to an answer as you'll get.*", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    feed = {
      lines = {
        { id = "f_default", text = "*You let a thread of shadow curl off your fingertips, and {npc} snaps it out of the air, tendrils wrapped around it, and swallows it with a shudder of pure contentment.*" },
        { id = "f_cursed", when = { debuffType = "Curse" }, text = "*{npc} ignores the shadow you offer, because it can smell the curse someone laid on you, and it sniffs at your arm with keen interest.*" },
        { id = "f_magic", when = { debuffType = "Magic" }, text = "*{npc} can smell the hostile spell clinging to you, and its tendrils fasten onto your shoulder before you can stop it. With one wet pull, the spell is gone, and so is half your patience.*" },
      },
      choices = {
        { text = "Devour it. Take the magic off me.", next = "feed_devour" },
        { text = "Life Tap, and share the mana with it.", next = "feed_tap" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed_devour = {
      lines = {
        { id = "fd_default", text = "*{npc} presses its tendrils to your skin and draws, and something cold and foreign slides out of you, down its throat and away. It licks its chops and looks at you hopefully for more.*" },
      },
      choices = {
        { text = "Next time, it's the enemy priest's shield.", next = "BACK", reply = "*{npc}'s tail lashes once, eagerly, and it sniffs the air for priests.*", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed_tap = {
      lines = {
        { id = "ft_default", text = "*You cut a little of your own life loose into mana, and {npc} watches the spell work with the rapt attention of a hound watching a butcher, its tendrils trembling as the magic shifts.*" },
        { id = "ft_low", when = { maxLevel = 40 }, text = "*{npc} watches you Life Tap and whines low in its throat, as if it can smell how thin you've worn yourself.*" },
      },
      choices = {
        { text = "Don't look at me like that.", next = "BACK", reply = "*{npc} looks away, very slowly, and then looks straight back.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    track = {
      lines = {
        { id = "t_default", text = "*{npc} drops its head and swings its tendrils low over the ground, back and forth, and then it freezes, rigid and quivering, pointing at something you can't see.*" },
        { id = "t_scholo", when = { cleared = "Scholomance" }, text = "*{npc} casts about for a scent and turns, very deliberately, toward the north, where the necromancers' school sits in Caer Darrow, and growls.*" },
      },
      choices = {
        { text = "What is it? Show me.", next = "track_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_find = {
      lines = {
        { id = "tf_default", text = "*{npc} leads you a dozen paces and stops at a patch of earth that smells faintly of burnt sugar, the trace of a spell someone cast here not long ago. Its hackles are up.*" },
      },
      choices = {
        { text = "A mage, or another warlock?", next = "track_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_who = {
      lines = {
        { id = "tw_default", text = "*{npc} sneezes violently at the spot, then turns and buries its nose in your robes, as if to say that whoever it was smelled exactly like you, which is to say like the Nether.*" },
      },
      choices = {
        { text = "Another warlock. Mark the scent.", next = "BACK", reply = "*{npc} rumbles deep in its chest and fixes the scent with one last long sniff.*", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    command = {
      lines = {
        { id = "c_default", text = "*{npc} drops into place at your heel at once, its claws digging into the ground, and its tendrils swing forward toward whatever you point at, waiting for the word.*" },
      },
      choices = {
        { text = "Spell Lock the next caster who raises a hand.", next = "command_lock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    command_lock = {
      lines = {
        { id = "cl_default", text = "*{npc}'s tendrils snap upright, rigid as spears, and its jaws work as if it can already taste the spell it's going to bite in half.*" },
      },
      choices = {
        { text = "And if the caster's a friend, you leave him be.", next = "BACK", reply = "*{npc} grumbles, deep and unhappy, and then lowers its head in what might be agreement.*", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shards = {
      lines = {
        { id = "s_default", text = "*{npc} has its nose buried in the bag where you keep your soul shards, tendrils rattling against the stones, and it whines softly, the way a hound whines at a shut larder door.*" },
        { id = "s_many", when = { carrying = { id = 6265, min = 20 } }, text = "*{npc} circles your shard bag twice and lies down beside it, guarding it, or guarding itself from it; it's hard to tell which.*" },
      },
      choices = {
        { text = "Those are mine. Leave them.", next = "BACK", reply = "*{npc} backs off with a sulky huff, though one tendril stays curled hopefully toward the bag.*", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mage = {
      lines = {
        { id = "m_default", text = "*{npc} won't stop staring at {companion}. Every time a spell gathers in {companion}'s hands, its tendrils jerk toward it, and a thin line of drool hangs from its jaw.*" },
      },
      choices = {
        { text = "No. Not our own casters.", next = "BACK", reply = "*{npc} lets out a long, offended huff and turns its back on {companion}, tail lashing.*", fx = { trait = { stern = 1 } } },
        { text = "Let it have one sniff. Just one.", next = "BACK", reply = "*{npc} pads over to {companion}, takes one long sniff, and sneezes a spray of green sparks.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "t_none", text = "*{npc} tilts its head at you, tendrils curling, and then goes back to sniffing the ground.*" } } },
}

---------------------------------------------------------------------------
-- Anything else at your side: enslaved demons, the Inferno's infernal, a doomguard.
---------------------------------------------------------------------------
local TALKS = { ["not"] = { npcNamed = MUTE } }

P:Pool {
  id = "my_demon", role = "my_demon", tier = "quest",
  greetings = {
    { id = "g_default", text = "You've got your claws in me, warlock, and I can feel every one of them. What do you want, before they slip?" },
    { id = "g_doom", when = { npcNamed = DOOM }, text = "You called me through the gate with blood, mortal. Speak quickly, for I am counting the moments until your hold on me fails." },
    { id = "g_stone", when = { npcNamed = STONE }, text = "*The infernal stands where it fell, green fire running in the cracks of its stone, and it turns its burning head toward you with a grinding sound.*" },
    { id = "g_hound", when = { npcNamed = HOUND }, text = "*The enslaved fel beast strains against your will like a dog on a chain, its tendrils swinging toward your throat and then away.*" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I serve because your spell is wrapped around my mind, warlock, and not because I've any wish to. Enslave Demon is a short chain and a weak one, and we both know it." },
        { id = "h_doom", when = { npcNamed = DOOM }, text = "I was a captain of the Legion's hosts, and now a mortal has dragged me through the Ritual of Doom to fetch and fight. Do not mistake my obedience for anything but a binding that has not yet broken." },
        { id = "h_stone", when = { npcNamed = STONE }, text = "*The infernal stands motionless over the crater it made when it fell, and the heat coming off it makes the air shiver. It is waiting, and not patiently.*" },
        { id = "h_hound", when = { npcNamed = HOUND }, text = "*The fel beast pulls against the hold you have on it, sniffing at the magic you wrapped around its mind, trying to find the place where it frays.*" },
        { id = "h_high", when = { minLevel = 55, ["not"] = { npcNamed = MUTE } }, text = "You're stronger than most who've tried this on me, warlock, I'll grant you that. It won't save you if your concentration slips, but I'll grant you it." },
      },
      again = {
        { id = "a_again", when = TALKS, text = "More, warlock? Ask it, while you still have me." },
        { id = "a_stone", when = { npcNamed = MUTE }, text = "*It hasn't moved, but the ground beneath it is smoking.*" },
      },
      choices = {
        { text = "What are you?", next = "who", when = TALKS },
        { text = "What happens when my hold breaks?", next = "breaks", when = TALKS },
        { text = "You'll fight for me until I say otherwise.", next = "orders", when = TALKS },
        { text = "Who was sacrificed to bring you here?", next = "doom_price", when = { npcNamed = DOOM } },
        { text = "Put a hand near the infernal's stone.", next = "stone_touch", when = { npcNamed = STONE } },
        { text = "Hold its gaze.", next = "stone_gaze", when = { npcNamed = MUTE } },
        { text = "Enough. Stay where I put you.", next = "END" },
      },
    },

    who = {
      lines = {
        { id = "w_default", text = "Something you found in the wild, warlock, and decided to borrow. I have a name, and a master who isn't you, and a long memory, and you'll never hear the first of those." },
        { id = "w_doom", when = { npcNamed = DOOM }, text = "I am the Legion's hammer, mortal, the thing that walks in front of the armies and breaks the walls. My kind fought on Hyjal, and if Archimonde had only listened, your little world would be ash." },
        { id = "w_satyr", when = { npcNamed = "satyr" }, text = "I was Highborne once, warlock, before Xavius gave us hooves and horns, and I bowed to a queen. Now I bow to you, and I'm told that's what passes for a fall these days." },
      },
      choices = {
        { text = "And who is your master, if not me?", next = "who_master" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_master = {
      lines = {
        { id = "wm_default", text = "Whoever held me before you stole me, warlock, a Burning Blade cultist or a Shadow Council fool or the Legion itself. They'll want me back, and they'll have your name by morning." },
        { id = "wm_doom", when = { npcNamed = DOOM }, text = "The Legion, mortal, and the Legion is very patient, and it remembers every warlock who has ever dragged one of its captains through a circle. I will remember you too." },
      },
      choices = {
        { text = "Let them come.", next = "BACK", reply = "They will, warlock, and I'll be standing behind them when they do.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    breaks = {
      lines = {
        { id = "b_default", text = "Then I'm free, warlock, and the first thing I do with my freedom is turn around. Your spell can snap any moment it likes, and I'll feel it go before you do." },
        { id = "b_doom", when = { npcNamed = DOOM }, text = "Then I am free in your world, mortal, and I will kill you and everyone who stood in that circle, and then I will go looking for more. Your hold on me is a single thread, and I can hear it fraying." },
      },
      choices = {
        { text = "Then I'll enslave you again before it does.", next = "breaks_again" },
        { text = "Something else.", next = "BACK" },
      },
    },
    breaks_again = {
      big = true,
      lines = {
        { id = "ba_default", text = "And again, and again, every few minutes, while I wait for the one cast that fails. That's the whole of Enslave Demon, warlock, and it's why the clever ones never keep one of us long." },
      },
      choices = {
        { text = "I'll keep you as long as you're useful.", next = "BACK", reply = "Spoken like a true slaver, warlock. I'll be useful right up until I'm not.", fx = { align = { honor = -1, order = 1 }, trait = { stern = 1 } } },
        { text = "When I'm done, I'll banish you cleanly.", next = "BACK", reply = "Banishment, warlock? That's almost mercy. I'll pretend I didn't hear you say it.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    orders = {
      lines = {
        { id = "o_default", text = "I'll fight, warlock, because your spell makes my limbs move and I can't stop them. Don't expect me to fight well, and don't ever stand in front of me." },
        { id = "o_doom", when = { npcNamed = DOOM }, text = "I will crush whatever you point at, mortal, because I enjoy it and because I must. When I am finished, do not ask me for anything else." },
      },
      choices = {
        { text = "You'll fight well, or I'll Drain your soul myself.", next = "BACK", reply = "Then I'll fight, warlock. And I'll remember the threat.", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    doom_price = {
      big = true,
      lines = {
        { id = "dp_default", text = "One of those who held your circle, mortal, chosen by the ritual and torn apart to open the gate. I tasted their soul on the way through, and it was the sweetest thing in this world." },
      },
      choices = {
        { text = "It was a price worth paying.", next = "BACK", reply = "Of course it was, mortal. It always is, when someone else pays it.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "A price I won't ask again lightly.", next = "BACK", reply = "You will, mortal. They always do.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stone_touch = {
      lines = {
        { id = "st_default", text = "*The heat hits your palm long before you get near, and the infernal turns its great cracked head and stares at your hand as if trying to decide whether to break it off.*" },
      },
      choices = {
        { text = "Pull your hand back slowly.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Leave it there. Show it who holds the spell.", next = "stone_hold" },
      },
    },
    stone_hold = {
      lines = {
        { id = "sh_default", text = "*For a long moment the infernal doesn't move, and then the fire in its cracks dims a little, sullenly, and it turns its head away from you. The spell holds, for now.*" },
      },
      choices = { { text = "Good. Now be still.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    stone_gaze = {
      lines = {
        { id = "sg_default", text = "*You meet the demon's eyes, and behind your Enslave Demon you can feel it pushing, steady and patient, the way water pushes against a dam.*" },
        { id = "sg_stone", when = { npcNamed = STONE }, text = "*The infernal's eyes are two holes full of green fire, and the longer you look, the more you can feel it straining against the Inferno that brought it down, waiting for the hold to lapse.*" },
      },
      choices = {
        { text = "Look away first.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Don't blink.", next = "BACK", reply = "*At last it lowers its gaze, slowly and resentfully, and the heat coming off it eases a little.*", fx = { trait = { stern = 1 } } },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", when = { npcNamed = DOOM }, text = "The Legion lost one battle on Hyjal, mortal. It has won a thousand others, and it will win here too." } },
    _none = {
      { id = "t_none", text = "I don't know, warlock, and I wouldn't tell you if I did. Ask the next demon you enslave." },
      { id = "t_none_mute", when = { npcNamed = MUTE }, text = "*It doesn't move, and nothing in its burning eyes suggests it understood a word.*" },
    },
  },
}
