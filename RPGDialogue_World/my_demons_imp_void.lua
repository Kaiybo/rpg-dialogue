-- Your own demon (0.90.0): a warlock talks to the imp or voidwalker at their side.
local P = RPGDialogueAPI:Pack("rpgd.world")

local SHARD = 6265
local FELSTEED, DREADSTEED = 5784, 23161

---------------------------------------------------------------------------
-- Your imp: spiteful, chatty, underappreciated, and very fond of fire.
---------------------------------------------------------------------------
P:Pool {
  id = "my_imp", role = "my_imp", tier = "major",
  greetings = {
    { id = "g_default", text = "You called? Of course you called, {g:master|mistress}, you always call when something needs setting on fire and nobody else wants the job." },
    { id = "g_first", when = { maxLevel = 5, metBefore = false }, text = "So you're the one who dragged me out of the Nether. You're smaller than I expected, though I suppose I'm hardly one to talk." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. I was rather hoping you'd learned to talk to yourself by now." },
    { id = "g_often", when = { timesTalked = { min = 10 } }, text = "We've had more little chats than I've had hot dinners, {name}, and I eat a great many hot dinners, mostly yours." },
    { id = "g_while", when = { daysSince = { min = 7 } }, text = "Well, look who remembered I can talk. It's been days, {g:master|mistress}, and I've been stewing in the Nether the whole time with nobody to complain to." },
    { id = "g_deaths", when = { deaths = { min = 20 } }, text = "Still breathing? Good, because I'm sick of watching you fall over and then waiting about while you go and fetch yourself back." },
    { id = "g_vet", when = { minLevel = 50 }, text = "Look at you, all grown up and terrible. I like to think I had something to do with it, so you're welcome." },
    { id = "g_taint", when = { taint = { min = 50 } }, text = "You smell more like home every day, {g:master|mistress}, and I mean that as a compliment, mostly." },
  },
  notice = {
    { id = "n_shards", cat = "carry", when = { carrying = { id = SHARD, min = 20 } },
      text = "That bag of yours is fairly humming with souls, and every one of them is whispering at me. Do you never empty it out?" },
    { id = "n_felsteed", cat = "mount", when = { aura = { FELSTEED } },
      text = "You've got that felsteed out again. It gets to run about on fire all day and nobody ever calls it a nuisance, which I find very unfair." },
    { id = "n_dread", cat = "mount", when = { aura = { DREADSTEED } },
      text = "A dreadsteed, and a proper one too! You're riding a nightmare out of the Nether like a real warlock lord now, so please don't let it eat me." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You're barely taller than I am, and I'll have you know that makes taking orders from you very confusing." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "There's still a bit of Mannoroth in your blood, {g:master|mistress}, I can smell it from here. Don't fret, it suits you." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You're so cold. Everyone else I've served had a bit of warmth in them, and you've none at all, so I've had to bring my own." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "You've still got those little bones and feathers tied in your hair. I hope they're not meant to keep me away, because they're not working." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Every time we pass a Stormwind guard, you stand up a bit straighter and pretend I'm a very ugly dog. I've noticed, and I'm hurt." },
    { id = "n_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "There's a lovely green tinge to you these days, {g:master|mistress}. The priests must hate it, and I love it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "What is it now, {g:master|mistress}? I'm right here where I always am, throwing all the fire while you stand at the back muttering curses at people." },
        { id = "h_young", when = { maxLevel = 9 }, text = "You've only just learned to call me, haven't you? You keep looking at your hands as though you can't believe they did it, and frankly, neither can I." },
        { id = "h_mid", when = { minLevel = 20, maxLevel = 39 }, text = "You've got a voidwalker now, and a succubus, and I'm still the one you talk to. I'm not saying that makes me your favourite, but I'm not saying it doesn't, either." },
        { id = "h_vet", when = { minLevel = 40 }, text = "Look at us, from a wobbly circle of chalk all the way to this. You've got bigger and nastier things to call on now, but you still call me, so I'll assume it's for the conversation." },
        { id = "h_capital", when = { capital = true }, text = "Must we stand about in the city like this? Everybody stares at me as if I'm about to burn something down, and I've only done that twice, and one of those was your fault." },
        { id = "h_dark", when = { alignment = { axis = "light", max = -20 } }, text = "You've gone very dark lately, {g:master|mistress}, and I have to say it suits you. The others back in the Nether would be jealous, if they weren't so busy being jealous of each other." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "It's dark out, which is lovely, because my fire looks twice as good at night. Hold still and admire it, I'm doing it for you." },
      },
      again = {
        { id = "a_1", text = "Anything else? I've got all day, sadly, since you never dismiss me when I actually want you to." },
        { id = "a_2", text = "Still talking? Fine, it beats standing about waiting for something to set alight." },
        { id = "a_taint", when = { taint = { min = 40 } }, text = "Go on, ask me more. You sound more like one of us every time you open your mouth." },
      },
      choices = {
        { text = "What do you really think of me?", next = "master" },
        { text = "Where do you go when I dismiss you?", next = "dismiss" },
        { text = "You were the very first thing I ever summoned.", next = "first" },
        { text = "You and the voidwalker don't get along, do you?", next = "others", when = { minLevel = 10 } },
        { text = "What's actually inside these soul shards?", next = "shards", when = { carrying = { id = SHARD, min = 1 } } },
        { text = "Would you leave me, if the binding broke?", next = "binding" },
        { text = "I keep dying out here.", next = "deaths", when = { deaths = { min = 5 } } },
        { text = "My grandfathers drank Mannoroth's blood.", next = "xorc", when = { race = "Orc" } },
        { text = "I learned this craft in the Slaughtered Lamb's cellar.", next = "xhuman", when = { race = "Human" } },
        { text = "Gnomes make very good warlocks, you know.", next = "xgnome", when = { race = "Gnome" } },
        { text = "The loa don't care much for you, imp.", next = "xtroll", when = { race = "Troll" } },
        { text = "I've died once already. Nothing you do frightens me.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "Back to work, imp.", next = "END" },
      },
    },

    -- What it thinks of you.
    master = {
      lines = {
        { id = "m_default", text = "You want the truth? You're bossy and ungrateful and you never once say please, but you're mine, and that's something, I suppose." },
        { id = "m_young", when = { maxLevel = 9 }, text = "I think you're green as grass and twice as easy to set alight. Still, you drew the circle and you held it, which is more than most apprentices manage." },
        { id = "m_vet", when = { minLevel = 40 }, text = "I think you've become rather frightening, if you want to know. The things in the Nether have started saying your name, and they don't say it nicely." },
      },
      choices = {
        { text = "Tell me honestly, am I a good master?", next = "master_honest" },
        { text = "What's your true name, imp?", next = "name" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    master_honest = {
      big = true,
      narr = "The imp folds his arms and taps one clawed foot, and a few sparks drop from his heel.",
      lines = {
        { id = "mh_default", text = "Honestly? You shout, you never say thank you, and you send me in first against things three times my size. On the other hand, you haven't fed me to anything yet, which puts you well ahead of most warlocks I've heard of." },
        { id = "mh_dark", when = { alignment = { axis = "light", max = -20 } }, text = "Good isn't the word, {g:master|mistress}, but you're a strong one, and I'd rather serve strong than good. The good ones always get their imps killed doing something noble." },
      },
      choices = {
        { text = "You're a tool, imp. Tools don't need thanks.", next = "BACK", reply = "Charming. I'll remember that the next time you're on fire and I'm holding the Fire Shield.", fx = { align = { order = 1, honor = -1 }, trait = { stern = 1 } } },
        { text = "You've earned some thanks. Thank you, {npc}.", next = "BACK", reply = "Oh. Well. Nobody's ever said that to me before, and I don't know what to do with my hands now.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Never mind that.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "n_default", text = "My true name? Ha! You get the one you gave me, {npc}, and it's a perfectly good name for an imp, so be grateful. The real one stays with me, because a name is a leash, and you've already got one of those." },
      },
      choices = {
        { text = "I could compel it from you, if I wanted.", next = "name_compel" },
        { text = "Keep your secret, then.", next = "BACK", reply = "I will, thank you very much. A demon needs something of its own, even if it's only a word.", fx = { affinity = 1 } },
      },
    },
    name_compel = {
      big = true,
      lines = {
        { id = "nc_default", text = "You could try, and maybe you'd even manage it, but then you'd have an imp who did everything you said and not one thing more. You'd miss my little suggestions, {g:master|mistress}, the way people miss a sore tooth." },
      },
      choices = {
        { text = "One day I'll have it, and you'll obey me completely.", next = "BACK", reply = "That's what Gul'dan said to his demons, more or less, and look how well that turned out for him.", fx = { align = { order = 1, light = -1 }, trait = { stern = 1 } } },
        { text = "A name freely kept is yours. I won't take it.", next = "BACK", reply = "Hm. You're a strange sort of warlock, and I don't entirely hate it.", fx = { affinity = 1, align = { order = -1, light = 1 } } },
        { text = "Enough about names.", next = "BACK" },
      },
    },

    -- Dismissal, Phase Shift and the Nether.
    dismiss = {
      lines = {
        { id = "d_default", text = "Back to the Nether, where it's cold and dark and something enormous is always looking at me. You snap your fingers and I'm gone, mid-sentence usually, and then you snap them again and expect me back smiling." },
        { id = "d_mounted", when = { mounted = true }, text = "Every time you climb onto that horse, off I go, back into the dark like an old coat you've taken off. Do you know how insulting that is?" },
      },
      choices = {
        { text = "What's it like there, in the Nether?", next = "dismiss_nether" },
        { text = "And when you Phase Shift? Where are you then?", next = "dismiss_phase", when = { minLevel = 12 } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    dismiss_phase = {
      lines = {
        { id = "dp_default", text = "Halfway, if you must know, just a little bit out of step with everything else. I can see you all fighting, but nobody can touch me and I can't touch them, so I mostly stand there feeling left out." },
      },
      choices = {
        { text = "So that's why you sulk when I tell you to stay out of it.", next = "BACK", reply = "I don't sulk, I brood, and there's a big difference, which you'd know if you had any taste.", fx = { trait = { witty = 1 } } },
        { text = "Never mind.", next = "BACK" },
      },
    },
    dismiss_nether = {
      narr = "The imp hunches his shoulders, and the flame on his head gutters low for a moment.",
      lines = {
        { id = "dn_default", text = "It's the Twisting Nether, the great dark between all the worlds, and it's full of things bigger than me that would eat me for a snack. When you dismiss me I just sort of hang there in it, very quietly, and hope none of them notice." },
      },
      choices = {
        { text = "Do you miss the Burning Legion?", next = "legion", fx = { learn = { "burning_legion" } } },
        { text = "I'll try to dismiss you less often.", next = "BACK", reply = "You won't, but it's nice of you to say so, and I'll pretend I believe you.", fx = { affinity = 1 } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    legion = {
      lines = {
        { id = "l_default", text = "Miss it? The Legion never knew my name, and the big ones step on imps without even looking down. Archimonde fell at Hyjal and I'll tell you, nobody I know cried about it." },
        { id = "l_orc", when = { race = "Orc" }, text = "Miss it? The Legion owned your whole people once, {g:master|mistress}, and it didn't treat them any better than it treated imps. Archimonde fell at Hyjal, and I can't say I was sorry." },
      },
      choices = {
        { text = "Will the Legion come back?", next = "legion_return" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_return = {
      big = true,
      lines = {
        { id = "lr_default", text = "Oh, it always comes back, that's the whole trouble with it. Mannoroth fell and Archimonde fell, but there's always somebody bigger waiting out in the dark, and when they come, I'd very much like to know whose side you're on." },
      },
      choices = {
        { text = "If it comes, I'll fight it with everything I've got.", next = "BACK", reply = "Then I'll be right there throwing fire at it, from behind you, where it's safe.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "If it comes, I'll strike my own bargain with it.", next = "BACK", reply = "Ooh. Now that's the kind of talk that gets warlocks either crowned or eaten, and I'd love to see which.", fx = { align = { light = -1 }, taint = 2 } },
        { text = "Let's not talk about the Legion.", next = "BACK" },
      },
    },

    -- The first summoning.
    first = {
      narr = "The imp puffs out his little chest and looks very pleased with himself.",
      lines = {
        { id = "f_default", text = "Oh, I remember it well. You drew the circle crooked and you got half the words wrong, and I came through anyway, because I wanted to see what sort of fool would try it." },
        { id = "f_young", when = { maxLevel = 9 }, text = "That was hardly any time ago, and you still hold your hands as though you're carrying hot coals. Don't worry, it gets easier, or at least you stop noticing the burns." },
        { id = "f_vet", when = { minLevel = 40 }, text = "That was a long time ago, and look at you now, calling up things I wouldn't want to meet in a dark corner of the Nether. Still, I was first, and nobody can take that away from me." },
      },
      choices = {
        { text = "Why did you come, if the circle was wrong?", next = "first_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_why = {
      lines = {
        { id = "fw_default", text = "Because every apprentice warlock's first demon is an imp, so we get called by everybody, and you learn to tell the interesting ones early. That makes imps the ones who know the most about you lot, though nobody ever thinks to ask us." },
      },
      choices = {
        { text = "Then tell me. What do you know about warlocks?", next = "first_warlocks" },
        { text = "Never mind.", next = "BACK" },
      },
    },
    first_warlocks = {
      big = true,
      lines = {
        { id = "fwl_default", text = "They all start out careful, checking every line of chalk twice, and then the power starts to taste good and they get hungry. The ones who last are the ones who stay a little bit afraid of us, and the rest end up as a story the trainers tell." },
        { id = "fwl_taint", when = { taint = { min = 40 } }, text = "They start out careful and then they get hungry, and you, {g:master|mistress}, are very hungry. I'm not complaining, but I've seen how that ends, and it's usually with an imp looking for a new master." },
      },
      choices = {
        { text = "I'll never stop being careful with what I call.", next = "BACK", reply = "Good, because that's the only advice I'll ever give you for free.", fx = { align = { order = 1, light = 1 }, trait = { cautious = 1 } } },
        { text = "Fear is for the weak. I want more power.", next = "BACK", reply = "Well, I did warn you, and you did hear me, so whatever happens next, it isn't my fault.", fx = { align = { order = -1, light = -1 }, taint = 1 } },
        { text = "That's enough about warlocks.", next = "BACK" },
      },
    },

    -- The other demons.
    others = {
      lines = {
        { id = "o_default", text = "The big sulky shadow? He's slow, he groans, he never says anything interesting, and you love him because he stands in front of you and gets hit. I could get hit too, if anybody asked, but nobody ever does." },
        { id = "o_low", when = { maxLevel = 19 }, text = "That great sulking shadow you went and got yourself? He's slow and he groans, and you only like him because he takes the hits. I'd take hits too, if I were taller." },
      },
      choices = {
        { text = "You sound jealous.", next = "others_jealous" },
        { text = "And what about the succubus?", next = "others_succ", when = { minLevel = 20 } },
        { text = "And the felhunter?", next = "others_hunter", when = { minLevel = 30 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_jealous = {
      big = true,
      lines = {
        { id = "oj_default", text = "Jealous of a walking hole in the air? Please. I was here first, I've got a personality, and I can hold a conversation, which is three more things than he's got." },
      },
      choices = {
        { text = "You were my first, imp, and that counts for something.", next = "BACK", reply = "It does, doesn't it? Write that down somewhere, so you don't forget it the next time he's out.", fx = { affinity = 2 } },
        { text = "He's more useful than you, and you know it.", next = "BACK", reply = "Then go and talk to him, see how far that gets you. Enjoy the groaning.", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    others_succ = {
      lines = {
        { id = "os_default", text = "Her? She thinks she's the cleverest thing in the Nether, and she's wrong, because that's me. She calls me 'little one', and one of these days I'm going to set that whip of hers on fire." },
      },
      choices = {
        { text = "She'd say much the same about you.", next = "BACK", reply = "She'd say it while smiling, too, which is worse. Don't you dare take her side.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_hunter = {
      lines = {
        { id = "oh_default", text = "That felhunter keeps sniffing at me as if I'm a snack, and I don't care for it. It eats magic, {g:master|mistress}, and I'm made of magic, so you can see why I keep my distance." },
      },
      choices = {
        { text = "I'll keep it on a short leash.", next = "BACK", reply = "Shorter than mine, I hope. I've got a lot less of me to lose.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Soul shards.
    shards = {
      lines = {
        { id = "s_default", text = "Souls, little ones, pulled out of whatever you were killing just as it died. You squeeze them into those purple stones, and then they rattle about in your bag whispering, and you sleep right next to them." },
        { id = "s_many", when = { carrying = { id = SHARD, min = 20 } }, text = "You've got a whole bagful in there, and they never stop whispering. Some nights I can hear them from the Nether, and that's a very long way away." },
        { id = "s_scarlet", when = { killed = { name = "Scarlet", min = 100 } }, text = "Half of those are Scarlet Crusaders, you know, and they're still praying in there. I've never heard anything so tiresome in all my life." },
      },
      choices = {
        { text = "What happens to a soul when I spend it?", next = "shards_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards_use = {
      narr = "The imp's eyes slide toward your bag, then quickly away again.",
      lines = {
        { id = "su_default", text = "It burns up, and whatever you made with it gets the use of it, a healthstone or a door for a demon or whatever you fancy. You don't even spend one to call me, which tells you exactly what I'm worth to you." },
      },
      choices = {
        { text = "Do you think it's wrong, what I do with them?", next = "shards_stance" },
        { text = "Never mind.", next = "BACK" },
      },
    },
    shards_stance = {
      big = true,
      lines = {
        { id = "ss_default", text = "Wrong? I'm a demon, I don't do wrong, I just watch you do it. I'll say this, though: the warlocks who stop counting their souls are the ones who end up being counted themselves." },
      },
      choices = {
        { text = "I take only what I must, and no more.", next = "BACK", reply = "How restrained of you. The priests would still hang you, but they'd feel bad about it afterwards.", fx = { align = { light = 1 } } },
        { text = "Every soul is fuel. I'll take all I can get.", next = "BACK", reply = "Now you're talking like a proper warlock. Just don't come crying to me when they start whispering your name back.", fx = { align = { light = -1 }, taint = 1 } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    -- The binding.
    binding = {
      lines = {
        { id = "b_default", text = "If the binding snapped right now? I'd run off and set a farm alight, and then a barn, and possibly a farmer. And then, if I'm honest, I'd probably come back, because where else would I go?" },
      },
      choices = {
        { text = "You'd really come back?", next = "binding_back" },
        { text = "What if I sacrificed you for power?", next = "binding_sacrifice", when = { minLevel = 30 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_back = {
      big = true,
      lines = {
        { id = "bb_default", text = "The Nether's full of bigger things, and out here there's only you and the occasional murloc. You shout and you send me in first, but you also call me back after, and in the Nether nobody ever calls you back." },
      },
      choices = {
        { text = "Then you're no prisoner. You're with me by choice.", next = "BACK", reply = "Don't get sentimental, it doesn't suit either of us. But yes, I suppose so.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Choice doesn't matter. The binding holds you, and that's all.", next = "BACK", reply = "Right, of course, the binding. Forget I said anything, I was only making conversation.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Never mind.", next = "BACK" },
      },
    },
    binding_sacrifice = {
      big = true,
      narr = "The imp's flame flares up bright and hot, and he takes a step back from you.",
      lines = {
        { id = "bs_default", text = "Oh, I know all about Demonic Sacrifice, thank you very much. You'd burn me up to make your own fire a little hotter, and I'd go back to the Nether in a puff of smoke without so much as a goodbye." },
      },
      choices = {
        { text = "If it makes me stronger, I'd do it.", next = "BACK", reply = "Of course you would. I'll just stand over here, then, being useful in other ways.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I'd never throw you away for a bit of fire.", next = "BACK", reply = "You say that now, but I'll hold you to it, {g:master|mistress}. Imps have long memories for promises.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's drop it.", next = "BACK" },
      },
    },

    -- Your deaths.
    deaths = {
      lines = {
        { id = "de_default", text = "I've noticed, believe me, because every time you die I get yanked straight back into the Nether with no warning at all. One moment I'm throwing Firebolts and the next I'm floating in the dark wondering what went wrong." },
        { id = "de_many", when = { deaths = { min = 50 } }, text = "You die so often that the things in the Nether have started recognising me when I come back early. They laugh, {g:master|mistress}, and it's very embarrassing for both of us." },
      },
      choices = {
        { text = "Why don't you stop it happening, then?", next = "deaths_blame" },
        { text = "I carry a soulstone now, for just that reason.", next = "deaths_soulstone", when = { minLevel = 18 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deaths_blame = {
      lines = {
        { id = "db_default", text = "Me? I'm a foot and a half tall and I'm made of spite and kindling. I give you Blood Pact and I wrap you in a Fire Shield, and then you go and pull three ogres at once, so don't look at me." },
      },
      choices = {
        { text = "Then do better, imp.", next = "BACK", reply = "Yes, {g:master|mistress}, I'll grow another three feet, shall I?", fx = { trait = { stern = 1 } } },
        { text = "Fair enough. That one was my fault.", next = "BACK", reply = "Thank you! Finally, somebody in this partnership admits something.", fx = { affinity = 1 } },
      },
    },
    deaths_soulstone = {
      lines = {
        { id = "dss_default", text = "Ah yes, that little rock you put a scrap of your own soul into, so you can get up again when you fall over. Very clever, and very warlock, cheating death with a pebble." },
      },
      choices = {
        { text = "Death's just one more thing to outwit.", next = "BACK", reply = "Spoken like a warlock. Just remember it's outwitted plenty of your sort before you.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who you are.
    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "Oh, I know, everybody in the Nether knows about the orcs. Mannoroth gave you his blood and you drank it down, and for a while you were the Legion's favourite dogs, and now here you are calling up demons all over again." },
      },
      choices = {
        { text = "We broke that curse. I command demons; I don't serve them.", next = "BACK", reply = "That's a fine distinction, and I hope it holds up for you better than it did for Gul'dan.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "That blood made us great. I'll take back what I can.", next = "BACK", reply = "Now there's a proper orc warlock. Your grandfathers would be very proud, right before they went mad.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "That damp little cellar under the tavern in Stormwind, with all the guards drinking upstairs and pretending not to know what goes on below. I liked it there, it was cosy, and everybody whispered." },
      },
      choices = {
        { text = "Stormwind would hang us all if it could.", next = "xhuman_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_more = {
      big = true,
      lines = {
        { id = "xhm_default", text = "They'd try, and then they'd find out who's been keeping the demons on a leash all this time. Your kingdom needs its warlocks, {g:master|mistress}, it just doesn't like to say so in daylight." },
      },
      choices = {
        { text = "Stormwind's right to watch us closely.", next = "BACK", reply = "Spoken like someone who wants to keep their head. Very sensible, and very dull.", fx = { align = { order = 1 } } },
        { text = "Stormwind's laws don't bind me.", next = "BACK", reply = "Oh, I do like you sometimes. Just keep your voice down near the Cathedral.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "You measure me, you know, with that little brass gauge, and you write down how hot my Firebolts burn. I've been summoned by lots of warlocks, but you're the first one who's ever asked me to hold still for science." },
      },
      choices = {
        { text = "It's research, imp. Hold still.", next = "BACK", reply = "Fine, but if your gauge melts, I'm not paying for it.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll = {
      lines = {
        { id = "xt_default", text = "The loa can keep their opinions to themselves, thank you. Your old witch doctors trade with spirits all day long, so I don't see why a little demon should get all the funny looks." },
      },
      choices = {
        { text = "The loa and the Nether both serve me.", next = "BACK", reply = "Greedy, aren't you? I respect that in a troll.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xf_default", text = "I can tell, and it's terribly annoying. Other warlocks at least flinch when I set their sleeve alight, and you just look at the smoke as though it's the weather." },
      },
      choices = {
        { text = "What do demons know about the Scourge?", next = "xforsaken_more", fx = { learn = { "scourge" } } },
        { text = "The Scourge made me. We'll burn them together.", next = "BACK", reply = "Burn the walking dead? Oh, gladly, they go up like dry straw.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_more = {
      lines = {
        { id = "xfm_default", text = "That the dreadlords helped make the plague, and that Kel'Thuzad and his Cult of the Damned did the dirty work for them. You're what was left over, {g:master|mistress}, and I'd guess the Legion never expected the leftovers to bite." },
      },
      choices = {
        { text = "Then the Legion will learn to regret it.", next = "BACK", reply = "I hope I'm there when it does. I'll bring the fire.", fx = { learn = { "kelthuzad" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "Big, loud and very full of itself, and it never once said thank you to an imp either. Archimonde fell at Hyjal, and good riddance." } },
    scourge = { { id = "t_sc", text = "Walking dead, and they burn beautifully. If you see a crowd of them, {g:master|mistress}, you know where to point me." } },
    kelthuzad = { { id = "t_kt", text = "A necromancer who thought he'd found a good master. That's what happens when you sign before you read, which is why I always read." } },
    background = { { id = "t_bg", text = "I'm an imp, I'm yours, and before you I was somebody else's, and before them it's none of your business." } },
    advice = { { id = "t_ad", text = "Never stand in the fire, unless it's mine, in which case it's probably still a bad idea." } },
    _none = { { id = "t_none", text = "How should I know? I've spent most of my life in a bag of brimstone or the Nether, and neither has a library." } },
  },
}

---------------------------------------------------------------------------
-- Your voidwalker: slow, hollow, patient, ominous, and strangely loyal.
---------------------------------------------------------------------------
P:Pool {
  id = "my_voidwalker", role = "my_voidwalker", tier = "major",
  greetings = {
    { id = "g_default", text = "You spoke, {g:master|mistress}, and I turned toward you. I am always turned toward you, even when you do not see it." },
    { id = "g_first", when = { maxLevel = 14, metBefore = false }, text = "You beat me down in the circle, and then you gave me a name to answer to. I remember the weight of your hand, and I will carry it." },
    { id = "g_back", when = { metBefore = true }, text = "You have come to speak with me again. The dark does not get many visitors, and it is pleased." },
    { id = "g_often", when = { timesTalked = { min = 10 } }, text = "We have spoken many times now, {name}. I keep every word in the hollow place where a heart would be." },
    { id = "g_deaths", when = { deaths = { min = 20 } }, text = "You have died many times while I stood before you. Each time I went back into the dark, and each time I waited for your voice." },
    { id = "g_taint", when = { taint = { min = 50 } }, text = "The dark in you has grown, {g:master|mistress}. When you call me now, I hardly need to travel at all." },
    { id = "g_vet", when = { minLevel = 50 }, text = "You have grown very strong, and many things fear you now. I do not fear you, but I am glad to stand on your side of the dark." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night has come, and the shadows are long. I like it best when there is more of me in the world than there is of the light." },
  },
  notice = {
    { id = "n_shards", cat = "carry", when = { carrying = { id = SHARD, min = 20 } },
      text = "Your bag is full of souls, {g:master|mistress}. They are very quiet when I am near, because they know what I am made from." },
    { id = "n_felsteed", cat = "mount", when = { aura = { FELSTEED } },
      text = "The burning horse is out, so I will not be for long. I do not mind it, though it runs very loudly for something from the dark." },
    { id = "n_dread", cat = "mount", when = { aura = { DREADSTEED } },
      text = "You ride a dreadsteed now. It came out of the Nether as I did, and it remembers the cold there, so be gentle with its fire." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "There is a quiet in you that the living do not have. I find it restful, {g:master|mistress}, like standing beside a deep well." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You are very small to cast so long a shadow. I have stopped wondering how, and started being grateful." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "The old blood sleeps in you, {g:master|mistress}. I can feel it turn over when you call me, the way a dreamer turns toward a sound." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Your spirits keep watch over you, and they do not care for me. We stand on either side of you and say nothing to each other." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Your people make signs against me in the street, {g:master|mistress}. I have learned to stand in the shadow of a wall, so they need not look." },
    { id = "n_taint", cat = "taint", when = { taint = { min = 60 } },
      text = "Something green burns at the edges of you now. I can see it from the dark, and I am not the only one who can." },
    { id = "n_party", cat = "party", when = { party = true },
      text = "Your companions keep their distance from me. They are wise to, though I would never harm what you have told me to protect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am here, {g:master|mistress}, as I am always here. Speak, and I will listen, because listening is a kind of waiting, and I am very good at waiting." },
        { id = "h_young", when = { maxLevel = 15 }, text = "You are new to this. Your voice still shakes a little when you call me, and the dark notices such things, but I do not mind it." },
        { id = "h_vet", when = { minLevel = 40 }, text = "We have walked a long way together, and I have stood between you and a great many deaths. I have not counted them, but the dark has, and it is patient." },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "You are cold and quiet inside, much as I am. I think that is why the binding sits so easily between us." },
        { id = "h_capital", when = { capital = true }, text = "There is so much light in this city, and so many people. I will stay close to you, where the shadows are kinder." },
        { id = "h_dark", when = { alignment = { axis = "light", max = -20 } }, text = "You have turned away from the light, {g:master|mistress}. I can feel it, because when you speak to me now, there is less between us." },
      },
      again = {
        { id = "a_1", text = "I am still here. Ask, and I will answer, as far as the dark lets me." },
        { id = "a_2", text = "There is more you wish to know. I can feel it, the way I feel a blow before it lands." },
        { id = "a_old", when = { timesTalked = { min = 5 } }, text = "You always have one more question for me. I have come to wait for it." },
      },
      choices = {
        { text = "What do you think of me?", next = "master" },
        { text = "Where do you go when I dismiss you?", next = "dismiss" },
        { text = "Do you remember the day I bound you?", next = "bound" },
        { text = "Does it hurt, taking the blows meant for me?", next = "pain" },
        { text = "I may have to sacrifice you one day.", next = "sacrifice" },
        { text = "The imp complains about you constantly.", next = "imp" },
        { text = "You were there every time I fell.", next = "deaths", when = { deaths = { min = 5 } } },
        { text = "We're both hollow things, you and I.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "My people were the Legion's slaves once.", next = "xorc", when = { race = "Orc" } },
        { text = "Stormwind thinks you're an abomination.", next = "xhuman", when = { race = "Human" } },
        { text = "I've measured you, you know. You weigh nothing at all.", next = "xgnome", when = { race = "Gnome" } },
        { text = "My people's spirits come through the dark too.", next = "xtroll", when = { race = "Troll" } },
        { text = "That's all. Stand ready.", next = "END" },
      },
    },

    -- What it thinks of you.
    master = {
      lines = {
        { id = "m_default", text = "I think you are warm, and that you burn quickly, as all of your kind do. I think you are mine to guard, and so I do not look very far past that." },
        { id = "m_young", when = { maxLevel = 19 }, text = "I think you are young, and that you will make mistakes, and that I will be standing in front of them. That is what I am for." },
        { id = "m_dark", when = { taint = { min = 40 } }, text = "I think you are becoming something closer to me. I cannot say whether that is good, because the dark has no word for good." },
      },
      choices = {
        { text = "Why are you so loyal to me?", next = "master_loyal" },
        { text = "Do you have a true name?", next = "name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_loyal = {
      narr = "The voidwalker's hollow eyes dim, and the shadow of it seems to lean a little closer to you.",
      lines = {
        { id = "ml_default", text = "The binding holds me, but that is not all of it. Before you called me I was nothing, a piece of the emptiness drifting where nobody would ever look, and you gave me a shape and something to stand in front of." },
      },
      choices = {
        { text = "So your loyalty is only the binding talking.", next = "master_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_stance = {
      big = true,
      lines = {
        { id = "ms_default", text = "Perhaps. I cannot see where the chain ends and I begin, {g:master|mistress}, and I do not think you can either. Tell me what I am to you, and I will be that." },
      },
      choices = {
        { text = "You're a weapon. Loyalty means nothing in a weapon.", next = "BACK", reply = "Then I will be a weapon. Weapons do not grieve when they break, and that is a kind of mercy.", fx = { align = { order = 1, honor = -1 }, trait = { stern = 1 } } },
        { text = "Loyalty like yours deserves loyalty back.", next = "BACK", reply = "No one has ever said that into the dark before. I will keep it there, where nothing can take it.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Let's leave that question.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "n_default", text = "I had one once, before the shape. It is not a word, {g:master|mistress}, it is a sound the dark makes when something falls into it, and I will not say it, because a name spoken is a name held." },
      },
      choices = {
        { text = "I command you to tell me.", next = "name_command" },
        { text = "Then keep it. It's yours.", next = "BACK", reply = "Thank you. It is the only thing I have that you did not give me.", fx = { affinity = 1 } },
      },
    },
    name_command = {
      big = true,
      narr = "The air around the voidwalker grows suddenly cold, and the nearest shadows draw in toward it.",
      lines = {
        { id = "nc_default", text = "I would obey, if I could. But the binding does not reach so deep, and what lies under it does not belong to you, or to me, or to anyone who has ever drawn a circle." },
      },
      choices = {
        { text = "Some day I'll reach that deep, and bind you tighter.", next = "BACK", reply = "Perhaps you will. I would not try to stop you, but I would not want to see what you became on the way down.", fx = { align = { order = 1, light = -1 }, taint = 1 } },
        { text = "Then it stays where it is. I won't ask again.", next = "BACK", reply = "You are kind, for one who keeps chains. I will remember that you stopped.", fx = { affinity = 1, align = { order = -1, light = 1 } } },
        { text = "Never mind.", next = "BACK" },
      },
    },

    -- Dismissal and the void.
    dismiss = {
      lines = {
        { id = "d_default", text = "When you dismiss me, I go back into the dark between the worlds. It is not far, {g:master|mistress}; it is behind every shadow you have ever stood in, and I wait there for your voice." },
        { id = "d_mounted", when = { mounted = true }, text = "When you ride, I go back into the dark, and I listen to the hooves above me. It is a strange sound to hear from underneath the world." },
      },
      choices = {
        { text = "What is it like, the dark you go back to?", next = "dismiss_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dismiss_dark = {
      lines = {
        { id = "dd_default", text = "There is nothing there, and the nothing goes on for a very long way. At its edges the Twisting Nether moves and burns and whispers, but where I wait, it is only quiet, and I am a part of the quiet." },
      },
      choices = {
        { text = "What are you, truly?", next = "void" },
        { text = "That sounds lonely.", next = "BACK", reply = "Lonely is a word for those who have been with others first. I have only been with you.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    void = {
      lines = {
        { id = "v_default", text = "I am a piece of the emptiness, given a shape and a chain. The Legion found my kind drifting long before you were born and put us to work, and we did not mind, because we do not mind anything." },
      },
      choices = {
        { text = "Did the Legion use you before I did?", next = "void_legion", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    void_legion = {
      big = true,
      lines = {
        { id = "vl_default", text = "The Legion used my kind as shields and doors and silences on a hundred worlds. Archimonde fell on your mountain of Hyjal, and the Legion has drawn back, but it is patient, {g:master|mistress}, and the void is more patient still." },
        { id = "vl_orc", when = { race = "Orc" }, text = "The Legion used my kind as it used yours, as something to spend. Archimonde fell at Hyjal, and Mannoroth before him to your own people's axes, but the Legion is patient, and it remembers who it owned." },
      },
      choices = {
        { text = "The Legion will never have this world.", next = "BACK", reply = "Then I will stand in front of you when it comes, as I stand in front of everything else.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Perhaps the Legion's power could serve me instead.", next = "BACK", reply = "Many have thought so. The void holds a great many of them now, and they are very quiet.", fx = { align = { light = -1 }, taint = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The binding quest and the shard it costs.
    bound = {
      lines = {
        { id = "b_default", text = "I remember. Your teacher gave you the words, and you drew the circle, and I came through it hungry. You struck me down before the binding would hold, and when I rose again, I was yours." },
        { id = "b_human", when = { race = "Human" }, text = "I remember. It was a cellar beneath a tavern in Stormwind, with laughter coming through the floorboards, and you struck me down in the circle until the binding held." },
        { id = "b_horde", when = { race = { "Orc", "Troll" } }, text = "I remember. It was the Cleft of Shadow beneath Orgrimmar, where the air is thick and red, and you struck me down in the circle until the binding held." },
        { id = "b_forsaken", when = { race = "Scourge" }, text = "I remember. It was deep in the Undercity, in the Magic Quarter, where the green water drips, and you struck me down in the circle until the binding held." },
      },
      choices = {
        { text = "Why did I have to beat you first?", next = "bound_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bound_fight = {
      lines = {
        { id = "bf_default", text = "A voidwalker does not kneel to words alone. It kneels to one who has hurt it and is still standing, because that is the only kind of master the void can understand." },
      },
      choices = {
        { text = "Every time I call you, a soul shard burns.", next = "bound_shard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bound_shard = {
      big = true,
      narr = "Something moves deep inside the voidwalker's chest, like a dim shape turning over under black water.",
      lines = {
        { id = "bs_default", text = "Yes. A soul taken from something you have slain, spent to open the way for me. So I am made, a little, of everything you have killed, and I carry them all when I stand before you." },
        { id = "bs_many", when = { killed = { min = 2000 } }, text = "Yes, and you have killed a great many things. I am heavier than I was, {g:master|mistress}, with all the souls you have spent on me, and they are very quiet inside me." },
      },
      choices = {
        { text = "Their souls are fuel. I'll spend as many as it takes.", next = "BACK", reply = "Then I will keep coming, and I will keep growing heavier. The dark has room for all of them.", fx = { align = { light = -1 }, taint = 1 } },
        { text = "I take no more souls than I must.", next = "BACK", reply = "That is rare in a warlock. The souls cannot thank you, but I will notice for them.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Pain, Consume Shadows, Health Funnel.
    pain = {
      lines = {
        { id = "p_default", text = "Pain is a sound that comes from very far away. When I Torment them, they forget you and turn to me, and they strike and strike, and I hear it the way you would hear rain on a roof." },
      },
      choices = {
        { text = "How do you heal, afterwards?", next = "pain_consume" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pain_consume = {
      lines = {
        { id = "pc_default", text = "I drink the shadows around me, slowly, until I am whole again. You have seen it, when the battle is over and the air goes dim around us, and you wait with your hand on your book." },
      },
      choices = {
        { text = "Sometimes I give you my own life to keep you standing.", next = "pain_funnel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pain_funnel = {
      big = true,
      lines = {
        { id = "pf_default", text = "I feel it, when you do that. Your warmth runs down the green thread between us and into the hollow of me, and for a moment I know what it is to be alive, and then it is gone." },
      },
      choices = {
        { text = "You're worth the cost. I'll always keep you standing.", next = "BACK", reply = "Then I will always stand, {g:master|mistress}. That is a promise from the dark, and the dark keeps very few.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "You're cheaper to replace than to heal.", next = "BACK", reply = "That is true. I will remember that it is true, and I will still stand in front of you.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Sacrifice.
    sacrifice = {
      narr = "The voidwalker bows its great head, slowly, as if it has been waiting to be asked.",
      lines = {
        { id = "s_default", text = "I know. When the blows come too fast, you will tell me to give myself up, and I will wrap what is left of me around you like a cloak. It is the last thing I can do for you, and I am ready to do it." },
      },
      choices = {
        { text = "Doesn't that frighten you?", next = "sacrifice_fear" },
        { text = "Some warlocks consume their voidwalker for good.", next = "sacrifice_demonic", when = { minLevel = 30 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sacrifice_fear = {
      lines = {
        { id = "sf_default", text = "I came from emptiness and I return to it, so there is nothing in the ending to fear. What troubles me is the thought that one day you will call, and something else will answer instead of me." },
      },
      choices = {
        { text = "I'll always call you back.", next = "BACK", reply = "Then I will always come, as long as there is a way through the dark.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sacrifice_demonic = {
      big = true,
      lines = {
        { id = "sd_default", text = "Yes, I know the rite. They take the whole of us into themselves, and the dark mends their wounds for a long while afterward. The voidwalker does not come back from that, {g:master|mistress}; it simply becomes a part of the one who made it." },
      },
      choices = {
        { text = "If it made me stronger, I'd do it without hesitation.", next = "BACK", reply = "Then I would be with you always, in a way. I do not think it would be a bad ending.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I'd never spend you so cheaply.", next = "BACK", reply = "Cheap or dear, I am yours to spend. But I will remember that you would not.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's not speak of it.", next = "BACK" },
      },
    },

    -- The other demons.
    imp = {
      lines = {
        { id = "i_default", text = "The small one talks. It talks while it fights and while it waits, and I think it talks while it is in the Nether too, where nobody at all can hear it." },
      },
      choices = {
        { text = "It thinks I like you better.", next = "imp_jealous" },
        { text = "What do you make of my other demons?", next = "others", when = { minLevel = 20 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    imp_jealous = {
      lines = {
        { id = "ij_default", text = "Perhaps you do, and perhaps you do not. The imp burns brightly and quickly, and I am the dark it burns against, so it will always be angry with me, and I do not mind its anger." },
      },
      choices = {
        { text = "Be kinder to it, for my sake.", next = "BACK", reply = "I will stand a little further from it, then. That is the only kindness I know how to give.", fx = { affinity = 1 } },
        { text = "Neither of you is my favourite, truth be told.", next = "BACK", reply = "Then we are equal. I will tell the imp, and it will be furious.", fx = { trait = { witty = 1 } } },
      },
    },
    others = {
      lines = {
        { id = "o_default", text = "The succubus smiles at me and I do not smile back, and that amuses her more than it should. She enjoys the world too much, {g:master|mistress}, and things that enjoy the world want to stay in it." },
        { id = "o_hunter", when = { minLevel = 30 }, text = "The felhunter sniffs at me and finds nothing it can eat, so it leaves me be. The succubus smiles and I do not smile back. They both want something from you, and I want only to stand where you tell me." },
      },
      choices = {
        { text = "And you don't want anything?", next = "BACK", reply = "I want to be called. It is a small want, and you have always answered it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Your deaths.
    deaths = {
      lines = {
        { id = "de_default", text = "When you die, the chain between us goes slack, and I fall back into the dark. I wait there, and I listen, and then at last your voice comes again, and I rise." },
        { id = "de_many", when = { deaths = { min = 50 } }, text = "You have fallen so many times that I know the shape of it now, the moment the chain goes slack. I have stopped being surprised, but I have not stopped waiting." },
      },
      choices = {
        { text = "What do you see, when I fall?", next = "deaths_watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deaths_watch = {
      lines = {
        { id = "dw_default", text = "I see the light go out of you, and for a moment we are the same, two empty things in the same place. Then I am pulled away, and I do not see what comes for you after." },
      },
      choices = {
        { text = "I carry a soulstone now. Death is less final.", next = "deaths_soulstone", when = { minLevel = 18 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deaths_soulstone = {
      big = true,
      lines = {
        { id = "dss_default", text = "A piece of your own soul, set aside in a stone so that you can find your way back. The dark does not like to be cheated, {g:master|mistress}, but it is very patient, and it will wait." },
      },
      choices = {
        { text = "Death is a door, and I mean to keep it open.", next = "BACK", reply = "Then I will stand at that door with you, and we will see who comes through it.", fx = { align = { light = -1 } } },
        { text = "When my time truly comes, I'll go honestly.", next = "BACK", reply = "Then I will go with you, if I am called, and I will be glad of the company.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who you are.
    xforsaken = {
      lines = {
        { id = "xf_default", text = "Yes. The Scourge emptied you out once, and your Dark Lady filled you back up with will and anger. I was empty from the very beginning, and so I think I understand you better than the living ever could." },
      },
      choices = {
        { text = "What do you know of the Scourge?", next = "xforsaken_scourge", fx = { learn = { "scourge" } } },
        { text = "Then you understand me better than they do.", next = "BACK", reply = "I do not judge you, {g:master|mistress}. That is all understanding is, in the end.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_scourge = {
      lines = {
        { id = "xs_default", text = "That the dreadlords made the plague, and that Kel'Thuzad and his Cult of the Damned spread it for them, and that the Lich King's cold is not the same as mine. His dark is full of voices, and mine is empty." },
        { id = "xs_scholo", when = { cleared = "Scholomance" }, text = "You have walked through Scholomance and seen what the Cult of the Damned teaches there. Kel'Thuzad's students learn to fill the dark with voices, {g:master|mistress}, and mine is only empty, which I think is kinder." },
      },
      choices = {
        { text = "Then we'll empty the Scourge, one by one.", next = "BACK", reply = "I will stand in front of you while you do it. They strike hard, but they do not strike for long.", fx = { learn = { "kelthuzad" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "I know. The demon blood still sleeps in your people, and when you call me, I feel it turn over. You command what once commanded you, and I cannot tell whether that is victory or only a longer road back." },
      },
      choices = {
        { text = "It's victory. We're free, and we stay free.", next = "BACK", reply = "Then hold to that, and I will hold to you.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Some of that old power is worth taking back.", next = "BACK", reply = "Many of your ancestors thought so too. The void remembers each of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "They are not wrong to fear me. But I came to you in a cellar beneath a tavern, while your king's guards drank upstairs, and I have stood in front of you ever since, which is more than they have done." },
      },
      choices = {
        { text = "Stormwind doesn't know what it's sheltering.", next = "BACK", reply = "No. It is better that way, for them and for you.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "I know. You wrote it down in your little book, and then you wrote down how far I stretch, and how cold the air is where I stand. No one has ever wanted to know so much about nothing." },
      },
      choices = {
        { text = "Nothing is very interesting, scientifically.", next = "BACK", reply = "Then I am glad to be useful to you in two ways.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll = {
      lines = {
        { id = "xt_default", text = "They do, but they come for a reason, and they go home again. I have no home to go to, and so I stay, and your spirits watch me the way a hunter watches a still pool." },
      },
      choices = {
        { text = "Then stay where they can see you.", next = "BACK", reply = "I always do. I have nothing to hide, because I am what hiding is made of.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "The Legion uses my kind as walls and doors. It was broken at Hyjal, but the void does not believe in endings." } },
    scourge = { { id = "t_sc", text = "The Scourge is a dark full of voices. Mine is empty, and I prefer it." } },
    kelthuzad = { { id = "t_kt", text = "A man who gave himself to a colder master than you are. I do not think he chose well." } },
    second_war = { { id = "t_sw", text = "Gul'dan's warlocks called my kind by the hundred in those days. Most of them were spent, and none were missed." } },
    background = { { id = "t_bg", text = "Before you, there was nothing. Before the nothing, I do not remember, and I do not wish to." } },
    advice = { { id = "t_ad", text = "Stand behind me, {g:master|mistress}, and let them come to me first. That is all the advice I have, and all you need from me." } },
    _none = { { id = "t_none", text = "I do not know. The dark does not keep such things, and neither do I." } },
  },
}

---------------------------------------------------------------------------
-- Persuasion
---------------------------------------------------------------------------
P:Persuade { id = "my_imp", role = "my_imp",
  admire = {
    success = {
      { id = "s1", text = "Finally! Somebody in this partnership notices talent. Say it again, slower." },
      { id = "s2", text = "Well, I am rather magnificent, aren't I? I'm glad you've finally caught up." },
    },
    fail = {
      { id = "f1", text = "Flattery from a warlock? You want something, and I'm not doing it." },
      { id = "f2", text = "You only say that when you're about to send me in first. I'm not falling for it again." },
    },
  },
  taunt = {
    success = {
      { id = "s1", text = "Oh, you think so? Watch this, then, and try not to singe your eyebrows." },
      { id = "s2", text = "Ha! That's the spirit, {g:master|mistress}. Now I'm properly annoyed, and that's when I'm at my best." },
    },
    fail = {
      { id = "f1", text = "Keep talking like that and see what happens to your robes tonight." },
      { id = "f2", text = "That's hurtful, and I'm writing it down in my little book of grudges." },
    },
  },
  intimidate = {
    success = {
      { id = "s1", text = "All right, all right! There's no need to wave the grimoire about. I'm listening." },
      { id = "s2", text = "Yes, {g:master|mistress}, right away, {g:master|mistress}. You only had to ask, you know." },
    },
    fail = {
      { id = "f1", text = "You need me more than I need you, and we both know it. Try that again when you've got a spare imp." },
    },
  },
}

P:Persuade { id = "my_voidwalker", role = "my_voidwalker",
  admire = {
    success = {
      { id = "s1", text = "No one has praised the dark before. I will keep your words where the light cannot reach them." },
    },
    fail = {
      { id = "f1", text = "Praise falls into me and does not touch the bottom. You need not offer it." },
    },
  },
  taunt = {
    success = {
      { id = "s1", text = "Your anger is warm. Let it come, and I will stand in front of it as I stand in front of everything." },
    },
    fail = {
      { id = "f1", text = "Insults are only sounds, {g:master|mistress}, and the void swallows sounds." },
    },
  },
  intimidate = {
    success = {
      { id = "s1", text = "I feel the chain pull tight. I will obey." },
    },
    fail = {
      { id = "f1", text = "You may hurt me if you wish. Pain is far away, and I will still be here when it is done." },
    },
  },
}
