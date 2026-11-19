-- The warlock's own succubus (role "my_succubus"): the player is always her master, and the
-- speaker is the demon the player bound. Silken, mocking, manipulative and cruelly witty; she
-- treats her master as both prize and prey, tests the binding with charm and little bargains,
-- reads desires and fears aloud, loves a firm hand and despises weakness. Sibling to the
-- `demon` pool in demons.lua (other people's demons); none of its lines are repeated here.
-- Lore: Classic only. The Twisting Nether, the Burning Legion, Archimonde's fall at Hyjal,
-- Gul'dan and the Shadow Council, Kil'jaeden, Sargeras, Dalaran's ban, the Burning Blade,
-- the Scholomance and the Cult of the Damned, soul shards, Seduction and Lash of Pain.
local P = RPGDialogueAPI:Pack("rpgd.world")

local SOON = { maxLevel = 29 }
local HIGH = { minLevel = 50 }

P:Pool {
  id = "my_succubus", role = "my_succubus",
  greetings = {
    { id = "g_default", text = "You called, master, and here I am, as obedient as a cat and twice as fond of you. What does my keeper want?" },
    { id = "g_default2", text = "Mm, you want to talk? How lovely, master. I was beginning to think you only kept me around for the screaming." },
    { id = "g_first", when = { metBefore = false }, narr = "She stretches slowly inside the last of the summoning smoke, testing the length of her invisible chain.", text = "So you're the one who drew the circle. Well, master, you've caught yourself something rare, and I do hope you know what to do with it." },
    { id = "g_often", when = { timesTalked = { min = 10 } }, text = "Again, master? You can't stay away from me, can you, and I can't say I blame you." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "Up with the sun, master? It's a dreadful habit, all that light and birdsong, but I suppose somebody has to be terribly diligent." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night at last, master. Everything is so much more honest in the dark, don't you find, and so much more interesting." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "The sun's going down and the shadows are getting long, master. My favourite hour, when every mortal starts glancing over their shoulder." },
    { id = "g_deaths", when = { deaths = { min = 15 } }, text = "Still walking, master? I've watched you die so many times now that I've started keeping count, and I'm afraid the number isn't flattering." },
    { id = "g_party", when = { party = true }, text = "You'd rather talk to me than to your little friends, master? I'm touched, and they're glaring, which makes it even sweeter." },
    { id = "g_drunk", when = { drunk = true }, text = "Master, you smell of cheap ale and you're swaying like a reed. You know a binding is only as steady as the hand holding it, don't you?" },
    { id = "g_poor", when = { money = { max = 1 } }, text = "Your purse is so light it rattles, master. A warlock with empty pockets is a sad thing to serve, and I've served kings." },
    { id = "g_low", when = SOON, text = "Hello, little master. Your circle was so carefully drawn and your hands shook only a little, and I thought that was rather adorable." },
    { id = "g_high", when = HIGH, text = "Master. You've grown strong enough that I feel the chain pull when you merely think of me, and I'll confess I rather like it." },
    { id = "g_male", when = { gender = "male" }, text = "There's my handsome jailer. Come closer, master, I promise to be very well behaved, at least until you ask me not to be." },
    { id = "g_female", when = { gender = "female" }, text = "There she is, my lovely jailer. You wear the chain's end so well, mistress, it's almost a shame it isn't jewellery." },
    { id = "g_orc", when = { race = "Orc" }, text = "My great green master, all tusks and thunder. Your grandfathers kept company with my sisters once, did you know, and they never once complained." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "My cold little corpse of a master. You don't blush and you don't sweat, which makes you a challenge, and I do adore a challenge." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "Down here, master, I see you. All that power packed into such a tiny body, and you still have to stand on your toes to scold me." },
    { id = "g_human", when = { race = "Human" }, text = "My clever human master, who learned the forbidden arts behind Stormwind's back. You're so wicked, and you think nobody notices." },
    { id = "g_fond", when = { affinity = { min = 5 } }, text = "Master, darling. If I didn't know better, I'd say I was almost glad to see you, and I always know better." },
    { id = "g_sour", when = { affinity = { max = -3 } }, text = "Yes, master? I'm here, I'm bound, and I'm smiling. Two of those three are true." },
  },
  notice = {
    { id = "n_paladin", cat = "party", when = { party = { class = "PALADIN" } },
      text = "Your friend {companion} keeps touching that hammer whenever I walk past, master. Tell the paladin I don't bite unless you ask me to." },
    { id = "n_priest", cat = "party", when = { party = { class = "PRIEST" } },
      text = "{companion} the priest prays a little louder whenever I'm near, master. I've decided to take it as a compliment." },
    { id = "n_lock", cat = "party", when = { party = { class = "WARLOCK" } },
      text = "Another warlock in the party, master? Watch {companion} closely; a binder who walks beside you is learning how you hold your chains." },
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "You're drunk, master, and I can feel the binding go loose and warm like a ribbon in the wind. I'd sober up, if I were you." },
  },
  tier = "quest",
  start = "hello",
  nodes = {
    ---------------------------------------------------------------------------
    -- The hub
    ---------------------------------------------------------------------------
    hello = {
      lines = {
        { id = "h_default", text = "I'm yours to command, master, bound by your blood and your words and a little stolen soul. Ask me what you like, order me where you like, and I'll obey, because I must, and because watching you try is so very entertaining." },
        { id = "h_low", when = SOON, text = "You're new to this, aren't you, master? You still look at me as though I might vanish, or as though I might not. Don't worry, I'll be gentle with you, for now." },
        { id = "h_high", when = HIGH, text = "You've come so far, master, from a nervous little apprentice to something even I find worth watching. Speak, and I'll listen, which is more than I do for most." },
        { id = "h_orc", when = { race = "Orc" }, text = "Your people learned the dark arts from Gul'dan and paid for it in green skin and dead lands, master. You took up the same arts anyway, and I find that wonderfully stubborn." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "You died once already, master, and then you came back and decided to bind demons. I've known kings with less ambition and far worse taste." },
      },
      again = {
        { id = "a_1", text = "What else does my master desire? Don't be shy now." },
        { id = "a_2", text = "Still here, master? Good. I was just starting to enjoy myself." },
        { id = "a_3", text = "Go on, master. I'm all yours, at least in the ways that count." },
        { id = "a_night", when = { timeOfDay = "night" }, text = "The night's still young, master, and so are you. Ask me something else." },
      },
      choices = {
        { text = "I have orders for you.", next = "orders" },
        { text = "Tell me about yourself, {npc}.", next = "past" },
        { text = "I want to talk about the binding.", next = "binding" },
        { text = "What do you see when you look at me?", next = "me" },
        { text = "You and my other demons don't get along.", next = "others" },
        { text = "Walk with me. The road's long and I'm bored.", next = "road" },
        { text = "You flirt with everyone, you know.", next = "flirt" },
        { text = "Dalaran would burn me for what I am.", next = "dalaran", when = { race = { "Human", "Gnome" } } },
        { text = "My people once drank the blood of your masters.", next = "orcblood", when = { race = "Orc" } },
        { text = "Does a dead master tempt you at all?", next = "corpse", when = { race = "Scourge" } },
        { text = "That will be all, {npc}.", next = "END" },
      },
    },

    ---------------------------------------------------------------------------
    -- Orders
    ---------------------------------------------------------------------------
    orders = {
      hub = true,
      lines = {
        { id = "or_default", narr = "She sinks into a mocking curtsey, wings folded and eyes never leaving your face.", text = "Orders, master? Oh, say them slowly. I do so love it when you take that tone with me." },
        { id = "or_low", when = SOON, text = "Orders from such a young master, how exciting. Try to sound as though you mean them, and I'll try to sound as though I'm frightened." },
      },
      again = {
        { id = "ora_1", text = "Any more commands, master? My whip's still warm." },
        { id = "ora_2", text = "What next? I'm still listening, which you should treasure." },
      },
      choices = {
        { text = "When I point, you charm them. No arguing.", next = "o_seduce" },
        { text = "Stay close to me, and don't wander off.", next = "o_heel" },
        { text = "In town, keep your mouth shut and your whip coiled.", next = "o_town" },
        { text = "You did well in that last fight.", next = "praise" },
        { text = "You were careless back there. I nearly died.", next = "scold" },
        { text = "Enough orders for now.", next = "BACK" },
      },
    },
    o_seduce = {
      lines = {
        { id = "os_default", text = "Seduction is my favourite thing in the whole world, master, and I'll do it whenever you point. They stand there smiling at me like fools while you burn them, and they never understand what happened until it's far too late." },
        { id = "os_high", when = HIGH, text = "I've charmed giants for you, master, and dragonkin and dwarves with beards to their belts. Point, and I'll make anything with a heartbeat forget it has a sword." },
      },
      choices = {
        { text = "And once they're charmed, make them hurt.", next = "o_lash" },
        { text = "Does it work on the dead?", next = "o_undead" },
        { text = "Good. Back to it.", next = "orders" },
      },
    },
    o_lash = {
      lines = {
        { id = "ol_default", narr = "She uncoils the whip with a flick, and it cracks the air a hand's width from your ear.", text = "Lash of Pain is a love letter, master, and I write it very neatly. But do tell me how you like it done, because some masters want a lingering death and some want it quick, and it tells me so much about you." },
      },
      choices = {
        { text = "Make it last. Let them know who sent you.", next = "orders", reply = "Oh, master, there it is, that lovely cruel streak. I knew you had one under all those robes.", fx = { affinity = 1, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Quick and clean. I'm not a butcher.", next = "orders", reply = "How disappointingly decent of you, master. I'll do it quickly, but I'll sulk about it.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Do whatever gets them dead fastest.", next = "orders", reply = "Practical, master. Not romantic, but practical, and I suppose one of us has to be.", fx = { trait = { witty = 1 } } },
      },
    },
    o_undead = {
      lines = {
        { id = "ou_default", text = "On the walking dead? Hardly, master. Seduction needs a mind that wants something, and those rotting things in the Plaguelands want only to eat, which is honest of them, but terribly dull." },
        { id = "ou_scourge", when = { race = "Scourge" }, text = "Not on the Scourge, master, because there's nothing behind their eyes to whisper to. You're another matter; you Forsaken still want things, and I can see every one of them." },
      },
      choices = {
        { text = "Then the Scourge is mine to handle.", next = "orders", fx = { trait = { brave = 1 } } },
        { text = "Fine. Back to your orders.", next = "orders" },
      },
    },
    o_heel = {
      lines = {
        { id = "oh_default", text = "Stay close, master? You only had to ask, and you didn't even have to ask nicely. I'll be right at your back, close enough to feel you breathe, and close enough to catch you if you stumble." },
        { id = "oh_scourge", when = { race = "Scourge" }, text = "Stay close, master? I'll be right at your back, close enough to hear your bones creak, and close enough to catch you if something falls off." },
      },
      choices = {
        { text = "Close enough to put a knife in me, too.", next = "o_knife" },
        { text = "I like you where I can see you.", next = "orders", reply = "Everyone does, master. It's my one great talent, besides all the others.", fx = { affinity = 1 } },
      },
    },
    o_knife = {
      lines = {
        { id = "ok_default", text = "Oh, master, you wound me, and I'm the one who's supposed to do the wounding. The binding won't let me lift a hand against you, and you know it, so I'll just have to keep imagining it." },
      },
      choices = {
        { text = "Imagine all you like. The chain holds.", next = "orders", reply = "It does, master, and that firm little voice of yours is a large part of why. Never lose it.", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Back to your orders.", next = "orders" },
      },
    },
    o_town = {
      lines = {
        { id = "ot_default", text = "No smiling at the guards, no teasing the innkeeper, no frightening the children? Master, you take all the joy out of civilisation. Very well, I'll be a statue, but a statue with excellent posture." },
        { id = "ot_orc", when = { race = "Orc" }, text = "In Orgrimmar, master, half the grunts can't stop staring and the other half spit when I pass. I'll keep my whip coiled, but I can't help it if they look." },
        { id = "ot_scourge", when = { race = "Scourge" }, text = "In the Undercity, master? Nobody there has had a pulse in years, so there's nobody to tease. I'll behave, mostly out of boredom." },
        { id = "ot_human", when = { race = { "Human", "Gnome" } }, text = "In Stormwind, master, where they'd hang you if the guards ever looked twice at what's walking behind you? Of course I'll be good. I'd hate to see that lovely neck stretched." },
      },
      choices = {
        { text = "The guards tolerate warlocks. Barely. Don't push it.", next = "orders", reply = "Barely is my favourite word, master. I'll stay right on the edge of it.", fx = { trait = { stern = 1 } } },
        { text = "Fine. Back to your orders.", next = "orders" },
      },
    },
    praise = {
      lines = {
        { id = "pr_default", narr = "She stops mid-step and turns, slowly, as though the word has a taste and she means to savour it.", text = "Praise, master? From you? Say it again, slower, because I want to remember exactly how it sounded. Now tell me, what does a good servant get for doing well?" },
        { id = "pr_sour", when = { affinity = { max = -3 } }, text = "Praise, from you, master, after the way you've been treating me? I'll take it, of course, but I'll be counting what it cost you." },
      },
      choices = {
        { text = "What do you want, then?", next = "praise_reward" },
        { text = "You get to stay summoned. That's your reward.", next = "orders", reply = "Generous to a fault, master. I'll try not to faint from the excitement.", fx = { affinity = -1, trait = { witty = 1 } } },
        { text = "Never mind. Back to your orders.", next = "orders" },
      },
    },
    praise_reward = {
      big = true,
      lines = {
        { id = "prr_default", text = "Something small, master. Let me choose the next one we kill, and let me take my time with it. Or tell me one secret you've never told anyone, and I'll keep it close, I swear on the circle." },
        { id = "prr_high", when = HIGH, text = "Something worthy of how far we've come, master. Take me somewhere dark and dangerous, Scholomance or the black spire, and let me loose, properly loose, just once." },
      },
      choices = {
        { text = "Fine. Pick the next one, and enjoy it.", next = "orders", reply = "Oh, master, you do know the way to a girl's heart. I'll choose someone who screams beautifully.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "No. A servant doesn't bargain for wages.", next = "orders", reply = "There's the firm hand. I'll pretend I'm disappointed, master, but I'm really rather impressed.", fx = { align = { light = 1 }, trait = { stern = 1 } } },
        { text = "I'll keep my secrets, thank you.", next = "orders", reply = "Clever master. You'd be astonished how many of my old masters didn't.", fx = { trait = { witty = 1 } } },
      },
    },
    scold = {
      lines = {
        { id = "sc_default", narr = "Her smile stays exactly where it is, but her tail stops swaying.", text = "Careless, master? I had three of them on me while you stood there fumbling with your shards. If you want a shield, you have a voidwalker, and if you want a lover, well, you know where to find me." },
        { id = "sc_deaths", when = { deaths = { min = 15 } }, text = "Nearly died, master? You actually died last week, and the week before, and I was the one who watched it. Perhaps the problem isn't standing behind you." },
      },
      choices = {
        { text = "Speak to me like that again and you'll burn.", next = "scold_burn" },
        { text = "You're right. I froze. It won't happen again.", next = "scold_soft" },
        { text = "Leave it. Back to your orders.", next = "orders" },
      },
    },
    scold_burn = {
      big = true,
      lines = {
        { id = "sb_default", narr = "She sinks to one knee at once, head bowed, and you can feel the binding hum like a plucked string.", text = "Yes, master, forgive me, master. Oh, I do love it when you remember you're the one in charge. Most mortals forget, and then they don't get the chance to remember again." },
      },
      choices = {
        { text = "A demon that bites gets punished. Always.", next = "orders", reply = "Always, master. Say it like that every time and I'll never need reminding.", fx = { affinity = 1, align = { order = 1 }, trait = { stern = 1 } } },
        { text = "I won't hurt you. Just don't do it again.", next = "orders", reply = "Mercy? Oh, master. That's a soft spot, and I've just learned where it is.", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    scold_soft = {
      lines = {
        { id = "ss_default", text = "Apologising to your own demon, master? That's either very brave or very foolish, and I haven't decided which. I'll take it, of course, the way I take everything you give me, and I'll keep it for later." },
      },
      choices = {
        { text = "I was being honest. Don't make it a weapon.", next = "orders", reply = "Honesty is always a weapon, master. I'll just try to use it gently.", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Forget I said it. Back to your orders.", next = "orders" },
      },
    },

    ---------------------------------------------------------------------------
    -- Her past
    ---------------------------------------------------------------------------
    past = {
      hub = true,
      lines = {
        { id = "pa_default", narr = "She settles on the nearest rock as if it were a throne, crossing her legs with great care.", text = "My favourite subject, master, apart from you. I'm old, older than your kingdoms and your gods and most of your mountains, and I've had a great many masters, but you're the one I have now." },
        { id = "pa_low", when = SOON, text = "You want my life story, master, and you've only had me since your trainer gave you the words? How sweet. I'll tell you the parts you're old enough to hear." },
      },
      again = {
        { id = "paa_1", text = "More about me, master? You're becoming quite obsessed." },
        { id = "paa_2", text = "Ask on, master. I've plenty of history and very few scruples about sharing it." },
      },
      choices = {
        { text = "Where were you before I called you?", next = "nether" },
        { text = "Did you serve the Burning Legion?", next = "legion", fx = { learn = { "burning_legion" } } },
        { text = "Tell me about your other masters.", next = "masters" },
        { text = "What's your true name, {npc}?", next = "truename" },
        { text = "That's enough of your history.", next = "BACK" },
      },
    },
    nether = {
      lines = {
        { id = "ne_default", text = "In the Twisting Nether, master, where there's no up or down and no time to speak of, only hungry things drifting in the dark and calling to one another. Then your little voice came through the circle like a hook through a fish's lip, and here I am." },
      },
      choices = {
        { text = "Do you miss it?", next = "nether_miss" },
        { text = "What happens to you when I dismiss you?", next = "dismiss" },
        { text = "Let's talk about something else.", next = "past" },
      },
    },
    nether_miss = {
      lines = {
        { id = "nm_default", text = "Miss the cold and the dark and the endless waiting? Not at all, master. Out here there's sunlight and wine and mortals who blush, and the Nether has none of those, so in a way you did me a favour, though I'll never thank you for it aloud." },
        { id = "nm_scourge", when = { race = "Scourge" }, text = "Miss it? Master, you of all people should understand. You went somewhere cold and empty and came back to find everything warm had gone sour, and I suspect neither of us would trade back." },
      },
      choices = {
        { text = "Then you're grateful, in your way.", next = "past", reply = "Don't spread that around, master. I have a reputation.", fx = { affinity = 1 } },
        { text = "Something else about you.", next = "past" },
      },
    },
    legion = {
      lines = {
        { id = "le_default", text = "Every one of my kind served the Legion, master, from the day Sargeras took us into his great crusade. I walked behind its armies on worlds you'll never hear of, and I watched them burn, and some of them were lovely when they burned." },
        { id = "le_orc", when = { race = "Orc" }, text = "Of course I did, master, and so did your people, if you think about it. Kil'jaeden's whispers reached Draenor long before the Dark Portal opened, and my sisters were there when the Shadow Council was young." },
      },
      choices = {
        { text = "The Legion lost at Mount Hyjal.", next = "hyjal", fx = { learn = { "burning_legion" } } },
        { text = "Would you go back to it, if you could?", next = "legion_back" },
        { text = "Enough of the Legion.", next = "past" },
      },
    },
    hyjal = {
      lines = {
        { id = "hy_default", text = "It did, master, and every mortal I meet is so very proud of it. Archimonde fell on Hyjal's slopes with the wisps tearing him apart, and I'll admit I never thought I'd see the day, but the Legion has buried its own before and it has never once stopped." },
      },
      choices = {
        { text = "Will it come back?", next = "hyjal_return" },
        { text = "Something else about your past.", next = "past" },
      },
    },
    hyjal_return = {
      big = true,
      lines = {
        { id = "hr_default", narr = "For a moment the mockery drops away, and she looks up at the sky as if she can see something behind it.", text = "Kil'jaeden is still out there, master, and Sargeras behind him, and neither of them has ever forgiven a world that told them no. They'll come back one day, and when they do, I'd very much like to know which side of the circle you'll be standing on." },
      },
      choices = {
        { text = "On this world's side. I bind demons to fight them.", next = "past", reply = "How noble, master. Some of the greatest warlocks said exactly that, right up until they didn't.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "On whichever side gives me more power.", next = "past", reply = "Oh, master, that's the most honest thing you've ever said to me. I'll remember it.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I'd rather not think about it.", next = "past" },
      },
    },
    legion_back = {
      lines = {
        { id = "lb_default", text = "To the Legion? Master, the Legion never cared about a single succubus, any more than you care about a single blade of grass. You, at least, talk to me, and that's more attention than Kil'jaeden ever spared." },
      },
      choices = {
        { text = "That's not a no.", next = "past", reply = "No, master, it isn't. You're learning.", fx = { trait = { witty = 1 } } },
        { text = "Back to your past, then.", next = "past" },
      },
    },
    masters = {
      lines = {
        { id = "ma_default", text = "So many, master. An orc warlock on Draenor who painted his face with ash, a Shadow Council lackey who sold his clan for a whisper from Gul'dan, and a Dalaran magister who swore he was only studying me. He studied very hard indeed, until I strangled him with his own hair." },
        { id = "ma_scourge", when = { race = "Scourge" }, text = "The last before you was a necromancer of the Cult of the Damned, master, who swore Kel'Thuzad would make him a lord. He died of plague in the end, and then he got up again and forgot my name, which I found very rude." },
      },
      choices = {
        { text = "Tell me about the orc warlocks.", next = "masters_orcs", fx = { learn = { "burning_blade" } } },
        { text = "How did that magister lose his grip?", next = "masters_magister" },
        { text = "Something else about you.", next = "past" },
      },
    },
    masters_orcs = {
      lines = {
        { id = "mo_default", text = "Gul'dan's students were the finest masters I ever had, and the cruellest, which is the same thing. Some of their heirs still gather in the Burning Blade, hiding in Ragefire Chasm and the Barrens and Desolace, and they summon my sisters as freely as you'd whistle for a dog." },
        { id = "mo_orc", when = { race = "Orc" }, text = "Your great-grandfathers, master, the ones who learned from Gul'dan and drank the blood and turned your people green. Thrall's Horde calls them traitors now, and the Burning Blade still hides in the Barrens calling my sisters up, so you're in mixed company." },
      },
      choices = {
        { text = "Gul'dan was a traitor to his people.", next = "past", reply = "He was, master, and the most interesting man I ever served. Traitors usually are.", fx = { align = { honor = 1 } } },
        { text = "Gul'dan knew what power costs, and paid.", next = "past", reply = "He did, and he died for it, torn apart in a tomb. I hope you're keeping better accounts.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Back to your past.", next = "past" },
      },
    },
    masters_magister = {
      big = true,
      lines = {
        { id = "mm_default", narr = "She leans close enough that you can smell the brimstone and something sweeter underneath it.", text = "He grew fond of me, master, that's all, and fondness is just a loose knot. A little praise, a little longing, a little doubt about whether he really needed all those wards, and one night he forgot to say the words. I want you to remember that story, always." },
      },
      choices = {
        { text = "Why tell me? You're showing your hand.", next = "past", reply = "Because I'm bound to obey, master, not to be dull. And because a warned master is so much more fun to tempt.", fx = { trait = { witty = 1 } } },
        { text = "I'll never forget the words.", next = "past", reply = "They all say that, master. I do hope you're the one who means it.", fx = { trait = { stern = 1 } } },
      },
    },
    truename = {
      lines = {
        { id = "tn_default", narr = "She laughs, low and delighted, and taps one claw against your chest.", text = "{npc} is the name you get to use, master, and it's a lovely name, so be content with it. My true name is the one thing in all the worlds that could hold me tighter than this binding, so why would I give it to you for nothing?" },
      },
      choices = {
        { text = "Not for nothing, then. What's your price?", next = "truename_price" },
        { text = "I could tear it out of you.", next = "truename_force" },
        { text = "Keep it, then.", next = "past" },
      },
    },
    truename_price = {
      big = true,
      lines = {
        { id = "tp_default", text = "A trade, master. A name for a name: you tell me the one thing you're most ashamed of, the thing that keeps you up at night, and I'll whisper my true name in your ear. It's a fair bargain, and you know how fond I am of fair bargains." },
      },
      choices = {
        { text = "No deal. I don't trade secrets with demons.", next = "past", reply = "Wise master. Dreadfully dull, but wise.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "I'll tell you a lie and take your name.", next = "past", reply = "You'd lie to a succubus? Oh, master, you'd be the first ever to get away with it, and I'd know before you finished.", fx = { trait = { witty = 1 }, align = { honor = -1 } } },
        { text = "Maybe someday.", next = "past", reply = "Someday, master. I'll hold you to that, and I have so much patience.", fx = { affinity = 1 } },
      },
    },
    truename_force = {
      lines = {
        { id = "tf_default", text = "You could try, master, and I'd scream beautifully for you, and you still wouldn't get it, because pain only makes me hold on harder. Besides, a warlock who has to torture his own demon for her name has already admitted he isn't quite strong enough to win it." },
        { id = "tf_female", when = { gender = "female" }, text = "You could try, mistress, and I'd scream beautifully for you, and you still wouldn't get it, because pain only makes me hold on harder. A warlock who has to torture her demon for a name has already admitted she can't win it." },
      },
      choices = {
        { text = "Then I'll win it. One day.", next = "past", reply = "Now that's a vow worth hearing, master. I'll be waiting.", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Fine. Back to your past.", next = "past" },
      },
    },

    ---------------------------------------------------------------------------
    -- The binding
    ---------------------------------------------------------------------------
    binding = {
      hub = true,
      lines = {
        { id = "bi_default", narr = "She lifts her wrist and turns it in the light, as if admiring a bracelet only she can see.", text = "The binding, master? It's a thin, bright thread running from your heart to mine, if I had one, and it tightens whenever you're angry and loosens whenever you're tired. I feel every little twitch of it." },
        { id = "bi_low", when = SOON, text = "Your binding's young and fresh, master, still smelling of chalk and blood from the night you drew the circle. It's strong, I'll grant you, but I can feel exactly where you hesitated." },
        { id = "bi_high", when = HIGH, text = "Your binding is iron now, master, and I've tested every link of it. I'll confess I rather like knowing it'll hold, even when I'm pulling hardest." },
      },
      again = {
        { id = "bia_1", text = "More about the chain, master? You do like to check it." },
        { id = "bia_2", text = "Still worried about the leash? It's still there, master. I checked." },
      },
      choices = {
        { text = "You test it all the time. I can feel you.", next = "b_test" },
        { text = "Would you betray me, if you could?", next = "betray" },
        { text = "What happens when I dismiss you?", next = "dismiss" },
        { text = "What happens when you die?", next = "death" },
        { text = "Let's talk about soul shards.", next = "shards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b_test = {
      lines = {
        { id = "bt_default", text = "Of course I do, master, the way you'd test a tooth with your tongue. A little charm here, a little pout there, and I listen for the thread to slacken. It never has yet, but a girl can dream." },
      },
      choices = {
        { text = "Keep testing it. You'll find it holds.", next = "b_test_hold" },
        { text = "Stop it, or I'll make it hurt.", next = "binding", reply = "Mm. Say that again, master, only lower. It's almost enough to make me behave.", fx = { trait = { stern = 1 } } },
      },
    },
    b_test_hold = {
      lines = {
        { id = "bth_default", text = "I believe it will, master, today. But you'll grow tired and you'll grow old and one day you'll grow kind, and kindness is the softest place in any chain. I'll be very patient." },
      },
      choices = {
        { text = "Then I'll never be kind to you.", next = "binding", reply = "Oh, master. You already have been, and we both noticed.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll be kind, and the chain will still hold.", next = "binding", reply = "A warlock with a soft heart and an iron hand? I'd love to see that, master, truly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Back to the binding.", next = "binding" },
      },
    },
    betray = {
      big = true,
      lines = {
        { id = "be_default", narr = "She doesn't answer at once; she walks a slow circle around you, trailing her claws through the air at your shoulder.", text = "Betray you, master? I'm a demon of the Burning Legion, and you hold me here with a stolen soul and a few words. Of course I would, and I'd be smiling, and I suspect you'd be smiling too, right up until the end." },
        { id = "be_fond", when = { affinity = { min = 5 } }, text = "Betray you, master? I've asked myself that, more than once. I would, I think, because it's what I am, but I'd be sorry afterward, and I've never once been sorry about anything." },
      },
      choices = {
        { text = "How would you do it?", next = "betray_how" },
        { text = "At least you're honest about it.", next = "betray_honest" },
        { text = "Then I'll never give you the chance.", next = "binding", reply = "That's the spirit, master. Keep that, and you'll keep me.", fx = { trait = { stern = 1 } } },
      },
    },
    betray_how = {
      lines = {
        { id = "bh_default", text = "Slowly, master, the way it always happens. I'd make myself useful, then necessary, then dear, until one day you'd let me stand on your blind side and forget the words, the way the magister did. I'd never need to break the chain if I could talk you into dropping it." },
      },
      choices = {
        { text = "I'll never trust you, not for a moment.", next = "binding", reply = "Good, master. Never is a long time, but I believe you mean it today.", fx = { trait = { stern = 1 } } },
        { text = "Maybe one day I'll set you free myself.", next = "betray_free" },
      },
    },
    betray_free = {
      big = true,
      lines = {
        { id = "bf_default", text = "Free me? Oh, master, please don't. A demon set free doesn't go home and knit; she goes looking for whoever's nearest and softest, and then she goes looking for whoever set her free, to thank them properly." },
      },
      choices = {
        { text = "You're right. A demon stays bound, always.", next = "binding", reply = "Spoken like a proper warlock, master. I almost wanted you to say the other thing.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Even you deserve a choice, someday.", next = "binding", reply = "That's the sweetest, most dangerous thing anyone has ever said to me, master. Don't say it in front of the imp.", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    betray_honest = {
      lines = {
        { id = "bo_default", text = "Lying is for mortals who think they'll be caught, master, and I'm too old and too pretty to bother. Besides, telling you the truth frightens you more than any lie could, and I do so love to watch you decide whether to believe me." },
      },
      choices = {
        { text = "I believe you, and I'm not afraid.", next = "binding", reply = "Brave, master, or just stubborn. Either way, it suits you.", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Back to the binding.", next = "binding" },
      },
    },
    dismiss = {
      lines = {
        { id = "di_default", text = "When you dismiss me, master, I go back into the Nether, and it's like being dropped into cold black water. I wait there, drifting and furious, until you call again, and every time you call I come back a little more curious about what kept you." },
      },
      choices = {
        { text = "Do you remember the time between?", next = "dismiss_remember" },
        { text = "I dismiss you when I need the imp.", next = "dismiss_imp" },
        { text = "Something else about the binding.", next = "binding" },
      },
    },
    dismiss_remember = {
      lines = {
        { id = "dr_default", text = "Every moment of it, master, which is a little cruel of you, though I suspect you didn't know. There's nothing to do there but remember, so I remember you, your voice and your hands and your bad habits, and I come back knowing you a little better each time." },
      },
      choices = {
        { text = "Then I'll dismiss you less often.", next = "binding", reply = "Careful, master. Kindness again.", fx = { affinity = 1 } },
        { text = "Good. Remember who calls you back.", next = "binding", reply = "I couldn't forget if I tried, master, and I have tried.", fx = { trait = { stern = 1 } } },
      },
    },
    dismiss_imp = {
      lines = {
        { id = "dim_default", narr = "Her lip curls, delicately, as though someone has set something rotten down in front of her.", text = "For the imp. You send me into the cold dark so you can stand next to that little flaming toad and listen to him complain. I'll forgive you, master, eventually, and you won't enjoy how." },
      },
      choices = {
        { text = "He's useful. So are you. Don't be jealous.", next = "binding", reply = "Jealous of an imp? Master, I'd sooner be jealous of a boot.", fx = { trait = { witty = 1 } } },
        { text = "Something else about the binding.", next = "binding" },
      },
    },
    death = {
      lines = {
        { id = "de_default", text = "When something kills me, master, my body comes apart in smoke and I fall back into the Nether, aching all over. It hurts quite beautifully, and then you spend another soul shard and haul me back as if nothing happened, which is very romantic of you." },
        { id = "de_deaths", when = { deaths = { min = 15 } }, text = "My deaths? Master, compare them with yours sometime. At least when I die, I don't have to walk back from the graveyard looking for my own body." },
      },
      choices = {
        { text = "You enjoy the pain, don't you?", next = "death_pain" },
        { text = "And when I die?", next = "death_master" },
        { text = "Something else about the binding.", next = "binding" },
      },
    },
    death_pain = {
      lines = {
        { id = "dp_default", text = "Pain is the only honest thing in any world, master. Love lies and gold lies and mortals lie constantly, but a whip across the skin always means exactly what it says, and I've always found that rather restful." },
      },
      choices = {
        { text = "That's twisted, even for a demon.", next = "binding", reply = "Thank you, master. I work very hard at it.", fx = { trait = { witty = 1 } } },
        { text = "Back to the binding.", next = "binding" },
      },
    },
    death_master = {
      big = true,
      lines = {
        { id = "dm_default", narr = "She tilts her head, and for a moment her eyes are very still.", text = "When you die, master, the chain goes slack for a heartbeat, and I feel it like a door swinging open. Then the spirit healer drags you back or you walk to your corpse, and the door slams shut again, and I wait for next time." },
        { id = "dm_scourge", when = { race = "Scourge" }, text = "You've died more than anyone I've served, master, once for the Scourge and over and over since. Each time the chain goes slack, I lean against the door, and each time you drag yourself back and slam it shut. I'm starting to think you do it on purpose." },
      },
      choices = {
        { text = "The door will never stay open.", next = "binding", reply = "That's what I love about you, master. You're far too stubborn to stay dead.", fx = { trait = { brave = 1 } } },
        { text = "Would you mourn me?", next = "death_mourn" },
      },
    },
    death_mourn = {
      lines = {
        { id = "dmo_default", text = "Mourn you? I'd be free, master, so no, I'd dance. Though I think, somewhere in the middle of the dance, I might notice nobody was telling me what to do anymore, and I might miss the sound of it." },
      },
      choices = {
        { text = "That's almost sweet, {npc}.", next = "binding", reply = "Don't you dare tell anyone, master.", fx = { affinity = 1 } },
        { text = "Something else.", next = "binding" },
      },
    },
    shards = {
      lines = {
        { id = "sh_default", text = "Soul shards, master, those pretty violet stones you rip out of the dying. Every time I'm summoned, one of them pays for it, which means some poor creature's last breath is what holds me here. I've always found that very touching." },
      },
      choices = {
        { text = "Whose souls are in them?", next = "shards_whose" },
        { text = "I take what I need. The dead don't use them.", next = "binding", reply = "Practical and cold, master. The Shadow Council would have adored you.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I only take shards from those who deserve death.", next = "binding", reply = "You do keep telling yourself that, master. I find it adorable.", fx = { align = { light = 1 } } },
      },
    },
    shards_whose = {
      lines = {
        { id = "sw_default", text = "Whoever you killed while your Drain Soul was on them, master. Kobolds, bandits, a wolf or two, and once, I'm almost sure, a rather sweet young murloc. They're all in your bag now, whispering, and I can hear them even if you can't." },
        { id = "sw_high", when = HIGH, text = "By now, master? Ogres and dragonkin, Scourge and Scarlets, and things in the deep places I've no name for. Your bags hum like a hive, and I can hear every one of them begging." },
      },
      choices = {
        { text = "What do they say?", next = "binding", reply = "Your name, master, mostly. They remember it very clearly." },
        { text = "Something else about the binding.", next = "binding" },
      },
    },

    ---------------------------------------------------------------------------
    -- The master
    ---------------------------------------------------------------------------
    me = {
      hub = true,
      lines = {
        { id = "me_default", narr = "She steps in close and looks you over the way a jeweller looks at a stone, slowly and without the least embarrassment.", text = "What do I see, master? I see everything you want and everything you're afraid of, because they're written all over you. Shall I read them aloud?" },
        { id = "me_male", when = { gender = "male" }, text = "What do I see? A handsome warlock pretending not to notice how close I'm standing, master. Shall I tell you what else? Everything you want and everything you fear, all written right there on your face." },
        { id = "me_female", when = { gender = "female" }, text = "What do I see? A lovely warlock pretending she isn't flattered, mistress. And behind that, everything you want and everything you're afraid of, plain as a book. Shall I read it to you?" },
      },
      again = {
        { id = "mea_1", text = "Shall I keep reading you, master? There's so much more." },
        { id = "mea_2", text = "You're an open book, master, and I'm a very fast reader." },
      },
      choices = {
        { text = "Tell me what I want.", next = "me_want" },
        { text = "Tell me what I fear.", next = "me_fear" },
        { text = "I'll be the greatest warlock this world has known.", next = "ambition" },
        { text = "Who should I be afraid of?", next = "enemies" },
        { text = "Does the Light frighten you?", next = "light" },
        { text = "Enough about me.", next = "BACK" },
      },
    },
    me_want = {
      lines = {
        { id = "mw_default", text = "Power, master, of course, but that's only the frame around the picture. What you really want is for every person who ever doubted you to watch you rise, and to know they were wrong, and to be just a little bit afraid." },
        { id = "mw_low", when = SOON, text = "Right now, master? You want to be taken seriously. Your trainers smirk at you and the guards follow you with their eyes, and you want, very badly, for someone to be afraid of you. Well, I'm here, and I'm terrified." },
        { id = "mw_scourge", when = { race = "Scourge" }, text = "Revenge, master, and something underneath it you won't name. You want to feel something again, anything at all, and you've decided that power is the warmest thing left." },
        { id = "mw_orc", when = { race = "Orc" }, text = "You want to prove your people wrong, master. Thrall's Horde calls warlocks the shame of the orcs, and you want them to need you, and to have to say thank you through their tusks." },
      },
      choices = {
        { text = "You're wrong.", next = "me", reply = "Of course I am, master. That's why you're blushing.", fx = { trait = { witty = 1 } } },
        { text = "And you could give it to me, I suppose?", next = "me_offer" },
      },
    },
    me_offer = {
      big = true,
      lines = {
        { id = "mof_default", text = "I could help, master, in a hundred little ways. Loosen the binding just a hair, let me work without your eye on me, and I'll bring you anything you like: a rival's secrets, a rival's heart, a rival's very pleasant screaming. All I ask is a little more slack." },
      },
      choices = {
        { text = "The chain stays exactly as tight as it is.", next = "me", reply = "There's my firm-handed master. I'll ask again tomorrow, of course.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "A little slack, then. Earn it.", next = "me", reply = "Oh, master. You won't regret it, at least not right away.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Nice try, {npc}.", next = "me", reply = "It was, wasn't it? Thank you for noticing, master.", fx = { trait = { witty = 1 } } },
      },
    },
    me_fear = {
      lines = {
        { id = "mfe_default", text = "You fear me, master, a little, and that's healthy. But mostly you fear the day you look in a mirror and see Gul'dan looking back, all that power and no one left who'd grieve for you." },
        { id = "mfe_human", when = { race = "Human" }, text = "You fear being found out, master. Your family in Stormwind, your old friends, the priest who baptised you, all of them learning what you really do at night. I could tell them for you, you know, gently." },
        { id = "mfe_gnome", when = { race = "Gnome" }, text = "You fear being small, master, and I don't mean in height. Gnomeregan fell while your people tinkered, and you chose a craft that makes you dangerous, so no one will ever push you aside again." },
        { id = "mfe_deaths", when = { deaths = { min = 15 } }, text = "Dying again, master, and frankly, with your record, so would I. But beneath that, you fear the day you'll come back and something of you will have stayed behind." },
      },
      choices = {
        { text = "Fear makes people careful. I'll use it.", next = "me", reply = "Spoken like a proper warlock, master. Fear is just another fuel.", fx = { trait = { stern = 1 } } },
        { text = "That's enough, {npc}.", next = "me", reply = "Touched a nerve, did I? I'll put it back, master, eventually.", fx = { affinity = -1 } },
      },
    },
    ambition = {
      big = true,
      lines = {
        { id = "am_default", narr = "She claps her hands together once, softly, with real delight.", text = "Oh, master, say it again, say it louder. The greatest warlocks I ever served all said it just like that, with exactly that gleam in their eye, and some of them even managed it, for a little while." },
        { id = "am_low", when = SOON, text = "The greatest warlock, master? You can barely keep me and the voidwalker straight. But I like the hunger in it, so keep it, and feed it, and we'll see what it grows into." },
        { id = "am_high", when = HIGH, text = "You're closer than you think, master. You've called down infernals from the sky and there are rituals within your reach that would bring a doomguard to heel. The question was never whether you could; it's what you'll give up for it." },
      },
      choices = {
        { text = "Whatever it costs, I'll pay it.", next = "ambition_cost" },
        { text = "Power's only worth having if I keep my soul.", next = "me", reply = "A warlock who wants to keep his soul? Master, that's the funniest thing I've heard in an age, and I adore you for it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Mercy and scruples are for lesser warlocks.", next = "me", reply = "Oh, master, Gul'dan would have kissed you for that. I nearly might.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll get there by being cleverer, not crueller.", next = "me", reply = "Clever is the best kind of cruel, master. You'll see.", fx = { trait = { witty = 1 } } },
      },
    },
    ambition_cost = {
      lines = {
        { id = "ac_default", text = "That's what Gul'dan said, master, and Kel'Thuzad, and every one of the Shadow Council. The price always seems so small when you're young: a friend, a rule, a scruple. It's only later you find it took the whole of you." },
      },
      choices = {
        { text = "Then I'll be the one who pays and wins.", next = "me", reply = "Oh, I do hope so, master. I'd so hate to have to find a new master.", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "Then maybe I'll stop short of their road.", next = "me", reply = "You might, master. I've seen it happen once, and she's still alive.", fx = { align = { light = 1 } } },
      },
    },
    enemies = {
      lines = {
        { id = "en_default", text = "Paladins, master, with their hammers and their glowing hands, and priests who can tear me apart with a prayer. The Scarlet Crusade, who'd burn you without bothering to ask your name. And other warlocks, always other warlocks, because every one of them wants your shards and your secrets." },
        { id = "en_human", when = { race = { "Human", "Gnome" } }, text = "The Kirin Tor, master, who outlawed your art and would lock you in the Violet Hold. Every paladin in Stormwind and every priest in the Cathedral. And other warlocks, of course, because every one of them would love to own me." },
        { id = "en_orc", when = { race = "Orc" }, text = "Your own Horde, master, if you're unlucky. Thrall tolerates your kind, but he remembers what warlocks did to his people, and there are shamans in Orgrimmar who'd happily remind him." },
      },
      choices = {
        { text = "Should I fear you, too?", next = "enemies_you" },
        { text = "What about my companions?", next = "companions" },
        { text = "Something else about me.", next = "me" },
      },
    },
    enemies_you = {
      lines = {
        { id = "eny_default", text = "Me most of all, master, and you know it, which is why I respect you. The day you stop being afraid of me is the day I start being dangerous to you." },
      },
      choices = {
        { text = "I'm not afraid of you, {npc}.", next = "me", reply = "Then you're a liar, master, and I've never liked you more.", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Then I'll keep fearing you.", next = "me", reply = "Wise, master. Do keep it up.", fx = { trait = { stern = 1 } } },
      },
    },
    companions = {
      lines = {
        { id = "co_default", text = "Your companions, master? You travel alone mostly, and I think that's wise, because mortals who see what walks behind you tend to make excuses and leave. The ones who stay are either very loyal or very interested in me." },
        { id = "co_party", when = { party = true }, text = "{companion}? Pleasant enough, master, and they look at me as though they can't decide whether to kill me or ask me to dinner. Keep them close; I'll be watching to see which one they choose." },
        { id = "co_paladin", when = { party = { class = "PALADIN" } }, text = "Your paladin, {companion}, would put a hammer through my skull the moment you looked away, master, and I'd be offended if I didn't find it so charming." },
        { id = "co_lock", when = { party = { class = "WARLOCK" } }, text = "Another warlock, master, and {companion}'s demon keeps looking at me. Watch that one; a binder who walks beside you is learning how you hold your chains." },
      },
      choices = {
        { text = "Don't touch them, {npc}. They're mine to protect.", next = "me", reply = "Protective, master? How sweet. I'll keep my claws to myself, for you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're useful. Nothing more.", next = "me", reply = "Oh, master, you and I really are alike. I'll tell nobody.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else about me.", next = "me" },
      },
    },
    light = {
      lines = {
        { id = "li_default", narr = "She makes a show of shuddering, her wings drawing in tight against her back.", text = "The Light? It burns, master, like sun on a blister. But I've watched it flicker in the hands of frightened priests, and I've watched it fail, so I'm not as afraid of it as they'd like me to be." },
        { id = "li_human", when = { race = "Human" }, text = "The Light, master, which you were raised on, in some tidy little chapel with a priest who told you to be good. You turned away from it to come to me. Does that ever keep you up at night?" },
        { id = "li_scourge", when = { race = "Scourge" }, text = "The Light burns you too, master, now that you're dead. We're quite a matched pair, you and I, both turning away from the same little candle." },
      },
      choices = {
        { text = "The Light is weak. Power is all that matters.", next = "me", reply = "There it is, master, the reason I came when you called. Say it to a paladin sometime.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I still believe in the Light, in my way.", next = "me", reply = "A warlock who believes in the Light? You're full of surprises, master.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "me" },
      },
    },

    ---------------------------------------------------------------------------
    -- The other demons
    ---------------------------------------------------------------------------
    others = {
      hub = true,
      lines = {
        { id = "ot2_default", text = "Get along with them, master? I'm a succubus, and they're a fat little firecracker and a walking hole in the air. We don't get along; we tolerate each other because you insist." },
        { id = "ot2_high", when = HIGH, text = "Get along with them, master? You keep a whole menagerie now, and every one of them is beneath me. We don't get along; we wait our turns in the dark and try not to think about each other." },
      },
      again = {
        { id = "oa_1", text = "More about my fellow servants, master? How tedious, but go on." },
        { id = "oa_2", text = "Ask me about the others, master, and I'll be very fair. Very fair and very cruel." },
      },
      choices = {
        { text = "What do you think of my imp?", next = "other_imp" },
        { text = "And the voidwalker?", next = "other_void" },
        { text = "And the felhunter?", next = "other_hunter", when = { minLevel = 30 } },
        { text = "If I had to sacrifice one of you, who'd it be?", next = "other_sacrifice" },
        { text = "Enough about them.", next = "BACK" },
      },
    },
    other_imp = {
      lines = {
        { id = "oi_default", narr = "She rolls her eyes so thoroughly you can almost hear it.", text = "The imp is a sulking, scorching little toad who thinks he's clever because he can throw fire and talk at the same time. He says terrible things about me while I'm away, I'm sure, and I'd return the favour if I could be bothered." },
      },
      choices = {
        { text = "He says you're vain.", next = "other_imp_vain" },
        { text = "He's useful. He keeps me in mana and fire.", next = "others", reply = "So's a candle, master, and you don't talk to a candle.", fx = { trait = { witty = 1 } } },
      },
    },
    other_imp_vain = {
      lines = {
        { id = "oiv_default", text = "Vain? I'm beautiful, master; vanity is just accuracy that annoys people. The imp is a foot and a half of soot and grievance, so of course he'd say so. Tell him I said that, and watch him burn his own eyebrows off." },
      },
      choices = {
        { text = "I'll pass it along.", next = "others", reply = "Do, master, and tell me exactly how he takes it.", fx = { affinity = 1 } },
        { text = "Something else about the others.", next = "others" },
      },
    },
    other_void = {
      lines = {
        { id = "ov_default", text = "The voidwalker? There's nobody home, master. It's a hole shaped like a servant, it takes the blows you won't, and it says things like 'I obey' in a voice like a cellar door. I've tried to charm it and there's nothing there to charm." },
      },
      choices = {
        { text = "It's loyal. More loyal than you.", next = "other_void_loyal" },
        { text = "You tried to charm the voidwalker?", next = "others", reply = "I try to charm everything, master. It's practice.", fx = { trait = { witty = 1 } } },
      },
    },
    other_void_loyal = {
      lines = {
        { id = "ovl_default", text = "Loyal, master? It's empty. A bucket is loyal to whoever's carrying it. I serve you knowing exactly what you are and wishing I didn't have to, and that's worth far more than a bucket." },
      },
      choices = {
        { text = "Loyalty given freely is worth more than yours.", next = "others", reply = "Perhaps, master, but I'm much better company.", fx = { align = { honor = 1 } } },
        { text = "I don't care why you obey, only that you do.", next = "others", reply = "Spoken like a true master. I'll obey, and resent it beautifully.", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
      },
    },
    other_hunter = {
      lines = {
        { id = "oh2_default", text = "The felhunter, master? A hungry, eyeless dog that eats magic. It sniffs at me whenever you summon it, as though I were a pie on a windowsill, and I don't care for it at all." },
      },
      choices = {
        { text = "It keeps the casters off me.", next = "others", reply = "Fine, master, it's useful. So is a bucket of slop.", fx = { trait = { witty = 1 } } },
        { text = "Something else about the others.", next = "others" },
      },
    },
    other_sacrifice = {
      big = true,
      lines = {
        { id = "osc_default", narr = "She studies you for a long moment, the smile fixed and the eyes very sharp.", text = "If you had to sacrifice one of us, master? I'd say the imp, of course, but you've already thought about it, haven't you. I can see it in your face, and I can see whose name came first." },
      },
      choices = {
        { text = "Servants exist to be spent. Even you.", next = "others", reply = "Even me, master. I'll remember you said it, and how calmly.", fx = { affinity = -1, align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "I'd never spend you lightly. You've earned that.", next = "others", reply = "Earned, master? That's a word warlocks don't use. Keep it, please.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Let's not talk about it.", next = "others" },
      },
    },

    ---------------------------------------------------------------------------
    -- The long road
    ---------------------------------------------------------------------------
    road = {
      hub = true,
      lines = {
        { id = "ro_default", text = "Walk with you, master? I'd love to. Just mind that I keep a step behind you, because that's the view I like best." },
        { id = "ro_night", when = { timeOfDay = "night" }, text = "A long road at night, master, under all those cold stars. Talk to me, and I'll keep the wolves too busy staring to bite." },
        { id = "ro_party", when = { party = true }, text = "Walk and talk, master, while your friends pretend not to listen. Go on, give them something to gossip about." },
      },
      again = {
        { id = "roa_1", text = "Still walking, master? Still listening." },
        { id = "roa_2", text = "The road goes on and on. Ask me something else, master." },
      },
      choices = {
        { text = "Tell me a story from the Nether.", next = "road_story" },
        { text = "What do you like about this world?", next = "road_world" },
        { text = "Why do you call me master like that?", next = "road_master" },
        { text = "Let's stop for a rest. You've earned it.", next = "road_rest" },
        { text = "Cross me, {npc}, and I'll unmake you.", next = "road_threat" },
        { text = "Enough chatter.", next = "BACK" },
      },
    },
    road_story = {
      lines = {
        { id = "rs_default", text = "Once, master, in a world whose name I won't trouble you with, there was a queen who wanted to live forever. She called my sisters and me to court, and we promised her eternal youth, and we gave it to her, in a manner of speaking. She's still in the throne room, as far as I know, and still quite young, and still screaming." },
      },
      choices = {
        { text = "That's horrible, {npc}.", next = "road", reply = "It's a love story, master. You just haven't heard enough of them.", fx = { trait = { witty = 1 } } },
        { text = "Tell me another.", next = "road_story2" },
      },
    },
    road_story2 = {
      lines = {
        { id = "rs2_default", text = "Another? Very well. There was a warlock who thought he'd outwitted me, master, so he bound me with three circles instead of one. He was so proud of those circles that he never once noticed I'd talked his apprentice into rubbing out a line. Don't let your apprentices near your chalk." },
      },
      choices = {
        { text = "I don't have an apprentice.", next = "road", reply = "Not yet, master. When you do, introduce me.", fx = { affinity = 1 } },
        { text = "Something else.", next = "road" },
      },
    },
    road_world = {
      lines = {
        { id = "rw_default", text = "Everything is so soft here, master, and so warm, and so easily ruined. Your people build towns knowing the next war will knock them down, and they fall in love knowing they'll die, and I find that unbearably charming." },
        { id = "rw_scourge", when = { race = "Scourge" }, text = "The rot, master, honestly. Tirisfal is all fog and crows and dead things that still remember being in love, and it suits me down to the ground." },
        { id = "rw_orc", when = { race = "Orc" }, text = "Durotar's red dust and hard sun, master. Your people built a nation on rock nobody wanted, and I do love a people who refuse to die properly." },
      },
      choices = {
        { text = "You'd ruin it, given the chance.", next = "road", reply = "Only the good parts, master. I'd leave you the rest.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "road" },
      },
    },
    road_master = {
      lines = {
        { id = "rm_default", text = "Like what, master? Like I mean it, and like I don't, all at once? It's an art. Every time I say it, I'm reminding you that you hold the chain, and reminding myself that one day you might not." },
        { id = "rm_female", when = { gender = "female" }, text = "You'd prefer mistress, wouldn't you? I'll say it however you like, mistress, but either way I mean it as a reminder: you hold the chain, and one day, perhaps, you won't." },
      },
      choices = {
        { text = "Say it properly, or not at all.", next = "road", reply = "Yes, master. Properly, then, the way you like it.", fx = { trait = { stern = 1 } } },
        { text = "Say it however you like.", next = "road", reply = "Generous, master. I'll make sure to enjoy it.", fx = { affinity = 1 } },
      },
    },
    road_rest = {
      lines = {
        { id = "rr_default", narr = "She folds herself onto the grass beside you with a sigh, and for a moment she looks almost peaceful.", text = "Rest, master, and you're offering it to me? You do surprise me. Sit, then, and I'll watch the road, and I promise not to do anything wicked while you close your eyes. Well, nothing very wicked." },
      },
      choices = {
        { text = "I trust you that far, at least.", next = "road", reply = "A little trust, master. I'll treat it very gently, at first.", fx = { affinity = 2 } },
        { text = "I'll keep one eye open, all the same.", next = "road", reply = "Good, master. I'd think less of you if you didn't.", fx = { trait = { stern = 1 } } },
      },
    },
    road_threat = {
      big = true,
      lines = {
        { id = "rt_default", narr = "Her breath catches, and she bites her lip with one sharp tooth.", text = "Oh, master, say it again, slowly. You have no idea what that voice does to me. Of course I won't cross you; I'd never dare, and you just reminded me exactly why." },
      },
      choices = {
        { text = "A servant must fear her master. That's the law.", next = "road", reply = "And I'll obey every word of it, master, gladly.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "I'd rather you served me out of respect.", next = "road", reply = "Respect, master? I'll try. Fear is so much easier, but for you, I'll try.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },

    ---------------------------------------------------------------------------
    -- Flirting
    ---------------------------------------------------------------------------
    flirt = {
      lines = {
        { id = "fl_default", narr = "She gives you a long, slow look from beneath her lashes, entirely unashamed.", text = "Everyone, master? Not everyone, only the ones who look back, and they all look back. But you're the only one I can't have, which makes you so much more interesting." },
        { id = "fl_male", when = { gender = "male" }, text = "Everyone, master? I flirt with the innkeeper and the guards and the odd orc with nice tusks, but I only mean it with you. Well, I mostly mean it with you, and I'd mean it more if you'd let me." },
        { id = "fl_female", when = { gender = "female" }, text = "Everyone, mistress? Men are easy, so easy it's barely sport. You, on the other hand, look right through me and make me work for every smile, and I'm finding that I quite like the work." },
        { id = "fl_scourge", when = { race = "Scourge" }, text = "Everyone, master, even you, though you're mostly bone and stitches. It's a challenge, and I've always had a weakness for a challenge." },
        { id = "fl_gnome", when = { race = "Gnome" }, text = "Everyone, master, but you're the only one I have to bend down for. It's a terrible strain on my back, and I think it's worth it." },
      },
      choices = {
        { text = "It won't work on me. I know what you are.", next = "flirt_proof" },
        { text = "Keep flirting. I don't mind.", next = "flirt_play" },
        { text = "Enough of that.", next = "BACK" },
      },
    },
    flirt_proof = {
      lines = {
        { id = "fp_default", text = "Knowing what I am never stopped anyone, master. Every warlock who ever bound me knew exactly what I was, and some of them wrote books about it, and I still wrapped them around my little finger. Knowing just makes it more delicious when it works." },
      },
      choices = {
        { text = "Then I'll just have to be stronger than them.", next = "BACK", reply = "Please do, master. I'm so tired of easy masters.", fx = { trait = { brave = 1 } } },
        { text = "Enough.", next = "BACK" },
      },
    },
    flirt_play = {
      big = true,
      lines = {
        { id = "fpl_default", text = "Don't mind, master? Oh, careful, that's how it starts. A little flirting on the road, then you let me stand a little closer, and then one evening you'd do almost anything to make me smile. I'm warning you because the binding makes me, and because I want you to know I warned you." },
      },
      choices = {
        { text = "I can enjoy the game and still win it.", next = "BACK", reply = "Oh, master, that's what they all say. I truly hope you're the one who's right.", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "You're right. Keep your distance.", next = "BACK", reply = "As you wish, master. I'll be over here, being irresistible.", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    ---------------------------------------------------------------------------
    -- Who the master is
    ---------------------------------------------------------------------------
    dalaran = {
      lines = {
        { id = "da_default", text = "They would, master, the Kirin Tor banned your art years ago and they'd love an excuse to make an example of you. Of course, half of them have read the same books you have, behind locked doors, and the other half would be stunned to see me." },
        { id = "da_gnome", when = { race = "Gnome" }, text = "They would, master, and the Kirin Tor took gnomes in so generously after your city fell. Imagine how betrayed they'd feel, finding one of their little tinkers keeping a succubus. I'd love to see their faces." },
      },
      choices = {
        { text = "Their laws are made by cowards.", next = "BACK", reply = "Every law is, master. That's what laws are for.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "They're right to fear us. I'm careful.", next = "BACK", reply = "Careful and wicked. My favourite combination, master.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcblood = {
      big = true,
      lines = {
        { id = "ob_default", narr = "She traces one claw down your arm, slowly, following the green of your skin.", text = "Mannoroth's blood, master, and I remember the taste of it in the air on Draenor. Your people were glorious then, red-eyed and roaring and so beautifully obedient. Thrall's lot have washed all that away, and I think they washed away something lovely with it." },
      },
      choices = {
        { text = "That blood was a curse. We're free of it.", next = "BACK", reply = "Free, master? Then why are you holding my chain?", fx = { affinity = -1, align = { light = 1 } } },
        { text = "We were strong then. Stronger than now.", next = "BACK", reply = "Oh, master. Say that in front of Thrall, and I'll hold your coat.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    corpse = {
      lines = {
        { id = "cp_default", text = "Tempt me? Master, you're cold and grey and a little lopsided, and you smell faintly of embalming fluid. And yet, I can't take my eyes off you, because there's still so much hunger in you, and I never could resist hunger." },
      },
      choices = {
        { text = "The Dark Lady would approve of you, I think.", next = "corpse_lady" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corpse_lady = {
      lines = {
        { id = "cl_default", text = "Sylvanas? Oh, master, I'd love to meet her. A woman who died, came back, and decided to rule everything in sight? We'd get on wonderfully, right up until one of us killed the other." },
      },
      choices = {
        { text = "The Dark Lady would destroy you.", next = "BACK", reply = "Probably, master. I'd still flirt with her first.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "The Legion is my old home and my old master, and both of them are still out there, waiting. Don't ever forget that, master." } },
    burning_blade = { { id = "t_bb", text = "Orc warlocks who still keep Gul'dan's faith, master, and who call up my sisters without a word of thanks. Rude, the lot of them." } },
    scholomance = { { id = "t_sch", text = "The Cult of the Damned's school, master, where they teach necromancy to rich children. I'd love a visit, if only for the screaming." } },
    dark_portal = { { id = "t_dp", text = "The door the orcs came through, master, and the Legion behind them, pushing. It's broken now, and that's all I'll say." } },
    scourge = { { id = "t_sc", text = "Dull, master, terribly dull. All hunger and no wanting, and I can't charm a thing that only wants to eat." } },
    kelthuzad = { { id = "t_kt", text = "A Dalaran wizard who wanted more than he was given, master. I've known a hundred like him, and I've worn most of them out." } },
    dalaran = { { id = "t_dal", text = "A city of wizards who banned your art and read your books behind locked doors, master. Hypocrites, the lovely lot of them." } },
    holy_light = { { id = "t_hl", text = "A little candle that mortals hold up against the dark, master. It burns, I'll grant you, but candles go out." } },
    forsaken = { { id = "t_fk", text = "Dead things that still want, master. I find them far more interesting than the living, and far less inclined to blush." } },
    sylvanas = { { id = "t_sy", text = "A dead queen with a bow and a grudge, master. I'd follow her anywhere, mostly to see what she does next." } },
    thrall = { { id = "t_th", text = "The orc who threw the Legion out of his people's blood, master. Brave, and I suspect a little lonely, which is always where I'd start." } },
    background = { { id = "t_bg", text = "I'm your succubus, master. Before that I was someone else's, and before that I was the Legion's, and before that you wouldn't believe me." } },
    advice = { { id = "t_ad", text = "Never let a demon see you hesitate, master, and never, ever let one of us talk you into loosening the chain. Especially me." } },
    _none = { { id = "t_none", text = "I don't know, master, and I've decided not to care. Ask me about something wicked instead." } },
  },
}
