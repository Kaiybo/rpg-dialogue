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
    { id = "g_default", text = "*{npc} pads to your side and swings its tendrils toward you, tasting the air around your hands as if checking you're still yourself.*" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "*In the dark, {npc}'s tendrils give off a faint green shimmer, and it presses its heavy head against your knee without being told.*" },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "*{npc} is sitting exactly where you left it, facing the sunrise with its tendrils curled tight, like a dog that doesn't trust the morning.*" },
    { id = "g_back", when = { metBefore = true }, text = "*{npc} lifts its head the moment you turn toward it, and its spiked tail thumps twice against the ground.*" },
    { id = "g_often", when = { timesTalked = 6 }, text = "*{npc} sits down before you've said a word, settling in with the patience of a hound that knows you're about to talk for a while.*" },
    { id = "g_dead", when = { deaths = 15 }, text = "*{npc} sniffs you over from boots to collar, slowly and thoroughly, the way it always does now after you've come back from the dead.*" },
    { id = "g_drunk", when = { drunk = true }, text = "*{npc} sniffs your breath, sneezes violently, and backs off a step with its tendrils drawn back in what can only be disgust.*" },
    { id = "g_party", when = { party = { class = "MAGE" } }, text = "*{npc} keeps one tendril pointed at the mage in your party at all times, trembling slightly, like a hound in sight of a roast.*" },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "*{npc} noses at the gap in your ribs where the Plague left you open, then settles down, satisfied that whatever keeps you walking hasn't gone anywhere.*" },
  },
  tier = "quest",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "*{npc} sits back on its haunches and watches your face, its tendrils swaying slowly, waiting to see whether you mean to give an order or simply to talk.*" },
        { id = "h_low", when = { maxLevel = 35 }, text = "*{npc} is still new to you, and it keeps glancing at your hands as if it expects the binding to slip, but it waits all the same.*" },
        { id = "h_high", when = { minLevel = 50 }, text = "*{npc} lies down at your feet with a long, rattling sigh, as easy with you now as a hound that has followed one master through a great many bad places.*" },
        { id = "h_dusk", when = { timeOfDay = "dusk" }, text = "*As the light goes, {npc} lifts its head and sniffs toward the horizon, tendrils flaring, then turns back to you with its whole attention.*" },
        { id = "h_gnome", when = { race = "Gnome" }, text = "*{npc} lowers its head to look you level in the eye, which it seems to find funny, because its tail starts swishing.*" },
      },
      again = {
        { id = "a_again", text = "*{npc} is still sitting there, still listening, its tendrils curled loosely over its back.*" },
        { id = "a_again2", text = "*{npc} scratches behind one spiked shoulder with a hind leg, then looks back up at you expectantly.*" },
        { id = "a_again3", text = "*{npc} yawns, showing far too many teeth, and waits for you to go on.*" },
      },
      choices = {
        { text = "Heel, {npc}. Let me have a look at you.", next = "inspect" },
        { text = "Good hunting today. You earned your keep.", next = "praise" },
        { text = "You ate my Shadow Bolt earlier. Explain yourself.", next = "scold" },
        { text = "Do you remember the day I bound you?", next = "binding" },
        { text = "I need to talk, and you're the only one who'll listen.", next = "confide" },
        { text = "What do you make of the others I could summon?", next = "others" },
        { text = "Smell anything out there? Go on, hunt.", next = "track" },
        { text = "Here, sniff this soul shard. Don't eat it.", next = "shard" },
        { text = "We're both things this world would rather saw dead.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "My people drank the blood that made your masters strong.", next = "xorc", when = { race = "Orc" } },
        { text = "Dalaran would hang us both, you know.", next = "xhuman", when = { race = "Human" } },
        { text = "Gnomeregan's engineers would love to take you apart.", next = "xgnome", when = { race = "Gnome" } },
        { text = "That's all. Back on watch.", next = "END" },
      },
    },

    ------------------------------------------------------------------
    -- Looking it over.
    ------------------------------------------------------------------
    inspect = {
      narr = "You run a hand down the hound's flank, and the hide is hot and dry and ridged like old leather.",
      lines = {
        { id = "in_default", text = "*{npc} stands still and lets you look, though its tendrils keep twitching toward the shards in your bag, and one hind leg is held a little off the ground.*" },
        { id = "in_high", when = { minLevel = 50 }, text = "*{npc} stands for inspection like an old soldier, and you can count the scars on its hide, every one of them from a fight you started.*" },
      },
      choices = {
        { text = "Your leg. Who did that to you?", next = "inspect_leg" },
        { text = "Those tendrils. What are they actually tasting?", next = "inspect_tendrils" },
        { text = "You're a hideous thing, and I'm fond of you.", next = "BACK", reply = "*{npc} snorts a puff of sulphur at you and leans its full weight against your leg, which nearly knocks you over.*", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_leg = {
      lines = {
        { id = "il_default", text = "*{npc} looks away when you touch the joint, and there's a burn there, white and clean, the kind holy fire leaves. It remembers the priest who did it; you can tell from the low growl.*" },
      },
      choices = {
        { text = "That priest is dead now. I made sure of it.", next = "inspect_vengeance" },
        { text = "Hold still. I'll mend it as best I can.", next = "BACK", reply = "*{npc} whines once while you work, then licks your wrist with a cold, sticky tendril, which you choose to take as thanks.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_vengeance = {
      big = true,
      lines = {
        { id = "iv_default", text = "*{npc}'s ears flatten and its tail goes still, and it looks at you for a long time with those blank, burning eyes, as if weighing what that means about the hand on its leash.*" },
      },
      choices = {
        { text = "Nobody harms what's mine. Nobody.", next = "BACK", reply = "*{npc} rumbles deep in its chest and presses its head under your hand, satisfied, a hound that understands a pack.*", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Truthfully, he was in my way. Your leg was an excuse.", next = "BACK", reply = "*{npc} huffs and turns its head away, and you'd swear it looks almost disappointed, though demons aren't meant to be.*", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_tendrils = {
      lines = {
        { id = "it_default", text = "*{npc} lifts its tendrils one by one and waves them slowly through the air toward you, and where they pass, your skin prickles the way it does just before you cast.*" },
        { id = "it_caster", when = { party = { class = { "MAGE", "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } }, text = "*{npc}'s tendrils sweep past you and stretch toward your companions instead, quivering at the magic in them, until you click your tongue and they snap back.*" },
      },
      choices = {
        { text = "So you smell the magic, not the man.", next = "inspect_magic" },
        { text = "Don't you dare sniff at my companions like that.", next = "BACK", reply = "*{npc} draws its tendrils in tight and lies flat with its chin on its paws, the very picture of innocence, and fools nobody.*", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_magic = {
      lines = {
        { id = "im_default", text = "*{npc} turns its tendrils on you and holds them there, and you feel it searching through the fel in your blood, the threads of your bindings, the little cold knot where your shards hang, as if reading a ledger.*" },
      },
      choices = {
        { text = "And what do you see, when you look at me?", next = "inspect_ledger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inspect_ledger = {
      big = true,
      lines = {
        { id = "ile_default", text = "*{npc} stares a while longer, then turns its back on you, walks three paces off and lies down facing away. It isn't sulking, exactly; it looks more like a hound that has smelt something on its master it doesn't want to name.*" },
        { id = "ile_light", when = { alignment = { axis = "light", max = -5 } }, text = "*{npc} doesn't stop looking. It sits closer instead, tail sweeping, with the easy contentment of a hound lying beside a fire it knows very well.*" },
      },
      choices = {
        { text = "Fine. I don't need a hound's good opinion.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Come back here. Please.", next = "BACK", reply = "*After a long moment {npc} gets up, pads back and lies down against your boots, and its weight there is warmer than you expected.*", fx = { affinity = 1 } },
      },
    },

    ------------------------------------------------------------------
    -- Praise.
    ------------------------------------------------------------------
    praise = {
      lines = {
        { id = "pr_default", text = "*{npc}'s tail lashes back and forth and its tendrils fan out proudly, and it trots a tight circle around you like a hunting hound after a good day in the field.*" },
        { id = "pr_dead", when = { deaths = 30 }, text = "*{npc} wags, but it also noses pointedly at the spot on your chest where the last killing blow landed, as if to say the day could have gone better.*" },
      },
      choices = {
        { text = "That Spell Lock on the shaman was perfect.", next = "praise_lock" },
        { text = "You want a treat? Here, a sip of mana.", next = "praise_treat" },
        { text = "Don't let it go to your head. You're a tool.", next = "praise_tool" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_lock = {
      lines = {
        { id = "pl_default", text = "*{npc} snaps its jaws shut on nothing, very pleased with itself, mimicking the moment it cut the shaman's chant off mid-word and left him gaping like a landed fish.*" },
      },
      choices = {
        { text = "That's what the Legion built you for, isn't it?", next = "praise_legion" },
        { text = "Do it again next time and you'll eat well.", next = "BACK", reply = "*{npc}'s tendrils curl in anticipation, and a thread of glowing drool runs off its jaw and sizzles in the grass.*", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_legion = {
      lines = {
        { id = "pleg_default", text = "*{npc} goes very still at the word Legion, and its tendrils lift and point, all together, at nothing you can see, somewhere far beyond the sky.*" },
      },
      choices = {
        { text = "You hunted wizards for them, on other worlds.", next = "praise_worlds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_worlds = {
      big = true,
      lines = {
        { id = "pw_default", text = "*{npc} lowers its head and growls, long and soft, and for a moment you can almost see it: towers burning under strange skies, and the Legion's hounds loosed in packs on every mage who tried to stand against them.*" },
      },
      choices = {
        { text = "Now you hunt for me. That's a better master.", next = "BACK", reply = "*{npc} looks at you sidelong, as if it has heard that from a good many masters before, and then, grudgingly, it wags.*", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "I wonder what it would take to hunt like that.", next = "BACK", reply = "*{npc}'s eyes flare bright, and it pushes its nose into your palm, hungry and eager, which is not the reassurance you were hoping for.*", fx = { align = { light = -1 } } },
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
        { id = "ptl_default", text = "*{npc}'s tail stops mid-wag, and it sits down very upright, the way a soldier stands when an officer has decided to be unpleasant.*" },
      },
      choices = {
        { text = "A good tool deserves care, all the same.", next = "BACK", reply = "*{npc}'s tail starts up again, slowly, as if it's prepared to accept that as an apology.*", fx = { align = { order = 1 } } },
        { text = "Tools that grow proud get broken.", next = "BACK", reply = "*{npc} doesn't growl, but it doesn't look at you again for a long while, and its tendrils stay curled tight.*", fx = { align = { order = -1 }, trait = { stern = 1 } } },
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
        { text = "Sit. Bad hound. Very bad hound.", next = "scold_bad" },
        { text = "Do you even know my magic from theirs?", next = "scold_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_supper = {
      lines = {
        { id = "ss_default", text = "*{npc} wanders to the place where the bolt went astray and sniffs at the scorched earth, then looks back at you with something close to an apology, though it's still licking its lips.*" },
      },
      choices = {
        { text = "You'll go hungry tonight for that.", next = "BACK", reply = "*{npc} whines, low and piteous, and lies down with its chin on its paws in the most theatrical sulk you've ever seen from a demon.*", fx = { trait = { stern = 1 } } },
        { text = "Fine, fine. I suppose it smelled delicious.", next = "BACK", reply = "*{npc} perks up at once and wags hard enough to shake its whole back end.*", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_bad = {
      lines = {
        { id = "sb_default", text = "*{npc} sits, slowly, and keeps its eyes on yours the whole way down, the way a wolf sits for a man it hasn't quite decided to obey.*" },
      },
      choices = {
        { text = "Down. All the way down.", next = "scold_down" },
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
        { text = "I'd test my chain too, if I wore one.", next = "BACK", reply = "*{npc} lifts its head at your tone, and for a moment the two of you look at each other like conspirators.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scold_know = {
      lines = {
        { id = "sk_default", text = "*{npc} sniffs at your hands, then at the air where the enemy stood, and then at your hands again, and its tendrils droop. As far as it's concerned, magic is magic, and all of it is food.*" },
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
        { id = "bi_default", text = "*{npc}'s hackles lift at the memory, and it scratches once at the ground as if drawing a circle in the dirt, the way you drew one to hold it the first time it came through.*" },
        { id = "bi_low", when = { maxLevel = 35 }, text = "*{npc} glances down at the chalk dust still caught in the claws of its forepaws, because the binding wasn't long ago at all, and it plainly remembers every word.*" },
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
        { id = "bt_default", text = "*{npc} tilts its head as you talk about the Tome of the Cabal and its torn-out pages, and the long road chasing them, and when you mention Ratchet it sneezes, as if it remembers the smell of the harbour.*" },
      },
      choices = {
        { text = "Farsan calls his students acolytes, as if he's a priest.", next = "binding_farsan" },
        { text = "Every page I found, I wondered what I'd summon.", next = "binding_wonder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_farsan = {
      lines = {
        { id = "bf_default", text = "*{npc} curls its lip in a way that looks very much like a sneer, and you remember it straining toward Farsan's grimoires the whole time you stood in his tower.*" },
      },
      choices = {
        { text = "You'd have eaten his whole library, given the chance.", next = "BACK", reply = "*{npc} doesn't deny it. It licks its chops slowly and thoughtfully, like a hound dreaming of a butcher's shop.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_wonder = {
      lines = {
        { id = "bw_default", text = "*{npc} nudges your hand with its snout and holds still under it, as if to say this is what you got, for better or worse, and there's no giving it back.*" },
      },
      choices = {
        { text = "I got a hound. I could have done worse.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_fight = {
      lines = {
        { id = "bfi_default", text = "*{npc} rolls its tendrils and gives a short, rough bark that sounds horribly like a laugh, and it shows you the gap in its teeth where the circle's edge burned it.*" },
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
        { id = "bte_default", text = "*{npc} looks at your hand, and at the scar, and then sets its chin down on your knee and leaves it there, heavy and warm, which is as close as a felhunter comes to saying it remembers too.*" },
      },
      choices = {
        { text = "Fear is how a warlock learns. I'm glad I learned it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_hate = {
      big = true,
      lines = {
        { id = "bh_default", text = "*{npc} doesn't answer, because it can't, but it doesn't look away either. Its eyes burn steady and blank, and you realise you've never once been able to tell what it thinks of you.*" },
      },
      choices = {
        { text = "Hate me if you like. You'll still obey.", next = "BACK", reply = "*{npc} rumbles low, a sound with no anger in it and no warmth either, only the acknowledgement of a fact.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "I hope you don't. I've tried to treat you fairly.", next = "BACK", reply = "*{npc} blinks, slowly, and its tail sweeps once across the dirt, and you decide that will have to do.*", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Confiding.
    ------------------------------------------------------------------
    confide = {
      narr = "You sit down on the nearest stone, and the hound comes and sits beside you without being asked.",
      lines = {
        { id = "co_default", text = "*{npc} settles down at your side and turns one tendril toward you, the way another dog might cock an ear, and waits.*" },
        { id = "co_night", when = { timeOfDay = "night" }, text = "*{npc} lies down beside you in the dark, close enough that you can feel its heat, and keeps its eyes on the shadows while you talk.*" },
      },
      choices = {
        { text = "Sometimes I wonder what I'm becoming.", next = "confide_becoming" },
        { text = "I want power. Real power. Is that so wrong?", next = "confide_power" },
        { text = "Everyone I meet looks at me like I'm the Plague.", next = "confide_lonely" },
        { text = "I'm afraid of what waits when I finally die.", next = "confide_death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_becoming = {
      lines = {
        { id = "cb_default", text = "*{npc} sniffs at your fingertips, where the skin has gone a little grey from handling shards, and then licks them, slowly, as if trying to take the taint back out.*" },
      },
      choices = {
        { text = "Gul'dan started out as a frightened shaman, they say.", next = "confide_guldan" },
        { text = "I'm still me. Aren't I?", next = "confide_still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_guldan = {
      big = true,
      lines = {
        { id = "cg_default", text = "*{npc}'s hackles rise at the name, and it gives a low, ugly growl into the dark, the way a hound growls at a house where something bad once happened.*" },
      },
      choices = {
        { text = "I'll never sell my people the way he sold his.", next = "BACK", reply = "*{npc} lowers its hackles slowly and leans against you, as if it means to hold you to that.*", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "He was a fool, but he wasn't wrong about power.", next = "BACK", reply = "*{npc} stops growling and turns to look at you instead, steadily, and its tail doesn't move at all.*", fx = { align = { light = -1 } } },
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
        { id = "cp_default", text = "*{npc}'s eyes flare, and its tendrils stiffen and lift, and for a moment the hunger in it is so plain that you can feel it through the binding like a second pulse.*" },
        { id = "cp_high", when = { minLevel = 55 }, text = "*{npc} looks east, toward the Plaguelands and the dark halls of Scholomance, and back to you, as if it already knows where your ambitions have been leading.*" },
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
        { id = "cpr_default", text = "*{npc} looks at you a long while with those burning eyes, and you realise every warlock who ever fell into the Legion's hands probably said the same thing to a hound just like this one.*" },
      },
      choices = {
        { text = "Then I'll be the one who means it.", next = "BACK", reply = "*{npc} huffs, hot and smoky, and settles down to wait and see, which is all a hound can do.*", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Fine. Power for its own sake, then. I'll own it.", next = "BACK", reply = "*{npc}'s tail sweeps once, slow and approving, and that frightens you more than any growl would have.*", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_contempt = {
      lines = {
        { id = "ccn_default", text = "*{npc} snaps at a moth that comes too close to your face, catches it, and swallows it, and then looks at you as if to say that's what happens to small things that get too close to the fire.*" },
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
        { id = "cgu_default", text = "*{npc} turns its head toward the nearest town and lets out a single low growl, then looks back to you, as though offering, quite seriously, to go and eat the guard's lantern.*" },
      },
      choices = {
        { text = "They're right to fear us. Fear keeps the peace.", next = "BACK", reply = "*{npc} settles its chin on its paws, content with any arrangement that keeps it fed.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Let them sneer. I'll go where I please.", next = "BACK", reply = "*{npc} stands up at once, tail lashing, ready to go wherever that turns out to be.*", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confide_death = {
      lines = {
        { id = "cd_default", text = "*{npc} stops moving altogether, and its tendrils go limp, and in the quiet you can hear the soul shards in your bag clicking softly against each other like teeth.*" },
        { id = "cd_dead", when = { deaths = 20 }, text = "*{npc} sniffs at you the way it always does after the spirit healers send you back, as if checking that the right soul came home in the right body.*" },
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
        { id = "ot_default", text = "*{npc}'s ears go back at once, and it plants itself squarely in front of you, as if the question itself were a rival trying to get past.*" },
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
        { id = "oi_default", text = "*{npc} growls, low and long, and its tendrils twitch with obvious longing. You remember the time it tried to devour the imp's Firebolt mid-air, and the imp's shrieking, which went on for an hour.*" },
      },
      choices = {
        { text = "You are not allowed to eat the imp. Not even a bit.", next = "BACK", reply = "*{npc} sighs heavily through its nose, as though you have denied it the one small joy in an otherwise hard life.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_void = {
      lines = {
        { id = "ov_default", text = "*{npc} sniffs at the shadow under your feet, where the voidwalker usually waits, and then looks up at you with flat disdain, as if to say the void has no nose and therefore no opinion worth having.*" },
      },
      choices = {
        { text = "At least it doesn't eat my spells.", next = "BACK", reply = "*{npc} licks its lips pointedly and looks the other way.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_succ = {
      lines = {
        { id = "os_default", text = "*{npc} doesn't growl at the mention of her. It goes quiet instead, and presses close against your legs, and keeps watching the place where she usually stands, the way a dog watches a cat it has lost to before.*" },
      },
      choices = {
        { text = "Smart hound. She frightens me too, sometimes.", next = "others_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_fear = {
      big = true,
      lines = {
        { id = "of_default", text = "*{npc} lifts its head and looks at you, really looks, and then puts itself between you and the empty place where she would stand, and stays there.*" },
      },
      choices = {
        { text = "A warlock rules by fear. Mine and theirs.", next = "BACK", reply = "*{npc} doesn't move from its post, but its tail goes still, as if it has heard that before from someone it no longer serves.*", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "I keep every bargain I make with them. That's my shield.", next = "BACK", reply = "*{npc} grunts and sits back down at last, apparently willing to trust a bargain, so long as it can stand guard over it.*", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Tracking.
    ------------------------------------------------------------------
    track = {
      lines = {
        { id = "tr_default", text = "*{npc} lifts its head and sweeps its tendrils in a slow arc, and stops, and points, quivering, toward something a long way off that you can't see at all.*" },
        { id = "tr_night", when = { timeOfDay = "night" }, text = "*{npc}'s tendrils light up faintly as they sweep the dark, and they all swing the same way at once, toward a glow on the hills that might be a campfire or might be something worse.*" },
      },
      choices = {
        { text = "A mage? Go on, then, how strong?", next = "track_mage" },
        { text = "Is that fel? Another warlock out there?", next = "track_lock" },
        { text = "Leave it. We're not hunting tonight.", next = "BACK", reply = "*{npc} lowers its tendrils with visible reluctance and sits, though one of them keeps creeping back toward the horizon when it thinks you aren't looking.*", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_mage = {
      lines = {
        { id = "tm_default", text = "*{npc} drools, a long string of green spit that hisses where it lands, and its whole body trembles with eagerness, which tells you all you need to know about the size of the meal.*" },
      },
      choices = {
        { text = "A Kirin Tor mage, out here? They'd hang us both.", next = "track_kirin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_kirin = {
      big = true,
      lines = {
        { id = "tk_default", text = "*{npc} looks at you, tense from nose to tail, waiting for the word. The Legion made felhunters for exactly this, to run down wizards in their towers, and every line of it says so.*" },
      },
      choices = {
        { text = "No. We leave the mage be. We're not the Legion.", next = "BACK", reply = "*{npc} whines, long and bitter, but it lies down, and the binding stays quiet.*", fx = { align = { light = 1 } } },
        { text = "Dalaran banished us. Let them learn what that cost.", next = "BACK", reply = "*{npc} is gone into the dark before you've finished the sentence, and somewhere ahead, a ward goes out like a snuffed candle.*", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_lock = {
      lines = {
        { id = "tl_default", text = "*{npc} sniffs harder, and its lip curls, and it gives a single sharp bark of warning. Whoever it smells out there has the same brimstone on them that you do, and a great deal more of it.*" },
        { id = "tl_horde", when = { race = { "Orc", "Troll", "Scourge" } }, text = "*{npc} snarls toward the canyons, where the Burning Blade keep their camps, and the smell of them is so thick it makes its tendrils shudder.*" },
        { id = "tl_ally", when = { race = { "Human", "Gnome" } }, text = "*{npc} snarls toward the hills, and you think of the Shadow Council's cultists in their black robes, and of how much they'd like a warlock's hound for their own.*" },
      },
      choices = {
        { text = "The Burning Blade. They'd sell the world to the Legion.", next = "track_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    track_cult = {
      big = true,
      lines = {
        { id = "tc_default", text = "*{npc} looks from the horizon back to you, and back again, as if comparing the two scents, and you don't much like how long it takes to decide.*" },
      },
      choices = {
        { text = "We hunt them. Every last cultist.", next = "BACK", reply = "*{npc} sets off at once, nose low, and you follow the green glow of its tendrils through the dark.*", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "Their business is theirs. I don't police other warlocks.", next = "BACK", reply = "*{npc} turns away from the horizon with a sniff, as if it never much cared either way.*", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Soul shards.
    ------------------------------------------------------------------
    shard = {
      lines = {
        { id = "sh_default", text = "*{npc} sniffs the shard with enormous care, the tips of its tendrils barely touching it, and the purple light inside flickers and pulls away from it like a fish from a shadow.*" },
      },
      choices = {
        { text = "Can you smell who it was?", next = "shard_who" },
        { text = "Don't you dare. That's for summoning, not snacking.", next = "BACK", reply = "*{npc} pulls back its tendrils and looks at you with deep injury, though a thin thread of drool gives it away.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shard_who = {
      lines = {
        { id = "sw_default", text = "*{npc} sniffs again, then whines and backs off a pace, shaking its head as if to clear it, and paws twice at its own muzzle.*" },
      },
      choices = {
        { text = "That bad? It was only a bandit.", next = "shard_bandit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shard_bandit = {
      big = true,
      lines = {
        { id = "sb2_default", text = "*{npc} looks at the shard, and at you, and lies down with its head on its paws, and something in the way it lies there tells you the bandit had someone waiting for him at home.*" },
      },
      choices = {
        { text = "A soul is a resource. I won't weep over it.", next = "BACK", reply = "*{npc} sighs, and doesn't look at the shard again, and you put it away more quickly than you meant to.*", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I'll use it well, at least. I owe him that.", next = "BACK", reply = "*{npc} lifts its head and nudges your hand closed around the shard, carefully, as if it were something fragile.*", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ------------------------------------------------------------------
    -- Race asides.
    ------------------------------------------------------------------
    xforsaken = {
      lines = {
        { id = "xf_default", text = "*{npc} sniffs at your sunken chest, at the place where the Lich King's chill still lingers, and growls at it, not at you, as if it would happily eat that too.*" },
      },
      choices = {
        { text = "The Lich King's leash, or yours. Choose your chain.", next = "xforsaken_chain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_chain = {
      big = true,
      lines = {
        { id = "xfc_default", text = "*{npc} sits down, quite deliberately, at your side and facing outward, and you understand: it has a chain, and you once had one, and now you're the one holding it.*" },
      },
      choices = {
        { text = "The Dark Lady freed us. I'll free no one.", next = "BACK", reply = "*{npc} rumbles, unbothered, a hound with no particular wish to be anywhere but here.*", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Maybe every chain is wrong. Even this one.", next = "BACK", reply = "*{npc} looks at you for a long time, and then it lies down at your feet anyway, by choice or by binding you can't say.*", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = {
        { id = "xo_default", text = "*{npc} lifts its nose and sniffs at you hard, and you wonder if it can still smell Mannoroth's blood in your people, faint and old, like smoke caught in a cloak.*" },
      },
      choices = {
        { text = "Thrall would rather I never summoned you at all.", next = "xorc_thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc_thrall = {
      big = true,
      lines = {
        { id = "xot_default", text = "*{npc} looks toward Orgrimmar, and the Cleft of Shadow beneath it where your kind are tolerated and not much more, and then back at you, waiting.*" },
      },
      choices = {
        { text = "I serve the Horde, not the Legion. That will never change.", next = "BACK", reply = "*{npc} grunts and settles, as though that suits it well enough.*", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "The old Horde was strong. Thrall forgets that.", next = "BACK", reply = "*{npc}'s eyes burn a little brighter, and it pants, hot and eager, like a hound remembering an old master.*", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "*{npc} cocks its head at the name Dalaran, and its tendrils quiver as if remembering an enormous feast laid out behind glass.*" },
      },
      choices = {
        { text = "They cast us out, and now they're half in ruins.", next = "xhuman_ruin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_ruin = {
      big = true,
      lines = {
        { id = "xhr_default", text = "*{npc} sits beside you and stares north, toward Alterac and the shattered violet city, with its tendrils flat and still.*" },
      },
      choices = {
        { text = "They were right to ban us. I'll prove them wrong anyway.", next = "BACK", reply = "*{npc} snorts and leans against your leg, as if to say it'll come along for the proving.*", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'll take what I need from their libraries. Bans be damned.", next = "BACK", reply = "*{npc} wags hard, which is unsurprising, given what's in those libraries.*", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "*{npc} looks down at you from its considerable height, then sniffs your pockets for loose arcane batteries, which, to be fair, it found last week.*" },
      },
      choices = {
        { text = "Stop eating my mana crystals! I need those for experiments.", next = "BACK", reply = "*{npc} licks the last blue crumbs off its jaw and sits looking very innocent indeed.*", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "t_bl", text = "*{npc}'s tendrils lift and point at the sky, and it growls very quietly, the way a hound growls at thunder far off.*" } },
    background = { { id = "t_bg", text = "*{npc} scratches a circle in the dirt with one claw, then sits in the middle of it and looks at you.*" } },
    advice = { { id = "t_ad", text = "*{npc} sniffs at your bag of shards, then at you, and nudges the bag shut with its nose.*" } },
    _none = { { id = "t_none", text = "*{npc} tilts its head at you, tendrils swaying, and waits for an order it can actually follow.*" } },
  },
}
