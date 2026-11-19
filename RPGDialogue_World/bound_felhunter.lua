-- The warlock's own felhunter (role "my_felhunter"). Felhunters don't speak, so here the warlock
-- does the talking: orders, praise, scolding, and the things a binder only says to a hound that
-- can't repeat them. Every NPC line is the hound's reaction, written as narration in asterisks.
-- Lore: Classic only. The Legion's mage-hunters, Strahad Farsan and the Tome of the Cabal,
-- Devour Magic, Spell Lock, soul shards, Dalaran's ban, Gul'dan, the Shadow Council, the
-- Burning Blade, Scholomance, the Forsaken. Nothing later.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Pool {
  id = "my_felhunter", role = "my_felhunter",
  greetings = {
    { id = "g_default", text = "*{npc} pads to your side and swings its tendrils toward you, tasting the air around your hands before it will settle.*" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "*In the dark, {npc}'s tendrils give off a faint green shimmer, and it presses its heavy head against your knee without being told.*" },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "*{npc} is sitting exactly where you left it, its blind face turned from the sunrise and its tendrils curled tight against its skull, like a dog that doesn't trust the morning.*" },
    { id = "g_back", when = { metBefore = true }, text = "*{npc} lifts its head the moment you turn toward it, and its spiked tail sweeps twice across the ground.*" },
    { id = "g_often", when = { timesTalked = 6 }, text = "*{npc} sits down before you've said a word, and settles its haunches with the patience of a hound that has heard you talk for a long while before.*" },
    { id = "g_dead", when = { deaths = 15 }, text = "*{npc} noses you over from boots to collar, slowly and thoroughly, the way it always does now after you've come back from the dead.*" },
    { id = "g_drunk", when = { drunk = true }, text = "*{npc} gets one whiff of your breath, sneezes violently, and backs off a step with its feelers drawn tight against its skull.*" },
    { id = "g_party", when = { party = { class = "MAGE" } }, text = "*{npc} keeps one feeler stretched toward the mage in your party at all times, quivering, and a thread of green drool hangs from its jaw like a hound in sight of a roast.*" },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "*{npc} noses at the gap in your ribs where the Plague left you open, then settles down, satisfied that whatever keeps you walking hasn't gone anywhere.*" },
  },
  tier = "quest",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "*{npc} sits back on its haunches with its tendrils turned toward your face, swaying slowly, and waits to see whether you mean to give an order or simply to talk.*" },
        { id = "h_low", when = { maxLevel = 35 }, text = "*{npc} is still new to you, and its feelers keep creeping toward your hands, testing the binding like a dog worrying at a new collar, but it waits all the same.*" },
        { id = "h_high", when = { minLevel = 50 }, text = "*{npc} lies down at your feet with a long, rattling sigh, as easy with you now as a hound that has followed one master through a great many bad places.*" },
        { id = "h_dusk", when = { timeOfDay = "dusk" }, text = "*As the light goes, {npc} lifts its head and tastes the wind from the horizon, then turns back to you with its whole attention.*" },
        { id = "h_gnome", when = { race = "Gnome" }, text = "*{npc} lowers its great head until its tendrils hang level with your face, and its tail starts sweeping back and forth.*" },
      },
      again = {
        { id = "a_again", text = "*{npc} is still sitting there, still listening, its feelers hanging loose and easy.*" },
        { id = "a_again2", text = "*{npc} scratches behind one spiked shoulder with a hind leg, then turns its head back up to you and waits.*" },
        { id = "a_again3", text = "*{npc} yawns, showing far too many teeth, and waits for you to go on.*" },
      },
      choices = {
        { text = "Heel, {npc}. Let me have a look at you.", next = "inspect" },
        { text = "Good hunting today. You earned your keep.", next = "praise" },
        { text = "You ate my Shadow Bolt earlier, you greedy mutt.", next = "scold" },
        { text = "Do you remember the day I bound you?", next = "binding" },
        { text = "I need to talk, and you're the only one who'll listen.", next = "confide" },
        { text = "What do you make of the others I could summon?", next = "others" },
        { text = "Do you smell anything out there? Go on, then, hunt.", next = "track" },
        { text = "Here, sniff this soul shard. Don't eat it.", next = "shard" },
        { text = "We're both things this world would rather saw dead.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "My people drank the blood that made your masters strong.", next = "xorc", when = { race = "Orc" } },
        { text = "Dalaran would see us both burned at the stake, you know.", next = "xhuman", when = { race = "Human" } },
        { text = "Gnomeregan's engineers would love to take you apart.", next = "xgnome", when = { race = "Gnome" } },
        { text = "That's all for now, so get back on watch.", next = "END" },
      },
    },

    ------------------------------------------------------------------
    -- Looking it over.
    ------------------------------------------------------------------
    inspect = {
      narr = "You run a hand down the hound's flank, and the hide is hot and dry and ridged like old leather.",
      lines = {
        { id = "in_default", text = "*{npc} stands still and lets you look, though its feelers keep twitching toward the shards in your bag, and one hind leg is held a little off the ground.*" },
        { id = "in_high", when = { minLevel = 50 }, text = "*{npc} stands for inspection like an old soldier, and you can count the scars on its hide, every one of them from a fight you started.*" },
      },
      choices = {
        { text = "Who did that to your leg, boy?", next = "inspect_leg" },
        { text = "What are those tendrils of yours actually tasting?", next = "inspect_tendrils" },
        { text = "You're a hideous thing, and I'm fond of you.", next = "BACK", reply = "*{npc} snorts a puff of sulphur at you and leans its full weight against your leg, rumbling, and nearly knocks you over.*", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_leg = {
      lines = {
        { id = "il_default", text = "*{npc} flinches when you touch the joint, where an old burn has healed white and clean, the kind holy fire leaves, and a growl starts somewhere deep in its chest.*" },
      },
      choices = {
        { text = "That priest is dead now. I made sure of it.", next = "inspect_vengeance" },
        { text = "Hold still. I'll mend it as best I can.", next = "BACK", reply = "*{npc} whines once while you work, then curls a cold, sticky feeler around your wrist and holds on until you've finished.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_vengeance = {
      big = true,
      lines = {
        { id = "iv_default", text = "*{npc}'s tendrils go flat and its tail goes still, and it keeps its eyeless face turned on you for a long time, the way a dog studies a hand it isn't sure of.*" },
      },
      choices = {
        { text = "Nobody harms what's mine. Nobody.", next = "BACK", reply = "*{npc} rumbles deep in its chest and shoves its head under your hand, the way a hound does with the leader of its pack.*", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Truthfully, he was in my way. Your leg was an excuse.", next = "BACK", reply = "*{npc} huffs and turns its head away, and it keeps it turned away until you take your hand off its leg.*", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_tendrils = {
      lines = {
        { id = "it_default", text = "*{npc} lifts its feelers one by one and drifts them slowly through the air toward you, and where they pass, your skin prickles the way it does just before you cast.*" },
        { id = "it_caster", when = { party = { class = { "MAGE", "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } }, text = "*{npc}'s tendrils sweep past you and stretch toward your companions instead, quivering and dripping, until you click your tongue and they snap back.*" },
      },
      choices = {
        { text = "So you smell the magic in a man, not the man.", next = "inspect_magic" },
        { text = "Don't you dare sniff at my companions like that.", next = "BACK", reply = "*{npc} draws its tendrils in tight and lies flat with its chin on its paws, the very picture of innocence, and fools nobody.*", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_magic = {
      lines = {
        { id = "im_default", text = "*{npc} turns its feelers on you and holds them there, and you feel them pass over the fel in your blood, the threads of your bindings, and the cold knot where your shards hang, one after another.*" },
      },
      choices = {
        { text = "And what do you smell, when you taste me like that?", next = "inspect_ledger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_ledger = {
      big = true,
      lines = {
        { id = "ile_default", text = "*{npc} holds still a while longer, then turns its back on you, walks three paces off and lies down facing away, with its tendrils drawn in tight like a hound that has caught a bad smell on its master.*" },
        { id = "ile_light", when = { alignment = { axis = "light", max = -5 } }, text = "*{npc} doesn't draw back at all. It sits closer instead, tail sweeping, with the easy contentment of a hound lying beside a fire it knows very well.*" },
      },
      choices = {
        { text = "Fine. I don't need a hound's good opinion.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Come back here, please.", next = "BACK", reply = "*After a long moment {npc} gets up, pads back and lies down against your boots, and its weight there is warmer than you expected.*", fx = { affinity = 1 } },
      },
    },

    ------------------------------------------------------------------
    -- Praise.
    ------------------------------------------------------------------
    praise = {
      lines = {
        { id = "pr_default", text = "*{npc}'s tail sweeps back and forth and it trots a tight circle around you, rumbling, like a hunting hound after a good day in the field.*" },
        { id = "pr_dead", when = { deaths = 30 }, text = "*{npc}'s tail sweeps, but it also noses pointedly at the spot on your chest where the last killing blow landed, and keeps nosing it until you push its head away.*" },
      },
      choices = {
        { text = "That Spell Lock on the shaman was perfect, you know.", next = "praise_lock" },
        { text = "Do you want a treat? Here's a sip of mana.", next = "praise_treat" },
        { text = "Don't let it go to your head; you're only a tool.", next = "praise_tool" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_lock = {
      lines = {
        { id = "pl_default", text = "*{npc} snaps its jaws shut on nothing, very pleased with itself, mimicking the moment it cut the shaman's chant off mid-word and left him gaping like a landed fish.*" },
      },
      choices = {
        { text = "That's what the Legion built you for, isn't it?", next = "praise_legion" },
        { text = "Do it again next time and you'll eat well.", next = "BACK", reply = "*{npc}'s tendrils stretch and quiver, and a thread of glowing drool runs off its jaw and sizzles in the grass.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_legion = {
      lines = {
        { id = "pleg_default", text = "*{npc} goes very still at the word Legion, and the spines along its back rise, and its tendrils point, all together, at something far beyond the sky.*" },
      },
      choices = {
        { text = "You hunted wizards for them, on other worlds.", next = "praise_worlds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_worlds = {
      big = true,
      lines = {
        { id = "pw_default", text = "*{npc} lowers its head and growls, long and soft, and you can't help picturing it: towers burning under strange skies, and the Legion's hounds loosed in packs on every mage who stood against them.*" },
      },
      choices = {
        { text = "Now you hunt for me. That's a better master.", next = "BACK", reply = "*{npc} turns its head aside and holds it there a while, and then, grudgingly, its tail begins to sweep.*", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "I wonder what it would take to hunt like that.", next = "BACK", reply = "*{npc}'s tendrils flare bright, and it pushes its snout into your palm, drooling and eager, which is not the reassurance you were hoping for.*", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_treat = {
      lines = {
        { id = "pt_default", text = "*{npc} laps at the mana potion you tip out for it, and the blue light runs down its throat and glows through its hide for a moment like a candle behind parchment.*" },
      },
      choices = {
        { text = "Easy. That cost me two silver, you glutton.", next = "BACK", reply = "*{npc} licks the empty bottle clean anyway, then licks your fingers, and then tries hopefully to lick your bag.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_tool = {
      lines = {
        { id = "ptl_default", text = "*{npc}'s tail stops mid-sweep, and it sits down very upright, the way a soldier stands when an officer has decided to be unpleasant.*" },
      },
      choices = {
        { text = "A good tool deserves care, all the same.", next = "BACK", reply = "*{npc}'s tail starts up again, slowly, as if it's prepared to accept that as an apology.*", fx = { align = { order = 1 } } },
        { text = "Tools that grow proud get broken.", next = "BACK", reply = "*{npc} doesn't growl, but it doesn't turn its head to you again for a long while, and its tendrils stay curled tight.*", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Scolding.
    ------------------------------------------------------------------
    scold = {
      lines = {
        { id = "sc_default", text = "*{npc} lowers its head, but it doesn't look sorry. It licks its chops, and a few sparks of your own shadow magic drift out from between its teeth.*" },
      },
      choices = {
        { text = "That spell was meant for the enemy, not your supper.", next = "scold_supper" },
        { text = "Sit. You're a bad hound, a very bad hound.", next = "scold_bad" },
        { text = "Do you even know my magic from theirs?", next = "scold_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_supper = {
      lines = {
        { id = "ss_default", text = "*{npc} wanders to the place where the bolt went astray and noses at the scorched earth, then slinks back to you with its head low, though it's still licking its lips.*" },
      },
      choices = {
        { text = "You'll go hungry tonight for that.", next = "BACK", reply = "*{npc} whines, low and piteous, and lies down with its chin on its paws in the most theatrical sulk you've ever seen from a demon.*", fx = { trait = { stern = 1 } } },
        { text = "Fine, fine. I suppose it smelled delicious.", next = "BACK", reply = "*{npc} perks up at once, and its tail sweeps hard enough to shake its whole back end.*", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_bad = {
      lines = {
        { id = "sb_default", text = "*{npc} sits, slowly, and keeps its blind face turned up to yours the whole way down, the way a wolf sits for a man it hasn't quite decided to obey.*" },
      },
      choices = {
        { text = "Down, I said, all the way down.", next = "scold_down" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_down = {
      big = true,
      narr = "You feel the binding pull taut between you, the way a rope does when something heavy leans on it.",
      lines = {
        { id = "sd_default", text = "*For one long breath {npc} doesn't move, and the binding hums in your chest like a plucked string. Then it lies flat, belly to the dirt, and lets out a long, hot breath that smells of brimstone.*" },
      },
      choices = {
        { text = "Every demon tests its chain. Never test mine.", next = "BACK", reply = "*{npc} keeps its head down, and when you finally release it, it stays down a heartbeat longer than it needs to.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "I'd test my chain too, if I wore one.", next = "BACK", reply = "*{npc} lifts its head at your tone, and its tail gives one slow sweep, and for a moment the two of you are conspirators.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_know = {
      lines = {
        { id = "sk_default", text = "*{npc} sniffs at your hands, then at the air where the enemy stood, and then at your hands again, and its tendrils droop in confusion before it licks your fingers anyway.*" },
      },
      choices = {
        { text = "You're a hound, not a scholar. I forget that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- The binding.
    ------------------------------------------------------------------
    binding = {
      lines = {
        { id = "bi_default", text = "*The spines along {npc}'s back lift, and it scratches once at the ground, dragging a curve through the dirt like the circle you drew to hold it the first time it came through.*" },
        { id = "bi_low", when = { maxLevel = 35 }, text = "*{npc} glances down at the chalk dust still caught in the claws of its forepaws, because the binding wasn't long ago at all, and it still flinches when you raise your hand to cast.*" },
      },
      choices = {
        { text = "Strahad Farsan made me earn you, page by page.", next = "binding_tome" },
        { text = "You fought the circle like nothing I'd ever bound.", next = "binding_fight" },
        { text = "Do you hate me for it?", next = "binding_hate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_tome = {
      lines = {
        { id = "bt_default", text = "*{npc} lies still while you talk about the Tome of the Cabal and its torn-out pages and the long road chasing them, and when you mention Ratchet it sneezes, like a dog at the smell of brine.*" },
      },
      choices = {
        { text = "Farsan called his students acolytes, as if he were a priest.", next = "binding_farsan" },
        { text = "Every page I found, I wondered what I'd summon.", next = "binding_wonder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_farsan = {
      lines = {
        { id = "bf_default", text = "*{npc} curls its lip off its teeth, and you remember it straining toward Farsan's grimoires the whole time you stood in his house.*" },
      },
      choices = {
        { text = "You'd have eaten his whole library, given the chance.", next = "BACK", reply = "*{npc} licks its chops, slowly and thoroughly, like a hound dreaming of a butcher's shop.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_wonder = {
      lines = {
        { id = "bw_default", text = "*{npc} nudges your hand with its snout and then holds still under it, heavy and patient, and makes no move to go anywhere at all.*" },
      },
      choices = {
        { text = "I got a hound, and I could have done far worse.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_fight = {
      lines = {
        { id = "bfi_default", text = "*{npc} gives a short, rough bark, and peels back its lip to show you the gap in its teeth where the circle's edge burned it.*" },
      },
      choices = {
        { text = "You nearly ate the spell holding you. I was terrified.", next = "binding_terror" },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_terror = {
      big = true,
      narr = "Your hand goes to the scar on your own palm without your meaning it to.",
      lines = {
        { id = "bte_default", text = "*{npc} noses at your hand, and at the scar, and then sets its chin down on your knee and leaves it there, heavy and warm, for as long as you keep your hand on its head.*" },
      },
      choices = {
        { text = "Fear is how a warlock learns. I'm glad I learned it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_hate = {
      big = true,
      lines = {
        { id = "bh_default", text = "*{npc} doesn't move, and it doesn't turn away either; its eyeless face stays on you, and you realise you've never once been able to tell what it thinks of you.*" },
      },
      choices = {
        { text = "Hate me if you like. You'll still obey.", next = "BACK", reply = "*{npc} rumbles low, with no growl in it and no warmth either, and lies down where it is.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "I hope you don't. I've tried to treat you fairly.", next = "BACK", reply = "*{npc} huffs softly, and its tail sweeps once across the dirt, and you decide that will have to do.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Confiding.
    ------------------------------------------------------------------
    confide = {
      narr = "You sit down on the nearest stone, and the hound comes and sits beside you without being asked.",
      lines = {
        { id = "co_default", text = "*{npc} settles down at your side and turns one feeler toward you, the way another dog might cock an ear, and waits.*" },
        { id = "co_night", when = { timeOfDay = "night" }, text = "*{npc} lies down beside you in the dark, close enough that you can feel its heat, and keeps its tendrils turned to the shadows while you talk.*" },
      },
      choices = {
        { text = "Sometimes I wonder what I'm becoming.", next = "confide_becoming" },
        { text = "I want real power. Is that so wrong?", next = "confide_power" },
        { text = "Everyone I meet looks at me like I'm the Plague.", next = "confide_lonely" },
        { text = "I'm afraid of what waits when I finally die.", next = "confide_death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_becoming = {
      lines = {
        { id = "cb_default", text = "*{npc} noses at your fingertips, where the skin has gone a little grey from handling shards, and then licks them, slowly and carefully, the way a dog licks a cut.*" },
      },
      choices = {
        { text = "Gul'dan started out as a frightened shaman, they say.", next = "confide_guldan" },
        { text = "I'm still me, aren't I?", next = "confide_still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_guldan = {
      big = true,
      lines = {
        { id = "cg_default", text = "*The spines on {npc}'s back rise at the name, and it gives a low, ugly growl into the dark, the way a hound growls at a house where something bad once happened.*" },
      },
      choices = {
        { text = "I'll never sell my people the way he sold his.", next = "BACK", reply = "*{npc}'s spines settle slowly, and it leans its whole weight against you and stays there.*", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "He was a fool, but he wasn't wrong about power.", next = "BACK", reply = "*{npc} stops growling and turns its head to you instead, very still, and its tail doesn't move at all.*", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_still = {
      lines = {
        { id = "cst_default", text = "*{npc} sniffs you over from head to foot, taking its time about it, and then sneezes and sits back down, apparently satisfied that you smell the same as yesterday.*" },
        { id = "cst_dark", when = { alignment = { axis = "light", max = -10 } }, text = "*{npc} sniffs you over for a long time, and pauses at your chest, and then sits down a little closer than before, like a hound settling beside one of its own.*" },
      },
      choices = {
        { text = "Thank you. That helps more than it should.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_power = {
      lines = {
        { id = "cp_default", text = "*{npc}'s tendrils stiffen and stretch, quivering, and green drool gathers at its jaw, and for a moment you can feel its hunger through the binding like a second pulse.*" },
        { id = "cp_high", when = { minLevel = 55 }, text = "*{npc} turns its tendrils east, toward the Plaguelands and the dark halls of Scholomance, and then back to you, where your ambitions have been leading you both.*" },
      },
      choices = {
        { text = "Power to protect the people I care about.", next = "confide_protect" },
        { text = "Power so no one ever looks down on me again.", next = "confide_contempt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_protect = {
      big = true,
      lines = {
        { id = "cpr_default", text = "*{npc} keeps its eyeless face turned on you a long while, and it occurs to you that every warlock who ever fell into the Legion's hands probably said the same thing to a hound just like this one.*" },
      },
      choices = {
        { text = "Then I'll be the one who means it.", next = "BACK", reply = "*{npc} huffs, hot and smoky, and settles down to wait and see, which is all a hound can do.*", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Fine, power for its own sake, then, and I'll own it.", next = "BACK", reply = "*{npc}'s tail sweeps once, slow and approving, and that frightens you more than any growl would have.*", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_contempt = {
      lines = {
        { id = "ccn_default", text = "*{npc} snaps at a moth that strays too close to your face, catches it and swallows it, and then licks its chops at you, tail sweeping slowly.*" },
      },
      choices = {
        { text = "Ha. You're a terrible influence, do you know that?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_lonely = {
      lines = {
        { id = "cl_default", text = "*{npc} gets up, walks around you once, and lies down again on your other side, so that whatever is out there in the dark has to come past it first.*" },
        { id = "cl_forsaken", when = { race = "Scourge" }, text = "*{npc} sniffs at your cold hands, and doesn't seem to mind that they're cold, and lies down across your feet like a warm, smoking rug.*" },
      },
      choices = {
        { text = "The guards make the sign against evil when I pass.", next = "confide_guards" },
        { text = "You don't care what I've done, do you?", next = "BACK", reply = "*{npc} rolls onto its side and offers you its belly, which is scaled and smoking and very hard to scratch, but you do your best.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_guards = {
      big = true,
      lines = {
        { id = "cgu_default", text = "*{npc} turns its head toward the nearest town and lets out a single low growl, then swings back to you with its tendrils pricked, waiting to be sent.*" },
      },
      choices = {
        { text = "They're right to fear us. Fear keeps the peace.", next = "BACK", reply = "*{npc} settles its chin on its paws, content with any arrangement that keeps it fed.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Let them sneer. I'll go where I please.", next = "BACK", reply = "*{npc} stands up at once, tail lashing, ready to go wherever that turns out to be.*", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_death = {
      lines = {
        { id = "cd_default", text = "*{npc} stops moving altogether, and its feelers go limp, and in the quiet you can hear the soul shards in your bag clicking softly against each other like teeth.*" },
        { id = "cd_dead", when = { deaths = 20 }, text = "*{npc} noses you over the way it always does after the spirit healers send you back, slowly, chest and hands and face, before it will lie down again.*" },
      },
      choices = {
        { text = "I've trapped so many souls. Who traps mine?", next = "confide_souls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_souls = {
      big = true,
      narr = "The bag at your hip feels heavier than it did a moment ago.",
      lines = {
        { id = "cso_default", text = "*{npc} noses the bag of shards and whines, very softly, and then it does something it has never done before: it puts one heavy paw on your boot and leaves it there, as if to pin you to the ground.*" },
      },
      choices = {
        { text = "Every soul I took deserved it. I'll answer for none.", next = "BACK", reply = "*{npc} doesn't lift its paw, and you can't tell whether it agrees with you or is simply holding on.*", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I'll answer for them, when the time comes.", next = "BACK", reply = "*{npc} lifts its paw at last and licks your hand once, the way a hound licks a wound.*", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- The other demons.
    ------------------------------------------------------------------
    others = {
      lines = {
        { id = "ot_default", text = "*{npc}'s tendrils flatten at once, and it plants itself squarely in front of you, like a hound blocking a rival from the hearth.*" },
      },
      choices = {
        { text = "The imp, then. You can't stand the imp.", next = "others_imp" },
        { text = "The voidwalker never complains. You could learn from it.", next = "others_void" },
        { text = "And the succubus? You hide behind me when she's out.", next = "others_succ" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_imp = {
      lines = {
        { id = "oi_default", text = "*{npc} growls, low and long, and its feelers twitch toward the empty air beside you. You remember the time it devoured the imp's Firebolt mid-air, and the imp's shrieking, which went on for an hour.*" },
      },
      choices = {
        { text = "You are not allowed to eat the imp, not even a bit.", next = "BACK", reply = "*{npc} sighs heavily through its nose, as though you have denied it the one small joy in an otherwise hard life.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_void = {
      lines = {
        { id = "ov_default", text = "*{npc} sniffs at the shadow under your feet, where the voidwalker usually waits, finds nothing there worth eating, and sneezes on it with flat disdain.*" },
      },
      choices = {
        { text = "At least it doesn't eat my spells.", next = "BACK", reply = "*{npc} licks its lips pointedly and turns its head the other way.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_succ = {
      lines = {
        { id = "os_default", text = "*{npc} doesn't growl at the mention of her. It goes quiet instead, and presses close against your legs with its tendrils drawn tight, facing the place where she usually stands, the way a dog watches a cat it has lost to before.*" },
      },
      choices = {
        { text = "Smart hound. She frightens me too, sometimes.", next = "others_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_fear = {
      big = true,
      lines = {
        { id = "of_default", text = "*{npc} lifts its head to you for a long moment, and then puts itself between you and the empty place where she would stand, and stays there.*" },
      },
      choices = {
        { text = "A warlock rules by fear. Mine and theirs.", next = "BACK", reply = "*{npc} doesn't move from its post, but its tail goes still, and its spines lift a little along its back.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "I keep every bargain I make with them, and that's my shield.", next = "BACK", reply = "*{npc} grunts and sits back down at last, though it stays between you and that empty place.*", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Tracking.
    ------------------------------------------------------------------
    track = {
      lines = {
        { id = "tr_default", text = "*{npc} lifts its head and sweeps its tendrils in a slow arc, then stops dead and points, quivering, toward something a long way off that you can't see at all.*" },
        { id = "tr_night", when = { timeOfDay = "night" }, text = "*{npc}'s tendrils light up faintly as they sweep the dark, and they all swing the same way at once, toward a glow on the hills that might be a campfire or might be something worse.*" },
      },
      choices = {
        { text = "Is it a mage? How strong is the magic on them?", next = "track_mage" },
        { text = "Is that fel you're smelling? Is another warlock out there?", next = "track_lock" },
        { text = "Leave it. We're not hunting tonight.", next = "BACK", reply = "*{npc} lowers its tendrils with a whine and sits, though one of them keeps creeping back toward the horizon whenever you turn away.*", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_mage = {
      lines = {
        { id = "tm_default", text = "*{npc} drools, a long string of green spit that hisses where it lands, and its whole body trembles from snout to tail, which tells you all you need to know about the size of the meal.*" },
      },
      choices = {
        { text = "A Kirin Tor mage, out here? They'd hang us both.", next = "track_kirin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_kirin = {
      big = true,
      lines = {
        { id = "tk_default", text = "*{npc} turns to you, tense from snout to tail and waiting for the word, as ready as any hound the Legion ever loosed on a wizard's tower.*" },
      },
      choices = {
        { text = "No, we leave the mage be. We're not the Legion.", next = "BACK", reply = "*{npc} whines, long and thin, but it lies down, and the binding stays quiet.*", fx = { align = { light = 1 } } },
        { text = "Dalaran banished us. Let them learn what that cost.", next = "BACK", reply = "*{npc} is gone into the dark before you've finished the sentence, and somewhere ahead, a ward goes out like a snuffed candle.*", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_lock = {
      lines = {
        { id = "tl_default", text = "*{npc} tastes the wind again, and its lip curls, and it gives a single sharp bark of warning, the bark it saves for anything that reeks of brimstone the way you do.*" },
        { id = "tl_horde", when = { race = { "Orc", "Troll", "Scourge" } }, text = "*{npc} snarls toward the canyons, where the Burning Blade keep their camps, and its tendrils shudder and draw in tight against its skull.*" },
        { id = "tl_ally", when = { race = { "Human", "Gnome" } }, text = "*{npc} snarls toward the hills, and you think of the Shadow Council's cultists in their black robes, and of how much they'd like a warlock's hound for their own.*" },
      },
      choices = {
        { text = "The Burning Blade would sell this whole world to the Legion.", next = "track_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_cult = {
      big = true,
      lines = {
        { id = "tc_default", text = "*{npc} swings its tendrils from the horizon back to you, and back again, comparing the two scents, and you don't much like how long it takes about it.*" },
      },
      choices = {
        { text = "We hunt them down, every last cultist.", next = "BACK", reply = "*{npc} sets off at once, nose low, and you follow the green glow of its tendrils through the dark.*", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "Their business is theirs. I don't police other warlocks.", next = "BACK", reply = "*{npc} turns away from the horizon with a snort, scratches once behind its shoulder, and lies down.*", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Soul shards.
    ------------------------------------------------------------------
    shard = {
      lines = {
        { id = "sh_default", text = "*{npc} sniffs the shard with enormous care, the tips of its feelers barely touching it, and the purple light inside flickers and pulls away from it like a fish from a shadow.*" },
      },
      choices = {
        { text = "Can you smell who it was, before I took it?", next = "shard_who" },
        { text = "Don't you dare eat it. That's for summoning, not snacking.", next = "BACK", reply = "*{npc} pulls back its tendrils and lies down with an injured sigh, though a thin thread of green drool gives it away.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shard_who = {
      lines = {
        { id = "sw_default", text = "*{npc} tries once more, then whines and backs off a pace, shaking its head hard, and paws twice at its own muzzle.*" },
      },
      choices = {
        { text = "Is it that bad? It was only a bandit.", next = "shard_bandit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shard_bandit = {
      big = true,
      lines = {
        { id = "sb2_default", text = "*{npc} turns from the shard to you and lies down with its head on its paws, and gives one low whine, like a dog outside a house where someone has just died.*" },
      },
      choices = {
        { text = "A soul is a resource. I won't weep over it.", next = "BACK", reply = "*{npc} sighs and won't turn its head toward the shard again, and you put it away more quickly than you meant to.*", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I'll use it well, at least. I owe him that.", next = "BACK", reply = "*{npc} lifts its head and nudges your hand closed around the shard, carefully, as if it were something fragile.*", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Race asides.
    ------------------------------------------------------------------
    xforsaken = {
      lines = {
        { id = "xf_default", text = "*{npc} noses at your sunken chest, where the Lich King's chill still lingers, and growls at it, not at you, with its feelers stretched and dripping.*" },
      },
      choices = {
        { text = "The Lich King's leash or mine: which chain would you choose?", next = "xforsaken_chain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_chain = {
      big = true,
      lines = {
        { id = "xfc_default", text = "*{npc} sits down, quite deliberately, at your side and facing outward, and you understand: it has a chain, and you once had one, and now you're the one holding it.*" },
      },
      choices = {
        { text = "The Dark Lady freed us. I'll free no one.", next = "BACK", reply = "*{npc} rumbles, unbothered, and leans its weight against your shin.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Maybe every chain is wrong. Even this one.", next = "BACK", reply = "*{npc} keeps its head turned to you a long time, and then it lies down at your feet anyway, by choice or by binding you can't say.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = {
        { id = "xo_default", text = "*{npc} lifts its snout and breathes you in hard, and you wonder if it can still smell Mannoroth's blood in your people, faint and old, like smoke caught in a cloak.*" },
      },
      choices = {
        { text = "Thrall would rather I never summoned you at all.", next = "xorc_thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc_thrall = {
      big = true,
      lines = {
        { id = "xot_default", text = "*{npc} turns its head toward Orgrimmar, and the Cleft of Shadow beneath it where your kind are tolerated and not much more, and then back to you, waiting.*" },
      },
      choices = {
        { text = "I serve the Horde, not the Legion, and that will never change.", next = "BACK", reply = "*{npc} grunts and settles, as though that suits it well enough.*", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "The old Horde was strong. Thrall forgets that.", next = "BACK", reply = "*{npc}'s tendrils glow a little brighter, and it pants, hot and eager, like a hound that has caught an old master's scent.*", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "*{npc} cocks its head at the name Dalaran, and its tendrils stretch and quiver, and green drool gathers at the corners of its jaw.*" },
      },
      choices = {
        { text = "They cast us out, and now they're half in ruins.", next = "xhuman_ruin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_ruin = {
      big = true,
      lines = {
        { id = "xhr_default", text = "*{npc} sits beside you facing north, toward Alterac and the shattered violet city, with its tendrils flat and still.*" },
      },
      choices = {
        { text = "They were right to ban us. I'll prove them wrong anyway.", next = "BACK", reply = "*{npc} snorts and leans its weight against your leg, and its tail sweeps the dirt.*", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'll take what I need from their libraries. Bans be damned.", next = "BACK", reply = "*{npc}'s tail sweeps hard and a string of drool hits the dirt, which is unsurprising, given what's in those libraries.*", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "*{npc} looms over you from its considerable height, then noses through your pockets for the pouch of enchanting dust it raided last week.*" },
      },
      choices = {
        { text = "Stop eating my enchanting dust! I need that for experiments.", next = "BACK", reply = "*{npc} licks the last glittering grains off its jaw and sits very still and very innocent indeed.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "*{npc}'s spines lift and its tendrils point at the sky, and it growls very quietly, the way a hound growls at thunder far off.*" } },
    background = { { id = "t_bg", text = "*{npc} scratches a circle in the dirt with one claw, then sits in the middle of it and turns its blind face up to you.*" } },
    advice = { { id = "t_ad", text = "*{npc} sniffs at your bag of shards, then at you, and nudges the bag shut with its nose.*" } },
    _none = { { id = "t_none", text = "*{npc} tilts its head at you, feelers swaying, and waits for an order it can actually follow.*" } },
  },
}
